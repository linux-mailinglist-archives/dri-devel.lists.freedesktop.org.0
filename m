Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCB4A42813
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 17:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C02410E4D3;
	Mon, 24 Feb 2025 16:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="rQ98ywfz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011029.outbound.protection.outlook.com
 [52.103.68.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5692710E478
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 16:39:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m01gHUemZ7Uvy7OdYe1582i1JITmx6dAFTee7BPPeNe/XTbB6DHX825vroXy0RKI8lbMbDJNwM9MP3zpBqwd8ukqHqhlhyzt0jD1I6sO4/6ZVblmNNeP2Ab2raghG4hjjp9Ww/4GAZ3tpWzfH39Plb/2nqDlDqqesV5fvsCIvjVyyEtZkwp/XyYuODCr4ZzUT/gpX2ZBWtC4dJMqvyjujr+JR9oekc9gGEkO3TQjkLdXJXEzGkGz0bWMwES41JmE10scozcgNzAYxb6ZZtMi9oCMlbFsQrKLTNpk7lUI3iwVGlvnOLnbStUiGTXPmd3HSR7OVR5qj0LSxa7QDXAG3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rgnkcky6BCKcL+a6vVlCdxu95s9vrw7hL4Qwt6eSqM=;
 b=jiDvDi6WeSBSskbXNWpxEeOr3fQQtqqLf0ecfFW3mMiGNXASFkQM909XQC3vpBvwfQGO/UlCVS2sGz+KMTuRlGqQTVGocqfACpTMv6wKQQ+seA4tSw+42FMn9c44Kipln2CuuRxrNy4yj6flgokESz0sOArAUsM9qIGXeLIsmJ1nSjCGXfUOTrJCaoPpnxGdaobCHSLBGvKDjVcaBfeLsm3xlHkI2SdmGaZrQ6G1zHhYQ4JbGfoZzOp95YQ51lqksA9LSOUt/7YY17brZoFJuYizfox01Rw5rwX4z81YkAi8qIJTy2XRXoqKpMVpQHXSD5SHN+1eHf4mqtvg1FmCUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rgnkcky6BCKcL+a6vVlCdxu95s9vrw7hL4Qwt6eSqM=;
 b=rQ98ywfzw7uPqQ9y47/gSYIiy5QVLpBVCJxHh6aYQYQ2jkF52WvWHMGJCNAmkZOj5GjOCJWDUlslVcOA82eEulAAbHxB3bZzoJzeUogBfTJet9FeHPMYB3y1d7AJb9JEHD5NXwdwze1jEoFk1zBKl1EocHzWksj89+s/WPZcc42YulH8syIB9+SyLsn/vNWxN4EwCdbY+bJ03byMLO2YzyOQCO0MwmgkoLkUdscuX0QS5sd9R/PEhSV80MKnDexPj8s6ENuq0ubdz6NOxVL6eb1zxG+8v2idrxW6lIm/5G6dsdVZDbEnrJ8Q0k46qx/cydvt2bMvTdpdBfknGp1bAA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB9631.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:107::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 16:38:59 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 16:38:59 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbhsGm46fWR/3mxEipqc6+PMbxkrNWe38AgAAI1YCAAAcMAIAAAaKAgAACOwCAAAJQAIAAA7BUgAABjYCAAACPR4AAA3gAgAABCXSAAAUggIAABrYl
Date: Mon, 24 Feb 2025 16:38:58 +0000
Message-ID: <PN3PR01MB9597E607DC472FA07A82CAF4B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <Z7yMIC1wxm0AGBCt@smile.fi.intel.com>
 <PN3PR01MB9597D4FD9FD8B8A8FB0F2B3CB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB959729DB53C0D359F8A83292B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7ySdcYWZjCVd-7v@smile.fi.intel.com>
 <PN3PR01MB959780B670AB514305790D8BB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7yV1rvSM2OPW_un@smile.fi.intel.com>
 <PN3PR01MB95976A734F6763F1574FC7EAB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7ybAVd3pNAhQemw@smile.fi.intel.com>
In-Reply-To: <Z7ybAVd3pNAhQemw@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PR01MB9631:EE_
x-ms-office365-filtering-correlation-id: 766c70e0-accb-41f8-d61b-08dd54f1bc82
x-microsoft-antispam: BCL:0;
 ARA:14566002|7092599003|6072599003|461199028|15080799006|8060799006|12121999004|19110799003|8062599003|3412199025|440099028|102099032|12091999003;
x-microsoft-antispam-message-info: =?utf-8?B?bnVmWDJ4cTVXZDk0L05vTXB3Y0NoU1lLdW53U01pSkYwU0dZbTVaYnp1TTE5?=
 =?utf-8?B?WlJZZnN4VW0wLzB3R3RMdy83RGVzdExxZ1B2RXJRWWFRRUF2bitJaEZ6dkNs?=
 =?utf-8?B?Uy93QkNweVFVMVIwT3ZWemRrb3JRcGNlUm1YTGRaUFlVKzN0d05ncWdsdkVQ?=
 =?utf-8?B?akVvNFpJUUpPQXpDYVRRVm1zZ2E2d2N0MGc4aFE1SkhVWTBNL1dJRDJEM21N?=
 =?utf-8?B?MDhMenVCbGlSeHJLUWMrM2JDYmtZNGNPUFB4UTF0U1o4eTRoV2wvWjJUSzRw?=
 =?utf-8?B?K2t3OFZUajhoZ1FzZ21HZXZScVp1UHhzWVhSRlZLZWNPN0UvanlqK3k1M2Fo?=
 =?utf-8?B?aUZ1NmFLN3JmTWxOZHZ1eFlubkhBOTkxb2JkcisyY1NMUFZoYXliVjRPSGEr?=
 =?utf-8?B?bXp2T1RPQ3g3dzI0SmJSNlRINWVjNTJUbHErc29TWDc0N3Q4S3ovRTZaa0tk?=
 =?utf-8?B?c2RHYnB0SkZRa1F1TU1adFVrNnJOdVBBWmN3a1c2bEh2LzZCUWo2TlNGOERB?=
 =?utf-8?B?SFhpSWdvYllTbkh3ak9KdnJ3RE5CMGZxSTg1eEtSalpRc3VwWE1zaitVa3dN?=
 =?utf-8?B?dUR0Z0FTMFpHTll4VFRieTErSDI1ZjlPcU9oZWZaNzlZMFJSMjdNMHV1QjhU?=
 =?utf-8?B?bms3Z2FIY1ozWkNlcTVsZVQ4YnpyVGlRemI5ZDdsc0d3Q3dXV1RaTEVGOEVw?=
 =?utf-8?B?SkFRQkxJRVVmaTg0bFhoQVNibTRmZHNESE9od3k4SW9zVUpCaXcyQUxLU0Qr?=
 =?utf-8?B?RUxlTDVINUk5cDZxQmJHZ0RqVjFNWUhTUm92ZlMwQ2RXNkl5RGZJQjBjSW1l?=
 =?utf-8?B?RVlPZ0paODdpWitYd3d0MGFMTzFKNUc5aTUzbWVpSXZPUGJZZnJnR3U4d3pV?=
 =?utf-8?B?MFdYTkg4RmdjUkhTRFFOdkNMNDUzQWYrMXBvcnJGbzF6Y3NwK3JPdXg2Mysv?=
 =?utf-8?B?Q0poWmprbm5wS2dJTVFxUk03ekgxWGZpcnNmM2JVa0VwUmZrNlNYc2NUUkhx?=
 =?utf-8?B?NmJzdGVDYnNFYmE0OUdyOC9zVnRTNEFGUDJ0aHpKTU91M2NmZ04yNkhIdnl4?=
 =?utf-8?B?Y2kySk5EV2gyYms1Z2RnWmZvYTFwQnJMbExjYjZENVlHQS92Tm1jMDFiMm91?=
 =?utf-8?B?b3RMaTNjZFkxZFdUR21iNVcxRWpIdzJXZFBLa3R1cXUvVnRuOWFtdHZCWGI4?=
 =?utf-8?B?K2pQTFNtZzFnWFUwMVp4Wk5iTmVzT25YdDVDVWgwa2lvN2F4alZCQVRBRlVN?=
 =?utf-8?B?czNodTdQeVI4VFE5bUxRWGZkVytNeDdXdXN4bUZ6WG9mR0EybkErTmRHczdt?=
 =?utf-8?B?ajJ5ZHRUeDg1bXRyY1UxZ2V2cVhPbWF2aUw4Z1FBOEJOOFJPOUpDTWN2c1Bq?=
 =?utf-8?B?VkFmSnRvM1U2S2xDcFdrbkpBZWxUT2pteWFVQ0FGMSsvNU5xbTlvYW5KRDFC?=
 =?utf-8?B?MXpodDVRd0NzTGZaT1VYVVlnSzhHdGVuaTFFc1dwMmxxRDd2STdjVkE4emZo?=
 =?utf-8?B?VDhTdG9FZk1rdTc3SzVWZThpbmVGTFlUN1FZQis5T09oRHhxU3VCSWtrdytZ?=
 =?utf-8?Q?GteYZ40fML0ct0d7NxZko4ta8=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tzc5RS9tQ2F3UTBiZkRyeVJ5VHd5b0M5LzJYeDRFM28yd25kSzlvR3FpWndH?=
 =?utf-8?B?dEE3d1NxczB5NHNVek9aU3VuRWlnRWpLMjl6QS9wSTRQU01VMHZHWVNyRVpi?=
 =?utf-8?B?dlR3a3JWV3paSG9jdEZqYU1GL05OTndNLytzVnBEVlFaTjk2elJFbVV4ejRG?=
 =?utf-8?B?QmpLVUZtODlmMlJNTmZhRFFSMGNDMlRBUkxOcW1kOTJJaDd1aUNuaUI4U2sx?=
 =?utf-8?B?b3ZOb1g5dFJWQkN6VmFhcGh3RW9MU3NnUmhOQ0RXSEczZlVmMlVCTHZXblgr?=
 =?utf-8?B?MG5vc0o0eUFsUFphQVliSXQvM2RPNnpLcjBpbEhLOGo0S2NuRHYrRGNSdlFX?=
 =?utf-8?B?c2h3dHBsVXM5SlpTMmVTY2VmZE02RHBFbnJWOFBjUG1RZEJYeW0yRnh6UWJh?=
 =?utf-8?B?aFVUdDRTMHh2Vis1SEJyOWtyWGtIdDJaaUNYVDlQbkdxMVo1a09aUXdlUDJz?=
 =?utf-8?B?T3p1UTVsN1daZ21kaVoxRWdMa1BnL1FUZ053WWZzYXArYVkrZFl1QWE5YVpu?=
 =?utf-8?B?WlBiZDYzU1RBVDdUSDFid2Y1cFQrQTY1ekMzV3NtbDJ6d213KzJvTlZVNnNT?=
 =?utf-8?B?NnVqYm9ZUk5FUVJtc0Z0RG5mQkM4Qi9LdURSUk82VUdBa2xxU21vVThreUxS?=
 =?utf-8?B?V0VhT2E4TDVDQ1ZSWnhGd1RTSEJoQjZFbEJJQUdyaXJKaEhuT29YdGoyYm9a?=
 =?utf-8?B?aXF2RTJ4aHZESTJNUlljYUIwWGpoVlozNklVMXRXYlBUWXRXZ21mL0RNNzFu?=
 =?utf-8?B?N1BkWDJXUXRlZ0JaWWlkdDlxWU9ZZkJBSytUWFJjZHlwZ2JBSEUxSVJucmNF?=
 =?utf-8?B?WFNmQlg0RmpOd3FQWVBBcUs3SmNlWFVQWU5RN3RGWFM0L3lnMjRPMWdYVWhQ?=
 =?utf-8?B?WTFJNUZTbHJBbkVvaHJoaVl4S0wreldSZk5DTEt5cTVBTUQzLzZWcnNxWXFL?=
 =?utf-8?B?WVFGNnlWQUlmMCtFcllGZHFyVUxxdVgwNi8vbytxMFBvandtZklTcXBnZWxR?=
 =?utf-8?B?MndXQmlwYSswRUtaN2E1YWF1dW83b0NGZWNYNkxzSFhRcXNrZXVGMldRSmQ1?=
 =?utf-8?B?c295VHY0SlZqcVlOQVY3b1B5anZEZnloMFl2aDJseGt2NFQvRkp3dHB4Qy9o?=
 =?utf-8?B?NVg1c2lKSFc5VzlqQnBtejNFeFUxd3dTSldmTVpXMGZqM1ZtcEM4Y1doWERj?=
 =?utf-8?B?OENxMG93R3psVmdnK0hXbXBnNVdRUUxabmxNeFBsVzJ3T1pldHpWY21NME5F?=
 =?utf-8?B?SlBLYzNUeEJ2dll6Wkg2cFpHUWZMeHFPTEFaRTd0M0ZOeUd6Zm9VaVJ5SC9L?=
 =?utf-8?B?aWkxZld3Zk8yT29iQlE5eGNDRTFrUTBYZmFsKzh4R1UrdUdPbStmRVI0NndY?=
 =?utf-8?B?UjdHM0xLWG4vY3BSb2lvKzQ3Z21oYzBlVnBPbnhDeWdjVkJRdzF5Rlc0RDNq?=
 =?utf-8?B?dmpUTUZGVDhZNlp5Z3RRR2ZnYmZPRGp6L2x2ZjJkTVhsYklGY2ZIZlhzRDFP?=
 =?utf-8?B?VFBLdDk3MExHYU15aTJjQm5ScFUzZ0liU1lXTVplUGVGdHU2MGVVK3NZNmdx?=
 =?utf-8?B?d1AwcEFUTjRPMTkxdHlISmJOdmlSeldvSU03bi81aVpwanJ6ekdyam4zUlZs?=
 =?utf-8?Q?IPS+LZKeVEx+QBpwsSxvnXGjbFF75o4Q+F64mLh8t0mY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 766c70e0-accb-41f8-d61b-08dd54f1bc82
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 16:38:58.2862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB9631
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

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDk6NDXigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tIHdyb3RlOg0KPiANCj4g77u/T24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMDM6
NTY6MzZQTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+IE9uIDI0IEZlYiAyMDI1LCBh
dCA5OjIz4oCvUE0sIGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbSB3cm90ZToNCj4+
PiBPbiBNb24sIEZlYiAyNCwgMjAyNSBhdCAwMzo0MDoyOVBNICswMDAwLCBBZGl0eWEgR2FyZyB3
cm90ZToNCj4+Pj4+PiBPbiAyNCBGZWIgMjAyNSwgYXQgOTowOOKAr1BNLCBhbmRyaXkuc2hldmNo
ZW5rb0BsaW51eC5pbnRlbC5jb20gd3JvdGU6DQo+Pj4+PiBPbiBNb24sIEZlYiAyNCwgMjAyNSBh
dCAwMzozMjo1NlBNICswMDAwLCBBZGl0eWEgR2FyZyB3cm90ZToNCj4+Pj4+Pj4gT24gMjQgRmVi
IDIwMjUsIGF0IDg6NTDigK9QTSwgQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4g
d3JvdGU6DQo+Pj4+Pj4+PiBPbiAyNCBGZWIgMjAyNSwgYXQgODo0MeKAr1BNLCBhbmRyaXkuc2hl
dmNoZW5rb0BsaW51eC5pbnRlbC5jb20gd3JvdGU6DQo+Pj4+Pj4+PiBPbiBNb24sIEZlYiAyNCwg
MjAyNSBhdCAwMzowMzo0MFBNICswMDAwLCBBZGl0eWEgR2FyZyB3cm90ZToNCj4+Pj4+Pj4+Pj4+
IE9uIDI0IEZlYiAyMDI1LCBhdCA4OjI34oCvUE0sIGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4Lmlu
dGVsLmNvbSB3cm90ZToNCj4+Pj4+Pj4+Pj4gT24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMDI6MzI6
MzdQTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+Pj4+Pj4+Pj4gT24gMjQgRmViIDIw
MjUsIGF0IDc6MzDigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tIHdyb3Rl
Og0KPj4+Pj4+Pj4+Pj4+Pj4gT24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMDE6NDA6MjBQTSArMDAw
MCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+IA0KPiAuLi4NCj4gDQo+Pj4+Pj4+Pj4+Pj4+Pj4gKyNk
ZWZpbmUgX19BUFBMRVRCRFJNX01TR19TVFI0KHN0cjQpICgoX19sZTMyIF9fZm9yY2UpKChzdHI0
WzBdIDw8IDI0KSB8IChzdHI0WzFdIDw8IDE2KSB8IChzdHI0WzJdIDw8IDgpIHwgc3RyNFszXSkp
DQo+Pj4+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+Pj4+IEFzIGNvbW1lbnRlZCBwcmV2aW91c2x5
IHRoaXMgaXMgcXVpdGUgc3RyYW5nZSB3aGF0J3MgZ29pbmcgb24gd2l0aCBlbmRpYW5lc3MgaW4N
Cj4+Pj4+Pj4+Pj4+Pj4+IHRoaXMgZHJpdmVyLiBFc3BlY2lhbGx5IHRoZSBhYm92ZSB3ZWlyZG5l
c3Mgd2hlbiBnZXRfdW5hbGlnbmVkX2JlMzIoKSBpcyBiZWluZw0KPj4+Pj4+Pj4+Pj4+Pj4gb3Bl
biBjb2RlZCBhbmQgZm9yY2UtY2FzdCB0byBfX2xlMzIuDQo+Pj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+
Pj4+Pj4+PiBJIHdvdWxkIGFzc3VtZSBpdCB3YXMgYWxzbyBtaW1pY2tlZCBmcm9tIHRoZSBXaW5k
b3dzIGRyaXZlciwgdGhvdWdoIEkgaGF2ZW4ndA0KPj4+Pj4+Pj4+Pj4+PiByZWFsbHkgdHJpZWQg
ZXhwbG9yaW5nIHRoaXMgdGhlcmUuDQo+Pj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+Pj4+PiBJ4oCZ
ZCByYXRoZXIgYmUgaGFwcHkgaWYgeW91IGdpdmUgbWUgY29kZSBjaGFuZ2Ugc3VnZ2VzdGlvbnMg
YW5kIGxldCBtZSByZXZpZXcNCj4+Pj4+Pj4+Pj4+Pj4gYW5kIHRlc3QgdGhlbQ0KPj4+Pj4+Pj4+
Pj4+IA0KPj4+Pj4+Pj4+Pj4+IEZvciB0aGUgc3RhcnRlciBJIHdvdWxkIGRvIHRoZSBmb2xsb3dp
bmcgZm9yIGFsbCByZWxhdGVkIGNvbnN0YW50cyBhbmQNCj4+Pj4+Pj4+Pj4+PiBkcm9wIHRoYXQg
d2VpcmQgYW5kIHVnbHkgbWFjcm9zIGF0IHRoZSB0b3AgKGl0IGFsc28gaGFzIGFuIGlzc3VlIHdp
dGgNCj4+Pj4+Pj4+Pj4+PiB0aGUgc3RyNCBsZW5ndGggYXMgaXQgaXMgNSBieXRlcyBsb25nLCBu
b3QgNCwgYnR3KToNCj4+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+PiAjZGVmaW5lIEFQUExFVEJE
Uk1fTVNHX0NMRUFSX0RJU1BMQVkgY3B1X3RvX2xlMzIoMHg0MzRjNTI0NCkgLyogQ0xSRCAqLw0K
Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4gTGVtbWUgdGVzdCB0aGlzLg0KPj4+Pj4+Pj4+IA0KPj4+
Pj4+Pj4+IEp1c3QgaW4gY2FzZSBpdCB3b24ndCB3b3JrLCByZXZlcnNlIGJ5dGVzIGluIHRoZSBp
bnRlZ2VyLiBCZWNhdXNlIEkgd2FzIGxvc3QgaW4NCj4+Pj4+Pj4+PiB0aGlzIGNvbnZlcnNpb24u
DQo+Pj4+Pj4+IA0KPj4+Pj4+PiBJdCB3b3Jrcy4gV2hhdCBJIHVuZGVyc3RhbmQgaXMgdGhhdCB5
b3UgdXNlZCB0aGUgbWFjcm8gdG8gZ2V0IHRoZSBmaW5hbCBoZXggYW5kIGNvbnZlcnRlZCBpdCBp
bnRvIGxpdHRsZSBlbmRpYW4sIHdoaWNoIG9uIHRoZSB4ODYgbWFjcyB3b3VsZCB0ZWNobmljYWxs
eSByZW1haW4gdGhlIHNhbWUuDQo+Pj4+Pj4gDQo+Pj4+Pj4gQW5kIG5vdyB0aGF0IEkgb2JlcnZl
ZCBhZ2FpbiwgJXA0Y2MgaXMgYWN0dWFsbHkgcHJpbnRpbmcgdGhlc2UgQ0xSRCwgUkVEWSBldGMN
Cj4+Pj4+PiBpbiByZXZlcnNlIG9yZGVyLCBwcm9iYWJseSB0aGUgcmVhc29uICVwNGNoIHdhcyBj
aG9zZW4uIEFuZCBJIGFtIHVuYWJsZSB0bw0KPj4+Pj4+IGZpbmQgd2hhdCBtYWNybyB1cHN0cmVh
bSBjYW4gYmUgdXNlZC4NCj4+Pj4+IA0KPj4+Pj4gJS40cyBzaG91bGQgd29yayBhcyBpdCB0ZWNo
bmljYWxseSBub3QgRFJNIDRjYywgYnV0IHNwZWNpZmljcyBvZiB0aGUgcHJvdG9jb2wNCj4+Pj4+
ICh0aGF0IHJlbWluZHMgbWUgYWJvdXQgQUNQSSB0aGF0IHVzZXMgNGNjIGEgbG90KS4NCj4+Pj4g
DQo+Pj4+IEkgc3RpbGwgZ2V0IHJldmVyc2Ugb3JkZXIgaW4gdGhhdC4NCj4+PiANCj4+PiBBaCwg
cmlnaHQsIGl0IHdpbGwgZ2l2ZSB5b3UgdGhlIGZpcnN0IGxldHRlciBhcyBMU0IsIGluZGVlZC4g
QXQgdGhlIGVuZCBvZiB0aGUNCj4+PiBkYXkgaWYgaXQncyBzbyBpbXBvcnRhbnQsIHRoZXJlIGFy
ZSB3YXlzIGhvdyB0byBzb2x2ZSB0aGF0IHdpdGhvdXQgdXNpbmcgJXA0Y2MuDQo+Pj4gQnV0IGlm
IG90aGVycyAoYW5kIGVzcC4gUFJJTlRLIG1haW50YWluZXJzKSB3YW50IHRvIGhhdmUgLyBkb24n
dCBvYmplY3QgaGF2aW5nDQo+Pj4gdGhhdCBleHRlbnNpb24sIHdoeSBub3Q/DQo+PiANCj4+IFJp
Z2h0LCBidXQgd2hhdCB0byBkbyBhYm91dCB0aGUgY2FzZSBvZiBsaXR0bGUgZW5kaWFuIGFuZCBo
b3N0IGVuZGlhbj8gSQ0KPj4gcmVtZW1iZXIgdGhlIHN0YXRlbWVudCAiZm9yIHRoZSBzYWtlIG9m
IGNvbXBsZXRlbmVzcyIgZm9yIHRoZW0uIERvIHlvdSB0aGluaw0KPj4ganVzdCBob3N0IGVuZGlh
biBhbmQgcmV2ZXJzZSBlbmRpYW4gc2hvdWxkIGJlIGp1c3QgZmluZT8gT3IgeW91IGdvdCBhbnkg
Im5vDQo+PiBzcGFyc2Ugd2FybmluZyIgd2F5IHRvIGdldCBpdCBkb25lPyBUaGUgbWFjcm9zIHRv
IGNvbnZlcnQgdG8gbGUzMi9iZTMyIGV4cGVjdA0KPj4gYSB1MzIgdmFsdWUsIGJ1dCBpbiB0aG9z
ZSBjYXNlcyB3ZSBhY3R1YWxseSBhcmUgcGFzc2luZyBhIGxlMzIvYmUzMiB2YWx1ZS4NCj4gDQo+
IEZvciBub3cgSSB0aGluayB3ZSBiZXR0ZXIgc2F2ZSB0aGUgZW5lcmd5IGFuZCB3YWl0IGZvciBQ
UklOVEsgcGVvcGxlIHRvIHRlbGwNCj4gaWYgdGhleSBhcmUgb2theSBpbiBnZW5lcmFsLiBPdGhl
cndpc2UgaXQgbWFrZXMgbm8gc2Vuc2UgdG8gZGV2ZWxvcCBhbmQgcmV2aWV3DQo+IHNvbWV0aGlu
ZyB0aGF0IHdpbGwgZ28gdG8gdGhlIHRyYXNoIGJpbi4NCj4gDQoNCkknZCByYXRoZXIga2VlcCAl
cDRjYyBoZXJlIGZvciBub3cuIEkgZG9uJ3Qga25vdyBpbiBkZXRhaWwgYWJvdXQgRk9VUkNDIHRi
aCwgc28gcHJvYmFibHkganVzdCBsZXQgQXNhaGkgTGludXggbWFuYWdlIHRoYXQgcGFydCBpZiBt
b3JlIGNoYW5nZXMgYXJlIG5lZWRlZC4gSW4gY2FzZSB3ZSBnZXQgYmV0dGVyIHByaW50ayBmb3Jt
YXRzLCBhIHN1YnNlcXVlbnQgcGF0Y2ggY2FuIGJlIHNlbnQgbGF0ZXIuICVwNGNjIHN0aWxsIHdv
cmtzIGp1c3QgZmluZS4=
