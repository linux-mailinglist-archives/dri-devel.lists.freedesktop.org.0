Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C4DA04E1C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 01:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E38610E073;
	Wed,  8 Jan 2025 00:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="YYnFaQdP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010049.outbound.protection.outlook.com [52.101.69.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948B510E073
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 00:31:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/ubeKxgy0YLzjLiPEJUvFuaHVSmICFHlmLQ9XWEvHcYy+QYFa7FnbaibvfNaQAjZzlix7MMNcab4yOsMtVRs8VHpl/UMprCf+Gk0LE6zO5zQLH7Wl/e4O/NQ+bCSadU/lXio1/ElR+94ZtieUsAJvqFPNnreudhB9jM088PJ55aA6l1fj0fJ8V+2TQslInc4QYo1j4FuX+2RX2/ELYIYrwK52w5AMEq+sHDgWnrR5hME0r7exfdFdCmpeH7dGlYKf7BTGOXXsxb9HUMXmz4C1JABbmtZHX67aK2RAoU67VVu6JNnZZ3fsgIJFVp3ixWS1GVqIK12qEkJqMQ+u+2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsnintgaR6WiNAh0HRBofwBa4q1T8GedMrj2Zj+Kdf4=;
 b=AqISVrLw/aAACij6UgJmz6Cl4q3zMhNfkAFovroqllaTC48LDKDImDPMODBX2Dv/3ZY7GIlMOlKNmUImIsruYIDr96KzIc/rqTfj3/ZfaIFaOJrQMMUKyHywYV/3enkamc+8dh8AC+COfG8sXEN2TQBL6EaxANbOqZPOTSboKc+hukplRogxypFpP7ZDEJ+mtRO88fEJFgkRsNzBjXrfAe8IOt/lD+dbIBUMBv9dclND4qPVNbU9pxz4xxP2O9O9QVr2cP6f6UJ8IYe4b7RtZ/nXtMLLb9VGZBEjwgQ7Qg0xv7I/+REG7JqEEwMOhk25uOy6OOzUWTDJRMYjBoRWWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsnintgaR6WiNAh0HRBofwBa4q1T8GedMrj2Zj+Kdf4=;
 b=YYnFaQdPjvFaf9QAWAJUT2O1hK59hcJA052zYTGWnLCJEylxOwAzojc5yZ4D48UHP/6dygioIH9fcc12cdgVn5lWhjXSd5LLzHFRDGC95W178x6max7WNQFBXTVi7t9TgiQoaz/eBZLoJbkCFdsYuTGr9T5zqEfEYN8OGT7l5mu8tEb7fqrK3z3t6wRDW8d4kHKMxnKlyKdcw+2xfHGYLuKp3Jckih7tURXkOcaRGLUaXCCaJJ8nKe+QCAPirYSrmeiaoGTV688WmHglcDRBKi83X4YOfzxcipQmxUeQZTEfwIlajtSgO56317aVJDNcl+uRXMDiyqM9JFO956Xphg==
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI1PR04MB6894.eurprd04.prod.outlook.com (2603:10a6:803:13a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 00:31:12 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%3]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 00:31:12 +0000
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
 <li nux-phy@lists.infradead.org>, "mripard@kernel.org" <mripard@kernel.org>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx
 <linux-imx@nxp.com>, Oliver Brown <oliver.brown@nxp.com>, "sam@ravnborg.org"
 <sam@ravnborg.org>
Subject: Re: [PATCH v20 0/8] Initial support Cadence MHDP8501(HDMI/DP) for
 i.MX8MQ
Thread-Topic: [PATCH v20 0/8] Initial support Cadence MHDP8501(HDMI/DP) for
 i.MX8MQ
Thread-Index: AQHbYWSeA4yZVbp8oEC6RRPmYiH2aQ==
Date: Wed, 8 Jan 2025 00:31:11 +0000
Message-ID: <PAXPR04MB9448B9928C1F7A64F32807F8F4122@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
 <2381464.ElGaqSPkdT@steina-w>
 <PAXPR04MB94483B3704FB62E12A009390F4112@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <7783214.EvYhyI6sBW@steina-w>
