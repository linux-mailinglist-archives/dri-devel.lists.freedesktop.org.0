Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CF697AE7A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 12:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD91810E066;
	Tue, 17 Sep 2024 10:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="JBmGb9XN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2041.outbound.protection.outlook.com [40.92.103.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D8810E066
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 10:06:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odDTX0eG6XevRohBnShxoEXluyey6udXxc4jXPZD4EFVKomDbAE6RakqkSLzzoTYzuwvvZSL787gD0OI4ozk++gEXWEipVNhihlPvqAs+QBk0bIyY3ttiH7HOv2IUlVoF16RWwpeh2HShk6Vcy7orwVFEm/Trpm42JrvmGZNlL4sbwOcmMq4P/AVAWvOip+AiEZZPKjMwH2Db+IJBiHPm2uVlty28me/t2eAfSrrSP+H0OHkTNlupxDvxns2YQflHKtI1mkeOm/wIvA3ITI7mblxN6g/QPawa2wF3bp77uiiiqAZzO15d+v61VK9f7Oa17IC3GhGIH5v7tF3XkIdGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooasFmULPObfFsVtnwiDjRiG/Ro7QhRut8Vilq58abA=;
 b=n7XoUfbuyziJOGjy+sutyArjBfydiMZm4QwhHuj1h28JiQAcsowexH54UZS3PAyfjhXExHvN9o/gxFDTdQ98t5goidZ52VaGZUT+tAvJTawqlJNHdwzoDBAsGZLAK3UHgc753YohaMU8hm7dUvWuiEiGvRwqFrdmb3z5/zG7nhN8nGLDkEFZpc0T+iPbbhA9ljR7ZZ3JS3zkjQ6DAI6pHU4JblQEBv2fPoDEGDQG+1HT4MWzX6eHBuvh+m2400xSPxKowuzvIOsbBy3TLKtORtIe8q/NLDxqfU9nfN/jB0lT6W1ASj3icODQrkHzyAIZT7jDEMPO3TrPTMKLF7TPjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooasFmULPObfFsVtnwiDjRiG/Ro7QhRut8Vilq58abA=;
 b=JBmGb9XNBklpGrsaMQxwIf8zA7IEkSaleLE4iF/R7jFl84d6K11P+iPsKEAIdRBAziGHmuwlLj3H4Z8W9PrxATeGIiwtAILk9QSL8zbWQh813/QkMvDTVek3TAEOV10ub0dKP6UE1OZY97wRzaVxZyHOjGlZUYtiJaARvBahHHcNgqCxJnLZ55eqAD9ozOrXIJT/pzNCzIMFfrupEuryCph9vD+/r5Fvj1pSOrUNX36m5wVgOWxfFhl3OSy8/uK1qjWyef5YkehW4rqbvGl2sXlFI4CqWb3pUvl5+otQX7Br1TR7qoLYxs6PfNDd/mzl0J+OwvkvQIM+fLtjcvA7pA==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB1280.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b0::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.24; Tue, 17 Sep 2024 10:06:46 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%6]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 10:06:46 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>
CC: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "bentiss@kernel.org" <bentiss@kernel.org>,
 =?utf-8?B?VGhvbWFzIFdlacOfc2NodWg=?= <thomas@t-8ch.de>, Orlando Chamberlain
 <orlandoch.dev@gmail.com>, Kerem Karabay <kekrby@gmail.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
 <linux-input@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "torvalds@linux-foundation.org"
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH v5 0/10] [DRM REVIEW NEEDED] Touch Bar support for T2 Macs
Thread-Topic: [PATCH v5 0/10] [DRM REVIEW NEEDED] Touch Bar support for T2 Macs
Thread-Index: AQHbCOlNl/wb8Ep2l0uFz7DSMCHiTw==
Date: Tue, 17 Sep 2024 10:06:46 +0000
Message-ID: <15CA7B10-6C4D-44C7-9C7F-246A70085016@live.com>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <MA0P287MB02176175318B96135BE3E320B8902@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
 <nycvar.YFH.7.76.2409111420040.31206@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2409111420040.31206@cbobk.fhfr.pm>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB1280:EE_
