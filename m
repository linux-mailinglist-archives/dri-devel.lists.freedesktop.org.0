Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D0575A75D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 09:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76DA10E567;
	Thu, 20 Jul 2023 07:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C3F10E567
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 07:10:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bo1d3ynAPtQ02ZEwHe7iiZ+wjvIcUi48AlhylN0aO4oOpFh2BEkVN8u6kCTAVxjTrbXuCaWRS/FMaiXp6BfR2A2W0EHWtY7qCHdFU3snvpb1lVbMAJVKdbey+sukA5vdyKkq8/m1XN5hjOiqztyvn0qOCi9q+9HV1pHR9yABa52EnV6/UlpTcIuie4DCyoTvezbeuy8rS4D2Aiv9QwkDBAKxX9oaCaZFgLTXhPqKw6IL9q5t8SCOkDC2zeyWwZ4awYQl4Kx/USUeKCPwWq71LwY0duWp45mPoWcaxb9lANXkwsSY+lc6h7LORfRDwofP7eBbw/AEM2AGNENTv/4RLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BTL19AEog0wfHvJBaYbx4+o0nMsy/EIbPzhBO7+D58=;
 b=JtAuQhos2JWANKYBmC97I9eHMQz/qr9hO5ZppAaUuyr+V8wjVlhABFa8n1EmGAkEVdCLdeq+YHR2j/I9uw4KDnnPKCX1UA+HuPpExptWdRIOjHfJF/ENTFGjb1Ng0JJgvIiG7y0FxxJYzDJfQM/DsZeUna8FJcMAFBODnMcGlnYBv5LfT3nSztGhz5TwkjJ4ZjfTc+tIZnqXJvu/1uZMeHXna8WRE9bKMZNqALeI4BE1h4lvp2Ybt3nlf5yO8Qr2+O7uIu/zSBFL8o8fZrfF/ASMTgro+rKb5a2z9Paa/7FZ/6PfxQ/uGOIM/VoVjJwHEAn8sGd7D+NoWAV6DGGbBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BTL19AEog0wfHvJBaYbx4+o0nMsy/EIbPzhBO7+D58=;
 b=iGaMjaL7qcWDklOBHXvGBfUERJpIBITJHFWCI7vKsH1wR8nwamZwL6qfngnS/wvW25oQYQn5nXfWagWf+L6aR9ddx8wxOXjAg7FVs4FxzKzZdvqbbpzRuPW6ZsNSzhnV3h/iVZcbTa7v+hUIGAfkVy/92HiNyIA0bxl18gOI+00=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8415.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 07:10:06 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6609.022; Thu, 20 Jul 2023
 07:10:06 +0000
From: Ying Liu <victor.liu@nxp.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 3/9] drm/bridge: synopsys: dw-mipi-dsi: Force input bus
 flags
Thread-Topic: [PATCH v2 3/9] drm/bridge: synopsys: dw-mipi-dsi: Force input
 bus flags
