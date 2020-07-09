Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F051219B6D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 10:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639546EA22;
	Thu,  9 Jul 2020 08:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC396EA22;
 Thu,  9 Jul 2020 08:49:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GT/d/Qu6Oimvj6nBDoAg003XqlIt9nYTqgH5/BVuFtcsvteJNRRbKUsiklgna33Nv2qxuk9I7yzkKvJXocZx7T1JIy0ZbJ0vJDfXtx+yQT1vJ5tb1+NByVHTOaro/4DoxpdHZ9DTA2vSYRs8Pl5+aOZ6EfMhPKzZw2hv3J67+0MNzSbHZxt1ZLv5vIw/uFnioRlVW5S69KI+EcdxqfUA+h2cLG6j8yqVsgHaN+hGGBYmn6FqWIGZ/e6X7I1jpHE6Gyexyy0eYTyNFzBBZSkkk9rrfvCjR3DNzqBGCIhZJ2V9VRiZugPzYAmamljm501LE5gDvRvNQQb9pgpXlw0QiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvmaBjgsMConbnWnb+VzL1Vnx3CJ4BQwN7WVgaY/JY8=;
 b=oGUmUjNObfC2r5jrwsAX+pEMyckCgXLe87rJN3oqzsnOELPO4a+Yb7Hh51cv0AVeAPz8ZkNV/Wb6tVoV+0ujg0k/x6War6Ul+6r+9OjloNGFI4ppB3TXkZIXGwy6kEIlMLRKSXgEG/6CXH0oKAhilzyKEf+SrNaGa57529q/H8odIF7F6OCUr1pH7LRt1J4xFeesBf3+YLIQNXmn0za7/JJFiA3SnP9q5OfFb9o8weCfPUDQBoKgvXvYu2nwhk9OlmC9L0qhk7cqps/kZeXG/ePOstLy6+Bd3NSembu7FKGAMiFgPlTAYQ+SAF8rGpxowmt/gdRZNEaFSZ6OdMmeIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvmaBjgsMConbnWnb+VzL1Vnx3CJ4BQwN7WVgaY/JY8=;
 b=lF+KLmt2aK4bhTQNhTfj370hMTFVNUO6nRU0aZa2Uf40GjGxfa6r/hqU5CQ1jHZqmxO1GIB6ZtaQxx0k6meg23yFRj2vpv+7s66bxWG86VMOW8EHk6ZS3p5aRhNITMtmAsrCqNZwx5TKiXV5NyVBAHorosoDAMGi91/yDRzJYfA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4549.namprd12.prod.outlook.com (2603:10b6:208:268::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Thu, 9 Jul
 2020 08:49:43 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3174.021; Thu, 9 Jul 2020
 08:49:43 +0000
Subject: Re: [PATCH 1/2] drm/vgem: Do not allocate backing shmemfs file for an
 import dmabuf object
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200707160012.1299338-1-chris@chris-wilson.co.uk>
 <CALqoU4y61Yc5ndaLSO3WoGSPxGm1nJJufk3U=uxhZe3sT1Xyzg@mail.gmail.com>
 <159414243217.17526.6453360763938648186@build.alporthouse.com>
 <CALqoU4ypBqcAo+xH2usVRffKzR6AkgGdJBmQ0vWe9MZ1kTHCqw@mail.gmail.com>
 <159414692385.17526.10068675168880429917@build.alporthouse.com>
 <b8e6d844-f096-8efc-1252-ef430069d080@amd.com>
 <20200708095405.GJ3278063@phenom.ffwll.local>
 <d59a0057-31db-ce8e-e83d-cd9e023a9ab2@amd.com>
 <CAKMK7uF1nXT-q-rJK0s2yUQa8h8qJmzO=p-ouzvXVQ5HgkE9Qg@mail.gmail.com>
 <ea2ba563-11ba-efc3-44db-ae83920225d6@amd.com>
 <CAKMK7uEA65DT=7Qxku5Mvdcm6ii9qnyeR03Es+E-oCsxXkJBmA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e4d7e26c-4ac5-8ada-dc75-ae02654112b4@amd.com>
Date: Thu, 9 Jul 2020 10:49:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CAKMK7uEA65DT=7Qxku5Mvdcm6ii9qnyeR03Es+E-oCsxXkJBmA@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0067.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0067.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.20 via Frontend Transport; Thu, 9 Jul 2020 08:49:41 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9cfc121f-d33d-44ea-86ca-08d823e5061b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4549:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4549370CD545DAD1ABABE2A183640@MN2PR12MB4549.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-Forefront-PRVS: 04599F3534
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EIx/V798bBfE500Vff9PjF+lIJNFe18SLr1IaHchl9D2yeLy/Q76EQXxgsfCqM/Kgk/sI56QVBipFh0LUCeADMu0W4F4uvAbOBusfEgs3W7f1jpNeN8NmmHxkLSpAZaPeKtbeOFBtV1/6t6m5E9yY8QkwEDfZULU3R5M8dGvRhVZIDwh2YNvr7XwsTWB6ezp5pi9NtkAriaKrC4EyrH6fnE1tcWIzX62EO2pF/P8Zp8Zl2LWjAnDUk5TkLbe/mU0MDGi3/IWbQFw1y0zWE9tvneTETbrw0lqehMRGCP9BfCFYo6X0S05GhE25y9ZOenn8I6tX7U/hE+TyqGpbn2QRWzD9wfEmh56cpFe/5F4oNX0dbX4dysRi/FBGJ5SU+pB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(4326008)(8676002)(66574015)(52116002)(31686004)(6486002)(31696002)(86362001)(186003)(2616005)(83380400001)(8936002)(6916009)(53546011)(16526019)(2906002)(6666004)(5660300002)(54906003)(66476007)(66556008)(316002)(478600001)(66946007)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: wacRURPunEiT6J4NJL1/8Qx61VPDYLi3hj0BioH21l7pbnYgkdMpVNcKbUe16gfZy9X8sXalXM7cgshG3cZ+iC1tp/6j3Ryxv6c4BCinhEd9rXgga3/9aObjzoH13zT2gFlMuKftQFOoQakqMjjKmnb3xqyCXxYlftjFhaDTkov4G3Vrymu8mEdAhu2/SLOil+nFGwdBEKpP5tLOq49h8zh3VgSx1sAh1VYs/4KBVRByjYUmSjDlRB8WBt7Nla28kQDUhiM6iDPg1OJ4NTyuGKY0bz/e/cVQwSyDlg50AuFEf/cLa71BOqwKHq+n0/80sWYt/58W2pASXKPVa5pavI/Hd2+Ho6NuvnNkxZQAH6FGYKFdcgapaS8aD2UyEl/BLO71JFKxGzpzmXiVb7dJ8BvjIEaUxImMR82IgHqvTNQOqH9V+QdfmZAwOp2oQfg9Fs6czcHTZdgEdJ01W8rmdFIXPSufOWboU4N+TsBmej4w9SZICPQLPXGMV1sZ5SudrhU8X7XJjMoYa1rqx2asMVa/HGrrVscofXJnsG5111iome58QZ4PgmQ45NedYWYK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cfc121f-d33d-44ea-86ca-08d823e5061b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 08:49:43.1374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyNBjYhF55mt0t231AwPDcYK6JrhDTT7Vn1FJ16XiOpgmDkxftCe/MrvFkDKIT1C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4549
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 "# v4.10+" <stable@vger.kernel.org>, lepton <ytht.net@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDcuMjAgdW0gMTg6MTEgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgSnVs
IDgsIDIwMjAgYXQgNTowNSBQTSBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+IHdyb3RlOgo+PiBBbSAwOC4wNy4yMCB1bSAxNzowMSBzY2hyaWViIERhbmllbCBWZXR0
ZXI6Cj4+PiBPbiBXZWQsIEp1bCA4LCAyMDIwIGF0IDQ6MzcgUE0gQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPj4+PiBBbSAwOC4wNy4yMCB1bSAxMTo1
NCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+Pj4+IE9uIFdlZCwgSnVsIDA4LCAyMDIwIGF0IDEx
OjIyOjAwQU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+PiBBbSAwNy4wNy4y
MCB1bSAyMDozNSBzY2hyaWViIENocmlzIFdpbHNvbjoKPj4+Pj4+PiBRdW90aW5nIGxlcHRvbiAo
MjAyMC0wNy0wNyAxOToxNzo1MSkKPj4+Pj4+Pj4gT24gVHVlLCBKdWwgNywgMjAyMCBhdCAxMDoy
MCBBTSBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4gd3JvdGU6Cj4+Pj4+
Pj4+PiBRdW90aW5nIGxlcHRvbiAoMjAyMC0wNy0wNyAxODowNToyMSkKPj4+Pj4+Pj4+PiBPbiBU
dWUsIEp1bCA3LCAyMDIwIGF0IDk6MDAgQU0gQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+IHdyb3RlOgo+Pj4+Pj4+Pj4+PiBJZiB3ZSBhc3NpZ24gb2JqLT5maWxwLCB3ZSBi
ZWxpZXZlIHRoYXQgdGhlIGNyZWF0ZSB2Z2VtIGJvIGlzIG5hdGl2ZSBhbmQKPj4+Pj4+Pj4+Pj4g
YWxsb3cgZGlyZWN0IG9wZXJhdGlvbnMgbGlrZSBtbWFwKCkgYXNzdW1pbmcgaXQgYmVoYXZlcyBh
cyBiYWNrZWQgYnkgYQo+Pj4+Pj4+Pj4+PiBzaG1lbWZzIGlub2RlLiBXaGVuIGltcG9ydGVkIGZy
b20gYSBkbWFidWYsIHRoZSBvYmotPnBhZ2VzIGFyZQo+Pj4+Pj4+Pj4+PiBub3QgYWx3YXlzIG1l
YW5pbmdmdWwgYW5kIHRoZSBzaG1lbWZzIGJhY2tpbmcgc3RvcmUgbWlzbGVhZGluZy4KPj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+Pj4gTm90ZSwgdGhhdCByZWd1bGFyIG1tYXAgYWNjZXNzIHRvIGEgdmdl
bSBibyBpcyB2aWEgdGhlIGR1bWIgYnVmZmVyIEFQSSwKPj4+Pj4+Pj4+Pj4gYW5kIHRoYXQgcmVq
ZWN0cyBhdHRlbXB0cyB0byBtbWFwIGFuIGltcG9ydGVkIGRtYWJ1ZiwKPj4+Pj4+Pj4+PiBXaGF0
IGRvIHlvdSBtZWFuIGJ5ICJyZWd1bGFyIG1tYXAgYWNjZXNzIiBoZXJlPyAgSXQgbG9va3MgbGlr
ZSB2Z2VtIGlzCj4+Pj4+Pj4+Pj4gdXNpbmcgdmdlbV9nZW1fZHVtYl9tYXAgYXMgLmR1bWJfbWFw
X29mZnNldCBjYWxsYmFjayB0aGVuIGl0IGRvZXNuJ3QgY2FsbAo+Pj4+Pj4+Pj4+IGRybV9nZW1f
ZHVtYl9tYXBfb2Zmc2V0Cj4+Pj4+Pj4+PiBBcyBJIHRvbyBmb3VuZCBvdXQsIGFuZCBzbyBoYWQg
dG8gY29ycmVjdCBteSBzdG9yeSB0ZWxsaW5nLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEJ5IHJlZ3Vs
YXIgbW1hcCgpIGFjY2VzcyBJIG1lYW4gbW1hcCBvbiB0aGUgdmdlbSBibyBbdmlhIHRoZSBkdW1i
IGJ1ZmZlcgo+Pj4+Pj4+Pj4gQVBJXSBhcyBvcHBvc2VkIHRvIG1tYXAoKSB2aWEgYW4gZXhwb3J0
ZWQgZG1hLWJ1ZiBmZC4gSSBoYWQgdG8gbG9vayBhdAo+Pj4+Pj4+Pj4gaWd0IHRvIHNlZSBob3cg
aXQgd2FzIGJlaW5nIHVzZWQuCj4+Pj4+Pj4+IE5vdyBpdCBzZWVtcyB5b3VyIGZpeCBpcyB0byBk
aXNhYmxlICJyZWd1bGFyIG1tYXAiIG9uIGltcG9ydGVkIGRtYSBidWYKPj4+Pj4+Pj4gZm9yIHZn
ZW0uIEkgYW0gbm90IHJlYWxseSBhIGdyYXBoaWMgZ3V5LCBidXQgdGhlbiB0aGUgYXBpIGxvb2tz
IGxpa2U6Cj4+Pj4+Pj4+IGZvciBhIGdlbSBoYW5kbGUsIHVzZXIgc3BhY2UgaGFzIHRvIGd1ZXNz
IHRvIGZpbmQgb3V0IHRoZSB3YXkgdG8gbW1hcAo+Pj4+Pj4+PiBpdC4gSWYgdXNlciBzcGFjZSBn
dWVzcyB3cm9uZywgdGhlbiBpdCB3aWxsIGZhaWwgdG8gbW1hcC4gSXMgdGhpcyB0aGUKPj4+Pj4+
Pj4gZXhwZWN0ZWQgd2F5Cj4+Pj4+Pj4+IGZvciBwZW9wbGUgdG8gaGFuZGxlIGdwdSBidWZmZXI/
Cj4+Pj4+Pj4gWW91IGVpdGhlciBoYXZlIGEgZHVtYiBidWZmZXIgaGFuZGxlLCBvciBhIGRtYS1i
dWYgZmQuIElmIHlvdSBoYXZlIHRoZQo+Pj4+Pj4+IGhhbmRsZSwgeW91IGhhdmUgdG8gdXNlIHRo
ZSBkdW1iIGJ1ZmZlciBBUEksIHRoZXJlJ3Mgbm8gb3RoZXIgd2F5IHRvCj4+Pj4+Pj4gbW1hcCBp
dC4gSWYgeW91IGhhdmUgdGhlIGRtYS1idWYgZmQsIHlvdSBzaG91bGQgbW1hcCBpdCBkaXJlY3Rs
eS4gVGhvc2UKPj4+Pj4+PiB0d28gYXJlIGNsZWFyLgo+Pj4+Pj4+Cj4+Pj4+Pj4gSXQncyB3aGVu
IHlvdSBpbXBvcnQgdGhlIGRtYS1idWYgaW50byB2Z2VtIGFuZCBjcmVhdGUgYSBoYW5kbGUgb3V0
IG9mCj4+Pj4+Pj4gaXQsIHRoYXQncyB3aGVuIHRoZSBoYW5kbGUgaXMgbm8gbG9uZ2VyIGZpcnN0
IGNsYXNzIGFuZCBjZXJ0YWluIHVBUEkKPj4+Pj4+PiBbdGhlIGR1bWIgYnVmZmVyIEFQSSBpbiBw
YXJ0aWN1bGFyXSBmYWlsLgo+Pj4+Pj4+Cj4+Pj4+Pj4gSXQncyBub3QgYnJpbGxpYW50LCBhcyB5
b3Ugc2F5LCBpdCByZXF1aXJlcyB0aGUgdXNlciB0byByZW1lbWJlciB0aGUKPj4+Pj4+PiBkaWZm
ZXJlbmNlIGJldHdlZW4gdGhlIGhhbmRsZXMsIGJ1dCBhdCB0aGUgc2FtZSB0aW1lIGl0IGRvZXMg
cHJldmVudAo+Pj4+Pj4+IHRoZW0gZmFsbGluZyBpbnRvIGNvaGVyZW5jeSB0cmFwcyBieSBmb3Jj
aW5nIHRoZW0gdG8gdXNlIHRoZSByaWdodAo+Pj4+Pj4+IGRyaXZlciB0byBoYW5kbGUgdGhlIG9i
amVjdCwgYW5kIGhhdmUgdG8gY29uc2lkZXIgdGhlIGFkZGl0aW9uYWwgaW9jdGxzCj4+Pj4+Pj4g
dGhhdCBnbyBhbG9uZyB3aXRoIHRoYXQgYWNjZXNzLgo+Pj4+Pj4gWWVzLCBDaHJpcyBpcyByaWdo
dC4gTWFwcGluZyBETUEtYnVmIHRocm91Z2ggdGhlIG1tYXAoKSBBUElzIG9mIGFuIGltcG9ydGVy
Cj4+Pj4+PiBpcyBpbGxlZ2FsLgo+Pj4+Pj4KPj4+Pj4+IFdoYXQgd2UgY291bGQgbWF5YmUgdHJ5
IHRvIGRvIGlzIHRvIHJlZGlyZWN0IHRoaXMgbW1hcCgpIEFQSSBjYWxsIG9uIHRoZQo+Pj4+Pj4g
aW1wb3J0ZXIgdG8gdGhlIGV4cG9ydGVyLCBidXQgSSdtIHByZXR0eSBzdXJlIHRoYXQgdGhlIGZz
IGxheWVyIHdvdWxkbid0Cj4+Pj4+PiBsaWtlIHRoYXQgd2l0aG91dCBjaGFuZ2VzLgo+Pj4+PiBX
ZSBhbHJlYWR5IGRvIHRoYXQsIHRoZXJlJ3MgYSBmdWxsIGhlbHBlci1pZmllZCBwYXRoIGZyb20g
SSB0aGluayBzaG1lbQo+Pj4+PiBoZWxwZXJzIHRocm91Z2ggcHJpbWUgaGVscGVycyB0byBmb3J3
YXJkIHRoaXMgYWxsLiBJbmNsdWRpbmcgaGFuZGxpbmcKPj4+Pj4gYnVmZmVyIG9mZnNldHMgYW5k
IGFsbCB0aGUgb3RoZXIgbG9seiBiYWNrJmZvcnRoLgo+Pj4+IE9oLCB0aGF0IG1vc3QgbGlrZWx5
IHdvbid0IHdvcmsgY29ycmVjdGx5IHdpdGggdW5waW5uZWQgRE1BLWJ1ZnMgYW5kCj4+Pj4gbmVl
ZHMgdG8gYmUgYXZvaWRlZC4KPj4+Pgo+Pj4+IEVhY2ggZmlsZSBkZXNjcmlwdG9yIGlzIGFzc29j
aWF0ZWQgd2l0aCBhbiBzdHJ1Y3QgYWRkcmVzc19zcGFjZS4gQW5kCj4+Pj4gd2hlbiB5b3UgbW1h
cCgpIHRocm91Z2ggdGhlIGltcG9ydGVyIGJ5IHJlZGlyZWN0aW5nIHRoZSBzeXN0ZW0gY2FsbCB0
bwo+Pj4+IHRoZSBleHBvcnRlciB5b3UgZW5kIHVwIHdpdGggdGhlIHdyb25nIHN0cnVjdCBhZGRy
ZXNzX3NwYWNlIGluIHlvdXIgVk1BLgo+Pj4+Cj4+Pj4gVGhhdCBpbiB0dXJuIGNhbiBnbyB1cCBl
YXNpbHkgaW4gZmxhbWVzIHdoZW4gdGhlIGV4cG9ydGVyIHRyaWVzIHRvCj4+Pj4gaW52YWxpZGF0
ZSB0aGUgQ1BVIG1hcHBpbmdzIGZvciBpdHMgRE1BLWJ1ZiB3aGlsZSBtb3ZpbmcgaXQuCj4+Pj4K
Pj4+PiBXaGVyZSBhcmUgd2UgZG9pbmcgdGhpcz8gTXkgbGFzdCBzdGF0dXMgd2FzIHRoYXQgdGhp
cyBpcyBmb3JiaWRkZW4uCj4+PiBIbSBJIHRob3VnaHQgd2UncmUgZG9pbmcgYWxsIHRoYXQgYWxy
ZWFkeSwgYnV0IGxvb2tpbmcgYXQgdGhlIGNvZGUKPj4+IGFnYWluIHdlJ3JlIG9ubHkgZG9pbmcg
dGhpcyB3aGVuIG9wZW5pbmcgYSBuZXcgZHJtIGZkIG9yIGRtYS1idWYgZmQuCj4+PiBTbyB0aGUg
cmlnaHQgZmlsZS0+Zl9tYXBwaW5nIGlzIGFsd2F5cyBzZXQgYXQgZmlsZSBjcmVhdGlvbiB0aW1l
Lgo+Pj4KPj4+IEFuZCB3ZSBpbmRlZWQgZG9uJ3QgZnJvYiB0aGlzIG1vcmUgd2hlbiBnb2luZyBh
bm90aGVyIGluZGlyZWN0aW9uIC4uLgo+Pj4gTWF5YmUgd2Ugc2NyZXdlZCB1cCBzb21ldGhpbmcg
c29tZXdoZXJlIDotLwo+Pj4KPj4+IEFsc28gSSB0aG91Z2h0IHRoZSBtYXBwaW5nIGlzIG9ubHkg
dGFrZW4gYWZ0ZXIgdGhlIHZtYSBpcyBpbnN0YXRpYXRlZCwKPj4+IG90aGVyd2lzZSB0aGUgdHJp
Y2tzIHdlJ3JlIHBsYXlpbmcgd2l0aCBkbWEtYnVmIGFscmVhZHkgd291bGRuJ3Qgd29yazoKPj4+
IGRtYS1idWYgaGFzIHRoZSBidWZmZXIgYWx3YXlzIGF0IG9mZnNldCAwLCB3aGVyZWFzIGdlbSBk
cm1fZmQgbW1hcCBoYXMKPj4+IGl0IHNvbWV3aGVyZSBlbHNlLiBXZSBhbHJlYWR5IGFkanVzdCB2
bWEtPnZtX3Bnb2ZmLCBzbyBJJ20gd29uZGVyaW5nCj4+PiB3aGV0aGVyIHdlIGNvdWxkIGFkanVz
dCB2bV9maWxlIHRvby4gT3IgaXMgdGhhdCB0aGUgdGhpbmcgdGhhdCdzCj4+PiBmb3JiaWRkZW4/
Cj4+IFllcywgZXhhY3RseS4gTW9kaWZ5aW5nIHZtX3Bnb2ZmIGlzIGhhcm1sZXNzLCB0b25zIG9m
IGNvZGUgZG9lcyB0aGF0Lgo+Pgo+PiBCdXQgY2hhbmdpbmcgdm1hLT52bV9maWxlLCB0aGF0J3Mg
c29tZXRoaW5nIEkgaGF2ZW4ndCBzZWVuIGJlZm9yZSBhbmQKPj4gbW9zdCBsaWtlbHkgY291bGQg
YmxvdyB1cCBiYWRseS4KPiBPaywgSSByZWFkIHRoZSBzaG1lbSBoZWxwZXJzIGFnYWluLCBJIHRo
aW5rIHRob3NlIGFyZSB0aGUgb25seSBvbmVzCj4gd2hpY2ggZG8gdGhlIGltcG9ydGVyIG1tYXAg
LT4gZG1hX2J1Zl9tbWFwKCkgZm9yd2FyZGluZywgYW5kIGhlbmNlCj4gYnJlYWsgc3R1ZmYgYWxs
IGFyb3VuZCBoZXJlLgo+Cj4gVGhleSBhbHNvIHJlbW92ZSB0aGUgdm1hLT52bV9wZ29mZiBvZmZz
ZXQsIHdoaWNoIG1lYW5zCj4gdW5tYXBfbWFwcGluZ19yYW5nZSB3b250IHdvcmsgYW55d2F5LiBJ
IGd1ZXNzIGZvciBkcml2ZXJzIHdoaWNoIHVzZQo+IHNobWVtIGhlbHBlcnMgdGhlIGhhcmQgYXNz
dW1wdGlvbiBpcyB0aGF0IGEpIGNhbid0IHVzZSBwMnAgZG1hIGFuZCBiKQo+IHBpbiBldmVyeXRo
aW5nIGludG8gc3lzdGVtIG1lbW9yeS4KPgo+IFNvIG5vdCBhIHByb2JsZW0uIEJ1dCBzb21ldGhp
bmcgdG8ga2VlcCBpbiBtaW5kLiBJJ2xsIHRyeSB0byBkbyBhCj4ga2VybmVsZG9jIHBhdGNoIHRv
IG5vdGUgdGhpcyBzb21ld2hlcmUuIGJ0dyBvbiB0aGF0LCBkaWQgdGhlCj4gdGltZWxpbmUvc3lu
Y29iaiBkb2N1bWVudGF0aW9uIHBhdGNoIGxhbmQgYnkgbm93PyBKdXN0IHRyeWluZyB0byBtYWtl
Cj4gc3VyZSB0aGF0IGRvZXNuJ3QgZ2V0IGxvc3QgZm9yIGFub3RoZXIgZmV3IG1vbnRocyBvciBz
byA6LS8KCkkgc3RpbGwgaGF2ZW4ndCBmb3VuZCB0aW1lIHRvIGRvdWJsZSBjaGVjayB0aGUgZG9j
dW1lbnRhdGlvbiBhbmQgbW9zdCAKbGlrZWx5IHdvbid0IGluIHF1aXRlIGEgd2hpbGUuCgpTb3Jy
eSBmb3IgdGhhdCwgYnV0IHllYWggeW91IGtub3cgOikKCkNocmlzdGlhbi4KCj4KPiBDaGVlcnMs
IERhbmllbAo+Cj4+IENocmlzdGlhbi4KPj4KPj4+IC1EYW5pZWwKPj4+Cj4+Pj4gQ2hyaXN0aWFu
Lgo+Pj4+Cj4+Pj4+IE9mIGNvdXJzZSB0aGVyZSdzIHN0aWxsIHRoZSBwcm9ibGVtIHRoYXQgbWFu
eSBkcml2ZXJzIGRvbid0IGZvcndhcmQgdGhlCj4+Pj4+IGNhY2hlIGNvaGVyZW5jeSBjYWxscyBm
b3IgYmVnaW4vZW5kIGNwdSBhY2Nlc3MsIHNvIGluIGEgYnVuY2ggb2YgY2FzZXMKPj4+Pj4geW91
J2xsIGNhY2hlIGNhY2hlbGluZSBkaXJ0IHNvdXAuIEJ1dCB0aGF0J3Mga2luZGEgc3RhbmRhcmQg
cHJvY2VkdXJlIGZvcgo+Pj4+PiBkbWEtYnVmIDotUAo+Pj4+Pgo+Pj4+PiBCdXQgeWVhaCB0cnlp
bmcgdG8gaGFuZGxlIHRoZSBtbWFwIGFzIGFuIGltcG9ydGVyLCBieXBhc3NpbmcgdGhlIGV4cG9y
dDoKPj4+Pj4gbm9wZS4gVGhlIG9uZSBleGNlcHRpb24gaXMgaWYgeW91IGhhdmUgc29tZSBraW5k
IG9mIGZhbmN5IGdhcnQgd2l0aAo+Pj4+PiBjcHUtdmlzaWJsZSBwY2kgYmFyIChsaWtlIGF0IGxl
YXN0IGludGVncmF0ZWQgaW50ZWwgZ3B1cyBoYXZlKS4gQnV0IGluCj4+Pj4+IHRoYXQgY2FzZSB0
aGUgbW1hcCB2ZXJ5IG11Y2ggbG9va3MmYWN0cyBsaWtlIGRldmljZSBhY2Nlc3MgaW4gZXZlcnkg
d2F5Lgo+Pj4+Pgo+Pj4+PiBDaGVlcnMsIERhbmllbAo+Pj4+Pgo+Pj4+Pj4gUmVnYXJkcywKPj4+
Pj4+IENocmlzdGlhbi4KPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+IC1DaHJpcwo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
