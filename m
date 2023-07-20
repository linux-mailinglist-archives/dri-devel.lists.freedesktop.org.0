Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCD675A75C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 09:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F79B10E566;
	Thu, 20 Jul 2023 07:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2080.outbound.protection.outlook.com [40.107.20.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BC210E566
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 07:10:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNsWqJwxWee8xnskP6wVIhjsF66ck4dOMLRagBRiyign4lnfniSSWOfpmpFsK5KjVcRue+cXC/d1exIKYRRJwsqnSMCaVCDa8m4Ha+IMUtaf8a2IOb/luVEL2m6/763N9gVaZzV7B5OWcUJvz4AOI1Anm1XjqtZgXn+o0NRabhue6rYA8+uusv+HjV0aVLpYYGB5bZdRLqnxZEbMaCl0EcZV2yxe16MqqCDgZZs6mrirzxtdfsjQWXfI8qKdIvHKoEmEPAL/UwoKdDf8oh3gG0Ldk31W9uVDpFXwPSL1F7q/x7VPRgYYrK3Vsjyh9JXtrB/J9cREsNDwvlujyt1xrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4O0fgjP1+XKJcTTF0Uohkbnc2npkwLKZrcddxbnMKSU=;
 b=UwreG5/oFNhQojIWRvi56x1+cRqG+ylVeLB8GXlhjwq4FVSKjVjPrJbnoX+/oHNvPmEdXRPYkVcB2sD5SOogZHyLas62g+h/8CHV4lx0XGwfq5gWRHRsFUJsdIjUvveR/JCXllry22aJRejuUS61ylMXJfpgQ9DOskvUH4X6EfBzzm47WqEJ4z2HnB+Z9MgwmYm/rQH9O2COwVBWgXA2u+hWhuKT5L+fnu5TIhFfcLtUlKCW7RAgFHFfUsK+E1lQtMO0txBKHxRx1FtljugExsKsPvTKg3tnxjZpHxhZII3Soy4ClwhtRZP2+ijtMO1TBEeBUL8n5QfpXWBS3tdS7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4O0fgjP1+XKJcTTF0Uohkbnc2npkwLKZrcddxbnMKSU=;
 b=l+QHuwzWdIRPH7VdWGLK/ADyubl2SYYWLGaIdnooIOqv1Un9+/knREKb4XuRTG7g4eoS/AuuE68sy0tLJPJXyMwtZ5GAPF5RTWMCnFmwZo4WJi12JsdXob5wHVKAJY5AfhAGnE0jhDzE03W7C25L2CUCAjF6gW7DYckSMONnRbE=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PR3PR04MB7243.eurprd04.prod.outlook.com (2603:10a6:102:8c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 07:10:00 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6609.022; Thu, 20 Jul 2023
 07:10:00 +0000
From: Ying Liu <victor.liu@nxp.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 2/9] drm/bridge: synopsys: dw-mipi-dsi: Add input bus
 format negotiation support
Thread-Topic: [PATCH v2 2/9] drm/bridge: synopsys: dw-mipi-dsi: Add input bus
 format negotiation support
Thread-Index: Adm62TK6XpKEKypROket2EgKxcczbA==
Date: Thu, 20 Jul 2023 07:10:00 +0000
Message-ID: <20230720071430.259892-3-victor.liu@nxp.com>
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
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|PR3PR04MB7243:EE_
x-ms-office365-filtering-correlation-id: 5cc9c64a-1982-4f21-4236-08db88f0553d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dpFrMVXkh1c7AeWdiBq1kcuSA2ZOhfIbYPWO1gEuM1Z/JcdCjpCf34QFkxUm3i4zUWguh2JMQl61IVvoMIQ662eT45RrxhAUzVevRTa3B46Y+fL4trSzkIv8BVXOn7W5eHhywWH6Jfwu/g0w3ZuR3wqh1F8URKArF3CwPsk80QTe5V4Efod1ayVg1uXGZl5buMGSUBQHKbyYLtG//lXwP9E2jQAuto0ZPzffFZ8kXagj3RaRb3gj/cT7tdZMAvlRpwgFdMcQpHMjb/kcO9ufkNkIMuVsQo7lQQ1p6jM0vtsxEM1U2Z8CIE16lDgXFfEglGQXamrvsD34Xe/vF7lE8dBXzZUaaOIVGjmNmZic32A8YEd26Dy83KWPJEErFqNVBaU868YLQ0RI3qjoHaaJm1sLJrEpVn5UwwmUuuIoA9P4JZH5BDFRoF1xC+D+Bg6W1N8olsmw6A7kHaLpXfqCnT4x5l+Rk33OiCKIsha88m8FsnZ3Q9+mlbfSLTUHlq3GoM3X7YXIznz3baDROCgwITM5P4jZe4Ro6/ZRqZuL1SUkYXv/Ku+2DqvkEzJ6MDtOGh/vleRd1oNt1QGl7Z3bY/BI/AWv8FvTiwlOsXZRGqvm1hEfThkXne+x+ulH4I9i
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199021)(41300700001)(6506007)(1076003)(186003)(26005)(478600001)(4326008)(66446008)(66476007)(66946007)(66556008)(64756008)(71200400001)(316002)(8676002)(8936002)(7416002)(110136005)(5660300002)(6512007)(6486002)(52116002)(54906003)(2616005)(2906002)(38350700002)(38100700002)(122000001)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?P+08aTGrXDowKeq1wOcus7TshnUVUE4zKG5u7Pzt2XmuKXxSt3sSnpXeAk?=
 =?iso-8859-1?Q?hpgFJ/qhKfDUb2JygLrwqeIGAoNf2h3idSV9zRzDvJo2EVYI6zfaffv0c1?=
 =?iso-8859-1?Q?m9idHxQwmsV01jDVCFN7MwwaJd62XdexOjYV+lM8CtV/7oVLOuHAExcfpW?=
 =?iso-8859-1?Q?ZdpShln13PfmtLCnrIJBUus0Zr5eTOWysgjPrBfL5M96DKxIrUJ6VUC93E?=
 =?iso-8859-1?Q?jHvkq9OCyH+1ogTAOo1+OctqqdOucd0Z+2KpuUDWOtlarD0j1th1eCyrmz?=
 =?iso-8859-1?Q?QJucNJjGfGoCm3iiTwQhhj6Fh5PdqCJpzT2t2IC9QS6ZRR10onhxUPFwcE?=
 =?iso-8859-1?Q?GPb1eSDMAYNc12W+tzMgOH4uqTXiB5xIAsLRwyeEg0mVdWOMvAMHmILydz?=
 =?iso-8859-1?Q?irqMEs5JgQeOLD1lfLGi1LsutENqtTaJOWUdGG9sLcyUvJiwYuGoaKkJnX?=
 =?iso-8859-1?Q?eKna78HYvwC/Sx/h8JGl1f60hnKlDIRGD6GCeCy/YtB4w2yWZmV4hpPaup?=
 =?iso-8859-1?Q?ghBJ9zL0nFjOfoJWaMJCJhaHqhPtxhsSVHno5ltYHELz0jPoLyAvbmqlj4?=
 =?iso-8859-1?Q?IYiJTueen4K+Buc6sQ1tdVvZ4EtKP8H/SrY97HF1OOFcuqsEkiI9+PnOMk?=
 =?iso-8859-1?Q?IGdU0cpsbjrI+A+g8xomFuQSfltPEQJoyVLBoQ/BUkaRetfJupkIytgdYc?=
 =?iso-8859-1?Q?lb5TUD51DPrzdiwy+/8rsRBOVdR5vzrxnZWtzEZod3AtwcGLvT+drsTlQh?=
 =?iso-8859-1?Q?2gNwVUyi2OH7gNz259dw4EOkSQODeXcLzIQnu0iT5ILuY/36Is8KNp/Nrv?=
 =?iso-8859-1?Q?fhWmY0bIJTATserdNbc+S7PdqTl1lAHlTkrGD+iblAv0htSarIwDc7cNPf?=
 =?iso-8859-1?Q?6/BQnvjh0F2wDXPmcW0xSu/AL6FTCtV1gxMVeNyuDWvVH7L0kThXcn3Dhm?=
 =?iso-8859-1?Q?EOAmk71SF+1Nr7AMMg4RXWCcDpFQmWIpHeAM3I2WUiDCxSEsEM44J/9Vjg?=
 =?iso-8859-1?Q?TPzvPskQdbPRZDxMzj9mnHlBqY9KSY7gbCAq1nt0x2T2z0jf3/KseSZ63N?=
 =?iso-8859-1?Q?VZoK2bK2O9WOHlmNyPO4JOUFoJwofVJ+LG8M/w7QOcgmsFP3IqWQhpkZ0F?=
 =?iso-8859-1?Q?soMthflzhtHvSJGwWs/KZ9yHsLYuyq6yDgv//FbtkEbfT4RmQc/6Iwmy84?=
 =?iso-8859-1?Q?XbjBxIkYssY/pvcHzljeWrYEmzrMyv6ySzBTwySiwYv2mcb8/ilBCHHInK?=
 =?iso-8859-1?Q?0V3DSd5+Cd441vZPJ1mFacLlne/rn0ktsuUof5dJV1w7vzaA70mX2xALFF?=
 =?iso-8859-1?Q?WpFVJ8FX8lZSPXZye6FOgKuI1jeBULHUnvPoETIz95tAkIFfXJGm212uzs?=
 =?iso-8859-1?Q?O3dE6ux5/PuO9j1sljjUvd9ejCByjoa7C1eJXPcVPizjjYu0ZMB316pzY9?=
 =?iso-8859-1?Q?TEp1kmpe9hIgllWVVTd+13I9bjUTdYt1BVXgICO7VLaiPg36nPXjIg5uog?=
 =?iso-8859-1?Q?nBYETAK8RFmWoAG6MxHHB3hYyvgCy0WlAW3doa6P+J22DK2Yhhjh1qUAXP?=
 =?iso-8859-1?Q?SwVOCgtVr6iqJNP/DWN8wFBaOvFwaaOHShrPvXPqUL9VLH8j1uOUTwzbxU?=
 =?iso-8859-1?Q?TEPsVQVZW2uQN0FrcJnZMk3mMPduBffJD/?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc9c64a-1982-4f21-4236-08db88f0553d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 07:10:00.6324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6wfHRU9e/JdiH/hO7Hxh6YP2a6U0JvnVtc0mxvQ0jl5cffBJvCKAnprnhSFtyPR3MAnqfnP27tGv31Dc7Mz4bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7243
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

