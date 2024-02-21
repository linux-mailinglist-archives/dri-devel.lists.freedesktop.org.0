Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE5185D1AC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 08:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FB610E3CF;
	Wed, 21 Feb 2024 07:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="bF5Bp1vW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2051.outbound.protection.outlook.com [40.107.13.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE0810E3CF
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 07:46:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmUe+kIKFFVNqvoX9w2dant5T3t/0gyzxm3o0do3gdfHLiv+QxxSVrD+ZDp2xTVkGlXCUd3r37TXjSlo9vNrrQVzaFR5IcYo/IKhdJ4sQetXWjbxvxdtHMYWD0g5/emYisIrBUJOGAgSqdxotSIA+DMDPi8sSWdmte+4ZdY+M5ot6qPW/cJaP1WwlJzdN7/f5Ua4XF+aKlOVvQWYnKdcjs/PqZY0p1UzptWydWzITAwHJzVQBxN6i+Vj2RiTLCFtZDdSZPh32n2EdprZ3OvVSt4VcwqOmifBjDvWol96QEMYgjKLp9Zn7Zbj9/9GJ6DymN6ygN8TMJSN4X25Lb5F4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UaRC9YcYQ/c4LuYg1B+3syM0ZTbHqJ276kCQ6CHFWgA=;
 b=Y/iXpaxAbYhz1uzR79Q6KNtebjcqiw3WukwEgflONaNrfMIqzHySyD73JV0v5FdU+qjfyw4C6elf3z8AiZgRNyXUZerSey/z7EbfWpRkTZ7V9EgEsjf0mElmeDM6kmMyoPIBUDPp7p0N4XOZm/XsB1yKMbTjaLfqC1EXB7+CaBvWnt3LnQ2OvOVdVrb6X4fYP17gM9clXoe0KOY012cBXnvr61vObO5chr9/nJrG2B9yhpZqBCUpHSkhLN4ywzgxCzjAP5QTSfCVqPd86oMZeXhgusHo+e6Fks0bQpo+8PhyBhcI2eM1bqAwYa2ffTWxhnJajRfk/29qk5C/RQblng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaRC9YcYQ/c4LuYg1B+3syM0ZTbHqJ276kCQ6CHFWgA=;
 b=bF5Bp1vWCpUBAVryqY8U+ml+kAGpoysArqC6IZD05WhWRI6Ia4QXAuICcs6NGjMqC1Bxu+lusKzm5TryRoHt55muzlEFURY9WmNea9KeV7Hw2qydVctGGoxIwkjf5vAaRb3DAsI3yKYNNo3buWK5YTQREzUp4dh6XMrCw+l7gZA=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB7650.eurprd04.prod.outlook.com (2603:10a6:20b:281::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Wed, 21 Feb
 2024 07:46:46 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::b24c:5d0d:bb15:3e9]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::b24c:5d0d:bb15:3e9%5]) with mapi id 15.20.7292.029; Wed, 21 Feb 2024
 07:46:46 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx
 <linux-imx@nxp.com>, Oliver Brown <oliver.brown@nxp.com>, "sam@ravnborg.org"
 <sam@ravnborg.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v14 5/7] dt-bindings: phy: Add Freescale iMX8MQ DP and
 HDMI PHY
Thread-Topic: [PATCH v14 5/7] dt-bindings: phy: Add Freescale iMX8MQ DP and
 HDMI PHY
Thread-Index: AQHaZJoeuKcitrwX90uZG3UiCo4aMA==
Date: Wed, 21 Feb 2024 07:46:46 +0000
Message-ID: <PAXPR04MB9448F3065AE9F838C4553CB1F4572@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1708395604.git.Sandor.yu@nxp.com>
 <8ddbb34b5f6bf2414bdb03f9e7cd9da70e4e7228.1708395604.git.Sandor.yu@nxp.com>
 <10421561.nUPlyArG6x@steina-w>