Thread-Index: Adm62TZXrb2BNeOVFECO4yk1+av6XQ==
Date: Thu, 20 Jul 2023 07:10:06 +0000
Message-ID: <20230720071430.259892-4-victor.liu@nxp.com>
References: <20230720071430.259892-1-victor.liu@nxp.com>
In-Reply-To: <20230720071430.259892-1-victor.liu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
x-mailer: git-send-email 2.37.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AM9PR04MB8415:EE_
x-ms-office365-filtering-correlation-id: 38b87bdf-7560-45bd-0121-08db88f058d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NU8uMLmZsB09bW1pL6ggEe+w516rajxzxPFu9DV8IklCoedasObbZBVjfaVaFDqSxyQcBqNpfC3tUXz5yT5fGmcW2cnZcjGLpKoL66AT8sjuk9exldIo9H97n5B0Wr91b0exQYsUizT/upvYX/7HKXMokmMqzmkA4uRckkdFABFYw95abFLLck2y8v6YH7XPxMlhdIamdcV+JcxvkUu5xB4wJGCYrKsTyTAgZxH0HzspspUfS/QRuxXtRVyCFdZWQzLRQL9DLiYNWaVWz1C3ZupXRXpwvLwqefw78E8fsZj3gl2zBZ2BzVMpZ8CxYxM0CqLllb33N9vnoXDarpjGcqrUt6eptqyHeug2Vm1q/xrLN5REHqQd2i099ysUq8E5V91H6bO8frml1j+WHsb6e+qY3gO/8GCmmOe+JkcD/c5z33l62JG4eQ3M83VinyEUUcw5mMfsOys1eQRFahyJ+NQlT35Xh1I9qfIB0XvPY/kHfEgVZ8cHr8QgEXthhGwqQLNNg3JAVsHe+0gUef0W3Nz9SE8R/kAm0fu4lpIboF9utahTNPrghw7m2FNgsynvS3FV/zc7nq7xz5C/ZSPvNgsNRJ9kdKtN4AILd22Ql258ktXIWtFgsXU4jHpgISLs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199021)(6506007)(478600001)(1076003)(26005)(6486002)(52116002)(2906002)(6512007)(71200400001)(4326008)(5660300002)(66556008)(316002)(66946007)(66476007)(66446008)(54906003)(110136005)(64756008)(38350700002)(36756003)(38100700002)(7416002)(8936002)(8676002)(86362001)(186003)(2616005)(41300700001)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zIHFoBxf8NMFAXTa5Z1RM9pBGdHvLPb0yeF2O4p3ST/Pi9Xc+L2ORWRuhp?=
 =?iso-8859-1?Q?NpILRfDlFzuvhUEbBRSjdTGYI5HvyQp3w1hckEUfiVIvhcvLcix1ozzMnX?=
 =?iso-8859-1?Q?KnDHT/r81qv+gvnjKrHA8fpyBFh2yxbelo7JlPMNV2vcKkwT/IjyZbgtCx?=
 =?iso-8859-1?Q?UjVbXtv3t8Jj+cjFI7neHNO+YaZpyvrNDRmim5VQOEqBwAP43hwDLwHVMs?=
 =?iso-8859-1?Q?uIkhnh1z1Q9y7dEP7JxNb3hTWiGTmTiI08NhMzL6UOiS6nmN9YNgn3JStE?=
 =?iso-8859-1?Q?fjLeq6SKEnx5pj0Dd1jC5C0ryTlFhEi3vVy5hjoAJ+dvW2foEsZyZoL8FD?=
 =?iso-8859-1?Q?6SiUmgtWoN2vQzx0B+JsNxwWhK4uQGxaeeBYpTwYGtIHbRJ4W6kvjIzqyr?=
 =?iso-8859-1?Q?mmgMAx2izMkvHtvYlefZekGNx3C/8bev1CfID9NIfx1ODijXGg292gQBKd?=
 =?iso-8859-1?Q?daUgyRonReKhPwwej5p032nCWFVVJWD1T3guFLIwQzGTMHtcEdUI0zmEBv?=
 =?iso-8859-1?Q?CG3i7ToxRatALmUszRl50l4BiXw4Cgf6EHkeZ3kDC6wgzQ9MJiOKHDxdeg?=
 =?iso-8859-1?Q?2wSr5GQX/N9vvs5QpEhN/u+SheGgXQdDQk+AV4gL91y1REE7g20WO+RHL7?=
 =?iso-8859-1?Q?bdfF/uydqDjn5UtlrdpWA6IY5acAXDL5OGippJTI23h9rlvBsHUmp+3nL0?=
 =?iso-8859-1?Q?gOUnzNgcH6wXOpon2N1HR9viWZEKqiai7XyORcvrtdcGjn7nGnvAfEMC5W?=
 =?iso-8859-1?Q?NI4mIK2+IGUSc0DuPNX+MuCPYs3HAE56uLanWBqLFegJBnsQF1yyt6b5T4?=
 =?iso-8859-1?Q?x1YXuSrjUlok/udBHt6MUOca8TEy7YXcgt8iQij/4rlE8Vbbkuwek9EcUg?=
 =?iso-8859-1?Q?saKLnvG6Zyna3+oiiK8cuJx1Dv45k0PKRAYQ7jxvxBQ0hYbkjvgTPRtBQa?=
 =?iso-8859-1?Q?O53w6JkEEBSdwI28eQOxqytscaC0KaFpuYeYiq+t1l57SOVDzTgrHM6nG9?=
 =?iso-8859-1?Q?7a04z7vaBAkejNzFGNR9AwDy5H5AdAZCQ3WH5zld/jB0A8kuOoqj+Dq5xW?=
 =?iso-8859-1?Q?9bGYnlE1K9ZB9OIR/1O1ohEyPtU7nSWiOORaM3UwawT1FrLNDkO6rUK0iQ?=
 =?iso-8859-1?Q?DUDMerQK3BraOY9mHgvReaLECjUtgskLpyIUHVgOQXp4Qnv2CeR30Qzapj?=
 =?iso-8859-1?Q?CXiBPLf6y/98RBE390Masc4PElLrlVZPp4bNjiKKc37btaUB+moQ/rNpcg?=
 =?iso-8859-1?Q?E1/t8TKrNdImk20vbcs++4WZmU52rZIpkahwNITNQ44KyBumo/urCesoAY?=
 =?iso-8859-1?Q?cbvfT9wkZdthyan62Ue6UTsa6vMfaEG8/coRYaSzMh1Id6Ez4FYlrvagWm?=
 =?iso-8859-1?Q?+rEBwCWs4R/GzqUzokMse1h0b+TEyuyPa9K9ruK8S8f/rj25cZ2Hgoy/Ip?=
 =?iso-8859-1?Q?Lt04Q3miI1E5SZqjvkYmIO3itAwee8qrcuJjL/2cuUNCZ2MaadcLSI3gzG?=
 =?iso-8859-1?Q?CR23Pmgj6y6PWgMCYBwQ2EzVxS2j9K10nyHvMceP66DDJzEYkWORpB2PWl?=
 =?iso-8859-1?Q?imE/Zr8XyG/9XhRXY7z4FGyX5kOL6A42Y02Uley9399QI+8UZ1Y4rcMraF?=
 =?iso-8859-1?Q?7cn36mSWOdcEBjaSfAnxhA9uN458qgmQT7?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b87bdf-7560-45bd-0121-08db88f058d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 07:10:06.6794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uaFbzr3wEexWGxkY1BKL9COdyLd9Uo5TUYHJovibrOApMaDek8AqKpG/hocgohmSU3EfLysonS92BD/VSmUfOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8415
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 dl-linux-imx <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DATAEN_ACTIVE_LOW bit in DSI_DPI_CFG_POL register is set to zero,
so set the DRM_BUS_FLAG_DE_HIGH flag in input_bus_cfg.flags.  It appears
that the DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE flag also makes sense, so
set it in input_bus_cfg.flags too.  With this patch, the flags set by
drm_atomic_bridge_propagate_bus_flags() are overridden (see comment in
that function) in case any downstream bridges propagates invalid flags
to this bridge.  A real problematic case is to connect a RM67191 MIPI
DSI panel whose driver sets DRM_BUS_FLAG_DE_LOW and
DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE bus flags.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* No change.

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/dr=
m/bridge/synopsys/dw-mipi-dsi.c
index 8580b8a97fb1..8cd89a63b5f2 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -23,6 +23,7 @@
 #include <drm/bridge/dw_mipi_dsi.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
