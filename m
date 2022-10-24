Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AAC609946
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 06:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73D410E237;
	Mon, 24 Oct 2022 04:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DEU01-FR2-obe.outbound.protection.outlook.com
 (mail-fr2deu01on2133.outbound.protection.outlook.com [40.107.135.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3962810E237
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:40:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyUdFMwjcp9TYuo7cd5Vk85C4UtpkhPhKrmQ/ipdIpXisGrtHF50FmFawcP9Qy0s1pEfNqsT5GPjZ+weETm9ne2tYYNFz+y44qsASR59zXw7FUhC/oSo8ESusgaSPy62MoOn5eCatxatSSe+iwGixG9RPtfoPgcl4DbkorHcGCXD0zc1pa5ZYg0opWkWkKdI6zJv6UXlfIK4R9tWvNhlO86oh6VU3scb4Wub/hw6CgN7pkBUy5pkCEIwcQgT+iWjkY19zO39coM0b7PEreN1zE0aQZaBPd73Qz+sDsYifwdF29n3fB+DfrnCkljNB24MHGiiKvIkl1ll+4wcdWUPtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0PoV6jKiO3XJdvnSEjjiWYcPFGiRO5b7Pl0hdmSr1M=;
 b=cBnIrYkp/SBWf+3MPFV54tAnsCucsYb4/ctNU/Ae5kDK3/+ztUoju7fhbQq1e7ddgeZerf97Xhjs5qgap4J/BLj/FWxlVm3blQCqKPHD2fH9NrawSHUKiEWLsbbnG+SeCTAdhbs2zCXJAKzN6WvfbX0Y6eyzdUN8u4e3elQ9wEQWGZrFZ9Ps/v0ga+BfS0UCte9eOCz/uCxOIR/b2Ez9lyk12hOEepUhpH/ILOTW/SIKfRDWPzNhKi89Ao8Uplu9eIUpMMZwJ4/tkG7Kg5+zbVKay1QuJp2J4sVW5h/M44LcmkGn5jDCubf8URpsV6vm4NbYpJdsPnBntVIWfjOQ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductor.onmicrosoft.com;
 s=selector2-rohmsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0PoV6jKiO3XJdvnSEjjiWYcPFGiRO5b7Pl0hdmSr1M=;
 b=uXTsagmk+6+7+SqUDETJkAa767xbTE6vZcadDGqr7dLkOtogcyzcywk2XHOPBo8pjS4OXQmNchF1sFoAm1ytuu2MKGDRJkfBdPekp8sYSCvuKBN4cXw+NQxPFLzDKxZreohwIWDGxm77CGuKBiSRKh3KvfVUHHctWqmkG17MazY=
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:59::10)
 by FR0P281MB2848.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 04:40:19 +0000
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::adc3:ee78:7f30:722]) by BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::adc3:ee78:7f30:722%4]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 04:40:19 +0000
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Matti Vaittinen
 <mazziesaccount@gmail.com>
Subject: Re: [PATCH v4 1/4] gpu: drm: meson: Use devm_regulator_*get_enable*()
Thread-Topic: [PATCH v4 1/4] gpu: drm: meson: Use devm_regulator_*get_enable*()
Thread-Index: AQHY5U+UZr58xfb6e0C1JLs5PfsDA64Y8amAgAAHegCABAGugA==
Date: Mon, 24 Oct 2022 04:40:19 +0000
Message-ID: <a7b8c10a-9789-1b7d-da42-9f2138a675b1@fi.rohmeurope.com>
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
 Thunderbird/102.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BEZP281MB2454:EE_|FR0P281MB2848:EE_