In-Reply-To: <10421561.nUPlyArG6x@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|AM9PR04MB7650:EE_
x-ms-office365-filtering-correlation-id: 4204c961-991c-482f-2994-08dc32b1413a
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MMNH3cauh+NWBBbKHJDba1nGCiXnxQxijME9Jugz8dk8sfZAVfv+NKqMAJPIAeQ8NFqlDmb9gOZO55tT2lGJmXxivcTwlSqYuX0woxrUDwQp/wk+SIx3dp5OK2jbH97S7kiYAjXxVQh/c+clxJXgUCJ5aCVvBHu9owte9oz+wi4suQ19aLtiKKvV+xcwrA76Hz3IQP/3ruRDH+gyNp926XkY9P42vGGNN8ygnwfY4xa9BKPhlmcGQ5bwpja54EjU8BUg72a/pdtFypQpHq/QUKVA+XUtdierZrRGJgvi7qeCKfdFNmGh4IwQd0hLpjgi1Lr/Xc45FQVmr5sJ7KhiHMYnWjPLxp/k9ycDcm4koM8t69nVWdyM6QWj1Fs7qjUsqhziU+EyO2JCCE5ZDoiQQ9hbVJ3kktkdn9mGol1YVphcreC7KuAQiHvDbETJwPZefEeM+I6bTr3MfZQOrOP74BSc2NRAjsC0Ajy/R2c2V5jNB+yYb8pIGk0HONjWmffRLrONV2yRKeOYmPIG1zL0vii+hQmsPTFENEd0jr7GrjrwpTNU/IEn5A+kwzZyDzYhA7xVIE5XfI1p2f6Jzb71bjFmhzM1rcvgFrafayQIw515F9uXc73R9DlizC79ZVdp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009)(921011); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8fpThDjDpe2uWxpB1Y+J/JPFUX8EwTlkiN/lA2uDiz8KMh54Py2AaOY+Wi?=
 =?iso-8859-1?Q?2BXd06uJD8J+NYB2+3TXwQBbrK+ZDgq6GO6zesjXBNS6PzRbWaue6nP2sY?=
 =?iso-8859-1?Q?zlSHjFjS42mfSpXq19SDei3+NG1qPJYT2rVvwNwoGHuu45Jg9Ha+TzpBmo?=
 =?iso-8859-1?Q?W6X5kzurqC44/TV28cijFO/qiwl1A6BOxZeZVaEx/RbWUQwVaqu75CMcyy?=
 =?iso-8859-1?Q?tzkqXYh25r8eknIWn8bJFEaJOibopAcVYpo+kR7+Iulsq647CSrWOwbiTM?=
 =?iso-8859-1?Q?PijReP0Iefap8/WGTIxSHz6UXP9WPKnemNv+souUILn4khYY7z6Jdr0IXm?=
 =?iso-8859-1?Q?ekT/APy2IrRuV6KbECdGf5S7jbKiDO7JlbHkJQRzfwXzeyENgKzce75FLZ?=
 =?iso-8859-1?Q?Wk1fFvUtHKq46PdumqGopuHeSObIaGvt49zSAh4dtgnBfBO6EicGImzlTV?=
 =?iso-8859-1?Q?vMxz2HFcx95vv2RMxtXtvtXTUfyRF1KE/0Y/ZZtkTeu+Df3Edbz2mMKCY9?=
 =?iso-8859-1?Q?97KQZdfuZZPFs+PFIQfeL3f/a8+p1V3qigNdy22xA7rTNlhYKClkzvksLb?=
 =?iso-8859-1?Q?KTef8Vkw8gcGo17tbrXnPMfKFv5p/WGqqp3JjIi1KF4BMEaYtsj0r/lz1V?=
 =?iso-8859-1?Q?wmqOlWgQIu+o1Dfeo3QRnDobV78ioG/6pqtA/tu+MUAleCPnrVorPjGjNY?=
 =?iso-8859-1?Q?WBdHjJbSd8ZEFnYrUfItYN5hC5hPHBgm0xO+fc6/8U2RZ0lWPMv0Dx1d6P?=
 =?iso-8859-1?Q?29X2c2D1mAtSMwwfpTb//hczZpZUmzRrobxGtHqUiQ+AWXkSBSKkIwX+1J?=
 =?iso-8859-1?Q?fz0NrTT+zG9EXKLujTG99MQRRCf3TRuBHz5gTfrxi3pozvLBQZx8fHAm1B?=
 =?iso-8859-1?Q?PmqQi6fXfv3bIqv7iJ+L+IOS0YpcSRPQtwo3vK70SsMhEeCMCCPWbyK/sp?=
 =?iso-8859-1?Q?cm5rfN/Vl52CbQe3zHcMvrBMAwsIulBo0HCGQNx6gfZDsV4G8vx/NtuSFf?=
 =?iso-8859-1?Q?BJmDAebRJ18KTFZkiricLlElUF5f48zYdj+H4KrzdNR/W+cARoOO9TCFJb?=
 =?iso-8859-1?Q?hYGEpUhz+SUVV2dHBNNG193PrYt1l0Yi7AMFQiI8Iv1f8nQQxJwkqUtUN3?=
 =?iso-8859-1?Q?UyEA3Sf75XwOn+5h+l6FFApDpkeNWlpMx9d12EkgsZzAdX9pkHJWZiSkfh?=
 =?iso-8859-1?Q?nvkPC1ttUMlR7kfciWEzDmDi2BeGCaUCFE6X3JUqhaL5ibIdQReHO3R1Yv?=
 =?iso-8859-1?Q?yo2gIEth6Ix6tJhsdhOXI+TFk5RxWGzY0OUC78nYOQW12e2ORpFdHTLvMf?=
 =?iso-8859-1?Q?V4RxkKE4/lL1z8aIwWVrKQveS+ipa4YkuLgrzvXmZMvx8GFlvqY60BHcf7?=
 =?iso-8859-1?Q?yFGSbZHE3HlhT2rm69GzVO62c4HcoB1U+fOf/s7XCbwAw4H5hb9tZpnQ89?=
 =?iso-8859-1?Q?RQFt6uAgWLYpjYg0Cgviz/q8WRucMViHUjsC79VtkyuLRuF/MZBJoFz07w?=
 =?iso-8859-1?Q?h8FnIwgXtX9ZpkNG8jkCyYTevUuFCNGI9Vn13y3GI04UomhoN/ucFTMeij?=
 =?iso-8859-1?Q?BS0L6MO8UpEYK7DMQlHo9vedOzjY9bFGU22YcMOsvz7Ba+fkMfU/7C7Ufo?=
 =?iso-8859-1?Q?r7Fmrnr2dGLw4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4204c961-991c-482f-2994-08dc32b1413a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2024 07:46:46.4505 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gXW6/i/WBdJu/D4L8bqQgWjsgWa5RgixTMJp0mfKVIxqoLbHch4qaqJ3h6a9mw2Pz2RSWXZaNzhY7qZE0H/tVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7650
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

