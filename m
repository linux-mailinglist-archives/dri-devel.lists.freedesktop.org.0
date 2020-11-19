Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A9F2B9CE1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 22:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF4B6E81E;
	Thu, 19 Nov 2020 21:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81F06E80B;
 Thu, 19 Nov 2020 21:25:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBEdfDk1joJhfpi6bi6ooyPrwN+34OZh8w6rDHReySZ8UK4VbC0brlvhU8o1nbtE0LcE+OpsHIbIOAVGneS0MFUeP0nU6vJ0/tZw+czeaCKjzno9VOY7WQdOISEZGB9YlnTPwTP89plauKtNXaRlotNYRT21zxpl7Dn2I0fC15D0C4cuecBR0DUzHzOFCadWeybn2Nq1aS5rjDmMCAyS4znuX8uEIAp/emrCnqGiSVtdxHA+wGT2YebEReVeEjHvpd1WpSY/H0A8vwN6JTy/C7OIaSKaDModpT2e3PIvHboCVvemZqdmmEsxQd264FtqYtP8QioJ/hzEKuIjRFEBLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWxpunpJhkjNU49QRmqufceMU51cgJFAq9Oll7EIrk4=;
 b=V8ARAhAs3+WDIFoDSvGJfG7u2YA5PA6h+FBqasF2K6bSJkbywmzyGjscA1OJKn/uJr1E1tYWcDsF16TEI8uv4NXtawdXTYNKHQQnjTISazKn1KBWSUPTbto9WcQz3/ZqFyyZdeqZZvCUZIGDJ9KvOiFCl/a/8o6KWZdo0XzqmEQNozfa55vuZeFVKou/DWf9/6eWgnSFh5nqKRlOcRlDICSGRKcMyUrjBjj7OeYL6PC5BS1VAkaID6hlyq5IAk1e4oayL0FU2yRybCxTXy6edTUi8txJnCktzMFalbi3LQ6ZDHt7HfG8hqGw/Yvsfr4UGGUB3XppNv2B9JiZ+aku9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWxpunpJhkjNU49QRmqufceMU51cgJFAq9Oll7EIrk4=;
 b=NS24lZOXLhGBMD5oXVqvc/rkLnhbg29vhGgCygfNRx2kblgZrvYsn2hTACER2bMQyk4OMnXQnWW3SyrxQ/njILUGifVV97Jpwm1yTShJFucuP40SyZiSDMINemI+AT/9Hu1P2Lf6Fe/45pP6T8OmadgYxzB8kZ+2lLxeo22/e3U=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB2809.namprd12.prod.outlook.com (2603:10b6:5:4a::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.28; Thu, 19 Nov 2020 21:24:59 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3589.022; Thu, 19 Nov 2020
 21:24:59 +0000
Subject: Re: [PATCH v2 8/8] drm/amdgpu: Prevent any job recoveries after
 device is unplugged.
To: Daniel Vetter <daniel@ffwll.ch>
References: <24dd3691-5599-459c-2e5d-a8f2e504ec66@amd.com>
 <20201117185255.GP401619@phenom.ffwll.local>
 <b827fa7a-d89e-d138-d275-60a9f15c128a@amd.com>
 <20201117194922.GW401619@phenom.ffwll.local>
 <064ef461-8f59-2eb8-7777-6ff5b8d28cdd@amd.com>
 <CAKMK7uF9uvT09zDb6fS0j68fWrq2qV7h_JQAt8vpaGPJ1d64cQ@mail.gmail.com>
 <d0a3ee49-64f3-a223-7e84-0c8eb3481f61@gmail.com>
 <e462f296-75d0-316a-e30f-c985e7aac88d@amd.com>
 <f65c5d45-8cb2-fde1-1785-756088aa95d5@gmail.com>
 <d67bcb18-c26c-542c-3fbb-67c69c0980b5@amd.com>
 <20201119152951.GD401619@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <3d780dd0-e7c0-ffa5-c8fa-ba1c320fe390@amd.com>
Date: Thu, 19 Nov 2020 16:24:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20201119152951.GD401619@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:c99d:8669:45d1:4d60]
X-ClientProxiedBy: YT1PR01CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::25) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:c99d:8669:45d1:4d60]
 (2607:fea8:3edf:49b0:c99d:8669:45d1:4d60) by
 YT1PR01CA0056.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 21:24:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7ebeebc3-0b0c-40bd-9131-08d88cd19176
