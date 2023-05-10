Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FAB6FDA92
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 11:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADBE10E46E;
	Wed, 10 May 2023 09:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2070.outbound.protection.outlook.com [40.107.8.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0638E10E46E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 09:21:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HfwlASVG4rMVmX2qy8dLXdRSiQ/Qs6pJVeGwOg5XfqEsOK07u7Zik6Yb5T0OSSWBBS3XuwVi1gXOzR8UnNZLC8M4e3rkF6Sa/wvxsyqNvdanoN8Bf5/HA/o8shha3FwWTO8T5mEx3+ISwD6NYeVwUUS1yINTgYSp9ciR66rYSG3nSV+KwvmXhgTAFtPD279VZpiyJssHB6Gp91Jtd//iYS8ZLzs9HbH3sR+yxLLTPMr6ACCJKZ6t2WEdaw/XEZyQVFfuUKhrYLvY6cMNJ8gWO/imuk2+/y2bwD+YtBQ93Y3CXtxHd3hzkUPx3ihqbSUNLXQpB24/stwEiAsCnW6/xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4tdz8bCm6649ewUxnSzx9oakx3CTF4tl82AyCa2nlH4=;
 b=iccVhCP3QAUvDZxLZ0QLfzE1OM6pioMGJAgINICcWWAWmafDLfb6wBqDBuBHTtrGUnxxrieEAlsEoM4g7GtBBSl0rLrN0XfIYbzOQXwaqFCDNP3HP+taOd8U300QsX/84HMV5IxdEurLvB0kZsUTbsDKMzMsaj9yltLRDk51ML8W0uYgoNk4x39ZuOoP8jSSFEEH8PWkiGB3iTyURs99HEQs3TAhRZN/l5eBH/HN3/nco755ZcAWTvo1nzljZHfdjRNPrbJVwzZmKpRgQkAFaWYO7SZFFH+kD3sHAsUIJy8ih3nsnduFp60Y9W5D0JLDd2aMqxa7Wzf4IPj4GtVmLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tdz8bCm6649ewUxnSzx9oakx3CTF4tl82AyCa2nlH4=;
 b=QBb9Sz7vq0X4Sz1adiN2eXyXjH/NFqJlTtBmGSGodJgmT21rN5ZPkVRJyl5cVjYvfs8sOmd7T0ivRboEDq0ygm0qFGWYw7V9sTLvJFwhm64eN1KRD2xpC5RI+s03KH/hOCA7Ib5IpDNMcJP3W0SqwbDpZoRupWE1umm5XSt/24s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8161.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Wed, 10 May
 2023 09:20:57 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d%4]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 09:20:57 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 4/6] drm: lcdif: Check consistent bus format and flags
 across first bridges
