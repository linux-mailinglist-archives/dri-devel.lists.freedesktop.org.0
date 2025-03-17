Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46983A64A7D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 11:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4487B10E101;
	Mon, 17 Mar 2025 10:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="4upJjkHp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11023096.outbound.protection.outlook.com [52.101.67.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2809610E101
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 10:42:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgjRWMZqG9QiIMo21r3iLrWOx/AeseWEDZArziy1ys6u5JcVT7kkBqVM1cOTepoOyIbBAvoRX/ldMQ3wulvXGtcoshhEhZ8YFraQCepnFdIgIjkFS4UKrGXIqoy0vBAYWObk/NDMzE+8sgZRjSinfi8alsb3ORF7nGWyE5ul4HLvns0ttOwBv2jJTEDbKB/Eirb4WxWs0lx+J49MLXpRuBQ5Dlq5wY/68bugxYNOz2EquIXtS8ZeL371YnPPQVGpfhcO/WpsM43IJrieQN1QQ+QTxeLJTLka0Am9PIKJQIeejb5sxwxFtXUK+cRjBO7re4rCQSg0wiZUWlhaWi6Idg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJ0tiF5i4axc2murn0veyanLvTCJ/EQSw4FuJCzcDtc=;
 b=ZsLQd/NGyOOJw2pMG/hr09HvRZtLXfmwlQHekSKdkAjopvRkZALdKhofdeVLUuzRgorkgObf0o2jrW17RTtrN8NVCoatuHVvOC83sHYq9KQk9CusDkboPmvDM3WuUs4ebyhgRY/h/R8mhyXomSm3OZUcBfswowpH4guQNgWE/ZDzP7nlJw9IGzKYwQHmOf/YpD0euy61sQgVpGHN+EBIryv92DuXsEOwTYAcsMyO0c/PpfxcBSJXPHM9UcDaodfKcpcQ9Xzc724TTUhYQqIHUzXbMXUg/ULBGdee8aRShGtEn/e3EgBHCQ/DgCI92tF2y1JlPeQXorWdicSemgoy/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJ0tiF5i4axc2murn0veyanLvTCJ/EQSw4FuJCzcDtc=;
 b=4upJjkHpownOsGa63KeSvje2roDs4tl2pQX6XQu1OsJH2csXyYyr3fWpMv3QRSQl1WA1FX+hFtOjeO7UV9o8KUdJYpprUzV8ReBfol6mi/HgbtD/VxxLuEnPKhIIWVwoNMMGePqa92kRfzQhPvI8NHcUlnuTW8YQTAeFxROkI+L3CrojpOQqHRuLRnCjIPhsl7ScGTKtjaLVaoZmO0MpvjTB0Q+sjX5BWogD8/sU8wEigg+drSPFb00ombJs1jBqOTm7AfQOu9rCuwRLcO7KgSFXVoV7ZgOPcf+bv0LBGnhXIidxPGuns9ty3+Yf4bT2Huyle64IIkVDJ54AtHgwXQ==
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by VI1PR04MB7182.eurprd04.prod.outlook.com (2603:10a6:800:121::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 10:42:15 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.8511.025; Mon, 17 Mar 2025
 10:42:14 +0000
From: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Liu Ying
 <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v2 03/12] dt-bindings: connector: Add the GOcontroll
 Moduline module slot bindings
Thread-Topic: [PATCH v2 03/12] dt-bindings: connector: Add the GOcontroll
 Moduline module slot bindings
Thread-Index: AQHbiFlwk9848Rc4C0Wk0mPqKw6MoLNzOVEAgACo0sSAA12TAIAAANE/
Date: Mon, 17 Mar 2025 10:42:14 +0000
Message-ID: <PA4PR04MB7630DA5DF63C18530B86AB59C5DF2@PA4PR04MB7630.eurprd04.prod.outlook.com>
References: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
 <20250226-initial_display-v2-3-23fafa130817@gocontroll.com>
 <20250314210652.GA2300828-robh@kernel.org>
 <PA4PR04MB7630094413C8E1F3D715EE23C5DD2@PA4PR04MB7630.eurprd04.prod.outlook.com>
 <20250317-massive-calm-bat-43ff61@krzk-bin>
