Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7C062BCE5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 13:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373AC10E483;
	Wed, 16 Nov 2022 12:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DEU01-FR2-obe.outbound.protection.outlook.com
 (mail-fr2deu01on2093.outbound.protection.outlook.com [40.107.135.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3AB10E0FA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 12:02:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIyCknN4rvYVXm9Rw4qQ2ElsQPQWg08+Pkp/7kIBJe0obDNZl/J/mKXYCz2Rh7OuZ9W6i/1bIyJngrbLC7AjvdRE1XTWGiRlaCRU9JuoIH8qawFdq5IMNHkFlb+65TCwXsQliT2CZSD92ohtLDt0o4fn4S5dmkO2L9HZQBhjg2/hXt4R1zKwwJk2TmFAQB+TaldGHEDW+qrLAy3ENEnAEqQotjwOdAGrtDEVbO0UzZLE5Bzsm1KFUKY6anjRuAToXBo8bVDZInCRdYk8vuLnKt2x+tmU3tjxWUSQ1jOw0tlnfyxqSi4kOx93dxglS7RkqnOWgyY5VqZxf+c0QYtiDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBYBNJIqoqg5yUVGcl1HE/4QMyyUw3tCVQKARDL4HUg=;
 b=I+hd7F9uQIiwWS+RgpwyaTQFtyLVENcodp5YKwXKwWTTVBJPOiWUw/rASMHOLvUM5TEt8eAbUqA1xuz8FbMyXYb6Nk7Ber8DsvUDtzNLsLnfw1z9/6mE1ns4VbVewUCu2KkgrQuMwtEzgDZ4mXZUvz/FOw0PCnycCbl6Ny+KqN0W+0/RvNXyh6GexG6CDWPm9VeEOF5Szamci2fkPfi1FUBU0scU0HoG+3JYLiBnZQbRuU7Df3yvO39o0YRCdHFxZ+6xDtYsYIfhQQysC1XRhjFOWneSHRDugkzW6tT7old9Jd5IYnlBrMph65icFDKDRzrsLaJFkqGP/p2mV3H+2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductor.onmicrosoft.com;
 s=selector2-rohmsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBYBNJIqoqg5yUVGcl1HE/4QMyyUw3tCVQKARDL4HUg=;
 b=p0zG3Nn6BTjJl91eexhqeUbdp32yh6XZFFx6YnGW6FsoY0YxcP7Nn2dGwjaUrWX8cF2UePL94RO279/ZBOw/TsL97C3sUNR8KE6dum/mzZsutr53jUetEjsIjSib4axa+iWPGiaC2r1dsKQiZYeAiT/VMuJI5cVaYvrxn44phsQ=
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:59::10)
 by BEZP281MB2597.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:2a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 12:02:28 +0000
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::33b1:3599:eb56:8fd2]) by BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::33b1:3599:eb56:8fd2%4]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 12:02:28 +0000
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Matti Vaittinen
 <mazziesaccount@gmail.com>
Subject: Re: [PATCH v4 1/4] gpu: drm: meson: Use devm_regulator_*get_enable*()
Thread-Topic: [PATCH v4 1/4] gpu: drm: meson: Use devm_regulator_*get_enable*()
Thread-Index: AQHY5U+UZr58xfb6e0C1JLs5PfsDA64Y8amAgAAHegCAKKLWAA==
Date: Wed, 16 Nov 2022 12:02:28 +0000
Message-ID: <12f645b5-2820-0618-1271-6c254425099c@fi.rohmeurope.com>
References: <cover.1666357434.git.mazziesaccount@gmail.com>
 <c14058c4b7018556a78455ffef484a7ebe4d8ea2.1666357434.git.mazziesaccount@gmail.com>
 <Y1K0h4De8UsZJE7W@pendragon.ideasonboard.com>
 <00d90039-c38a-ad8a-80a1-5a654a528756@linaro.org>