x-ms-office365-filtering-correlation-id: f320998d-7094-4dc7-0ad4-08dab579dae5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3sRZ0fgdSgqUWSswOEmH6o4P/sch/MCippgZvCyEzusYUugSZSnZgoGifIjfBBZfdayBhXPV1Kz2GlRQDIGXJI+LLlXmLyAp3ZbX1QuXar7ajavQlIdUsHLBk4WOpoHN2tGIhiM15socYY4CStl6ASbhwNGzrN0E07KPeytL6UrXrhjOyRHx3d4fOKW3e5hhg+hUmRJgsoPSjRBbhcjdS1zLkKdOYyrHPO4LETuuszjslttWA9zgG5hNY03xzKCdiHL8HSmieduLo9MW9DlrJPbo7eVQa4cP7PIjDWr4w1f73bleq3yiam2obXuBiu0IxoSgpW3LLwp1DKvz+mdwo7QuQkCHf4ferGmZrGsDEyDAcV4nsnVgo2pliCfKF/7RifpxhmxqSt1Q2/sk+DLI1kCVJmsGWCJaBK8op/3sZgvkODCRbpqe52qtApyfblKyEfO9KAbOE5gqdMhwIBB/+IejUdB/ziwVPcN3Nan/RL8B7ETvpXUVashLkYr3EH2q8zGnBZ/LCORmLxhFII8TQ570sx7l8+hb3WtNb/vSD6W6dWnX/aAD13cduvE6jUCisFqrkLGUm3ndoRpYKMdNe7ltMJaN7OSdbC0gB7rF3Nsq0lc44e9pLwl8zy+94F3XQ56TMvfgSc/KhRfRkhxa/PbYanApMvjX/YQYG+0yV38yikJxkKWASrgSPYJZHiXKxC6vkbyPuguCtzcuoapfLayjgLOBv/qGpKZXdxSGBrymeu9vbG+brYSVssS+d4bln5FKu2QpC6IHT70kF14LYd/nZMr6Y7jabItmNdM3d60UVE9v5++J3ZMijIMUq0iKpVBt596Vchb14FqelLvc+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39830400003)(396003)(376002)(366004)(136003)(346002)(451199015)(6486002)(478600001)(86362001)(31696002)(83380400001)(71200400001)(31686004)(76116006)(64756008)(66446008)(66476007)(66556008)(53546011)(110136005)(8676002)(66946007)(91956017)(54906003)(4326008)(6506007)(8936002)(6512007)(41300700001)(7416002)(5660300002)(38100700002)(122000001)(2616005)(186003)(2906002)(316002)(38070700005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHptdFNGMEwvS21lMEpDczNwSFU0Tm5XKzZHN1BrSVBBWXdMeGdCRzhlTVFU?=
 =?utf-8?B?TWhTOTFDSFlVTitQSmpNWENrZ1J0TWVwRkc3ZHl0Q0x3YmdKcjE5b1UzNHNv?=
 =?utf-8?B?WVBLcmRCcDQzR05NWUR2UmhhN3pUVzR6a3ZNdDVhYWJpMWk0OGNLMi9kZUJ3?=
 =?utf-8?B?ZGp2Z01CdFBMQ1hpa0U0WmU0QUpRalh5d002UmVzZFVzNHlCcFB5NHVTRHFC?=
 =?utf-8?B?MWJYUDN4MUFJQUZDdjNZS3NPQkFEY3VHWXFHNEs3TFRPSEZZNk5KalhaeFhu?=
 =?utf-8?B?TGZwM1AydzdYaDdjb2twd2t4WTJkUStGUUlibEZrM1ZEdzE2d2J2ZEtIdWFq?=
 =?utf-8?B?S3V2WXBsTTNsQ09oTngzTGg4QVFYbm0zQlRlZGRZUGRKaEFHdWRUaGxXbnNU?=
 =?utf-8?B?bEo2ZVlXS25SaVlCUjhhV2IxWHEyMmNocTBCZitsSC9UdzBKSmMxL1ZJYnor?=
 =?utf-8?B?bFdaM1dmbGk3M29MNm1PTlNub1lxOTF0NXgyVVhXbkcyZ2d6M3NSYmJodGZE?=
 =?utf-8?B?M1Zrb0FEVmt3bnZ0a21qUG1NN1d1aXhPZXpWZTRHTjNNM1NxN2Z3TDJwSTRa?=
 =?utf-8?B?eDhEODdHbGxFMjRtdzJhTHRSUll6TytoNGI2eGMxSzMwNFJsZ3ZYcEg1amxT?=
 =?utf-8?B?WGRyZXpkNHVuTGpUTExOTXZ0bnpENmpEV2dnQXJWRDR6TzZwaTlCbks4WUlw?=
 =?utf-8?B?aFdEVUxObE5BSkxiZ3paazJWd1N5RWtoTHlvUk4xVzlDbnRycytvd2JiQlZi?=
 =?utf-8?B?TVkxbDFxU0dEa2JCWi9WVHN5dkRsakE2SEFYcjZRUkY3V2pSWHV1TnBNaWJM?=
 =?utf-8?B?dzV6Qy83alU5ZHhEQmRROU9rcVpFWjkxbkVWK1hpZW8xOEJSeUNvNkM2ZlZN?=
 =?utf-8?B?WWw3QnNMblZCcEd1akVOaXNBR2ZhV0p2VmVZeWppa0pHTzNFbVYvMnUwWXFN?=
 =?utf-8?B?ZklKVUd5aHU4eENtZWdlK3ZYcmVuTkdBcjQ3TXJhanhKS1BKZXluK2lxd09Z?=
 =?utf-8?B?Sm5BZDd4VitSQXdqK3FVTno5OFdBUUk3aTY1MHBZSFk1N3dZbHU4cEdNVXZO?=
 =?utf-8?B?QWpCS1YzWjVzQmVIWFJLVmhiY2RmcjRUcnFKRWVyNHdjY3Q1K0RKVTdvSEZY?=
 =?utf-8?B?TnZsRm9ldlBXeE85eEt1bU1NbGNlUUNmUTVWNUtEMnR6b05SR3FBaW13VEpK?=
 =?utf-8?B?T2JrUGF6a2w5TUlJZEdpRVdMU2k2L0F5bnp1dWYwcTRkRURFSTVLNDNzV3lI?=
 =?utf-8?B?Yjlremxqb01TZ1lXWDkvUmFmbzJGNE1KTnBVY0pabFNVRjQzUDhKOVc4WWhE?=
 =?utf-8?B?MUY4OUlxd2pZTW5Xa3lRUms1NmRVdFBldXRkdGlqclFKYW1ZSGFnTkgwb0I1?=
 =?utf-8?B?aUZYY3g3cmZnZHBxd01mOUcyc04zVnJTeWtlRnRSWHVxckhhNTR1ZXpxM2o4?=
 =?utf-8?B?S3hqL0RRRlo0QTBTWkE1b0ZJYnJyZnRBL08yZjVnbHpsNVc2Vmpka2JTQXMv?=
 =?utf-8?B?dzFGRVZxUkovSm43NU9CUW52enRtRmUxTGNjMDN1dzFJUThjdzNZRCt4Tm5L?=
 =?utf-8?B?dUdheWZiekQxN21EOFdlQzFhcnYrUTMvNXJ5czRmdDlQQkQ2OFhia3JvSzBR?=
 =?utf-8?B?RmNpNmxPRmNMYVQyR2lrS283QjZKZHNqS1NVallWR01lR282TUR2dkNKNmxs?=
 =?utf-8?B?MTJNMlFyRmVEQ1p6OVJVRlJncG1wTHQwUzZOblB0bzArMGpzUGZMTlMyc2lq?=
 =?utf-8?B?dWkzTVFhZzgrQm5YZ0ZwaXNrRmE3V3cyb21kaS9pNGs2UEk1UlVaZTZLOFJq?=
 =?utf-8?B?MXZlNUEzaTlRc1h6aXRvNnJ2VVlTZGN2WUdkSE40dkxUTnNKTE5JeFBLdUY0?=
 =?utf-8?B?M29ieVM3c084dFNKRzVxblM1NXhpZzNCMVZ4ZEJtdEJYbi9UWnIwYzNaVGY5?=
 =?utf-8?B?S0pIa1hiTVF2Z2V1eUdtN1lrSEZaVHJnQU5meTIzNEtCallzYXBCeFFQM3kw?=
 =?utf-8?B?SmJDTWtiVk9ueWFYN3ZTaTRGenVzU3lGYXB1R25TOWhpN1FOaUk0QVFSenM2?=
 =?utf-8?B?Uk56enBmVVQyMXpPd1VlMlQvb0x5eEZ1OS9LbUVkVGluaHNMU2dCazcyMURP?=
 =?utf-8?B?VzQ1a2FjclozTUY0cnZFWlVFV3FsSStDOVg2NEJkU1ZBaWZOTlNxSU1BZld4?=
 =?utf-8?Q?rmmsUwRyH92YYrgQPBqhJIc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F77AE48AE4F76A42AD1E12B494156B48@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f320998d-7094-4dc7-0ad4-08dab579dae5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2022 04:40:19.3835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b24d4f96-5b40-44b1-ac2e-2ed7fdbde1c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zsLZUprmMPEJo6HAt9BTKGY5YhYJrQy7tcvcGPlmDvDVeVKXLZ/eF44TplyIoxav7SaeghG3qJRuwLh4pcS1+akBOMrM/eJag/tRiVkGmCNhOBU8RkxSjnMscUJuDOri
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR0P281MB2848
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

T24gMTAvMjEvMjIgMTg6MjksIE5laWwgQXJtc3Ryb25nIHdyb3RlOg0KPiBIaSwNCj4gDQo+IE9u
IDIxLzEwLzIwMjIgMTc6MDIsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6DQo+PiBIaSBNYXR0aSwN
Cj4+DQo+PiBPbiBGcmksIE9jdCAyMSwgMjAyMiBhdCAwNDoxODowMVBNICswMzAwLCBNYXR0aSBW
YWl0dGluZW4gd3JvdGU6DQo+Pj4gU2ltcGxpZnkgdXNpbmcgdGhlIGRldm1fcmVndWxhdG9yX2dl
dF9lbmFibGVfb3B0aW9uYWwoKS4gQWxzbyBkcm9wIHRoZQ0KPj4+IHNlZW1pbmdseSB1bnVzZWQg
c3RydWN0IG1lbWJlciAnaGRtaV9zdXBwbHknLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogTWF0
dGkgVmFpdHRpbmVuIDxtYXp6aWVzYWNjb3VudEBnbWFpbC5jb20+DQo+Pj4NCj4+PiAtLS0NCj4+
PiB2MyA9PiB2NDoNCj4+PiAtIHNwbGl0IG1lc29uIHBhcnQgdG8gb3duIHBhdGNoDQo+Pj4NCj4+
PiBSRkN2MSA9PiB2MjoNCj4+PiAtIENoYW5nZSBhbHNvIHNpaTkwMnggdG8gdXNlIGRldm1fcmVn
dWxhdG9yX2J1bGtfZ2V0X2VuYWJsZSgpDQo+Pj4NCj4+PiBQbGVhc2Ugbm90ZSAtIHRoaXMgaXMg
b25seSBjb21waWxlLXRlc3RlZCBkdWUgdG8gdGhlIGxhY2sgb2YgSFcuIENhcmVmdWwNCj4+PiBy
ZXZpZXcgYW5kIHRlc3RpbmcgaXMgX2hpZ2hseV8gYXBwcmVjaWF0ZWQuDQo+Pj4gLS0tDQoNCi8v
U25pcA0KDQo+Pg0KPj4gQXMgbm90ZWQgaW4gdGhlIHJldmlldyBvZiB0aGUgc2VyaWVzIHRoYXQg
aW50cm9kdWNlZA0KPj4gZGV2bV9yZWd1bGF0b3JfZ2V0X2VuYWJsZV9vcHRpb25hbCgpLCB0aGUg
cmlnaHQgdGhpbmcgdG8gZG8gaXMgdG8NCj4+IGltcGxlbWVudCBydW50aW1lIFBNIGluIHRoaXMg
ZHJpdmVyIHRvIGF2b2lkIHdhc3RpbmcgcG93ZXIuDQo+IA0KPiBXaGlsZSBJIGFncmVlLCBpdCdz
IG5vdCByZWFsbHkgdGhlIHNhbWUgbGV2ZWwgb2YgZWZmb3J0IGFzIHRoaXMgcGF0Y2gNCj4gc2hv
dWxkIGJlIGZ1bmN0aW9uYWxseSBlcXVpdmFsZW50Lg0KPiANCg0KRXhhY3RseS4gQXMgSSB3cm90
ZSwgSSBkbyBub3QgaGF2ZSB0aGUgSFcgdG8gdGVzdCB0aGlzIGNoYW5nZS4gVGhpcyANCmludGVu
ZHMgdG8gYnJpbmcgbm8gZnVuY3Rpb25hbCBjaGFuZ2VzLiBJdCBpcyBqdXN0IGEgbWlub3IgDQpz
aW1wbGlmaWNhdGlvbiB3aGlsZSBhbHNvIG1ha2luZyBpdCBoYXJkZXIgdG8gY3JlYXRlIGEgYnVn
IHdpdGggdGhlIA0KcmVndWxhdG9yIGNvbnRyb2wuIChSZWdpc3RlcmluZyB0aGUgZGV2bV9hY3Rp
b24gYW5kIGxlYXZpbmcgdGhlIGhhbmRsZSANCnRvIHRoZSByZWd1bGF0b3IgaXMgbW9yZSBmcmFn
aWxlIHRoYW4gdXNpbmcgdGhpcyBuZXcgQVBJIHdoaWNoIGRvZXMgbm90IA0KZ2l2ZSB1c2VyIHRo
ZSBoYW5kbGUpLg0KDQpJIGFtIGluIG5vIHdheSBhZ2FpbnN0IHNvbWVvbmUgZnVydGhlciBpbXBy
b3ZpbmcgdGhlIGZ1bmN0aW9uYWxpdHkgaGVyZSANCihieSBhZGRpbmcgcnVudGltZSBQTSkgYnV0
IHRoaXMgc29tZW9uZSBpcyBub3QgbWUuIFlldCwgSSBkb24ndCBzZWUgaG93IA0KdGhpcyBwYXRj
aCBwcmV2ZW50cyBydW50aW1lIFBNIGJlaW5nIGltcGxlbWVudGVkPyBUaGUgZmlyc3QgdGhpbmcg
dGhhdCANCm5lZWRzIHRvIGJlIGRvbmUgaXMgcmVtb3ZpbmcgdGhlIGRldm0tYWN0aW9uIGFzc3Vt
aW5nIHNvbWVvbmUgZGlkIA0KaW1wbGVtZW50IHBvd2VyLXNhdmluZyBieSBkaXNhYmxpbmcgdGhl
IHJlZ3VsYXRvcihzKSBhdCBydW50aW1lLiBBZnRlciANCnRoaXMgcGF0Y2ggaXMgYXBwbGllZCwg
dGhlIGFjdGlvbiByZW1vdmFsIGlzIGF1dG9tYXRpY2FsbHkgYSBuZWNlc3NpdHkgDQppbiBvcmRl
ciB0byBnZXQgdGhlIGhhbmRsZSBmb3IgcmVndWxhdG9yIGNvbnRyb2wuDQoNCkkga25vdyB0aGlz
IGhlbHBlciBpcyBub3QgcHJlZmVycmVkIGJ5IGFsbCBidXQgaXQgaXMgc3RpbGwgc2FmZXIgdGhh
biANCnRoZSBjdXJyZW50IGNvZGUgd2hpY2ggcmVnaXN0ZXJzIHRoZSBhY3Rpb24gd2hpbGUgYWxs
b3dpbmcgdGhlIHJlZ3VsYXRvciANCmNvbnRyb2wuDQoNCllvdXJzDQoJLS0gTWF0dGkNCg0KLS0g
DQpNYXR0aSBWYWl0dGluZW4NCkxpbnV4IGtlcm5lbCBkZXZlbG9wZXIgYXQgUk9ITSBTZW1pY29u
ZHVjdG9ycw0KT3VsdSBGaW5sYW5kDQoNCn5+IFdoZW4gdGhpbmdzIGdvIHV0dGVybHkgd3Jvbmcg
dmltIHVzZXJzIGNhbiBhbHdheXMgdHlwZSA6aGVscCEgfn4NCg0K
