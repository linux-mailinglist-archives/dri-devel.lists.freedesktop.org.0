Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2FFA5F1FC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 12:07:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77AA10E840;
	Thu, 13 Mar 2025 11:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="c7vUCT4Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010002.outbound.protection.outlook.com [52.103.67.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A03B10E840
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 11:07:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ix7p26sqXSoWfdTpN6dh1ZrYEC79l6CTkpnZuWfyHOaRT4cpfwmdXOkEv+CZExiS0DckaZ92T9FXnJI5vNQZQ/OYMcu85zC7PbsdgBg2cKVuOhH66E0FxrQMJkPlhjrhUIeDnxNfB3r1IVVL6hW2hJiaYmI12lZVenBe4iUYHXTIT3Hf7LRRyfEtXZQ24YAc66G8mTkaHOE5Snn2y1e29IEGiakLWK5s+dhUAcNyrapRPkJvUzJI1vsV5tXMQnPIektSykDQurOz5fo3sGIe59xddLenRexfFrs2i3tUj+l9a1Zq1IBLtlWlnB+JK24ZsytaucxbIU7zW/BaP5w6nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHdlgiA9s6wjPj0PhTu0F5pb/O6J2JhfsYMP5H1ZF1E=;
 b=kfAUC2zApIMcc6cvxn+CXS09HkHaKz1G7OKuarqi+StjLOWWvVyqMfzOruKXHv2iv2lMcSpKVq/s3auLA3wuukWOdVuwmD81bSIvXioJdx+ZoYv0xbjb74x3OqY6cQOa1950B5Qx+u89bYuGiGOlg28tnmj3VlbiPNf919MV40O/sQQOTd1sIlR+phvepj4pQ1khO4J99VW3e7kLZuPYEzVAAyp706gXVSzRr4hiiM7T+UMRX8sG3vAmJLiNsVQgxB2hN4RN8YYEDHOUBNvx6hEDAeTImyUPUuz+agdrpvC2O2wkz0NGoefA9CEcWLAk9hAIZnRzTO7tT1R03fQ/3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHdlgiA9s6wjPj0PhTu0F5pb/O6J2JhfsYMP5H1ZF1E=;
 b=c7vUCT4Q1yhgeRmjendAQ91fP1n8cMFKIHvpuQkws8/Ser9EUlA2e7z/D5ngzqkiG9Y33lnm0qS0gtvSCj9lWMvVeE2OSADgup4wqxb0f8KI3GpjfRUBGh/AbSSMkUXcYGLGs+n5D6hACAJzy38qHJeX/7ZXoUV9I6Ssb75tpeLWlgB+mSgSrPdmFjoBw+oR1aXhHdWqU1O8B0iPaBLW3FQHMPhS1XfXAREO9jZQ+teIjPy8pfNWVLvJ1uiuctrMS3MUg1WNbUEvuF7qUu1x5zMftIcZENX0x16Gw5QBVTO9eGxW49k/lCtFd5nkfZUTxUjjBVjTqNmm7Z8MJTxJIg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAXPR01MB4310.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Thu, 13 Mar
 2025 11:06:55 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8534.025; Thu, 13 Mar 2025
 11:06:54 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Petr Mladek <pmladek@suse.com>
CC: Kees Cook <kees@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Sven Peter <sven@svenpeter.dev>, Thomas
 Zimmermann <tzimmermann@suse.de>, Aun-Ali Zaidi <admin@kodeit.net>, Maxime
 Ripard <mripard@kernel.org>, "airlied@redhat.com" <airlied@redhat.com>,
 Simona Vetter <simona@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "apw@canonical.com"
 <apw@canonical.com>, "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, Hector Martin <marcan@marcan.st>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Thread-Topic: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Thread-Index: AQHbky3sGKkFjHx1MkmFN9rVUAvYHLNvYl0AgAAA5jqAAAKdAIAAAT1vgAA66ACAAD2b+IAAA9kAgADIeYCAABcugIAAAUrBgAAA64CAAASlV4AAGpYAgAAFFAA=
