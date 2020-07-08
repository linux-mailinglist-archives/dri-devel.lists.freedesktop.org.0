Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA99218ABD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 17:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08646E8E3;
	Wed,  8 Jul 2020 15:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAAE6E27A;
 Wed,  8 Jul 2020 15:05:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAUoiyor0hOEXq7cD+K6ygkWB+vLvE+Etg8jBb80uqefXWQPmrWIOdmPowu0sJKPI6ZHU+cvk1EITziYL7zfoaRhxMA0MVcoIPjRIEudJMnbiKY/H7RSX/0P94EXUhhT1Q2vYaMINGwmGlnkyLTLXRjuEKQWfIDgbDAfDtHU6e+6NIlaVu8mxRWCITZ76XP4KeCAxgPqyKUFlnjLtu4IQJsoC4k+uqXCJQyycLPEAgSAz+zg05UU8rfjje24tzGi5ZAHCYJvpJQ9H5xPe91pVViqofxbA/3c5XiJYKmRy+cCkAURD4zzhN22mLad8bYL6Yi29FEFOAZsiNXuPzeBJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PMK5douIACopavoIw/0X4e4IeXI5MdVYI2RZ4aIY2U=;
 b=gHVuV4hxbdH7b7AGbK6Yh3qCl0Uro+RcZpSfAcrh4CbMq18HwW5jy0hGYnEUkiKwlLkfb2w2WMR3wlWSMBNDigXG6A1JibMyePVbRy8vqgmcQyLvwy2J/B7x4vQcJwFy+5wJHuCnYzIm1R5TpQeXnCTLUqzRi5d1gVx+16jlmgB6ZdgRS6apkgcNYtOYSuC+7Q0xil6+gZ4AkpWFh0pICTR/4F/ouCOIV4v/OIv7yYFIimELgH4pskUGuBc/pDA88iQ6J0DbMtTo4R0kJ7ZMuYskgM1/S1p+pKoyTp+K5VFnb6AP0i1/vac46mFS1VKCqe/YOXt4TrM/wxn2U4QiKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PMK5douIACopavoIw/0X4e4IeXI5MdVYI2RZ4aIY2U=;
 b=NERyydbknGnD3gIC/E7ZL/I4LuZzRaKZfXntddyhR3CNToZmwfRQOqOcS1q/McGyG78PWfnZaJPpTxDZzphy3AUlqy/N3r8bjPuV82HbSKSqTfthx6tIBVRsJ3fEJhkT2IRKkCJL9ozNuvz1M5RryX4qnnwWZnTm1Em8OaHwEwU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3725.namprd12.prod.outlook.com (2603:10b6:208:162::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Wed, 8 Jul
 2020 15:05:19 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3174.021; Wed, 8 Jul 2020
 15:05:19 +0000
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ea2ba563-11ba-efc3-44db-ae83920225d6@amd.com>
Date: Wed, 8 Jul 2020 17:05:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CAKMK7uF1nXT-q-rJK0s2yUQa8h8qJmzO=p-ouzvXVQ5HgkE9Qg@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR07CA0018.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR07CA0018.eurprd07.prod.outlook.com (2603:10a6:208:ac::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.8 via Frontend Transport; Wed, 8 Jul 2020 15:05:18 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fcdc3f09-573e-4929-a063-08d823505433
X-MS-TrafficTypeDiagnostic: MN2PR12MB3725:
X-Microsoft-Antispam-PRVS: <MN2PR12MB372592B5886E31E7DF12614583670@MN2PR12MB3725.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 04583CED1A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dHtbYDJCpVs+Kw8QkMAiPi+sj5IPV1x9kfiX3urI2UGC3bbHdCVBX/0B5EW3DSxGpJjtStMhrdlNbwqV3pyB+iQPD2VnzsFDNeGOKxUyXmM3Vd2BBZLUVssk97eHhzb2udoCEkvFQiu6Owh8QsR2I0UM4RI05a7OBedpUuE2kbEsGXCxJaduYO7gP3mUGcegh6A3MdA6Gs/P8VOPxB+6I2pDf1iovNFSSy3LA2KpsgOK6U/3Z3ZxOI/kalV0Ttp1AN9micQKeYuX49ZuKIFFYUly68nL9EiWttGYTVdsUS6EQv7YZagZMoa0ltiqZQTZBkQv86TQP+qf7Cvmsja39r3/zYBLIbAMownukmJCHWtsUNyIFAhNShRmtXOzn5Eq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39850400004)(136003)(66476007)(66556008)(66946007)(86362001)(31696002)(52116002)(6916009)(54906003)(478600001)(4326008)(316002)(6666004)(2616005)(53546011)(16526019)(36756003)(186003)(2906002)(31686004)(6486002)(5660300002)(83380400001)(8676002)(8936002)(66574015)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: pZeVNLmIUNOih2pAk6Cc/Nvc+HFYQBj9exckc2BFPeI5adnJKUeVuU8gEzGQXOueT7S75KBN+SU1jaFtwKHkXlX2oQKwyYzoopI3ZtT9Rt1WMXU1NpKZ4CHuSnlVIcFesEYJWDmTBnUwMdT7H/zWAGNChIRCwnH2G/KZO43fIlOngMHYBmxhaO1a9HyOl1u5Q5zlo21qX4FB4kH8GQegrTsqE3TnljRiTmI1AhVH7PgknuGYPgR7wEo6sxJSm9LUKpo0n8IFGA4OgR0VGc6AfkEZ6IlLJJwAu13x6joPlsxmmy16ZTeBO3IDBXiLTrWKVgHtmlh7te8YncXoawetoXtMv2rq9cWM2ofCdeQeeAS87FrSqTCLWMp6vfyaVBLVJJS1zmLsSt1vm0oj24c3suzLrvNklD3jI8Au4m5rbkZW6kK+Fpzj/+oRlzyUs0n9eGhYry2ftJnMRkzd0ooEhvIaItWxFAmRt1hFl5Rvx+zoPciMiICyUhdqNUsBjpZh3VcxJBp3RvCMQsnEfA7NYxRwwOIKJLjwoC1iQ6/xa0pK8/gidYRZwgIB5u/EGxRf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcdc3f09-573e-4929-a063-08d823505433
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 15:05:19.1259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q456GVvVwk4bHoj13hNs3S7mssgFj+cSU1obwXeLxkaaHmlhY/C8LLj0xaIef2pm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3725
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

QW0gMDguMDcuMjAgdW0gMTc6MDEgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgSnVs
IDgsIDIwMjAgYXQgNDozNyBQTSBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+IHdyb3RlOgo+PiBBbSAwOC4wNy4yMCB1bSAxMTo1NCBzY2hyaWViIERhbmllbCBWZXR0
ZXI6Cj4+PiBPbiBXZWQsIEp1bCAwOCwgMjAyMCBhdCAxMToyMjowMEFNICswMjAwLCBDaHJpc3Rp
YW4gS8O2bmlnIHdyb3RlOgo+Pj4+IEFtIDA3LjA3LjIwIHVtIDIwOjM1IHNjaHJpZWIgQ2hyaXMg
V2lsc29uOgo+Pj4+PiBRdW90aW5nIGxlcHRvbiAoMjAyMC0wNy0wNyAxOToxNzo1MSkKPj4+Pj4+
IE9uIFR1ZSwgSnVsIDcsIDIwMjAgYXQgMTA6MjAgQU0gQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+IHdyb3RlOgo+Pj4+Pj4+IFF1b3RpbmcgbGVwdG9uICgyMDIwLTA3LTA3
IDE4OjA1OjIxKQo+Pj4+Pj4+PiBPbiBUdWUsIEp1bCA3LCAyMDIwIGF0IDk6MDAgQU0gQ2hyaXMg
V2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+IHdyb3RlOgo+Pj4+Pj4+Pj4gSWYgd2Ug
YXNzaWduIG9iai0+ZmlscCwgd2UgYmVsaWV2ZSB0aGF0IHRoZSBjcmVhdGUgdmdlbSBibyBpcyBu
YXRpdmUgYW5kCj4+Pj4+Pj4+PiBhbGxvdyBkaXJlY3Qgb3BlcmF0aW9ucyBsaWtlIG1tYXAoKSBh
c3N1bWluZyBpdCBiZWhhdmVzIGFzIGJhY2tlZCBieSBhCj4+Pj4+Pj4+PiBzaG1lbWZzIGlub2Rl
LiBXaGVuIGltcG9ydGVkIGZyb20gYSBkbWFidWYsIHRoZSBvYmotPnBhZ2VzIGFyZQo+Pj4+Pj4+
Pj4gbm90IGFsd2F5cyBtZWFuaW5nZnVsIGFuZCB0aGUgc2htZW1mcyBiYWNraW5nIHN0b3JlIG1p
c2xlYWRpbmcuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gTm90ZSwgdGhhdCByZWd1bGFyIG1tYXAgYWNj
ZXNzIHRvIGEgdmdlbSBibyBpcyB2aWEgdGhlIGR1bWIgYnVmZmVyIEFQSSwKPj4+Pj4+Pj4+IGFu
ZCB0aGF0IHJlamVjdHMgYXR0ZW1wdHMgdG8gbW1hcCBhbiBpbXBvcnRlZCBkbWFidWYsCj4+Pj4+
Pj4+IFdoYXQgZG8geW91IG1lYW4gYnkgInJlZ3VsYXIgbW1hcCBhY2Nlc3MiIGhlcmU/ICBJdCBs
b29rcyBsaWtlIHZnZW0gaXMKPj4+Pj4+Pj4gdXNpbmcgdmdlbV9nZW1fZHVtYl9tYXAgYXMgLmR1
bWJfbWFwX29mZnNldCBjYWxsYmFjayB0aGVuIGl0IGRvZXNuJ3QgY2FsbAo+Pj4+Pj4+PiBkcm1f
Z2VtX2R1bWJfbWFwX29mZnNldAo+Pj4+Pj4+IEFzIEkgdG9vIGZvdW5kIG91dCwgYW5kIHNvIGhh
ZCB0byBjb3JyZWN0IG15IHN0b3J5IHRlbGxpbmcuCj4+Pj4+Pj4KPj4+Pj4+PiBCeSByZWd1bGFy
IG1tYXAoKSBhY2Nlc3MgSSBtZWFuIG1tYXAgb24gdGhlIHZnZW0gYm8gW3ZpYSB0aGUgZHVtYiBi
dWZmZXIKPj4+Pj4+PiBBUEldIGFzIG9wcG9zZWQgdG8gbW1hcCgpIHZpYSBhbiBleHBvcnRlZCBk
bWEtYnVmIGZkLiBJIGhhZCB0byBsb29rIGF0Cj4+Pj4+Pj4gaWd0IHRvIHNlZSBob3cgaXQgd2Fz
IGJlaW5nIHVzZWQuCj4+Pj4+PiBOb3cgaXQgc2VlbXMgeW91ciBmaXggaXMgdG8gZGlzYWJsZSAi
cmVndWxhciBtbWFwIiBvbiBpbXBvcnRlZCBkbWEgYnVmCj4+Pj4+PiBmb3IgdmdlbS4gSSBhbSBu
b3QgcmVhbGx5IGEgZ3JhcGhpYyBndXksIGJ1dCB0aGVuIHRoZSBhcGkgbG9va3MgbGlrZToKPj4+
Pj4+IGZvciBhIGdlbSBoYW5kbGUsIHVzZXIgc3BhY2UgaGFzIHRvIGd1ZXNzIHRvIGZpbmQgb3V0
IHRoZSB3YXkgdG8gbW1hcAo+Pj4+Pj4gaXQuIElmIHVzZXIgc3BhY2UgZ3Vlc3Mgd3JvbmcsIHRo
ZW4gaXQgd2lsbCBmYWlsIHRvIG1tYXAuIElzIHRoaXMgdGhlCj4+Pj4+PiBleHBlY3RlZCB3YXkK
Pj4+Pj4+IGZvciBwZW9wbGUgdG8gaGFuZGxlIGdwdSBidWZmZXI/Cj4+Pj4+IFlvdSBlaXRoZXIg
aGF2ZSBhIGR1bWIgYnVmZmVyIGhhbmRsZSwgb3IgYSBkbWEtYnVmIGZkLiBJZiB5b3UgaGF2ZSB0
aGUKPj4+Pj4gaGFuZGxlLCB5b3UgaGF2ZSB0byB1c2UgdGhlIGR1bWIgYnVmZmVyIEFQSSwgdGhl
cmUncyBubyBvdGhlciB3YXkgdG8KPj4+Pj4gbW1hcCBpdC4gSWYgeW91IGhhdmUgdGhlIGRtYS1i
dWYgZmQsIHlvdSBzaG91bGQgbW1hcCBpdCBkaXJlY3RseS4gVGhvc2UKPj4+Pj4gdHdvIGFyZSBj
bGVhci4KPj4+Pj4KPj4+Pj4gSXQncyB3aGVuIHlvdSBpbXBvcnQgdGhlIGRtYS1idWYgaW50byB2
Z2VtIGFuZCBjcmVhdGUgYSBoYW5kbGUgb3V0IG9mCj4+Pj4+IGl0LCB0aGF0J3Mgd2hlbiB0aGUg
aGFuZGxlIGlzIG5vIGxvbmdlciBmaXJzdCBjbGFzcyBhbmQgY2VydGFpbiB1QVBJCj4+Pj4+IFt0
aGUgZHVtYiBidWZmZXIgQVBJIGluIHBhcnRpY3VsYXJdIGZhaWwuCj4+Pj4+Cj4+Pj4+IEl0J3Mg
bm90IGJyaWxsaWFudCwgYXMgeW91IHNheSwgaXQgcmVxdWlyZXMgdGhlIHVzZXIgdG8gcmVtZW1i
ZXIgdGhlCj4+Pj4+IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgaGFuZGxlcywgYnV0IGF0IHRoZSBz
YW1lIHRpbWUgaXQgZG9lcyBwcmV2ZW50Cj4+Pj4+IHRoZW0gZmFsbGluZyBpbnRvIGNvaGVyZW5j
eSB0cmFwcyBieSBmb3JjaW5nIHRoZW0gdG8gdXNlIHRoZSByaWdodAo+Pj4+PiBkcml2ZXIgdG8g
aGFuZGxlIHRoZSBvYmplY3QsIGFuZCBoYXZlIHRvIGNvbnNpZGVyIHRoZSBhZGRpdGlvbmFsIGlv
Y3Rscwo+Pj4+PiB0aGF0IGdvIGFsb25nIHdpdGggdGhhdCBhY2Nlc3MuCj4+Pj4gWWVzLCBDaHJp
cyBpcyByaWdodC4gTWFwcGluZyBETUEtYnVmIHRocm91Z2ggdGhlIG1tYXAoKSBBUElzIG9mIGFu
IGltcG9ydGVyCj4+Pj4gaXMgaWxsZWdhbC4KPj4+Pgo+Pj4+IFdoYXQgd2UgY291bGQgbWF5YmUg
dHJ5IHRvIGRvIGlzIHRvIHJlZGlyZWN0IHRoaXMgbW1hcCgpIEFQSSBjYWxsIG9uIHRoZQo+Pj4+
IGltcG9ydGVyIHRvIHRoZSBleHBvcnRlciwgYnV0IEknbSBwcmV0dHkgc3VyZSB0aGF0IHRoZSBm
cyBsYXllciB3b3VsZG4ndAo+Pj4+IGxpa2UgdGhhdCB3aXRob3V0IGNoYW5nZXMuCj4+PiBXZSBh
bHJlYWR5IGRvIHRoYXQsIHRoZXJlJ3MgYSBmdWxsIGhlbHBlci1pZmllZCBwYXRoIGZyb20gSSB0
aGluayBzaG1lbQo+Pj4gaGVscGVycyB0aHJvdWdoIHByaW1lIGhlbHBlcnMgdG8gZm9yd2FyZCB0
aGlzIGFsbC4gSW5jbHVkaW5nIGhhbmRsaW5nCj4+PiBidWZmZXIgb2Zmc2V0cyBhbmQgYWxsIHRo
ZSBvdGhlciBsb2x6IGJhY2smZm9ydGguCj4+IE9oLCB0aGF0IG1vc3QgbGlrZWx5IHdvbid0IHdv
cmsgY29ycmVjdGx5IHdpdGggdW5waW5uZWQgRE1BLWJ1ZnMgYW5kCj4+IG5lZWRzIHRvIGJlIGF2
b2lkZWQuCj4+Cj4+IEVhY2ggZmlsZSBkZXNjcmlwdG9yIGlzIGFzc29jaWF0ZWQgd2l0aCBhbiBz
dHJ1Y3QgYWRkcmVzc19zcGFjZS4gQW5kCj4+IHdoZW4geW91IG1tYXAoKSB0aHJvdWdoIHRoZSBp
bXBvcnRlciBieSByZWRpcmVjdGluZyB0aGUgc3lzdGVtIGNhbGwgdG8KPj4gdGhlIGV4cG9ydGVy
IHlvdSBlbmQgdXAgd2l0aCB0aGUgd3Jvbmcgc3RydWN0IGFkZHJlc3Nfc3BhY2UgaW4geW91ciBW
TUEuCj4+Cj4+IFRoYXQgaW4gdHVybiBjYW4gZ28gdXAgZWFzaWx5IGluIGZsYW1lcyB3aGVuIHRo
ZSBleHBvcnRlciB0cmllcyB0bwo+PiBpbnZhbGlkYXRlIHRoZSBDUFUgbWFwcGluZ3MgZm9yIGl0
cyBETUEtYnVmIHdoaWxlIG1vdmluZyBpdC4KPj4KPj4gV2hlcmUgYXJlIHdlIGRvaW5nIHRoaXM/
IE15IGxhc3Qgc3RhdHVzIHdhcyB0aGF0IHRoaXMgaXMgZm9yYmlkZGVuLgo+IEhtIEkgdGhvdWdo
dCB3ZSdyZSBkb2luZyBhbGwgdGhhdCBhbHJlYWR5LCBidXQgbG9va2luZyBhdCB0aGUgY29kZQo+
IGFnYWluIHdlJ3JlIG9ubHkgZG9pbmcgdGhpcyB3aGVuIG9wZW5pbmcgYSBuZXcgZHJtIGZkIG9y
IGRtYS1idWYgZmQuCj4gU28gdGhlIHJpZ2h0IGZpbGUtPmZfbWFwcGluZyBpcyBhbHdheXMgc2V0
IGF0IGZpbGUgY3JlYXRpb24gdGltZS4KPgo+IEFuZCB3ZSBpbmRlZWQgZG9uJ3QgZnJvYiB0aGlz
IG1vcmUgd2hlbiBnb2luZyBhbm90aGVyIGluZGlyZWN0aW9uIC4uLgo+IE1heWJlIHdlIHNjcmV3
ZWQgdXAgc29tZXRoaW5nIHNvbWV3aGVyZSA6LS8KPgo+IEFsc28gSSB0aG91Z2h0IHRoZSBtYXBw
aW5nIGlzIG9ubHkgdGFrZW4gYWZ0ZXIgdGhlIHZtYSBpcyBpbnN0YXRpYXRlZCwKPiBvdGhlcndp
c2UgdGhlIHRyaWNrcyB3ZSdyZSBwbGF5aW5nIHdpdGggZG1hLWJ1ZiBhbHJlYWR5IHdvdWxkbid0
IHdvcms6Cj4gZG1hLWJ1ZiBoYXMgdGhlIGJ1ZmZlciBhbHdheXMgYXQgb2Zmc2V0IDAsIHdoZXJl
YXMgZ2VtIGRybV9mZCBtbWFwIGhhcwo+IGl0IHNvbWV3aGVyZSBlbHNlLiBXZSBhbHJlYWR5IGFk
anVzdCB2bWEtPnZtX3Bnb2ZmLCBzbyBJJ20gd29uZGVyaW5nCj4gd2hldGhlciB3ZSBjb3VsZCBh
ZGp1c3Qgdm1fZmlsZSB0b28uIE9yIGlzIHRoYXQgdGhlIHRoaW5nIHRoYXQncwo+IGZvcmJpZGRl
bj8KClllcywgZXhhY3RseS4gTW9kaWZ5aW5nIHZtX3Bnb2ZmIGlzIGhhcm1sZXNzLCB0b25zIG9m
IGNvZGUgZG9lcyB0aGF0LgoKQnV0IGNoYW5naW5nIHZtYS0+dm1fZmlsZSwgdGhhdCdzIHNvbWV0
aGluZyBJIGhhdmVuJ3Qgc2VlbiBiZWZvcmUgYW5kIAptb3N0IGxpa2VseSBjb3VsZCBibG93IHVw
IGJhZGx5LgoKQ2hyaXN0aWFuLgoKPiAtRGFuaWVsCj4KPj4gQ2hyaXN0aWFuLgo+Pgo+Pj4gT2Yg
Y291cnNlIHRoZXJlJ3Mgc3RpbGwgdGhlIHByb2JsZW0gdGhhdCBtYW55IGRyaXZlcnMgZG9uJ3Qg
Zm9yd2FyZCB0aGUKPj4+IGNhY2hlIGNvaGVyZW5jeSBjYWxscyBmb3IgYmVnaW4vZW5kIGNwdSBh
Y2Nlc3MsIHNvIGluIGEgYnVuY2ggb2YgY2FzZXMKPj4+IHlvdSdsbCBjYWNoZSBjYWNoZWxpbmUg
ZGlydCBzb3VwLiBCdXQgdGhhdCdzIGtpbmRhIHN0YW5kYXJkIHByb2NlZHVyZSBmb3IKPj4+IGRt
YS1idWYgOi1QCj4+Pgo+Pj4gQnV0IHllYWggdHJ5aW5nIHRvIGhhbmRsZSB0aGUgbW1hcCBhcyBh
biBpbXBvcnRlciwgYnlwYXNzaW5nIHRoZSBleHBvcnQ6Cj4+PiBub3BlLiBUaGUgb25lIGV4Y2Vw
dGlvbiBpcyBpZiB5b3UgaGF2ZSBzb21lIGtpbmQgb2YgZmFuY3kgZ2FydCB3aXRoCj4+PiBjcHUt
dmlzaWJsZSBwY2kgYmFyIChsaWtlIGF0IGxlYXN0IGludGVncmF0ZWQgaW50ZWwgZ3B1cyBoYXZl
KS4gQnV0IGluCj4+PiB0aGF0IGNhc2UgdGhlIG1tYXAgdmVyeSBtdWNoIGxvb2tzJmFjdHMgbGlr
ZSBkZXZpY2UgYWNjZXNzIGluIGV2ZXJ5IHdheS4KPj4+Cj4+PiBDaGVlcnMsIERhbmllbAo+Pj4K
Pj4+PiBSZWdhcmRzLAo+Pj4+IENocmlzdGlhbi4KPj4+Pgo+Pj4+Cj4+Pj4+IC1DaHJpcwo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