x-ms-office365-filtering-correlation-id: 09cd316d-945b-44d9-c082-08dcd7007077
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|8060799006|8022599003|7092599003|15080799006|461199028|102099032|440099028|3412199025;
x-microsoft-antispam-message-info: YknB1faK2XxTGObNZmesPCa4LRTTiPTQGCTvQumM7jJiPVmNRw/1L26fLgvDc8IlHX9OUOSOBMM6oP9C6lX1vVKDnVzLjev7sOiN+M9BcPOHX9KVAESEGT62JGxCqVEObvtu7ksncXYe3EQqCBAs3t+pKTbk7foawJKTlzlc3bM/ruEPy+ZHdd6r//zMoY/pdO9g6GcDnTsGJsg4Vcdpsq7ZNw7It5PfU5SmxrX0gYhCz88XPfs2Q19LYMao0di3GN3UJegqfGGT4tOct7ySrbloosse4Bl3PKTPwZSwYnDeTdyiTKxLFQMxEspsjmKJHAZbkADkNKr6n9qa1SIBLWicKp8mKT4fwF/AO3UfporgctJEG9eeWXTwBZc56CK1MMFNHmhs1IqLOnmFTrzxIl6tkHTeGmZMpkV4yJm8oJ1A8Aa3hzFXYsNlFQ4FgFvOElLQ9t9F/w2uVDaC42jyQO20nZQm7kvtsGbq7sThPwH2PH3jelNc0j+R/UPDDIx9fUCknaz6t436ZPEzULcypQPrMbRRl6NcpU4NKZP9jC9LifOJRekt1LfP0lauViTEfc0zed4ymLdiR2L/3VQ78acilMA1yFpecJQ+MgVu7zR8Yykp2Y513Iwwsjk4ACmJStGyknayvzWoCsb/CcZh5L68IAm17q9qt/wuA4htwsVCgwPO5TwSeuvXu572gH9cGQeQ//zs9FUavBV+Y8A4ekUzxunWD9vDAxW0vKYJwv0=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXhhcXRSZDQ1NTlmdTZ4dXFaTjdySDk0ZUVNdlQ4MDFKNFplUU92em43R1hR?=
 =?utf-8?B?YUZsQkJzemliR0RMbTBZbVJpNWllL2tUcFhDY3QyOWxXOTZrTXdEb0hERmlt?=
 =?utf-8?B?Z3lrS0Q1OUs2Qlh2NXIxMFpRV1p5NXBRRVcyamVyV1ZYam5LT2tWd1NFbG1k?=
 =?utf-8?B?UkJaQjVjdHFKZE5Jck5BZzRLVUtnS01uVHNHSUEwQjMxRjJnNWVKVE40MHBh?=
 =?utf-8?B?anQxQlI4eU9lRkVHM3pCdEpTdlVBUGlhRXB0ZGVqeG04NXpxTVVBRThvNE9S?=
 =?utf-8?B?aXB0TDJpT0UxR2tLa3N2OEpnaEs5N0lrY2tFdklCd0pEb1J1RXQ4L2Zha1lB?=
 =?utf-8?B?cGd4VThsUHBVcjlHR3FnczJybUNjSFJaek5UeGtiMHlPNTYwbUN4T1dnYkJu?=
 =?utf-8?B?RS90UkIrMDB5ajJiV0pkNzlOZmZBeEV4MWhnZGk0ZVBGbW93Y2kyREhxS2F0?=
 =?utf-8?B?WE5uMm45RlNxTUpYNG1pNWk0TngrL20wWHRjK2JXUTkzcEcwSkgrOENSWUJn?=
 =?utf-8?B?YnVacGxBdnpDaUcrandQS2NMZjdEL3BzS3Y0enBzeWIzUGpocEhDdWYwTW5Q?=
 =?utf-8?B?S1V6QUhFMnM0c29yMEdTUzF4QXJLWFhSUG82RGk4NSsraTRnODg1NytXUkZt?=
 =?utf-8?B?RGttWXRqd2F1YXk3QmNKZmtuVmhWaG9UN0FDVldRMFphZXFBdVdXQk0yQ1dv?=
 =?utf-8?B?aWp4OVQranpkZ29rY3JVZ3lyaFBmQWNiOERoZXRoMmdjTFJORElndksrY25F?=
 =?utf-8?B?cWhvM2ZQNUZyNElTZEo0MjI0M2RneXJWaSsvM21GTHRQVS81UXZpdzB6MkRO?=
 =?utf-8?B?TFNxNlRaOGVBd256a0xGZlo2V0tzMFhVRmJiM2FITFQ1SmJtd2VNY1JPZUgw?=
 =?utf-8?B?VWIvbVRadGZQMjNCSU5OWVRvQWRGdEJEVldFYmpJSmpJOCt5SUh5VUJrYXN2?=
 =?utf-8?B?Nm5hbHB1a1hhZUJzZzYxd3dmbjIyU1J6ZW8yUi9La1RVdmRDc1NhQUJRanA5?=
 =?utf-8?B?VE0rckRQM0R3REl0WnQ5YndSL3VkUy8zUyttNW81VDl1QkZnSVl0UTUrUFdV?=
 =?utf-8?B?bzhMRGExb3BMU1dqOS9nVUxvWW1YcWQyMmhLU0I2ZDNUbkcxZmI3dFhwd3dz?=
 =?utf-8?B?Sk9vOFdIemUwT1FWWEJwWCszc0xWdWhLMlZiK3ZacUJtLzBJUll6emVSaTBB?=
 =?utf-8?B?WnVHRndlSzRMaDFXNkpoMHY4U3NwUlBnVC8yRE1UY0hEQnBpL0wvQUlJbFhM?=
 =?utf-8?B?cE0rZitPNmlOZ2RiYUVZWUYxWmE3RkhENzdNSEZRL21yM0lyRUl3STdFSU1k?=
 =?utf-8?B?OFUzSDBFT2swZStSY2R4a0lyZ0ZxdkJWZ1gwNkNuVTB1Q1haaEpwZVdaNEY4?=
 =?utf-8?B?K0poeHNrOEhlaFNKaWhLdGNyejlybGl4eHUxNEJMQ056TCtObk02QVRwYzlH?=
 =?utf-8?B?blUwSUNuY1I4SThHUWpiUlhoL0VuNlloMmt5SnBuaVo5b3BCc3h0ZVZqdkpy?=
 =?utf-8?B?NnRFbC8va3BzenNoY3lRalJkTmZTY0VrbVlCRkp0aGNqSjJTVFBDWkpIY1RY?=
 =?utf-8?B?RkhZN3FERlExclFCOVRiVGxOaUdLTzNKS3pMUlFCSGxXOHlTMzcreDlVY2h3?=
 =?utf-8?B?QUswU1p1YU13VHFMYW9rNUZyWDBWTWxMaXREanYvY0xIVllzQTFMckoybzNN?=
 =?utf-8?B?ZWpTNFNEUWhwSzJsR0dpbnhHdTBDOXJvK2hsWVI0UlpzdjFQZDNnYlNWZnRH?=
 =?utf-8?Q?094siRoK+X9yjpM7VnoWlEinDYD004qogPJPRYE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DEF2E0CFEADEE24B8832B0FC9E52A1B4@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 09cd316d-945b-44d9-c082-08dcd7007077
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2024 10:06:46.6265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1280
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