In-Reply-To: <00d90039-c38a-ad8a-80a1-5a654a528756@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BEZP281MB2454:EE_|BEZP281MB2597:EE_
x-ms-office365-filtering-correlation-id: da29ca80-fc7b-41db-5ff5-08dac7ca6f1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dr6wLHflEA3t8Zq0e9IZhHI8kpAvZWAd6o91A5Nga65ko+EnBUDKHWjUWC0GAdGBVADqzEi4w+vH3QaVQkhH5Kcy7EeWuM9PIb9o4eaQz0BriGziSRlpMoSQ6nN+xwx4gEBoS9EEI3OxTJwKjm8xSJJquQU+dqBIOjatsNIMaP2TEhQZUygBDMeadaURd7c8FhTGTFBjQqYzIQKI6uY8eMOwEAaHv9NRWeNDyedINKoDlKpeUxPmaXVQOqQipY2pC7seGtfTCfYmGBW3RN46SLyEw9YbhOz8ILqc3zw4XGE4fGD137rvqzwxTPbeN4mBdJvFtEyJabtXbGyRgfpTfk+EDI9p01CSNAfrB+/1TRudDBXyYWdBIMh7Ed71RwYyj13dmqB7Mtm+c3evdeDx7UJqKTzzpASeoAP28uq0IId3EltYr2VOzQ8pZ9JqfvC86g5XAeSSGIagKfKU4iWD8+RvAjD4dNyRGhU+j8OGi9PP1Y2yjBe1TQq+lPzNDWlsKrZVCdQTVYeEO42AJepBTTn1b792LEajXb7uNFkUcS74ZZhHi746f9/UQ1ihIeEyEYqnZvH1DQg5eedzjQqkgegU5Rt1gl10NuzGuBUzjZD1JZCqQ7Vp1EMUD4Kc2qkezBfcNkNOahPVIYzQRaJZ4G4ITi55EEYVuy8AS8eYsZ+VlJCjnJRgxuOVhS4V/7Oqj0AopCagVku3nELjBeBX21SIOjNK095ECIiaCdi4yXrX+iWMduq1fzdH951Lx2Wrt6DY6z3aZXZGSSFydUmahycsKz1wEHZUZDw3qf8urXc8rr+u/VfepqSCYCddMEth1jKHUrM+Q0Fty5ci8uvs4Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(366004)(39850400004)(396003)(346002)(451199015)(2906002)(31686004)(66556008)(66446008)(41300700001)(66946007)(76116006)(66476007)(31696002)(86362001)(83380400001)(2616005)(8936002)(38100700002)(53546011)(110136005)(54906003)(122000001)(38070700005)(6506007)(4326008)(64756008)(186003)(5660300002)(8676002)(91956017)(6486002)(478600001)(71200400001)(7416002)(6512007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0wxN21ESm1jNTd5aks1U1dIdS9zbS83S1JFazYxWkF2Vm8zVVVGMEJWcFdj?=
 =?utf-8?B?RkVJaDZ1Q0FLS25XOVRqMHNucXZoV1lyU2lOV2IvZlhNemFka0RWSEM0U0tI?=
 =?utf-8?B?cXhOaWJxcE9BdHV1dlhPMTY4R216T2RtZ2hBTW00dk5zTGdEbzVTbGgvUDla?=
 =?utf-8?B?c29xejZTNzZZNFZiQmxmTWV5V045UnluWGZVK1l5eVNMNHBydm5ZcVk1cHFl?=
 =?utf-8?B?MXo1ZVFMS3k3SHZZRFNiajdSWE1xOHh6b3dBVzNkTExtb2hXM09aejcvWVRq?=
 =?utf-8?B?KzRUNEZQdCtyTGtHVVhHQmphdlBtTUlCYnc0aWc4OGFzcys0MkxyVkxFT1hu?=
 =?utf-8?B?bzlZcUJ0VG9VMENxMTNRalZUbzI2RlQ5ODdmb1c2RW1qb0krM3BhcERNV2NQ?=
 =?utf-8?B?ZmlYd01jYzVCSFJMZjlydlZ0SmNWbngyajhWSFNsZjFvNjVzb2YzTTZuS1F1?=
 =?utf-8?B?VzdBYW0rQWJyNlVnUnBVaW1LUGxUSDRSRXZNTjN5dXRJVm9mcnVMTVV1Zi84?=
 =?utf-8?B?YzZTTjVkcVdneWIxQmEzb3BPVDdndC9Ia2VIWmpOMDdyNFdtNXlZNGZic3JF?=
 =?utf-8?B?cGdmenQ0bWw2SnJMWi8vMVhNcjR1L0ZqQzgyazl0bCtXcVY1N2JtVkRETXkx?=
 =?utf-8?B?YzE0RWQzTlJ5dnAwbFZ6T29rdU1oK0s1NmtTSEJPbEhWdG0yOW5Yb3RwdzlW?=
 =?utf-8?B?ZC9SaEZtYjdjTGN6MmUxQ1BHNG1rbytWTER6c0J3dVlucHdPN1BCKzVQYWNS?=
 =?utf-8?B?VW9KRWttUHRzaVlaTlpHVEw0ZURLKzBuQnJKMTkvU0Q5eEVtTW5wK3FaTTdT?=
 =?utf-8?B?Q3p4UTRkOGdQSnVxaDFvWThaMWdqZUE1ZWEvZFovdXJaekhsTmxnbHQ1Vk9w?=
 =?utf-8?B?d3ZUZUYybVNpaVZvMTBFeDVpU1dhZzdwdG1ubW9QS3JvZXNPRjd6MUJ1YUNm?=
 =?utf-8?B?MkJpZ2NrTWJPcGFzZVN4cGJsc2dRNmVWK2Y5QlptTit3aFRUVGRMTXRWTndp?=
 =?utf-8?B?WCtWU0RzMlFTUzU2Y2pjRjNjcTBMemlzL1NVR2ZxNHdMWFVZQThSb3hQU0pt?=
 =?utf-8?B?c1p1R0VHYmcxMXcrUzRPM1dqRUJ6SkhCZXVHdmFENmJucmJmWXhJM3ZibUZq?=
 =?utf-8?B?bnhlbC81N3c4U0owYTRNVEhWRlIyOXRJazNBWVNLTHhTMG1lYU04R1gzMzBM?=
 =?utf-8?B?K2NQSlBMaVJpRVdQVS8xWnFZL0QzdTJ0SjExRUw5ajZjUXNpVnU3aGg5eE1N?=
 =?utf-8?B?bUxOM1kvV09aWFd3aCt4R0NIYk9MMWx4REJpQjB5NWpZTitPclIrbUcveHo3?=
 =?utf-8?B?a1E5K3dsaTJOckZIVTA5RllPTnhDUjhFWVJyTmVVWjRiSkVTOUk4cFVsRDF6?=
 =?utf-8?B?Uk1rQVB0Y0hKQzFncjdsYlJLeEkyVUYrM0grK1MzTnkxMFZQekVKeXlWbzNx?=
 =?utf-8?B?WFpsR3lGemRBMGh5MVJlTmxVck9vaXRLdjZQSVpnYTc0WmhkajRLZmNYU0hL?=
 =?utf-8?B?RmJGK3ArRW4yZnlIMEs5YzlNcnZ4OHkyMTB1aW40dlR1NHRWQ0ZFTkhqU0Ro?=
 =?utf-8?B?M2wrMkhPVnNYcUUweGFSb2hsdVpqaFp0K1EzRmJveGNXdk5xVXBHSVZlemd0?=
 =?utf-8?B?czAxY1FRTk1leFlIQnpncy9EbXlVTnYzbExlTlF0UFVIVmROdS9Rck0zOFJF?=
 =?utf-8?B?MVYxYnBsTk1ENlFVcVJGTGIyVW9tRlgzeVRKb1ZPMTJJM2RwUmdOMUFXckdz?=
 =?utf-8?B?cjV1U2puc010REJXcmNVRVRlbUdtUUM4ekVLMXExN2c3RElHZ09FMXQzVThI?=
 =?utf-8?B?NlFaOHRiR0hyVDkvNEE2MC9BOTIwcGJIeUFtNUZ5YWNQaVpsT3VITWNoZlVV?=
 =?utf-8?B?KzlPNTgzNHkvUStueUQxVzl3R0I4RHRkZFkyUEdtamVqc1loWjcyMGw4Z3Bt?=
 =?utf-8?B?dGhRcThaVXlUb082MlZ0VExxaEk3dkVnVVlpZ2VBNkFNWFBjNmJ4TXFYR2Jr?=
 =?utf-8?B?VFdWUlRkTklhazhLVURNdVlVci9SdmUrbEp6WFVZUUdYMk5PUUZsQlB3cmFx?=
 =?utf-8?B?VWdjVElBUU01dzVNYmVORStWbEo0RlNPYkI5K0diQmlSL3U1S3I0d0dqdnNs?=
 =?utf-8?B?STMvU1N2SGVTaWljUHFsVkYrRjB3ejREeThEMHZTeCtqMHN2TWVUUWdFaEpF?=
 =?utf-8?Q?ihA8XxfyT3wvs/8oF9uLJuQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F3226CC0BA211408FA67A235CDBF4CD@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: da29ca80-fc7b-41db-5ff5-08dac7ca6f1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 12:02:28.7551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b24d4f96-5b40-44b1-ac2e-2ed7fdbde1c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dv22zdz6PaxIAQMwIiKX8KR/7EMCRUoWi111HEaz1mAlOIV4NWsLtZmaIg6Idw0PA23duhZYmPBVuInMb2PekJZkxp4zG23X/KfoCgy+Lj0/iStdfdV7j5kUNpETOtQN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB2597
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Guenter Roeck <linux@roeck-us.net>, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgZGVlIEhvIExhdXJlbnQgJiBBbGwsDQoNCk9uIDEwLzIxLzIyIDE4OjI5LCBOZWlsIEFybXN0
cm9uZyB3cm90ZToNCj4gSGksDQo+IA0KPiBPbiAyMS8xMC8yMDIyIDE3OjAyLCBMYXVyZW50IFBp
bmNoYXJ0IHdyb3RlOg0KPj4gSGkgTWF0dGksDQo+Pg0KPj4gT24gRnJpLCBPY3QgMjEsIDIwMjIg
YXQgMDQ6MTg6MDFQTSArMDMwMCwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0KPj4+IFNpbXBsaWZ5
IHVzaW5nIHRoZSBkZXZtX3JlZ3VsYXRvcl9nZXRfZW5hYmxlX29wdGlvbmFsKCkuIEFsc28gZHJv
cCB0aGUNCj4+PiBzZWVtaW5nbHkgdW51c2VkIHN0cnVjdCBtZW1iZXIgJ2hkbWlfc3VwcGx5Jy4N
Cj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IE1hdHRpIFZhaXR0aW5lbiA8bWF6emllc2FjY291bnRA
Z21haWwuY29tPg0KPj4+DQo+Pj4gLS0tDQo+Pj4gdjMgPT4gdjQ6DQo+Pj4gLSBzcGxpdCBtZXNv
biBwYXJ0IHRvIG93biBwYXRjaA0KPj4+DQo+Pj4gUkZDdjEgPT4gdjI6DQo+Pj4gLSBDaGFuZ2Ug
YWxzbyBzaWk5MDJ4IHRvIHVzZSBkZXZtX3JlZ3VsYXRvcl9idWxrX2dldF9lbmFibGUoKQ0KPj4+
DQo+Pj4gUGxlYXNlIG5vdGUgLSB0aGlzIGlzIG9ubHkgY29tcGlsZS10ZXN0ZWQgZHVlIHRvIHRo
ZSBsYWNrIG9mIEhXLiBDYXJlZnVsDQo+Pj4gcmV2aWV3IGFuZCB0ZXN0aW5nIGlzIF9oaWdobHlf
IGFwcHJlY2lhdGVkLg0KPj4+IC0tLQ0KPj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNv
bl9kd19oZG1pLmMgfCAyMyArKystLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4+IMKgIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgDQo+Pj4gYi9kcml2
ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jDQo+Pj4gaW5kZXggNWNkMmIyZWJiYmQz
Li43NjQyZjc0MDI3MmIgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21l
c29uX2R3X2hkbWkuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19o
ZG1pLmMNCj4+PiBAQCAtMTQwLDcgKzE0MCw2IEBAIHN0cnVjdCBtZXNvbl9kd19oZG1pIHsNCj4+
PiDCoMKgwqDCoMKgIHN0cnVjdCByZXNldF9jb250cm9sICpoZG1pdHhfYXBiOw0KPj4+IMKgwqDC
oMKgwqAgc3RydWN0IHJlc2V0X2NvbnRyb2wgKmhkbWl0eF9jdHJsOw0KPj4+IMKgwqDCoMKgwqAg
c3RydWN0IHJlc2V0X2NvbnRyb2wgKmhkbWl0eF9waHk7DQo+Pj4gLcKgwqDCoCBzdHJ1Y3QgcmVn
dWxhdG9yICpoZG1pX3N1cHBseTsNCj4+PiDCoMKgwqDCoMKgIHUzMiBpcnFfc3RhdDsNCj4+PiDC
oMKgwqDCoMKgIHN0cnVjdCBkd19oZG1pICpoZG1pOw0KPj4+IMKgwqDCoMKgwqAgc3RydWN0IGRy
bV9icmlkZ2UgKmJyaWRnZTsNCj4+PiBAQCAtNjY1LDExICs2NjQsNiBAQCBzdGF0aWMgdm9pZCBt
ZXNvbl9kd19oZG1pX2luaXQoc3RydWN0IA0KPj4+IG1lc29uX2R3X2hkbWkgKm1lc29uX2R3X2hk
bWkpDQo+Pj4gwqAgfQ0KPj4+IC1zdGF0aWMgdm9pZCBtZXNvbl9kaXNhYmxlX3JlZ3VsYXRvcih2
b2lkICpkYXRhKQ0KPj4+IC17DQo+Pj4gLcKgwqDCoCByZWd1bGF0b3JfZGlzYWJsZShkYXRhKTsN
Cj4+PiAtfQ0KPj4+IC0NCj4+PiDCoCBzdGF0aWMgdm9pZCBtZXNvbl9kaXNhYmxlX2Nsayh2b2lk
ICpkYXRhKQ0KPj4+IMKgIHsNCj4+PiDCoMKgwqDCoMKgIGNsa19kaXNhYmxlX3VucHJlcGFyZShk
YXRhKTsNCj4+PiBAQCAtNzIzLDIwICs3MTcsOSBAQCBzdGF0aWMgaW50IG1lc29uX2R3X2hkbWlf
YmluZChzdHJ1Y3QgZGV2aWNlIA0KPj4+ICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwNCj4+
PiDCoMKgwqDCoMKgIG1lc29uX2R3X2hkbWktPmRhdGEgPSBtYXRjaDsNCj4+PiDCoMKgwqDCoMKg
IGR3X3BsYXRfZGF0YSA9ICZtZXNvbl9kd19oZG1pLT5kd19wbGF0X2RhdGE7DQo+Pj4gLcKgwqDC
oCBtZXNvbl9kd19oZG1pLT5oZG1pX3N1cHBseSA9IGRldm1fcmVndWxhdG9yX2dldF9vcHRpb25h
bChkZXYsIA0KPj4+ICJoZG1pIik7DQo+Pj4gLcKgwqDCoCBpZiAoSVNfRVJSKG1lc29uX2R3X2hk
bWktPmhkbWlfc3VwcGx5KSkgew0KPj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoUFRSX0VSUihtZXNv
bl9kd19oZG1pLT5oZG1pX3N1cHBseSkgPT0gLUVQUk9CRV9ERUZFUikNCj4+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVQUk9CRV9ERUZFUjsNCj4+PiAtwqDCoMKgwqDCoMKgwqAg
bWVzb25fZHdfaGRtaS0+aGRtaV9zdXBwbHkgPSBOVUxMOw0KPj4+IC3CoMKgwqAgfSBlbHNlIHsN
Cj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0ID0gcmVndWxhdG9yX2VuYWJsZShtZXNvbl9kd19oZG1p
LT5oZG1pX3N1cHBseSk7DQo+Pj4gLcKgwqDCoMKgwqDCoMKgIGlmIChyZXQpDQo+Pj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0ID0g
ZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwgbWVzb25fZGlzYWJsZV9yZWd1bGF0b3IsDQo+
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
bWVzb25fZHdfaGRtaS0+aGRtaV9zdXBwbHkpOw0KPj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAocmV0
KQ0KPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+Pj4gLcKgwqDCoCB9
DQo+Pj4gK8KgwqDCoCByZXQgPSBkZXZtX3JlZ3VsYXRvcl9nZXRfZW5hYmxlX29wdGlvbmFsKGRl
diwgImhkbWkiKTsNCj4+PiArwqDCoMKgIGlmIChyZXQgIT0gLUVOT0RFVikNCj4+PiArwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIHJldDsNCj4+DQo+PiBBcyBub3RlZCBpbiB0aGUgcmV2aWV3IG9mIHRo
ZSBzZXJpZXMgdGhhdCBpbnRyb2R1Y2VkDQo+PiBkZXZtX3JlZ3VsYXRvcl9nZXRfZW5hYmxlX29w
dGlvbmFsKCksIHRoZSByaWdodCB0aGluZyB0byBkbyBpcyB0bw0KPj4gaW1wbGVtZW50IHJ1bnRp
bWUgUE0gaW4gdGhpcyBkcml2ZXIgdG8gYXZvaWQgd2FzdGluZyBwb3dlci4NCj4gDQo+IFdoaWxl
IEkgYWdyZWUsIGl0J3Mgbm90IHJlYWxseSB0aGUgc2FtZSBsZXZlbCBvZiBlZmZvcnQgYXMgdGhp
cyBwYXRjaA0KPiBzaG91bGQgYmUgZnVuY3Rpb25hbGx5IGVxdWl2YWxlbnQuDQoNCldoaWxlIHdl
IGFsbCBhZ3JlZSB0aGF0IHBvd2VyIHNhdmluZ3MgZ2FpbmVkIGJ5IHJ1bnRpbWUgUE0gd291bGQg
YmUgDQpncmVhdCAtIEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIHN0b3AgbWlub3IgaW1wcm92ZW1l
bnRzIHdoaWxlIHdhaXRpbmcgDQpmb3IgdGhhdCB0byBtYWdpY2FsbHkgaGFwcGVuIDspDQoNCkkg
bGlrZSB0aGUgc2F5aW5nIEkgZmlyc3QgaGVhcmQgZnJvbSBKb25hdGhhbiBDYW1lcm9uIC0gIkRv
bid0IGxldCB0aGUgDQpwZXJmZWN0IGJlIGFuIGVuZW15IG9mIGdvb2QiLg0KDQpBZnRlciB0aGF0
IGJlaW5nIHNhaWQsIHNob3VsZCBJIHJlLXNwaW4gdGhpcyBvciBqdXN0IGRyb3AgaXQ/IChJIGFt
IA0KY2xlYW5pbmcgdXAgbXkgbG9jYWwgZ2l0IGZyb20gb2xkIHN0dWZmLCBhbmQgdGhlc2UgYXJl
IGFib3V0IHRvIHZhbmlzaCANCmZyb20gbXkgYm9va3MpLg0KDQpZb3VycywNCgktLSBNYXR0aQ0K
DQotLSANCk1hdHRpIFZhaXR0aW5lbg0KTGludXgga2VybmVsIGRldmVsb3BlciBhdCBST0hNIFNl
bWljb25kdWN0b3JzDQpPdWx1IEZpbmxhbmQNCg0Kfn4gV2hlbiB0aGluZ3MgZ28gdXR0ZXJseSB3
cm9uZyB2aW0gdXNlcnMgY2FuIGFsd2F5cyB0eXBlIDpoZWxwISB+fg0KDQo=