@@ -565,6 +566,17 @@ dw_mipi_dsi_bridge_atomic_get_input_bus_fmts(struct dr=
m_bridge *bridge,
 	return input_fmts;
 }
=20
+static int dw_mipi_dsi_bridge_atomic_check(struct drm_bridge *bridge,
+					   struct drm_bridge_state *bridge_state,
+					   struct drm_crtc_state *crtc_state,
+					   struct drm_connector_state *conn_state)
+{
+	bridge_state->input_bus_cfg.flags =3D
+		DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE;
+
+	return 0;
+}
+
 static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
 {
 	u32 val;
@@ -1033,6 +1045,7 @@ static const struct drm_bridge_funcs dw_mipi_dsi_brid=
ge_funcs =3D {
 	.atomic_duplicate_state	=3D drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	=3D drm_atomic_helper_bridge_destroy_state,
 	.atomic_get_input_bus_fmts =3D dw_mipi_dsi_bridge_atomic_get_input_bus_fm=
ts,
+	.atomic_check		=3D dw_mipi_dsi_bridge_atomic_check,
 	.atomic_reset		=3D drm_atomic_helper_bridge_reset,
 	.atomic_enable		=3D dw_mipi_dsi_bridge_atomic_enable,
 	.atomic_post_disable	=3D dw_mipi_dsi_bridge_post_atomic_disable,
--=20
2.37.1