SGkgSmlyaQ0KDQpEbyBJIGhhdmUgdG8gc2VuZCB0aGUgZHJtIHBhdGNoZXMgYWdhaW4gdG8gZ2V0
IHRoZWlyIEFja2VkLWJ5L1Jldmlld2VkLWJ5Pw0KQWx0aG91Z2ggSSBoYXZlIGFscmVhZHkgY2Nl
ZCB0aGUgRFJNIG1haW50YWluZXJzIGluIHRoaXMgcGF0Y2hzZXQuDQoNCj4gT24gMTEgU2VwIDIw
MjQsIGF0IDU6NTHigK9QTSwgSmlyaSBLb3NpbmEgPGppa29zQGtlcm5lbC5vcmc+IHdyb3RlOg0K
PiANCj4gT24gU2F0LCAzMSBBdWcgMjAyNCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+IA0KPj4gSGkg
TWFpbnRhaW5lcnMNCj4+IA0KPj4gSXQgaGFzIGJlZW4gMiB3ZWVrcyBidXQgSSBzdGlsbCBoYXZl
bid0IHJlY2VpdmVkIGEgc2luZ2xlIHJlcGx5IG9uIHRoaXMgDQo+PiB2ZXJzaW9uIG9mIHRoZSBw
YXRjaCBzZXJpZXMuIENvbnNpZGVyIHRoaXMgZW1haWwgYXMgYSBmcmllbmRseSByZW1pbmRlci4N
Cj4gDQo+IEkgdGhpbmsgaXQgbWFrZXMgbW9zdCBzZW5zZSB0byB0YWtlIHRoaXMgd2hvbGUgc2V0
IHRocm91Z2ggaGlkLmdpdCwgYnV0IA0KPiBmb3IgdGhhdCwgSSdkIGxpa2UgdG8gZ2V0IEFja2Vk
LWJ5L1Jldmlld2VkLWJ5IGZvciBwYXRjaGVzIDkgYW5kIDEwIChkcm0gDQo+IGJpdHMpLg0KPiAN
Cj4gRGF2ZSwgRGFuaWVsLCAuLiA/DQo+IA0KPiBUaGFua3MsDQo+IA0KPiAtLSANCj4gSmlyaSBL
b3NpbmENCj4gU1VTRSBMYWJzDQo+IA0KDQo=
