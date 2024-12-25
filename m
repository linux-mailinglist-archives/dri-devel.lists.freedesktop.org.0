Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D409FC409
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 08:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BFC10E365;
	Wed, 25 Dec 2024 07:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="CuHRtcnX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2608::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D59410E365
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 07:57:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmDr0n5skbcnLb4IViuHCGuKA0VmiGhICKresoPnYdL5Dk9gt7ftnJfA+laH4CNhnNxmZZIHpO2Uolls7c/OzjlTR6Q2q4cDIWd8MR1xuvBj/Jf/qrCp0EsmnHILSDJO6WjJFcK1K42ZwndrIm9u8BmyT1O5E12pilq2BQk+LzvJt79Vfwxkzaoj2TRtPYJtBohDdp/UTOiGeIfFK1QtRTMxxhRc+6bpsE0A7tGPrsdzTphFtHnV6SZAdTd5mkGFbicniQhk5Sjj8G74xhSX0VavIY8qwJiIjuakeqT5vd7hO69IGMlyOBF1KG8ChXl6cQg1/fxeVIqFW5X/jAZOxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqx6od5TT89eCQexAugscl55lQmnt5ERsB/VSGBWVsU=;
 b=R/GkeM4s0MNHwy8x/hZXFWBFznDaRe892lzwojQ656mbGhG5RnZEi0WoXH4Cmo0xDOgMnZn9m+Bv3gM52xbhaammfeXTbwJweOpWjrPcpLrcTf33wgmqxKrrfwFiD+61x2XsjZOPkh90JvYr/lTG1rf31yZzH/dxKVDtjdplTM1poxIC4Gv9xb/1YY03cahvfT+xCG2l8NR4JaZ6K+ciNJAFCQfMScQTnOJdSw7PmKpId2E4jA4ZsJ3JPpR0zlPQ0xUVznKCxwHdjg5vcwZ/zsAL/yhIL+phbqhCViUpHzGZhog7mGpwugaoNZMflEQ3S2Ao/NEkyAAmQENEW3SHpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqx6od5TT89eCQexAugscl55lQmnt5ERsB/VSGBWVsU=;
 b=CuHRtcnXzak3jLZh9ST1Y4pnWA12cPfkFFa8PwtqOCuRj75evEMW/3TwpCyGeAiNv17CTRowlrf3YnBJGI1t6nWj9XIbCD0qj66OqBBW4i9fFfe9Y994GLRDfxfppsm1fVF5JJboyG3mRnp6X0+7JrchrtU+LsyPySqkph0yYi6q3cqnm2FeMyiDuXKvujyK0uA4GILAd2YsDnqfnUZw1NmqloI/BE67AAJf6sV8hqnDVx+PQDAHExlb+v4v6ubEV/jSg0dpS5OAOJJ1CL6Q87rPTzh3yUWQV6YQc6T9YIhXW2wuQ808i2pwk3OYmn9XPdZL9gsseSeBGDl60GF6dQ==
Received: from DB9PR04MB9452.eurprd04.prod.outlook.com (2603:10a6:10:367::13)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Wed, 25 Dec
 2024 07:57:02 +0000
Received: from DB9PR04MB9452.eurprd04.prod.outlook.com
 ([fe80::4c69:3f0c:6701:a1cd]) by DB9PR04MB9452.eurprd04.prod.outlook.com
 ([fe80::4c69:3f0c:6701:a1cd%7]) with mapi id 15.20.8272.013; Wed, 25 Dec 2024
 07:57:02 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
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
 <linux-phy@lists.infradead.org>, "mripard@kernel.org" <mripard@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx
 <linux-imx@nxp.com>, Oliver Brown <oliver.brown@nxp.com>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Subject: RE: [EXT] Re: [PATCH v20 5/9] drm: bridge: Cadence: Add MHDP8501
 DP/HDMI driver
Thread-Topic: [EXT] Re: [PATCH v20 5/9] drm: bridge: Cadence: Add MHDP8501
 DP/HDMI driver
Thread-Index: AQHbUFBu3BvLbmor5UewCR/yRWHyfbLqUksAgAjisnA=
Date: Wed, 25 Dec 2024 07:57:01 +0000
Message-ID: <DB9PR04MB94528AAF7B7B60C48710CDFEF40C2@DB9PR04MB9452.eurprd04.prod.outlook.com>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
 <fbd12029fab1f60e2ba4fad75ef650298a59cb15.1734340233.git.Sandor.yu@nxp.com>
 <3ivd4mdmcb56mrgg2yo3rszksiusfkyxr3eycuw5kspczqcqse@4nub63fnrsur>
In-Reply-To: <3ivd4mdmcb56mrgg2yo3rszksiusfkyxr3eycuw5kspczqcqse@4nub63fnrsur>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9452:EE_|VI1PR04MB10026:EE_
x-ms-office365-filtering-correlation-id: f9ec1dce-6da2-4ee6-d029-08dd24b9b74f
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?jda4rfkUdvWDf/thELeb+wwFjRP7hjVBs7rHEGr90CMOY0sWS66HJNBbsN8E?=
 =?us-ascii?Q?tYeUBoidOiUMWYc5ihk7cd57jS6IxHir+uaxr1uODugOX/+LWtBVri7UZlda?=
 =?us-ascii?Q?TvZZEp2mkJXx5mBbv85cpy3SeqF4ASH+FcFcN2Kzi/F86rC5aOTlv7Kh4y6z?=
 =?us-ascii?Q?sTGHyFY8XBa4mYCJ5E8NZhCVYiqL0ZfTOILKOic9eHFJLD0DAQhgQ8MAIv9B?=
 =?us-ascii?Q?I/S6BP+Fv6Nf32V/sBiKhuXlAPrSqmsNLitvKdMzYbUaXybEUM7jgqlIn5Cc?=
 =?us-ascii?Q?GbEr3LqoNifsqK5T+y9phNUEJ449KPQIcKcFP06lPYVoI3OE2SbB2kOfIF9n?=
 =?us-ascii?Q?cJgVy3Dvug157u+zvZ4nfz3uVeWcjhV2zm7Ipok1ByfVsGBq7XvFgR3qHPr/?=
 =?us-ascii?Q?mUtTXYZzyiuch6zvKgRjboy224JZV0SjGnAwXuoogxB5zwqwr+r4VdcBhOdn?=
 =?us-ascii?Q?xr/w7RPUOgIJ1bAO5mlstdkCmBNy+/eNpTyj0/rgUklaP3fc5kZRRCFMsSk8?=
 =?us-ascii?Q?rsAZZ3+kWB2hrFEE/NuqJWA5mzcS2AZ+k2qtWApjazeMzluFnlzxqwsX0Qp7?=
 =?us-ascii?Q?B2R+yCCuI6blzXxzT9gzp9ZAIehJGoWyMqiJ7GLUaA7GuNG6rSXci+h2zucr?=
 =?us-ascii?Q?8wpDYZsrOOFhhoVZ5Lxu8CH0xIIlb/kWi645yIUvPdLFTypuiwyaXj9oLsDw?=
 =?us-ascii?Q?bwjCvC2P0n9TvAniaNdHxoepTA3HMzhhRboDWiyL1hGR+wY/RmNxmV/J2zH3?=
 =?us-ascii?Q?yEfsvBP//bSOosxWAJGAuNnDx/mKsq1lhPb2SQk/XsHDcUDYJWPrG3WD7jZY?=
 =?us-ascii?Q?ccUQq0kwg0x6+yPKBvgYJXWcrY49AMYZ7dTljuHmlVngg5UXcy0TYR/EwkGL?=
 =?us-ascii?Q?ELH2ksikWIJ0eJALBY8hwYH1C0hcDMmnMxuiIOjdYjR2Vz40Zfm1RbHtcQ6W?=
 =?us-ascii?Q?QGJd3RnY5EqRYzrHjeXDN3Sqxw1Ds8jl0LkeVXC1Or+rBKVCOEOYSQiLF0yR?=
 =?us-ascii?Q?bCof9d37Gi/L6yNcQMxIvYLPzkPwvbVqfikoR8O17HFcHG7OxoMeK6iKUtum?=
 =?us-ascii?Q?E08J5zoYgQZFPr7iqetIp+JqG3fhn20wQa96XfWcGVDYCpZe0quqLeInaRqx?=
 =?us-ascii?Q?xJiDfame+kXeus2Q86sGmirEaRkbEM30g/um8UfzCZI3SvAi247P+/FW5XET?=
 =?us-ascii?Q?rE63aPy5BWXYBzx5DWeu/qBFZiwJSn9PrKOR0yDF8YwISH4CVfs5e5sP7vw+?=
 =?us-ascii?Q?Hx/ZDGLsZsYIyi7HU7vzMtaO+wmjS7bCmWHB8kBEL9as3xpL7usvll4t7DpS?=
 =?us-ascii?Q?bI5IBjNhy/lJYDCTZrqTe1AVFbyGEPQwPsc+dBcpBVyH9KpjoP4g0mfdv1UH?=
 =?us-ascii?Q?B4f3TF/kyCtx8bLh1yYT2qiM7odKGEwXiH0VK25Ce8wW6oFlmNXlQU5uA2Fo?=
 =?us-ascii?Q?cXpiCHGD6PUo8qqyud4iW71s/MoR9CgB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9452.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yECHNIjuwTVInUaL2kZc/1Kt4M1hDzQSUs34oUWkXvD/3bM82tnWfj6glqlq?=
 =?us-ascii?Q?0AiExn4/L4bQN5lSX6B+LO/K9Vnj+ikAs8cHG6ru0QUpxHrnsBxQti+s29nb?=
 =?us-ascii?Q?gvhfbOqJtaKptBCHbA5SBl/Kyajc30g55wyj/nIe0cXY0EBhR5asp8WCK35P?=
 =?us-ascii?Q?u3W/LDV0y+b0l64sB+cIg5j9erCeIkFUSCrgPR9WUzvMslyqDIc53VcF+qHT?=
 =?us-ascii?Q?oyQXR59jSHbnzoQYzoO6DMp3Zs/V22wbJCRCaP5BTKPx+P0IquyPWkt2NpEy?=
 =?us-ascii?Q?NX3VJgAf7ffd1+mzpd9iRGwU7RFP2U6oZFM8JpWMLKphLsxK37RbPB+6Sj9l?=
 =?us-ascii?Q?vt3Gx8ewwpLXQXNscjCjRg/koLikwvJa94T7wB+nT7hMGP/L39iuH3LkTang?=
 =?us-ascii?Q?sD8FfmEE6arB+KtuoBYEuQQ58HRu9XvQh7tSWv//dfGpV68rL0WKyfEce4dT?=
 =?us-ascii?Q?O3G2PhUnRcNl1pPDGl/4f84TDresjK+k9KYtR6rCFEpvqbdMQn6JAK98M82D?=
 =?us-ascii?Q?sYJfbVdpjT6nnk1KOWQHNJOO6Hj8i1aSy1eNXLz90FmQLUTR/epDTQtlwL4e?=
 =?us-ascii?Q?pOxeyTWbQmzihasHKWVikFSRiKU3Fm2U5Bc/KpfyErT4sYSYp9qQqWyLj5JF?=
 =?us-ascii?Q?I7SpAxTzEp2KZPg6k8OQ7w6S4Br626IjIYmZCnJxeA+fNZpQ7z7ICvs1XLsy?=
 =?us-ascii?Q?dww2EmWlpX2F1oFTGdWYU3oW5+yGcpvqZLmdyfWbTP0JWZiOVaQD2K3hdm/m?=
 =?us-ascii?Q?ksw485rT6bjST5Od3bCj4UpMPis4RMtxIpeahVxbvkHiCJW8ItHIf/tjgi94?=
 =?us-ascii?Q?yehnMx8ZufBrCnCFF0v+eBPDUgrZYtYvd6oVCi/lzKdRxVySIvrOnOMTcUVD?=
 =?us-ascii?Q?8SkPJIqu+1c8AEqa4lbkcjuCKZl598dHsCxYiS7Vi3EzD9nqqBQ+QX88OQ0D?=
 =?us-ascii?Q?HeEFUzRMSBikginQU9h3DGO85esIPjEQ1Une9H0hwA7frkO/em173yElxB8L?=
 =?us-ascii?Q?djrnJjvLA2kHpAWgtMbK0b+lSRe4rgRoVW5GEUTDRDUZLMa2btG7FVjWSnBC?=
 =?us-ascii?Q?nReTNGEQYK752phmVEDw3Oepf/tgYhEh63tJIDrhFEixcF+wqNYpkTpLHDPh?=
 =?us-ascii?Q?JAUb3KZ/gGOKRCuu8WVDkvNZPuc+LkTu56jOJVZcHUKc9d6cOuKbB/dFcDrO?=
 =?us-ascii?Q?/AZrCcKBWNIJD3Uf47b6XZQ/b21D6XOpHY8fMMK24+HI6SgibGc7YJyzswuA?=
 =?us-ascii?Q?lWVR3NBFfZvA3RxwYY2t8h+Rfg0vp8qewE4kXWdd/421mB5HkU6MngJcihuA?=
 =?us-ascii?Q?vbwkKOg1bcxRPuwyHh9656EEMvtzU8I6Q/AKSgfhoqhYh21tOzk3TtRLmSjP?=
 =?us-ascii?Q?l57yBpZ2OGt/JYs/Le5Gc/93MO7EFSFiaBiqVAAQ3ikxPa/C5jd6dCvCoZNG?=
 =?us-ascii?Q?aWd9Y8/RHdelZankdm1/iM+eQPFDPFJamVZt9S0Rx+FcmquDyTkSQ+OFhUzz?=
 =?us-ascii?Q?Q5s1ae1kFrnvSJS+1ENTfTC31iAHwh+hl/xniEeXsUEmDjomVxTXDL4Zgcz6?=
 =?us-ascii?Q?pVnEHw+FG9dlWRTYpTU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ec1dce-6da2-4ee6-d029-08dd24b9b74f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2024 07:57:01.9376 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bVBaPDRNFx6ucdZPO//reCgUCRQa3wysOIcRsDLMFs2edMFtOPTHUWdAfZwg4taYW/X+sMMqVwJBAQY2YEbdtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026
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

