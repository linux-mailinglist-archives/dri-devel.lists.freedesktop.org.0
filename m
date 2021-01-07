Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 277902ED44A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 17:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5C16E4B0;
	Thu,  7 Jan 2021 16:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDA96E4B0;
 Thu,  7 Jan 2021 16:29:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9h0mdzkSRk1GVOH9V7nTF4KQwI72j2KtE2EqnLiNoFp7AgbtPfUdS3UEJJMGcBylPzmRfrxjm6F7NkXp+305HTtXABkAN9tCFf59zP5FA01EsHEtUMV52qayf0VhyzNAvd9TqsZuPkcsj9S3vOCNdw5zdzLR9Bu3oEpbROu779ADXc/tZAE9ut60H1cphHBKKdoBnXOtBqBCRd3vBpj4mBDuGe+9CWRx+Qgt1vObTPCtouLsNo4cZOezYNH+nr01wcwL0rshYBXlsZ8fFXliv/kIW7lGNFXjDhtA/9VK6vGz0mJS8pkTXjoqf7/VMHTICVyRa9k+XAEy9874utfWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJapu+ZtLdKn430PHvMG1zefEGYSchM6WFPM6qKDhY4=;
 b=TLdS52RD6eD1Rr+0QFvWw28bTktcx+r65bgPaeK2MnPHZsFX0wQFGA9uZJok2LCDrwZ4F157887PcIoEJVIIoMOqFZdzGNKy8lKTj3LC/jaVhSl1yIHAZ1EshpzR75LxJbTMKv+HQjSE17oqYrbPGTCQbtO/29qJIrLoQ8WAGwFPvxtJyEu+ke+V8XWKCWxJy3DbA1rgfca6jo2/Byaw1ARfmOG77HRlX6WY1TTKt1VxQ8+9kMKFopw3314DbvAjcTcuCv0TXin8gk1D0mSDfFWeXCUxvdC7Ry7OL5SUkhXUks+DAkm3ordIZxmEckVKomzbTB1S3mLVmIPnZVl+hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJapu+ZtLdKn430PHvMG1zefEGYSchM6WFPM6qKDhY4=;
 b=hpCysa5KNlEQEkxosm3MdkyxXwSWH+iYTG67Vc4wbgHKIAOC7ZJ0l1eLf7R6t8k4rNNV6ZeeUuUqiy5OPoc0/RRekTjH8YM7ZBF8cCwW2mTmKWqAV/lh0esbMPuJYQvWZJrFVjL+SWTVNxoc8WeddTvCJd34Sucve3QYWvn+dz4=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Thu, 7 Jan
 2021 16:29:01 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 16:29:01 +0000
Subject: Re: [PATCH 29/35] drm/amdgpu: svm bo enable_signal call condition
To: Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
 <20210107030127.20393-30-Felix.Kuehling@amd.com>
 <b16fcc27-fe4e-88a2-4f23-dcfa9ba69264@gmail.com>
 <4875fe7b-737c-60ae-9494-4008d7f8b19f@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <32203969-465d-166a-ea8f-e011a4f80d8c@amd.com>
