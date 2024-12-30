Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A71209FE396
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 09:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2ED510E372;
	Mon, 30 Dec 2024 08:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ArYYXh5B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2064.outbound.protection.outlook.com [40.107.249.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AE610E372
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 08:05:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFPELK6PY8ICdjHkvQFAoHlTU3Sp8ZIDpRTE6fgPJtc/MNK5ucIeOy40vE6H7ZraKNuA++cLg4SpPCqUJakV0RvumRFbyuXVK6j7FGbnMdiydxT5twuOZ5Dgl3pW9Cp+OhGm7hFuskBZrPYXjJbq9jb2TGObqsvXshlsIPNcGoJsq/DyNlXw5w+DXFOj57U+Hcy0jfMfTTilFDifRko6771t60JLiwKbnrICAJuoRIN9sfwvxwZhkEug4MdIeeWsHbFT+CYEBdJGpgDozNKOzpYOtphErAwUnZ1mDE3MXFfvcTpHA5pIZMshwKWA9gA5G+is7kReKqzxv+Dlg2HdQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJZxbdZ/SMooX1jC0r8GnvsujD2sI/IgHLOb1r0ljJs=;
 b=wZ6rO3RIW9lVs/qEZBOK6+DGGUcJmpjWM8DVDVib8ArcHzcuyx7b+QciRywm/Ccl9kHs89f685KLxE7NKKOO0PPz0yGlnCMAXnBnZAhF5sNVi97V/6ujZHM7GCZHawLKtBT9Oqej9h+leueT6ZXa71i8QtO8zwMmuuJEnf1oIbgB6MfkBR2jhBUTqPgaclrSMcSNVZxqOsy9zqfCnQ6oAMPRYHTpZyICg0J7efGopYky6QKd/Vgm/c1lvahL7W0r3hbwBwwZMSO22naC4+qFxjCQpsMgmIChGvAlYBPIJv4nB+FKm3GVz3Mf0yyaG+Grt2afIPkrKF+q4brD5oJhWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJZxbdZ/SMooX1jC0r8GnvsujD2sI/IgHLOb1r0ljJs=;
 b=ArYYXh5BbLm4afU2gHIP0lYh8U48sU7Vhg47D6UPuJ2AF9C6N0eOzByHOynJhk520nnGsCcRXhcXELIXvu1DK00uNkT4cFFs3lFwTMypHTTb5N2JE/o2YilHtBTPu/7jm9IaSbTWZXtS9PLzXzzY+TN/JP5EESfj2lfy3MCF3rNVI5ZPalquzrue7xo5nu/5ZJsLX88gwL+tkMdZBrTK4auGQE7i1OE+LSnTZGsmi7psQP53a51uKj4n85gbsqi8qiLe6SNGVoyUsVc/MqFdEaaXT667BoKguXt2rh5OUBQn0Fi3h8FtzXucd6gJ9f0dvdPKjBPI2MCWix3Y9hewVw==
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DB9PR04MB8411.eurprd04.prod.outlook.com (2603:10a6:10:24c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 08:05:33 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%3]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 08:05:33 +0000
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
Subject: Re: [PATCH v20 5/9] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
Thread-Topic: [PATCH v20 5/9] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
Thread-Index: AQHbWpGZlrQ9OpnrWEqcIo8nu4amxQ==
Date: Mon, 30 Dec 2024 08:05:33 +0000
Message-ID: <PAXPR04MB9448D9906E03A8216081D315F4092@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
 <fbd12029fab1f60e2ba4fad75ef650298a59cb15.1734340233.git.Sandor.yu@nxp.com>
 <3ivd4mdmcb56mrgg2yo3rszksiusfkyxr3eycuw5kspczqcqse@4nub63fnrsur>
 <DB9PR04MB94528AAF7B7B60C48710CDFEF40C2@DB9PR04MB9452.eurprd04.prod.outlook.com>
 <zrigjfyxzbc57ab3xm2m5gcjandsotcbmlgoc4ma7olz2iobqd@7cmsyinjw4xc>
In-Reply-To: <zrigjfyxzbc57ab3xm2m5gcjandsotcbmlgoc4ma7olz2iobqd@7cmsyinjw4xc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|DB9PR04MB8411:EE_
x-ms-office365-filtering-correlation-id: 2bb83f3a-ec31-4610-9db1-08dd28a8bc5a
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?oUy4/v1KEJvt6lkElQKsXhO2gNkGp1SWB9oxz7flzjXLJ3FkMyF7AHu+Zpd/?=
 =?us-ascii?Q?1jD/ietpVJIMulTH/x4IhhtaGC275Yp/7ULtErLqoGXVY6AUK5mxI81p0lkG?=
 =?us-ascii?Q?UU3HTtprgxkBKx8PTT8ZgM+OLaccnl3Bl1NMx9d99REW8qfFZbm3U31PFkmt?=
 =?us-ascii?Q?PPv74af6OIBPm3nN23iq0JMAQbr1GWsNPPy5cO1dFJ+IsKSN6CqvM2+1bSJR?=
 =?us-ascii?Q?R5TaZboaNQsvIDqZmQR1l4Y8nLeXJ073jWKJGe+zhFmEAUp49dVlkL/7OTAi?=
 =?us-ascii?Q?owBB13u61dz/oaCjL45v10EOD6DNuXp+GYBkpGdL5yd3OYLzvNupTG8z9vzL?=
 =?us-ascii?Q?Aktbg7VYrVUP0mdUaOxAz8qTkcXz15MEpjc0Mc+pdPGikz1eUIsMgdBHgPcn?=
 =?us-ascii?Q?WW3R70T+OteTrXO/kWrXDVJnNX8oGfBHZ3jc8AaDxuE3oEK6Em3eZ9JWNqtw?=
 =?us-ascii?Q?2A3lnnj4w26ed3WONMbArs+ofKlTPVCn/bHxW0MJ+0gpNszfZ+A3aEBJHjlt?=
 =?us-ascii?Q?ZIhGyvIz4tnXfiqbUByJ1ftHQYuUbenvehnOkfGqey13gaDKgU7vYbKlMUdR?=
 =?us-ascii?Q?3fZvFfo68BIYPmchC8kAAHZmxyiclpP3BBMiIqnEHd9I73MtvouDC/JsgqVH?=
 =?us-ascii?Q?VyxXCqTjM4X0woX3QZn0CF9BhP8moTAEKmuy6YtryBatlvaRv12RMj9uTxrU?=
 =?us-ascii?Q?oF62DrgZUAhi/YQeYYcbGugBGr0Few9Ariisn2g6y2gOC+lQMMrRhxVwHp0W?=
 =?us-ascii?Q?NIkECgnyfpAP9LeKoQgcfLBgoik6uP0IZufC/jaA3W6FHfmYjUrsSnrHMefI?=
 =?us-ascii?Q?G9Ibbk0w6Lacxlp+6MZJor37Hc+YaH0IN41rNFKsczw4fWE5aocWLTWkfIhJ?=
 =?us-ascii?Q?i802Wxk5TJr72UDPY1vjsDzzkm2la0AJQ5PA8pwQ9cGECxE/H2SXgwrGAkHQ?=
 =?us-ascii?Q?nIhOTFsNHUe36B6LSLeMKMJ4t32CLWLL2MMidKE1oFBRzEO7UuUFWVwnwqau?=
 =?us-ascii?Q?8qzwnRJj+Fz2WEG2GKq0a7ibtE2UrOk7v3j6vAJ1J5j6aGwPaGylfAVGmyaH?=
 =?us-ascii?Q?cMJrmz+3jiaOgWxbyD2BEs4YKSMAmqvJRJHDlkqo/GGKSKh6oRurRgPuEz+b?=
 =?us-ascii?Q?t1PNPB1VWztgzsMGWDKzCvCLxLXvynfGiyPJMMunWzhoByXbE25vU80buTTz?=
 =?us-ascii?Q?XkUHJLuT1Y/vlWCR+dbWYWEOb9M6FAnpkHJy1k3+G1qTh6Mnc+JMKpz+Bi9W?=
 =?us-ascii?Q?9Ufp0AgZNqjMfnF+L5LraB0iDVH08FZ7+3b2sFgYMyBJMOq6pnY0nS3pCBOL?=
 =?us-ascii?Q?6I6Um7iP5ZeieDu7l4JOmCKQJvTz5WiJekQCpkY9gNtsGPz27c0Ypo9HIGP+?=
 =?us-ascii?Q?gzPD1awVvw3XUJ/KP1YZk6auzHPZutiBwWZvwbYPk/eU+uGq276Yblwjvxam?=
 =?us-ascii?Q?h9CjgYvEUA/Lg8o4ihuaJLuGblqXaKqX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aMB+66bMhFpJTCNkSrph26BAtMVo0L2rA1SXcjaeJ1OEGuAiLGvp6JNBUenk?=
 =?us-ascii?Q?q0dS//bvXYy1BhEY955ivemNuSF+0EkCe1d+ljU1a0u/8gB7Nu8SiLU9T14m?=
 =?us-ascii?Q?FlosbjKMhe5Qu8tmbWU5Vay4H6lnYAIMnTwXX7Sp9KxZ+xBH9kfNl3JKkU7+?=
 =?us-ascii?Q?nPDRQJMmUmWF48WWimRVFKQwt/mqtP+2VYgPGtR8fPZcwEHd9IgD4y0tfDzw?=
 =?us-ascii?Q?/dWp3FdYavugXTT9aPe4BEB+ul7Lh+zBHShcL5UBwUnQcipcJUPypyxonHBb?=
 =?us-ascii?Q?Y1GNro2ehpyk9VeYRGvoZozuVmQou+U4pl4Ub2eCDgNJBFr9hp5l1BeTAoPx?=
 =?us-ascii?Q?sGA85vBalhg0SZyD5b20vMm0EoBdQgjHfqKm+yCtXMWplWz+JG1TwabTqNgP?=
 =?us-ascii?Q?6ANAwAf3uqZHJrQE0P67es9JsLs8TdgS9R/g4B3eUY0pt+TF3JqgwFtl2led?=
 =?us-ascii?Q?rvrRVRVUTy1xnKReNIlRT2VLQmjRvYnK0MFnMRb2qsHD0KfWC4hy2yN6iX2q?=
 =?us-ascii?Q?jxfg03TRPFYWgoqxEA6FfyQUaYFLga6BxWr+S9XRDzNHNn8WBzJ/hIgqjWzc?=
 =?us-ascii?Q?yzp5QZQCbd9BIBU0Q7/56xouWuBHJ0PjKuM/eqeSeTOAE//taPhxYh7yeFs6?=
 =?us-ascii?Q?+ZIP7KCI7P0qlPQMCepJ7OMgfwXVQntX8KWUiBGTGc1OzgWP2H+WuZWLdJIo?=
 =?us-ascii?Q?DXOTI91tpiCYWuSokpS0bXqmG2j9VRX7uzQuc+lfwT7MTbEMEwc6UqysBer6?=
 =?us-ascii?Q?n7iUnVB++BV0UhESvTqatpQA8y3ccCVulzy5k4y9QJb7zqHaQB7xyugsthEs?=
 =?us-ascii?Q?fOSOO+1otj1/KTQt04rpcghkK1qQtJYFTMiCWUKtJHcAvq+Srl0u0z9t5+qO?=
 =?us-ascii?Q?vA7WlZYqnxXImzUiK70BwAM4zBgnCEFS2OeJONb1qwglg3DPFkFPOqLlgo8p?=
 =?us-ascii?Q?h/Dxde4vZyC6GlPPSvVxXULomrVhfC/XgjeOL3sG46GY3QWu7BvPMTzwJRZl?=
 =?us-ascii?Q?5uTWPfySliGX/Hjeqe9E6TlbrSzrbw0PfhaI0WbS8X3jh09HgYWgrX2qeOHG?=
 =?us-ascii?Q?ReZ+0YjKRCz9g4nXHmNuggrQAoTc5ZsibFxHzBklS1echl4lbhMapNGpsL5u?=
 =?us-ascii?Q?OWRIqXXT/CuIeXF7IuGyQGP9+TvdFQxv/V+i5FT+OHGoyk8JtL/vbQzYFYKP?=
 =?us-ascii?Q?mRvAdMzsMAbWW7DANSdivH3LUmU6b0eqRvbbGDCi68BvnNgCyJGOSV1Gn8rE?=
 =?us-ascii?Q?noWEVVC3Jop2GL+aaDSSIeGlbGZdB3WObWQlZqvYKzsXNwDtknj0JK1MZ9aa?=
 =?us-ascii?Q?dfAFjrVQdDxxT6KR0xHHhpSWVVPo1dH48Zh9kzqDAHw+k7Wvn/c0LX+H1V97?=
 =?us-ascii?Q?zNk+zDooLtcYhpD2q/85MJSkkl2HcSZDm8CUgtGIsLfCJMrsuqVxBsiYOLtp?=
 =?us-ascii?Q?yDWvK3vCLQJaKgrX4oeEUJU48adTCgAajLCEMssOWMfDwEgXz82m7sF6uweV?=
 =?us-ascii?Q?gUJvMuNKAcRZPhQ0lKNAtACXMEbxUFh5emWLf6/xaKeMic6WevWpBTPuiNNY?=
 =?us-ascii?Q?IQ/KixAR5BrXThq8xus=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb83f3a-ec31-4610-9db1-08dd28a8bc5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2024 08:05:33.6081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NcRfp6i8aQF1ENlYmawWwRSffOvNbH48nqzWrvdof0eT0oqLww8brFzIxG3h9YcaG1uBHM5XA7bXgJBfxpTdAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8411
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

=20
> On Wed, Dec 25, 2024 at 07:57:01AM +0000, Sandor Yu wrote:
> > >
> > > On Tue, Dec 17, 2024 at 02:51:47PM +0800, Sandor Yu wrote:
> > > > Add a new DRM DisplayPort and HDMI bridge driver for Candence
> > > MHDP8501
> > > > used in i.MX8MQ SOC. MHDP8501 could support HDMI or DisplayPort
> > > > standards according embedded Firmware running in the uCPU.
> > > >
> > > > For iMX8MQ SOC, the DisplayPort/HDMI FW was loaded and activated
> > > > by SOC's ROM code. Bootload binary included respective specific
> > > > firmware is required.
> > > >
> > > > Driver will check display connector type and then load the
> > > > corresponding driver.
> > > >
> > > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > > ---
> > > > v19->v20:
> > > > - Dump mhdp FW version by debugfs
> > > > - Combine HDMI and DP cable detect functions into one function
> > > > - Combine HDMI and DP cable bridge_mode_valid() functions into one
> > > function
> > > > - Rename cdns_hdmi_reset_link() to cdns_hdmi_handle_hotplug()
> > > > - Add comments for EDID in cdns_hdmi_handle_hotplug() and
> > > cdns_dp_check_link_state()
> > > > - Add atomic_get_input_bus_fmts() and bridge_atomic_check() for DP
> > > > driver
> > > > - Remove bpc and color_fmt init in atomic_enable() function.
> > > > - More detail comments for DDC adapter only support
> > > SCDC_I2C_SLAVE_ADDRESS
> > > >   read and write in HDMI driver.
> > > >
> > > >
> > > > v18->v19:
> > > > - Get endpoint for data-lanes as it had move to endpoint of port@1
> > > > - Update clock management as devm_clk_get_enabled() introduced.
> > > > - Fix clear_infoframe() function is not work issue.
> > > > - Manage PHY power state via phy_power_on() and phy_power_off().
> > > >
> > > > v17->v18:
> > > > - MHDP8501 HDMI and DP commands that need access mailbox are
> > > rewrited
> > > >   with new API functions created in patch #1.
> > > > - replace lane-mapping with data-lanes, use the value from data-lan=
es
> > > >   to reorder HDMI and DP lane mapping.
> > > > - create I2C adapter for HDMI SCDC, remove cdns_hdmi_scdc_write()
> > > function.
> > > > - Rewrite cdns_hdmi_sink_config() function, use HDMI SCDC helper
> function
> > > >   drm_scdc_set_high_tmds_clock_ratio() and
> drm_scdc_set_scrambling()
> > > >   to config HDMI sink TMDS.
> > > > - Remove struct video_info from HDMI driver.
> > > > - Remove tmds_char_rate_valid() be called in bridge_mode_valid(),
> > > >   community had patch in reviewing to implement the function.
> > > > - Remove warning message print when get unknown HPD cable status.
> > > > - Add more detail comments for HDP plugin and plugout interrupt.
> > > > - use dev_dbg to repleace DRM_INFO when cable HPD status changed.
> > > > - Remove t-b tag as above code change.
> > > >
> > > >  drivers/gpu/drm/bridge/cadence/Kconfig        |  16 +
> > > >  drivers/gpu/drm/bridge/cadence/Makefile       |   2 +
> > > >  .../drm/bridge/cadence/cdns-mhdp8501-core.c   | 379 +++++++++
> > > >  .../drm/bridge/cadence/cdns-mhdp8501-core.h   | 380 +++++++++
> > > >  .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 694
> > > ++++++++++++++++
> > > >  .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 745
> > > ++++++++++++++++++
> > > >  6 files changed, 2216 insertions(+)  create mode 100644
> > > drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> > > >  create mode 100644
> > > drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
> > > >  create mode 100644
> > > drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
> > > >  create mode 100644
> > > drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig
> > > b/drivers/gpu/drm/bridge/cadence/Kconfig
> > > > index dbb06533ccab2..bd979f3e6df48 100644
> > > > --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> > > > +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> > > > @@ -48,3 +48,19 @@ config DRM_CDNS_MHDP8546_J721E
> > > >         initializes the J721E Display Port and sets up the
> > > >         clock and data muxes.
> > > >  endif
> > > > +
> > > > +config DRM_CDNS_MHDP8501
> > > > +     tristate "Cadence MHDP8501 DP/HDMI bridge"
> > > > +     select DRM_KMS_HELPER
> > > > +     select DRM_PANEL_BRIDGE
> > > > +     select DRM_DISPLAY_DP_HELPER
> > > > +     select DRM_DISPLAY_HELPER
> > > > +     select DRM_CDNS_AUDIO
> > > > +     select CDNS_MHDP_HELPER
> > > > +     depends on OF
> > > > +     help
> > > > +       Support Cadence MHDP8501 DisplayPort/HDMI bridge.
> > > > +       Cadence MHDP8501 support one or more protocols,
> > > > +       including DisplayPort and HDMI.
> > > > +       To use the DP and HDMI drivers, their respective
> > > > +       specific firmware is required.
> > > > diff --git a/drivers/gpu/drm/bridge/cadence/Makefile
> > > b/drivers/gpu/drm/bridge/cadence/Makefile
> > > > index c95fd5b81d137..ea327287d1c14 100644
> > > > --- a/drivers/gpu/drm/bridge/cadence/Makefile
> > > > +++ b/drivers/gpu/drm/bridge/cadence/Makefile
> > > > @@ -5,3 +5,5 @@ cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) +=3D
> > > cdns-dsi-j721e.o
> > > >  obj-$(CONFIG_DRM_CDNS_MHDP8546) +=3D cdns-mhdp8546.o
> > > > cdns-mhdp8546-y :=3D cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
> > > >  cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) +=3D
> > > cdns-mhdp8546-j721e.o
> > > > +obj-$(CONFIG_DRM_CDNS_MHDP8501) +=3D cdns-mhdp8501.o
> > > > +cdns-mhdp8501-y :=3D cdns-mhdp8501-core.o cdns-mhdp8501-dp.o
> > > cdns-mhdp8501-hdmi.o
> > > > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> > > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> > > > new file mode 100644
> > > > index 0000000000000..98116ef012fa3
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> > > > @@ -0,0 +1,379 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * Cadence Display Port Interface (DP) driver
> > > > + *
> > > > + * Copyright (C) 2023-2024 NXP Semiconductor, Inc.
> > > > + *
> > > > + */
> > > > +#include <drm/drm_of.h>
> > > > +#include <drm/drm_print.h>
> > > > +#include <linux/clk.h>
> > > > +#include <linux/irq.h>
> > > > +#include <linux/mutex.h>
> > > > +#include <linux/of_device.h>
> > > > +#include <linux/platform_device.h> #include <linux/phy/phy.h>
> > > > +
> > > > +#include "cdns-mhdp8501-core.h"
> > > > +
> > > > +static ssize_t firmware_version_show(struct device *dev,
> > > > +                                  struct device_attribute *attr,
> > > char *buf);
> > > > +static struct device_attribute firmware_version =3D
> > > __ATTR_RO(firmware_version);
> > > > +
> > > > +ssize_t firmware_version_show(struct device *dev,
> > > > +                           struct device_attribute *attr, char
> > > > +*buf) {
> > > > +     struct cdns_mhdp8501_device *mhdp =3D dev_get_drvdata(dev);
> > > > +
> > > > +     u32 version =3D readl(mhdp->base.regs + VER_L) |
> > > readl(mhdp->base.regs + VER_H) << 8;
> > > > +     u32 lib_version =3D readl(mhdp->base.regs + VER_LIB_L_ADDR) |
> > > > +                       readl(mhdp->base.regs +
> VER_LIB_H_ADDR)
> > > << 8;
> > > > +
> > > > +     return sprintf(buf, "FW version %d, Lib version %d\n",
> > > > + version,
> > > lib_version);
> > > > +}
> > > > +
> > > > +static void cdns_mhdp8501_create_device_files(struct
> > > cdns_mhdp8501_device *mhdp)
> > > > +{
> > > > +     if (device_create_file(mhdp->dev, &firmware_version)) {
> > > > +             DRM_ERROR("Unable to create firmware_version
> > > sysfs\n");
> > > > +             device_remove_file(mhdp->dev, &firmware_version);
> > > > +     }
> > > > +}
> > > > +
> > > > +static void cdns_mhdp8501_remove_device_files(struct
> > > cdns_mhdp8501_device *mhdp)
> > > > +{
> > > > +     device_remove_file(mhdp->dev, &firmware_version); }
> > > > +
> > > > +static int cdns_mhdp8501_read_hpd(struct cdns_mhdp8501_device
> > > *mhdp)
> > > > +{
> > > > +     u8 status;
> > > > +     int ret;
> > > > +
> > > > +     ret =3D cdns_mhdp_mailbox_send_recv(&mhdp->base,
> > > MB_MODULE_ID_GENERAL,
> > > > +
> > > GENERAL_GET_HPD_STATE,
> > > > +                                       0, NULL,
> sizeof(status),
> > > &status);
> > > > +     if (ret) {
> > > > +             dev_err(mhdp->dev, "read hpd failed: %d\n", ret);
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     return status;
> > > > +}
> > > > +
> > > > +enum drm_connector_status cdns_mhdp8501_detect(struct
> drm_bridge
> > > *bridge)
> > > > +{
> > > > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > > > +
> > > > +     u8 hpd =3D 0xf;
> > > > +
> > > > +     hpd =3D cdns_mhdp8501_read_hpd(mhdp);
> > > > +     if (hpd =3D=3D 1)
> > > > +             return connector_status_connected;
> > > > +     else if (hpd =3D=3D 0)
> > > > +             return connector_status_disconnected;
> > > > +
> > > > +     return connector_status_unknown; }
> > > > +
> > > > +enum drm_mode_status
> > > > +cdns_mhdp8501_mode_valid(struct drm_bridge *bridge,
> > > > +                      const struct drm_display_info *info,
> > > > +                      const struct drm_display_mode *mode) {
> > > > +     /* We don't support double-clocked */
> > > > +     if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> > > > +             return MODE_BAD;
> > > > +
> > > > +     /* MAX support pixel clock rate 594MHz */
> > > > +     if (mode->clock > 594000)
> > > > +             return MODE_CLOCK_HIGH;
> > > > +
> > > > +     if (mode->hdisplay > 3840)
> > > > +             return MODE_BAD_HVALUE;
> > > > +
> > > > +     if (mode->vdisplay > 2160)
> > > > +             return MODE_BAD_VVALUE;
> > > > +
> > > > +     return MODE_OK;
> > > > +}
> > > > +
> > > > +static void hotplug_work_func(struct work_struct *work) {
> > > > +     struct cdns_mhdp8501_device *mhdp =3D container_of(work,
> > > > +                                                  struct
> > > cdns_mhdp8501_device,
> > > > +
> > > hotplug_work.work);
> > > > +     enum drm_connector_status status =3D
> > > cdns_mhdp8501_detect(&mhdp->bridge);
> > > > +
> > > > +     drm_bridge_hpd_notify(&mhdp->bridge, status);
> > > > +
> > > > +     /*
> > > > +      * iMX8MQ has two HPD interrupts: one for plugout and one
> > > > + for
> > > plugin.
> > > > +      * These interrupts cannot be masked and cleaned, so we must
> > > enable one
> > > > +      * and disable the other to avoid continuous interrupt
> generation.
> > > > +      */
> > > > +     if (status =3D=3D connector_status_connected) {
> > > > +             /* Cable connected  */
> > > > +             dev_dbg(mhdp->dev, "HDMI/DP Cable Plug In\n");
> > > > +             enable_irq(mhdp->irq[IRQ_OUT]);
> > > > +
> > > > +             /* Reset HDMI/DP link with sink */
> > > > +             if (mhdp->connector_type =3D=3D
> > > DRM_MODE_CONNECTOR_HDMIA)
> > > > +                     cdns_hdmi_handle_hotplug(mhdp);
> > > > +             else
> > > > +                     cdns_dp_check_link_state(mhdp);
> > > > +
> > > > +     } else if (status =3D=3D connector_status_disconnected) {
> > > > +             /* Cable Disconnected  */
> > > > +             dev_dbg(mhdp->dev, "HDMI/DP Cable Plug Out\n");
> > > > +             enable_irq(mhdp->irq[IRQ_IN]);
> > > > +     }
> > > > +}
> > > > +
> > > > +static irqreturn_t cdns_mhdp8501_irq_thread(int irq, void *data)
> > > > +{
> > > > +     struct cdns_mhdp8501_device *mhdp =3D data;
> > > > +
> > > > +     disable_irq_nosync(irq);
> > > > +
> > > > +     mod_delayed_work(system_wq, &mhdp->hotplug_work,
> > > > +
> msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
> > > > +
> > > > +     return IRQ_HANDLED;
> > > > +}
> > > > +
> > > > +#define DATA_LANES_COUNT     4
> > > > +static int cdns_mhdp8501_dt_parse(struct cdns_mhdp8501_device
> > > *mhdp,
> > > > +                               struct platform_device *pdev) {
> > > > +     struct device *dev =3D &pdev->dev;
> > > > +     struct device_node *np =3D dev->of_node;
> > > > +     struct device_node *remote, *endpoint;
> > > > +     u32 data_lanes[DATA_LANES_COUNT];
> > > > +     u32 lane_value;
> > > > +     int ret, i;
> > > > +
> > > > +     remote =3D of_graph_get_remote_node(np, 1, 0);
> > > > +     if (!remote) {
> > > > +             dev_err(dev, "fail to get remote node\n");
> > > > +             of_node_put(remote);
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     /* get connector type */
> > > > +     if (of_device_is_compatible(remote, "hdmi-connector")) {
> > > > +             mhdp->connector_type =3D
> > > DRM_MODE_CONNECTOR_HDMIA;
> > > > +
> > > > +     } else if (of_device_is_compatible(remote, "dp-connector")) {
> > > > +             mhdp->connector_type =3D
> > > DRM_MODE_CONNECTOR_DisplayPort;
> > >
> > > Interesting hack. What if somebody wraps DP signals with the USB-C
> > > controller in order to provide DP over USB-C?
> >
> > There is no such requirement now, and the supported types of
> display-connectors do not include Type-C DP connectors.
> > If type-C DP connectors is added in the future, I think it would be acc=
eptable
> to modify the code here.
>=20
> It would be acceptable, but it most likely will also require chaning the =
DT
> bindings as there is no longer an easy way to identify the next bridge. A=
lso you
> might not have that now, but it is pretty common to have DP retimers on t=
he
> board in order to improve the sinal integrity.
> Thus I think it is not a proper solution to check the next node's compati=
ble. I
> think we need a way to specify HDMI vs DP firmware / mode in the device
> tree.
>=20

Since there already have the connector type for HDMI or DP.
adding another parameter to the DT bindings to specify the PHY type seems r=
edundant.

If anyone add DP retimer to the board, the similar code as followed may add=
 to the driver.
         last_remote =3D remote;
         while (of_graph_get_remote_node(last_remote, 1, 0))
                 last_remote =3D of_graph_get_remote_node(last_remote, 1, 0=
);

Before new requirements arise, I hope to keep the current implementation.

> >
> > >
> > > Unfortunately I don't have a good solution here. There might be
> > > other format converters after your bridge, so you even can't look at
> > > the last bridge of the chain. You might want to examine the phy-mode
> > > property and use it to specify whether the PHY should work in the
> > > HDMI or in the DP mode.
> >
> > MHDP supports either HDMI or DP based on its firmware.
> > The PHY doesn't provide a function to indicate which firmware is
> > currently running, and the controller driver doesn't have a mechanism t=
o
> determine whether it's DP or HDMI.
> > The users should select the corresponding firmware based on the connect=
or
> type when their get the board.
> >
> > For the driver, there must be an external input to determine whether it=
's
> currently running in HDMI or DP mode.
> > In earlier versions, I used different compatible strings to distinguish=
 between
> DP and HDMI.
> > However, based on comments from other reviewers, I changed the
> > approach to checking the connector type, which is clearly a more suitab=
le
> method.
> >
> > >
> > > Also, where do get the next bridge and attach it to the bridge chain?
> >
> > next_bridge get and attach is missed in the driver, I will add it.
> >
> > >
> > > > +
> > > > +     } else {
> > > > +             dev_err(dev, "Unknown connector type\n");
> > > > +             of_node_put(remote);
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     of_node_put(remote);
> > > > +
> > > > +     endpoint =3D of_graph_get_endpoint_by_regs(np, 1, -1);
> > > > +
> > > > +     /* Get the data lanes ordering */
> > > > +     ret =3D of_property_count_u32_elems(endpoint, "data-lanes");
> > > > +     if (ret < 0)
> > > > +             return  -EINVAL;
> > > > +     if (ret !=3D DATA_LANES_COUNT) {
> > > > +             dev_err(dev, "expected 4 data lanes\n");
> > > > +             return  -EINVAL;
> > > > +     }
> > >
> > > Isn't it drm_of_get_data_lanes_count_ep()?
> >
> > drm_of_get_data_lanes_count will be used here in the next version.
> >
> > >
> > > > +
> > > > +     ret =3D of_property_read_u32_array(endpoint, "data-lanes",
> > > > +                                      data_lanes,
> > > DATA_LANES_COUNT);
> > > > +     if (ret)
> > > > +             return  -EINVAL;
> > > > +
> > > > +     mhdp->lane_mapping  =3D 0;
> > > > +     for (i =3D 0; i < DATA_LANES_COUNT; i++) {
> > > > +             lane_value =3D (data_lanes[i] >=3D 0 && data_lanes[i]=
 <=3D
> 3) ?
> > > data_lanes[i] : 0;
> > > > +             mhdp->lane_mapping |=3D lane_value << (i * 2);
> > > > +     }
> > > > +
> > > > +     return true;
> > > > +}
> > > > +
> > > > +static int cdns_mhdp8501_add_bridge(struct cdns_mhdp8501_device
> > > *mhdp)
> > > > +{
> > > > +     mhdp->bridge.type =3D mhdp->connector_type;
> > > > +     mhdp->bridge.driver_private =3D mhdp;
> > > > +     mhdp->bridge.of_node =3D mhdp->dev->of_node;
> > > > +     mhdp->bridge.vendor =3D "NXP";
> > > > +     mhdp->bridge.product =3D "i.MX8";
> > > > +     mhdp->bridge.ops =3D DRM_BRIDGE_OP_DETECT |
> > > DRM_BRIDGE_OP_EDID |
> > > > +                        DRM_BRIDGE_OP_HPD;
> > > > +
> > > > +     if (mhdp->connector_type =3D=3D
> DRM_MODE_CONNECTOR_HDMIA) {
> > > > +             mhdp->bridge.funcs =3D &cdns_hdmi_bridge_funcs;
> > > > +             mhdp->bridge.ops |=3D DRM_BRIDGE_OP_HDMI;
> > > > +             mhdp->bridge.ddc =3D cdns_hdmi_i2c_adapter(mhdp);
> > >
> > > I'd expect that bridge.ddc provides DDC service. Is it required to
> > > control the SCDC from userspace?
> >
> > I may not have fully understood your question.
> > The DDC here is used for the SCDC API functions like drm_scdc_set_XXX i=
n
> HDMI driver.
> > So far, I haven't encountered any cases where the user needs to control
> SCDC.
>=20
> Okay.
>=20
> >
> > >
> > > > +     } else if (mhdp->connector_type =3D=3D
> > > DRM_MODE_CONNECTOR_DisplayPort) {
> > > > +             mhdp->bridge.funcs =3D &cdns_dp_bridge_funcs;
> > > > +     } else {
> > > > +             dev_err(mhdp->dev, "Unsupported connector
> type!\n");
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     drm_bridge_add(&mhdp->bridge);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int cdns_mhdp8501_probe(struct platform_device *pdev) {
> > > > +     struct device *dev =3D &pdev->dev;
> > > > +     struct cdns_mhdp8501_device *mhdp;
> > > > +     struct resource *res;
> > > > +     enum phy_mode phy_mode;
> > > > +     u32 reg;
> > > > +     int ret;
> > > > +
> > > > +     mhdp =3D devm_kzalloc(dev, sizeof(*mhdp), GFP_KERNEL);
> > > > +     if (!mhdp)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     mhdp->dev =3D dev;
> > > > +
> > > > +     INIT_DELAYED_WORK(&mhdp->hotplug_work,
> hotplug_work_func);
> > > > +
> > > > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > +     if (!res)
> > > > +             return -ENODEV;
> > > > +
> > > > +     mhdp->regs =3D devm_ioremap(dev, res->start,
> resource_size(res));
> > > > +     if (IS_ERR(mhdp->regs))
> > > > +             return PTR_ERR(mhdp->regs);
> > > > +
> > > > +     cdns_mhdp8501_create_device_files(mhdp);
> > > > +
> > > > +     ret =3D cdns_mhdp8501_dt_parse(mhdp, pdev);
> > > > +     if (ret < 0)
> > > > +             return -EINVAL;
> > > > +
> > > > +     mhdp->phy =3D devm_of_phy_get_by_index(dev,
> pdev->dev.of_node,
> > > 0);
> > > > +     if (IS_ERR(mhdp->phy))
> > > > +             return dev_err_probe(dev, PTR_ERR(mhdp->phy), "no
> > > > + PHY
> > > configured\n");
> > > > +
> > > > +     mhdp->irq[IRQ_IN] =3D platform_get_irq_byname(pdev, "plug_in"=
);
> > > > +     if (mhdp->irq[IRQ_IN] < 0)
> > > > +             return dev_err_probe(dev, mhdp->irq[IRQ_IN], "No
> > > plug_in irq number\n");
> > > > +
> > > > +     mhdp->irq[IRQ_OUT] =3D platform_get_irq_byname(pdev,
> > > "plug_out");
> > > > +     if (mhdp->irq[IRQ_OUT] < 0)
> > > > +             return dev_err_probe(dev, mhdp->irq[IRQ_OUT], "No
> > > plug_out irq number\n");
> > > > +
> > > > +     irq_set_status_flags(mhdp->irq[IRQ_IN], IRQ_NOAUTOEN);
> > > > +     ret =3D devm_request_threaded_irq(dev, mhdp->irq[IRQ_IN],
> > > > +                                     NULL,
> > > cdns_mhdp8501_irq_thread,
> > > > +                                     IRQF_ONESHOT,
> > > dev_name(dev), mhdp);
> > > > +     if (ret < 0) {
> > > > +             dev_err(dev, "can't claim irq %d\n",
> mhdp->irq[IRQ_IN]);
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     irq_set_status_flags(mhdp->irq[IRQ_OUT], IRQ_NOAUTOEN);
> > > > +     ret =3D devm_request_threaded_irq(dev, mhdp->irq[IRQ_OUT],
> > > > +                                     NULL,
> > > cdns_mhdp8501_irq_thread,
> > > > +                                     IRQF_ONESHOT,
> > > dev_name(dev), mhdp);
> > > > +     if (ret < 0) {
> > > > +             dev_err(dev, "can't claim irq %d\n",
> > > mhdp->irq[IRQ_OUT]);
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     /* cdns_mhdp8501_dt_parse() ensures connector_type is valid
> */
> > > > +     if (mhdp->connector_type =3D=3D
> > > DRM_MODE_CONNECTOR_DisplayPort)
> > > > +             phy_mode =3D PHY_MODE_DP;
> > > > +     else if (mhdp->connector_type =3D=3D
> > > DRM_MODE_CONNECTOR_HDMIA)
> > > > +             phy_mode =3D PHY_MODE_HDMI;
> > > > +
> > > > +     dev_set_drvdata(dev, mhdp);
> > > > +
> > > > +     /* init base struct for access mhdp mailbox */
> > > > +     mhdp->base.dev =3D mhdp->dev;
> > > > +     mhdp->base.regs =3D mhdp->regs;
> > > > +
> > > > +     if (mhdp->connector_type =3D=3D
> > > DRM_MODE_CONNECTOR_DisplayPort) {
> > > > +             drm_dp_aux_init(&mhdp->dp.aux);
> > > > +             mhdp->dp.aux.name =3D "mhdp8501_dp_aux";
> > > > +             mhdp->dp.aux.dev =3D dev;
> > > > +             mhdp->dp.aux.transfer =3D cdns_dp_aux_transfer;
> > > > +     }
> > > > +
> > > > +     /* Enable APB clock */
> > > > +     mhdp->apb_clk =3D devm_clk_get_enabled(dev, NULL);
> > > > +     if (IS_ERR(mhdp->apb_clk))
> > > > +             return dev_err_probe(dev, PTR_ERR(mhdp->apb_clk),
> > > > +                                  "couldn't get apb clk\n");
> > > > +     /*
> > > > +      * Wait for the KEEP_ALIVE "message" on the first 8 bits.
> > > > +      * Updated each sched "tick" (~2ms)
> > > > +      */
> > > > +     ret =3D readl_poll_timeout(mhdp->regs + KEEP_ALIVE, reg,
> > > > +                              reg & CDNS_KEEP_ALIVE_MASK,
> > > 500,
> > > > +                              CDNS_KEEP_ALIVE_TIMEOUT);
> > > > +     if (ret) {
> > > > +             dev_err(dev, "device didn't give any life sign: reg
> > > > + %d\n",
> > > reg);
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     ret =3D phy_init(mhdp->phy);
> > > > +     if (ret) {
> > > > +             dev_err(dev, "Failed to initialize PHY: %d\n", ret);
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     ret =3D phy_set_mode(mhdp->phy, phy_mode);
> > > > +     if (ret) {
> > > > +             dev_err(dev, "Failed to configure PHY: %d\n", ret);
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     /* Enable cable hotplug detect */
> > > > +     if (cdns_mhdp8501_read_hpd(mhdp))
> > > > +             enable_irq(mhdp->irq[IRQ_OUT]);
> > > > +     else
> > > > +             enable_irq(mhdp->irq[IRQ_IN]);
> > > > +
> > > > +     return cdns_mhdp8501_add_bridge(mhdp); }
> > > > +
> > > > +static void cdns_mhdp8501_remove(struct platform_device *pdev) {
> > > > +     struct cdns_mhdp8501_device *mhdp =3D
> > > platform_get_drvdata(pdev);
> > > > +
> > > > +     cdns_mhdp8501_remove_device_files(mhdp);
> > > > +
> > > > +     if (mhdp->connector_type =3D=3D
> > > DRM_MODE_CONNECTOR_DisplayPort)
> > > > +             cdns_dp_aux_destroy(mhdp);
> > > > +
> > > > +     drm_bridge_remove(&mhdp->bridge); }
> > > > +
> > > > +static const struct of_device_id cdns_mhdp8501_dt_ids[] =3D {
> > > > +     { .compatible =3D "fsl,imx8mq-mhdp8501",
> > > > +     },
> > >
> > > Strange line wrapping, I'd say. Either it should all be on the same
> > > line, or take three lines.
> >
> > I will fix it.
> >
> > >
> > > > +     { },
> > > > +};
> > > > +MODULE_DEVICE_TABLE(of, cdns_mhdp8501_dt_ids);
> > > > +
> > > > +static struct platform_driver cdns_mhdp8501_driver =3D {
> > > > +     .probe =3D cdns_mhdp8501_probe,
> > > > +     .remove =3D cdns_mhdp8501_remove,
> > > > +     .driver =3D {
> > > > +             .name =3D "cdns-mhdp8501",
> > > > +             .of_match_table =3D cdns_mhdp8501_dt_ids,
> > > > +     },
> > > > +};
> > > > +
> > > > +module_platform_driver(cdns_mhdp8501_driver);
> > > > +
> > > > +MODULE_AUTHOR("Sandor Yu <sandor.yu@nxp.com>");
> > > > +MODULE_DESCRIPTION("Cadence MHDP8501 bridge driver");
> > > > +MODULE_LICENSE("GPL");
> >
> >
> > > > +static void cdns_dp_mode_set(struct cdns_mhdp8501_device *mhdp,
> > > > +                          const struct drm_display_mode *mode)
> {
> > > > +     union phy_configure_opts phy_cfg;
> > > > +     int ret;
> > > > +
> > > > +     cdns_dp_pixel_clk_reset(mhdp);
> > > > +
> > > > +     /* Get DP Caps  */
> > > > +     ret =3D drm_dp_dpcd_read(&mhdp->dp.aux, DP_DPCD_REV,
> > > mhdp->dp.dpcd,
> > > > +                            DP_RECEIVER_CAP_SIZE);
> > > > +     if (ret < 0) {
> > > > +             dev_err(mhdp->dev, "Failed to get caps %d\n", ret);
> > > > +             return;
> > > > +     }
> > > > +
> > > > +     mhdp->dp.rate =3D drm_dp_max_link_rate(mhdp->dp.dpcd);
> > > > +     mhdp->dp.num_lanes =3D
> drm_dp_max_lane_count(mhdp->dp.dpcd);
> > > > +
> > > > +     /* check the max link rate */
> > > > +     if (mhdp->dp.rate > CDNS_DP_MAX_LINK_RATE)
> > > > +             mhdp->dp.rate =3D CDNS_DP_MAX_LINK_RATE;
> > > > +
> > > > +     phy_cfg.dp.lanes =3D mhdp->dp.num_lanes;
> > > > +     phy_cfg.dp.link_rate =3D mhdp->dp.rate;
> > > > +     phy_cfg.dp.set_lanes =3D false;
> > > > +     phy_cfg.dp.set_rate =3D false;
> > > > +     phy_cfg.dp.set_voltages =3D false;
> > >
> > > If all of those are false, then you can skip setting .lanes and
> > > .link_rate.
> >
> > I may have misunderstood the comments in the header file for these two
> flags.
> > I'll check them again.
> >
> > >
> > > > +
> > > > +     ret =3D phy_configure(mhdp->phy, &phy_cfg);
> > > > +     if (ret) {
> > > > +             dev_err(mhdp->dev, "%s: phy_configure()
> failed: %d\n",
> > > > +                     __func__, ret);
> > > > +             return;
> > > > +     }
> > > > +
> > > > +     /* Video off */
> > > > +     ret =3D cdns_dp_set_video_status(mhdp, CONTROL_VIDEO_IDLE);
> > > > +     if (ret) {
> > > > +             dev_err(mhdp->dev, "Failed to valid video %d\n", ret)=
;
> > > > +             return;
> > > > +     }
> > > > +
> > > > +     /* Line swapping */
> > > > +     cdns_mhdp_reg_write(&mhdp->base, LANES_CONFIG,
> 0x00400000
> > > | mhdp->lane_mapping);
> > > > +
> > > > +     /* Set DP host capability */
> > > > +     ret =3D cdns_dp_set_host_cap(mhdp);
> > > > +     if (ret) {
> > > > +             dev_err(mhdp->dev, "Failed to set host cap %d\n",
> ret);
> > > > +             return;
> > > > +     }
> > > > +
> > > > +     ret =3D cdns_mhdp_reg_write(&mhdp->base,
> > > DP_AUX_SWAP_INVERSION_CONTROL,
> > > > +                               AUX_HOST_INVERT);
> > > > +     if (ret) {
> > > > +             dev_err(mhdp->dev, "Failed to set host invert %d\n",
> ret);
> > > > +             return;
> > > > +     }
> > > > +
> > > > +     ret =3D cdns_dp_config_video(mhdp, mode);
> > > > +     if (ret)
> > > > +             dev_err(mhdp->dev, "Failed to config video %d\n",
> > > > +ret); }
> > > > +
> > > > +static bool
> > > > +cdns_dp_needs_link_retrain(struct cdns_mhdp8501_device *mhdp) {
> > > > +     u8 link_status[DP_LINK_STATUS_SIZE];
> > > > +
> > > > +     if (drm_dp_dpcd_read_phy_link_status(&mhdp->dp.aux,
> > > DP_PHY_DPRX,
> > > > +                                          link_status) < 0)
> > > > +             return false;
> > > > +
> > > > +     /* Retrain if link not ok */
> > > > +     return !drm_dp_channel_eq_ok(link_status,
> > > > +mhdp->dp.num_lanes); }
> > > > +
> > > > +void cdns_dp_check_link_state(struct cdns_mhdp8501_device *mhdp)
> > > > +{
> > > > +     struct drm_connector *connector =3D mhdp->curr_conn;
> > > > +     const struct drm_edid *drm_edid;
> > > > +     struct drm_connector_state *conn_state;
> > > > +     struct drm_crtc_state *crtc_state;
> > > > +     struct drm_crtc *crtc;
> > > > +
> > > > +     if (!connector)
> > > > +             return;
> > > > +
> > > > +     /*
> > > > +      * EDID data needs updating after each cable plugin
> > > > +      * due to potential display monitor changes
> > > > +      */
> > > > +     drm_edid =3D drm_edid_read_custom(connector,
> > > cdns_dp_get_edid_block, mhdp);
> > > > +     drm_edid_connector_update(connector, drm_edid);
> > > > +
> > > > +     if (!drm_edid)
> > > > +             return;
> > > > +
> > > > +     drm_edid_free(drm_edid);
> > > > +
> > > > +     conn_state =3D connector->state;
> > > > +     crtc =3D conn_state->crtc;
> > > > +     if (!crtc)
> > > > +             return;
> > > > +
> > > > +     crtc_state =3D crtc->state;
> > > > +     if (!crtc_state->active)
> > > > +             return;
> > > > +
> > > > +     if (!cdns_dp_needs_link_retrain(mhdp))
> > > > +             return;
> > > > +
> > > > +     /* DP link retrain */
> > > > +     if (cdns_dp_train_link(mhdp))
> > > > +             dev_err(mhdp->dev, "Failed link train\n");
> > >
> > > Won't this cause link traning to happen on the first monitor plug eve=
nt?
> > > Is it okay to do even with the phy being powered off?
> >
> > These two cases have already been excluded in the previous codes.
> >
> > >
> > > > +}
> > > > +
> > > > +static int cdns_dp_bridge_attach(struct drm_bridge *bridge,
> > > > +                              enum drm_bridge_attach_flags
> flags)
> > > > +{
> > > > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > > > +
> > > > +     if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > > > +             dev_err(mhdp->dev, "do not support creating a
> > > drm_connector\n");
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     mhdp->dp.aux.drm_dev =3D bridge->dev;
> > > > +
> > > > +     return drm_dp_aux_register(&mhdp->dp.aux);
> > >
> > > Why is it a part of the _attach callback? If there is anything on
> > > the DP AUX bus, it should be already registered by this point.
> >
> > Here, I've referenced other DP drivers and called drm_dp_aux_register i=
n
> the attach function.
> > No any special requirements for AUX in my DP driver.
>=20
> Oh, because it's DP, without eDP functionality. Okay.
>=20
> >
> > >
> > > > +}
> > > > +
> > > > +static const struct drm_edid
> > > > +*cdns_dp_bridge_edid_read(struct drm_bridge *bridge,
> > > > +                       struct drm_connector *connector) {
> > > > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > > > +
> > > > +     return drm_edid_read_custom(connector,
> > > > + cdns_dp_get_edid_block,
> > > mhdp);
> > > > +}
> > > > +
> > > > +/* Currently supported format */
> > > > +static const u32 mhdp8501_input_fmts[] =3D {
> > > > +     MEDIA_BUS_FMT_RGB888_1X24,
> > > > +     MEDIA_BUS_FMT_RGB101010_1X30, };
> > > > +
> > > > +static u32 *cdns_dp_bridge_atomic_get_input_bus_fmts(struct
> > > drm_bridge *bridge,
> > > > +                                                  struct
> > > drm_bridge_state *bridge_state,
> > > > +                                                  struct
> > > drm_crtc_state *crtc_state,
> > > > +                                                  struct
> > > drm_connector_state *conn_state,
> > > > +                                                  u32
> > > output_fmt,
> > > > +
> unsigned int
> > > *num_input_fmts)
> > > > +{
> > > > +     u32 *input_fmts;
> > > > +
> > > > +     *num_input_fmts =3D 0;
> > > > +
> > > > +     input_fmts =3D kcalloc(ARRAY_SIZE(mhdp8501_input_fmts),
> > > > +                          sizeof(*input_fmts),
> > > > +                          GFP_KERNEL);
> > > > +     if (!input_fmts)
> > > > +             return NULL;
> > > > +
> > > > +     *num_input_fmts =3D ARRAY_SIZE(mhdp8501_input_fmts);
> > > > +     memcpy(input_fmts, mhdp8501_input_fmts,
> > > sizeof(mhdp8501_input_fmts));
> > > > +
> > > > +     return input_fmts;
> > > > +}
> > > > +
> > > > +static int cdns_dp_bridge_atomic_check(struct drm_bridge *bridge,
> > > > +                                    struct drm_bridge_state
> > > *bridge_state,
> > > > +                                    struct drm_crtc_state
> > > *crtc_state,
> > > > +                                    struct
> drm_connector_state
> > > *conn_state)
> > > > +{
> > > > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > > > +     struct video_info *video =3D &mhdp->video_info;
> > > > +
> > > > +     if (bridge_state->input_bus_cfg.format =3D=3D
> > > MEDIA_BUS_FMT_RGB888_1X24) {
> > > > +             video->bpc =3D 8;
> > > > +             video->color_fmt =3D DRM_COLOR_FORMAT_RGB444;
> > > > +     } else if (bridge_state->input_bus_cfg.format =3D=3D
> > > MEDIA_BUS_FMT_RGB101010_1X30) {
> > > > +             video->bpc =3D 10;
> > > > +             video->color_fmt =3D DRM_COLOR_FORMAT_RGB444;
> > >
> > > Which driver is going to select bus config for you?
> >
> > Oh, actually there isn't. The driver uses the first format in
> mhdp8501_input_fmts.
>=20
> So, is this a dead code to be dropped?

OK, I will drop it.

>=20
> >
> > >
> > > > +     } else {
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void cdns_dp_bridge_atomic_disable(struct drm_bridge *bridg=
e,
> > > > +                                       struct
> drm_bridge_state
> > > *old_state)
> > > > +{
> > > > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > > > +
> > > > +     cdns_dp_set_video_status(mhdp, CONTROL_VIDEO_IDLE);
> > > > +     mhdp->curr_conn =3D NULL;
> > > > +
> > > > +     phy_power_off(mhdp->phy);
> > > > +}
> > > > +
> > > > +static void cdns_dp_bridge_atomic_enable(struct drm_bridge *bridge=
,
> > > > +                                      struct
> drm_bridge_state
> > > *old_state)
> > > > +{
> > > > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > > > +     struct drm_atomic_state *state =3D old_state->base.state;
> > > > +     struct drm_connector *connector;
> > > > +     struct drm_crtc_state *crtc_state;
> > > > +     struct drm_connector_state *conn_state;
> > > > +     int ret;
> > > > +
> > > > +     connector =3D
> drm_atomic_get_new_connector_for_encoder(state,
> > > > +
> > > bridge->encoder);
> > > > +     if (WARN_ON(!connector))
> > > > +             return;
> > > > +
> > > > +     mhdp->curr_conn =3D connector;
> > > > +
> > > > +     conn_state =3D drm_atomic_get_new_connector_state(state,
> > > connector);
> > > > +     if (WARN_ON(!conn_state))
> > > > +             return;
> > > > +
> > > > +     crtc_state =3D drm_atomic_get_new_crtc_state(state,
> > > conn_state->crtc);
> > > > +     if (WARN_ON(!crtc_state))
> > > > +             return;
> > > > +
> > > > +     cdns_dp_mode_set(mhdp, &crtc_state->adjusted_mode);
> > > > +
> > > > +     /* Power up PHY before link training */
> > > > +     phy_power_on(mhdp->phy);
> > > > +
> > > > +     /* Link training */
> > > > +     ret =3D cdns_dp_train_link(mhdp);
> > > > +     if (ret) {
> > > > +             dev_err(mhdp->dev, "Failed link train %d\n", ret);
> > > > +             return;
> > > > +     }
> > > > +
> > > > +     ret =3D cdns_dp_set_video_status(mhdp,
> CONTROL_VIDEO_VALID);
> > > > +     if (ret) {
> > > > +             dev_err(mhdp->dev, "Failed to valid video %d\n", ret)=
;
> > > > +             return;
> > > > +     }
> > > > +}
> > > > +
> > > > +const struct drm_bridge_funcs cdns_dp_bridge_funcs =3D {
> > > > +     .attach =3D cdns_dp_bridge_attach,
> > > > +     .detect =3D cdns_mhdp8501_detect,
> > > > +     .edid_read =3D cdns_dp_bridge_edid_read,
> > > > +     .mode_valid =3D cdns_mhdp8501_mode_valid,
> > > > +     .atomic_enable =3D cdns_dp_bridge_atomic_enable,
> > > > +     .atomic_disable =3D cdns_dp_bridge_atomic_disable,
> > > > +     .atomic_get_input_bus_fmts =3D
> > > cdns_dp_bridge_atomic_get_input_bus_fmts,
> > > > +     .atomic_check =3D cdns_dp_bridge_atomic_check,
> > > > +     .atomic_duplicate_state =3D
> > > drm_atomic_helper_bridge_duplicate_state,
> > > > +     .atomic_destroy_state =3D
> drm_atomic_helper_bridge_destroy_state,
> > > > +     .atomic_reset =3D drm_atomic_helper_bridge_reset, };
> > > > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> > > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> > > > new file mode 100644
> > > > index 0000000000000..9556d0929e21d
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> > > > @@ -0,0 +1,745 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * Cadence MHDP8501 HDMI bridge driver
> > > > + *
> > > > + * Copyright (C) 2019-2024 NXP Semiconductor, Inc.
> > > > + *
> > > > + */
> > > > +#include <drm/display/drm_hdmi_helper.h> #include
> > > > +<drm/display/drm_hdmi_state_helper.h>
> > > > +#include <drm/display/drm_scdc_helper.h> #include
> > > > +<drm/drm_atomic_helper.h> #include <drm/drm_edid.h> #include
> > > > +<drm/drm_print.h> #include <linux/phy/phy.h> #include
> > > > +<linux/phy/phy-hdmi.h>
> > > > +
> > > > +#include "cdns-mhdp8501-core.h"
> > > > +
> > > > +/**
> > > > + * cdns_hdmi_config_infoframe() - fill the HDMI infoframe
> > > > + * @mhdp: phandle to mhdp device.
> > > > + * @entry_id: The packet memory address in which the data is writt=
en.
> > > > + * @len: length of infoframe.
> > > > + * @buf: point to InfoFrame Packet.
> > > > + * @type: Packet Type of InfoFrame in HDMI Specification.
> > > > + *
> > > > + */
> > > > +
> > > > +static void cdns_hdmi_clear_infoframe(struct cdns_mhdp8501_device
> > > *mhdp,
> > > > +                                   u8 entry_id, u8 type) {
> > > > +     u32 val;
> > > > +
> > > > +     /* invalidate entry */
> > > > +     val =3D F_ACTIVE_IDLE_TYPE(1) |
> F_PKT_ALLOC_ADDRESS(entry_id) |
> > > > +           F_PACKET_TYPE(type);
> > > > +     writel(val, mhdp->regs + SOURCE_PIF_PKT_ALLOC_REG);
> > > > +     writel(F_PKT_ALLOC_WR_EN(1), mhdp->regs +
> > > SOURCE_PIF_PKT_ALLOC_WR_EN);
> > > > +}
> > > > +
> > > > +static void cdns_hdmi_config_infoframe(struct
> > > > +cdns_mhdp8501_device
> > > *mhdp,
> > > > +                                    u8 entry_id, u8 len,
> > > > +                                    const u8 *buf, u8 type) {
> > > > +     u8 packet[32], packet_len =3D 32;
> > > > +     u32 packet32, len32;
> > > > +     u32 val, i;
> > > > +
> > > > +     /*
> > > > +      * only support 32 bytes now
> > > > +      * packet[0] =3D 0
> > > > +      * packet[1-3] =3D HB[0-2]  InfoFrame Packet Header
> > > > +      * packet[4-31 =3D PB[0-27] InfoFrame Packet Contents
> > > > +      */
> > > > +     if (len >=3D (packet_len - 1))
> > > > +             return;
> > > > +     packet[0] =3D 0;
> > > > +     memcpy(packet + 1, buf, len);
> > > > +
> > > > +     cdns_hdmi_clear_infoframe(mhdp, entry_id, type);
> > > > +
> > > > +     /* flush fifo 1 */
> > > > +     writel(F_FIFO1_FLUSH(1), mhdp->regs +
> > > SOURCE_PIF_FIFO1_FLUSH);
> > > > +
> > > > +     /* write packet into memory */
> > > > +     len32 =3D packet_len / 4;
> > > > +     for (i =3D 0; i < len32; i++) {
> > > > +             packet32 =3D get_unaligned_le32(packet + 4 * i);
> > > > +             writel(F_DATA_WR(packet32), mhdp->regs +
> > > SOURCE_PIF_DATA_WR);
> > > > +     }
> > > > +
> > > > +     /* write entry id */
> > > > +     writel(F_WR_ADDR(entry_id), mhdp->regs +
> > > SOURCE_PIF_WR_ADDR);
> > > > +
> > > > +     /* write request */
> > > > +     writel(F_HOST_WR(1), mhdp->regs + SOURCE_PIF_WR_REQ);
> > > > +
> > > > +     /* update entry */
> > > > +     val =3D F_ACTIVE_IDLE_TYPE(1) | F_TYPE_VALID(1) |
> > > > +           F_PACKET_TYPE(type) |
> F_PKT_ALLOC_ADDRESS(entry_id);
> > > > +     writel(val, mhdp->regs + SOURCE_PIF_PKT_ALLOC_REG);
> > > > +
> > > > +     writel(F_PKT_ALLOC_WR_EN(1), mhdp->regs +
> > > SOURCE_PIF_PKT_ALLOC_WR_EN);
> > > > +}
> > > > +
> > > > +static int cdns_hdmi_get_edid_block(void *data, u8 *edid,
> > > > +                                 u32 block, size_t length) {
> > > > +     struct cdns_mhdp8501_device *mhdp =3D data;
> > > > +     u8 msg[2], reg[5], i;
> > > > +     int ret;
> > > > +
> > > > +     for (i =3D 0; i < 4; i++) {
> > > > +             msg[0] =3D block / 2;
> > > > +             msg[1] =3D block % 2;
> > > > +
> > > > +             ret =3D
> > > cdns_mhdp_mailbox_send_recv_multi(&mhdp->base,
> > > > +
> > > MB_MODULE_ID_HDMI_TX,
> > > > +
> > > HDMI_TX_EDID,
> > > > +
> > > sizeof(msg), msg,
> > > > +
> > > HDMI_TX_EDID,
> > > > +
> > > sizeof(reg), reg,
> > > > +
> length,
> > > edid);
> > > > +
> > > > +             if (ret)
> > > > +                     continue;
> > >
> > > Ignoring the error?
> >
> > Yes. EDID read operations can be interrupted by various factors, but
> > as long as the EDID is eventually read successfully, there's no issue.
>=20
> Okay... I'd still suggest a drm_dbg_dp() here.
>=20

OK, I will add it.

B.R
Sandor

>=20
> --
> With best wishes
> Dmitry