Date: Thu, 13 Mar 2025 11:06:54 +0000
Message-ID: <D1A20E79-554E-4E91-BE47-B6493BDC3823@live.com>
References: <9092a9ed-aecf-40bd-9d15-b53d60d035b5@suse.de>
 <PN3PR01MB959715C19BCEA54426D24934B8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <ff3a9c58-5c7a-4c48-8a9e-cc828a43baed@app.fastmail.com>
 <PN3PR01MB9597E5C609290DB1A967263CB8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9HgVn-XELC065w0@smile.fi.intel.com>
 <47AE7FCD-0F30-4379-ADE9-090A15ACD58F@live.com>
 <Z9Kb8zMJgmSP-rgD@smile.fi.intel.com>
 <PN3PR01MB959780176C0B16C36FBD59C3B8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9KdzZUxs3vlwp0Z@smile.fi.intel.com>
 <PN3PR01MB9597A8F02423B9E4C585F5EBB8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9K36SRz7Ja_AyQb@pathway.suse.cz>
In-Reply-To: <Z9K36SRz7Ja_AyQb@pathway.suse.cz>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAXPR01MB4310:EE_
x-ms-office365-filtering-correlation-id: 4f465fa2-9e06-44ec-2521-08dd621f2a38
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|461199028|6072599003|15080799006|8060799006|19110799003|7092599003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?QXk5MjFuOXVPMVA2S1lvSDZFNU5zanN6SHk5c3BqZElqc211aEhMdFhYd3FG?=
 =?utf-8?B?NVpJWlp2d2pRTGFpU20vR0NvSVUxOVR5bkRMaHZlSzFqRVdtMmtWL3JJc0ZY?=
 =?utf-8?B?Rnp6dXpaMUxGT2RQQmljRmI4NllDRmJNK0JrVUVkWGVhNnZNbkpLSHp4SjJ4?=
 =?utf-8?B?QlNMUDkzSXFwQUhUOXNPUEdCQ0w3QmFkeSt6ZXFScmwyR0k5V2lzdlpDUTlR?=
 =?utf-8?B?Q1hYd1ZmazhISmRFWEpRZ0kvRGcyRjA5TFdHUFM5VDZQd0JyOTczaVQ2bnNE?=
 =?utf-8?B?b2Nnc1NSWXpUK0ozRmhDZU1UNVBhSHlHRnMwRlc2WlUxWHN6MWZLMlBiSWk0?=
 =?utf-8?B?ZXdXMU9JeXBvcFNlVkdDSUpPWlEvcTRVaVN5RE5TQkVINXVkenBaaGF4dGtG?=
 =?utf-8?B?ZVk5dDdxcy9tUlNvVGJldGZUSCtjbXRTTW5QMzhRTVZWdUdFdzdrdGtpYzRy?=
 =?utf-8?B?K003d254SDY3MUdnS3FTV0w5YVg0VGRhQUlJSHZxbG5RZWJYUWh0Y0VOQ1dF?=
 =?utf-8?B?SGVnS1RCT0dHWVA3OXlsaEsrTm9nYStIT0grZGUrZVRwbnpRbllSR3ZDVmlY?=
 =?utf-8?B?R0ZvN3VlOXQ4K3hUQW9ydkJ0b2dpNmdIUnpUTG04Zm0zYnRQTEg1akdNd1dh?=
 =?utf-8?B?SkZrdnEyUXFKRXdsUDFLUWlBdlQyeGd0aGcyWHVpZ3FqWGxHU0xiQ0VKMU5Q?=
 =?utf-8?B?WForZzQweFdydytzNVdGajZpT0prcnpzTHdrR0IvcXdTZDRtSmtBMHJSNWNH?=
 =?utf-8?B?cnBlZHNzS3A5cGtTbXN1WEt1Mko3dk5QaVc3SnJJYXlRS3lTaERYanhWbXJL?=
 =?utf-8?B?bDFMM1lGTHJZakNPRGs1UHdFYlBQbVhhNFFjMm53SEJTZVhTM1BaNUNmTm41?=
 =?utf-8?B?MnhJM202bzVoMDZ6YTdNWmdFb2NtT2gxbUNKVEgxc2swbms0Q1kxNHY1Umtt?=
 =?utf-8?B?Q1JGQkc2a3N1QzVzZ1RSeUM2Z3BaTXNXb01ZaHBQVzJNTTE1MzBjcDlmaWJC?=
 =?utf-8?B?RldFdFZGako2K1RGUHJqZFd2ckVVMUplSVg0NGhjWWdOdDBJSXRZSzNpTDNL?=
 =?utf-8?B?N0k2WDFyKzFBMnU0UDVPVlVFWFdnY3dUVUcvTFJkbytIakwzbHpVajVKdmMx?=
 =?utf-8?B?V2k2RVZoOXY3S2xuVDhKR253QkZXdXBoUzIzSndMNEFrbitObG9EcE8xQVBm?=
 =?utf-8?B?VVk5RjFVdUZJcXJxbWFueXpHSnVTdC8yQWdXNzNlM1daUVJQa0lhS0xGWVc3?=
 =?utf-8?B?OG0yNUlBM3daZFRyYVEvYzZUeFRzY3U4bnJ0U2Eza0V3Y1pYWHRYMXdteUtG?=
 =?utf-8?B?REhOay9KdzZZem90TmVtQ2s3dzk4OEUzek8rYkpNbzdCRzdPRmN0elpMcER5?=
 =?utf-8?B?cHUxb1o2Mm81UnZqK0lNa3NDd2VRWk82bGhwMXhZVHY2Yk83bHhIbnZzQURU?=
 =?utf-8?B?dnExc1krdWdTam9ZU08xdVM1UklSK1RMYjMwRHRFSFc2RDZuc0h6Q3BDOUMx?=
 =?utf-8?Q?7VW1EA=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VW9yOG0yS2UwOGZ3MDU2ZTFWdUhBL010allIb3NqZ2dLcU02UHk2RXEzdktB?=
 =?utf-8?B?TkxHZWJqMlZlRHgxWUQ3b0NRSVpHOEErU2t5dkVMS3NVUmVNZTNEWXcrNUs4?=
 =?utf-8?B?NjYybHJhSXVJVSt2a0o4NHY4SXpWMDFWaGU3VnJJZjVHMDYrZW16VzkzU1pH?=
 =?utf-8?B?SE9TY0YySk8zYUxaSWEvcGVTVUNzR1pOMW14NlRqcWJlTi9nTlBpeTZDZEx3?=
 =?utf-8?B?cTA1MjN3R0wzb2NRdytSeDdYSmhOY1MrZ2ZuL0lPOGhuNS85M3Z3ZVh2L1M5?=
 =?utf-8?B?RElCUGZndVB2aHZwMitJQnFObkUrVzFzTmFwTTVid0RUYXQrRVZEWlJhNURS?=
 =?utf-8?B?U3B0WG0waHlqa3g5andYRnJuVWpzejhpdk5NaW0rOTZYc0ZWdFdiTVlTajV3?=
 =?utf-8?B?Ly96ZE5SQ0ZIeXNXcjk0S1E3UDRPRG13Vld3eHB6dVoxektlUkxPbFdDWWZt?=
 =?utf-8?B?MlA0NWNNeVlVSkEyak52d1lIb1FnamZzeE1HV044UXluKytib0R3eTBERDFN?=
 =?utf-8?B?TG1uZ0k0UGpFbDduOXd3UWxtcUxMUUh0YkphTWNOc29xTCtuUGxJOUJqNXZD?=
 =?utf-8?B?c0sxNlJqNGRCeGFLeWp3eEdhM1hJTFVWclo4NWNxWEtwRlQreWt4dEpZZlhN?=
 =?utf-8?B?Tll6YnJBeUU2KzRUcFZsU250bkZqTm9RRW5vNkF4Z1FWYU5sQnBpQXZTZFg5?=
 =?utf-8?B?WDRyeWlFWWVNbEY2NjcvOHhDd1pGY0dUNGJ3THZZaDZKT2p1WjhCOEd1RGht?=
 =?utf-8?B?dXJISHNpeVUzajRDQnU0bjAvK3UwV0Q2dGNzWnpaaXpKTFFSUjNPSGNzZnBS?=
 =?utf-8?B?VGsxdGRTY0d5SzZGZ1RLaWxCelQwK1RMRUVISlFqYXlKQkhwYXNQZXRwNHRy?=
 =?utf-8?B?bCtNb3duYkdGN1hoREJKeWNsbDN2MGthY0I2SXl3WHFvR3l3VUpVMXBIdEY1?=
 =?utf-8?B?TzNYdFd1RDk1VC9CdjB1Tnd2SnJWV1plOGQzOVlUbEZ0ZExzZjIwRFhzbk9Q?=
 =?utf-8?B?NjNJUzQ4ODliczZWTmNqdTlUQmJDL1l0OXhma0tEMi82OXE2TlAwaDRQTmJS?=
 =?utf-8?B?YWc1Q25iMzRtdWRzT1ljUWpUaHJ4V3E5eHJXRURkRkpWWFo4SkVLZURENjBt?=
 =?utf-8?B?Nk5scWJrcFVWckMxcnFqWTF1WENHOEIvZzkrK2syeHE3cWxXNjlrckRTOUE5?=
 =?utf-8?B?OXo4OUpZcFBMeTI1YkpMcDZ6c2RpWVF3cjlWS3p3ZkRCdXZtS0NkaitEd21i?=
 =?utf-8?B?UGpTbEkrZHBuQmhKTXpQcm1valhzNmRZZHcvdDdMbnVqdkY3TXVoM2Z0UW1Y?=
 =?utf-8?B?ZnN2ZkowSlRqTllzcGUxOTFOeVhSc0FTaUV1S3ZHM2pzT0E5SVZxQ1RNRzdQ?=
 =?utf-8?B?ODYrbDBIWlNBMnB1NHpGcGttMU9SemRXSVRjelBDOWNWcm5nL2ExOTNHZ0Rh?=
 =?utf-8?B?MHFNQzRNOERvNDg3Zis4RTBYUlptaE4wNTJScXUxV0lRZXorSE1PYzZFU0pW?=
 =?utf-8?B?VjFSSjUxbFo5a1gwblNHbnltQXZadHhOSG81OXJiS0dsTU5tNWNZZzA0ZTNz?=
 =?utf-8?B?RlRqSEZTdmZ4YWxpdUdBZEZ0WllJZjFRbzB0Z3ord0pTR0ZkMU4zYnhDNEtl?=
 =?utf-8?B?ZjZHaXk2RGdxdUxLbERrUDc2T1FMdzZpeXlLa0tDaHlvL3VlUTJzYklrOFFW?=
 =?utf-8?B?cWFQdHorUUVmbkE5elF5N0Z3QU1jbHpLeVcxQjBUZWNkZkJwMXBQOFJHbzlS?=
 =?utf-8?Q?RPLvaD1a00NRChe9DMIaw0C2DIJMSWN6zzki8WI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <08348A8BA4A33D4A81486B446F229EA2@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f465fa2-9e06-44ec-2521-08dd621f2a38
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2025 11:06:54.7991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB4310
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