Date: Wed, 10 May 2023 17:24:48 +0800
Message-Id: <20230510092450.4024730-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230510092450.4024730-1-victor.liu@nxp.com>
References: <20230510092450.4024730-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: 71cfaa8b-20ae-4b08-8d86-08db5137dc77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A6wccTu5FdjNThWEf2uwXZHoADVYWKixS2aaEOR2i3laQVFF8D1GXVMJhgy6KLY0BoUAYN35Wfpxeumsitvfm93tETCtLG5tVozBZhSJaFvTTHMW6J4i46yI1JZ983ipY2cMXzFCaAkFXTLyBNSAO9QsBdeTg66IQf9I33u/5HeItSAasyKtkE9LgG3OB2/b3m9b4pPmOFFDix026E/YkZnsOUl4l2CB5vP3bydVJdMWIKCYyztpkrGrOHwuYceTN70SQEXVdU8vHjPSSPZCHpjJbeBV8I9lErKaQD9014mOEmV+N29GfyTIz3dJVFbkh8YsOEd9VyZiVr9Ry36628pZ+Cbgi4ryUugZDPb9DSjrS3EmlH2+ot2teP/2PGzrI7GhdJadvrFuJNLPvEf45645empH/BHQm9tWXv8a+ay0vsrzVxMWTD7C0jx6gr8Cs/uUSkv180W3DLSNd7DEwNiQdHdUeP7m1SvxJy8y52uCD8ChGB+t1Di7F1ZR2ETnCQ2ZPH0ewFjjeuEzQemTkcoZZ4GTUDtFsqColWn+uypN1QtqhGxqTpDHk9vv39pGUoRJzN3Kc4M8lu5qDGKKYMhtYq+oFbbsd/mO3DKOhbP6L0hvHoIr0zz+h65N9F9T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(66946007)(66476007)(66556008)(83380400001)(2616005)(38100700002)(38350700002)(86362001)(6666004)(52116002)(6486002)(1076003)(186003)(36756003)(26005)(6512007)(478600001)(6506007)(2906002)(316002)(4326008)(8936002)(8676002)(7416002)(41300700001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G/3fQaU/SNU1x2nUqb9boH1g7D08Zudhdgiz5BrLnbRSMpT6hP0lVXGq+Q0p?=
 =?us-ascii?Q?vVm/LWQ0aNRV5quEdMtFXycdKk6sH9H0pbn3/HWP0zk+0BNw9gvAuXe36XoO?=
 =?us-ascii?Q?sHrHoDufufSw22Yat2qgBMTMJnYGufFJ88RISQ9eMuVyYJxOpWwIsRhlo1CA?=
 =?us-ascii?Q?5tAQtCDI7LAdgNN6WDaLT3WqQ/Oh3VT3Q441OYdaMgtoPksKhLIEPMuLg8uj?=
 =?us-ascii?Q?KvBkpAhXTjmQj/K4/4NDTpaPY9fMaaNWGxb23vHuqkcMW+kjcVuOF+k6+vwY?=
 =?us-ascii?Q?fKrw+lTGp1giCln7dv/1oWE/HRS+XaJHyaui1LeP53BtSoieb3eTJebXSWJT?=
 =?us-ascii?Q?x6/xiHtyajNZWhcHIrsZCXmhL1PHN9ikI0YkaL6xl6xcnyI/rkLoKVZGEi2j?=
 =?us-ascii?Q?ShPc4A2RkexIlK1N8xoOp+4LDSnEYsbY1kwXOwNfK66S45lrStRyiB78IuZb?=
 =?us-ascii?Q?R4GyFp5KiLAfT9rcDzO9HZYStfnrmssjQ+tToma20wBuc+A6cAFPTriiTjOK?=
 =?us-ascii?Q?Pbu4RTuiGpRtopFENKEPCu8VgChaGqkEnX96cu5mX0kwQIV6r3E6m7NVlfBN?=
 =?us-ascii?Q?cV9rDpaadbWleDzgUdDJF7uRKpxQKQlRqCd+3XQBuG5RvJ+LUXuGHzdsyz19?=
 =?us-ascii?Q?QMyIi9dKTvhH+5iJAp0SKiHzPdISU0/psZO11D3vgMjVeZFlFXb60sPX5QHQ?=
 =?us-ascii?Q?Jm1yuoKOHsE8RhTlWswWtZaSi5T3nGT+K8VQ8ZT03h4XWjGjlWVBin8dE1Dp?=
 =?us-ascii?Q?dSJti2PnosJnBKifQq+hEHBVIp3dQuwfqXp8mf2enk3JVbbIN0yvu5yrRLXe?=
 =?us-ascii?Q?DO/MGgVghqlvqlwmAOQScxHu9OsPEYp3S4CSbv2t6gad6dmyjj1Guhqk6gqi?=
 =?us-ascii?Q?xjfNwW3uVUNL/9FGdtrLP4G9w9zwKAArnTZ9o4y2NqVHqTN2yHXXWrLZ70ZN?=
 =?us-ascii?Q?p7g2NVkwJqx4h1q+we3hE45DR1PijaOCV32eZ+4S+RMccBInTlMSS6WwPldc?=
 =?us-ascii?Q?8wgrZrwFPAL80Zr8E5w/gFWQRcXunvVcApWEyD4yUKqLYFydzposTJzbeRZO?=
 =?us-ascii?Q?Oq9o5BIMv2CujDr4qAW1V03OeF4qb7mbzj9sXeTNYxe53zqhmv+BYioPibNG?=
 =?us-ascii?Q?sENuZhefozELzqoQHFo6A4o+eGy2agS4Zpbz6RgyPHwBFeeRT+pVQWvuV9/H?=
 =?us-ascii?Q?r1+2AKgi5l+WZKNJyRlpX+cwt9c9FEIVrlqyySjlHJ09sr/bNvuGKmXcZiW/?=
 =?us-ascii?Q?Hl2NIBpS0//lv7zdvbqsxZG4V33LNauwojqOjpf/+ARNj8A26B1RTyVUhKUH?=
 =?us-ascii?Q?FSuXfthQARZo3RZxFWpZSuNomJy8NRHWMRlkYr1hU9JpSN3ZivjvTKY+so3l?=
 =?us-ascii?Q?eN91KQSH4IYJFFfdZn3im8PJkFHsfYLQ42f3uJ7CDIlCO/U3TfDbOCbmlb8S?=
 =?us-ascii?Q?n/mEse4AeiXaXVZqPkNvMUTZ45Sl9R84fZ3BF1AO5WgjUCuijqFGSYqA6l5S?=
 =?us-ascii?Q?4SUqKUtJss+6rf+9R1mPo38nhVR7ZzxdlKkDAclnPHXOeUxiLQtUmkAgRnT5?=
 =?us-ascii?Q?ti0SCeQ2XiPighSw8PLw78YYXU0l5b3vPmB9F/5/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71cfaa8b-20ae-4b08-8d86-08db5137dc77
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 09:20:56.9839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8o1PKs7TVZECRuR+NrM1CveP1ZlELMSJdzhTSJgJZTtbhyJNtceS7p7FdEXU9cPIKyB3imCU/ii661RmvpcpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8161
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
Cc: marex@denx.de, conor+dt@kernel.org, alexander.stein@ew.tq-group.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 kernel@pengutronix.de, LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The single LCDIF embedded in i.MX93 SoC may drive multiple displays
simultaneously.  Check bus format and flags across first bridges in
->atomic_check() to ensure they are consistent.  This is a preparation
for adding i.MX93 LCDIF support.

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5->v6:
* Add Marek's R-b.
* A slight change brought from the update in patch 2/6 to keep default
  MEDIA_BUS_FMT_RGB888_1X24 bus format.

v4->v5:
* Add Alexander's A-b and T-b tags.

v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* Split from patch 2/2 in v1. (Marek, Alexander)
* Drop a comment about bridge input bus format from lcdif_crtc_atomic_check().

 drivers/gpu/drm/mxsfb/lcdif_drv.c |  2 -
 drivers/gpu/drm/mxsfb/lcdif_drv.h |  1 -
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 82 ++++++++++++++++++++++---------
 3 files changed, 58 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 6fb5b469ee5a..e816f87828fb 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -52,8 +52,6 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 	if (ret)
 		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
 
-	lcdif->bridge = bridge;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.h b/drivers/gpu/drm/mxsfb/lcdif_drv.h
index 6cdba6e20c02..aa6d099a1897 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.h
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.h
@@ -31,7 +31,6 @@ struct lcdif_drm_private {
 	} planes;
 	struct drm_crtc			crtc;
 	struct drm_encoder		encoder;
-	struct drm_bridge		*bridge;
 };
 
 static inline struct lcdif_drm_private *
diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index fab2253e4786..e13382beb53e 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -17,6 +17,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_color_mgmt.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_dma_helper.h>
@@ -424,15 +425,19 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
 	struct drm_device *drm = crtc->dev;
-	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(drm);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
 	struct lcdif_crtc_state *lcdif_crtc_state = to_lcdif_crtc_state(crtc_state);
 	bool has_primary = crtc_state->plane_mask &
 			   drm_plane_mask(crtc->primary);
+	struct drm_connector_state *connector_state;
+	struct drm_connector *connector;
+	struct drm_encoder *encoder;
 	struct drm_bridge_state *bridge_state;
-	struct drm_bridge *bridge = lcdif->bridge;
-	int ret;
+	struct drm_bridge *bridge;
+	u32 bus_format, bus_flags;
+	bool format_set = false, flags_set = false;
+	int ret, i;
 
 	/* The primary plane has to be enabled when the CRTC is active. */
 	if (crtc_state->active && !has_primary)
@@ -442,29 +447,58 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
-	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
-	if (!bridge_state)
-		lcdif_crtc_state->bus_format = MEDIA_BUS_FMT_FIXED;
-	else
-		lcdif_crtc_state->bus_format = bridge_state->input_bus_cfg.format;
-
-	if (lcdif_crtc_state->bus_format == MEDIA_BUS_FMT_FIXED) {
-		dev_warn_once(drm->dev,
-			      "Bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
-			      "Please fix bridge driver by handling atomic_get_input_bus_fmts.\n");
-		lcdif_crtc_state->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
-	} else if (!lcdif_crtc_state->bus_format) {
-		/* If all else fails, default to RGB888_1X24 */
-		lcdif_crtc_state->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	/* Try to find consistent bus format and flags across first bridges. */
+	for_each_new_connector_in_state(state, connector, connector_state, i) {
+		if (!connector_state->crtc)
+			continue;
+
+		encoder = connector_state->best_encoder;
+
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+		if (!bridge)
+			continue;
+
+		bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+		if (!bridge_state)
+			bus_format = MEDIA_BUS_FMT_FIXED;
+		else
+			bus_format = bridge_state->input_bus_cfg.format;
+
+		if (bus_format == MEDIA_BUS_FMT_FIXED) {
+			dev_warn(drm->dev,
+				 "[ENCODER:%d:%s]'s bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
+				 "Please fix bridge driver by handling atomic_get_input_bus_fmts.\n",
+				 encoder->base.id, encoder->name);
+			bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+		} else if (!bus_format) {
+			/* If all else fails, default to RGB888_1X24 */
+			bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+		}
+
+		if (!format_set) {
+			lcdif_crtc_state->bus_format = bus_format;
+			format_set = true;
+		} else if (lcdif_crtc_state->bus_format != bus_format) {
+			DRM_DEV_DEBUG_DRIVER(drm->dev, "inconsistent bus format\n");
+			return -EINVAL;
+		}
+
+		if (bridge->timings)
+			bus_flags = bridge->timings->input_bus_flags;
+		else if (bridge_state)
+			bus_flags = bridge_state->input_bus_cfg.flags;
+		else
+			bus_flags = 0;
+
+		if (!flags_set) {
+			lcdif_crtc_state->bus_flags = bus_flags;
+			flags_set = true;
+		} else if (lcdif_crtc_state->bus_flags != bus_flags) {
+			DRM_DEV_DEBUG_DRIVER(drm->dev, "inconsistent bus flags\n");
+			return -EINVAL;
+		}
 	}
 
-	if (bridge->timings)
-		lcdif_crtc_state->bus_flags = bridge->timings->input_bus_flags;
-	else if (bridge_state)
-		lcdif_crtc_state->bus_flags = bridge_state->input_bus_cfg.flags;
-	else
-		lcdif_crtc_state->bus_flags = 0;
-
 	return 0;
 }
 
-- 
2.37.1

