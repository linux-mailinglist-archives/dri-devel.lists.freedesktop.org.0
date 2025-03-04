Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35824A4E032
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 15:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C18510E1C1;
	Tue,  4 Mar 2025 14:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="tj+x28+W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010015.outbound.protection.outlook.com
 [52.103.68.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5721510E1C1
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 14:07:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C80hJOZPzs29eTymFLrmko1hYq4612vzaaaMhj2cgcLC1qjHQ86jocSkoKQ+fmQnEIdLBV7gAyg5K9Vhr5k5n7ocFwlvm/lEPQ7FCJ52nPRGlthd6aDcvyK5VE4+0A2S75Ffb2IYDTjqt0w8vOI/hWZHuYDBzhYpqLkIvsl1nM9WBWLSUcVAUtRLyThnn4TaJxpr1NSEXnZDBWQCcyDD1EzGV/i1k0qX98yzed/v5uI+b4suajlHXyLi2lEfaTO46mBMKiAGFFGtj9eSWB0D7FpCQvmIL6stj2qMKvZeQ1esDHjWzzmidUIgDnTAnlR8/hNr1Q26twlMOi3zXhfCRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BY+TM8c8KjTt8RhzMl/Qp8+u2OOfSW7as8eo6psCvSY=;
 b=gjbmVcSMV/LNpHM6FSp5pcvCMgtT9Id6ttgsfijNTmm6mTihTf1Tyy2W6q8R1gNf8jcfDdxTrul4OzRBi8jaVqhamLmVj749YzhWU4chEhVDPEoQafyWzOpTJgGTIZI3xmHWb4NxbsIhiylnQjHRA3+iVyagK876aSgeUDsa7BMfoE/mtlkp/en+Tb0z6oKrr0KMGlEeC1eU3+J2dXRoq040urkv04l0WuysNvTDmG2v8EL+9T08UGyoUEfAG9WgLuQ7qronX54Z4uctXpsAvuD8s6r7rksdZOzkTsahCLRRgUsp0EvRlBavP08ZiS41i6mJiHJD0DXJXyOgfgqpLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BY+TM8c8KjTt8RhzMl/Qp8+u2OOfSW7as8eo6psCvSY=;
 b=tj+x28+WoArRZPeP7ZWTveMQm3s1MyO/a5td8WGKfK86sqQ9l/7pJDv4HTGFRRDu63SQLOFms4DrVNHvN7J4lKabYUYlorcgfA4yd/zKr/Be/ptIAs9q8oTum9gfYUxtj0RLX5Dey+h2X9GHRycAYcCSn3vbdjhYZsG8Ct/wGuvIZ/88qzfJxl1C/PN/fRtTuUWgN6cZAYUkmf71IZwwaYthyaUvGg8BjapWnQNFbr5+kaYY/32oM90Dcxr2gp+8Dn3A1lqqwMvQwzZpM7ihv1Dw3rOCxKO+bI+HmroyeSvDT68XAIJdJ9Q/w//GLXqQiHL/qbFuhhKMJUaR+SnYnA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PPF729037332.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::1b1)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Tue, 4 Mar
 2025 14:06:56 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 14:06:56 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Kerem
 Karabay <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali
 Zaidi <admin@kodeit.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/appletbdrm: fix format character for size_t
Thread-Topic: [PATCH] drm/appletbdrm: fix format character for size_t
Thread-Index: AQHbjQ0N72VlccQSqEqbPJAsUikvVrNjA0XH
Date: Tue, 4 Mar 2025 14:06:56 +0000
Message-ID: <PN3PR01MB959782C84BF1E329273BD649B8C82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <20250304135456.429407-1-jani.nikula@intel.com>
In-Reply-To: <20250304135456.429407-1-jani.nikula@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PPF729037332:EE_
x-ms-office365-filtering-correlation-id: 9bb716c5-5e1e-4c83-1186-08dd5b25d2e9
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|8060799006|6072599003|7092599003|19110799003|15080799006|461199028|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: =?utf-8?B?dXE4WjM5ZFlFcU9FRGJtbFFHY3IvRkRUeXNMU3JSTnJuRGNRQjBpeDZBdnh3?=
 =?utf-8?B?Sy9lbEN6dkZJRUZrd09BZ1g0ak1xWWQ3UG8wcnNEeHl5VnBydDhlbS9JZU5t?=
 =?utf-8?B?M0Fjek1YeGZOYlY4Y1hsUjVGN2JnNklpWnAvUWw0THRjOVpzclpEZExWTmlO?=
 =?utf-8?B?WG13RmZPUmNuWTg2OHp5aW92RW1xNXk0MXVTTXJmZ0h1T0Q3WFl2ZjF3R1lV?=
 =?utf-8?B?N2ZYeGh0Y2RjQmZUR1grM1d3SThNY3ZoRll6OTdCOUwwOVRqNERBT1F5MkhI?=
 =?utf-8?B?emQ3SW5UQlRkZzlNenVNL20xYkFrc0YxN3NtWGFqZEFETm16dkp6WVpYTmFh?=
 =?utf-8?B?SEV2Y2cxYk41TFlNUGxnWk1rbjhMQk14VVVma2hQSkd4dU1aUzkzUGVtZ1U4?=
 =?utf-8?B?QnQ3OWcyVnh0YSsva3dtVEc5ZWJWbmJib243aCtyVVN0eCtoL0xYU2Uwcm40?=
 =?utf-8?B?amJBQXdzWHNnd3BkZXEzVmZqLzl5V3g3cE9YMUFyU0FqbDkzVkZ3TVJJcFcr?=
 =?utf-8?B?aUJ6c29SMnErdlNVa3B4WnA2SGtJUkFmR09WVVFxU2Q1RTZXNUdDMHNUT1pH?=
 =?utf-8?B?WkZNdG1uZFVKd2xseUtRTXVsVGt5eXVCS1crNXRueW1VUldFeE5ycVhFeVlG?=
 =?utf-8?B?QWRLWXcrVzBQUEt6dkhRR0EzdnZkZEt2Mm9NMElHcGxSOXF2VElBcHFrMU8z?=
 =?utf-8?B?YmpVNkkrQ25oQUNNaElVdjdGcFo0Y0t6cjRvUUdBSmlhcUVyd3dZUVNIMSsr?=
 =?utf-8?B?NjZ0eUZUTXVVS1l1aWRsekxzY1Vma0lRRUp2Ris2Y3Y3T1FMZXBQaE5XUG9I?=
 =?utf-8?B?TjkxZ3U0SVJROFlsNzJkclJpK0R6NnJuczBOeFdtSURFY2VXbXg3OEh3MzVR?=
 =?utf-8?B?akpSZHVIUWltUTVvNlpwT3Q0UyttVk51azdRb2xmWFd6R0NSRXQ2UEpaOTRz?=
 =?utf-8?B?Wmd2MDhJbFc1Vy9oSnpHa0Njd0pnNnU4V0JhVi9xejB2Z21aZ3FHbENYaWJp?=
 =?utf-8?B?Q25yZG9nd2lGelFIVm1xQmp1OXFkQjE1TmUvclROQmFLWjFSRWRkcHJoc3FW?=
 =?utf-8?B?MklVOTRNNEUyWklpa2xGc0pSd0ttWFN2bTB5VXRFbkJpL1NqYlBvdUZIT2xh?=
 =?utf-8?B?MUZ4elgzYkh2UlRPZ2FSUjNtbllQaGxQcW5xMG1nVk9FSlFyQUJXNlpOc3Jm?=
 =?utf-8?B?MG45dVVoOUtldVZRNEx0MGxuamFMamxRTGZneXREUFJYNUdXcERLOVBxb016?=
 =?utf-8?B?MDcvV0hEeVFWZzV4NnNoSS93ZDFaN0I1NTFLaFpGMkdBaGJPZnJKbEUwR0dp?=
 =?utf-8?B?ak12Tk83cUpabndlSWxaTVJJeVpYOGtzaUR5K1ZYRDNTWjlkQjNkS3E5U0JU?=
 =?utf-8?B?amFhRXlyaEZodUF6aG11M01BeXlPT01vRWsyTVpYMGZCZ3dYTXdzOTlsTFhR?=
 =?utf-8?B?Z0FJYmVsQndhYzdrVFV2Rk9oNjQwSlNMVWJXUExGclhDbm5XYzE5ZUpBazU1?=
 =?utf-8?Q?xqfk3U=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlVlVlBNelN6N29iaVk1K0doNWlySnM3amFFSWpiYUFOTjl4dWdaR29qa2RP?=
 =?utf-8?B?MTI1OEUwaTZJVlEvSXZ1TUhHMGpaSkFtQzh5d3lVaW9zYWlCZytudGN0cWNo?=
 =?utf-8?B?MGFKRlA1OGtjRFRwbERTL0l2Sk1HY3pnUVF2RXQ0N0hURTB1cmhKUkJyV1d4?=
 =?utf-8?B?emlXQlBQMEpkaDdCK1Q0SnBsSmgveXhOMUlnU2MzSkxMbXl1V3h1a00xZ2pY?=
 =?utf-8?B?M0pwWVppSlB6RzNPQWxEaTJ4QjUzNytyQ01xOEI0ZU9mc0tPWEoxMmR6NExt?=
 =?utf-8?B?WlpIWmZ1K3dDYUZWUDlxWDhKQkEvLzl5R1JxYzRmSi9EdmdKQTBVcmVGRkhX?=
 =?utf-8?B?c25xbDZ6TjVDNys0QytRWS8wRXcwOXhXZUtHR1d2cXowcEZNMGNEQ3NWWW5I?=
 =?utf-8?B?RkJ2ZXNlcCtVdmY0OTNPTHM4b2JQbStXUkdYUDVTT2pWeUZ2SDVaU1BTbW44?=
 =?utf-8?B?RXJDbHRENnBOaUZ6M2kzTjhqRGJLekdRQ05iNWQybUVMeWJLc0RHT2VWWi8r?=
 =?utf-8?B?QlZROG9PWXBHb3M2S24xcXlxcFNMaXRMYTVIVFpsWCtOTnFZZWwyZDVLSUo1?=
 =?utf-8?B?NWUyQks3c0xManBDcStVc1dnLzJLdDF0TyswV2V0c3hOQURLbUloSVpWOStR?=
 =?utf-8?B?aU5GQ0hBTmg5dGRha3QvM3B5Vk1Xb0g0eWx0MHQ5MzhvL1FjK2t2VmpUaGdw?=
 =?utf-8?B?dm80QWhvNnp1am1CMHB5c2VvZVo1d2J3TlBXeGQzSEREVVNSYTZZUlA3d0N1?=
 =?utf-8?B?SHQrQm1GdE1IeGtuVkhOaTNLYU4wekhoL2R5OEVCMUU5YU1PVmRPQnBGWits?=
 =?utf-8?B?dCtVN1QwSXVDaHorMG93NzFMQ00zbEU5YUhZYUc4bXpITU04eEhySGI5SHMr?=
 =?utf-8?B?UWpTVU43djRNY0RqVi9nQlg0cGZUL0RKblI4VElwWXAwZ0JET1d0Z0JrTUVT?=
 =?utf-8?B?YUFsamlpbG9mWktHZUNoK0VtMmVCbjg0U3cwcXh0cm04YkVLYk9hZTdQWSta?=
 =?utf-8?B?S1ZSNkwrcXdtc1ZBYjgrTjJldlVBRjlUSEl6TElZY0lHbG5VSmllMm1TVmlh?=
 =?utf-8?B?N0VUc3BHVWErODNrZ0pmSTBHMlFSMFJTeHVJb243M0dwc2o4T2VjRFAxZkta?=
 =?utf-8?B?S1NmRkFUN0lzS2RPWmROWElmUTRnb3pCWXFBcmgzZUZ6VGZiR00rUlI3ZGE5?=
 =?utf-8?B?YmhTYnlqU1dpSXBlRmtiTk1WcE02TzhWNExKcVgrbGU4bC9XcW1hU0g0bk8y?=
 =?utf-8?B?WVVKS2VZc2JsRzh1S2RWeE5GanViaDRhdjJBVHlkbWdIWG02V1k2T25OL2ta?=
 =?utf-8?B?YzRXc0U0UkU5SHAxeHUxbWIyd3NxN0Z3UnBMaXpKcEVsVmwwa1lGRUQyYWI3?=
 =?utf-8?B?MVk1bHRONkZydGQ4enVFUWM0bk9kOWxid3cwa0pkMG4xWUxuUWdOU2xSNXJ3?=
 =?utf-8?B?T3hZTTEvRGdRb0Juc0p5UTRXNkxJV1luSU1CNWV2SElpQ2xKOWZCMVRMMnZn?=
 =?utf-8?B?dm1LNTFYUk9EMHJzVkFpZHB6M3pKNzJmVFhremFVTW8ycUQ5Z0hNcUh4aWp5?=
 =?utf-8?B?ZGR5M1RibmFkTG9LdzZkdVI5SWJQWGtiRzZJa284bVV2OFdaSjNkQTJFZE5N?=
 =?utf-8?B?VFZFR1lXZUdvaTk4ZXcrbUdpSTAzWk9nbGd1NEw0Y09wY2pFM0FsdjUxd1Jx?=
 =?utf-8?B?ci83TGE2c0RIbjI3SHpQLzdPRCtmWFlMeitBbWQxVElzajd4NElwbnNSQmNk?=
 =?utf-8?Q?0+g0mKXyZ2QPMNKa5E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb716c5-5e1e-4c83-1186-08dd5b25d2e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 14:06:56.6795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPF729037332
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

DQoNCj4gT24gNCBNYXIgMjAyNSwgYXQgNzoyNeKAr1BNLCBKYW5pIE5pa3VsYSA8amFuaS5uaWt1
bGFAaW50ZWwuY29tPiB3cm90ZToNCj4gDQo+IO+7v1VzZSAlenUgZm9yIHNpemVfdCBpbnN0ZWFk
IG9mICVsdSB0byBhdm9pZCBmYWlsdXJlcyBvbiAzMi1iaXQgYnVpbGRzOg0KPiANCj4gZXJyb3I6
IGZvcm1hdCDigJglbHXigJkgZXhwZWN0cyBhcmd1bWVudCBvZiB0eXBlIOKAmGxvbmcgdW5zaWdu
ZWQgaW504oCZLCBidXQNCj4gYXJndW1lbnQgNCBoYXMgdHlwZSDigJhzaXplX3TigJkge2FrYSDi
gJh1bnNpZ25lZCBpbnTigJl9DQo+IA0KPiBGaXhlczogMDY3MGMyZjU2ZTQ1ICgiZHJtL3Rpbnk6
IGFkZCBkcml2ZXIgZm9yIEFwcGxlIFRvdWNoIEJhcnMgaW4geDg2IE1hY3MiKQ0KPiBDYzogS2Vy
ZW0gS2FyYWJheSA8a2VrcmJ5QGdtYWlsLmNvbT4NCj4gQ2M6IEF0aGFydmEgVGl3YXJpIDxldmVw
b2xvbml1bUBnbWFpbC5jb20+DQo+IENjOiBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxpdmUu
Y29tPg0KPiBDYzogQXVuLUFsaSBaYWlkaSA8YWRtaW5Aa29kZWl0Lm5ldD4NCj4gQ2M6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW5p
IE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiAtLS0NCj4gZHJpdmVycy9ncHUvZHJt
L3RpbnkvYXBwbGV0YmRybS5jIHwgNCArKy0tDQo+IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCkxHVE0NCg0KQWNrZWQtYnk6IEFkaXR5YSBHYXJnIDxn
YXJnYWRpdHlhMDhAbGl2ZS5jb20+
