Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8873AA607F4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 04:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEB110E1A4;
	Fri, 14 Mar 2025 03:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="LHL/T5FT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010005.outbound.protection.outlook.com [52.103.67.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E31010E1A4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 03:50:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONYGkhdEcJZDr2h7SmHkSMoFgsAn1dONIW8Mm3DIDb4ed0UjxbuBgv+z5xLpHG/6gEkdh0nwRGqlT1aAo/dSnv+QYl+FTPnxfgiCc8ONgYT2thwmr7xkl834O9tlbIhAaOYNFRjtm8RORJS5iNhkz3FGVvoZNtDDKlsl+r8J0T9SyLP4S/TxKgtOkiGRcuF0BOvUbcOghaseeHEbKUksoYe5G3iSX77IKVUXMDDR0uwSg2e4q6GpKlrjMvpY1AG9hNKFT3/8BPE89/3k7K9ybRb4jmSKTp8XIG+j37zwRb0G1HJU37GXMlWfRgkoTA59Uo3YgHWqvGstSh1tyVwYaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZQdBXDGXdpBvlkbi33vkzfwMNfhsnO8xZqcWx1U9hY=;
 b=UDtnlNyjIie7/kFfvsWxs2eDBJujclWLdlFZueWa3/VZZeb12h6Po90HyXpSCAmAshTj5gnwjO1XTiQWWya3xyYKi9KouBnC7gy5u/PM2zo4rPMM2Vd3bovjezm1hX3Tgs2NltE9aT7zy8kqlLKkrJGV6GgiyrG2cADURAZMvLf3HDLpo3CNg0AfEs2HK4aTeVu1Ok4eYv3UlTue2wpWxDOiUGk30seV0ThFoUbWXTJs2uamJZvt87wfTbn6lVTeYBSRLqA5gpPDR/ho/O13Ww3+lpEmXf4xfOPv89gRjzYV8RNstFKReXxqcPpQ0vNbVRf45Hs3KfwwZH4W8itIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZQdBXDGXdpBvlkbi33vkzfwMNfhsnO8xZqcWx1U9hY=;
 b=LHL/T5FTAyz5n3k7wMsWn4TBwBlkKodtK/M98lc3EcihPiNctL9ZpYAqzaoxlgmGBdOWSfhbMC5etQhPHVDkMQHM0fzBgWzMr7/egqVCZoBaltl7F6LlXSvvOp5RdRCjLB7sFshJ//+rY5WYCX1zQjYFvdtA2oU3FN/o/mkXMDvFI/b3NB1D+Um9ifJOUKAr24jEfhaM9clqn9t55MC5uXkL7pus10FQ3rBZ+s87ffhP3OGFq2mZiecfMAfcflpliUPVgmFwSMqN5519rFg8vMYKlPP9oHVl2VrEJ7KPkMH4RE21g3KQdEL/41v2Byd8IN1rIKJEgEQUDPX+XTdzIQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PPFE3A607474.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::3ac)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Fri, 14 Mar
 2025 03:49:48 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8534.025; Fri, 14 Mar 2025
 03:49:48 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Petr Mladek <pmladek@suse.com>, "keescook@chromium.org"
 <keescook@chromium.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 "airlied@redhat.com" <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>, "joe@perches.com" <joe@perches.com>, 
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Hector Martin
 <marcan@marcan.st>, Asahi Linux Mailing List <asahi@lists.linux.dev>