In-Reply-To: <7783214.EvYhyI6sBW@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|VI1PR04MB6894:EE_
x-ms-office365-filtering-correlation-id: 17c28002-af82-4932-9c39-08dd2f7bc0e6
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?twNf3lI3+AOsg1Xjw0f2fXL1nPM6TWcY70pDMC3H+sWwE8DzJCOzqTQ8WG?=
 =?iso-8859-1?Q?vbBOQlWXYg0Vwe49J5sbab6pkDG5HvRiAn2aMKAQJkDOITqPsGi8Laz6rq?=
 =?iso-8859-1?Q?ZypYEtGEjE8UfQ94Al6HXXJ3tWJ4aevINd8G8tGKs2vyY3l2qSvXeYZ9bk?=
 =?iso-8859-1?Q?PAR9O66sTNtuKn/30K/fykarfYibEbebCcG18i3eQGP2CgEQ1noo3Agvrt?=
 =?iso-8859-1?Q?jZBn6E0cGH+99xnZ1vSpD2ycd1z8Xeri+wskhY60CZgtuD63+LX+z+QmFO?=
 =?iso-8859-1?Q?63pGFYXOu8MD/gsNnzfHADO3BK82gC5TZ2C7G2SmQ/kyuqHIWWM/GapsZX?=
 =?iso-8859-1?Q?pVygVJYORFftKJzjGW0nN1ctbpkJDQ4TDfuMmVqTbPhgCcpB+99p6nzkt2?=
 =?iso-8859-1?Q?9aUqk/AhbgXf/qqt0GPObJ39HfcsblCQrvRUaommW9tsJHaoghTbmeoTzN?=
 =?iso-8859-1?Q?W8VPuJFC4aDKsXcEmp5Ivw/6L7l5KPVXXmNtmbodlQM53fJJpDBQE+lbNS?=
 =?iso-8859-1?Q?zdxMAcYPL31jV14V70XUWhcx0aeUq/Z/HFC4SO2lDGGe8NNdyNZZ7Gri62?=
 =?iso-8859-1?Q?WMM0u5Gkiv9PxXEIA9IT+aiCMAax/zZwS3a5zgMUFxPHfQOPwgAWBsGyup?=
 =?iso-8859-1?Q?mOS1dTyfY5wgobTE1zBy43UZq01FyGdafJ6SzD/+ntc3wryOAXDmy+F79h?=
 =?iso-8859-1?Q?sVh3aSS0ssvFSp90iaTJk1XUsPliwqNwdNrojvgBlAEF9Yc2K0tIZ56+5n?=
 =?iso-8859-1?Q?e7zDj+Z09UV6J+9e5WSpe7zegb5kBxlPhQmO2LrDX8wh2kki9HLbgTvpJp?=
 =?iso-8859-1?Q?BnnasvR7EKVed2r3aI0Ia80qygYHOJUmj+gUdzgT4bPicvC7xqvEnotjq9?=
 =?iso-8859-1?Q?VtcDM+3nVd2NwuDLLQZuFmvz48T0cKPgnL0ceNMije/qnfSjptWUTPx/SQ?=
 =?iso-8859-1?Q?r2m/wMlSg/kTR6a3niHO+rkf9X4+Zf9OACP9Nx011Csuy/IVv1+e2xzttv?=
 =?iso-8859-1?Q?lKbQgMFCeX5LSf86yBzCI8ermWkH1gFUsP9VEG+4RY4UWmHpuUuEZn4Fpz?=
 =?iso-8859-1?Q?qHQuEplh6pvy2AyPR7e8gFmy41TM87Uk8OwpoA2apeQOpHAB6oh1YEOGY0?=
 =?iso-8859-1?Q?6t61F0g63uXyZ0QWM9RxwQOKm93M5S15zNmwcnFR/Er8TV1npSL2F+ZkXY?=
 =?iso-8859-1?Q?GZVKkkCpWRTK2JmWOIUoMuDNJkXZTjHmidBla5t54zQMZxU6A86PpJvkMG?=
 =?iso-8859-1?Q?Xqt6fJv0fNkZdtiyw2UtLbJolrkcGB309UAaUO0V4Aa5NoOVbEeM65G9Hi?=
 =?iso-8859-1?Q?5gT8GeE1ptNuH+dUxWNEQ9Ns/rKquwHSHTD8B7UOg5f4WAhYCTgTPHi3kJ?=
 =?iso-8859-1?Q?HJ8tD+hTABV7tQs94TtSm+MCr85X9dGxmgXVfdZMQmsHIHqgNxPm3FtLNe?=
 =?iso-8859-1?Q?vc7VIXlE1DoDH8oD0010pkfL6OSUDOtEf+LkWA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tzrF8QrZz3YKwvHhyVgpVqvy865Clj0uhaJRSQHsIdPIDMDgUjI/jZfFnS?=
 =?iso-8859-1?Q?NJ4Jc1o2uFKwv6Ovicy9lpXhBmOTWpy8qjXzFYyaxmlmIc1vogLehstBPi?=
 =?iso-8859-1?Q?n/F8Y5reBU+XakkpvIHqsUkQho0UP/28L03N+xX1QXiJ8GiUTvz/gsyA4t?=
 =?iso-8859-1?Q?/uybhGYwnK3JkWtlhc/e4p4NyPHVaxYBXYwQO+1fiWEeN+8n7szM0jx5Fs?=
 =?iso-8859-1?Q?5MmWynb7gdjAVh0lmgkSXtVCrm4JKTmaKSkTYzudxLvurjGwco/SW1ymRg?=
 =?iso-8859-1?Q?5kwAQdmzIcWeBdL0bmSqMtBuTpXGFVmOXnQNjX2FyQ/yNRyNZABdRGx3pu?=
 =?iso-8859-1?Q?jU0yL3DY6mrP4IFVUjy9tC4FR6w1G5Y6Tj+dQRJqrwd0vyNd68iKjvLwbV?=
 =?iso-8859-1?Q?ZlqIavoW4JohB6v8W9i+JAng9NjBvxAlZ9djZhlfQ5PxpLw4iyWRfF2zvV?=
 =?iso-8859-1?Q?GXHxAtbGlfqRPkE8uPeSawZGNaCLDkjl9yUcCZRcwpLTzfMDJuZVyhPzsN?=
 =?iso-8859-1?Q?QTOJ49krfTksVCwrOFA5+mnX5j0LdNJ0j55bd4AFSHpl5OAMwPGVuDhu2r?=
 =?iso-8859-1?Q?+BwVI81RU+J14e8qTVEi8G+Lxu+ztW64dKHpq2DpMOSnSflfIX6WANSX4f?=
 =?iso-8859-1?Q?yRnp3I+FozXRWt/ZCF77xLB/vR14LsRKwPci5uo5TG1ykdEm2OKgqdXX+V?=
 =?iso-8859-1?Q?a9Vf6QMFVfbK3tPOhX6ntls7U75nExdhbLGBVp0NjZ0nAQzsLYI3L0WeBh?=
 =?iso-8859-1?Q?kM5MOJ+2a9rRbyVji1M8F92a1+ZT5IHBIhleQsKLc8u3YPwZ9RTEfNpXik?=
 =?iso-8859-1?Q?IaZXnzZQWAX/+10OHNGKbAsUdXt/EbdgFuqRNpvZIT4DTau1G8lNUbtmYb?=
 =?iso-8859-1?Q?a5ExMiVL5l6trjT6FQvCH79KecdEb8PyDPqa95gwThyKanSB+rUGB2vD8P?=
 =?iso-8859-1?Q?IBCGZlguHTSb4hop4SZARKTvwowTqJncLHzCI0EcjgZg1eFfIJTNbeJMeN?=
 =?iso-8859-1?Q?X5Rb/PghUXrcBGSVuaFU5xnPMHoMLmdcGg2/XbXMqhFW4DOpVrQcnhFze2?=
 =?iso-8859-1?Q?0ZUT5YGmdXkDHviqcE/E/p14wSqBkkPuVINBPrwlJBQFIvrSwH8e/0gtXA?=
 =?iso-8859-1?Q?zMSX6QNtwC0BuKAXWc2KVt0FISA0Y/yAX/AB0ccxrbl9xdjgw3NPz69Tdz?=
 =?iso-8859-1?Q?ZP322hvRrQx/CkkeDixkp8ZmC/l3GXPJFijAYAbAq9ST1M2uD+eRFhILy/?=
 =?iso-8859-1?Q?z9T+ZJHCmCgsm7jRFvYVdFl8ezjZCIb0hmlCoGyL/Ym9/OPenfZr6q/Rdb?=
 =?iso-8859-1?Q?0j0u4VrW3kbSoDONMALiWh2XURiuGleIwa0dTdkA11bqOTpC/azmGxT9Eg?=
 =?iso-8859-1?Q?UKPSwhx1EQVAJR/BFbKh2NsFlP7lnqPKf7vBo0+nEB48HXmOlva7bFY64d?=
 =?iso-8859-1?Q?hNjRKL66+pooGB/80bxeHs44AGJ3hUboTaWT03NX9VBJgfTy3r29v2Buea?=
 =?iso-8859-1?Q?GgYZbqPs0Oky2HKEOkJHCpFJf+G4g8J1tyfjv6RNPHDVPHqQtZPKTvlv3O?=
 =?iso-8859-1?Q?ZIo/HMVgnyGZv+NNeM8S6f0VJEfXEjLlJjwy1KJKt91PlS08qS6oRkgDQd?=
 =?iso-8859-1?Q?kvCg/F7Lmu8oc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c28002-af82-4932-9c39-08dd2f7bc0e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 00:31:11.9875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jo2ocrYh+k/BDkFl9XPZxDM9CGTj+pJv7l7Em6B0yvHafgVMh2P1L7rIGE0Hj0dMD8q7Gz+0LLEwUkxDWt4keA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6894
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

