Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A79989D9A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 11:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B73410E3CE;
	Mon, 30 Sep 2024 09:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JQMLYrLx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011030.outbound.protection.outlook.com [40.107.74.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4914010E3CE
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 09:04:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ti0nJ7jEjd+/bIXCKHm1ip6qe7mGb82UI+bCq/qWurRQueNSqyQRPxoNfN9D2Epctwj6kHX3S5znzjkz+EzIOF0BWsFv/4ayGbV5gIdA0eecQsxS9hh9xSYFuZeNJy9byD/PnniGIeFFk6O3BfGhGFHTiA3cC0eKphDgTqyBqkyvdxNbZq/KmWdoqJ7KJFdvZXmofzRm8dk5YYOjjT1G+lBiqnYajSPUzEhkL2iipNYXig25RpZD5aqpHwLV1YzRKCtxo7tpsDozm71W9b1Z4U7mJaYCKzVCIBSzHeie7SChPInrMjhcx/PIgsX0mxKU6SrnDVwOsaDdYAhvv3PNEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcDdmKONgsYs55j5NMOaAQo7qOPGtxJlHp1fTM5KLec=;
 b=acvdHVE9qhXsSMRB3IO3FQx6zo7GzxLYz9xIR8bJyItkAn44zpYW37uUpthR/5dhWg9xZpvwe7zFfxj16+kTkk+TUBsDU40TTv3uY+JFROn6exWKK99qANswGBJ83SGNVSqOo5BuaIOd5q6fEL6u8yXlcZnoCrSkw5wdQwqT2xC/vxtgvfWJQqlFRz/cghAvwzRHiVnrUQ9u8MzKa5auXZ8+Tnt3N6Cx3z9Wg2VwqNALW75I36SMnYaZCX9aXt+RIssCMDDRLAVLCNTdwaCQRC3YjV38hjl3UqvOW+C4gZUpw39VMxKtnPWE3Sh527qOkKHO0mkeOIHlgBHpUbgaww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcDdmKONgsYs55j5NMOaAQo7qOPGtxJlHp1fTM5KLec=;
 b=JQMLYrLxTwIO0ULyrVrftv8lo/OBRLtCLYjXzH+lIdISo19j0b6yhVmF4oX54jWKL7uVPv/bHIeHhqLJE1zOIw+tD2aj5SkeLmF9tJKy8EEVrb63ZmC0wtzd73um1OAiPHpQQe8CRJcJZv9DaYVyd3eGfoVNWtxfrgNK2TuL58s=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9877.jpnprd01.prod.outlook.com (2603:1096:400:20f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 09:04:04 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 09:04:04 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, laurent.pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, "y.moog@phytec.de"
 <y.moog@phytec.de>
Subject: RE: [PATCH 5/8] dt-bindings: display: bridge: Add ITE IT6263 LVDS to
 HDMI converter
Thread-Topic: [PATCH 5/8] dt-bindings: display: bridge: Add ITE IT6263 LVDS to
 HDMI converter
Thread-Index: AQHbEvsvallXUWq+cES3Z1QK8DhHC7JwB6XA
Date: Mon, 30 Sep 2024 09:04:04 +0000
Message-ID: <TY3PR01MB11346CF2BE6F838A718E64F5586762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240930052903.168881-1-victor.liu@nxp.com>
 <20240930052903.168881-6-victor.liu@nxp.com>
In-Reply-To: <20240930052903.168881-6-victor.liu@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9877:EE_
x-ms-office365-filtering-correlation-id: 484bcfd5-19a1-453b-8af7-08dce12ed549
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?phAyG1fDCsIgZp1UH8fLiT+lBg1Bs+bsPwj4Z6h/+9I3O6DskwevsTZcoJ7P?=
 =?us-ascii?Q?DQVYQvIUGpx6hUJt7r9AemCBbTmkYW07Lj3VhTJy+C8AOMECwyoNwMn9Oe+v?=
 =?us-ascii?Q?oi+bCUvMlPUlDLTygSnxWcARW+FULyttv1BE3Vnd2ufBKZctxAvSBTqO+e9R?=
 =?us-ascii?Q?CdVmJvs6gLK1GnnIh+ZUFR8sF+iEvOP46/0gwiVBjVooqK9mknaJNfxV1q7z?=
 =?us-ascii?Q?fo0z/BWCOPih+wbxP9J2tMz50Z6ZPze4bqFJSkQx6tddjhWQn6Kw9qGa2NKe?=
 =?us-ascii?Q?1fsa2bPt8gQNXiWY9VMYV2f2mR4tXqNWb069P4oIc4DKixjJUGLMGvMCUSUh?=
 =?us-ascii?Q?lbg0A9YxUdap9nNaybx0xy39Q6dxjmcGh1RuOgam+D6ZymY1yAiFDtprT+68?=
 =?us-ascii?Q?2yFqxPK8FInXP2ij2mCx9IjDIrPYWwhftJMP2fq8oRBWahrZwTxvbPDPd54I?=
 =?us-ascii?Q?VuKaaFHlmVPKyZTgrULZ2wlXTBqVxOK1fCcJMtVAtSNYYHffDBFadvO4qVEP?=
 =?us-ascii?Q?siGO/Nsb4jTPvMVKbgAstROzOABvoX1vmw/4M+NaViTDgAzVHU+lJsDvw9AP?=
 =?us-ascii?Q?IJHwT9On/Yci4b9NRlbbc5xCOia125gCRW8cV7+byTh9JMDDPTQ0Ye8MImih?=
 =?us-ascii?Q?EfE9kaUdcTnFArFU9lDrlpP+dzcQvi4DSG6lAnS39ARFbj1UoiywxkVQ0isW?=
 =?us-ascii?Q?VoVgMfaqiM7f8NJcVqk3U3qIn0TCpu/eORjmBvwvQ5eUuMZvG4OEIVC56GWv?=
 =?us-ascii?Q?arVGyDs8SZhvVYUkAPGndeJime8RACku+zEPHCDHkwfCpA3R9+hhczV+jPbL?=
 =?us-ascii?Q?aJzjKoB3u4GigNM9+GdiEMs27NS7/zsiw0pF3SmyQIP737bBuTo8alXWj5Ld?=
 =?us-ascii?Q?YOp8g8t/O4Gf06dOVzQ5rYt66RwEMGo9mrGlP9A+Mp3VloX4fHCs5tVEBIsf?=
 =?us-ascii?Q?+e71JvdnxyhBdBxIC4HTjM8rJCU2sxuOUCHTGw3mik8GZ3Pj2acec5F7aHV0?=
 =?us-ascii?Q?uGRUK2U+j/cqH6imnUJPypLnYdu6Frk3O6lzi3sxZGmwdyiIpLCZAMIAa50W?=
 =?us-ascii?Q?/3s3O16PYpzk27TzRBEiGK3HP9oGvXvpCTgXxB+thDl2zCisd1wOm0bIqASV?=
 =?us-ascii?Q?fQpTQw2EFGM60xmQNhEmJ7ot36M6CTU7AlZo8/dmSIISzb3yPM1uq8nE/eWx?=
 =?us-ascii?Q?RS+m05FzGT9qVstfSjEi4phYVHi41r0J3aiJobNme8mODbRmTnOf/QFHuxFW?=
 =?us-ascii?Q?5Rb4bwlBumMfWJyrumacnJ4a9CuDRinbIbWJkWoP0edPQuU23t3Gxi+c4aib?=
 =?us-ascii?Q?U9G1+YBHRFuPHPjWQKKkiZN//yCmyQv44TCS486m1Z7J1TzB7X+rOAFP+jvW?=
 =?us-ascii?Q?mljY1W4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3rMa4YAlVeAa0Jer6+tOuRF5EQe7Eo1hWMs/uSFWiPAxHZtaQEeUhLNV7BUj?=
 =?us-ascii?Q?CvA5OtAxaxi8MRgZu3hWfscwnuArhJzjMEKGun82tP3v0l7cYPTQaOzRWF76?=
 =?us-ascii?Q?T8berV7vAaD5t8tacbv+mY5m16bKn9Kyh9fUUedqJtaEU8lfrtda2fAOSA0c?=
 =?us-ascii?Q?syyWMiaCt/utnXfaKKBNsVmBr+i9MpCVagMBkWT3rtR60HGq+Al7RzRpEPZf?=
 =?us-ascii?Q?516TjvUBj+03FoCsWbuR/p/42+4tx1WBnBHlRC7S9FacCpmGl+PgIFz0f6O1?=
 =?us-ascii?Q?rn3MLRtn7awE27SDuqxFTIOicyVfEHkESyJ8fhYYqX/cQpL5mhkkd0yGIJC9?=
 =?us-ascii?Q?9K9D/4/qUECeA/geaY3vTAU4vdaARCkjulj6ZXaf6shwAVpW9G6bkH1dRqTd?=
 =?us-ascii?Q?1k4uIQxXiW63pNq+2CALsvJHLSHmD8jVdklmMpNCF9IFHadyFBrWg0+DnwLc?=
 =?us-ascii?Q?NTwnI7OUkPREVM8JzBHIkitBuhw4Jn4OGMfrR7kR3qpC6MM9AIXhQaGmY7VT?=
 =?us-ascii?Q?bM00QEjjIMYZJuLVX4M75ivNhnrL3zDMdY9g/+Ghrw0Df/V/gCkiby+qAoD+?=
 =?us-ascii?Q?v0/yp5c9ffZm8m70y0m74S5NA7ufyc6q2HEBJQzMjJ8AFmIHU7Wti+Efr4Tc?=
 =?us-ascii?Q?4BHqVdnh5dmyNTYS1IAsq+O/c5J/CrkVLnv0U47ULTHSVTXFRs6Ho+gzSin7?=
 =?us-ascii?Q?nwU5XBIs48lQKq2M/7CkZ0eCQXaQlTe95kPOzUDD4350QZkUE6RGf1ZIN+yJ?=
 =?us-ascii?Q?87QX8Q0Bxo9wMv9Ue4r97e8b1O6haC/UddQMjznLG07221oG+kFUNB4ispbk?=
 =?us-ascii?Q?CvIjYgmx66iigkxO4UxW9EAsfGcSP2mU5qTATpvjkJjeiCKciLwMjTRnMK5J?=
 =?us-ascii?Q?V/ZZvij7eJ2C92fKlmsiMmUySay+fzTgD5PE33ZylQmOsw7mg+qBLVf/Mk2/?=
 =?us-ascii?Q?tTIBtK65rVUx/xtNDgo0Smv5JwumH/OGnaMWKv7kW/b07v6i49Rur55g9KNN?=
 =?us-ascii?Q?Ve8FgTna8kNHcDwRMZ6HuELJsZNqrvNbVEhO6+m1RFh0olFI2E46coHfO6Z6?=
 =?us-ascii?Q?l5Qwk0hGgLo5HceUfvw3r1AN7JOZvlQGANB32cgrmwYwjcp80Vitw4zZ0mpM?=
 =?us-ascii?Q?9EWaKsKDxZ974a7xpdiy9S6KwyUR16ymlnI5mRLIYkWKWjruud92ivPeFW+F?=
 =?us-ascii?Q?Kx4JiqYct8ZEsQCnYi5bCvjxskOiwXSIzYv9HyffB85EENMZjELhHuutkUQ2?=
 =?us-ascii?Q?Z52x182DIPI24WG8Cr9RTMGbziS7F4xhkjq1RepE/lPmNZiWAU1mp+DXicGf?=
 =?us-ascii?Q?mvzJvSB0hBbbQ2I3iSRyMriIAlI92TiyjypF97KOgl6vfbNnnjXzGLJAZ56W?=
 =?us-ascii?Q?xVdP79UNmxBp/R/MQBa2uEKEfcmFuO8uc9kvUOdP7in4p5ATXfgOkXRP2Axj?=
 =?us-ascii?Q?Eqz+QGxl22HsMBrFpkoITrDTFaYWPG5+ce5qEcXvGmDmvWxVsN/onEr5lz+F?=
 =?us-ascii?Q?ngBWDk0yb9g+sEH3lMhrUFg4fk3NTb5dNsBdRwKAuXOP3u7ttBNsRPXpI9lT?=
 =?us-ascii?Q?5M8wC1oPXEgWr2YgSoJuwyZuWH+2Km4X/df1M/Hb+c6n2Xmi6tz+PeJsIpeg?=
 =?us-ascii?Q?LQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 484bcfd5-19a1-453b-8af7-08dce12ed549
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 09:04:04.2368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yv/ZzoRQy/RPTBUr1Ti144IlBa5HEoTK4zvzMvckZ07vB2a+lnZ3wjiZU5DLSU9hJY0QeyOw0b/L8rvxJzl9H/NjauqiAwCIAXrLFhpcS/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9877
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

Hi Liu,

thanks for the patch.

> -----Original Message-----
> From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On =
Behalf Of Liu Ying
> Sent: Monday, September 30, 2024 6:29 AM
> Subject: [PATCH 5/8] dt-bindings: display: bridge: Add ITE IT6263 LVDS to=
 HDMI converter
>=20
> Document ITE IT6263 LVDS to HDMI converter.
>=20
> Product link:
> https://www.ite.com.tw/en/product/cate1/IT6263
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../bindings/display/bridge/ite,it6263.yaml   | 310 ++++++++++++++++++
>  1 file changed, 310 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,=
it6263.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6263.=
yaml
> b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> new file mode 100644
> index 000000000000..97fb81e5bc4a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> @@ -0,0 +1,310 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ITE IT6263 LVDS to HDMI converter
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description: |
> +  The IT6263 is a high-performance single-chip De-SSC(De-Spread
> +Spectrum) LVDS
> +  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a
> +transmitter,
> +  the IT6263 supports LVDS input and HDMI 1.4 output by conversion funct=
ion.
> +  The built-in LVDS receiver can support single-link and dual-link LVDS
> +inputs,
> +  and the built-in HDMI transmitter is fully compliant with HDMI
> +1.4a/3D, HDCP
> +  1.2 and backward compatible with DVI 1.0 specification.
> +
> +  The IT6263 also encodes and transmits up to 8 channels of I2S digital
> + audio,  with sampling rate up to 192KHz and sample size up to 24 bits.
> + In addition,  an S/PDIF input port takes in compressed audio of up to 1=
92KHz frame rate.
> +
> +  The newly supported High-Bit Rate(HBR) audio by HDMI specifications
> + v1.3 is  provided by the IT6263 in two interfaces: the four I2S input
> + ports or the  S/PDIF input port.  With both interfaces the highest
> + possible HBR frame rate  is supported at up to 768KHz.
> +
> +properties:
> +  compatible:
> +    const: ite,it6263
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: audio master clock
> +
> +  clock-names:
> +    const: mclk
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  ivdd-supply:
> +    description: 1.8V digital logic power
> +
> +  ovdd-supply:
> +    description: 3.3V I/O pin power
> +
> +  txavcc18-supply:
> +    description: 1.8V HDMI analog frontend power
> +
> +  txavcc33-supply:
> +    description: 3.3V HDMI analog frontend power
> +
> +  pvcc1-supply:
> +    description: 1.8V HDMI frontend core PLL power
> +
> +  pvcc2-supply:
> +    description: 1.8V HDMI frontend filter PLL power
> +
> +  avcc-supply:
> +    description: 3.3V LVDS frontend power
> +
> +  anvdd-supply:
> +    description: 1.8V LVDS frontend analog power
> +
> +  apvdd-supply:
> +    description: 1.8V LVDS frontend PLL power
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  ite,i2s-audio-fifo-sources:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      enum: [0, 1, 2, 3]
> +    description:
> +      Each array element indicates the pin number of an I2S serial data =
input
> +      line which is connected to an audio FIFO, from audio FIFO0 to FIFO=
3.
> +
> +  ite,rl-channel-swap-audio-sources:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 4
> +    uniqueItems: true
> +    items:
> +      enum: [0, 1, 2, 3]
> +    description:
> +      Each array element indicates an audio source whose right channel a=
nd left
> +      channel are swapped by this converter. For I2S, the element is the=
 pin
> +      number of an I2S serial data input line. For S/PDIF, the element i=
s always
> +      0.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    oneOf:
> +      - properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: the first LVDS input link
> +
> +          port@1: false
> +
> +          port@2:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: video port for the HDMI output
> +
> +          port@3:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: sound input port
> +
> +        required:
> +          - port@0
> +          - port@2
> +
> +      - properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/$defs/port-base
> +            unevaluatedProperties: false
> +            description: the first LVDS input link
> +
> +            properties:
> +              dual-lvds-odd-pixels:
> +                type: boolean
> +                description: the first sink port for odd pixels
> +
> +              dual-lvds-even-pixels:
> +                type: boolean
> +                description: the first sink port for even pixels
> +
> +            oneOf:
> +              - required: [dual-lvds-odd-pixels]
> +              - required: [dual-lvds-even-pixels]
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/$defs/port-base
> +            unevaluatedProperties: false
> +            description: the second LVDS input link
> +
> +            properties:
> +              dual-lvds-even-pixels:
> +                type: boolean
> +                description: the second sink port for even pixels
> +
> +              dual-lvds-odd-pixels:
> +                type: boolean
> +                description: the second sink port for odd pixels
> +
> +            oneOf:
> +              - required: [dual-lvds-even-pixels]
> +              - required: [dual-lvds-odd-pixels]


> +
> +          port@2:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: video port for the HDMI output
> +
> +          port@3:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: sound input port

What about single lvds as device support it?

Cheers,
Biju

> +
> +        required:
> +          - port@0
> +          - port@1
> +          - port@2
> +
> +        allOf:
> +          - if:
> +              properties:
> +                port@0:
> +                  required:
> +                    - dual-lvds-odd-pixels
> +            then:
> +              properties:
> +                port@1:
> +                  properties:
> +                    dual-lvds-odd-pixels: false
> +
> +          - if:
> +              properties:
> +                port@0:
> +                  required:
> +                    - dual-lvds-even-pixels
> +            then:
> +              properties:
> +                port@1:
> +                  properties:
> +                    dual-lvds-even-pixels: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - ivdd-supply
> +  - ovdd-supply
> +  - txavcc18-supply
> +  - txavcc33-supply
> +  - pvcc1-supply
> +  - pvcc2-supply
> +  - avcc-supply
> +  - anvdd-supply
> +  - apvdd-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    /* single-link LVDS input */
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        hdmi@4c {
> +            compatible =3D "ite,it6263";
> +            reg =3D <0x4c>;
> +            reset-gpios =3D <&gpio1 10 GPIO_ACTIVE_LOW>;
> +            ivdd-supply =3D <&reg_buck5>;
> +            ovdd-supply =3D <&reg_vext_3v3>;
> +            txavcc18-supply =3D <&reg_buck5>;
> +            txavcc33-supply =3D <&reg_vext_3v3>;
> +            pvcc1-supply =3D <&reg_buck5>;
> +            pvcc2-supply =3D <&reg_buck5>;
> +            avcc-supply =3D <&reg_vext_3v3>;
> +            anvdd-supply =3D <&reg_buck5>;
> +            apvdd-supply =3D <&reg_buck5>;
> +
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                port@0 {
> +                    reg =3D <0>;
> +
> +                    it6263_lvds_link1: endpoint {
> +                        remote-endpoint =3D <&ldb_lvds_ch0>;
> +                    };
> +                };
> +
> +                port@2 {
> +                    reg =3D <2>;
> +
> +                    it6263_out: endpoint {
> +                        remote-endpoint =3D <&hdmi_in>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +  - |
> +    /* dual-link LVDS input */
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        hdmi@4c {
> +            compatible =3D "ite,it6263";
> +            reg =3D <0x4c>;
> +            reset-gpios =3D <&gpio1 10 GPIO_ACTIVE_LOW>;
> +            ivdd-supply =3D <&reg_buck5>;
> +            ovdd-supply =3D <&reg_vext_3v3>;
> +            txavcc18-supply =3D <&reg_buck5>;
> +            txavcc33-supply =3D <&reg_vext_3v3>;
> +            pvcc1-supply =3D <&reg_buck5>;
> +            pvcc2-supply =3D <&reg_buck5>;
> +            avcc-supply =3D <&reg_vext_3v3>;
> +            anvdd-supply =3D <&reg_buck5>;
> +            apvdd-supply =3D <&reg_buck5>;
> +
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                port@0 {
> +                    reg =3D <0>;
> +                    dual-lvds-odd-pixels;
> +
> +                    it6263_lvds_link1_dual: endpoint {
> +                        remote-endpoint =3D <&ldb_lvds_ch0>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg =3D <1>;
> +                    dual-lvds-even-pixels;
> +
> +                    it6263_lvds_link2_dual: endpoint {
> +                        remote-endpoint =3D <&ldb_lvds_ch1>;
> +                    };
> +                };
> +
> +                port@2 {
> +                    reg =3D <2>;
> +
> +                    it6263_out_dual: endpoint {
> +                        remote-endpoint =3D <&hdmi_in>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> --
> 2.34.1
>=20

