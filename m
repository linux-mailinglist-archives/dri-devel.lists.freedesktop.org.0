Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49D0A71988
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 15:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3882C10E6E6;
	Wed, 26 Mar 2025 14:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="iy/0ZHUr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2721B10E6E6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 14:58:02 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52QEvg4a2121276
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Mar 2025 09:57:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1743001062;
 bh=GfhSg6qVkETDxCNGmSrbqBIilQIXNt9F+nz+qWrxwJw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=iy/0ZHUr6WaSgCdOTAJd1gGTe7deSB9DBV5PSX0JqSsfrHSebUCohNKKRRCCM/E4D
 yiTmm6b3V3rR2Hz5kNIG2dvtMB4qh+Yl2s0Gd/FA087RMMvzNLmiN9j2c8FnbsahAw
 PUMlKksOVo+sCpL/MbfNdsNp1i7D6xwbfQTaDob0=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52QEvg71020899
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Mar 2025 09:57:42 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Mar 2025 09:57:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Mar 2025 09:57:41 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52QEveFG072385;
 Wed, 26 Mar 2025 09:57:41 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>,
 <s-jain1@ti.com>, <r-donadkar@ti.com>, <j-choudhary@ti.com>,
 <h-shenoy@ti.com>, <devarsht@ti.com>
Subject: [PATCH v4 3/3] drm/tidss: Add support for AM62L display subsystem
Date: Wed, 26 Mar 2025 20:27:36 +0530
Message-ID: <20250326145736.3659670-4-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20250326145736.3659670-1-devarsht@ti.com>
References: <20250326145736.3659670-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Enable display for AM62L DSS [1] which supports only a single display
pipeline using a single overlay manager, single video port and a single
video lite pipeline which does not support scaling.

The output of video port is routed to SoC boundary via DPI interface and
the DPI signals from the video port are also routed to DSI Tx controller
present within the SoC.

[1]: Section 11.7 (Display Subsystem and Peripherals)
Link : https://www.ti.com/lit/pdf/sprujb4

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V4:
- Rebase on top of previous patch to use vid_info structure

V3: 
- Rebase on top of
  0002-drm-tidss-Update-infra-to-support-DSS7-cut-down-vers.patch
- Use the generic "tidss_am65x_common_regs" as common reg space
  instead of creating a new one

V2: 
- Add separate common reg space for AM62L
- Add separate irq enable/disable/read/clear helpers for AM62L
- Use separate helper function for setting overlay attributes
- Drop Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  due to additional changes made in V2.
 
 drivers/gpu/drm/tidss/tidss_dispc.c | 41 +++++++++++++++++++++++++++++
 drivers/gpu/drm/tidss/tidss_dispc.h |  2 ++
 drivers/gpu/drm/tidss/tidss_drv.c   |  1 +
 3 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 6f0255d65a06..4420eb15e8ed 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -440,6 +440,42 @@ const struct dispc_features dispc_am62a7_feats = {
 	.vid_order = {1, 0},
 };
 
+const struct dispc_features dispc_am62l_feats = {
+	.max_pclk_khz = {
+		[DISPC_VP_DPI] = 165000,
+	},
+
+	.subrev = DISPC_AM62L,
+
+	.common = "common",
+	.common_regs = tidss_am65x_common_regs,
+
+	.num_vps = 1,
+	.vp_name = { "vp1" },
+	.ovr_name = { "ovr1" },
+	.vpclk_name =  { "vp1" },
+	.vp_bus_type = { DISPC_VP_DPI },
+
+	.vp_feat = { .color = {
+			.has_ctm = true,
+			.gamma_size = 256,
+			.gamma_type = TIDSS_GAMMA_8BIT,
+		},
+	},
+
+	.num_vids = 1,
+
+	.vid_info = {
+		{
+			.name = "vidl1",
+			.is_lite = true,
+			.hw_id = 1,
+		}
+	},
+
+	.vid_order = {0},
+};
+
 static const u16 *dispc_common_regmap;
 
 struct dss_vp_data {
@@ -944,6 +980,7 @@ dispc_irq_t dispc_read_and_clear_irqstatus(struct dispc_device *dispc)
 		return dispc_k2g_read_and_clear_irqstatus(dispc);
 	case DISPC_AM625:
 	case DISPC_AM62A7:
+	case DISPC_AM62L:
 	case DISPC_AM65X:
 	case DISPC_J721E:
 		return dispc_k3_read_and_clear_irqstatus(dispc);
@@ -961,6 +998,7 @@ void dispc_set_irqenable(struct dispc_device *dispc, dispc_irq_t mask)
 		break;
 	case DISPC_AM625:
 	case DISPC_AM62A7:
+	case DISPC_AM62L:
 	case DISPC_AM65X:
 	case DISPC_J721E:
 		dispc_k3_set_irqenable(dispc, mask);
@@ -1453,6 +1491,7 @@ void dispc_ovr_set_plane(struct dispc_device *dispc, u32 hw_plane,
 		break;
 	case DISPC_AM625:
 	case DISPC_AM62A7:
+	case DISPC_AM62L:
 	case DISPC_AM65X:
 		dispc_am65x_ovr_set_plane(dispc, hw_plane, hw_videoport,
 					  x, y, layer);
@@ -2373,6 +2412,7 @@ static void dispc_plane_init(struct dispc_device *dispc)
 		break;
 	case DISPC_AM625:
 	case DISPC_AM62A7:
+	case DISPC_AM62L:
 	case DISPC_AM65X:
 	case DISPC_J721E:
 		dispc_k3_plane_init(dispc);
@@ -2481,6 +2521,7 @@ static void dispc_vp_write_gamma_table(struct dispc_device *dispc,
 		break;
 	case DISPC_AM625:
 	case DISPC_AM62A7:
+	case DISPC_AM62L:
 	case DISPC_AM65X:
 		dispc_am65x_vp_write_gamma_table(dispc, hw_videoport);
 		break;
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 72a0146e57d5..28958514b8f5 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -67,6 +67,7 @@ enum dispc_vp_bus_type {
 enum dispc_dss_subrevision {
 	DISPC_K2G,
 	DISPC_AM625,
+	DISPC_AM62L,
 	DISPC_AM62A7,
 	DISPC_AM65X,
 	DISPC_J721E,
@@ -96,6 +97,7 @@ struct dispc_features {
 extern const struct dispc_features dispc_k2g_feats;
 extern const struct dispc_features dispc_am625_feats;
 extern const struct dispc_features dispc_am62a7_feats;
+extern const struct dispc_features dispc_am62l_feats;
 extern const struct dispc_features dispc_am65x_feats;
 extern const struct dispc_features dispc_j721e_feats;
 
diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index d4652e8cc28c..f2a4f659f574 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -242,6 +242,7 @@ static const struct of_device_id tidss_of_table[] = {
 	{ .compatible = "ti,k2g-dss", .data = &dispc_k2g_feats, },
 	{ .compatible = "ti,am625-dss", .data = &dispc_am625_feats, },
 	{ .compatible = "ti,am62a7-dss", .data = &dispc_am62a7_feats, },
+	{ .compatible = "ti,am62l-dss", .data = &dispc_am62l_feats, },
 	{ .compatible = "ti,am65x-dss", .data = &dispc_am65x_feats, },
 	{ .compatible = "ti,j721e-dss", .data = &dispc_j721e_feats, },
 	{ }
-- 
2.39.1