Introduce ->get_input_bus_fmts() callback to struct dw_mipi_dsi_plat_data
so that vendor drivers can implement specific methods to get input bus
formats for Synopsys DW MIPI DSI.

While at it, implement a generic callback for ->atomic_get_input_bus_fmts()=
,
where we try to get the input bus formats through pdata->get_input_bus_fmts=
()
first.  If it's unavailable, fall back to the only format - MEDIA_BUS_FMT_F=
IXED,
which matches the default behavior if ->atomic_get_input_bus_fmts() is not
implemented as ->atomic_get_input_bus_fmts()'s kerneldoc indicates.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* No change.

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 30 +++++++++++++++++++
 include/drm/bridge/dw_mipi_dsi.h              | 11 +++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/dr=
m/bridge/synopsys/dw-mipi-dsi.c
index 57eae0fdd970..8580b8a97fb1 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -12,6 +12,7 @@
 #include <linux/component.h>
 #include <linux/debugfs.h>
 #include <linux/iopoll.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
@@ -536,6 +537,34 @@ static const struct mipi_dsi_host_ops dw_mipi_dsi_host=
_ops =3D {
 	.transfer =3D dw_mipi_dsi_host_transfer,
 };
=20
+static u32 *
+dw_mipi_dsi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					     struct drm_bridge_state *bridge_state,
+					     struct drm_crtc_state *crtc_state,
+					     struct drm_connector_state *conn_state,
+					     u32 output_fmt,
+					     unsigned int *num_input_fmts)
+{
+	struct dw_mipi_dsi *dsi =3D bridge_to_dsi(bridge);
+	const struct dw_mipi_dsi_plat_data *pdata =3D dsi->plat_data;
+	u32 *input_fmts;
+
+	if (pdata->get_input_bus_fmts)
+		return pdata->get_input_bus_fmts(pdata->priv_data,
+						 bridge, bridge_state,
+						 crtc_state, conn_state,
+						 output_fmt, num_input_fmts);
+
+	/* Fall back to MEDIA_BUS_FMT_FIXED as the only input format. */
+	input_fmts =3D kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+	input_fmts[0] =3D MEDIA_BUS_FMT_FIXED;
+	*num_input_fmts =3D 1;
+
+	return input_fmts;
+}
+
 static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
 {
 	u32 val;
@@ -1003,6 +1032,7 @@ static int dw_mipi_dsi_bridge_attach(struct drm_bridg=
e *bridge,
 static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs =3D {
 	.atomic_duplicate_state	=3D drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	=3D drm_atomic_helper_bridge_destroy_state,
+	.atomic_get_input_bus_fmts =3D dw_mipi_dsi_bridge_atomic_get_input_bus_fm=
ts,
 	.atomic_reset		=3D drm_atomic_helper_bridge_reset,
 	.atomic_enable		=3D dw_mipi_dsi_bridge_atomic_enable,
 	.atomic_post_disable	=3D dw_mipi_dsi_bridge_post_atomic_disable,
diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_=
dsi.h
index f54621b17a69..246650f2814f 100644
--- a/include/drm/bridge/dw_mipi_dsi.h
+++ b/include/drm/bridge/dw_mipi_dsi.h
@@ -11,7 +11,10 @@
=20
 #include <linux/types.h>
=20
+#include <drm/drm_atomic.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_modes.h>
=20
 struct drm_display_mode;
@@ -56,6 +59,14 @@ struct dw_mipi_dsi_plat_data {
 					   unsigned long mode_flags,
 					   u32 lanes, u32 format);
=20
+	u32 *(*get_input_bus_fmts)(void *priv_data,
+				   struct drm_bridge *bridge,
+				   struct drm_bridge_state *bridge_state,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state,
+				   u32 output_fmt,
+				   unsigned int *num_input_fmts);
+
 	const struct dw_mipi_dsi_phy_ops *phy_ops;
 	const struct dw_mipi_dsi_host_ops *host_ops;
=20
--=20
2.37.1

