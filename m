Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5A52FB63E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 14:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12A06E29D;
	Tue, 19 Jan 2021 13:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107596E296;
 Tue, 19 Jan 2021 13:08:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1G5y2GEa+FOw1bG5DZYZXn4utH/5F4vzA9SCieKvk9y8oCCmW58eSz/DLyEz9pyZMc7Sn+cgj48P4SkvB3cYl6u5RO6RsFPHjXCdgdpL1MYId/O3l405ea8YEFRhzyZ/hGfysf+H8Mogtyv9ojbkKSnIg3eRC5zCU9HM/qfzZBfx3eiDpZ4s1ukNFbZXQn2McuZW3X1RBOemiQXjomDs344nGXOFgJ1vbWafpz9KY/URG3jExYpt1ukBDZ4TOEKx5Kv+jeBpaIALUCAxR5GDVtFYl+S1md5ZfGQrp6G1GYzA+rfk+GbAfps+E6H28MlwTaubpaU4iLMbmzhmmJu3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WX9IM1tlEj32e3zQ5ANbYKDQM5RclzwUc+IcQtYb6ps=;
 b=FWVfCCUIOACVvjDDBXveGDnhaJPMOG4cy8PyrQcfo6FLIXL8wj8nk/1S6hObH/DsQsnukWWYAgtt45tw2o8k4mkhWMdu2IeOvPKVQ8T/UVRM8PD2+hIBEzMo99ykDDjZ1b5JHGgVBngyG7eJsVj1cid4jUgWlo+ipJ4pmytVNGtrTAHmMAXJ9/4AzdaeiA/mAaYOmRUUasfFa0SmTKBILhWkmrJgbdpNa0PYLmRZp6eSSxG52Hama7K9XkARfw8udtBgzq/B+mXCLnfzylyzIbMaxbpx5uLhKEZP8+tf7dGEWTqf9/45VKdlzs22X75vfrVe0S1O0/PBeuL8PxzFTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WX9IM1tlEj32e3zQ5ANbYKDQM5RclzwUc+IcQtYb6ps=;
 b=ZWHY2BLPZydKF5bWLjtGX9FcoCfaB/B3M3vMQIMgmzneP0i5mbsflTWcym2a00vnJiN0PHF7Ig2Ob0wsVlXkPIock9REvp6qRhep2nvQQv/a2YAxUJ7IL48KvnJDlNEJ8+zd6FGDfEPx8L/xztDd6NhQbFrV9/syTTMB4qiRjik=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BYAPR12MB2759.namprd12.prod.outlook.com (2603:10b6:a03:61::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Tue, 19 Jan
 2021 13:08:23 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::5927:a80d:11c4:529a]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::5927:a80d:11c4:529a%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 13:08:23 +0000