X-MS-TrafficTypeDiagnostic: DM6PR12MB2809:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2809AE548962E01425C03308EAE00@DM6PR12MB2809.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bEzlw4jiayqz588b+I2WosbYLe36emri7Y6sfJ+hzzE880YdpUovC/hg1Y33t8vvzNzNR5U/IVCK2UEWYDjJaihB+KERIUW348wXOgzLQVlf6TjAXbnnAReqnRIoQvHaJqjNNfdhKfxzykrp3400UTMTM9sO2uPq8sD8KjtVjN3w/nIWi/I0M/GNwepq1vSadOTfch8bSfjj2UKRtNDUrRsST/urn+ooi1xI6eLiXW5gPOwwgs/RkcqHuU9naBx0cuTUdYSjsNUHbadv/V9ZQhpF6ehC6gnYbskR+OHlICL56EpyAG29VPbxneXvSWOeeRwCAyXcOpVEbt9Sa3JiGZRiqMgvT5hVd5w2SE8Wyu9D/KQ0UW6+6VvuEncZFm8n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(39850400004)(346002)(52116002)(53546011)(316002)(54906003)(5660300002)(478600001)(16526019)(4326008)(8676002)(66946007)(8936002)(86362001)(66556008)(2616005)(31686004)(66476007)(36756003)(2906002)(83380400001)(31696002)(186003)(6916009)(6486002)(66574015)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NkFGM1lCSy9uWm9KVjNEWHRUZ0pVTzdZeWZqTkYyV0hxRThqQVdxMDU0OWJP?=
 =?utf-8?B?REtzUTZEU3hDSyt0QTR0UUloRllWdzg2VklmS3YyMnNuVzRKbkJTOWpjdWhB?=
 =?utf-8?B?ampOSGVhdVlrL2MyZncxWnY4MUJkTnlOUnFhbDVDTHlUQ2taNXVNSmpBN1Vn?=
 =?utf-8?B?SmljdnR0bFBBdW15OXlPNkpqcFNhRGkrNUNuWlBXTzNkVFlsNHlLdEkxNGh6?=
 =?utf-8?B?Rm5jOU9YcHJLdytlMmdpUnpjN1VRMk1zMjdFL3N2c1pzK0JSSk45OEtKT0Zk?=
 =?utf-8?B?YTQxcno1QVZpMXFiTmVwMnBQazJyMlNsc2JkU0szNXV2aEZ1UEt1Ry80aGdz?=
 =?utf-8?B?RHVTZ1M1UGFyanpCd1UzdlQ4d1UxODRsYjd4VE5va25vdVh1Q3pjMDBhQWdi?=
 =?utf-8?B?dzVpY2JkVzZ4dy9SSEV2cVA1eFZIa1lRdFd3bDA0VFBCT0c0Yk5hUHllamFI?=
 =?utf-8?B?VlR2akZZVUpTNXFKREtvVlplL0lnbmJ5UGpPcEVxZnNZOG1vV1NYaE85V1Bq?=
 =?utf-8?B?L2o1YmhWdm1sWTF1KzdsSWlxQlhoTkVQMGk1RWN3UFJCZjY4VldpRHpuT2tp?=
 =?utf-8?B?dU8wTUU4akU5Nm9hcnJiK0llNEJEc0FrZlhHZjJHZysycGc4YmVrSk9DK0po?=
 =?utf-8?B?T3pMVGdzRjZhTDQzeGFYYm9ialFYYkQwMG1oZDZvTURJdmtUekRmNVJKTVFv?=
 =?utf-8?B?OTd0V3VwWW9hbFJaU00wclZIZG96M1ZLVGpreERRSWxOYlFJZEF4aGlwb2hI?=
 =?utf-8?B?NHA1ZlAySnM3NjhoMS9aTEpybzN3OFp4M1ExNTdLc1BtYXBSZVRsZWx6dTNl?=
 =?utf-8?B?Q2o4OHdnMTB1RjFWeHpGUlBXK0ZTejE0ZkdsblIvblV0c0NFemYzTkZKWUFH?=
 =?utf-8?B?TXlkbXRuWWc3NmQ1anRaWm1hTVNXU2Q0bXgvYm1zN2VKTG1pZHF6ZE51MXFy?=
 =?utf-8?B?ekUrUngzTzBmWDlKNVNtWlpNNDgvaFpBY0hCWWRPSmlvcVo2Ry84N0tYQktx?=
 =?utf-8?B?anYxbzZxVUFHekc2K0pLYWxpcWlEdzlMNEpuYkVrYWQ4U3NuRUZsMTFSZm5u?=
 =?utf-8?B?V01wQ0FhTDM5RS9UMHlSV2RmUThGa2g2cEM5Yzc2SVQ2MmlwNW94UXo3NDF3?=
 =?utf-8?B?NWlHcExFWldmclQrYTdQREY4ZVRHRVFmYjdKWU43ekRTZGMyYlJWUW9ZVVUx?=
 =?utf-8?B?cFJDcTMrK0Rxd3pEUEVBNUpHT09HRC9TZFNiNE1aMWJKQ1VkeHBNa2JwMWlR?=
 =?utf-8?B?Y0s1YXE5bEExR2I2VTRwOU1Edk5wSzN4YUFZNlZnajlZT3VRQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebeebc3-0b0c-40bd-9131-08d88cd19176
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 21:24:59.1994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dujJ/11iknzS0YRfdooiSQ9OZyKrMHsv3FDl3P4YRF2hTeb7em5xnrjf/Fg1vdGSsnQgZT032sU7pdmTsx1w7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2809
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
Cc: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDExLzE5LzIwIDEwOjI5IEFNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFRodSwgTm92
IDE5LCAyMDIwIGF0IDEwOjAyOjI4QU0gLTA1MDAsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+
PiBPbiAxMS8xOS8yMCAyOjU1IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4gQW0gMTgu
MTEuMjAgdW0gMTc6MjAgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+PiBPbiAxMS8xOC8y
MCA3OjAxIEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+PiBBbSAxOC4xMS4yMCB1bSAw
ODozOSBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+Pj4+PiBPbiBUdWUsIE5vdiAxNywgMjAyMCBh
dCA5OjA3IFBNIEFuZHJleSBHcm9kem92c2t5Cj4+Pj4+PiA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1k
LmNvbT4gd3JvdGU6Cj4+Pj4+Pj4gT24gMTEvMTcvMjAgMjo0OSBQTSwgRGFuaWVsIFZldHRlciB3
cm90ZToKPj4+Pj4+Pj4gT24gVHVlLCBOb3YgMTcsIDIwMjAgYXQgMDI6MTg6NDlQTSAtMDUwMCwg
QW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6Cj4+Pj4+Pj4+PiBPbiAxMS8xNy8yMCAxOjUyIFBNLCBE
YW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4+Pj4+Pj4+IE9uIFR1ZSwgTm92IDE3LCAyMDIwIGF0IDAx
OjM4OjE0UE0gLTA1MDAsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4+Pj4+Pj4+PiBPbiA2
LzIyLzIwIDU6NTMgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+Pj4+Pj4+Pj4+PiBPbiBTdW4s
IEp1biAyMSwgMjAyMCBhdCAwMjowMzowOEFNIC0wNDAwLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90
ZToKPj4+Pj4+Pj4+Pj4+PiBObyBwb2ludCB0byB0cnkgcmVjb3ZlcnkgaWYgZGV2aWNlIGlzIGdv
bmUsIGp1c3QgbWVzc2VzIHVwIHRoaW5ncy4KPj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29t
Pgo+Pj4+Pj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+Pj4+Pj4+ICDCoMKgwqDCoCBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCAxNiArKysrKysrKysrKysrKysrCj4+Pj4+Pj4+
Pj4+Pj4gIMKgwqDCoMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYyB8
IDggKysrKysrKysKPj4+Pj4+Pj4+Pj4+PiAgwqDCoMKgwqAgMiBmaWxlcyBjaGFuZ2VkLCAyNCBp
bnNlcnRpb25zKCspCj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0Cj4+Pj4+
Pj4+Pj4+Pj4gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPj4+Pj4+
Pj4+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+Pj4+Pj4+
Pj4+Pj4+IGluZGV4IDY5MzJkNzUuLjVkNmQzZDkgMTAwNjQ0Cj4+Pj4+Pj4+Pj4+Pj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4+Pj4+Pj4+Pj4+Pj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4+Pj4+Pj4+Pj4+Pj4g
QEAgLTExMjksMTIgKzExMjksMjggQEAgc3RhdGljCj4+Pj4+Pj4+Pj4+Pj4gaW50IGFtZGdwdV9w
Y2lfcHJvYmUoc3RydWN0Cj4+Pj4+Pj4+Pj4+Pj4gcGNpX2RldiAqcGRldiwKPj4+Pj4+Pj4+Pj4+
PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4+Pj4+Pj4+Pj4gIMKgwqDCoMKg
IH0KPj4+Pj4+Pj4+Pj4+PiArc3RhdGljIHZvaWQgYW1kZ3B1X2NhbmNlbF9hbGxfdGRyKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQo+Pj4+Pj4+Pj4+Pj4+ICt7Cj4+Pj4+Pj4+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGludCBpOwo+Pj4+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IEFNREdQVV9NQVhfUklOR1M7ICsraSkgewo+Pj4+Pj4+
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9yaW5n
ICpyaW5nID0gYWRldi0+cmluZ3NbaV07Cj4+Pj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFyaW5nIHx8ICFyaW5nLT5zY2hlZC50
aHJlYWQpCj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY29udGludWU7Cj4+Pj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+Pj4+ICsgY2Fu
Y2VsX2RlbGF5ZWRfd29ya19zeW5jKCZyaW5nLT5zY2hlZC53b3JrX3Rkcik7Cj4+Pj4+Pj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+Pj4+Pj4+Pj4+PiArfQo+Pj4+Pj4+Pj4+Pj4gSSB0aGlu
ayB0aGlzIGlzIGEgZnVuY3Rpb24gdGhhdCdzIHN1cHBvc2VkIHRvIGJlIGluIGRybS9zY2hlZHVs
ZXIsIG5vdAo+Pj4+Pj4+Pj4+Pj4gaGVyZS4gTWlnaHQgYWxzbyBqdXN0IGJlIHlvdXIKPj4+Pj4+
Pj4+Pj4+IGNsZWFudXAgY29kZSBiZWluZyBvcmRlcmVkIHdyb25nbHksCj4+Pj4+Pj4+Pj4+PiBv
ciB5b3VyCj4+Pj4+Pj4+Pj4+PiBzcGxpdCBpbiBvbmUgb2YgdGhlIGVhcmxpZXIgcGF0Y2hlcyBu
b3QgZG9uZSBxdWl0ZSByaWdodC4KPj4+Pj4+Pj4+Pj4+IC1EYW5pZWwKPj4+Pj4+Pj4+Pj4gVGhp
cyBmdW5jdGlvbiBpdGVyYXRlcyBhY3Jvc3MgYWxsIHRoZQo+Pj4+Pj4+Pj4+PiBzY2hlZHVsZXJz
IHBlciBhbWRncHUgZGV2aWNlIGFuZAo+Pj4+Pj4+Pj4+PiBhY2Nlc3Nlcwo+Pj4+Pj4+Pj4+PiBh
bWRncHUgc3BlY2lmaWMgc3RydWN0dXJlcyAsCj4+Pj4+Pj4+Pj4+IGRybS9zY2hlZHVsZXIgZGVh
bHMgd2l0aCBzaW5nbGUKPj4+Pj4+Pj4+Pj4gc2NoZWR1bGVyIGF0IG1vc3QKPj4+Pj4+Pj4+Pj4g
c28gbG9va3MgdG8gbWUgbGlrZSB0aGlzIGlzIHRoZSByaWdodCBwbGFjZSBmb3IgdGhpcyBmdW5j
dGlvbgo+Pj4+Pj4+Pj4+IEkgZ3Vlc3Mgd2UgY291bGQga2VlcCB0cmFjayBvZiBhbGwgc2NoZWR1
bGVycyBzb21ld2hlcmUgaW4gYSBsaXN0IGluCj4+Pj4+Pj4+Pj4gc3RydWN0IGRybV9kZXZpY2Ug
YW5kIHdyYXAgdGhpcyB1cC4gVGhhdCB3YXMga2luZGEgdGhlIGlkZWEuCj4+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+PiBNaW5pbWFsbHkgSSB0aGluayBhIHRpbnkgd3JhcHBlciB3aXRoIGRvY3MgZm9yIHRo
ZQo+Pj4+Pj4+Pj4+IGNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmc2NoZWQtPndvcmtfdGRyKTsg
d2hpY2ggZXhwbGFpbnMgd2hhdCB5b3UgbXVzdAo+Pj4+Pj4+Pj4+IG9ic2VydmUgdG8gbWFrZSBz
dXJlIHRoZXJlJ3Mgbm8gcmFjZS4KPj4+Pj4+Pj4+IFdpbGwgZG8KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4+IEknbSBub3QgZXhhY3RseSBzdXJlIHRoZXJlJ3Mgbm8KPj4+Pj4+Pj4+PiBn
dWFyYW50ZWUgaGVyZSB3ZSB3b24ndCBnZXQgYSBuZXcgdGRyIHdvcmsgbGF1bmNoZWQgcmlnaHQg
YWZ0ZXJ3YXJkcyBhdAo+Pj4+Pj4+Pj4+IGxlYXN0LCBzbyB0aGlzIGxvb2tzIGEgYml0IGxpa2Ug
YSBoYWNrLgo+Pj4+Pj4+Pj4gTm90ZSB0aGF0IGZvciBhbnkgVERSIHdvcmsgaGFwcGVuaW5nIHBv
c3QgYW1kZ3B1X2NhbmNlbF9hbGxfdGRyCj4+Pj4+Pj4+PiBhbWRncHVfam9iX3RpbWVkb3V0LT5k
cm1fZGV2X2lzX3VucGx1Z2dlZAo+Pj4+Pj4+Pj4gd2lsbCByZXR1cm4gdHJ1ZSBhbmQgc28gaXQg
d2lsbCByZXR1cm4gZWFybHkuIFRvIG1ha2UgaXQgd2F0ZXIgcHJvb2YgdGlnaHQKPj4+Pj4+Pj4+
IGFnYWluc3QgcmFjZQo+Pj4+Pj4+Pj4gaSBjYW4gc3dpdGNoIGZyb20gZHJtX2Rldl9pc191bnBs
dWdnZWQgdG8gZHJtX2Rldl9lbnRlci9leGl0Cj4+Pj4+Pj4+IEhtIHRoYXQncyBjb25mdXNpbmcu
IFlvdSBkbyBhIHdvcmtfY2FuY2VsX3N5bmMsIHNvIHRoYXQgYXQgbGVhc3QgbG9va3MKPj4+Pj4+
Pj4gbGlrZSAidGRyIHdvcmsgbXVzdCBub3QgcnVuIGFmdGVyIHRoaXMgcG9pbnQiCj4+Pj4+Pj4+
Cj4+Pj4+Pj4+IElmIHlvdSBvbmx5IHJlbHkgb24gZHJtX2Rldl9lbnRlci9leGl0IGNoZWNrIHdp
dGggdGhlIHRkciB3b3JrLCB0aGVuCj4+Pj4+Pj4+IHRoZXJlJ3Mgbm8gbmVlZCB0byBjYW5jZWwg
YW55dGhpbmcuCj4+Pj4+Pj4gQWdyZWUsIHN5bmNocm9uaXplX3NyY3UgZnJvbSBkcm1fZGV2X3Vu
cGx1ZyBzaG91bGQgcGxheSB0aGUgcm9sZQo+Pj4+Pj4+IG9mICdmbHVzaGluZycgYW55IGVhcmxp
ZXIgKGluIHByb2dyZXNzKSB0ZHIgd29yayB3aGljaCBpcwo+Pj4+Pj4+IHVzaW5nIGRybV9kZXZf
ZW50ZXIvZXhpdCBwYWlyLiBBbnkgbGF0ZXIgYXJpc2luZyB0ZHIKPj4+Pj4+PiB3aWxsIHRlcm1p
bmF0ZSBlYXJseSB3aGVuCj4+Pj4+Pj4gZHJtX2Rldl9lbnRlcgo+Pj4+Pj4+IHJldHVybnMgZmFs
c2UuCj4+Pj4+PiBOb3BlLCBhbnl0aGluZyB5b3UgcHV0IGludG8gdGhlIHdvcmsgaXRzZWxmIGNh
bm5vdCBjbG9zZSB0aGlzIHJhY2UuCj4+Pj4+PiBJdCdzIHRoZSBzY2hlZHVsZV93b3JrIHRoYXQg
bWF0dGVycyBoZXJlLiBPciBJJ20gbWlzc2luZyBzb21ldGhpbmcgLi4uCj4+Pj4+PiBJIHRob3Vn
aHQgdGhhdCB0aGUgdGRyIHdvcmsgeW91J3JlIGNhbmNlbGxpbmcgaGVyZSBpcyBsYXVuY2hlZCBi
eQo+Pj4+Pj4gZHJtL3NjaGVkdWxlciBjb2RlLCBub3QgYnkgdGhlIGFtZCBjYWxsYmFjaz8KPj4+
Pgo+Pj4+IE15IGJhZCwgeW91IGFyZSByaWdodCwgSSBhbSBzdXBwb3NlZCB0byBwdXQgZHJtX2Rl
dl9lbnRlci5leGl0IHBhaXIKPj4+PiBpbnRvIGRybV9zY2hlZF9qb2JfdGltZWRvdXQKPj4+Pgo+
Pj4+Cj4+Pj4+IFllcyB0aGF0IGlzIGNvcnJlY3QuIENhbmNlbGluZyB0aGUgd29yayBpdGVtIGlz
IG5vdCB0aGUgcmlnaHQKPj4+Pj4gYXBwcm9hY2ggYXQgYWxsLCBub3IgaXMgYWRkaW5nIGRldl9l
bnRlci9leGl0IHBhaXIgaW4gdGhlCj4+Pj4+IHJlY292ZXJ5IGhhbmRsZXIuCj4+Pj4KPj4+PiBX
aXRob3V0IGFkZGluZyB0aGUgZGV2X2VudGVyL2V4aXQgZ3VhcmRpbmcgcGFpciBpbiB0aGUgcmVj
b3ZlcnkKPj4+PiBoYW5kbGVyIHlvdSBhcmUgZW5kaW5nIHVwIHdpdGggR1BVIHJlc2V0IHN0YXJ0
aW5nIHdoaWxlCj4+Pj4gdGhlIGRldmljZSBpcyBhbHJlYWR5IHVucGx1Z2dlZCwgdGhpcyBsZWFk
cyB0byBtdWx0aXBsZSBlcnJvcnMgYW5kIGdlbmVyYWwgbWVzcy4KPj4+Pgo+Pj4+Cj4+Pj4+IFdo
YXQgd2UgbmVlZCB0byBkbyBoZXJlIGlzIHRvIHN0b3AgdGhlIHNjaGVkdWxlciB0aHJlYWQgYW5k
IHRoZW4KPj4+Pj4gd2FpdCBmb3IgYW55IHRpbWVvdXQgaGFuZGxpbmcgdG8gaGF2ZSBmaW5pc2hl
ZC4KPj4+Pj4KPj4+Pj4gT3RoZXJ3aXNlIGl0IGNhbiBzY2hlZHVsZXIgYSBuZXcgdGltZW91dCBq
dXN0IGFmdGVyIHdlIGhhdmUgY2FuY2VsZWQgdGhpcyBvbmUuCj4+Pj4+Cj4+Pj4+IFJlZ2FyZHMs
Cj4+Pj4+IENocmlzdGlhbi4KPj4+Pgo+Pj4+IFNjaGVkdWxlcnMgYXJlIHN0b3BwZWQgZnJvbSBh
bWRncHVfZHJpdmVyX3VubG9hZF9rbXMgd2hpY2ggaW5kZWVkCj4+Pj4gaGFwcGVucyBhZnRlciBk
cm1fZGV2X3VucGx1Zwo+Pj4+IHNvIHllcywgdGhlcmUgaXMgc3RpbGwgYSBjaGFuY2UgZm9yIG5l
dyB3b3JrIGJlaW5nIHNjaGVkdWxlciBhbmQKPj4+PiB0aW1lb3V0IGFybWVkIGFmdGVyIGJ1dCwg
b25jZSBpIGZpeCB0aGUgY29kZQo+Pj4+IHRvIHBsYWNlIGRybV9kZXZfZW50ZXIvZXhpdCBwYWly
IGludG8gZHJtX3NjaGVkX2pvYl90aW1lb3V0IEkgZG9uJ3QKPj4+PiBzZWUgd2h5IHRoYXQgbm90
IGEgZ29vZCBzb2x1dGlvbiA/Cj4+PiBZZWFoIHRoYXQgc2hvdWxkIHdvcmsgYXMgd2VsbCwgYnV0
IHRoZW4geW91IGFsc28gZG9uJ3QgbmVlZCB0byBjYW5jZWwKPj4+IHRoZSB3b3JrIGl0ZW0gZnJv
bSB0aGUgZHJpdmVyLgo+Pgo+PiBJbmRlZWQsIGFzIERhbmllbCBwb2ludGVkIG91dCBubyBuZWVk
IGFuZCBJIGRyb3BwZWQgaXQuIE9uZSBjb3JyZWN0aW9uIC0gSQo+PiBwcmV2aW91c2x5IHNhaWQg
dGhhdCB3L28KPj4gZGV2X2VudGVyL2V4aXQgZ3VhcmRpbmcgcGFpciBpbiBzY2hlZHVsZXIncyBU
TyBoYW5kbGVyIHlvdSB3aWxsIGdldCBHUFUKPj4gcmVzZXQgc3RhcnRpbmcgd2hpbGUgZGV2aWNl
IGFscmVhZHkgZ29uZSAtCj4+IG9mIGNvdXJzZSB0aGlzIGlzIG5vdCBmdWxseSBwcmV2ZW50aW5n
IHRoaXMgYXMgdGhlIGRldmljZSBjYW4gYmUgZXh0cmFjdGVkCj4+IGF0IGFueSBtb21lbnQganVz
dCBhZnRlciB3ZQo+PiBhbHJlYWR5IGVudGVyZWQgR1BVIHJlY292ZXJ5LiBCdXQgaXQgZG9lcyBz
YXZlcyB1cyBwcm9jZXNzaW5nIGEgZnV0aWxlwqAgR1BVCj4+IHJlY292ZXJ5IHdoaWNoIGFsd2F5
cwo+PiBzdGFydHMgb25jZSB5b3UgdW5wbHVnIHRoZSBkZXZpY2UgaWYgdGhlcmUgYXJlIGFjdGl2
ZSBnb2JzIGluIHByb2dyZXNzIGF0Cj4+IHRoZSBtb21lbnQgYW5kIHNvIEkgdGhpbmsgaXQncwo+
PiBzdGlsbCBqdXN0aWZpYWJsZSB0byBrZWVwIHRoZSBkZXZfZW50ZXIvZXhpdCBndWFyZGluZyBw
YWlyIHRoZXJlLgo+IFllYWggc3ByaW5rbGluZyBkcm1fZGV2X2VudGVyL2V4aXQgb3ZlciB0aGUg
dXN1YWwgc3VzcGVjdCBjb2RlIHBhdGhzIGxpa2UKPiB0ZHIgdG8gbWFrZSB0aGUgZW50aXJlIHVu
bG9hZGluZyBtdWNoIGZhc3RlciBtYWtlcyBzZW5zZS4gV2FpdGluZyBmb3IKPiBlbm9ybW91cyBh
bW91bnRzIG9mIG1taW8gb3BzIHRvIHRpbWUgb3V0IGlzbid0IGZ1bi4gQSBjb21tZW50IG1pZ2h0
IGJlCj4gZ29vZCBmb3IgdGhhdCB0aG91Z2gsIHRvIGV4cGxhaW4gd2h5IHdlJ3JlIGRvaW5nIHRo
YXQuCj4gLURhbmllbAoKCldpbGwgZG8sIEkgYWxzbyB0cmllZCB0byBpbnNlcnQgZHJtX2Rldl9l
bnRlci9leGl0IGluIGFsbCBNTUlPIGFjY2Vzc29ycyBpbiBhbWRncHUKdG8gdHJ5IGFuZCBhdm9p
ZCBhdCB0aGF0IGxldmVsIGJ1dCBkaWRuJ3QgZ2V0IGdvb2QgcmVzdWx0cyBmb3IgdW5jbGVhciBy
ZWFzb24sIAp3aWxsIHByb2JhYmx5IGdldAp0byB0aGlzIGFzIGEgZm9sbG93IHVwIHdvcmsgdG8g
YWdhaW4gYXZvaWQgZXhwYW5kaW5nIHRoZSBzY29wZSBvZiBjdXJyZW50IHdvcmsgCnRvbyBtdWNo
LgoKQW5kcmV5CgoKPgo+PiBBbmRyZXkKPj4KPj4KPj4+Cj4+Pj4gQW55IHRkciB3b3JrIHN0YXJ0
ZWQgYWZ0ZXIgZHJtX2Rldl91bnBsdWcgZmluaXNoZWQgd2lsbCBzaW1wbHkgYWJvcnQKPj4+PiBv
biBlbnRyeSB0byBkcm1fc2NoZWRfam9iX3RpbWVkb3V0Cj4+Pj4gYmVjYXVzZSBkcm1fZGV2X2Vu
dGVyIHdpbGwgYmUgZmFsc2UgYW5kIHRoZSBmdW5jdGlvbiB3aWxsIHJldHVybgo+Pj4+IHdpdGhv
dXQgcmVhcm1pbmcgdGhlIHRpbWVvdXQgdGltZXIgYW5kCj4+Pj4gc28gd2lsbCBoYXZlIG5vIGlt
cGFjdC4KPj4+Pgo+Pj4+IFRoZSBvbmx5IGlzc3VlIGkgc2VlIGhlcmUgbm93IGlzIG9mIHBvc3Np
YmxlIHVzZSBhZnRlciBmcmVlIGlmIHNvbWUKPj4+PiBsYXRlIHRkciB3b3JrIHdpbGwgdHJ5IHRv
IGV4ZWN1dGUgYWZ0ZXIKPj4+PiBkcm0gZGV2aWNlIGFscmVhZHkgZ29uZSwgZm9yIHRoaXMgd2Ug
cHJvYmFibHkgc2hvdWxkIGFkZAo+Pj4+IGNhbmNlbF9kZWxheWVkX3dvcmtfc3luYyhzY2hlZC53
b3JrX3RkcikKPj4+PiB0byBkcm1fc2NoZWRfZmluaSBhZnRlciBzY2hlZC0+dGhyZWFkIGlzIHN0
b3BwZWQgdGhlcmUuCj4+PiBHb29kIHBvaW50LCB0aGF0IGlzIGluZGVlZCBtaXNzaW5nIGFzIGZh
ciBhcyBJIGNhbiBzZWUuCj4+Pgo+Pj4gQ2hyaXN0aWFuLgo+Pj4KPj4+PiBBbmRyZXkKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
