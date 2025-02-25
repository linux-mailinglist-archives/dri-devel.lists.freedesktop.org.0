Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A55DA44528
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 16:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2EF10E737;
	Tue, 25 Feb 2025 15:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="Tqd4fvvn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010006.outbound.protection.outlook.com
 [52.103.68.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8908E10E736
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 15:59:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GET0Ftb7i/9xhIJqC/WWSnXctI7pCsr/grkKkaCK/a1FaYMSmM2UjaqIbRhxqey77CvFGUn7fttJ3MxEl26nDD6rATjRoinqZHwo4Bg9sykncCWvSa2lBgZuOyXWQ4uW4+xK78WkNr428Kk1nm7QmF461UiRTT+Z+1NLKh0GQpwkhMJR1zywY5VzAfInO26DCKG4vUE126xfD84Hf5Yh/Mzz9qUauiPlefKvcDzivezw/MPnh8IHLpu3ttnBHUFpuU2FIYioOY4TEIrlsnUYu8+zsAly/sJKSDB10wZjQrRPlZMY2OSJbYEXSm8rvO8AC33E58av68sA1qkJpaMWUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iM3uUh8dRAxTBdDNW01hlJQQzHDDdB9FIOP5Qxu5PXg=;
 b=TCCYUjSWb0GapCHdhPrLWX+l9pXET/pNucy+6LyXuncSRwK9/wXdJgMvamPdxLmG0xGXdFqDhF+RydzwPNJ69a/UPprMOKKzY9R24L12o2lltXvCyvZqOwz7+SKrjr5ov/dWybhuuOvF67OFBxwk/TrG57efwteQ9Oks/nvhSDlsDv2ehd4pB7Bod8KvfdgPA8/7c0/0fwYP41/fWKjuiP+bG5pldNA8iW7j36KnO6ib7KZeIFo2oSPpDwxUyLVHSN9syDPS2QuhJ5k1Tx+lQYFNZm8xDSt1UIvXpJE5VhKklzBt36pFk6tRJpXV/wbidOPz3G+5+9M97nxvc0A7yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iM3uUh8dRAxTBdDNW01hlJQQzHDDdB9FIOP5Qxu5PXg=;
 b=Tqd4fvvnzdd4dToKkFV+nuo50mWqGoPJY9HM7VfrCrzKXXw000fz+mvtZx7zGOcUoH1xgkuTF+cseJqah2CmXKX+Z+7112Lt2KZJJC5rCfTVVf2L1gfnlxJxD4Jw+mggWaxoO/cS1tOvHI6rW4uyyRe20XuIDnZkODszIY5se3ooIgcmHVzz6mZKmGsPYBmdB+ZGCJT+cqq816nfugjr95/kVVZZ/QcRTuiN10bhE9Dp2BWnrLDvc88/1XA97pcOeijRFhFGPYQuYmbaJHCE/zmxuPSadem4LdrQVa6x4KVroIhGf2kytPskLdPGsBkoo6+ZNRNjcvdymDkQs2+OgA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB10270.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1e7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 15:59:05 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 15:59:05 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay
 <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi
 <admin@kodeit.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v5 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbh21jOPDlavrp2kW5T/JI6UK95bNX0p8AgAAXooCAADE6yoAABIsAgAANgVo=
Date: Tue, 25 Feb 2025 15:59:05 +0000
Message-ID: <PN3PR01MB95974332177D7F0BE12F8E0EB8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <3457BF95-0E50-4B70-86DE-EE5EE95D3ACE@live.com>
 <4D7C00B4-7B75-4715-8D37-0059B22C030D@live.com>
 <Z72chunE_vvxtjLQ@smile.fi.intel.com>
 <c0249cd8-68e4-4860-b5c3-e054df10ae30@suse.de>
 <PN3PR01MB9597287D0FFDBD11CC1F6167B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597C59E8708992B35954EC2B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN3PR01MB9597C59E8708992B35954EC2B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PR01MB10270:EE_
x-ms-office365-filtering-correlation-id: 982c46a9-6e07-47dd-e1f3-08dd55b5547a
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|19110799003|12121999004|461199028|6072599003|7092599003|15080799006|8060799006|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?azBkV0RGREoxTlV0TEF1blRNcmNMdjZYNzZVeXIraEVoSmhTOE9UdGZJUy9D?=
 =?utf-8?B?emxobUlRRjV5T21ad1lOWUJGYXkwRTBjSjV4Zk51eS9mRStRV1cyV2hSWkFE?=
 =?utf-8?B?Q3RnN2NCOHYzRENaS1EzWTJ0Rzc2UDVsQktlSzZOSVVCM3UzdFcxM3JVUDFI?=
 =?utf-8?B?RFZhcmFKTHNaMEx5NDRuSEhvNGtJakkzaVp0dE9iNjlFRFI5aHUxMHF2emJp?=
 =?utf-8?B?OTZ1b3lINmQ5YTBEVnZmbEx2VWE4eFEwSzUwSmwyREwxcHJOV3h3WjFXRG1I?=
 =?utf-8?B?MnVzQzlPV1ZpZ1paYlZ2ZFgrOEJ5SzBGSFpnREx5SGJ3VTNLTE1WVDdIQmtQ?=
 =?utf-8?B?d0JRV0NoNCtxcjI1OTF6Zy9kRzZnWEdlZXlYTm9WZXViMjZldDRiMm5SRGhh?=
 =?utf-8?B?UkZiWWdxbDkrL0ZCMC93U1NobjJJelRHeTI5T2hMSklqdTdkUkFXaWxMaXBt?=
 =?utf-8?B?Y3NKOUIxellMQVJGeG1jcUMzYnpycHo0L0o3T3lqUEJiZUdUNC9FSllRYWRO?=
 =?utf-8?B?SXdnQkNaVXdOYWxjSHhrSzdDdlBsSzVFQmJUNzBpdkJFbTRsVFZDR1VyN2dF?=
 =?utf-8?B?UXlQL1plcUNJYTBFQW1xYVRraWxCK0QrOUJvQVUwRW93ejJManlYVG9oUTky?=
 =?utf-8?B?a2NYbENjdFdEM01ER1lmY2NtNTRSZU5FNnlURXdyN2REbUdQeHVwK1JmMzV1?=
 =?utf-8?B?aWtVek5PSnNGTytuMXNQaXJBb0lRMklZTkhMbWlRT1B3RnBUMFBlc29odExy?=
 =?utf-8?B?dElTZkdyUkJMb3hGYXVBTW5JWG1DaFAycm5rQlc2YTZ3cDZza0NaRWNYV0Fk?=
 =?utf-8?B?cFJRYmp6KzFsZGhCVE03cVNrWnYzeER6Z0crdzN6cGtaSC83YW1Pc2ptQnFI?=
 =?utf-8?B?ZWRvNXlwSTZOdVdqSkg0cHN5RURzU0NaeXB0Z0Q0VTdReVNEb2lpTWtaZ1BX?=
 =?utf-8?B?ZUU2bTk5bFBnNzRDc2x4cDFVV0RyTVZjTjlUcElFbjJkVWgvekZHem1ydlBL?=
 =?utf-8?B?SlJ3dzJVODlaYUtJWlJ3TnFIc2VScFF0N0ZkamxZUkVzVVcxRyt6MHVqYWdx?=
 =?utf-8?B?a3ZPNjcvY09ZRGlRN2djVVZIZHZYUWtlbHpxRk5Sc2NXNXR3V0szTVlqR3Jr?=
 =?utf-8?B?KzN6SlBrYXU2aDVkZ0g1NUwvYUZLU3VoWldRaGlsdkZMaTJVMENNWXZ0bTF3?=
 =?utf-8?B?U2pTeGRGYU9Hd2NKYTdCUHdiS0ZtUFZhQXE1NnlZRWdTbDR2VXFYL3B3MW8v?=
 =?utf-8?B?WWU1eTZLQUo1clBVemVFMmFtV1dOMEJBVnpiTXVUeXRvWmM1aSszeW5ONnh2?=
 =?utf-8?B?NlZCRVdFc3RrU1MreWsrTDFyYVBWZGkxaUtaYkpSRmJZbjgyY3RtL25keVpV?=
 =?utf-8?B?RzBoSVVTRjJuTElyQXh4TkpQUWFGa3VOMnN1R3lVWTZYb2Zud3VScFdXNUsw?=
 =?utf-8?B?TlZ6V3BMcERaQkQ3QnRjL1g0Yll4SWRVenNYcmVTb1ZtS2toaXZubnA3T21m?=
 =?utf-8?Q?7Yar8WC7r9+ZN0FSYfbnOxUiTa6?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nnp4ZUQ4WXRjUWIvY2NBbkc3OW9Xd1lhYzIyOFhPMnEvQXpvbDNQOW9yL3Qy?=
 =?utf-8?B?aWw0TmlnakU1RGI3TjkrU3JLeDc1WVh0V055VHZLR2xrUUhVK2xBZGRwVDJJ?=
 =?utf-8?B?bkUvY0k4MktnZklFRmRldVlmNG5qOGc2SFNrZ2tkdUpVRjlqSjMxNktBSTlk?=
 =?utf-8?B?eFFQMGRZTjVDUFpqQXlrczg4bGlRUUlSYWRCNWZGS3F0TlM2ZUdjcVczdE5Z?=
 =?utf-8?B?aUZvb2twNjZXLzhyZm5zOXFVejRoTU1SYUtZd0QzTnJ6TW53MzEwZGpnaDdl?=
 =?utf-8?B?SGV2ZjhSY1ErNkxKS1pXRGg0QTRNTjJodlM0cjhJWnQxdlVmS3FvajJlK3Rw?=
 =?utf-8?B?MXhSS2dwangxdElER1V4OUx4eVdBdEVYRDNkNlpoNUYyODhaQmF2S0UxNTcy?=
 =?utf-8?B?cVhmUzhxb3Z3SEVmZFNLd3k5ei84ZE9ac1ZINmNUendEaTJhY0xyd0xBZ3Z5?=
 =?utf-8?B?WGY0cmpja2ZBanJETGRMYXBBa3F2ZWdWL0VIWjRHRGtESWQ5T0Z4MHFJNm10?=
 =?utf-8?B?bFBCL2dkOHlnZVU5dlZMMTFOV0Ryb2tHMnJLNDkxUlBHZnM3dTlxMXU5aWJT?=
 =?utf-8?B?ckVuVEsxcVc4bDRaekVWVDlrTnJUZm1sVUNCZ1J2TkI5c3hibThmeis4bnV0?=
 =?utf-8?B?MmlHR1Y0QTRia0VJRGVycU5qdjZURXhZR1NWMFFmV1dqYi9KdG1uSU52TS81?=
 =?utf-8?B?TTZpZFk3a2ZPZ25nY1FJaUFvTklXZ3ZuOXFuL2dEU0ZuRTl6QnlOeE5TZEI0?=
 =?utf-8?B?RHBXbG5LRWN4czdEMURrMFpEcjBLTEExbmVuOEZ6clBmd1NuS1I1MVBHT0lR?=
 =?utf-8?B?OU1sZ0Fvb21TcytVTEdjaWV3Z21rN0JmaFkzTzl5K2JSelpWY1lNOEhzYWQv?=
 =?utf-8?B?ajdjSHhJbWRic3dJODVHbURvYW9qelNTa3M3VkN5QmdyMm9QYnZpV3cxRzYv?=
 =?utf-8?B?MGlaT3dzMlVoQ0JMczRoZzErd2lKZitWZzltdTRWekZOcDNzMk53b2VPQURX?=
 =?utf-8?B?bzQxVy8wWmRHV3I4Y3ZobHlyaDBIdG5KMVFXemkzUjhGZEVRUWJjaHU1SG1x?=
 =?utf-8?B?Q3puNWNYQXdOeTdkL0ZLM3BaMFV4RmFQODIyZTJiMGVES3dvVVdZanVFbnNH?=
 =?utf-8?B?Ylk2WTdsK3VRbW93aTNNcEQxd1pRNVNBZmNqRzc2Q1NxcVZsSVU3bWIwNjFW?=
 =?utf-8?B?SUZQVGoyODV0VEdUMzdWY2EwclZSMUR3dHBJVTdUbGw1NWhNRzZNaWVZT05R?=
 =?utf-8?B?Tk03d09tdW43QWZPSzJ5anVSTmFBSW1qYmJGS204cFZzYkNKM0UvNFIyRlg1?=
 =?utf-8?B?V1QwNUk5Y3JWcW0wVjF1Q09IaTV0RHE4L1RySGpsQzg5YjNmV2Q2MFJtRUxw?=
 =?utf-8?B?ZE9iY0JwMWw0cHM2SXJhd3NIczFkL1ZKWS9lK0tMdlVhSjUxWXg0QjVQS01x?=
 =?utf-8?B?WVQxUndkL3RuQnVveDdkY2dZc1R0NlF1SjNUM3R5UzVGVFJUY0tHdi9OMGVR?=
 =?utf-8?B?NlRjNU9oVnk1Q2JlQ1UvazBqZTYvaUdiWlJvY0VaQkorcXEyS3BrSm1LVVFW?=
 =?utf-8?B?MUMvNGI5eUFiV3JNUzBuUkNHQ0F6d2dnTnhuM1lWSnRuYzhhTXhQaWJueWh5?=
 =?utf-8?Q?w6yw6OqhLGCbS9C23KXhea87vqdSRuVPag3ZJgO62Zdk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 982c46a9-6e07-47dd-e1f3-08dd55b5547a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 15:59:05.1147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB10270
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gT24gMjUgRmViIDIwMjUsIGF0IDg6NDDigK9QTSwgQWRpdHlhIEdhcmcgPGdhcmdhZGl0
eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+IA0KPiDvu78NCj4gDQo+PiBPbiAyNSBGZWIgMjAyNSwg
YXQgODoyNOKAr1BNLCBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxpdmUuY29tPiB3cm90ZToN
Cj4+IA0KPj4g77u/DQo+PiANCj4+Pj4gT24gMjUgRmViIDIwMjUsIGF0IDU6MjjigK9QTSwgVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4+IA0KPj4+IO+7
v0hpDQo+Pj4gDQo+Pj4+IEFtIDI1LjAyLjI1IHVtIDExOjMzIHNjaHJpZWIgYW5kcml5LnNoZXZj
aGVua29AbGludXguaW50ZWwuY29tOg0KPj4+Pj4+IE9uIFR1ZSwgRmViIDI1LCAyMDI1IGF0IDEw
OjA5OjQyQU0gKzAwMDAsIEFkaXR5YSBHYXJnIHdyb3RlOg0KPj4+Pj4+IEZyb206IEtlcmVtIEth
cmFiYXkgPGtla3JieUBnbWFpbC5jb20+DQo+Pj4+Pj4gDQo+Pj4+Pj4gVGhlIFRvdWNoIEJhcnMg
Zm91bmQgb24geDg2IE1hY3Mgc3VwcG9ydCB0d28gVVNCIGNvbmZpZ3VyYXRpb25zOiBvbmUNCj4+
Pj4+PiB3aGVyZSB0aGUgZGV2aWNlIHByZXNlbnRzIGl0c2VsZiBhcyBhIEhJRCBrZXlib2FyZCBh
bmQgY2FuIGRpc3BsYXkNCj4+Pj4+PiBwcmVkZWZpbmVkIHNldHMgb2Yga2V5cywgYW5kIG9uZSB3
aGVyZSB0aGUgb3BlcmF0aW5nIHN5c3RlbSBoYXMgZnVsbA0KPj4+Pj4+IGNvbnRyb2wgb3ZlciB3
aGF0IGlzIGRpc3BsYXllZC4NCj4+Pj4+PiANCj4+Pj4+PiBUaGlzIGNvbW1pdCBhZGRzIHN1cHBv
cnQgZm9yIHRoZSBkaXNwbGF5IGZ1bmN0aW9uYWxpdHkgb2YgdGhlIHNlY29uZA0KPj4+Pj4+IGNv
bmZpZ3VyYXRpb24uIEZ1bmN0aW9uYWxpdHkgZm9yIHRoZSBmaXJzdCBjb25maWd1cmF0aW9uIGhh
cyBiZWVuDQo+Pj4+Pj4gbWVyZ2VkIGluIHRoZSBISUQgdHJlZS4NCj4+Pj4+PiANCj4+Pj4+PiBO
b3RlIHRoYXQgdGhpcyBkcml2ZXIgaGFzIG9ubHkgYmVlbiB0ZXN0ZWQgb24gVDIgTWFjcywgYW5k
IG9ubHkgaW5jbHVkZXMNCj4+Pj4+PiB0aGUgVVNCIGRldmljZSBJRCBmb3IgdGhlc2UgZGV2aWNl
cy4gVGVzdGluZyBvbiBUMSBNYWNzIHdvdWxkIGJlDQo+Pj4+Pj4gYXBwcmVjaWF0ZWQuDQo+Pj4+
Pj4gDQo+Pj4+Pj4gQ3JlZGl0IGdvZXMgdG8gQmVuIChCaW5neGluZykgV2FuZyBvbiBHaXRIdWIg
Zm9yIHJldmVyc2UgZW5naW5lZXJpbmcNCj4+Pj4+PiBtb3N0IG9mIHRoZSBwcm90b2NvbC4NCj4+
Pj4+PiANCj4+Pj4+PiBBbHNvLCBhcyByZXF1ZXN0ZWQgYnkgQW5keSwgSSB3b3VsZCBsaWtlIHRv
IGNsYXJpZnkgdGhlIHVzZSBvZiBfX3BhY2tlZA0KPj4+Pj4+IHN0cnVjdHMgaW4gdGhpcyBkcml2
ZXI6DQo+Pj4+Pj4gDQo+Pj4+Pj4gLSBBbGwgdGhlIHBhY2tlZCBzdHJ1Y3RzIGFyZSBhbGlnbmVk
IGV4Y2VwdCBmb3IgYXBwbGV0YmRybV9tc2dfaW5mb3JtYXRpb24uDQo+Pj4+Pj4gLSBXZSBoYXZl
IHRvIHBhY2sgYXBwbGV0YmRybV9tc2dfaW5mb3JtYXRpb24gc2luY2UgaXQgaXMgcmVxdWlyZW1l
bnQgb2YNCj4+Pj4+PiB0aGUgcHJvdG9jb2wuDQo+Pj4+Pj4gLSBXZSBjb21wYXJlZCBiaW5hcmll
cyBjb21waWxlZCBieSBrZWVwaW5nIHRoZSByZXN0IHN0cnVjdHMgX19wYWNrZWQgYW5kDQo+Pj4+
Pj4gbm90IF9fcGFja2VkIHVzaW5nIGJsb2F0LW8tbWV0ZXIsIGFuZCBfX3BhY2tlZCB3YXMgbm90
IGFmZmVjdGluZyBjb2RlDQo+Pj4+Pj4gZ2VuZXJhdGlvbi4NCj4+Pj4+PiAtIFRvIG1haW50YWlu
IGNvbnNpc3RlbmN5LCByZXN0IHN0cnVjdHMgaGF2ZSBiZWVuIGtlcHQgX19wYWNrZWQuDQo+Pj4+
Pj4gDQo+Pj4+Pj4gSSB3b3VsZCBhbHNvIGxpa2UgdG8gcG9pbnQgb3V0IHRoYXQgc2luY2UgdGhl
IGRyaXZlciB3YXMgcmV2ZXJzZS1lbmdpbmVlcmVkDQo+Pj4+Pj4gdGhlIGFjdHVhbCBkYXRhIHR5
cGVzIG9mIHRoZSBwcm90b2NvbCBtaWdodCBiZSBkaWZmZXJlbnQsIGluY2x1ZGluZywgYnV0DQo+
Pj4+Pj4gbm90IGxpbWl0ZWQgdG8sIGVuZGlhbm5lc3MuDQo+Pj4+IC4uLg0KPj4+PiANCj4+Pj4+
ICtzdGF0aWMgaW50IGFwcGxldGJkcm1fcHJvYmUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGYs
DQo+Pj4+PiArICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB1c2JfZGV2aWNlX2lkICppZCkN
Cj4+Pj4+ICt7DQo+Pj4+PiArICAgIHN0cnVjdCB1c2JfZW5kcG9pbnRfZGVzY3JpcHRvciAqYnVs
a19pbiwgKmJ1bGtfb3V0Ow0KPj4+Pj4gKyAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmaW50Zi0+
ZGV2Ow0KPj4+Pj4gKyAgICBzdHJ1Y3QgYXBwbGV0YmRybV9kZXZpY2UgKmFkZXY7DQo+Pj4+PiAr
ICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkcm07DQo+Pj4+PiArICAgIGludCByZXQ7DQo+Pj4+PiAr
DQo+Pj4+PiArICAgIHJldCA9IHVzYl9maW5kX2NvbW1vbl9lbmRwb2ludHMoaW50Zi0+Y3VyX2Fs
dHNldHRpbmcsICZidWxrX2luLCAmYnVsa19vdXQsIE5VTEwsIE5VTEwpOw0KPj4+Pj4gKyAgICBp
ZiAocmV0KSB7DQo+Pj4+PiArICAgICAgICBkcm1fZXJyKGRybSwgIkZhaWxlZCB0byBmaW5kIGJ1
bGsgZW5kcG9pbnRzXG4iKTsNCj4+Pj4gVGhpcyBpcyBzaW1wbHkgd3JvbmcgKGFuZCBpbiB0aGlz
IGNhc2UgZXZlbiBsZWFkIHRvIGNyYXNoIGluIHNvbWUgY2lyY3Vtc3RhbmNlcykuDQo+Pj4+IGRy
bV9lcnIoKSBtYXkgbm90IGJlIHVzZWQgaGVyZS4gVGhhdCdzIG15IHBvaW50IGluIHByZXZpb3Vz
IGRpc2N1c3Npb25zLg0KPj4+PiBJbmRlcGVuZGVudGx5IG9uIHRoZSBzdWJzeXN0ZW0gdGhlIC0+
cHJvYmUoKSBmb3IgdGhlIHNha2Ugb2YgY29uc2lzdGVuY3kgYW5kDQo+Pj4+IGJlaW5nIGluZm9y
bWF0aXZlIHNob3VsZCBvbmx5IHJlbHkgb24gc3RydWN0IGRldmljZSAqZGV2LA0KPj4+IA0KPj4+
IFRoYXQncyBuZXZlciBnb2luZyB0byB3b3JrIHdpdGggRFJNLiBUaGVyZSdzIHNvIG11Y2ggY29k
ZSBpbiBhIERSTSBwcm9iZSBmdW5jdGlvbiB0aGF0IHVzZXMgdGhlIERSTSBlcnJvciBmdW5jdGlv
bnMuDQo+Pj4gDQo+Pj4gVGhpcyBzcGVjaWZpYyBpbnN0YW5jZSBoZXJlIGlzIHdyb25nLCBhcyB0
aGUgZHJtIHBvaW50ZXIgaGFzbid0IGJlZW4gaW5pdGlhbGl6ZWQuIEJ1dCBhcyBzb29uIGFzIGl0
IGlzLCBpdCdzIG11Y2ggYmV0dGVyIHRvIHVzZSBkcm1fZXJyKCkgYW5kIGZyaWVuZHMuIEl0IHdp
bGwgZG8gdGhlIHJpZ2h0IHRoaW5nIGFuZCBnaXZlIGNvbnNpc3RlbnQgb3V0cHV0IGFjcm9zcyBk
cml2ZXJzLg0KPj4+IA0KPj4gT2sgc28gdGhpcyBpcyBhY3R1YWxseSBhbiBpbnRlcmVzdGluZyBj
YXNlLCBzaW5jZSBJIGFtIHRyeWluZyB0byBmaXggaXQuIFRvIGluaXRpYWxpc2UgdGhlIGRybSBw
b2ludGVyLCB3ZSBuZWVkIHRvIGluaXRpYWxpc2UgYWRldiwgYW5kIHRvIGluaXRpYWxpc2UgYWRl
diwgd2UgbmVlZCB0byBydW4gdXNiX2ZpbmRfY29tbW9uX2VuZHBvaW50cyBmaXJzdC4gU28gSU1P
LCB3ZSBjYW5ub3QgdXNlIGRybV9lcnIgaGVyZSwgYnV0IHJhdGhlciBkZXZfZXJyX3Byb2JlIGNh
biBiZSB1c2VkLg0KPiANCj4gU28gdGhlIG9wdGlvbiBoZXJlIGNhbiBiZToNCj4gDQo+IDEuIFVz
ZSBkZXZfZXJyX3Byb2JlIChpdCdzIG5vdCB0aGF0IG5vIERSTSBkcml2ZXIgdXNlcyBpdCkNCg0K
SSB0aGluayBpdCBzaGFsbCBhbHNvIG1ha2Ugc2Vuc2Ugc2luY2UgaXQgaXMgYSBVU0IgZGV2aWNl
IGVycm9yLCBub3QgYSBkcm0gZXJyb3IuDQo+IDIuIFJlbW92ZSB0aGUgbWVzc2FnZSAoc2VlbXMg
dG8gYmUgZG9uZSBieSBvdGhlciBkcm0gZHJpdmVycyBhcyB3ZWxsLCBJIHdvdWxkbid0IHJlYWxs
eSB3YW50IHRoYXQgdGhvdWdoKQ0KPiANCj4gDQo+IFRob21hcywgQW5keSB3aGF0IGRvIHlvdSB0
aGluaz8NCg==