>
>
> Hi,
>
> Am Dienstag, 7. Januar 2025, 15:42:56 CET schrieb Sandor Yu:
> > Hi Alexander
> >
> > It may cause by the first preferred mode in EDID is not supported by dr=
iver.
> > Please use modetest or other user application to change the video mode =
to
> CTA standard modes.
> > Such as148.5MHz 1080p60 or 594MHz 3840x2160p60.
>
> No, the EDID does not affect the issue. I resurrected series v14 and HDMI
> does work without any issues at 1920x1080.
> If I can find a time slot maybe I can check which series version regresse=
s.
>

Could you please list the all video modes by modetest when device bootup?

Sandor

> Best regards,
> Alexander
>
> >
> > >
> > > Hi Sandor,
> > >
> > > thanks for the updates.
> > >
> > > Am Dienstag, 17. Dezember 2024, 07:51:42 CET schrieb Sandor Yu:
> > > > The patch set initial support Cadence MHDP8501(HDMI/DP) DRM bridge
> > > > driver and Cadence HDP-TX PHY(HDMI/DP) driver for Freescale
> i.MX8MQ.
> > > >
> > > > The patch set compose of DRM bridge drivers and PHY driver.
> > > >
> > > > Both of them need by patch #1 and #3 to pass build.
> > > >
> > > > DRM bridges driver patches:
> > > >   #1: soc: cadence: Create helper functions for Cadence MHDP
> > > >   #2: drm: bridge: cadence: Update mhdp8546 mailbox access
> functions
> > > >   #3: phy: Add HDMI configuration options
> > > >   #4: dt-bindings: display: bridge: Add Cadence MHDP8501
> > > >   #5: drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
> > > >
> > > > PHY driver patches:
> > > >   #1: soc: cadence: Create helper functions for Cadence MHDP
> > > >   #3: phy: Add HDMI configuration options
> > > >   #6: dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
> > > >   #7: phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for
> > > > i.MX8MQ
> > > >
> > > > i.MX8M/TQMa8Mx DT patches:
> > > >   #8: Add DT nodes for DCSS/HDMI pipeline
> > > >   #9: Enable HDMI for TQMa8Mx/MBa8Mx
> > > >
> > >
> > > I gave this version a new try but unfortunately the display stays bla=
ck.
> > > Although the display pipeline is intialized and even wayland starts.
> > > Do you have any idea where to start looking?
> > >
> > > Best regards,
> > > Alexander
> > > --
> > > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germ=
any
> > > Amtsgericht M=FCnchen, HRB 105018
> > > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schnei=
der
> > >
> http://www/
> > > .tq%2F&data=3D05%7C02%7Csandor.yu%40nxp.com%7C23ba3321d4d5480
> 4b98f08dd
> > >
> 2f35f3db%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63871863
> 095591
> > >
> 6087%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIw
> LjAuMDA
> > >
> wMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%
> 7C&s
> > >
> data=3D4Ip3wEX207cu0EreOtf11F%2BS%2ByNzAcI2C2iPjjlQzVg%3D&reserved=3D
> 0
> > >
> -group.com%2F&data=3D05%7C02%7CSandor.yu%40nxp.com%7C734ea27ba98
> > >
> 140b7483e08dd2eed1276%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%
> > >
> 7C0%7C638718317967624410%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU
> > >
> 1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIs
> > >
> IldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D1HdQdbye9p5AHoT7JCF3Md%
> > > 2FB9k9tyN%2FW25YKCEngvWM%3D&reserved=3D0
> > >
> >
> >
> >
>
>
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.tq/
> -group.com%2F&data=3D05%7C02%7Csandor.yu%40nxp.com%7C23ba3321d4d
> 54804b98f08dd2f35f3db%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C
> 0%7C638718630955952151%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1h
> cGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIld
> UIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dn3QmrbJru4JcdZvEM%2FxJp4rVf
> Vmifjoxpq0o9Wxzh2Y%3D&reserved=3D0
>