Hi Alexander,

Thanks for your comments,

>
>
> Hi,
>
> thanks for the update.
>
> Am Dienstag, 20. Februar 2024, 04:23:53 CET schrieb Sandor Yu:
> > Add bindings for Freescale iMX8MQ DP and HDMI PHY.
> >
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> > v9->v14:
> >  *No change.
> >
> >  .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  | 53
> > +++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
> > b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
> > new file mode 100644
> > index 0000000000000..917f113503dca
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yam
> > +++ l
> > @@ -0,0 +1,53 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +http://devi/
> >
> +cetree.org%2Fschemas%2Fphy%2Ffsl%2Cimx8mq-dp-hdmi-phy.yaml%23&da
> ta=3D05
> >
> +%7C02%7CSandor.yu%40nxp.com%7Ce79b4d15c204494963c508dc31fbab5d
> %7C686e
> >
> +a1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638440204190687801%7C
> Unknown%7
> >
> +CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw
> iLCJX
> >
> +VCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DrKWiYc1wbOvKMO%2BWnvT6agxo
> 9V%2B1ndZVTxh
> > +gLT0g7h8%3D&reserved=3D0
> > +$schema:
> > +http://devi/
> >
> +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&data=3D05%7C02%7CSandor.y
> u%40n
> >
> +xp.com%7Ce79b4d15c204494963c508dc31fbab5d%7C686ea1d3bc2b4c6fa9
> 2cd99c5
> >
> +c301635%7C0%7C0%7C638440204190709341%7CUnknown%7CTWFpbGZsb
> 3d8eyJWIjoi
> >
> +MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0
> %7C%7C%
> >
> +7C&sdata=3D%2FuCSz0aVVsRLorOqrorbZIyT7iU5BavPKCbA9qL9qDI%3D&reserv
> ed=3D0
> > +
> > +title: Cadence HDP-TX DP/HDMI PHY for Freescale i.MX8MQ SoC
> > +
> > +maintainers:
> > +  - Sandor Yu <sandor.yu@nxp.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8mq-dp-phy
> > +      - fsl,imx8mq-hdmi-phy
>
> While reading cdns-mhdp8501-core.c I'm not so sure about this. There is o=
nly
> a single PHY which can be configured for either DP or HDMI.
> Using separate compatibles for that somehow bugs me.
> Maybe the DT maintainers can add some input if this should be single or
> double compatibles.
>
When user enable MHDP8501 HDMI or DP, he should clearly know which type he =
want to enable,
From board type, flash.bin(firmware) to dts(connector and phy type), they a=
re all need align to HDMI or DP.

B.R
Sandor

> Thanks and best regards,
> Alexander
>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: PHY reference clock.
> > +      - description: APB clock.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: ref
> > +      - const: apb
> > +
> > +  "#phy-cells":
> > +    const: 0
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - "#phy-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx8mq-clock.h>
> > +    #include <dt-bindings/phy/phy.h>
> > +    dp_phy: phy@32c00000 {
> > +        compatible =3D "fsl,imx8mq-dp-phy";
> > +        reg =3D <0x32c00000 0x100000>;
> > +        #phy-cells =3D <0>;
> > +        clocks =3D <&hdmi_phy_27m>, <&clk
> IMX8MQ_CLK_DISP_APB_ROOT>;
> > +        clock-names =3D "ref", "apb";
> > +    };
> >
>
>
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.tq-/
> group.com%2F&data=3D05%7C02%7CSandor.yu%40nxp.com%7Ce79b4d15c2044
> 94963c508dc31fbab5d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> %7C638440204190726471%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA
> wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7
> C&sdata=3D7xs1%2FC%2BK1cSFDc3rlBEZdNBsYw6Gc8AR6CWr2Djz4s0%3D&res
> erved=3D0
>