Subject: Re: [PATCH] drm/syncobj: Fix use-after-free
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210119130318.615145-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <dd14c09f-acbe-3fa5-2088-a68951847707@amd.com>
Date: Tue, 19 Jan 2021 14:08:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210119130318.615145-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR04CA0111.eurprd04.prod.outlook.com
 (2603:10a6:208:55::16) To BY5PR12MB3764.namprd12.prod.outlook.com
 (2603:10b6:a03:1ac::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0111.eurprd04.prod.outlook.com (2603:10a6:208:55::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 13:08:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2be7e365-693e-47bb-4231-08d8bc7b4c9d
X-MS-TrafficTypeDiagnostic: BYAPR12MB2759:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2759AE4F21D5B23ACAA1BC0883A30@BYAPR12MB2759.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y9GkV7ZxoBrECl7MSzHC/S0dySu0Qv/EcwVH9XYGCxRcfh+1qKASM/9Xtjchg7k7iL/cfzqsgJc+gl2YH6EjrKY3/RB/SEZaOOd3iA3pMxISqwEaScUIqSzr3c2/bGNoZP0OITNvevAEaDA+f2yhZbmwM/KdLP/LhCx0UepxnTY58FhEH/vnMcMgasdg7LZMo9qKEjjaIZeePSuiporBwVKx1EXPjJkT2a5lb0lJ3rASCF+pgFFV9V9MGNr6udmOlF85NSUwXVTXc1HZeiIns+H5gUJXZEUMjapyVyl1XVMtvPzPKY1HvqNBY+nAJAleLEYOAEz38nzJROlu9Mrp3eU4xy3rBM3mpYvJn/3eaugknRhtURJ0k/C0M2O4Mr/MDhYKAdqjfkoFAv+dYYqhMGMwCm5Tjo2go+fSL3xj7piUf5lXsGnLEhs8/zrq6uXaLD4mSs8ZKGawPrMIBVVnNfWn1v7ACESu3AtNPIHvhnA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3764.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(54906003)(4326008)(52116002)(36756003)(16526019)(31686004)(186003)(86362001)(5660300002)(8676002)(478600001)(8936002)(31696002)(316002)(7416002)(2906002)(83380400001)(6666004)(66556008)(66946007)(66476007)(2616005)(110136005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZTBDaHJIbkZGWGlUZ3NsU1NUUmlFMlZnMGc4TEQzUWdMejQvZzIyRGdIT2Rq?=
 =?utf-8?B?bzBlMXBLYm5YTVluQytHY2lUa2x6S2NKUEJYRk9tR0N6SXc3WGRzL2FPckpB?=
 =?utf-8?B?UVBGWGtyUTAzTlFMQnVXb2JhUUJEbW01aFpLQzIyT2J3MHR3TVJmdmdORnBq?=
 =?utf-8?B?UXdQZFluZGd6M2hwMi9jays4ZWRHUlhCWldVUzdvd2JZelM0azVGRDlrUmJP?=
 =?utf-8?B?Z2JONHMvMFJsSWh1cGhDMGdBN2VFd2EzK1NuZVExeFptdnJKMDlsTjZITHJs?=
 =?utf-8?B?dUNiRGdrb2VYSnpuMElCK0x2ZGJ6RklST09ZZnZmQk5CTzFpSHVhazFSemR4?=
 =?utf-8?B?S3J5L0xLZHVWbE9icHdaYk9YN1ZGaWhIY3Z4eEhmTkxoMHoxeC9vTDBkeS9V?=
 =?utf-8?B?bzVvQXAyZWk3b0h6MHlZL3FCMmEyQXhKTUk3ZjczR2JxdUpMZHF2aVl4aDJX?=
 =?utf-8?B?TWZ6VTZ3UUFFYlRMV0ZaYXlCUzVFcWo1d2llakJNam1KbEI5dzI5NlZXNTdn?=
 =?utf-8?B?QUF1cDJybFdLelJvVm1RbXdJbzNoRUVHZlY1eitycEdCVEpmNXpVb3dPaGw4?=
 =?utf-8?B?bVo4Zk1YVWFqNTgzTWg0UjNjMGtTYTNDbVhRU2FJNiswejNSc3RFR1VEWllo?=
 =?utf-8?B?RFk1WXdyS2cvLzE2Y3U1Zjl3T2ZNQ3BUTStsVjNxSEdQeUMvWGdiSkh1azl4?=
 =?utf-8?B?NFlYZm5LR0FiRXUzQm9haTdtZ1kvaVR4WWsveVpwWEV6Q3ZycUdXSHRJa0p4?=
 =?utf-8?B?NEhLS1dhc1dUM1R2MVhuVDBISVcySUpJUkRNM0lYUnpOWENpb1F1amdJWnhk?=
 =?utf-8?B?QzVVTGFjczFyYU02d1BHRzI2VWpyY05saDd4aVNRTUpMaEJ1QWhHSHdqbVRx?=
 =?utf-8?B?YkxQejFERjdYTjFKOVJkbDFUR2NDelQrTWtMdzR0cGNISkZObXh0NEVnNDhv?=
 =?utf-8?B?T284SnRkTjc2eEc3RnRXUDJiZjJySEN0NC9mOHVweWlJS1NQOEhvTVgyUzd4?=
 =?utf-8?B?Y1Y4UHpZOWNWemoraEhJZ3BTeVQ5UEg2WlNMK1dYeTZpVk50SGJoZTY4azky?=
 =?utf-8?B?aTFQaU9BTE9ndEpNb01IU2tkYVlBQ0UyUVVmbzVMVlNyYTNkQ0RiYmVpU2Zo?=
 =?utf-8?B?UUx3U3dmM3Z5WGo1ZkRZY2VkVVZvN01qemFySHRCTzAwa213RzJJUFdMNEJS?=
 =?utf-8?B?dCtzdzl5WW5TNkwxcXZCL0FnYXB5dms0MHJVaXVrMmtZeEcwSE1RWGZxTmND?=
 =?utf-8?B?cjNuZzVMSWtqUzlicWNiWTArRzhGNEhnR3hKdndKRXVGR2RsZ2ZMZFNCR0Fi?=
 =?utf-8?B?eWZnQnJvQUREMlFKN1ZtNlQ4d1VNd1NxYXVDVTFLVHFaek5TT2V5N2ZJKzcw?=
 =?utf-8?B?bFl0Y2o2cHN4am01UUNkWHNLbmFLcjVVZ1FLVDl0NEprUmNkZy9YZXZJZzdp?=
 =?utf-8?Q?cLZN3luC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be7e365-693e-47bb-4231-08d8bc7b4c9d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 13:08:22.8806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47CeL49NYaar8sqp+lD2WPL395CM9KbNhDJNArknVnOh4oVSCQJ09GcJzsSBeuXy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2759
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTkuMDEuMjEgdW0gMTQ6MDMgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IFdoaWxlIHJldmll
d2luZyBDaHJpc3RpYW4ncyBhbm5vdGF0aW9uIHBhdGNoIEkgbm90aWNlZCB0aGF0IHdlIGhhdmUg
YQo+IHVzZXItYWZ0ZXItZnJlZSBmb3IgdGhlIFdBSVRfRk9SX1NVQk1JVCBjYXNlOiBXZSBkcm9w
IHRoZSBzeW5jb2JqCj4gcmVmZXJlbmNlIGJlZm9yZSB3ZSd2ZSBjb21wbGV0ZWQgdGhlIHdhaXRp
bmcuCj4KPiBPZiBjb3Vyc2UgdXN1YWxseSB0aGVyZSdzIG5vdGhpbmcgYmFkIGhhcHBlbmluZyBo
ZXJlIHNpbmNlIHVzZXJzcGFjZQo+IGtlZXBzIHRoZSByZWZlcmVuY2UsIGJ1dCB3ZSBjYW4ndCBy
ZWx5IG9uIHVzZXJzcGFjZSB0byBwbGF5IG5pY2UgaGVyZSEKPgo+IFNpZ25lZC1vZmYtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IEZpeGVzOiBiYzljODBmZTAx
YTIgKCJkcm0vc3luY29iajogdXNlIHRoZSB0aW1lbGluZSBwb2ludCBpbiBkcm1fc3luY29ial9m
aW5kX2ZlbmNlIHY0IikKPiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgo+IENjOiBMaW9uZWwgTGFuZHdlcmxpbiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRl
bC5jb20+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5p
bnRlbC5jb20+Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiBDYzog
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
Pgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IDxzdGFibGVAdmdl
ci5rZXJuZWwub3JnPiAjIHY1LjIrCgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3lu
Y29iai5jIHwgOCArKysrKy0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNv
YmouYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCj4gaW5kZXggNmU3NGU2NzQ1ZWNh
Li4zNDkxNDYwNDk4NDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2Jq
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+IEBAIC0zODgsMTkgKzM4
OCwxOCBAQCBpbnQgZHJtX3N5bmNvYmpfZmluZF9mZW5jZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVf
cHJpdmF0ZSwKPiAgIAkJcmV0dXJuIC1FTk9FTlQ7Cj4gICAKPiAgIAkqZmVuY2UgPSBkcm1fc3lu
Y29ial9mZW5jZV9nZXQoc3luY29iaik7Cj4gLQlkcm1fc3luY29ial9wdXQoc3luY29iaik7Cj4g
ICAKPiAgIAlpZiAoKmZlbmNlKSB7Cj4gICAJCXJldCA9IGRtYV9mZW5jZV9jaGFpbl9maW5kX3Nl
cW5vKGZlbmNlLCBwb2ludCk7Cj4gICAJCWlmICghcmV0KQo+IC0JCQlyZXR1cm4gMDsKPiArCQkJ
Z290byBvdXQ7Cj4gICAJCWRtYV9mZW5jZV9wdXQoKmZlbmNlKTsKPiAgIAl9IGVsc2Ugewo+ICAg
CQlyZXQgPSAtRUlOVkFMOwo+ICAgCX0KPiAgIAo+ICAgCWlmICghKGZsYWdzICYgRFJNX1NZTkNP
QkpfV0FJVF9GTEFHU19XQUlUX0ZPUl9TVUJNSVQpKQo+IC0JCXJldHVybiByZXQ7Cj4gKwkJZ290
byBvdXQ7Cj4gICAKPiAgIAltZW1zZXQoJndhaXQsIDAsIHNpemVvZih3YWl0KSk7Cj4gICAJd2Fp
dC50YXNrID0gY3VycmVudDsKPiBAQCAtNDMyLDYgKzQzMSw5IEBAIGludCBkcm1fc3luY29ial9m
aW5kX2ZlbmNlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2YXRlLAo+ICAgCWlmICh3YWl0Lm5v
ZGUubmV4dCkKPiAgIAkJZHJtX3N5bmNvYmpfcmVtb3ZlX3dhaXQoc3luY29iaiwgJndhaXQpOwo+
ICAgCj4gK291dDoKPiArCWRybV9zeW5jb2JqX3B1dChzeW5jb2JqKTsKPiArCj4gICAJcmV0dXJu
IHJldDsKPiAgIH0KPiAgIEVYUE9SVF9TWU1CT0woZHJtX3N5bmNvYmpfZmluZF9mZW5jZSk7Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