>=20
> On Tue, Dec 17, 2024 at 02:51:47PM +0800, Sandor Yu wrote:
> > Add a new DRM DisplayPort and HDMI bridge driver for Candence
> MHDP8501
> > used in i.MX8MQ SOC. MHDP8501 could support HDMI or DisplayPort
> > standards according embedded Firmware running in the uCPU.
> >
> > For iMX8MQ SOC, the DisplayPort/HDMI FW was loaded and activated by
> > SOC's ROM code. Bootload binary included respective specific firmware
> > is required.
> >
> > Driver will check display connector type and
> > then load the corresponding driver.
> >
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > ---
> > v19->v20:
> > - Dump mhdp FW version by debugfs
> > - Combine HDMI and DP cable detect functions into one function
> > - Combine HDMI and DP cable bridge_mode_valid() functions into one
> function
> > - Rename cdns_hdmi_reset_link() to cdns_hdmi_handle_hotplug()
> > - Add comments for EDID in cdns_hdmi_handle_hotplug() and
> cdns_dp_check_link_state()
> > - Add atomic_get_input_bus_fmts() and bridge_atomic_check() for DP driv=
er
> > - Remove bpc and color_fmt init in atomic_enable() function.
> > - More detail comments for DDC adapter only support
> SCDC_I2C_SLAVE_ADDRESS
> >   read and write in HDMI driver.
> >
> >
> > v18->v19:
> > - Get endpoint for data-lanes as it had move to endpoint of port@1
> > - Update clock management as devm_clk_get_enabled() introduced.
> > - Fix clear_infoframe() function is not work issue.
> > - Manage PHY power state via phy_power_on() and phy_power_off().
> >
> > v17->v18:
> > - MHDP8501 HDMI and DP commands that need access mailbox are
> rewrited
> >   with new API functions created in patch #1.
> > - replace lane-mapping with data-lanes, use the value from data-lanes
> >   to reorder HDMI and DP lane mapping.
> > - create I2C adapter for HDMI SCDC, remove cdns_hdmi_scdc_write()
> function.
> > - Rewrite cdns_hdmi_sink_config() function, use HDMI SCDC helper functi=
on
> >   drm_scdc_set_high_tmds_clock_ratio() and drm_scdc_set_scrambling()
> >   to config HDMI sink TMDS.
> > - Remove struct video_info from HDMI driver.
> > - Remove tmds_char_rate_valid() be called in bridge_mode_valid(),
> >   community had patch in reviewing to implement the function.
> > - Remove warning message print when get unknown HPD cable status.
> > - Add more detail comments for HDP plugin and plugout interrupt.
> > - use dev_dbg to repleace DRM_INFO when cable HPD status changed.
> > - Remove t-b tag as above code change.
> >
> >  drivers/gpu/drm/bridge/cadence/Kconfig        |  16 +
> >  drivers/gpu/drm/bridge/cadence/Makefile       |   2 +
> >  .../drm/bridge/cadence/cdns-mhdp8501-core.c   | 379 +++++++++
> >  .../drm/bridge/cadence/cdns-mhdp8501-core.h   | 380 +++++++++
> >  .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 694
> ++++++++++++++++
> >  .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 745
> ++++++++++++++++++
> >  6 files changed, 2216 insertions(+)
> >  create mode 100644
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> >  create mode 100644
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
> >  create mode 100644
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
> >  create mode 100644
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> >
> > diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig
> b/drivers/gpu/drm/bridge/cadence/Kconfig
> > index dbb06533ccab2..bd979f3e6df48 100644
> > --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> > +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> > @@ -48,3 +48,19 @@ config DRM_CDNS_MHDP8546_J721E
> >         initializes the J721E Display Port and sets up the
> >         clock and data muxes.
> >  endif
> > +
> > +config DRM_CDNS_MHDP8501
> > +     tristate "Cadence MHDP8501 DP/HDMI bridge"
> > +     select DRM_KMS_HELPER
> > +     select DRM_PANEL_BRIDGE
> > +     select DRM_DISPLAY_DP_HELPER
> > +     select DRM_DISPLAY_HELPER
> > +     select DRM_CDNS_AUDIO
> > +     select CDNS_MHDP_HELPER
> > +     depends on OF
> > +     help
> > +       Support Cadence MHDP8501 DisplayPort/HDMI bridge.
> > +       Cadence MHDP8501 support one or more protocols,
> > +       including DisplayPort and HDMI.
> > +       To use the DP and HDMI drivers, their respective
> > +       specific firmware is required.
> > diff --git a/drivers/gpu/drm/bridge/cadence/Makefile
> b/drivers/gpu/drm/bridge/cadence/Makefile
> > index c95fd5b81d137..ea327287d1c14 100644
> > --- a/drivers/gpu/drm/bridge/cadence/Makefile
> > +++ b/drivers/gpu/drm/bridge/cadence/Makefile
> > @@ -5,3 +5,5 @@ cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) +=3D
> cdns-dsi-j721e.o
> >  obj-$(CONFIG_DRM_CDNS_MHDP8546) +=3D cdns-mhdp8546.o
> >  cdns-mhdp8546-y :=3D cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
> >  cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) +=3D
> cdns-mhdp8546-j721e.o
> > +obj-$(CONFIG_DRM_CDNS_MHDP8501) +=3D cdns-mhdp8501.o
> > +cdns-mhdp8501-y :=3D cdns-mhdp8501-core.o cdns-mhdp8501-dp.o
> cdns-mhdp8501-hdmi.o
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> > new file mode 100644
> > index 0000000000000..98116ef012fa3
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> > @@ -0,0 +1,379 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Cadence Display Port Interface (DP) driver
> > + *
> > + * Copyright (C) 2023-2024 NXP Semiconductor, Inc.
> > + *
> > + */
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_print.h>
> > +#include <linux/clk.h>
> > +#include <linux/irq.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/phy/phy.h>
> > +
> > +#include "cdns-mhdp8501-core.h"
> > +
> > +static ssize_t firmware_version_show(struct device *dev,
> > +                                  struct device_attribute *attr,
> char *buf);
> > +static struct device_attribute firmware_version =3D
> __ATTR_RO(firmware_version);
> > +
> > +ssize_t firmware_version_show(struct device *dev,
> > +                           struct device_attribute *attr, char *buf)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D dev_get_drvdata(dev);
> > +
> > +     u32 version =3D readl(mhdp->base.regs + VER_L) |
> readl(mhdp->base.regs + VER_H) << 8;
> > +     u32 lib_version =3D readl(mhdp->base.regs + VER_LIB_L_ADDR) |
> > +                       readl(mhdp->base.regs + VER_LIB_H_ADDR)
> << 8;
> > +
> > +     return sprintf(buf, "FW version %d, Lib version %d\n", version,
> lib_version);
> > +}
> > +
> > +static void cdns_mhdp8501_create_device_files(struct
> cdns_mhdp8501_device *mhdp)
> > +{
> > +     if (device_create_file(mhdp->dev, &firmware_version)) {
> > +             DRM_ERROR("Unable to create firmware_version
> sysfs\n");
> > +             device_remove_file(mhdp->dev, &firmware_version);
> > +     }
> > +}
> > +
> > +static void cdns_mhdp8501_remove_device_files(struct
> cdns_mhdp8501_device *mhdp)
> > +{
> > +     device_remove_file(mhdp->dev, &firmware_version);
> > +}
> > +
> > +static int cdns_mhdp8501_read_hpd(struct cdns_mhdp8501_device
> *mhdp)
> > +{
> > +     u8 status;
> > +     int ret;
> > +
> > +     ret =3D cdns_mhdp_mailbox_send_recv(&mhdp->base,
> MB_MODULE_ID_GENERAL,
> > +
> GENERAL_GET_HPD_STATE,
> > +                                       0, NULL, sizeof(status),
> &status);
> > +     if (ret) {
> > +             dev_err(mhdp->dev, "read hpd failed: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     return status;
> > +}
> > +
> > +enum drm_connector_status cdns_mhdp8501_detect(struct drm_bridge
> *bridge)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +
> > +     u8 hpd =3D 0xf;
> > +
> > +     hpd =3D cdns_mhdp8501_read_hpd(mhdp);
> > +     if (hpd =3D=3D 1)
> > +             return connector_status_connected;
> > +     else if (hpd =3D=3D 0)
> > +             return connector_status_disconnected;
> > +
> > +     return connector_status_unknown;
> > +}
> > +
> > +enum drm_mode_status
> > +cdns_mhdp8501_mode_valid(struct drm_bridge *bridge,
> > +                      const struct drm_display_info *info,
> > +                      const struct drm_display_mode *mode)
> > +{
> > +     /* We don't support double-clocked */
> > +     if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> > +             return MODE_BAD;
> > +
> > +     /* MAX support pixel clock rate 594MHz */
> > +     if (mode->clock > 594000)
> > +             return MODE_CLOCK_HIGH;
> > +
> > +     if (mode->hdisplay > 3840)
> > +             return MODE_BAD_HVALUE;
> > +
> > +     if (mode->vdisplay > 2160)
> > +             return MODE_BAD_VVALUE;
> > +
> > +     return MODE_OK;
> > +}
> > +
> > +static void hotplug_work_func(struct work_struct *work)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D container_of(work,
> > +                                                  struct
> cdns_mhdp8501_device,
> > +
> hotplug_work.work);
> > +     enum drm_connector_status status =3D
> cdns_mhdp8501_detect(&mhdp->bridge);
> > +
> > +     drm_bridge_hpd_notify(&mhdp->bridge, status);
> > +
> > +     /*
> > +      * iMX8MQ has two HPD interrupts: one for plugout and one for
> plugin.
> > +      * These interrupts cannot be masked and cleaned, so we must
> enable one
> > +      * and disable the other to avoid continuous interrupt generation=
.
> > +      */
> > +     if (status =3D=3D connector_status_connected) {
> > +             /* Cable connected  */
> > +             dev_dbg(mhdp->dev, "HDMI/DP Cable Plug In\n");
> > +             enable_irq(mhdp->irq[IRQ_OUT]);
> > +
> > +             /* Reset HDMI/DP link with sink */
> > +             if (mhdp->connector_type =3D=3D
> DRM_MODE_CONNECTOR_HDMIA)
> > +                     cdns_hdmi_handle_hotplug(mhdp);
> > +             else
> > +                     cdns_dp_check_link_state(mhdp);
> > +
> > +     } else if (status =3D=3D connector_status_disconnected) {
> > +             /* Cable Disconnected  */
> > +             dev_dbg(mhdp->dev, "HDMI/DP Cable Plug Out\n");
> > +             enable_irq(mhdp->irq[IRQ_IN]);
> > +     }
> > +}
> > +
> > +static irqreturn_t cdns_mhdp8501_irq_thread(int irq, void *data)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D data;
> > +
> > +     disable_irq_nosync(irq);
> > +
> > +     mod_delayed_work(system_wq, &mhdp->hotplug_work,
> > +                      msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +#define DATA_LANES_COUNT     4
> > +static int cdns_mhdp8501_dt_parse(struct cdns_mhdp8501_device
> *mhdp,
> > +                               struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct device_node *np =3D dev->of_node;
> > +     struct device_node *remote, *endpoint;
> > +     u32 data_lanes[DATA_LANES_COUNT];
> > +     u32 lane_value;
> > +     int ret, i;
> > +
> > +     remote =3D of_graph_get_remote_node(np, 1, 0);
> > +     if (!remote) {
> > +             dev_err(dev, "fail to get remote node\n");
> > +             of_node_put(remote);
> > +             return -EINVAL;
> > +     }
> > +
> > +     /* get connector type */
> > +     if (of_device_is_compatible(remote, "hdmi-connector")) {
> > +             mhdp->connector_type =3D
> DRM_MODE_CONNECTOR_HDMIA;
> > +
> > +     } else if (of_device_is_compatible(remote, "dp-connector")) {
> > +             mhdp->connector_type =3D
> DRM_MODE_CONNECTOR_DisplayPort;
>=20
> Interesting hack. What if somebody wraps DP signals with the USB-C
> controller in order to provide DP over USB-C?

There is no such requirement now, and the supported types of display-connec=
tors do not include Type-C DP connectors.=20
If type-C DP connectors is added in the future, I think it would be accepta=
ble to modify the code here.

>=20
> Unfortunately I don't have a good solution here. There might be other
> format converters after your bridge, so you even can't look at the last
> bridge of the chain. You might want to examine the phy-mode property and
> use it to specify whether the PHY should work in the HDMI or in the DP
> mode.

MHDP supports either HDMI or DP based on its firmware.=20
The PHY doesn't provide a function to indicate which firmware is currently =
running,=20
and the controller driver doesn't have a mechanism to determine whether it'=
s DP or HDMI.=20
The users should select the corresponding firmware based on the connector t=
ype when their get the board.

For the driver, there must be an external input to determine whether it's c=
urrently running in HDMI or DP mode.=20
In earlier versions, I used different compatible strings to distinguish bet=
ween DP and HDMI.=20
However, based on comments from other reviewers,=20
I changed the approach to checking the connector type, which is clearly a m=
ore suitable method.

>=20
> Also, where do get the next bridge and attach it to the bridge chain?

next_bridge get and attach is missed in the driver, I will add it.

>=20
> > +
> > +     } else {
> > +             dev_err(dev, "Unknown connector type\n");
> > +             of_node_put(remote);
> > +             return -EINVAL;
> > +     }
> > +
> > +     of_node_put(remote);
> > +
> > +     endpoint =3D of_graph_get_endpoint_by_regs(np, 1, -1);
> > +
> > +     /* Get the data lanes ordering */
> > +     ret =3D of_property_count_u32_elems(endpoint, "data-lanes");
> > +     if (ret < 0)
> > +             return  -EINVAL;
> > +     if (ret !=3D DATA_LANES_COUNT) {
> > +             dev_err(dev, "expected 4 data lanes\n");
> > +             return  -EINVAL;
> > +     }
>=20
> Isn't it drm_of_get_data_lanes_count_ep()?

drm_of_get_data_lanes_count will be used here in the next version.

>=20
> > +
> > +     ret =3D of_property_read_u32_array(endpoint, "data-lanes",
> > +                                      data_lanes,
> DATA_LANES_COUNT);
> > +     if (ret)
> > +             return  -EINVAL;
> > +
> > +     mhdp->lane_mapping  =3D 0;
> > +     for (i =3D 0; i < DATA_LANES_COUNT; i++) {
> > +             lane_value =3D (data_lanes[i] >=3D 0 && data_lanes[i] <=
=3D 3) ?
> data_lanes[i] : 0;
> > +             mhdp->lane_mapping |=3D lane_value << (i * 2);
> > +     }
> > +
> > +     return true;
> > +}
> > +
> > +static int cdns_mhdp8501_add_bridge(struct cdns_mhdp8501_device
> *mhdp)
> > +{
> > +     mhdp->bridge.type =3D mhdp->connector_type;
> > +     mhdp->bridge.driver_private =3D mhdp;
> > +     mhdp->bridge.of_node =3D mhdp->dev->of_node;
> > +     mhdp->bridge.vendor =3D "NXP";
> > +     mhdp->bridge.product =3D "i.MX8";
> > +     mhdp->bridge.ops =3D DRM_BRIDGE_OP_DETECT |
> DRM_BRIDGE_OP_EDID |
> > +                        DRM_BRIDGE_OP_HPD;
> > +
> > +     if (mhdp->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA) {
> > +             mhdp->bridge.funcs =3D &cdns_hdmi_bridge_funcs;
> > +             mhdp->bridge.ops |=3D DRM_BRIDGE_OP_HDMI;
> > +             mhdp->bridge.ddc =3D cdns_hdmi_i2c_adapter(mhdp);
>=20
> I'd expect that bridge.ddc provides DDC service. Is it required to
> control the SCDC from userspace?

I may not have fully understood your question.=20
The DDC here is used for the SCDC API functions like drm_scdc_set_XXX in HD=
MI driver.
So far, I haven't encountered any cases where the user needs to control SCD=
C.

>=20
> > +     } else if (mhdp->connector_type =3D=3D
> DRM_MODE_CONNECTOR_DisplayPort) {
> > +             mhdp->bridge.funcs =3D &cdns_dp_bridge_funcs;
> > +     } else {
> > +             dev_err(mhdp->dev, "Unsupported connector type!\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     drm_bridge_add(&mhdp->bridge);
> > +
> > +     return 0;
> > +}
> > +
> > +static int cdns_mhdp8501_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct cdns_mhdp8501_device *mhdp;
> > +     struct resource *res;
> > +     enum phy_mode phy_mode;
> > +     u32 reg;
> > +     int ret;
> > +
> > +     mhdp =3D devm_kzalloc(dev, sizeof(*mhdp), GFP_KERNEL);
> > +     if (!mhdp)
> > +             return -ENOMEM;
> > +
> > +     mhdp->dev =3D dev;
> > +
> > +     INIT_DELAYED_WORK(&mhdp->hotplug_work, hotplug_work_func);
> > +
> > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     if (!res)
> > +             return -ENODEV;
> > +
> > +     mhdp->regs =3D devm_ioremap(dev, res->start, resource_size(res));
> > +     if (IS_ERR(mhdp->regs))
> > +             return PTR_ERR(mhdp->regs);
> > +
> > +     cdns_mhdp8501_create_device_files(mhdp);
> > +
> > +     ret =3D cdns_mhdp8501_dt_parse(mhdp, pdev);
> > +     if (ret < 0)
> > +             return -EINVAL;
> > +
> > +     mhdp->phy =3D devm_of_phy_get_by_index(dev, pdev->dev.of_node,
> 0);
> > +     if (IS_ERR(mhdp->phy))
> > +             return dev_err_probe(dev, PTR_ERR(mhdp->phy), "no PHY
> configured\n");
> > +
> > +     mhdp->irq[IRQ_IN] =3D platform_get_irq_byname(pdev, "plug_in");
> > +     if (mhdp->irq[IRQ_IN] < 0)
> > +             return dev_err_probe(dev, mhdp->irq[IRQ_IN], "No
> plug_in irq number\n");
> > +
> > +     mhdp->irq[IRQ_OUT] =3D platform_get_irq_byname(pdev,
> "plug_out");
> > +     if (mhdp->irq[IRQ_OUT] < 0)
> > +             return dev_err_probe(dev, mhdp->irq[IRQ_OUT], "No
> plug_out irq number\n");
> > +
> > +     irq_set_status_flags(mhdp->irq[IRQ_IN], IRQ_NOAUTOEN);
> > +     ret =3D devm_request_threaded_irq(dev, mhdp->irq[IRQ_IN],
> > +                                     NULL,
> cdns_mhdp8501_irq_thread,
> > +                                     IRQF_ONESHOT,
> dev_name(dev), mhdp);
> > +     if (ret < 0) {
> > +             dev_err(dev, "can't claim irq %d\n", mhdp->irq[IRQ_IN]);
> > +             return -EINVAL;
> > +     }
> > +
> > +     irq_set_status_flags(mhdp->irq[IRQ_OUT], IRQ_NOAUTOEN);
> > +     ret =3D devm_request_threaded_irq(dev, mhdp->irq[IRQ_OUT],
> > +                                     NULL,
> cdns_mhdp8501_irq_thread,
> > +                                     IRQF_ONESHOT,
> dev_name(dev), mhdp);
> > +     if (ret < 0) {
> > +             dev_err(dev, "can't claim irq %d\n",
> mhdp->irq[IRQ_OUT]);
> > +             return -EINVAL;
> > +     }
> > +
> > +     /* cdns_mhdp8501_dt_parse() ensures connector_type is valid */
> > +     if (mhdp->connector_type =3D=3D
> DRM_MODE_CONNECTOR_DisplayPort)
> > +             phy_mode =3D PHY_MODE_DP;
> > +     else if (mhdp->connector_type =3D=3D
> DRM_MODE_CONNECTOR_HDMIA)
> > +             phy_mode =3D PHY_MODE_HDMI;
> > +
> > +     dev_set_drvdata(dev, mhdp);
> > +
> > +     /* init base struct for access mhdp mailbox */
> > +     mhdp->base.dev =3D mhdp->dev;
> > +     mhdp->base.regs =3D mhdp->regs;
> > +
> > +     if (mhdp->connector_type =3D=3D
> DRM_MODE_CONNECTOR_DisplayPort) {
> > +             drm_dp_aux_init(&mhdp->dp.aux);
> > +             mhdp->dp.aux.name =3D "mhdp8501_dp_aux";
> > +             mhdp->dp.aux.dev =3D dev;
> > +             mhdp->dp.aux.transfer =3D cdns_dp_aux_transfer;
> > +     }
> > +
> > +     /* Enable APB clock */
> > +     mhdp->apb_clk =3D devm_clk_get_enabled(dev, NULL);
> > +     if (IS_ERR(mhdp->apb_clk))
> > +             return dev_err_probe(dev, PTR_ERR(mhdp->apb_clk),
> > +                                  "couldn't get apb clk\n");
> > +     /*
> > +      * Wait for the KEEP_ALIVE "message" on the first 8 bits.
> > +      * Updated each sched "tick" (~2ms)
> > +      */
> > +     ret =3D readl_poll_timeout(mhdp->regs + KEEP_ALIVE, reg,
> > +                              reg & CDNS_KEEP_ALIVE_MASK,
> 500,
> > +                              CDNS_KEEP_ALIVE_TIMEOUT);
> > +     if (ret) {
> > +             dev_err(dev, "device didn't give any life sign: reg %d\n"=
,
> reg);
> > +             return ret;
> > +     }
> > +
> > +     ret =3D phy_init(mhdp->phy);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to initialize PHY: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ret =3D phy_set_mode(mhdp->phy, phy_mode);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to configure PHY: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     /* Enable cable hotplug detect */
> > +     if (cdns_mhdp8501_read_hpd(mhdp))
> > +             enable_irq(mhdp->irq[IRQ_OUT]);
> > +     else
> > +             enable_irq(mhdp->irq[IRQ_IN]);
> > +
> > +     return cdns_mhdp8501_add_bridge(mhdp);
> > +}
> > +
> > +static void cdns_mhdp8501_remove(struct platform_device *pdev)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D
> platform_get_drvdata(pdev);
> > +
> > +     cdns_mhdp8501_remove_device_files(mhdp);
> > +
> > +     if (mhdp->connector_type =3D=3D
> DRM_MODE_CONNECTOR_DisplayPort)
> > +             cdns_dp_aux_destroy(mhdp);
> > +
> > +     drm_bridge_remove(&mhdp->bridge);
> > +}
> > +
> > +static const struct of_device_id cdns_mhdp8501_dt_ids[] =3D {
> > +     { .compatible =3D "fsl,imx8mq-mhdp8501",
> > +     },
>=20
> Strange line wrapping, I'd say. Either it should all be on the same
> line, or take three lines.

I will fix it.

>=20
> > +     { },
> > +};
> > +MODULE_DEVICE_TABLE(of, cdns_mhdp8501_dt_ids);
> > +
> > +static struct platform_driver cdns_mhdp8501_driver =3D {
> > +     .probe =3D cdns_mhdp8501_probe,
> > +     .remove =3D cdns_mhdp8501_remove,
> > +     .driver =3D {
> > +             .name =3D "cdns-mhdp8501",
> > +             .of_match_table =3D cdns_mhdp8501_dt_ids,
> > +     },
> > +};
> > +
> > +module_platform_driver(cdns_mhdp8501_driver);
> > +
> > +MODULE_AUTHOR("Sandor Yu <sandor.yu@nxp.com>");
> > +MODULE_DESCRIPTION("Cadence MHDP8501 bridge driver");
> > +MODULE_LICENSE("GPL");


> > +static void cdns_dp_mode_set(struct cdns_mhdp8501_device *mhdp,
> > +                          const struct drm_display_mode *mode)
> > +{
> > +     union phy_configure_opts phy_cfg;
> > +     int ret;
> > +
> > +     cdns_dp_pixel_clk_reset(mhdp);
> > +
> > +     /* Get DP Caps  */
> > +     ret =3D drm_dp_dpcd_read(&mhdp->dp.aux, DP_DPCD_REV,
> mhdp->dp.dpcd,
> > +                            DP_RECEIVER_CAP_SIZE);
> > +     if (ret < 0) {
> > +             dev_err(mhdp->dev, "Failed to get caps %d\n", ret);
> > +             return;
> > +     }
> > +
> > +     mhdp->dp.rate =3D drm_dp_max_link_rate(mhdp->dp.dpcd);
> > +     mhdp->dp.num_lanes =3D drm_dp_max_lane_count(mhdp->dp.dpcd);
> > +
> > +     /* check the max link rate */
> > +     if (mhdp->dp.rate > CDNS_DP_MAX_LINK_RATE)
> > +             mhdp->dp.rate =3D CDNS_DP_MAX_LINK_RATE;
> > +
> > +     phy_cfg.dp.lanes =3D mhdp->dp.num_lanes;
> > +     phy_cfg.dp.link_rate =3D mhdp->dp.rate;
> > +     phy_cfg.dp.set_lanes =3D false;
> > +     phy_cfg.dp.set_rate =3D false;
> > +     phy_cfg.dp.set_voltages =3D false;
>=20
> If all of those are false, then you can skip setting .lanes and
> .link_rate.

I may have misunderstood the comments in the header file for these two flag=
s.=20
I'll check them again.

>=20
> > +
> > +     ret =3D phy_configure(mhdp->phy, &phy_cfg);
> > +     if (ret) {
> > +             dev_err(mhdp->dev, "%s: phy_configure() failed: %d\n",
> > +                     __func__, ret);
> > +             return;
> > +     }
> > +
> > +     /* Video off */
> > +     ret =3D cdns_dp_set_video_status(mhdp, CONTROL_VIDEO_IDLE);
> > +     if (ret) {
> > +             dev_err(mhdp->dev, "Failed to valid video %d\n", ret);
> > +             return;
> > +     }
> > +
> > +     /* Line swapping */
> > +     cdns_mhdp_reg_write(&mhdp->base, LANES_CONFIG, 0x00400000
> | mhdp->lane_mapping);
> > +
> > +     /* Set DP host capability */
> > +     ret =3D cdns_dp_set_host_cap(mhdp);
> > +     if (ret) {
> > +             dev_err(mhdp->dev, "Failed to set host cap %d\n", ret);
> > +             return;
> > +     }
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base,
> DP_AUX_SWAP_INVERSION_CONTROL,
> > +                               AUX_HOST_INVERT);
> > +     if (ret) {
> > +             dev_err(mhdp->dev, "Failed to set host invert %d\n", ret)=
;
> > +             return;
> > +     }
> > +
> > +     ret =3D cdns_dp_config_video(mhdp, mode);
> > +     if (ret)
> > +             dev_err(mhdp->dev, "Failed to config video %d\n", ret);
> > +}
> > +
> > +static bool
> > +cdns_dp_needs_link_retrain(struct cdns_mhdp8501_device *mhdp)
> > +{
> > +     u8 link_status[DP_LINK_STATUS_SIZE];
> > +
> > +     if (drm_dp_dpcd_read_phy_link_status(&mhdp->dp.aux,
> DP_PHY_DPRX,
> > +                                          link_status) < 0)
> > +             return false;
> > +
> > +     /* Retrain if link not ok */
> > +     return !drm_dp_channel_eq_ok(link_status, mhdp->dp.num_lanes);
> > +}
> > +
> > +void cdns_dp_check_link_state(struct cdns_mhdp8501_device *mhdp)
> > +{
> > +     struct drm_connector *connector =3D mhdp->curr_conn;
> > +     const struct drm_edid *drm_edid;
> > +     struct drm_connector_state *conn_state;
> > +     struct drm_crtc_state *crtc_state;
> > +     struct drm_crtc *crtc;
> > +
> > +     if (!connector)
> > +             return;
> > +
> > +     /*
> > +      * EDID data needs updating after each cable plugin
> > +      * due to potential display monitor changes
> > +      */
> > +     drm_edid =3D drm_edid_read_custom(connector,
> cdns_dp_get_edid_block, mhdp);
> > +     drm_edid_connector_update(connector, drm_edid);
> > +
> > +     if (!drm_edid)
> > +             return;
> > +
> > +     drm_edid_free(drm_edid);
> > +
> > +     conn_state =3D connector->state;
> > +     crtc =3D conn_state->crtc;
> > +     if (!crtc)
> > +             return;
> > +
> > +     crtc_state =3D crtc->state;
> > +     if (!crtc_state->active)
> > +             return;
> > +
> > +     if (!cdns_dp_needs_link_retrain(mhdp))
> > +             return;
> > +
> > +     /* DP link retrain */
> > +     if (cdns_dp_train_link(mhdp))
> > +             dev_err(mhdp->dev, "Failed link train\n");
>=20
> Won't this cause link traning to happen on the first monitor plug event?
> Is it okay to do even with the phy being powered off?

These two cases have already been excluded in the previous codes.=20

>=20
> > +}
> > +
> > +static int cdns_dp_bridge_attach(struct drm_bridge *bridge,
> > +                              enum drm_bridge_attach_flags flags)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +
> > +     if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > +             dev_err(mhdp->dev, "do not support creating a
> drm_connector\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     mhdp->dp.aux.drm_dev =3D bridge->dev;
> > +
> > +     return drm_dp_aux_register(&mhdp->dp.aux);
>=20
> Why is it a part of the _attach callback? If there is anything on the DP
> AUX bus, it should be already registered by this point.

Here, I've referenced other DP drivers and called drm_dp_aux_register in th=
e attach function.
No any special requirements for AUX in my DP driver.

>=20
> > +}
> > +
> > +static const struct drm_edid
> > +*cdns_dp_bridge_edid_read(struct drm_bridge *bridge,
> > +                       struct drm_connector *connector)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +
> > +     return drm_edid_read_custom(connector, cdns_dp_get_edid_block,
> mhdp);
> > +}
> > +
> > +/* Currently supported format */
> > +static const u32 mhdp8501_input_fmts[] =3D {
> > +     MEDIA_BUS_FMT_RGB888_1X24,
> > +     MEDIA_BUS_FMT_RGB101010_1X30,
> > +};
> > +
> > +static u32 *cdns_dp_bridge_atomic_get_input_bus_fmts(struct
> drm_bridge *bridge,
> > +                                                  struct
> drm_bridge_state *bridge_state,
> > +                                                  struct
> drm_crtc_state *crtc_state,
> > +                                                  struct
> drm_connector_state *conn_state,
> > +                                                  u32
> output_fmt,
> > +                                                  unsigned int
> *num_input_fmts)
> > +{
> > +     u32 *input_fmts;
> > +
> > +     *num_input_fmts =3D 0;
> > +
> > +     input_fmts =3D kcalloc(ARRAY_SIZE(mhdp8501_input_fmts),
> > +                          sizeof(*input_fmts),
> > +                          GFP_KERNEL);
> > +     if (!input_fmts)
> > +             return NULL;
> > +
> > +     *num_input_fmts =3D ARRAY_SIZE(mhdp8501_input_fmts);
> > +     memcpy(input_fmts, mhdp8501_input_fmts,
> sizeof(mhdp8501_input_fmts));
> > +
> > +     return input_fmts;
> > +}
> > +
> > +static int cdns_dp_bridge_atomic_check(struct drm_bridge *bridge,
> > +                                    struct drm_bridge_state
> *bridge_state,
> > +                                    struct drm_crtc_state
> *crtc_state,
> > +                                    struct drm_connector_state
> *conn_state)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +     struct video_info *video =3D &mhdp->video_info;
> > +
> > +     if (bridge_state->input_bus_cfg.format =3D=3D
> MEDIA_BUS_FMT_RGB888_1X24) {
> > +             video->bpc =3D 8;
> > +             video->color_fmt =3D DRM_COLOR_FORMAT_RGB444;
> > +     } else if (bridge_state->input_bus_cfg.format =3D=3D
> MEDIA_BUS_FMT_RGB101010_1X30) {
> > +             video->bpc =3D 10;
> > +             video->color_fmt =3D DRM_COLOR_FORMAT_RGB444;
>=20
> Which driver is going to select bus config for you?

Oh, actually there isn't. The driver uses the first format in mhdp8501_inpu=
t_fmts.

>=20
> > +     } else {
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void cdns_dp_bridge_atomic_disable(struct drm_bridge *bridge,
> > +                                       struct drm_bridge_state
> *old_state)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +
> > +     cdns_dp_set_video_status(mhdp, CONTROL_VIDEO_IDLE);
> > +     mhdp->curr_conn =3D NULL;
> > +
> > +     phy_power_off(mhdp->phy);
> > +}
> > +
> > +static void cdns_dp_bridge_atomic_enable(struct drm_bridge *bridge,
> > +                                      struct drm_bridge_state
> *old_state)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +     struct drm_atomic_state *state =3D old_state->base.state;
> > +     struct drm_connector *connector;
> > +     struct drm_crtc_state *crtc_state;
> > +     struct drm_connector_state *conn_state;
> > +     int ret;
> > +
> > +     connector =3D drm_atomic_get_new_connector_for_encoder(state,
> > +
> bridge->encoder);
> > +     if (WARN_ON(!connector))
> > +             return;
> > +
> > +     mhdp->curr_conn =3D connector;
> > +
> > +     conn_state =3D drm_atomic_get_new_connector_state(state,
> connector);
> > +     if (WARN_ON(!conn_state))
> > +             return;
> > +
> > +     crtc_state =3D drm_atomic_get_new_crtc_state(state,
> conn_state->crtc);
> > +     if (WARN_ON(!crtc_state))
> > +             return;
> > +
> > +     cdns_dp_mode_set(mhdp, &crtc_state->adjusted_mode);
> > +
> > +     /* Power up PHY before link training */
> > +     phy_power_on(mhdp->phy);
> > +
> > +     /* Link training */
> > +     ret =3D cdns_dp_train_link(mhdp);
> > +     if (ret) {
> > +             dev_err(mhdp->dev, "Failed link train %d\n", ret);
> > +             return;
> > +     }
> > +
> > +     ret =3D cdns_dp_set_video_status(mhdp, CONTROL_VIDEO_VALID);
> > +     if (ret) {
> > +             dev_err(mhdp->dev, "Failed to valid video %d\n", ret);
> > +             return;
> > +     }
> > +}
> > +
> > +const struct drm_bridge_funcs cdns_dp_bridge_funcs =3D {
> > +     .attach =3D cdns_dp_bridge_attach,
> > +     .detect =3D cdns_mhdp8501_detect,
> > +     .edid_read =3D cdns_dp_bridge_edid_read,
> > +     .mode_valid =3D cdns_mhdp8501_mode_valid,
> > +     .atomic_enable =3D cdns_dp_bridge_atomic_enable,
> > +     .atomic_disable =3D cdns_dp_bridge_atomic_disable,
> > +     .atomic_get_input_bus_fmts =3D
> cdns_dp_bridge_atomic_get_input_bus_fmts,
> > +     .atomic_check =3D cdns_dp_bridge_atomic_check,
> > +     .atomic_duplicate_state =3D
> drm_atomic_helper_bridge_duplicate_state,
> > +     .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> > +     .atomic_reset =3D drm_atomic_helper_bridge_reset,
> > +};
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> > new file mode 100644
> > index 0000000000000..9556d0929e21d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> > @@ -0,0 +1,745 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Cadence MHDP8501 HDMI bridge driver
> > + *
> > + * Copyright (C) 2019-2024 NXP Semiconductor, Inc.
> > + *
> > + */
> > +#include <drm/display/drm_hdmi_helper.h>
> > +#include <drm/display/drm_hdmi_state_helper.h>
> > +#include <drm/display/drm_scdc_helper.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_edid.h>
> > +#include <drm/drm_print.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/phy/phy-hdmi.h>
> > +
> > +#include "cdns-mhdp8501-core.h"
> > +
> > +/**
> > + * cdns_hdmi_config_infoframe() - fill the HDMI infoframe
> > + * @mhdp: phandle to mhdp device.
> > + * @entry_id: The packet memory address in which the data is written.
> > + * @len: length of infoframe.
> > + * @buf: point to InfoFrame Packet.
> > + * @type: Packet Type of InfoFrame in HDMI Specification.
> > + *
> > + */
> > +
> > +static void cdns_hdmi_clear_infoframe(struct cdns_mhdp8501_device
> *mhdp,
> > +                                   u8 entry_id, u8 type)
> > +{
> > +     u32 val;
> > +
> > +     /* invalidate entry */
> > +     val =3D F_ACTIVE_IDLE_TYPE(1) | F_PKT_ALLOC_ADDRESS(entry_id) |
> > +           F_PACKET_TYPE(type);
> > +     writel(val, mhdp->regs + SOURCE_PIF_PKT_ALLOC_REG);
> > +     writel(F_PKT_ALLOC_WR_EN(1), mhdp->regs +
> SOURCE_PIF_PKT_ALLOC_WR_EN);
> > +}
> > +
> > +static void cdns_hdmi_config_infoframe(struct cdns_mhdp8501_device
> *mhdp,
> > +                                    u8 entry_id, u8 len,
> > +                                    const u8 *buf, u8 type)
> > +{
> > +     u8 packet[32], packet_len =3D 32;
> > +     u32 packet32, len32;
> > +     u32 val, i;
> > +
> > +     /*
> > +      * only support 32 bytes now
> > +      * packet[0] =3D 0
> > +      * packet[1-3] =3D HB[0-2]  InfoFrame Packet Header
> > +      * packet[4-31 =3D PB[0-27] InfoFrame Packet Contents
> > +      */
> > +     if (len >=3D (packet_len - 1))
> > +             return;
> > +     packet[0] =3D 0;
> > +     memcpy(packet + 1, buf, len);
> > +
> > +     cdns_hdmi_clear_infoframe(mhdp, entry_id, type);
> > +
> > +     /* flush fifo 1 */
> > +     writel(F_FIFO1_FLUSH(1), mhdp->regs +
> SOURCE_PIF_FIFO1_FLUSH);
> > +
> > +     /* write packet into memory */
> > +     len32 =3D packet_len / 4;
> > +     for (i =3D 0; i < len32; i++) {
> > +             packet32 =3D get_unaligned_le32(packet + 4 * i);
> > +             writel(F_DATA_WR(packet32), mhdp->regs +
> SOURCE_PIF_DATA_WR);
> > +     }
> > +
> > +     /* write entry id */
> > +     writel(F_WR_ADDR(entry_id), mhdp->regs +
> SOURCE_PIF_WR_ADDR);
> > +
> > +     /* write request */
> > +     writel(F_HOST_WR(1), mhdp->regs + SOURCE_PIF_WR_REQ);
> > +
> > +     /* update entry */
> > +     val =3D F_ACTIVE_IDLE_TYPE(1) | F_TYPE_VALID(1) |
> > +           F_PACKET_TYPE(type) | F_PKT_ALLOC_ADDRESS(entry_id);
> > +     writel(val, mhdp->regs + SOURCE_PIF_PKT_ALLOC_REG);
> > +
> > +     writel(F_PKT_ALLOC_WR_EN(1), mhdp->regs +
> SOURCE_PIF_PKT_ALLOC_WR_EN);
> > +}
> > +
> > +static int cdns_hdmi_get_edid_block(void *data, u8 *edid,
> > +                                 u32 block, size_t length)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D data;
> > +     u8 msg[2], reg[5], i;
> > +     int ret;
> > +
> > +     for (i =3D 0; i < 4; i++) {
> > +             msg[0] =3D block / 2;
> > +             msg[1] =3D block % 2;
> > +
> > +             ret =3D
> cdns_mhdp_mailbox_send_recv_multi(&mhdp->base,
> > +
> MB_MODULE_ID_HDMI_TX,
> > +
> HDMI_TX_EDID,
> > +
> sizeof(msg), msg,
> > +
> HDMI_TX_EDID,
> > +
> sizeof(reg), reg,
> > +                                                     length,
> edid);
> > +
> > +             if (ret)
> > +                     continue;
>=20
> Ignoring the error?

Yes. EDID read operations can be interrupted by various factors,=20
but as long as the EDID is eventually read successfully, there's no issue.

B.R
Sandor

>=20
> > +
> > +             if ((reg[3] << 8 | reg[4]) =3D=3D length)
> > +                     break;
> > +     }
> > +
> > +     if (ret)
> > +             dev_err(mhdp->dev, "get block[%d] edid failed: %d\n",
> block, ret);
> > +     return ret;
> > +}
> > +
> > +static int cdns_hdmi_set_hdmi_mode_type(struct cdns_mhdp8501_device
> *mhdp)
> > +{
> > +     struct drm_connector_state *conn_state =3D mhdp->curr_conn->state=
;
> > +     u32 protocol =3D mhdp->hdmi.hdmi_type;
> > +     u32 val;
> > +
> > +     if (protocol =3D=3D MODE_HDMI_2_0 &&
> > +         conn_state->hdmi.tmds_char_rate >=3D 340000000) {
> > +             cdns_mhdp_reg_write(&mhdp->base,
> HDTX_CLOCK_REG_0, 0);
> > +             cdns_mhdp_reg_write(&mhdp->base,
> HDTX_CLOCK_REG_1, 0xFFFFF);
> > +     }
> > +
> > +     cdns_mhdp_reg_read(&mhdp->base, HDTX_CONTROLLER, &val);
> > +
> > +     /* set HDMI mode and preemble mode data enable */
> > +     val |=3D F_HDMI_MODE(protocol) | F_HDMI2_PREAMBLE_EN(1) |
> > +            F_HDMI2_CTRL_IL_MODE(1);
> > +     return cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER,
> val);
> > +}
> > +
> > +static int cdns_hdmi_ctrl_init(struct cdns_mhdp8501_device *mhdp)
> > +{
> > +     u32 val;
> > +     int ret;
> > +
> > +     /* Set PHY to HDMI data */
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, PHY_DATA_SEL,
> F_SOURCE_PHY_MHDP_SEL(1));
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, HDTX_HPD,
> > +                               F_HPD_VALID_WIDTH(4) |
> F_HPD_GLITCH_WIDTH(0));
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /* open CARS */
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, SOURCE_PHY_CAR,
> 0xF);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, SOURCE_HDTX_CAR,
> 0xFF);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, SOURCE_PKT_CAR, 0xF);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, SOURCE_AIF_CAR, 0xF);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, SOURCE_CIPHER_CAR,
> 0xF);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, SOURCE_CRYPTO_CAR,
> 0xF);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, SOURCE_CEC_CAR, 3);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, HDTX_CLOCK_REG_0,
> 0x7c1f);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, HDTX_CLOCK_REG_1,
> 0x7c1f);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /* init HDMI Controller */
> > +     val =3D F_BCH_EN(1) | F_PIC_3D(0xF) | F_CLEAR_AVMUTE(1);
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER,
> val);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return cdns_hdmi_set_hdmi_mode_type(mhdp);
> > +}
> > +
> > +static int cdns_hdmi_mode_config(struct cdns_mhdp8501_device *mhdp,
> > +                              struct drm_display_mode *mode,
> > +                              struct drm_connector_hdmi_state
> *hdmi)
> > +{
> > +     u32 vsync_lines =3D mode->vsync_end - mode->vsync_start;
> > +     u32 eof_lines =3D mode->vsync_start - mode->vdisplay;
> > +     u32 sof_lines =3D mode->vtotal - mode->vsync_end;
> > +     u32 hblank =3D mode->htotal - mode->hdisplay;
> > +     u32 hactive =3D mode->hdisplay;
> > +     u32 vblank =3D mode->vtotal - mode->vdisplay;
> > +     u32 vactive =3D mode->vdisplay;
> > +     u32 hfront =3D mode->hsync_start - mode->hdisplay;
> > +     u32 hback =3D mode->htotal - mode->hsync_end;
> > +     u32 vfront =3D eof_lines;
> > +     u32 hsync =3D hblank - hfront - hback;
> > +     u32 vsync =3D vsync_lines;
> > +     u32 vback =3D sof_lines;
> > +     u32 v_h_polarity =3D ((mode->flags & DRM_MODE_FLAG_NHSYNC) ?
> 0 : 1) +
> > +                        ((mode->flags &
> DRM_MODE_FLAG_NVSYNC) ? 0 : 2);
> > +     int ret;
> > +     u32 val;
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, SCHEDULER_H_SIZE,
> (hactive << 16) + hblank);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, SCHEDULER_V_SIZE,
> (vactive << 16) + vblank);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base,
> HDTX_SIGNAL_FRONT_WIDTH, (vfront << 16) + hfront);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base,
> HDTX_SIGNAL_SYNC_WIDTH, (vsync << 16) + hsync);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base,
> HDTX_SIGNAL_BACK_WIDTH, (vback << 16) + hback);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base,
> HSYNC2VSYNC_POL_CTRL, v_h_polarity);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /* Reset Data Enable */
> > +     cdns_mhdp_reg_read(&mhdp->base, HDTX_CONTROLLER, &val);
> > +     val &=3D ~F_DATA_EN(1);
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER,
> val);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /* Set bpc */
> > +     val &=3D ~F_VIF_DATA_WIDTH(3);
> > +     switch (hdmi->output_bpc) {
> > +     case 10:
> > +             val |=3D F_VIF_DATA_WIDTH(1);
> > +             break;
> > +     case 12:
> > +             val |=3D F_VIF_DATA_WIDTH(2);
> > +             break;
> > +     case 16:
> > +             val |=3D F_VIF_DATA_WIDTH(3);
> > +             break;
> > +     case 8:
> > +     default:
> > +             val |=3D F_VIF_DATA_WIDTH(0);
> > +             break;
> > +     }
> > +
> > +     /* select color encoding */
> > +     val &=3D ~F_HDMI_ENCODING(3);
> > +     switch (hdmi->output_format) {
> > +     case HDMI_COLORSPACE_YUV444:
> > +             val |=3D F_HDMI_ENCODING(2);
> > +             break;
> > +     case HDMI_COLORSPACE_YUV422:
> > +             val |=3D F_HDMI_ENCODING(1);
> > +             break;
> > +     case HDMI_COLORSPACE_YUV420:
> > +             val |=3D F_HDMI_ENCODING(3);
> > +             break;
> > +     case HDMI_COLORSPACE_RGB:
> > +     default:
> > +             val |=3D F_HDMI_ENCODING(0);
> > +             break;
> > +     }
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER,
> val);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /* set data enable */
> > +     val |=3D F_DATA_EN(1);
> > +     return cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER,
> val);
> > +}
> > +
> > +static int cdns_hdmi_disable_gcp(struct cdns_mhdp8501_device *mhdp)
> > +{
> > +     u32 val;
> > +
> > +     cdns_mhdp_reg_read(&mhdp->base, HDTX_CONTROLLER, &val);
> > +     val &=3D ~F_GCP_EN(1);
> > +
> > +     return cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER,
> val);
> > +}
> > +
> > +static int cdns_hdmi_enable_gcp(struct cdns_mhdp8501_device *mhdp)
> > +{
> > +     u32 val;
> > +
> > +     cdns_mhdp_reg_read(&mhdp->base, HDTX_CONTROLLER, &val);
> > +     val |=3D F_GCP_EN(1);
> > +
> > +     return cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER,
> val);
> > +}
> > +
> > +#define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
> > +static void cdns_hdmi_sink_config(struct cdns_mhdp8501_device *mhdp,
> > +                               unsigned long long tmds_char_rate)
> > +{
> > +     struct drm_connector *connector =3D mhdp->curr_conn;
> > +     struct drm_display_info *display =3D &connector->display_info;
> > +     struct drm_scdc *scdc =3D &display->hdmi.scdc;
> > +     bool hdmi_scrambling =3D false;
> > +     bool hdmi_high_tmds_clock_ratio =3D false;
> > +
> > +     /* check sink type (HDMI or DVI) */
> > +     if (!display->is_hdmi) {
> > +             mhdp->hdmi.hdmi_type =3D MODE_DVI;
> > +             return;
> > +     }
> > +
> > +     /* Default work in HDMI1.4 */
> > +     mhdp->hdmi.hdmi_type =3D MODE_HDMI_1_4;
> > +
> > +     /* check sink support SCDC or not */
> > +     if (!scdc->supported) {
> > +             dev_dbg(mhdp->dev, "Sink Not Support SCDC\n");
> > +             return;
> > +     }
> > +
> > +     if (tmds_char_rate > HDMI_14_MAX_TMDS_CLK) {
> > +             hdmi_scrambling =3D true;
> > +             hdmi_high_tmds_clock_ratio =3D true;
> > +             mhdp->hdmi.hdmi_type =3D MODE_HDMI_2_0;
> > +     } else if (scdc->scrambling.low_rates) {
> > +             hdmi_scrambling =3D true;
> > +             mhdp->hdmi.hdmi_type =3D MODE_HDMI_2_0;
> > +     }
> > +
> > +     /* Set TMDS bit clock ratio to 1/40 or 1/10, and enable/disable
> scrambling */
> > +     drm_scdc_set_high_tmds_clock_ratio(connector,
> hdmi_high_tmds_clock_ratio);
> > +     drm_scdc_set_scrambling(connector, hdmi_scrambling);
> > +}
> > +
> > +static int cdns_hdmi_bridge_attach(struct drm_bridge *bridge,
> > +                                enum drm_bridge_attach_flags
> flags)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +
> > +     if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > +             dev_err(mhdp->dev, "do not support creating a
> drm_connector\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int reset_pipe(struct drm_crtc *crtc)
> > +{
> > +     struct drm_atomic_state *state;
> > +     struct drm_crtc_state *crtc_state;
> > +     struct drm_modeset_acquire_ctx ctx;
> > +     int ret;
> > +
> > +     state =3D drm_atomic_state_alloc(crtc->dev);
> > +     if (!state)
> > +             return -ENOMEM;
> > +
> > +     drm_modeset_acquire_init(&ctx, 0);
> > +
> > +     state->acquire_ctx =3D &ctx;
> > +
> > +     crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> > +     if (IS_ERR(crtc_state)) {
> > +             ret =3D PTR_ERR(crtc_state);
> > +             goto out;
> > +     }
> > +
> > +     crtc_state->connectors_changed =3D true;
> > +
> > +     ret =3D drm_atomic_commit(state);
> > +out:
> > +     drm_atomic_state_put(state);
> > +     drm_modeset_drop_locks(&ctx);
> > +     drm_modeset_acquire_fini(&ctx);
> > +
> > +     return ret;
> > +}
> > +
> > +void cdns_hdmi_handle_hotplug(struct cdns_mhdp8501_device *mhdp)
> > +{
> > +     struct drm_connector *connector =3D mhdp->curr_conn;
> > +     const struct drm_edid *drm_edid;
> > +     struct drm_connector_state *conn_state;
> > +     struct drm_crtc_state *crtc_state;
> > +     struct drm_crtc *crtc;
> > +
> > +     if (!connector)
> > +             return;
> > +
> > +     /*
> > +      * EDID data needs updating after each cable plugin
> > +      * due to potential display monitor changes
> > +      */
> > +     drm_edid =3D drm_edid_read_custom(connector,
> cdns_hdmi_get_edid_block, mhdp);
> > +     drm_edid_connector_update(connector, drm_edid);
> > +
> > +     if (!drm_edid)
> > +             return;
> > +
> > +     drm_edid_free(drm_edid);
> > +
> > +     conn_state =3D connector->state;
> > +     crtc =3D conn_state->crtc;
> > +     if (!crtc)
> > +             return;
> > +
> > +     crtc_state =3D crtc->state;
> > +     if (!crtc_state->active)
> > +             return;
> > +
> > +     /*
> > +      * HDMI 2.0 says that one should not send scrambled data
> > +      * prior to configuring the sink scrambling, and that
> > +      * TMDS clock/data transmission should be suspended when
> > +      * changing the TMDS clock rate in the sink. So let's
> > +      * just do a full modeset here, even though some sinks
> > +      * would be perfectly happy if were to just reconfigure
> > +      * the SCDC settings on the fly.
> > +      */
> > +     reset_pipe(crtc);
> > +}
> > +
> > +static int cdns_hdmi_i2c_write(struct cdns_mhdp8501_device *mhdp,
> > +                            struct i2c_msg *msgs)
> > +{
> > +     u8 msg[5], reg[5];
> > +     int ret;
> > +
> > +     msg[0] =3D msgs->addr;
> > +     msg[1] =3D msgs->buf[0];
> > +     msg[2] =3D 0;
> > +     msg[3] =3D 1;
> > +     msg[4] =3D msgs->buf[1];
> > +
> > +     ret =3D cdns_mhdp_mailbox_send_recv(&mhdp->base,
> > +
> MB_MODULE_ID_HDMI_TX, HDMI_TX_WRITE,
> > +                                       sizeof(msg), msg,
> sizeof(reg), reg);
> > +     if (ret) {
> > +             dev_err(mhdp->dev, "I2C write failed: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     if (reg[0] !=3D 0)
> > +             return -EINVAL;
> > +
> > +     return 0;
> > +}
> > +
> > +static int cdns_hdmi_i2c_read(struct cdns_mhdp8501_device *mhdp,
> > +                           struct i2c_msg *msgs, int num)
> > +{
> > +     u8 msg[4], reg[5];
> > +     u8 addr, offset, *buf, len;
> > +     int ret, i;
> > +
> > +     for (i =3D 0; i < num; i++) {
> > +             if (msgs[i].flags & I2C_M_RD) {
> > +                     addr =3D msgs[i].addr;
> > +                     buf =3D msgs[i].buf;
> > +                     len =3D msgs[i].len;
> > +             } else {
> > +                     offset =3D msgs[i].buf[0];
> > +             }
> > +     }
> > +
> > +     msg[0] =3D addr;
> > +     msg[1] =3D offset;
> > +     put_unaligned_be16(len, msg + 2);
> > +
> > +     ret =3D cdns_mhdp_mailbox_send_recv_multi(&mhdp->base,
> > +
> MB_MODULE_ID_HDMI_TX, HDMI_TX_READ,
> > +                                             sizeof(msg), msg,
> > +                                             HDMI_TX_READ,
> > +                                             sizeof(reg), reg,
> > +                                             len, buf);
> > +     if (ret) {
> > +             dev_err(mhdp->dev, "I2c Read failed: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +#define  SCDC_I2C_SLAVE_ADDRESS      0x54
> > +static int cdns_hdmi_i2c_xfer(struct i2c_adapter *adap,
> > +                           struct i2c_msg *msgs, int num)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D i2c_get_adapdata(adap);
> > +     struct cdns_hdmi_i2c *i2c =3D mhdp->hdmi.i2c;
> > +     int i, ret =3D 0;
> > +
> > +     /*
> > +      * MHDP FW provides mailbox APIs for SCDC registers access, but
> lacks direct I2C APIs.
> > +      * While individual I2C registers can be read/written using HDMI
> general register APIs,
> > +      * block reads (e.g., EDID) are not supported, making it a limite=
d I2C
> interface.
> > +      */
> > +     for (i =3D 0; i < num; i++) {
> > +             if (msgs[i].addr !=3D SCDC_I2C_SLAVE_ADDRESS) {
> > +                     dev_err(mhdp->dev, "ADDR=3D%0x is not
> supported\n", msgs[i].addr);
> > +                     return -EINVAL;
> > +             }
> > +     }
> > +
> > +     mutex_lock(&i2c->lock);
> > +
> > +     if (num =3D=3D 1)
> > +             ret =3D cdns_hdmi_i2c_write(mhdp, msgs);
> > +     else
> > +             ret =3D cdns_hdmi_i2c_read(mhdp, msgs, num);
> > +
> > +     if (!ret)
> > +             ret =3D num;
> > +
> > +     mutex_unlock(&i2c->lock);
> > +
> > +     return ret;
> > +}
> > +
> > +static u32 cdns_hdmi_i2c_func(struct i2c_adapter *adapter)
> > +{
> > +     return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> > +}
> > +
> > +static const struct i2c_algorithm cdns_hdmi_algorithm =3D {
> > +     .master_xfer    =3D cdns_hdmi_i2c_xfer,
> > +     .functionality  =3D cdns_hdmi_i2c_func,
> > +};
> > +
> > +struct i2c_adapter *cdns_hdmi_i2c_adapter(struct
> cdns_mhdp8501_device *mhdp)
> > +{
> > +     struct i2c_adapter *adap;
> > +     struct cdns_hdmi_i2c *i2c;
> > +     int ret;
> > +
> > +     i2c =3D devm_kzalloc(mhdp->dev, sizeof(*i2c), GFP_KERNEL);
> > +     if (!i2c)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     mutex_init(&i2c->lock);
> > +
> > +     adap =3D &i2c->adap;
> > +     adap->owner =3D THIS_MODULE;
> > +     adap->dev.parent =3D mhdp->dev;
> > +     adap->algo =3D &cdns_hdmi_algorithm;
> > +     strscpy(adap->name, "MHDP HDMI", sizeof(adap->name));
> > +     i2c_set_adapdata(adap, mhdp);
> > +
> > +     ret =3D i2c_add_adapter(adap);
> > +     if (ret) {
> > +             dev_warn(mhdp->dev, "cannot add %s I2C adapter\n",
> adap->name);
> > +             devm_kfree(mhdp->dev, i2c);
> > +             return ERR_PTR(ret);
> > +     }
> > +
> > +     mhdp->hdmi.i2c =3D i2c;
> > +
> > +     return adap;
> > +}
> > +
> > +static enum drm_mode_status
> > +cdns_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
> > +                            const struct drm_display_mode *mode,
> > +                            unsigned long long tmds_rate)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +     union phy_configure_opts phy_cfg;
> > +     int ret;
> > +
> > +     phy_cfg.hdmi.tmds_char_rate =3D tmds_rate;
> > +
> > +     ret =3D phy_validate(mhdp->phy, PHY_MODE_HDMI, 0, &phy_cfg);
> > +     if (ret < 0)
> > +             return MODE_CLOCK_RANGE;
> > +
> > +     return MODE_OK;
> > +}
> > +
> > +static const struct drm_edid
> > +*cdns_hdmi_bridge_edid_read(struct drm_bridge *bridge,
> > +                         struct drm_connector *connector)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +
> > +     return drm_edid_read_custom(connector,
> cdns_hdmi_get_edid_block, mhdp);
> > +}
> > +
> > +static void cdns_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
> > +                                         struct
> drm_bridge_state *old_state)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +
> > +     mhdp->curr_conn =3D NULL;
> > +
> > +     phy_power_off(mhdp->phy);
> > +}
> > +
> > +static void cdns_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
> > +                                        struct drm_bridge_state
> *old_state)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +     struct drm_atomic_state *state =3D old_state->base.state;
> > +     struct drm_connector *connector;
> > +     struct drm_crtc_state *crtc_state;
> > +     struct drm_connector_state *conn_state;
> > +     struct drm_connector_hdmi_state *hdmi;
> > +     union phy_configure_opts phy_cfg;
> > +     int ret;
> > +
> > +     connector =3D drm_atomic_get_new_connector_for_encoder(state,
> > +
> bridge->encoder);
> > +     if (WARN_ON(!connector))
> > +             return;
> > +
> > +     mhdp->curr_conn =3D connector;
> > +
> > +     conn_state =3D drm_atomic_get_new_connector_state(state,
> connector);
> > +     if (WARN_ON(!conn_state))
> > +             return;
> > +
> > +     crtc_state =3D drm_atomic_get_new_crtc_state(state,
> conn_state->crtc);
> > +     if (WARN_ON(!crtc_state))
> > +             return;
> > +
> > +     drm_atomic_helper_connector_hdmi_update_infoframes(connector,
> state);
> > +
> > +     /* Line swapping */
> > +     cdns_mhdp_reg_write(&mhdp->base, LANES_CONFIG, 0x00400000
> | mhdp->lane_mapping);
> > +
> > +     hdmi =3D &conn_state->hdmi;
> > +     if (WARN_ON(!hdmi))
> > +             return;
> > +
> > +     phy_cfg.hdmi.tmds_char_rate =3D hdmi->tmds_char_rate;
> > +     ret =3D phy_configure(mhdp->phy, &phy_cfg);
> > +     if (ret) {
> > +             dev_err(mhdp->dev, "%s: phy_configure() failed: %d\n",
> > +                     __func__, ret);
> > +             return;
> > +     }
> > +
> > +     phy_power_on(mhdp->phy);
> > +
> > +     cdns_hdmi_sink_config(mhdp, hdmi->tmds_char_rate);
> > +
> > +     ret =3D cdns_hdmi_ctrl_init(mhdp);
> > +     if (ret < 0) {
> > +             dev_err(mhdp->dev, "hdmi ctrl init failed =3D %d\n",  ret=
);
> > +             return;
> > +     }
> > +
> > +     /* Config GCP */
> > +     if (hdmi->output_bpc =3D=3D 8)
> > +             cdns_hdmi_disable_gcp(mhdp);
> > +     else
> > +             cdns_hdmi_enable_gcp(mhdp);
> > +
> > +     ret =3D cdns_hdmi_mode_config(mhdp, &crtc_state->adjusted_mode,
> hdmi);
> > +     if (ret < 0) {
> > +             dev_err(mhdp->dev, "CDN_API_HDMITX_SetVic_blocking
> ret =3D %d\n", ret);
> > +             return;
> > +     }
> > +}
> > +
> > +static int cdns_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
> > +                                         enum
> hdmi_infoframe_type type)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +
> > +     switch (type) {
> > +     case HDMI_INFOFRAME_TYPE_AVI:
> > +             cdns_hdmi_clear_infoframe(mhdp, 0,
> HDMI_INFOFRAME_TYPE_AVI);
> > +             break;
> > +     case HDMI_INFOFRAME_TYPE_SPD:
> > +             cdns_hdmi_clear_infoframe(mhdp, 1,
> HDMI_INFOFRAME_TYPE_SPD);
> > +             break;
> > +     case HDMI_INFOFRAME_TYPE_VENDOR:
> > +             cdns_hdmi_clear_infoframe(mhdp, 2,
> HDMI_INFOFRAME_TYPE_VENDOR);
> > +             break;
> > +     default:
> > +             dev_dbg(mhdp->dev, "Unsupported infoframe type %x\n",
> type);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int cdns_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
> > +                                         enum
> hdmi_infoframe_type type,
> > +                                         const u8 *buffer, size_t
> len)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +
> > +     switch (type) {
> > +     case HDMI_INFOFRAME_TYPE_AVI:
> > +             cdns_hdmi_config_infoframe(mhdp, 0, len, buffer,
> HDMI_INFOFRAME_TYPE_AVI);
> > +             break;
> > +     case HDMI_INFOFRAME_TYPE_SPD:
> > +             cdns_hdmi_config_infoframe(mhdp, 1, len, buffer,
> HDMI_INFOFRAME_TYPE_SPD);
> > +             break;
> > +     case HDMI_INFOFRAME_TYPE_VENDOR:
> > +             cdns_hdmi_config_infoframe(mhdp, 2, len, buffer,
> HDMI_INFOFRAME_TYPE_VENDOR);
> > +             break;
> > +     default:
> > +             dev_dbg(mhdp->dev, "Unsupported infoframe type %x\n",
> type);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int cdns_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
> > +                                      struct drm_bridge_state
> *bridge_state,
> > +                                      struct drm_crtc_state
> *crtc_state,
> > +                                      struct
> drm_connector_state *conn_state)
> > +{
> > +     return
> drm_atomic_helper_connector_hdmi_check(conn_state->connector,
> conn_state->state);
> > +}
> > +
> > +const struct drm_bridge_funcs cdns_hdmi_bridge_funcs =3D {
> > +     .attach =3D cdns_hdmi_bridge_attach,
> > +     .detect =3D cdns_mhdp8501_detect,
> > +     .edid_read =3D cdns_hdmi_bridge_edid_read,
> > +     .mode_valid =3D cdns_mhdp8501_mode_valid,
> > +     .atomic_enable =3D cdns_hdmi_bridge_atomic_enable,
> > +     .atomic_disable =3D cdns_hdmi_bridge_atomic_disable,
> > +     .atomic_check =3D cdns_hdmi_bridge_atomic_check,
> > +     .atomic_duplicate_state =3D
> drm_atomic_helper_bridge_duplicate_state,
> > +     .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> > +     .atomic_reset =3D drm_atomic_helper_bridge_reset,
> > +     .hdmi_clear_infoframe =3D cdns_hdmi_bridge_clear_infoframe,
> > +     .hdmi_write_infoframe =3D cdns_hdmi_bridge_write_infoframe,
> > +     .hdmi_tmds_char_rate_valid =3D cdns_hdmi_tmds_char_rate_valid,
> > +};
> > --
> > 2.34.1
> >
>=20
> --
> With best wishes
> Dmitry
