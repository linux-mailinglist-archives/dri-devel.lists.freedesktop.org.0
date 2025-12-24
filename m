Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C776CDC5B8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 14:30:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D8C10F318;
	Wed, 24 Dec 2025 13:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazolkn19012063.outbound.protection.outlook.com [52.103.43.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64AC10F318;
 Wed, 24 Dec 2025 13:30:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCqr9u6xeTm7AFEqjCp/qjX6bNcc68GovBel2kSGhn/XyZFq0y3YjRn8WEyDrEJ7zxP6kwUY9x1k4tZZottkt0bdhSgJ3o++GchYPsYfUeUfj0zDQLffN1UVfVqty0JW2E5APFytxwUUrKQAxhvAHDplJWreWHTfDvVvSl8MnwrThlyDPbQJ5oyE3iiIImpLmQmVAn/edcwbGu6TX02sgTHRgbH+VlUxNq7uOLwnPM6EoIuZVxWfdbOleaOn4jGbmbJ8mjYDBSKSgtile4ncDpAxQsZFSJan/LywaA2I9vHhqVqh89qW34Has94fYY1Kv42VHYDcQ/y090AxDSzZQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBSOSJzDuIX2aK7b6Ye+4eEsfhP9Ix2zyALJLNhLF9w=;
 b=IqtRjnbgbT8pTZlwuin4ejfzAlj+wUKRqARhfVz+A3/0NUMT+qMI4fzZl7dDFSsZbBXiMuYPgJZsLo36ICAvhek20MNEApFQrKv1VZTkjQZefebhyYZLRX8+dzzoWGH7aYOdBgYiM7y6HjrQMonSG38rzv0rk7oNgruoT8z6KcDShvtsaj6tr81pXo17wmfa+gmaGNkcz7qYMq0Bw+IR7bHQgEuNrOMErIYsHFwc23UTpVdEz+2UJ0ZtMy7EgmLxcX2XwKFKMPXaPTiiSvReYPkks8aiel3/r07gSoiKRETCIHeGOIApnQdnMg9LGDnC3Z8Js2MGOu+v9fKt7qKMZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYUPR06MB6099.apcprd06.prod.outlook.com (2603:1096:400:356::8)
 by TYSPR06MB6339.apcprd06.prod.outlook.com (2603:1096:400:412::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 13:30:35 +0000
Received: from TYUPR06MB6099.apcprd06.prod.outlook.com
 ([fe80::2223:6c27:d5c2:aa47]) by TYUPR06MB6099.apcprd06.prod.outlook.com
 ([fe80::2223:6c27:d5c2:aa47%5]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 13:30:35 +0000
From: Teguh Sobirin <teguh@sobir.in>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav
 Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean
 Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Thread-Topic: [PATCH v2] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Thread-Index: AQHcWqyUhQtHBGjxzUaPcThPu4EOI7Uwxb2AgAAwQYCAAAegfg==
Date: Wed, 24 Dec 2025 13:30:35 +0000
Message-ID: <TYUPR06MB60994CC9F0097F95C6E51B2EDDB2A@TYUPR06MB6099.apcprd06.prod.outlook.com>
References: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
 <aUu5vZdr9RJ-VML8@SoMainline.org>
 <un2arvxos2kuyrqej4p4fs3jfd3kzpa4r5txoitoctfwl7hair@i2a5lu3p3iem>
In-Reply-To: <un2arvxos2kuyrqej4p4fs3jfd3kzpa4r5txoitoctfwl7hair@i2a5lu3p3iem>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6099:EE_|TYSPR06MB6339:EE_
x-ms-office365-filtering-correlation-id: 89ceb22b-6bcf-4c5e-cd3f-08de42f09e7c
x-microsoft-antispam: BCL:0;
 ARA:14566002|31061999003|461199028|6072599003|8060799015|8062599012|19110799012|51005399006|15080799012|14091999006|12121999013|41001999006|4302099013|3412199025|440099028|10035399007|40105399003|102099032|1602099012;
x-microsoft-antispam-message-info: =?utf-8?B?Ry9WQjBKeGRxVitnbGcxa3pXUG55aHhHQ1RxTmE2VEZBUU1YekN0cjMwa1NT?=
 =?utf-8?B?bFZHUWtEd0FzYXI4UHM4WXZEejVmVTA3UldTdFp1UHJmV3lXODREeFRaRVlG?=
 =?utf-8?B?Zi9PbWNXcEMxZ2JIcVRFd2dDZGdMYnl3YmNkRkNNeEFQeTR5UmRvcUNaTDAx?=
 =?utf-8?B?azNmb1hSMUhjbnA3eFBJSzJ4M3NPU2tBVllpS2U5WDlRRnBUUWxXU0JRcTRK?=
 =?utf-8?B?ZTFERFJTNjN1RkNyOHo1NkNJL3BiNklQSmxWKzNDRytnbXkxbE9LSndjdVZY?=
 =?utf-8?B?YnFCUklNVVAyamtQaGk3aS94Nk9BbFQwWHFiaCtMeFliWFZNWXZWbVgvbHJF?=
 =?utf-8?B?OVNRRVJDUml6UUU1SVY2OWowYTVRQ2JySlFjUHBCWWhUSDhScXpFVlZuYXhE?=
 =?utf-8?B?U1RiVzl3T0htWUtZZ3h0UXZlZXN6YkR1SjBmenNld3hSeW5BNUNjOWtENVI5?=
 =?utf-8?B?eHNNb2xqSENCZTJTaEUxWTkrZHFjK1QzRE15V1l5VUZoajRLSURPbU94SUJ2?=
 =?utf-8?B?Z3RWS1BmcTlOeThFVnBmMUpMeTFRWUdsSlluR1JGTmVRdzZmZXVJRFNVWGNw?=
 =?utf-8?B?Mm9qQnBpOEMxUzlCV1RxcWVWLzRCVFBjb1NrUHJBbFo1NzZlRHFDajJOM01p?=
 =?utf-8?B?MERuNDhXTUdQSWJjdWJpbGppTHc4YWR1R3Evb0ZaWEFNd29Kc0p0OTJONWpP?=
 =?utf-8?B?bzV0eVZXQTcxdHhpUHZQUkpLTlMvVEF1Z0Q4NlNqeHY3M09BWUw5ek1lZFRQ?=
 =?utf-8?B?RUREYjc0RnNQUlVvbHFFdWI0MHJtUzM1YVluWlByRVN2SGZhYTRKSng0bXhj?=
 =?utf-8?B?L0RPRHg2NFBzeUROUHkvZ0pERVNZamRSSzNnN0NwSVplMU1NMVZWbCtIR0Fl?=
 =?utf-8?B?cGMvK1Y1UW9wN0ZiTitpZ2syUzhIbkRxTnkvek9MT2x3bGJvdTd3d2tUcnlq?=
 =?utf-8?B?Vlo5R1J2eDl3dzArdE5pdzVEdW5mektSajlyTmF1RUlOcHhpK25KRmJidUpC?=
 =?utf-8?B?VVQyLy95dFFmVkNja1o3aEkzeEJRS3dxOXF4SldWMDQrRGdWTnBZM0VnTlo0?=
 =?utf-8?B?ZnJLeUtOei85eTZKOWhESFN4ZW5UdDVlWmlGNGlwRHNvQjhEclBKTmlmWTNG?=
 =?utf-8?B?eGJwNFY1bzZybzdBbjNRSCtTbW4zUlN2L1FxV0VCdTBKZE55RUtIa0s0U1ZR?=
 =?utf-8?B?ZlFlbVVvV3g4Ykl5K2RwVk1kbjIwVDgybVpTVEIvWTdueTJEM1psY2p0dzU2?=
 =?utf-8?B?ajNXNHd2NyszV25tM0c1eDY4SHJOYnZPUkZjT3JnTlhkMTZkTzA5OVhOY1Nn?=
 =?utf-8?B?T0IxYmE4bms1T2VXYXNadFdDVittUU1ZTUZQekdqcmc0dzRDWmRoWjFydjI0?=
 =?utf-8?B?R3JWSGZrcHZPcXNZMHVJYlN3TXM4YlVPeEtaYXk0RkJTSXM4SjU1Q0RuY21E?=
 =?utf-8?B?YTYvQ1U1aVR5amZodURzdk1MTzdOZ2JPMWpnY0Z5aXQ2Y2s0ZUZObmc4dEcz?=
 =?utf-8?B?Yzg3Y0JXMis1dGdhYUdpQ1BqUzN1Q0MzZmQ5Mnh2bXEwMGhDeHoxeHBmdi9s?=
 =?utf-8?B?QkQxZjRqT3ppQ0tJb01UT3B6eVU2WXJTVC9oaVgxU292OVU4RHpBcU1NQ21l?=
 =?utf-8?B?OVd4RzRxZjUzOUxBNlBrdGJsRGtDSlpWRGVRMVltQnBZUDVleHY2cVlTYXhF?=
 =?utf-8?B?M3B5MWZqVzl0cWNxdHhJN3FmemErMDNNcUtiYWRrMmZlUklGTTRadmpPUHd1?=
 =?utf-8?B?SkxaWmJNTWRTSkN2MkZhZWZMYUdTeXErZXdlVlNKZiszZGJYUFREbjNCbjVj?=
 =?utf-8?B?Ny9DdjlZY0p1cVJUYmJ2WE9rWlVFdWR2WGdvTlRaMnR3OGxpUEtZb20va0U3?=
 =?utf-8?B?Ny9QOTRnU0V0SFYwci9xVXc4L0ROeC9SWkRaQm9MWVVVQlVCUk82Yk9VYTgz?=
 =?utf-8?Q?IJdJHQs7VRGnWe11aBIHTpQZTCPegqo3?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2Y3Y0w1SUkrY25xRGpiZUwreVYvSWJ2b2dMaGZCQzdMSmhnOXRtMjFOdi85?=
 =?utf-8?B?Q3dzNFU3ZkwrQlFQcjNsVlBhM1pmS215TG9WUHVTZGVJQ2xVUHVFWURnVVkx?=
 =?utf-8?B?NWFPdmpRN1VqLytDZlpaTjl5cUd0VFJ0cXdDOTVYYzlTQmhEcVpMKzBrd2V0?=
 =?utf-8?B?dWU2MWFoN0tlNDQyQVlzNlh4N3FyT2QxbWVzSU55QXI2NTUyd1U3RlNMamJZ?=
 =?utf-8?B?R0ZTaE0zUjl5Z1F3Q05KNllxb0RZOFZhS1I1TnQzZ29hTkxrNGMvTWFMNU43?=
 =?utf-8?B?MDBBeERPd2YrWUNFQzhtSUxuNm5IZGZTdEFVYzArQ1N6d3IzZElXNUVLa0ZZ?=
 =?utf-8?B?TStOemZDUFZjUFpXWDVIYnV1Z2M0SllRUkprbVQ3bzVMQ2lTbFpGdzFNN3Rw?=
 =?utf-8?B?MlBSejVEOHVhQnQwZkpZdHdxOEhSUjBieDg3NlRxMzNkc1JPaUJOR1EvLzhE?=
 =?utf-8?B?MndGK1dIK042VFgzc3NpS1BiTUJUSkF5Vis2WjRKNTlqZFlVU3lvbXEzd3hl?=
 =?utf-8?B?YTNEMjAxa05vS1VxUUZkZytxcWxrOVc5QWNYcFZ6U3A2SEVnc0dzdENsZ1Vk?=
 =?utf-8?B?dXdocFBVNUdIT2tWNkVvWTRPcHlIUjFvZk9RVkNFQkVPM2xIeEh3NThWQTY1?=
 =?utf-8?B?bi9QWGdUL0hQTzA5bUdrOW5FY1luS2F6d2s1Z0xxWDZWZW0wektXckVjOEdz?=
 =?utf-8?B?Sjc3cEN5WGtGZDRKMGswK0dvdFJGZ0pNR0tMZU5wUnhCeGdCUE02alZhY1hr?=
 =?utf-8?B?a01SL1psQmYxczI3cmpQdGQ5cDlXd3pCOFd1T01ZdXFWTzA5bXIwcVloQ2hW?=
 =?utf-8?B?ZWZZL1JVem4vYU15a2U1bDYrTnZTbUVsdi9uL2hNZk5rWTF0dXhTMHZXRXRh?=
 =?utf-8?B?M2Rndlh5eEEvOE8yc3RzcVozNm5iN3l4blVIeG5DanNUclMwRHlHUjZ6NEdL?=
 =?utf-8?B?b0FTazZWYzhpRldOMTM0cnN6UjM4bDRVdGdjR1p0blNuTlZQU1ZUQitPZzNv?=
 =?utf-8?B?U0FJbHduS0dsQksrTXdMQlpYT2d0Mi92TTJxWUw1cVNndncvOUluWGlnY25O?=
 =?utf-8?B?VkRiMUR4ZXh1UThneVlhNWNMYUpHRWsrZDFGWHNDaldOdnRhdm5Qbk81bzRB?=
 =?utf-8?B?WlNQSFdZYlNqYUVpOG90bmk4SEIydW5IM2NmMG45Mmk4OFU1NjIxT0ViOXNN?=
 =?utf-8?B?b0M1eld4VDRjbVFGOWtoMXpzZGEyZ3ZyeU1pQmJjWFVqZ1hvQm9hVGpyYTJV?=
 =?utf-8?B?OTJ2Yi9ReFBIWkNwcWdSYTIxK21STEVVam1hc09GV3N5ZjRnVUdIU2F0dVVu?=
 =?utf-8?B?U1Y5RnMxUDRoZWZkbjZqZ3Zmdzk2a0VTcG9oSDk4SWt6TVNoMFVjdGZ3Q0Fm?=
 =?utf-8?B?ajRRdWwwUkFNYW5YbmwxSkhyeWR5MjNQaWcwUDMvNSs3Z013TWUyZ3IvYTF1?=
 =?utf-8?B?NzNISmZJdklMTFFQdEtpYUNqeFFJTW9YRVNMOTlDdlUraG1UTHkzQXBadXNK?=
 =?utf-8?B?LzIydGRSN2pvU1BWU1dRTk5oNUtyVGhOQUVXQ1lpSm9Zd1A4NEJaNERVenk4?=
 =?utf-8?B?Y3FuYSs2ckYrMG9HRnFPdlhKOFZLZlN3ZnVZVnJmYWpLSnEvdUVleDlXcTRz?=
 =?utf-8?B?RkRUNWcrbkRaVU4rcUVnU3g4OVdCRk5JdUZaV21idE5QL0NFYTBSd1RDU3dx?=
 =?utf-8?B?bUoza0poMUlNS1ZpZjBGWnU3MHBqWU1lNmMzY3hjYUNrWU5TNTQ2Q3NVcm8z?=
 =?utf-8?B?Q2dZRncrS2VVdnRVbTNrNHRPQmRka201YUsyQ1FmTG92enpZMHdjbC93NnE1?=
 =?utf-8?Q?854vcOvOPiEfYDoyyzopEWrwKHT812p2AOIQ0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-7141d.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6099.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ceb22b-6bcf-4c5e-cd3f-08de42f09e7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2025 13:30:35.1614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6339
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

DQo+DQo+IE9uIDI0IERlYyAyMDI1LCBhdCAyMS4wMywgRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5
LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToNCj4NCj4g77u/T24gV2VkLCBEZWMg
MjQsIDIwMjUgYXQgMTE6MTA6MzVBTSArMDEwMCwgTWFyaWpuIFN1aWp0ZW4gd3JvdGU6DQo+Pj4g
T24gMjAyNS0xMS0yMSAxNDowMjowOCwgVGVndWggU29iaXJpbiB3cm90ZToNCj4+PiBTaW5jZSBE
UFUgNS54IHRoZSB2c3luYyBzb3VyY2UgVEUgc2V0dXAgaXMgc3BsaXQgYmV0d2VlbiBNRFAgVE9Q
IGFuZA0KPj4+IElOVEYgYmxvY2tzLiAgQ3VycmVudGx5IGFsbCBjb2RlIHRvIHNldHVwIHZzeW5j
X3NvdXJjZSBpcyBvbmx5IGV4ZWN0dWVkDQo+Pg0KPj4gdHlwbzogZXhlY3V0ZWQuDQo+Pg0KPj4+
IGlmIE1EUCBUT1AgaW1wbGVtZW50cyB0aGUgc2V0dXBfdnN5bmNfc291cmNlKCkgY2FsbGJhY2su
IEhvd2V2ZXIgb24NCj4+PiBEUFUgPj0gOC54IHRoaXMgY2FsbGJhY2sgaXMgbm90IGltcGxlbWVu
dGVkLCBtYWtpbmcgRFBVIGRyaXZlciBza2lwIGFsbA0KPj4+IHZzeW5jIHNldHVwLiBNb3ZlIHRo
ZSBJTlRGIHBhcnQgb3V0IG9mIHRoaXMgY29uZGl0aW9uLCBsZXR0aW5nIERQVQ0KPj4+IGRyaXZl
ciB0byBzZXR1cCBURSB2c3luYyBzZWxlY3Rpb24gb24gYWxsIG5ldyBEUFUgZGV2aWNlcy4NCj4+
Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFRlZ3VoIFNvYmlyaW4gPHRlZ3VoQHNvYmlyLmluPg0KPj4+
IC0tLQ0KPj4+IENoYW5nZXMgaW4gdjI6DQo+Pj4gLSBDb3JyZWN0ZWQgY29tbWl0IG1lc3NhZ2Ug
c3VnZ2VzdGVkIGJ5IERtaXRyeSBCYXJ5c2hrb3YuDQo+Pj4gLSBMaW5rIHRvIHYxOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0tbXNtL1RZVVBSMDZNQjYwOTlDQkJFNTA5MERCMTJB
MkMxODdFM0RERkRBQFRZVVBSMDZNQjYwOTkuYXBjcHJkMDYucHJvZC5vdXRsb29rLmNvbS8NCj4+
PiAtLS0NCj4+PiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jIHwg
MjIgKysrKysrKysrLS0tLS0tLS0tLS0tDQo+Pj4gMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgMTMgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9kcHUxL2RwdV9lbmNvZGVyLmMNCj4+PiBpbmRleCBkMWNmZTgxYTMzNzMuLmY0NjhkMDU0ZjVi
ZCAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5j
b2Rlci5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29k
ZXIuYw0KPj4+IEBAIC03NzQsMjQgKzc3NCwyMCBAQCBzdGF0aWMgdm9pZCBfZHB1X2VuY29kZXJf
dXBkYXRlX3ZzeW5jX3NvdXJjZShzdHJ1Y3QgZHB1X2VuY29kZXJfdmlydCAqZHB1X2VuYywNCj4+
PiAgICAgICAgcmV0dXJuOw0KPj4+ICAgIH0NCj4+Pg0KPj4+ICsgICAgLyogU2V0IHZzeW5jIHNv
dXJjZSBpcnJlc3BlY3RpdmUgb2YgbWRwIHRvcCBzdXBwb3J0ICovDQo+Pg0KPj4gVW5uZWNlc3Nh
cnkgY29tbWVudCwgaXQncyBjbGVhciBmcm9tIHRoZSBjb2RlIGZsb3cgdGhhdCB2c3luY19jZmcu
dnN5bmNfc291cmNlDQo+PiBpcyBwYXNzZWQgZG93biBpbnRvIGJvdGggZnVuY3Rpb25zLg0KPj4N
Cj4+IFBlcmhhcHMgd2Ugc2hvdWxkIHBhc3MgZGlzcF9pbmZvLT52c3luY19zb3VyY2UgZGlyZWN0
bHkgaW50bw0KPj4gaHdfaW50Zi0+b3BzLnZzeW5jX3NlbCgpIGFuZCBvbmx5IGluaXRpYWxpemUg
dnN5bmNfY2ZnIHdoZW4gaHdfbWRwdG9wIGhhcyB0aGUNCj4+IGZ1bmN0aW9uLCB0byBtYWtlIHRo
aXMgY2xlYXIuDQo+DQo+IE5vLCBiZWNhdXNlIG9uIERQVSA4LjArIFdEIGlzIGFsc28gc2V0dXAg
cGVyIGludGYuDQo+DQo+Pg0KPj4+ICsgICAgdnN5bmNfY2ZnLnZzeW5jX3NvdXJjZSA9IGRpc3Bf
aW5mby0+dnN5bmNfc291cmNlOw0KPj4+ICsNCj4+PiAgICBpZiAoaHdfbWRwdG9wLT5vcHMuc2V0
dXBfdnN5bmNfc291cmNlKSB7DQo+Pj4gICAgICAgIGZvciAoaSA9IDA7IGkgPCBkcHVfZW5jLT5u
dW1fcGh5c19lbmNzOyBpKyspDQo+Pj4gICAgICAgICAgICB2c3luY19jZmcucHBudW1iZXJbaV0g
PSBkcHVfZW5jLT5od19wcFtpXS0+aWR4Ow0KPj4+ICsgICAgfQ0KPj4+DQo+Pj4gLSAgICAgICAg
dnN5bmNfY2ZnLnBwX2NvdW50ID0gZHB1X2VuYy0+bnVtX3BoeXNfZW5jczsNCj4+DQo+PiBUaGlz
IGNoYW5nZSBpcyBub3QgbWVudGlvbmVkIGluIHRoZSBjb21taXQgZGVzY3JpcHRpb24uICBXaGls
ZSB0cnVlIHRoYXQNCj4+IHBwX2NvdW50IGlzIG9ubHkgdXNlZCBieSBkcHVfaHdfc2V0dXBfdnN5
bmNfc2VsKCksIHRoYXQgaXMgc3RpbGwgYSB2YWxpZA0KPj4gZnVuY3Rpb24gdG8gYmUgY2FsbGVk
IG9uIERQVSA8IDU7IGl0IGRlbm90ZXMgdGhlIGFtb3VudCBvZiBwcG51bWJlcltpXSBhcnJheQ0K
Pj4gZW50cmllcyBhcmUgdXNlZCBhYm92ZS4NCj4+DQo+Pj4gLSAgICAgICAgdnN5bmNfY2ZnLmZy
YW1lX3JhdGUgPSBkcm1fbW9kZV92cmVmcmVzaCgmZHB1X2VuYy0+YmFzZS5jcnRjLT5zdGF0ZS0+
YWRqdXN0ZWRfbW9kZSk7DQo+Pg0KPj4gU2FtZSwgYWxzbyBub3QgbWVudGlvbmVkIGluIHRoZSBj
b21taXQgZGVzY3JpcHRpb24uICBmcmFtZV9yYXRlDQo+PiBpcyB1c2VkIGJ5IGRwdV9od19zZXR1
cF93ZF90aW1lcigpIG9uIERQVSA8IDguDQo+Pg0KPj4+IC0NCj4+PiAtICAgICAgICB2c3luY19j
ZmcudnN5bmNfc291cmNlID0gZGlzcF9pbmZvLT52c3luY19zb3VyY2U7DQo+Pj4gLQ0KPj4+IC0g
ICAgICAgIGh3X21kcHRvcC0+b3BzLnNldHVwX3ZzeW5jX3NvdXJjZShod19tZHB0b3AsICZ2c3lu
Y19jZmcpOw0KPj4NCj4+IEJ1dCBhbGwgb2YgdGhlIGFib3ZlIGNvbW1lbnRzIGRvbid0IG1hdHRl
ciBpZiB0aGUgY2FsbCB0byBzZXR1cF92c3luY19zb3VyY2UoKQ0KPj4gaXMgcmVtb3ZlZCBlbnRp
cmVseSAtIGl0IGRpZG4ndCBtb3ZlIGFueXdoZXJlIGVsc2UuICBUaGlzIGlzIG5vdCBkZXNjcmli
ZWQgaW4NCj4+IHRoZSBjb21taXQgbWVzc2FnZS4NCj4NCj4gRnVuLCBJIG1pc3NlZCBpdCBlYXJs
aWVyLiBUaGFua3MgZm9yIHBvaW50aW5nIGl0IG91dC4NCj4NCj4gVGVndWgsIHNpbmNlIHdlIG5l
ZWQgdG8gZml4IHdhdGNoZG9nIG9uIE1EUCA4LjArLCBJJ2xsIHNlbmQgdjMgb24gbXkNCj4gb3du
LCBpZiB5b3UgZG9uJ3QgbWluZC4NCj4+DQo+PiAtIE1hcmlqbg0KPj4NCj4+PiAtDQo+Pj4gLSAg
ICAgICAgZm9yIChpID0gMDsgaSA8IGRwdV9lbmMtPm51bV9waHlzX2VuY3M7IGkrKykgew0KPj4+
IC0gICAgICAgICAgICBwaHlzX2VuYyA9IGRwdV9lbmMtPnBoeXNfZW5jc1tpXTsNCj4+PiArICAg
IGZvciAoaSA9IDA7IGkgPCBkcHVfZW5jLT5udW1fcGh5c19lbmNzOyBpKyspIHsNCj4+PiArICAg
ICAgICBwaHlzX2VuYyA9IGRwdV9lbmMtPnBoeXNfZW5jc1tpXTsNCj4+Pg0KPj4+IC0gICAgICAg
ICAgICBpZiAocGh5c19lbmMtPmhhc19pbnRmX3RlICYmIHBoeXNfZW5jLT5od19pbnRmLT5vcHMu
dnN5bmNfc2VsKQ0KPj4+IC0gICAgICAgICAgICAgICAgcGh5c19lbmMtPmh3X2ludGYtPm9wcy52
c3luY19zZWwocGh5c19lbmMtPmh3X2ludGYsDQo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAg
IHZzeW5jX2NmZy52c3luY19zb3VyY2UpOw0KPj4+IC0gICAgICAgIH0NCj4+PiArICAgICAgICBp
ZiAocGh5c19lbmMtPmhhc19pbnRmX3RlICYmIHBoeXNfZW5jLT5od19pbnRmLT5vcHMudnN5bmNf
c2VsKQ0KPj4+ICsgICAgICAgICAgICBwaHlzX2VuYy0+aHdfaW50Zi0+b3BzLnZzeW5jX3NlbChw
aHlzX2VuYy0+aHdfaW50ZiwNCj4+PiArICAgICAgICAgICAgICAgICAgICB2c3luY19jZmcudnN5
bmNfc291cmNlKTsNCj4+PiAgICB9DQo+Pj4gfQ0KPj4+DQo+Pj4gLS0NCj4+PiAyLjM0LjENCj4+
Pg0KPg0KPiAtLQ0KPiBXaXRoIGJlc3Qgd2lzaGVzDQo+IERtaXRyeQ0KWWVzIHBsZWFzZSwgdGhh
bmsgeW91Lg0KDQpSZWdhcmRzLA0KVGVndWggUy4NCg==
