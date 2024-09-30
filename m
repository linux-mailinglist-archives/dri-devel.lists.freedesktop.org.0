Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C8298A48C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6ADD10E4B0;
	Mon, 30 Sep 2024 13:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="F5cGO/fE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44AC810E496
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 13:19:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQIvzal7NRjtoWeDZfEYn3q+k4QCo0C2PZMW6aKDSe0nkGZrIKhQ6KKWWZympQYbEdkF4TuPsQeeTHZXA0CdNXgJQWI0aLEIKmy7ihXS9kYmGWWyrP51W9BmHjgHbSyz4gwUhFef6n75oI4/Mg7iQ1/lm0u5vkHKr9DfKgOgB+44EiIa2/4NHq6ICq2esOqSg+4EZX8fXGb39b8cEg7rOs9pQqFk7/264srqiiuEEf1K1FtAFOC+QePybAkVmjKWwqC2lVsqrjda7df5zHVgEvPmuVEAG14Hjl6Q/3q7akSWiguG8CUr9BQfTYMKuD4SUuk3f71kMRQgkQbBjSSgZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=harHIwdLMaLmA7mtveKrUceOrW8Y74DU0EaKgzwz2DU=;
 b=EsRe2bi+3wsmvex19JWDFkoGuyPvagKPXtnNUE/t/o3HfZ7jhkoq4aU5RUPdrn3EI3YF4TLj8m381I8Zy7WtQEx3TeQWMcBAbAWW1wwvS/6/pEMIRW2bJyAhJqyx/Mqx28afK0YWGxPaHaJjVJ0BJXYigXRyC3QkyyzdLEQwLQzMLZP0pUOmMqqDSYt2Bf5OdVeMrhEj2dWXdevozZW5+srdZ21RV20ojAwyv7SiRfJKkP3SA75DIVk10dS3Y+8jRVUGNhgbNSY+1FN38chiElJOz+qhBdw3YaVQpCvQ94THwQ4RtIkay5dxnsTgEzxOpWWz73gQwnhnLx/yPEQKsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=harHIwdLMaLmA7mtveKrUceOrW8Y74DU0EaKgzwz2DU=;
 b=F5cGO/fEvN+myKeKOGuyB9G3g486cJMO6LEgiJHeaPAIufbP6cFzHG+F95ZVnOT3V8+RmC4Dqyq8oJKPra7m3y8pfjk+9GCu7HQ00r8tcb31+ALOYZAVkG3zKHVbFDFJz4zbpy7Sn5feZiz+YhX8O29mrMvbmu5vGUeu6dxYLMU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11973.jpnprd01.prod.outlook.com (2603:1096:400:38c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 13:18:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8005.026; Mon, 30 Sep 2024
 13:18:55 +0000
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
Thread-Index: AQHbEvsvallXUWq+cES3Z1QK8DhHC7JwB6XAgABHliA=
Date: Mon, 30 Sep 2024 13:18:55 +0000
Message-ID: <TY3PR01MB113466D86F0CA0FA8FB9B866D86762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240930052903.168881-1-victor.liu@nxp.com>
 <20240930052903.168881-6-victor.liu@nxp.com>
 <TY3PR01MB11346CF2BE6F838A718E64F5586762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346CF2BE6F838A718E64F5586762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11973:EE_
x-ms-office365-filtering-correlation-id: d8c7636b-ef96-4d55-e0dc-08dce1526f6f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?PB0xU08OsY9UNFgfXVGf2WFqFa8eqfOZmO2hTMr4zxpDeQvGqmpezJsY0YLS?=
 =?us-ascii?Q?V2nmKIr2jmU8NsfvTweJ7Z85iqMgu1SpUBAZ0UpBebVDCnXpeq1tTfDxVoZr?=
 =?us-ascii?Q?tXW1bcJlnSGdcu2H99Q0hYDE3XnBgBzPB73YcV3oPPUNgml9uf63zL3tj2Ch?=
 =?us-ascii?Q?21Yo1cpOZQPQg8vqf0u3dMysy6khBI3WrzJCFr5A8ljIv2L34Jvh+3GRJhyO?=
 =?us-ascii?Q?UpV/nhoCynFhpy1cXBJLS8Yud0RFQdNu02FUAZ1GY9+g29x9eNBFpKMvecWl?=
 =?us-ascii?Q?/ND440ZAZDDdk6rLzJ/MpB/ENc10i1/uyEu4puXHIWP3h+ASBfCCHvrd2DhV?=
 =?us-ascii?Q?j0KyuwvD3L++7TyAMWFMKX533zXgGO/teEvqZVdsMdMxtJbmo8sP7WwE9sHo?=
 =?us-ascii?Q?QDuu29/t3i4s95gGdbe5VTcDLEvgPznbetPUwmA8JyAB+DiJ+9VsxmUUDB6K?=
 =?us-ascii?Q?mK0dqSBIWU4nbhWrn1lhTvXGGgq6FklhKtRMCoP5YGJpiJVLdiOndvEzfZ6x?=
 =?us-ascii?Q?q20a7dLwUnSjSzh+WTyBEaNhzmiMaiT7bjyOX13vvjJSVlaHdbnGyYa8O84B?=
 =?us-ascii?Q?U/njae7Ybu2uvMY3HZde3Dcl2JcrUvWYtMAjdvG/TwVi1CCJI8Pa8b9NZzX3?=
 =?us-ascii?Q?ErwFKaZZ0Y72QzxWr5z3MWA7xRXA7FFfsnDasovKkYxdLrWeWBVEvoOHKk2d?=
 =?us-ascii?Q?6/TugYHZmZWtsS81CNqPSsOGe0M+PWGyzvf0TDcRfZJfy3jDVR6oA1SIVeAK?=
 =?us-ascii?Q?PorWPyD2bLgObQn8qgVrPQ5htOV4H5t+IrZ7GTcqoHmMIFnaMJPWgez4B2H5?=
 =?us-ascii?Q?LeynjTBaAxgNzFZvmKlM5U47E4GBQV0EMDIMNMpQHFMClb5c88/PAN/O9Csb?=
 =?us-ascii?Q?tIz/7H4Jk0/G/RhldyplC4rfvjHqsTU8c0+7R+OvnB50LjlwUk8SSOZCRw2o?=
 =?us-ascii?Q?e7irtKcOcIpir9aogv1X8n/O+Tj3UTz/Ql1VebFkkTEbYs+ROFC5XdsxqUYw?=
 =?us-ascii?Q?0FTUql6vJYlO1RZTCZHLrIXaZ8XatlGjPpakroLq0ySQY2FxajXkPy++jIkE?=
 =?us-ascii?Q?zT5CGRcX43R6nHcW2C1t+CL+PON+46llW1nqT948bzkdg+yu0JrmxTDURiHF?=
 =?us-ascii?Q?3gAShlBtzgn+WNpqMNq5Yz41xhOxGJC2m8k5oJFgGg9QAikz4wKqL92xVe0z?=
 =?us-ascii?Q?erheOTX4mD0E6ykDjDJA7X/OB88E/ZmgYetgQHWQbO9m2BOti/dO1DlFGdeL?=
 =?us-ascii?Q?lObwkd/yckfn0/f0eHlwGX1LRCaR8soGoRk8L0Bv/Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TInwb8S8EPODysA6HNeK37C7ug6wAAEl+eU6aF3ePLy++fgo+KTMIRssC304?=
 =?us-ascii?Q?lqhZdwRFB8vKhwJ0QX/WzcJcmM7lVfb1nksb38Q/cj4bo7yZTr2YMWuSy6+X?=
 =?us-ascii?Q?MwOCDo71sWgfY7/GMIqkKnDCpj5TvDfD4VEiHbg6PydQe/I9lpcMM8AuxUgW?=
 =?us-ascii?Q?PP5jPExrwnta+x/8e4QdvjrPlNlZSiCHEaz8IX8uSn55ellhElNwf73apNQ2?=
 =?us-ascii?Q?UjfScFXKwd9aZ/Vw5cE23l7d+lMg/GVI+DYX6M+gLUa/IQRltLjfWln/SudY?=
 =?us-ascii?Q?eF/thfY2+58WJVYm8l1CpXLd1mVhVqtUEG1FVIRTgbDNp+bEu07jgpCTFTQE?=
 =?us-ascii?Q?Hyx3LM5B9aQbvA+6zO6a4dmL6om6Shua6lz5zfxRiEH9QLrqDaNVbaLTh2jm?=
 =?us-ascii?Q?/QNy4Pao4LQHyYZXQxJ4DGndbv+1B2+qS8CrqoJqkFSAumIJspmtVeScpnVz?=
 =?us-ascii?Q?BltF64pJvRNAcYmwUcXLr6aW7+T8FfUGbP5s0vVZBigG7qVTru5L0nRl8mtx?=
 =?us-ascii?Q?nTGS6xmzipIsPqWNcHycVmYmmId7ZwFQ3ZBoqPqamj8MukAvhkUGUdQnmA8m?=
 =?us-ascii?Q?wgYPM4jBIxp1Ep0mhw6rJSzhUcLVsvPC9MG4TMqdMq+Fo/FCMoXD5GAzdak5?=
 =?us-ascii?Q?2p3JWyOMjltv2eb3lefsn+FiBx6xOoDHP7rsRXyhrH56hdAAN40U5cgb3GlT?=
 =?us-ascii?Q?TvzQ2eAkSDuWy3tAHra7bEh8GyeqQ0ic6/476e/L++cJcjy0l732E09dkCBE?=
 =?us-ascii?Q?T94SN2ldRTB4CjlQxQ7Q7hDJIf+JWyW2HPzo1U5pmTmfBzkWHgD9WAssTTOh?=
 =?us-ascii?Q?fSigNSAO6b4dSevrpaNovIV+pmR63T9GkUJAypjMoUN7eXdyHJTnVp4Avepm?=
 =?us-ascii?Q?wKuZhXmQX20WZSersgvvVw1i0QYZAU/7XZhBHc8bP5sGlE6YC4OWB2X3ogEL?=
 =?us-ascii?Q?TEYqYm/xl345ZKPcv3KWTWhc+4QDiu7moin1HqJBe49iFVYGw01spCUCYd6h?=
 =?us-ascii?Q?ezGf0OGFAt3i7xVwrRd1wa+ibFzsiRFVMKc4CS1EDKIloI+FLzmznCb5fnJn?=
 =?us-ascii?Q?QWv05WrLbz7dEgFTA6jIEm+vB82BqVbpcmuh5PJXaXNBfJqn+iH2AFuwJ8p4?=
 =?us-ascii?Q?V54/fyyif4j+YQp6oyLMkZbJiiAre4K8fuF2rSPuvbMCcyz8N4DXvPAtDK45?=
 =?us-ascii?Q?70nkiD2dc8mbbQ9LVmCqYkuoCixBYr2GSFNyvPYwwWC6P3hqQxGqLflnPqMt?=
 =?us-ascii?Q?2ovrGrjIAzSY9T8CVtjki1fH6XWeQhNHrHYuAr15Evw5kXo+LMDEr+ybYeEZ?=
 =?us-ascii?Q?2yLvLrSdJz/v3C49RLXhtkRXb1iZRrYsw34ZMJmXmSqj2ziSu/IyexDm68va?=
 =?us-ascii?Q?DCVgOHQYeDfaMdjIGRcQHf6ZjRBI3XAbRB1xq2+fBummO7VnzlApcS+CSlQz?=
 =?us-ascii?Q?S+cxnNde5gJPSIPmfXpPO070QGLXR/2SE3xK4+46K7PwMUb63oNKbUAdD9L2?=
 =?us-ascii?Q?wvnBEWt7R3JaXCneube1qgzPayqFmu7w/aRXtDVSGUF2sN87+NAsLTBgurBu?=
 =?us-ascii?Q?+wYr5fD8ubUl5zcgRitvGERQxBtkFa+yMazU4kY0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c7636b-ef96-4d55-e0dc-08dce1526f6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 13:18:55.2370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yfo6Kn+fT8kxk2vHqQ5b+QSzOhA7MYyiXn/qtt2BBgJ9sxFjDCk2b1Kc4UxvBWYs+r4vWdX+K2DrCe0bgibv0I/gIrQGu97BPTINiGhwVCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11973
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

> -----Original Message-----
> From: Biju Das
> Sent: Monday, September 30, 2024 10:04 AM
> Subject: RE: [PATCH 5/8] dt-bindings: display: bridge: Add ITE IT6263 LVD=
S to HDMI converter
>=20
> Hi Liu,
>=20
> thanks for the patch.
>=20
> > -----Original Message-----
> > From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org>
> > On Behalf Of Liu Ying
> > Sent: Monday, September 30, 2024 6:29 AM
> > Subject: [PATCH 5/8] dt-bindings: display: bridge: Add ITE IT6263 LVDS
> > to HDMI converter
> >
> > Document ITE IT6263 LVDS to HDMI converter.
> >
> > Product link:
> > https://www.ite.com.tw/en/product/cate1/IT6263
> >
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  .../bindings/display/bridge/ite,it6263.yaml   | 310 ++++++++++++++++++
> >  1 file changed, 310 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> > b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> > new file mode 100644
> > index 000000000000..97fb81e5bc4a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> > @@ -0,0 +1,310 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ITE IT6263 LVDS to HDMI converter
> > +
> > +maintainers:
> > +  - Liu Ying <victor.liu@nxp.com>
> > +
> > +description: |
> > +  The IT6263 is a high-performance single-chip De-SSC(De-Spread
> > +Spectrum) LVDS
> > +  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a
> > +transmitter,
> > +  the IT6263 supports LVDS input and HDMI 1.4 output by conversion fun=
ction.
> > +  The built-in LVDS receiver can support single-link and dual-link
> > +LVDS inputs,
> > +  and the built-in HDMI transmitter is fully compliant with HDMI
> > +1.4a/3D, HDCP
> > +  1.2 and backward compatible with DVI 1.0 specification.
> > +
> > +  The IT6263 also encodes and transmits up to 8 channels of I2S
> > + digital audio,  with sampling rate up to 192KHz and sample size up to=
 24 bits.
> > + In addition,  an S/PDIF input port takes in compressed audio of up to=
 192KHz frame rate.
> > +
> > +  The newly supported High-Bit Rate(HBR) audio by HDMI specifications
> > + v1.3 is  provided by the IT6263 in two interfaces: the four I2S
> > + input ports or the  S/PDIF input port.  With both interfaces the
> > + highest possible HBR frame rate  is supported at up to 768KHz.
> > +
> > +properties:
> > +  compatible:
> > +    const: ite,it6263
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description: audio master clock
> > +
> > +  clock-names:
> > +    const: mclk
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +
> > +  ivdd-supply:
> > +    description: 1.8V digital logic power
> > +
> > +  ovdd-supply:
> > +    description: 3.3V I/O pin power
> > +
> > +  txavcc18-supply:
> > +    description: 1.8V HDMI analog frontend power
> > +
> > +  txavcc33-supply:
> > +    description: 3.3V HDMI analog frontend power
> > +
> > +  pvcc1-supply:
> > +    description: 1.8V HDMI frontend core PLL power
> > +
> > +  pvcc2-supply:
> > +    description: 1.8V HDMI frontend filter PLL power
> > +
> > +  avcc-supply:
> > +    description: 3.3V LVDS frontend power
> > +
> > +  anvdd-supply:
> > +    description: 1.8V LVDS frontend analog power
> > +
> > +  apvdd-supply:
> > +    description: 1.8V LVDS frontend PLL power
> > +
> > +  "#sound-dai-cells":
> > +    const: 0
> > +
> > +  ite,i2s-audio-fifo-sources:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 1
> > +    maxItems: 4
> > +    items:
> > +      enum: [0, 1, 2, 3]
> > +    description:
> > +      Each array element indicates the pin number of an I2S serial dat=
a input
> > +      line which is connected to an audio FIFO, from audio FIFO0 to FI=
FO3.
> > +
> > +  ite,rl-channel-swap-audio-sources:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 1
> > +    maxItems: 4
> > +    uniqueItems: true
> > +    items:
> > +      enum: [0, 1, 2, 3]
> > +    description:
> > +      Each array element indicates an audio source whose right channel=
 and left
> > +      channel are swapped by this converter. For I2S, the element is t=
he pin
> > +      number of an I2S serial data input line. For S/PDIF, the element=
 is always
> > +      0.
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    oneOf:
> > +      - properties:
> > +          port@0:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description: the first LVDS input link
> > +
> > +          port@1: false
> > +
> > +          port@2:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description: video port for the HDMI output
> > +
> > +          port@3:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description: sound input port
> > +
> > +        required:
> > +          - port@0
> > +          - port@2
> > +
> > +      - properties:
> > +          port@0:
> > +            $ref: /schemas/graph.yaml#/$defs/port-base
> > +            unevaluatedProperties: false
> > +            description: the first LVDS input link
> > +
> > +            properties:
> > +              dual-lvds-odd-pixels:
> > +                type: boolean
> > +                description: the first sink port for odd pixels
> > +
> > +              dual-lvds-even-pixels:
> > +                type: boolean
> > +                description: the first sink port for even pixels
> > +
> > +            oneOf:
> > +              - required: [dual-lvds-odd-pixels]
> > +              - required: [dual-lvds-even-pixels]
> > +
> > +          port@1:
> > +            $ref: /schemas/graph.yaml#/$defs/port-base
> > +            unevaluatedProperties: false
> > +            description: the second LVDS input link
> > +
> > +            properties:
> > +              dual-lvds-even-pixels:
> > +                type: boolean
> > +                description: the second sink port for even pixels
> > +
> > +              dual-lvds-odd-pixels:
> > +                type: boolean
> > +                description: the second sink port for odd pixels
> > +
> > +            oneOf:
> > +              - required: [dual-lvds-even-pixels]
> > +              - required: [dual-lvds-odd-pixels]
>=20
>=20
> > +
> > +          port@2:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description: video port for the HDMI output
> > +
> > +          port@3:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description: sound input port
>=20
> What about single lvds as device support it?
>=20
> Cheers,
> Biju
>=20
> > +
> > +        required:
> > +          - port@0
> > +          - port@1
> > +          - port@2
> > +
> > +        allOf:
> > +          - if:
> > +              properties:
> > +                port@0:
> > +                  required:
> > +                    - dual-lvds-odd-pixels
> > +            then:
> > +              properties:
> > +                port@1:
> > +                  properties:
> > +                    dual-lvds-odd-pixels: false
> > +
> > +          - if:
> > +              properties:
> > +                port@0:
> > +                  required:
> > +                    - dual-lvds-even-pixels
> > +            then:
> > +              properties:
> > +                port@1:
> > +                  properties:
> > +                    dual-lvds-even-pixels: false

Do we need to document ite,data-mapping to support both VESA and JEIDA form=
ats??

Or

Is there any run time info available to get this info? Currently,
I see it is hardcoded in driver.

Cheers,
Biju

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - ivdd-supply
> > +  - ovdd-supply
> > +  - txavcc18-supply
> > +  - txavcc33-supply
> > +  - pvcc1-supply
> > +  - pvcc2-supply
> > +  - avcc-supply
> > +  - anvdd-supply
> > +  - apvdd-supply
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    /* single-link LVDS input */
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        hdmi@4c {
> > +            compatible =3D "ite,it6263";
> > +            reg =3D <0x4c>;
> > +            reset-gpios =3D <&gpio1 10 GPIO_ACTIVE_LOW>;
> > +            ivdd-supply =3D <&reg_buck5>;
> > +            ovdd-supply =3D <&reg_vext_3v3>;
> > +            txavcc18-supply =3D <&reg_buck5>;
> > +            txavcc33-supply =3D <&reg_vext_3v3>;
> > +            pvcc1-supply =3D <&reg_buck5>;
> > +            pvcc2-supply =3D <&reg_buck5>;
> > +            avcc-supply =3D <&reg_vext_3v3>;
> > +            anvdd-supply =3D <&reg_buck5>;
> > +            apvdd-supply =3D <&reg_buck5>;
> > +
> > +            ports {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
> > +
> > +                port@0 {
> > +                    reg =3D <0>;
> > +
> > +                    it6263_lvds_link1: endpoint {
> > +                        remote-endpoint =3D <&ldb_lvds_ch0>;
> > +                    };
> > +                };
> > +
> > +                port@2 {
> > +                    reg =3D <2>;
> > +
> > +                    it6263_out: endpoint {
> > +                        remote-endpoint =3D <&hdmi_in>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +  - |
> > +    /* dual-link LVDS input */
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        hdmi@4c {
> > +            compatible =3D "ite,it6263";
> > +            reg =3D <0x4c>;
> > +            reset-gpios =3D <&gpio1 10 GPIO_ACTIVE_LOW>;
> > +            ivdd-supply =3D <&reg_buck5>;
> > +            ovdd-supply =3D <&reg_vext_3v3>;
> > +            txavcc18-supply =3D <&reg_buck5>;
> > +            txavcc33-supply =3D <&reg_vext_3v3>;
> > +            pvcc1-supply =3D <&reg_buck5>;
> > +            pvcc2-supply =3D <&reg_buck5>;
> > +            avcc-supply =3D <&reg_vext_3v3>;
> > +            anvdd-supply =3D <&reg_buck5>;
> > +            apvdd-supply =3D <&reg_buck5>;
> > +
> > +            ports {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
> > +
> > +                port@0 {
> > +                    reg =3D <0>;
> > +                    dual-lvds-odd-pixels;
> > +
> > +                    it6263_lvds_link1_dual: endpoint {
> > +                        remote-endpoint =3D <&ldb_lvds_ch0>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    reg =3D <1>;
> > +                    dual-lvds-even-pixels;
> > +
> > +                    it6263_lvds_link2_dual: endpoint {
> > +                        remote-endpoint =3D <&ldb_lvds_ch1>;
> > +                    };
> > +                };
> > +
> > +                port@2 {
> > +                    reg =3D <2>;
> > +
> > +                    it6263_out_dual: endpoint {
> > +                        remote-endpoint =3D <&hdmi_in>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > --
> > 2.34.1
> >