In-Reply-To: <20250317-massive-calm-bat-43ff61@krzk-bin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB7630:EE_|VI1PR04MB7182:EE_
x-ms-office365-filtering-correlation-id: 5ae5253e-dfe2-42c3-a4d6-08dd6540615f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?NMwYnzqCam62wynIHo/oyfdORFIdkPrGisUvGzQSgyvVZyp19YWntLf+h/?=
 =?iso-8859-1?Q?26EMcdEiLqMbHL2K4MAiqm4YFrN8+2OpLCe6PSbbBCrXmpF85C1i3EUlzZ?=
 =?iso-8859-1?Q?ViHT381HUJnXUCiQHYEIKctdJbl6/xM2ahTyt8rxjvaRiadZbtUe9f4wVY?=
 =?iso-8859-1?Q?Ade9RW8lz1eogLvby16OYUzd8HDd+7F8WRGRmNOEUZLJZ3jbjJL42iyLPo?=
 =?iso-8859-1?Q?Dlfs/u+wAp6YUQmjLQrXub7wxVSVpL9g5bH+m1ePvmw53rsqqgkOqHwkwa?=
 =?iso-8859-1?Q?t4R/xzka6FXBfIK7zpRymyzHkGhKRzosSUinqCeGOqVkR8iZjghCY8EKs7?=
 =?iso-8859-1?Q?FWbYX/Qgx39Sfz3P7G4R9gQzdQR+Zvzc1Iw9kawsR/gqJcReI7jESVtwKd?=
 =?iso-8859-1?Q?VMcL0+0RlInCE5M4BynQ0yYyrgGA8nN7CFH1d/zGKWQwUzTqkALgBxZq19?=
 =?iso-8859-1?Q?uVrjhDol8ItawLXPiupLIo3r7TinowNoh8Wgl87Hn+tnK0GmaLE8snrHvz?=
 =?iso-8859-1?Q?zQdewf80n0ijoyMBCW6w/rtvCy49mz696T8jX8u+YMT8JueyjYJ8VMAaJm?=
 =?iso-8859-1?Q?LKHuRFc1iqPHjUVw99sAaftEU1vjdtXaAlh4MRQ7udCjjxFxvSu4dGTARu?=
 =?iso-8859-1?Q?mQ7RHdctVe5k96I0m+NypJZtbS7CGwqAtVW84ozySD0o3wOtAoEPTqSJKO?=
 =?iso-8859-1?Q?ypI/rwuKDVcBnoLWdJ81RkFeAuedwrycpzykQyRk5fQZBYkBa0O+qu84mv?=
 =?iso-8859-1?Q?p6PWBja/3HhLG2Bdv8bU8tvHSQa6MHIWXVW/r7nzlhKDI2DL7kb3ReixnG?=
 =?iso-8859-1?Q?jtAeGnjBut3phte95wQUnI+bZmI7upCJy1PG2pO+kUQWWyxQzfEMfq5tm1?=
 =?iso-8859-1?Q?Cq8lTBU7RMSLir0ZHEGWiU9KMW7gV1RY/emV7dqAadzJRYH3osXHabCaAk?=
 =?iso-8859-1?Q?5P/mQZwbsxwpffdIPeD9dLFub0bGxpGNSN50y9cnRkvGx0pm4Gs3PseBSx?=
 =?iso-8859-1?Q?xltMqDvFACNlclsJ5SPDV2Myeoc+aGkckRw3Gif17gMpGoHCbuf114H5Df?=
 =?iso-8859-1?Q?dGtLqXHxtoglWTknvJZi/CUnPtz0EI/aJqw28w6z2hfouQH98ZMuPB730c?=
 =?iso-8859-1?Q?QPbSbnGDdGQGf8tiAns9T/TakXP6RsapwJXtBnkeL9iiGPeg01Oy7giZAQ?=
 =?iso-8859-1?Q?QOBDmIkbg4TR/aP2gtkdmfoLMPrcBb0t9SXHGdiSvxrHwyxOVew+M360u/?=
 =?iso-8859-1?Q?ogG7rb3isWmgbOzE0liUPPlaVAxzdP8Dr7NnMWGfjxwmrMVGNwSgSQpQi+?=
 =?iso-8859-1?Q?G4viDrF1AvYmqpmTCYCL8uES3FXVLud2HasZgcF1Jte5/FpIs05s9kAYwj?=
 =?iso-8859-1?Q?oQyVIUVVIwODSa2FZdnTK8Nt5yN+pRBVBEe1nhesA/9lV2ehCTk599C7++?=
 =?iso-8859-1?Q?oy5kZWGmT9YSukYBbtlLcBLbw/26E9wa9XKTN035S0rCJGMU9tT6LY1XL2?=
 =?iso-8859-1?Q?eie//5JfNtIRwDSFRo530r?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7630.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ADUISJ2exV9r1dUM7zFSIlMYMx0Xq4LWbg7PgNJ3fexkhz1AccrSS4/Ldk?=
 =?iso-8859-1?Q?wm8j1MUTrF53NVrZd1/K25WRkLkuUj/jmoacX9XCsP1Sa5xl1WABF0fjnU?=
 =?iso-8859-1?Q?ely27egcB8nwSNbe9U2geJCCHAxNSj2/fGt3sp856xPorZWbFyHSRPqExd?=
 =?iso-8859-1?Q?Pb60ManhkPhCv54k6d1L9zl2e5nzjTdhK8NphhfzqfQgbzU30Hqy75pwCI?=
 =?iso-8859-1?Q?0urKU5X4OHtnGUYR59jfmdDqH7zYlOXCaog5CuR3iIMriNF0lGPeQYFUfB?=
 =?iso-8859-1?Q?UZ1F82wNgojn23WkSxmd8+/ySnlmRqJjew/mJ0xGP9T4g1E5/Fy19Db7iU?=
 =?iso-8859-1?Q?iM3jl3Ach+P/CfmGtK5GqprlKx9xGc/AuIuyGviMDAUexzz95EedXSxxXe?=
 =?iso-8859-1?Q?TFRQcctEkEvfFHwJlEQ6QltPquiN0fA4BjstScz8wRVhniyJN4ytoPvSgw?=
 =?iso-8859-1?Q?oj7AOMdBPK55VwClTeKB3X7CM8jbla8GyOE3IYRQU/kV9TJ9wW4Mk1rMvM?=
 =?iso-8859-1?Q?DD/nk7Q9tcwc9oQeyRqa4t2dIqyoxvuPukuhQ8BVpbfinVT51meM1Uv393?=
 =?iso-8859-1?Q?pReCr5YgsCMJHvMVdEttnxGWlBXFXKE0Ow444+SarqH0iD6r9MUeUkM2x5?=
 =?iso-8859-1?Q?cM+UkuGJHrDuaW8U+xHm0/6gIqrhDm7h9s2v2XGmqZlraKBWGEOTVIA68d?=
 =?iso-8859-1?Q?mw/4h36u1cBhqDKGZ100K6CKK+5Q7dj5F8kQdtBtmv8VlYIuAY9OyItiVS?=
 =?iso-8859-1?Q?xwAJhUqimYywDzdyzHNh21XVV8amTkx3mHT7rRoejn2T7S+0F6bqRFlvEz?=
 =?iso-8859-1?Q?42w3fhn9MR1CfCRsErwXYlSjFFbGMkUC2a19sP0xdlf53Vjqcl56hwniPt?=
 =?iso-8859-1?Q?jC0QBRHDnF8y8Mkuf7DPKeTYj8ws0sVcH+n+F+d9Dn8r0VBZg3AKj5VL4H?=
 =?iso-8859-1?Q?76uVoypSpgqv7hm4McNjq0MD2+RGe3aKD+BBucFrroNjylilZg4GY35w5e?=
 =?iso-8859-1?Q?7/omeX0w3+VzfNSvVH+9SuMtDXRMyebqsC4u0SCBCwXaD8tVi5Q/EO0wyY?=
 =?iso-8859-1?Q?2wkCYOtR+bYP+wxeA+MiRZdezknWkcqxTGRjDk0fZteU3g87nhN4fD2eko?=
 =?iso-8859-1?Q?3LL7HIneqvY45bPLKhIdMy3GXd5PAHFlD6fPWp3DXBMBZZLNVP+Y/bOVQe?=
 =?iso-8859-1?Q?DHRJ4On+aYg7CnMUd1yAPFksnwJu+gEnpXxprBmfZ8zy3vHh0Smwyt7ahY?=
 =?iso-8859-1?Q?nsQfeUdIvbj3u0xZC9f4gQobd/7K9ubeSVgnfaFcnqdGRUB9EyZzGp7O1Y?=
 =?iso-8859-1?Q?9fxuT6xXnBJA5pb596o7JmKV69+ZlBGxbpRL1xpJP83H5RZN5553jsGjxs?=
 =?iso-8859-1?Q?nTOaNq1ek31k1wGUgoyIEnRI0e2IcFgQmovK7FKPem7pjC9faVHNwaszTC?=
 =?iso-8859-1?Q?NhIQWZWk6FFl10DvvI6cwNzWo9kKmENdzlW2+uhr7XTHmAa09ETgtftS30?=
 =?iso-8859-1?Q?OZFRlne8CSLo60fHi8b9UN8sTphOYxmCrLDaeXcshnl19gAGfjdwhjz6E0?=
 =?iso-8859-1?Q?fQUQtapnTnyhItovg1TqDRqILfDKCcxrdyDOFW3+msdyBerogzVZqH+4Nr?=
 =?iso-8859-1?Q?mOgWbSr/dQxpdXPt3vOuUzRUich2Mzk1+7XlRwtkdPmkwZi6tYZrZGZN0r?=
 =?iso-8859-1?Q?aoBzn0FXuXBBTXr35QpY4hhoWafgoV082b122Eo4bPP7AfFgxKClRqzn4W?=
 =?iso-8859-1?Q?mNNQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae5253e-dfe2-42c3-a4d6-08dd6540615f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 10:42:14.2212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /dwBsoEDY/ympczg0uyofIn5I4NSu5+1Avh0/dRqqYw4kMscvrt4HQpySAn4iJBBCYXeEb5nytoOf7Lrap2SfqqbL2pzdEc+OOys6I6NmuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7182
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