Date: Thu, 7 Jan 2021 17:28:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <4875fe7b-737c-60ae-9494-4008d7f8b19f@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR07CA0028.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::41) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR07CA0028.eurprd07.prod.outlook.com (2603:10a6:208:ac::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.3 via Frontend Transport; Thu, 7 Jan 2021 16:28:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 246bfdf2-f310-4464-bb71-08d8b32957ab
X-MS-TrafficTypeDiagnostic: MN2PR12MB4254:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4254F0AB71C5AF6343047E1783AF0@MN2PR12MB4254.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BQVdt0U5sRUR74tKFrOh/sTKMzZBr8XBS95JiQcdZ7uJ/dnX5K9kSRvlHA3pJG/cFrGG/qQWniORRJ9fSavPH8G1zJK23LI+7BRdOpzYEilmFI6cLJxwOPfdexlq0o8l+Bs/wWLDeYzrMoOvmDepKrfTE8phWyTmsV9ozFUSr4sG7iBMJH4u9oIglG1nHyXdp0QHf4pb71+c17CAuNz8UdkGaP6Sjh/SOPY8CaAbmMwmqWW1waxc/BwCZEEnT1SXbg5oVKZLftrrOkFsx9Lv6pAJmQPxkcNjU+d93YN25kxBUwiUjgUw5VyfxBQDyGPanwqO+z0fVkducJU06NexGX9JW+a137RmlS2zQQcYEygP7kLNiplFu4L0TuXk/bsisAIU+VpVU6RaQAGt7nUQvmovRsTQRPucVZovJw2bLXPh1qgYS3NPJUg1NLf6+jVgT3nFtSFGKKu4T20G/qU+5MT8uEH1I5oiE3JFXp1oULTgz9Ldy+BxipoiTczSqEsa6fplo8gnJa+EVmRSgENXxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(66574015)(316002)(66476007)(478600001)(66556008)(83380400001)(6666004)(8936002)(5660300002)(36756003)(31686004)(8676002)(4326008)(16526019)(2906002)(52116002)(2616005)(186003)(31696002)(86362001)(6486002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a3NiRGkvQVpGRzk3RkVCb0NONkhBNXB1WEptYmR4MncvK3Y2U2ZnKzZlS1R0?=
 =?utf-8?B?S21Zbmlmbk1YTUZXSWl5bmwwWTRoKzBTWWxPclBEeGlub3ZsdlBKTEN3Uzhq?=
 =?utf-8?B?RitQQTJWcndHVnJoN3hBMXptT1pMdi9mSVIwMGs5eGVrOUdaZmxxYUVYU2p5?=
 =?utf-8?B?eVkySmNPSFZzbzU2UURBMFFWVGxxLzFMaHhuSDMzYUVaUWlqc1BlUnl3MUFy?=
 =?utf-8?B?WEVQUjRHeEFUcm1KMW1BakMwdnVhU1ZkNkQ5MVM4SnllOVlralVlOStOVXN4?=
 =?utf-8?B?RFYrQktuNjNpWjdEM0FVZ2oxQktkK3djOVdUT3ltY3VBZEVKNDFMc09Yek54?=
 =?utf-8?B?NmF0UVZCcHAxNzBrRDE2SXRubXJ2WnlQa2hlczdETWRzVE1wM21RU0ZkcGJp?=
 =?utf-8?B?ekVPcE1ZUis5ZU5oVEt3SWRzQ1phaFBkNkJXUXAxdUY3UDI4Z3FuUzF3YlVI?=
 =?utf-8?B?V0ZGUnZQcXQzanZrdk5RSm5ZeURiWksxWG5uZVlOcHNSNlFtakQwWW1NVE01?=
 =?utf-8?B?TVJxTTVKbmFhMGovMFhnenE2N1g0a2ZrQzNhMkZmSDhFQm0zTkpiK09lejZh?=
 =?utf-8?B?YjdMMytpdXk5L1ViTnhZMXdBSXRva01VUDh0elZwZys0L2ZhUm1HQlljMEZr?=
 =?utf-8?B?R2xjZEtZdmIzbXZqUUMzZjRhMzQzUUZxcjNnWWRWMGQyMWFjdmNQUGM3VTJ2?=
 =?utf-8?B?alEyY2RRNzR5a3RkS1BoZVNlNSs5alQyU2Z0UHdEd0pjdHNjdlB3UjZjbGpa?=
 =?utf-8?B?T2grSlhJWWZ4ckovbkRCeE9mSTFLbWJ3VE1nazdRV2xJdkVmWTJ3YjBSS1FY?=
 =?utf-8?B?WW5UZWl3VVRKb1EyT3pQY3dSUmlNQ3RlNUR2a0VnTXdVWVVPWGV4TUlPb1Qz?=
 =?utf-8?B?T3lLajNwNFVuV2FXM3hxQ05XMm9tSUxWbk1Jd3Q2a1JjNmFTaVJlVHBZVEVw?=
 =?utf-8?B?TXNPblg3eE1kbnRtcGpTTi9lWXBIb1NXY1JuaHM3Z3BuMkhwQWxwVSsrZVh2?=
 =?utf-8?B?UE5rejJUdWgrSEVmZTBGOUFSRXQvMWc3d0IwTytxY2dCWXFTZkZTR0RsVXVv?=
 =?utf-8?B?UEs2Rkc2QzBnR0YvQUdadkg0V0g5YUFaYnFxWEZJdnJsbEpRcnJQNjNkZjlM?=
 =?utf-8?B?dk90alZJMGY5eE9aaWtNcDA3ang3RGRQT0oySm5JNnV1MWdTUHRJZjJ6NkZw?=
 =?utf-8?B?V0F6Q0hEOVBka2pjRU12WUtobjMwSTZSYUEycUV6QWYvaUNMTFBiZ2JIemd6?=
 =?utf-8?B?N0hlTnRKSEpvaXpPS2NBSHN3RTh5NGhXQkdON29BYlp3V21ScnBTWllOSlFh?=
 =?utf-8?B?bjQ3NTQ4MGpWK3h6ZEZYSUZUbFRpTGRKUS9JZzFNb2ZrNmhmTStESDkrL3Jl?=
 =?utf-8?B?QTM3Mm5Mb2w0cG1Td1JOSFVaQWpiWHkzd3c5OHNjRGUrREZ1cUNKTXZsV0J0?=
 =?utf-8?Q?NdN1J7kj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 16:29:01.7439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 246bfdf2-f310-4464-bb71-08d8b32957ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikGHeZjCNdycW4EuMk4fuBTAaWD0Uo+qCQOGfUrglRgH7drl7fZ7xRlcQte8SDZx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
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
Cc: alex.sierra@amd.com, philip.yang@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDcuMDEuMjEgdW0gMTc6MTYgc2NocmllYiBGZWxpeCBLdWVobGluZzoKPiBBbSAyMDIxLTAx
LTA3IHVtIDU6NTYgYS5tLiBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4KPj4gQW0gMDcuMDEu
MjEgdW0gMDQ6MDEgc2NocmllYiBGZWxpeCBLdWVobGluZzoKPj4+IEZyb206IEFsZXggU2llcnJh
IDxhbGV4LnNpZXJyYUBhbWQuY29tPgo+Pj4KPj4+IFt3aHldCj4+PiBUbyBzdXBwb3J0IHN2bSBi
byBldmljdGlvbiBtZWNoYW5pc20uCj4+Pgo+Pj4gW2hvd10KPj4+IElmIHRoZSBCTyBjcmF0ZWQg
aGFzIEFNREdQVV9BTURLRkRfQ1JFQVRFX1NWTV9CTyBmbGFnIHNldCwKPj4+IGVuYWJsZV9zaWdu
YWwgY2FsbGJhY2sgd2lsbCBiZSBjYWxsZWQgaW5zaWRlIGFtZGdwdV9ldmljdF9mbGFncy4KPj4+
IFRoaXMgYWxzbyBjYXVzZXMgZ3V0dGluZyBvZiB0aGUgQk8gYnkgcmVtb3ZpbmcgYWxsIHBsYWNl
bWVudHMsCj4+PiBzbyB0aGF0IFRUTSB3b24ndCBhY3R1YWxseSBkbyBhbiBldmljdGlvbi4gSW5z
dGVhZCBpdCB3aWxsIGRpc2NhcmQKPj4+IHRoZSBtZW1vcnkgaGVsZCBieSB0aGUgQk8uIFRoaXMg
aXMgbmVlZGVkIGZvciBITU0gbWlncmF0aW9uIHRvIHVzZXIKPj4+IG1vZGUgc3lzdGVtIG1lbW9y
eSBwYWdlcy4KPj4gSSBkb24ndCB0aGluayB0aGF0IHRoaXMgd2lsbCB3b3JrLiBXaGF0IGV4YWN0
bHkgYXJlIHlvdSBkb2luZyBoZXJlPwo+IFdlIGRpc2N1c3NlZCB0aGlzIGEgd2hpbGUgYWdvIHdo
ZW4gd2UgdGFsa2VkIGFib3V0IHBpcGVsaW5lZCBndXR0aW5nLgo+IEFuZCB5b3UgYWN0dWFsbHkg
aGVscGVkIHVzIG91dCB3aXRoIGEgZml4IGZvciB0aGF0Cj4gKGh0dHBzOi8vcGF0Y2h3b3JrLmZy
ZWVkZXNrdG9wLm9yZy9wYXRjaC8zNzkwMzkvKS4KClRoYXQncyBub3Qgd2hhdCBJIG1lYW50LiBU
aGUgcGlwZWxpbmVkIGd1dHRpbmcgaXMgb2ssIGJ1dCB3aHkgdGhlIAplbmFibGVfc2lnbmFsaW5n
KCk/CgpDaHJpc3RpYW4uCgo+Cj4gU1ZNIEJPcyBhcmUgQk9zIGluIFZSQU0gY29udGFpbmluZyBk
YXRhIGZvciBITU0gcmFuZ2VzLiBXaGVuIHN1Y2ggYSBCTwo+IGlzIGV2aWN0ZWQgYnkgVFRNLCB3
ZSBkbyBhbiBITU0gbWlncmF0aW9uIG9mIHRoZSBkYXRhIHRvIHN5c3RlbSBtZW1vcnkKPiAodHJp
Z2dlcmVkIGJ5IGtnZDJrZmRfc2NoZWR1bGVfZXZpY3RfYW5kX3Jlc3RvcmVfcHJvY2VzcyBpbiBw
YXRjaCAzMCkuCj4gVGhhdCBtZWFucyB3ZSBkb24ndCBuZWVkIFRUTSB0byBjb3B5IHRoZSBCTyBj
b250ZW50cyB0byBHVFQgYW55IG1vcmUuCj4gSW5zdGVhZCB3ZSB3YW50IHRvIHVzZSBwaXBlbGlu
ZWQgZ3V0dGluZyB0byBhbGxvdyB0aGUgVlJBTSB0byBiZSBmcmVlZAo+IG9uY2UgdGhlIGZlbmNl
IHNpZ25hbHMgdGhhdCB0aGUgSE1NIG1pZ3JhdGlvbiBpcyBkb25lICh0aGUKPiBkbWFfZmVuY2Vf
c2lnbmFsIGNhbGwgbmVhciB0aGUgZW5kIG9mIHN2bV9yYW5nZV9ldmljdF9zdm1fYm9fd29ya2Vy
IGluCj4gcGF0Y2ggMjgpLgo+Cj4gUmVnYXJkcywKPiAgwqAgRmVsaXgKPgo+Cj4+IEFzIERhbmll
bCBwb2ludGVkIG91dCBITU0gYW5kIGRtYV9mZW5jZXMgYXJlIGZ1bmRhbWVudGFsbHkgaW5jb21w
YXRpYmxlLgo+Pgo+PiBDaHJpc3RpYW4uCj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IFNpZXJy
YSA8YWxleC5zaWVycmFAYW1kLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5n
IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgo+Pj4gLS0tCj4+PiAgwqAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgMTQgKysrKysrKysrKysrKysKPj4+ICDCoCAxIGZp
bGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPj4+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4+PiBpbmRleCBmNDIzZjQyY2I5YjUuLjYyZDRkYTk1ZDIy
ZCAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
Ywo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4+PiBA
QCAtMTA3LDYgKzEwNywyMCBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZXZpY3RfZmxhZ3Moc3RydWN0
Cj4+PiB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4+PiAgwqDCoMKgwqDCoCB9Cj4+PiAgwqAgwqDC
oMKgwqDCoCBhYm8gPSB0dG1fdG9fYW1kZ3B1X2JvKGJvKTsKPj4+ICvCoMKgwqAgaWYgKGFiby0+
ZmxhZ3MgJiBBTURHUFVfQU1ES0ZEX0NSRUFURV9TVk1fQk8pIHsKPj4+ICvCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZG1h
X3Jlc3YgKnJlc3YgPSAmYm8tPmJhc2UuX3Jlc3Y7Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqAg
cmN1X3JlYWRfbG9jaygpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGZlbmNlID0gcmN1X2RlcmVmZXJl
bmNlKHJlc3YtPmZlbmNlX2V4Y2wpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChmZW5jZSAmJiAh
ZmVuY2UtPm9wcy0+c2lnbmFsZWQpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfZmVu
Y2VfZW5hYmxlX3N3X3NpZ25hbGluZyhmZW5jZSk7Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqAg
cGxhY2VtZW50LT5udW1fcGxhY2VtZW50ID0gMDsKPj4+ICvCoMKgwqDCoMKgwqDCoCBwbGFjZW1l
bnQtPm51bV9idXN5X3BsYWNlbWVudCA9IDA7Cj4+PiArwqDCoMKgwqDCoMKgwqAgcmN1X3JlYWRf
dW5sb2NrKCk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4gK8KgwqDCoCB9Cj4+PiAg
wqDCoMKgwqDCoCBzd2l0Y2ggKGJvLT5tZW0ubWVtX3R5cGUpIHsKPj4+ICDCoMKgwqDCoMKgIGNh
c2UgQU1ER1BVX1BMX0dEUzoKPj4+ICDCoMKgwqDCoMKgIGNhc2UgQU1ER1BVX1BMX0dXUzoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