Subject: Re: [PATCH v2 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Thread-Topic: [PATCH v2 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Thread-Index: AQHblAnLeqVCj4Fam0Gdmrkn36ACWLNyACEA
Date: Fri, 14 Mar 2025 03:49:48 +0000
Message-ID: <496BFAE9-8BCE-4617-BEA6-71CD5F03B37D@live.com>
References: <F61E0F31-980B-4855-9AA8-D594BEEFEC6F@live.com>
 <79FA3F41-FD7A-41D9-852B-D32606AF5EB4@live.com>
In-Reply-To: <79FA3F41-FD7A-41D9-852B-D32606AF5EB4@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PPFE3A607474:EE_
x-ms-office365-filtering-correlation-id: 9957b553-6cd9-43f6-bbcc-08dd62ab44bd
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|461199028|8062599003|7092599003|8060799006|15080799006|3412199025|4302099013|440099028|10035399004|102099032|1602099012;
x-microsoft-antispam-message-info: =?utf-8?B?UTNkY25RaGViUDl4b3NweVpZZ0R6dG9qSjc1SjdYSWZ2MVBWemJJeWxEekR6?=
 =?utf-8?B?S2xkVzJIQS9mbXlOMUVEUUxabUZJVnJZQldJamxDKytLN0cxbUpEbnNoK3Nh?=
 =?utf-8?B?YWlub25yTmt6djRIdUNVSXg4NGJtQXU5SVZjRDBmeGxNcUZIVkx1blBhNXFV?=
 =?utf-8?B?aGVSYllpMldPWEhoYlloL3dXZVk5Q3M2QnRVSDdpQitjRmttUVVrK0RJM3pt?=
 =?utf-8?B?akVXbzJjdEtYUXNNL1hUYkttMXpINmxDN05kT2duU244dTcwWmdNaFBzazRp?=
 =?utf-8?B?Zy95NGltdmwwVlFVUFp5K3ArSnU5RXF2cGpIOUN3YUk2bGR1bEhkT1BReVMy?=
 =?utf-8?B?aE11ejFaalU2V3FiNnFDM2lsRm1qdHgwb0FDNUNrTGFwNXoya1dMSS82L1kr?=
 =?utf-8?B?RkdhZmN6eWxsTGYweTZHY2ZhTjBWM0NWRWpVb2lrZHl1NjJneWpTcitSYXdF?=
 =?utf-8?B?Z1JYOCtPU1VQK2JQbTVlb2FMOHNRRm85WmF2RFpUdm1HUUx3aVlWb2pkVUJk?=
 =?utf-8?B?SjlxNjg0N3BoMWxnWDZ6Wi9mcU5lVkNyeUNobmZ4MURHSC9RSHdZa3plQnJo?=
 =?utf-8?B?WnpOWk5jdC9SNWpuUHZtL2JpUWhLUENUZEVaL3gvT01mSnBrU1FyODRQZmRD?=
 =?utf-8?B?MlkyQ0JUSUJ4eDBMZVdSa1FHQW00YkNBR1graTBhcEZRcXp5SjJ4THhHSWk0?=
 =?utf-8?B?LzcvU3ZYVUp5bENmNnFWSmlnbExIOVU5WHNKZFRRNmNJNHZhRVJDVmFGSHAv?=
 =?utf-8?B?dVFvWGg4UVB4T2dyK3FBbGt3b2NWa0N5Zkg0QXJIcFp4cXJtQWtlbmd6amo1?=
 =?utf-8?B?YnMwbkViK1UyT2gwUjhVNGRIcUNESzJWRDR4Z2dOYXVtRzdOT2c1MDhOZW5m?=
 =?utf-8?B?T2l3NCtqbFdXT2Q3OFMrdXRUWCs1VlVDd0d2eTZXNkNQZjMvZUlZUVZtemZ2?=
 =?utf-8?B?aTMydmc2YUVDdFJDbzFoSThGZ1BlTmxIWVZNUXRjVUhvWFJKd0hRQUs0dEha?=
 =?utf-8?B?b2RaYytrQitQTW5PZGJDRFJRNzZoY3JDc3oreXErczVQdTRka1Nqb3dSdTZU?=
 =?utf-8?B?UHppU3UzNk9RUmt6b2w3Z0RQUFM0bnhNNm1NUWVTU1FXM28xM25sYk5wbG84?=
 =?utf-8?B?NGdzeWRDUFhuT0JWc2xoYkJuUi9DMmlZQWhXMVE5NG1ZTklZak94R3NJSElW?=
 =?utf-8?B?T2F4OHlRdndzak5lOWVpVlYrbzhUSUVra1RiWDBTRGRkNXY1TktDbW9UOHBF?=
 =?utf-8?B?UGc1LzJ3ZzQ2U3hWeGh3akFwdFRYTTRwWXZGSlMraGk0bjhEQ2k5OUxOSzh1?=
 =?utf-8?B?SXQ4NlNoaGxROUZvbWdDUzc1TC9LNENlbC8yS0V6VU5PbGNLOFRSUGdwejc4?=
 =?utf-8?B?UmUzMWJIM0VDS2VUb0hHWVNpMm41NjJhNnQ2SWhJckhWWW0wRW03L1VvblhB?=
 =?utf-8?B?NGxTMW83MFAzVGRianNGM3VEdHhnVS85TG81cWtGcGs4VSt6RHVOWUp3SUZG?=
 =?utf-8?B?OHpmKzNmWjhMWFlaZkhwY1Z4djMrQWdEU2QzZCtpeUJGV3UyV0hLZVRiQXVx?=
 =?utf-8?Q?VPqB/cvrO6yA1elLl/g1ViL5NEI5h90v03FaCc6MOs7WvB?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2ZoSnlkNHh0blpwcjVqTk1GYjFUZXE1WTg5TjNya3I3WmZTZ0hjTGVtLzFT?=
 =?utf-8?B?cXFoY1ZLTi95Z2ZZOUZmbnBxanRpUTJibWZ1bTBCK0lLTm9UQmY4ZGl1STUx?=
 =?utf-8?B?SGdteGIwK1Z2SDVrUjVPTGxJcjFkUUFxTUdiQWRBazJaV1pVYW5lSW5Ob3JS?=
 =?utf-8?B?WCtGbDZkY2RZWFhHWjJwQSticC93R1dSOXhLWU5tNURYQ1dBYW1EWXRSaW9X?=
 =?utf-8?B?RlRvQ2tySXF2Wmp4bC9CTlZmQXp6bHBTNEdhc3Q0dWVqdXJTMUR5cXIxMGgw?=
 =?utf-8?B?Q0ZXMkpOT2Y0ZmE3Rmw4YjRKSGxWdGtjUTdQb0hsTm0veTVBeWpEOVpHbGZY?=
 =?utf-8?B?OW1Ga1g3QU9QQm9jSE5IeUdXVGp0elZaSDUwUVpTaHdrT3YrNEUwRC9Md3BI?=
 =?utf-8?B?UDJDQ2ZXaE1LZTBTR0JIMGNzbUozN2RxQkUvK3hLMTZhanBMclNOU3dNVHNC?=
 =?utf-8?B?b3pGeHh6QmRjYzcwSk9yUDNjNEE3MEV5NzhLcm5ZRGw2VU8zbmxkZXNIN3A1?=
 =?utf-8?B?UEtUM25KandmUXFKZjJLV2t4NWpQSWplbDJvZ0I3emU0YUhmNENnT3c1UVpi?=
 =?utf-8?B?eCtNTUtMalZ4K3JTN3dVcDVmVXpxdUdNbDZic1J4TmFadGFBYzNOZ3EyVWd2?=
 =?utf-8?B?b05lQkRrb1JFSEI4VDQreWVxYjRXcE1NOCtxbmdOZUFHT0ZEbm9XajVPY0U4?=
 =?utf-8?B?bnMxSzMwS0FlUlBkOFp1anZuckNSdFdvR2ZLVml6eitoNXFkQ0Q2OWljQklP?=
 =?utf-8?B?N3FtTWxzeWdWc0pGYmNLVS9DNVhQMzJJNDNOMWxHQ2RDZnpXcGZCa3YxVWxU?=
 =?utf-8?B?cjRKb1JnVnpGeTVLWmdaTStBVnhJSHVySHhyNlpPb1Rwb2NxRGs0YXZBYnpK?=
 =?utf-8?B?YlFuUi9KbERPTGQ4UTU4KzdJUjRmV1ZJK1FhZnJOMHEya2JROTFsdGc3SWoy?=
 =?utf-8?B?ZWNXdENYR2dldDlSbEcwZVcyTmlwWGFST3ZHNzZCZGpiUEJWb09UemdMWnNJ?=
 =?utf-8?B?V09WcFdNUi9KM1pJb1lLZUw3K3VXR0NjM3d3K0c1Z2FGb2pxM3JwcFlDS1ZO?=
 =?utf-8?B?ZHJCTVNMU2Z4ZTY5aTdHVC92NDRUa2x6aUlTbHFFSW8zRlMyc25ib3ZDNzJ5?=
 =?utf-8?B?R1hZN2d2YnIvNHllQlVJTFpYay9VU0dQTDUxVEtzcHdXOFF2YTdOb1UxSy9h?=
 =?utf-8?B?YXZGcE5BYkFQNEpDV2VwRDdkc2pPQWYvc2J5bWtaWDFTOTNzbjJDc05OWExW?=
 =?utf-8?B?TVF3ZWJrUkk0aFlDM2xvNG1FSFlpc21TTTNTVGxZNzBhaTNwQzZRcTQvMXZC?=
 =?utf-8?B?em5ROW01d3RkUTBLZWVybERINjhNaWxkT0JVaDdIUGV0SExZakg3TXh2aW00?=
 =?utf-8?B?a0NrZHMrMjF1VU5lZXlySkcrS2t2YXZqK21qV2tGeHZ5Tko1Q3FDS1JzTG04?=
 =?utf-8?B?elkyQjNuUEN1ZFAxNitnOTVvT2Z5Rkg0Ykl6VlV6Q3piYnFzMXVBd2hwUVFq?=
 =?utf-8?B?T3VYQ1Q4LzA0VkpCaUNHeGt1ZzN4M1Y2NmhaemZ4RVJIYTl6YkhLN1dVb3JX?=
 =?utf-8?B?SmFRMGhQSUc2dmZCWEhmeENDRG9XZGIwcUp5VWdUaGkyR3FuaHY1SGhFK0d3?=
 =?utf-8?B?eUl5MVdXUUZ0UFRRRVZJOWlCLzVYa1dTK2lsNFFwcVMzcE05djMvamhwdHB1?=
 =?utf-8?B?b05INkR2QWVhUk0wVnJnSFdPeldVZ3lwa2h3R0tUcW5pQWRZSXV1OXE5QytJ?=
 =?utf-8?Q?M5Uh6/iNDh38hp1y33/NASpmFyal+OxAUy5nQDT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C814D8F282556948A61074DBF050EC75@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9957b553-6cd9-43f6-bbcc-08dd62ab44bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2025 03:49:48.8145 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPFE3A607474
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

DQoNCj4gT24gMTMgTWFyIDIwMjUsIGF0IDQ6NDnigK9QTSwgQWRpdHlhIEdhcmcgPGdhcmdhZGl0
eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+IA0KPiBGcm9tOiBIZWN0b3IgTWFydGluIDxtYXJjYW5A
bWFyY2FuLnN0Pg0KPiANCj4gJXA0Y2MgaXMgZGVzaWduZWQgZm9yIERSTS9WNEwyIEZvdXJDQ3Mg
d2l0aCB0aGVpciBzcGVjaWZpYyBxdWlya3MsIGJ1dA0KPiBpdCdzIHVzZWZ1bCB0byBiZSBhYmxl
IHRvIHByaW50IGdlbmVyaWMgNC1jaGFyYWN0ZXIgY29kZXMgZm9ybWF0dGVkIGFzDQo+IGFuIGlu
dGVnZXIuIEV4dGVuZCBpdCB0byBhZGQgZm9ybWF0IHNwZWNpZmllcnMgZm9yIHByaW50aW5nIGdl
bmVyaWMNCj4gMzItYml0IEZvdXJDQ3Mgd2l0aCB2YXJpb3VzIGVuZGlhbiBzZW1hbnRpY3M6DQo+
IA0KPiAlcDRjaCBIb3N0IGJ5dGUgb3JkZXINCj4gJXA0Y24gTmV0d29yayBieXRlIG9yZGVyDQo+
ICVwNGNsIExpdHRsZS1lbmRpYW4NCj4gJXA0Y2IgQmlnLWVuZGlhbg0KPiANCj4gVGhlIGVuZGlh
bm5lc3MgZGV0ZXJtaW5lcyBob3cgYnl0ZXMgYXJlIGludGVycHJldGVkIGFzIGEgdTMyLCBhbmQg
dGhlDQo+IEZvdXJDQyBpcyB0aGVuIGFsd2F5cyBwcmludGVkIE1TQnl0ZS1maXJzdCAodGhpcyBp
cyB0aGUgb3Bwb3NpdGUgb2YNCj4gVjRML0RSTSBGb3VyQ0NzKS4gVGhpcyBjb3ZlcnMgbW9zdCBw
cmFjdGljYWwgY2FzZXMsIGUuZy4gJXA0Y24gd291bGQNCj4gYWxsb3cgcHJpbnRpbmcgTFNCeXRl
LWZpcnN0IEZvdXJDQ3Mgc3RvcmVkIGluIGhvc3QgZW5kaWFuIG9yZGVyDQo+IChvdGhlciB0aGFu
IHRoZSBoZXggZm9ybSBiZWluZyBpbiBjaGFyYWN0ZXIgb3JkZXIsIG5vdCB0aGUgaW50ZWdlcg0K
PiB2YWx1ZSkuDQo+IA0KPiBBY2tlZC1ieTogUmFzbXVzIFZpbGxlbW9lcyA8bGludXhAcmFzbXVz
dmlsbGVtb2VzLmRrPg0KPiBSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hl
dmNoZW5rb0BsaW51eC5pbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBQZXRyIE1sYWRlayA8cG1s
YWRla0BzdXNlLmNvbT4NCj4gVGVzdGVkLWJ5OiBQZXRyIE1sYWRlayA8cG1sYWRla0BzdXNlLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogSGVjdG9yIE1hcnRpbiA8bWFyY2FuQG1hcmNhbi5zdD4NCj4g
U2lnbmVkLW9mZi1ieTogQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4NCj4gLS0t
DQo+IERvY3VtZW50YXRpb24vY29yZS1hcGkvcHJpbnRrLWZvcm1hdHMucnN0IHwgMzIgKysrKysr
KysrKysrKysrKysrKysrDQo+IGxpYi92c3ByaW50Zi5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMzUgKysrKysrKysrKysrKysrKysrKy0tLS0NCj4gc2NyaXB0cy9jaGVja3BhdGNoLnBs
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQ0KPiAzIGZpbGVzIGNoYW5nZWQsIDYyIGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQoNCkZXSVcsIHRoZSB0ZXN0X3ByaW50Zi5jIHBhcnQs
IGFzIHN1Z2dlc3RlZCBieSBQZXRyLCB3aGljaCB3YXMgcmVtb3ZlZCBpbiB2MiwgaGFzIGJlZW4g
c2VudCB0byBLZWVzIGhlcmU6DQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvNDM3OERE
RkUtMzI2My00OTdBLTgzNjQtNDMzREMxOTg0RkVFQGxpdmUuY29tL1QvI3UNCg0KVGhlIHNlcmll
cyBzaG91bGQgYmUgZ29vZCB0byBtZXJnZSBub3cu