From:=A0Krzysztof Kozlowski <krzk@kernel.org>=0A=
Sent:=A0Monday, March 17, 2025 11:34 AM=0A=
=A0=0A=
>On Sat, Mar 15, 2025 at 07:32:28AM +0000, Maud Spierings | GOcontroll wrot=
e:=0A=
>> >> +required:=0A=
>> >> +=A0 - compatible=0A=
>> >> +=A0 - reg=0A=
>> >> +=A0 - reset-gpios=0A=
>> >> +=A0 - interrupts=0A=
>> >> +=A0 - sync-gpios=0A=
>> >> +=A0 - i2c-bus=0A=
>> >> +=A0 - slot-number=0A=
>> >> +=0A=
>> >> +additionalProperties: false=0A=
>> >> +=0A=
>> >> +examples:=0A=
>> >> +=A0 - |=0A=
>> >> +=A0=A0=A0 #include <dt-bindings/gpio/gpio.h>=0A=
>> >> +=A0=A0=A0 #include <dt-bindings/interrupt-controller/irq.h>=0A=
>> >> +=0A=
>> >> +=A0=A0=A0 spi {=0A=
>> >> +=A0=A0=A0=A0=A0=A0=A0 #address-cells =3D <1>;=0A=
>> >> +=A0=A0=A0=A0=A0=A0=A0 #size-cells =3D <0>;=0A=
>> >> +=0A=
>> >> +=A0=A0=A0=A0=A0=A0=A0 connector@0 {=0A=
>> >=0A=
>> >I find this being a SPI device a bit strange. Is there a defined SPI=0A=
>> >device that every slot is going to have? Or the connector has SPI=0A=
>> >interface and *anything* could be attached on it?=0A=
>>=0A=
>> So a module slot is like a pcie slot, it can be occupied or not, and whe=
n=0A=
>=0A=
>But which buses...=0A=
=0A=
I don't think I am fully understanding what you are asking of me. The=0A=
module will always be an spi device, that is the main communication bus.=0A=
=0A=
Kind regards,=0A=
Maud=