DQoNCj4gT24gMTMgTWFyIDIwMjUsIGF0IDQ6MTjigK9QTSwgUGV0ciBNbGFkZWsgPHBtbGFkZWtA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gQWRkaW5nIEtlZXMgaW50byBDYyB0byByZXNvbHZlIGhv
dyB0byBnZXQgdGhpcyBwYXRjaCBpbnRvIHRoZSBtYWlubGluZS4NCj4gDQo+IE9uIFRodSAyMDI1
LTAzLTEzIDA5OjEzOjIzLCBBZGl0eWEgR2FyZyB3cm90ZToNCj4+IA0KPj4gDQo+Pj4gT24gMTMg
TWFyIDIwMjUsIGF0IDI6MjfigK9QTSwgQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5r
b0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IO+7v09uIFRodSwgTWFyIDEzLCAy
MDI1IGF0IDA4OjUzOjI4QU0gKzAwMDAsIEFkaXR5YSBHYXJnIHdyb3RlOg0KPj4+Pj4+IE9uIDEz
IE1hciAyMDI1LCBhdCAyOjE54oCvUE0sIEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVu
a29AbGludXguaW50ZWwuY29tPiB3cm90ZToNCj4+Pj4+IE9uIFRodSwgTWFyIDEzLCAyMDI1IGF0
IDA3OjI2OjA1QU0gKzAwMDAsIEFkaXR5YSBHYXJnIHdyb3RlOg0KPj4+Pj4+Pj4gT24gMTMgTWFy
IDIwMjUsIGF0IDEyOjU44oCvQU0sIEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29A
bGludXguaW50ZWwuY29tPiB3cm90ZToNCj4+Pj4+Pj4gT24gV2VkLCBNYXIgMTIsIDIwMjUgYXQg
MDc6MTQ6MzZQTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+Pj4+Pj4gT24gMTIgTWFy
IDIwMjUsIGF0IDk6MDXigK9QTSwgU3ZlbiBQZXRlciA8c3ZlbkBzdmVucGV0ZXIuZGV2PiB3cm90
ZToNCj4+Pj4+Pj4+PiBPbiBXZWQsIE1hciAxMiwgMjAyNSwgYXQgMTM6MDMsIEFkaXR5YSBHYXJn
IHdyb3RlOg0KPj4+IA0KPj4+IC4uLg0KPj4+IA0KPj4+Pj4+Pj4+IEkgZG9uJ3QgaGF2ZSBhIHN0
cm9uZyBvcGluaW9uIGVpdGhlciB3YXk6IGZvciBTTUMgSSBqdXN0IG5lZWQgdG8gcHJpbnQNCj4+
Pj4+Pj4+PiBGb3VyQ0Mga2V5cyBmb3IgZGVidWdnaW5nIC8gaW5mb3JtYXRpb24gaW4gYSBmZXcg
cGxhY2VzLg0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IEknbSBwcmVwYXJpbmcgdGhlIFNNQyBkcml2
ZXIgZm9yIHVwc3RyZWFtaW5nIGFnYWluIChhZnRlciBhIHR3byB5ZWFyIGRlbGF5IDotKCkNCj4+
Pj4+Pj4+PiBhbmQgd2FzIGp1c3QgZ29pbmcgdG8gdXNlIG1hY3JvcyB0byBwcmludCB0aGUgU01D
IEZvdXJDQyBrZXlzIHNpbWlsYXIgdG8NCj4+Pj4+Pj4+PiBEUk1fTU9ERV9GTVQvRFJNX01PREVf
QVJHIGZvciBub3cgdG8ga2VlcCB0aGUgc2VyaWVzIHNtYWxsZXIgYW5kIHJldmlzaXQNCj4+Pj4+
Pj4+PiB0aGUgdG9waWMgbGF0ZXIuDQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gUmlnaHQgbm93IEkg
aGF2ZSB0aGVzZSBpbiBteSBsb2NhbCB0cmVlIChvbmx5IGNvbXBpbGUgdGVzdGVkIHNvIGZhcik6
DQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gI2RlZmluZSBTTUNfS0VZX0ZNVCAiJWMlYyVjJWMgKDB4
JTA4eCkiDQo+Pj4+Pj4+Pj4gI2RlZmluZSBTTUNfS0VZX0FSRyhrKSAoayk+PjI0LCAoayk+PjE2
LCAoayk+PjgsIChrKSwgKGspDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IFRoYXQgc2VlbXMgdG8gYmUg
YSBuaWNlIGFsdGVybmF0aXZlLCB3aGljaCBJIGd1ZXNzIFRob21hcyB3YXMgYWxzbyBzdWdnZXN0
aW5nLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gSSBkb24ndCB0aGluayBpdCdzICJuaWNlIi4gRWFjaCBv
ZiB0aGUgYXBwcm9hY2hlcyBoYXMgcHJvcyBhbmQgY29ucy4NCj4+Pj4+Pj4gWW91IGNhbiBzdGFy
dCBmcm9tIGJsb2F0LW8tbWV0ZXIgaGVyZSBhbmQgY29tcGFyZSBpdCB3aXRoIHlvdXIgJXAgZXh0
ZW5zaW9uLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gQWxzbywgY2FuIHlvdSBzaG93IHRoZSBibG9hdC1v
LW1ldGVyIG91dHB1dCBmb3IgdGhlIHZzcHJpbnRmLmM/DQo+Pj4+Pj4gDQo+Pj4+Pj4gSGVyZSBh
cmUgeW91ciBvdXRwdXRzOg0KPj4+Pj4gDQo+Pj4+PiBUaGFuayB5b3UhDQo+Pj4+PiANCj4+Pj4+
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4+Pj4+PiBGb3IgYXBwbGV0YmRybToNCj4+Pj4+PiANCj4+Pj4+PiBh
ZGl0eWFATWFjQm9vazp+L2xpbnV4JCAuL3NjcmlwdHMvYmxvYXQtby1tZXRlciAkUDQgJE1BQ1JP
DQo+Pj4+Pj4gYWRkL3JlbW92ZTogMC8wIGdyb3cvc2hyaW5rOiAxLzEgdXAvZG93bjogNjQvLTE5
ICg0NSkNCj4+Pj4+PiBGdW5jdGlvbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBvbGQgICAgIG5ldyAgIGRlbHRhDQo+Pj4+Pj4gYXBwbGV0YmRybV9yZWFkX3Jlc3BvbnNlICAg
ICAgICAgICAgICAgICAgICAgMzk1ICAgICA0NTkgICAgICs2NA0KPj4+Pj4+IGFwcGxldGJkcm1f
cHJvYmUgICAgICAgICAgICAgICAgICAgICAgICAgICAgMTc4NiAgICAxNzY3ICAgICAtMTkNCj4+
Pj4+PiBUb3RhbDogQmVmb3JlPTEzNDE4LCBBZnRlcj0xMzQ2MywgY2hnICswLjM0JQ0KPj4+Pj4g
DQo+Pj4+PiBUaGlzIGlzIGVub3VnaCwgbm8gbmVlZCB0byByZXBlYXQgdGhpcyBmb3IgZXZlcnkg
cGFyYW1ldGVyLg0KPj4+Pj4gDQo+Pj4+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4+Pj4gRm9yIHZzcHJp
bnRmOg0KPj4+Pj4+IA0KPj4+Pj4+IGFkaXR5YUBNYWNCb29rOn4vbGludXgkIC4vc2NyaXB0cy9i
bG9hdC1vLW1ldGVyICRPTEQgJE5FVw0KPj4+Pj4+IGFkZC9yZW1vdmU6IDAvMCBncm93L3Nocmlu
azogMS8wIHVwL2Rvd246IDIyMC8wICgyMjApDQo+Pj4+Pj4gRnVuY3Rpb24gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgb2xkICAgICBuZXcgICBkZWx0YQ0KPj4+Pj4+IGZvdXJj
Y19zdHJpbmcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDQ3OSAgICAgNjk5ICAgICsy
MjANCj4+Pj4+PiBUb3RhbDogQmVmb3JlPTI2NDU0LCBBZnRlcj0yNjY3NCwgY2hnICswLjgzJQ0K
Pj4+Pj4gDQo+Pj4+PiBTbywgd2UgZ2V0ICsyMjAgYnl0ZXMgdnMgKzQzIGJ5dGVzLiBJdCBtZWFu
cyBpZiB3ZSBmb3VuZCA1KyB1c2VycywgaXQgd29ydGgNCj4+Pj4+IGRvaW5nLg0KPj4+PiANCj4+
Pj4gV2lsbCBpdCBhbHNvIGRlcGVuZCB1cG9uIHRoZSBudW1iZXIgb2YgdGltZXMgaXQncyBiZWlu
ZyB1c2VkPyBJbiBhcHBsZXRiZHJtLA0KPj4+PiBpdCBpcyBiZWluZyB1c2VkIDMgdGltZXMuIFBy
b2JhYmx5IG1vcmUgaW4gQXNhaGkgU01DLg0KPj4+IA0KPj4+IFJpZ2h0LCBpdCBkZXBlbmRzIG9u
IHRoZSB1c2FnZSBjb3VudC4gQWxzbyBvbiBkaWZmZXJlbnQgYXJjaGl0ZWN0dXJlcyBpdCBtYXkN
Cj4+PiBnaXZlIGRpZmZlcmVudCByZXN1bHRzLiBPbiAzMi1iaXQgaXQgcHJvYmFibHkgZ2l2ZXMg
YmV0dGVyIHN0YXRpc3RpY3MuDQo+PiANCj4+IEJlc3QgdG8gZ28gYWhlYWQgd2l0aCB2c3ByaW50
ZiB0aGVuLiBQZXRyLCBhcmUgeW91IHN0aWxsIHRoZXJlPw0KPiANCj4gSSBhbSBoZXJlIGJ1dCB0
aGVyZSB3ZXJlIG1hbnkgb3RoZXIgdGhpbmdzIGluIHRoZSBxdWV1ZSA7LSkNCj4gDQo+IEkgZG8g
bm90IGhhdmUgc3Ryb25nIG9waW5pb24uIEkgYW0gbm90IGZhbWlsaWFyIHdpdGggdGhlIEZvdXJD
Qw0KPiBmb3JtYXQgYW5kIGl0IGxvb2tzIGxpa2UgYSBtYWdpYyB0byBtZS4gQnV0IGl0IHNlZW1z
IHRoYXQgaXQgbWFrZXMNCj4gc2Vuc2UgZm9yIHRoZSB1c2Vycy4NCj4gDQo+IEkgcGVyc29uYWxs
eSBmaW5kIHRoZSAlcGNYIG1vZGlmaWVycyBhIGJpdCBsZXNzIGhhY2t5IHRoYW4NCj4gdGhlIHR3
byBtYWNyb3MgU01DX0tFWV9GTVQvU01DX0tFWV9BUkcuDQo+IA0KPiBTbyBJIGFtIGZpbmUgd2l0
aCB0aGlzIHBhdGNoOg0KPiANCj4gUmV2aWV3ZWQtYnk6IFBldHIgTWxhZGVrIDxwbWxhZGVrQHN1
c2UuY29tPg0KPiBUZXN0ZWQtYnk6IFBldHIgTWxhZGVrIDxwbWxhZGVrQHN1c2UuY29tPg0KPiAN
Cj4gDQo+IE5vdywgdGhlIHF1ZXN0aW9uIGlzIGhvdyB0byBnZXQgdGhpcyBwYXRjaCBpbnRvIHRo
ZSBtYWlubGluZS4NCj4gDQo+IE5vcm1hbGx5LCBpdCB3b3VsZCBtYWtlIHBlcmZlY3Qgc2Vuc2Ug
dG8gcXVldWUgaXQgdmlhIHRoZSBEUk0gdHJlZQ0KPiBiZWNhdXNlIGRyaXZlcnMvZ3B1L2RybS90
aW55L2FwcGxldGJkcm0uYyBpcyBhIG5ldyBkcml2ZXIuLi4NCj4gDQo+IEJ1dCB0aGlzIHRpbWUg
dGhlcmUgaXMgYSBjb25mbGljdGluZyBwYXRjaHNldCB3aGljaCBpcyByZXdvcmtpbmcNCj4gdGhl
IGVudGlyZSBsaWIvdGVzdF9wcmludGYuYyBmaWxlLCBzZWUNCj4gMjAyNTAzMDctcHJpbnRmLWt1
bml0LWNvbnZlcnQtdjYtMC00ZDg1YzM2MWMyNDFAZ21haWwuY29tDQoNCkxpbmsgc2VlbXMgdG8g
YmUgYnJva2VuDQo+IEFuZCBpdCB3aWxsIGxpa2VseSBiZSByZWFkeSBmb3IgdGhlIG5leHQgbWVy
Z2Ugd2luZG93IGFzIHdlbGwuDQo+IEkgYW0gZ29pbmcgdG8gcmV2aWV3IGl0IHJpZ2h0IGF3YXku
DQo+IA0KPiBJdCBpcyBldmVuIG1vcmUgY29tcGxpY2F0ZWQgYmVjYXVzZSB0aGUgcGF0Y2hzZXQg
Y29udmVydGluZw0KPiB0aGUgcHJpbnRmIHRlc3QgbW9kdWxlIHRvIEtVTklUIGRlcGVuZHMgb24g
YW5vdGhlciBjaGFuZ2VzDQo+IGluIEtlZXMnIHRyZWUgKG1vdmluZyBrdW5pdCB0ZXN0IG1vZHVs
ZXMgdG8gbGliL3Rlc3RzLykuDQo+IFNvIGl0IG1pZ2h0IGJlIGVhc2llciB3aGVuIGl0IGdvZXMg
dmlhIEtlZXMnIHRyZWUuDQo+IA0KPiBBbmQgaXQgbWlnaHQgYmUgZWFzaWVyIHdoZW4gZXZlbiB0
aGlzIHBhdGNoIGdvZXMgdmlhIEtlZXMnIHRyZWUuDQo+IA0KPiBNeSBwcm9wb3NhbDoNCj4gDQo+
IEkgc3VnZ2VzdCB0byBzZXBhcmF0ZSB0aGUgZm91cmNjX3BvaW50ZXIoKSB0ZXN0IHVwZGF0ZQ0K
PiB0byBhIHNlcGFyYXRlIHBhdGNoIGFuZCBhZGQgaXQgbGF0ZXIgYWZ0ZXIgdGhlIG1lcmdlIHdp
bmRvdw0KPiB3aGVuIHRoaW5ncyBzZXR0bGUgZG93bi4NCj4gDQo+IEkgbWVhbiB0byBzZW5kIHRo
ZSB2c3ByaW50Zi5jLCBjaGVja3BhdGNoLnBsLCBhbmQgZG9jIHVwZGF0ZQ0KPiB2aWEgRFJNIHRy
ZWUgdG9nZXRoZXIgd2l0aCB0aGUgbmV3IGFwcGxldGJkcm0uYyBkcml2ZXIuDQoNClNvdW5kcyBn
b29kLiBBdCBsZWFzdCB3ZSBjYW4gZ2V0IGl0IHdvcmtpbmcuIEnigJlsbCBtYWtlIHN1cmUgdGhl
IHNlbGYNCnRlc3RzIGdldCB1cGRhdGVkIG9uY2UgNi4xNS1yYzEgZ2V0cyByZWxlYXNlZCwgb3Ig
S2VlcyBjYW4gc2hhcmUNCmhpcyB0cmVlLCB3aGVyZSBJIGNhbiBhZGQgdGhlIHRlc3RzIGFzIHdl
bGwuDQoNCknigJlsbCBzZW5kIGEgdjIgc28gdGhhdCBUaG9tYXMgY2FuIHRha2UgdGhlbSB1cC4N
Cj4gDQo+IEFuZCB1cGRhdGUgdGhlIHNlbGZ0ZXN0IGxhdGVyIHdoZW4gYm90aCBEUk0gdHJlZSBh
bmQgS1VOSVQNCj4gdXBkYXRlIHJlYWNoZXMgbWFpbmxpbmUuDQo+IA0KPiBIb3cgZG9lcyB0aGF0
IHNvdW5kLCBwbGVhc2U/DQo+IA0KPiBCZXN0IFJlZ2FyZHMsDQo+IFBldHINCg0KDQo=
