Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AB9A26C0E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 07:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3714C10E24C;
	Tue,  4 Feb 2025 06:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="vi5oLJ/m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCFA10E24E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 06:16:26 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5146FvJp3098781
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Feb 2025 00:15:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1738649757;
 bh=g5d8aE1nDLHr7EeHiYmJyvXsAqsd0Ff1S8A44q8pBrM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=vi5oLJ/mVraxsAFez5y8IpVzSOtfUYcMZn89na5EQIlXNGW/Wy7wnErBIXnnZ6MQu
 COrR+cI/6lOhbcmdm+7l3w12Wc7fadjfR21UwnCnV15WVsYlmDvBG57RVWGk3Eq7/r
 IyO6r1b61/5L1fRc9rM6bt/Rp4qeTmNrbKoB4JEg=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5146FvvR113134
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 4 Feb 2025 00:15:57 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 00:15:56 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 00:15:56 -0600
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5146FtKo075258;
 Tue, 4 Feb 2025 00:15:56 -0600
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
Subject: [PATCH v2 2/2] drm/tidss: Add support for AM62L display subsystem
Date: Tue, 4 Feb 2025 11:45:52 +0530
Message-ID: <20250204061552.3720261-3-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20250204061552.3720261-1-devarsht@ti.com>
References: <20250204061552.3720261-1-devarsht@ti.com>
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

Use separate register space for AM62L since the DISPC_VID* regions for the
first and only video lite pipeline start from a different offset than other
existing K3 SoCs.

Use separate helper functions for enabling/disabling video pipeline
interrupts and reading/clearing video pipeline interrupts since AM62L has a
different start bit position for controlling these interrupts in context of
first and only video lite pipeline compared to other existing K3 SoCs.

Also use separate function to set overlay attributes for AM62L as
input channel value needs to be mandatorily set as 1 for the first
and only video lite pipeline for this SoC.

[1]: Section 11.7 (Display Subsystem and Peripherals)
Link : https://www.ti.com/lit/pdf/sprujb4

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V2:
- Add separate common reg space for AM62L
- Add separate irq enable/disable/read/clear helpers for AM62L
- Use separate helper function for setting overlay attributes
- Drop Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  due to additional changes made in V2.
- Rangediff:
  https://gist.github.com/devarsht/11d47f25ca9fea6976e6284330ddf443

 drivers/gpu/drm/tidss/tidss_dispc.c | 140 ++++++++++++++++++++++++++++
 drivers/gpu/drm/tidss/tidss_dispc.h |   2 +
 drivers/gpu/drm/tidss/tidss_drv.c   |   1 +
 3 files changed, 143 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index cacb5f3d8085..7a1f70f0e9cc 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -136,6 +136,29 @@ static const u16 tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
 	[DISPC_SECURE_DISABLE_OFF] =		0xac,
 };
 
+static const u16 tidss_am62l_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
+	[DSS_REVISION_OFF] =			0x4,
+	[DSS_SYSCONFIG_OFF] =			0x8,
+	[DSS_SYSSTATUS_OFF] =			0x20,
+	[DISPC_IRQ_EOI_OFF] =			0x24,
+	[DISPC_IRQSTATUS_RAW_OFF] =		0x28,
+	[DISPC_IRQSTATUS_OFF] =			0x2c,
+	[DISPC_IRQENABLE_SET_OFF] =		0x30,
+	[DISPC_IRQENABLE_CLR_OFF] =		0x40,
+	[DISPC_VID_IRQENABLE_OFF] =		0x48,
+	[DISPC_VID_IRQSTATUS_OFF] =		0x5c,
+	[DISPC_VP_IRQENABLE_OFF] =		0x70,
+	[DISPC_VP_IRQSTATUS_OFF] =		0x7c,
+
+	[DISPC_GLOBAL_MFLAG_ATTRIBUTE_OFF] =	0x90,
+	[DISPC_GLOBAL_OUTPUT_ENABLE_OFF] =	0x94,
+	[DSS_CBA_CFG_OFF] =			0x9c,
+	[DISPC_DBG_CONTROL_OFF] =		0xa0,
+	[DISPC_DBG_STATUS_OFF] =		0xa4,
+	[DISPC_CLKGATING_DISABLE_OFF] =		0xa8,
+	[DISPC_SECURE_DISABLE_OFF] =		0xac,
+};
+
 const struct dispc_features dispc_am65x_feats = {
 	.max_pclk_khz = {
 		[DISPC_VP_DPI] = 165000,
@@ -376,6 +399,35 @@ const struct dispc_features dispc_am62a7_feats = {
 	.vid_order = { 1, 0 },
 };
 
+const struct dispc_features dispc_am62l_feats = {
+	.max_pclk_khz = {
+		[DISPC_VP_DPI] = 165000,
+	},
+
+	.subrev = DISPC_AM62L,
+
+	.common = "common",
+	.common_regs = tidss_am62l_common_regs,
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
+	.num_planes = 1,
+	.vid_name = { "vidl1" },
+	.vid_lite = { true },
+	.vid_order = { 0 },
+};
+
 static const u16 *dispc_common_regmap;
 
 struct dss_vp_data {
@@ -800,6 +852,40 @@ void dispc_k3_clear_irqstatus(struct dispc_device *dispc, dispc_irq_t clearmask)
 	dispc_read(dispc, DISPC_IRQSTATUS);
 }
 
+static
+void dispc_am62l_clear_irqstatus(struct dispc_device *dispc, dispc_irq_t clearmask)
+{
+	u32 top_clear = 0;
+
+	if (clearmask & DSS_IRQ_VP_MASK(0)) {
+		dispc_k3_vp_write_irqstatus(dispc, 0, clearmask);
+		top_clear |= BIT(0);
+	}
+
+	if (clearmask & DSS_IRQ_PLANE_MASK(0)) {
+		dispc_k3_vid_write_irqstatus(dispc, 0, clearmask);
+		top_clear |= BIT(5);
+	}
+
+	dispc_write(dispc, DISPC_IRQSTATUS, top_clear);
+
+	/* Flush posted writes */
+	dispc_read(dispc, DISPC_IRQSTATUS);
+}
+
+static
+dispc_irq_t dispc_am62l_read_and_clear_irqstatus(struct dispc_device *dispc)
+{
+	dispc_irq_t status = 0;
+
+	status |= dispc_k3_vp_read_irqstatus(dispc, 0);
+	status |= dispc_k3_vid_read_irqstatus(dispc, 0);
+
+	dispc_am62l_clear_irqstatus(dispc, status);
+
+	return status;
+}
+
 static
 dispc_irq_t dispc_k3_read_and_clear_irqstatus(struct dispc_device *dispc)
 {
@@ -831,6 +917,39 @@ static dispc_irq_t dispc_k3_read_irqenable(struct dispc_device *dispc)
 	return enable;
 }
 
+static void dispc_am62l_set_irqenable(struct dispc_device *dispc,
+				      dispc_irq_t mask)
+{
+	u32 main_enable = 0, main_disable = 0;
+	dispc_irq_t old_mask;
+
+	old_mask = dispc_k3_read_irqenable(dispc);
+
+	/* clear the irqstatus for newly enabled irqs */
+	dispc_am62l_clear_irqstatus(dispc, (old_mask ^ mask) & mask);
+
+	dispc_k3_vp_set_irqenable(dispc, 0, mask);
+	if (mask & DSS_IRQ_VP_MASK(0))
+		main_enable |= BIT(0);		/* VP IRQ */
+	else
+		main_disable |= BIT(0);		/* VP IRQ */
+
+	dispc_k3_vid_set_irqenable(dispc, 0, mask);
+	if (mask & DSS_IRQ_PLANE_MASK(0))
+		main_enable |= BIT(5);	/* VIDL IRQ */
+	else
+		main_disable |= BIT(5);	/* VIDL IRQ */
+
+	if (main_enable)
+		dispc_write(dispc, DISPC_IRQENABLE_SET, main_enable);
+
+	if (main_disable)
+		dispc_write(dispc, DISPC_IRQENABLE_CLR, main_disable);
+
+	/* Flush posted writes */
+	dispc_read(dispc, DISPC_IRQENABLE_SET);
+}
+
 static void dispc_k3_set_irqenable(struct dispc_device *dispc,
 				   dispc_irq_t mask)
 {
@@ -879,6 +998,8 @@ dispc_irq_t dispc_read_and_clear_irqstatus(struct dispc_device *dispc)
 		return dispc_k2g_read_and_clear_irqstatus(dispc);
 	case DISPC_AM625:
 	case DISPC_AM62A7:
+	case DISPC_AM62L:
+		return dispc_am62l_read_and_clear_irqstatus(dispc);
 	case DISPC_AM65X:
 	case DISPC_J721E:
 		return dispc_k3_read_and_clear_irqstatus(dispc);
@@ -896,6 +1017,9 @@ void dispc_set_irqenable(struct dispc_device *dispc, dispc_irq_t mask)
 		break;
 	case DISPC_AM625:
 	case DISPC_AM62A7:
+	case DISPC_AM62L:
+		dispc_am62l_set_irqenable(dispc, mask);
+		break;
 	case DISPC_AM65X:
 	case DISPC_J721E:
 		dispc_k3_set_irqenable(dispc, mask);
@@ -1354,6 +1478,17 @@ static void dispc_k2g_ovr_set_plane(struct dispc_device *dispc,
 			x | (y << 16));
 }
 
+static void dispc_am62l_ovr_set_plane(struct dispc_device *dispc,
+				      u32 x, u32 y)
+{
+	OVR_REG_FLD_MOD(dispc, 0, DISPC_OVR_ATTRIBUTES(0),
+			1, 4, 1);
+	OVR_REG_FLD_MOD(dispc, 0, DISPC_OVR_ATTRIBUTES(0),
+			x, 17, 6);
+	OVR_REG_FLD_MOD(dispc, 0, DISPC_OVR_ATTRIBUTES(0),
+			y, 30, 19);
+}
+
 static void dispc_am65x_ovr_set_plane(struct dispc_device *dispc,
 				      u32 hw_plane, u32 hw_videoport,
 				      u32 x, u32 y, u32 layer)
@@ -1388,6 +1523,9 @@ void dispc_ovr_set_plane(struct dispc_device *dispc, u32 hw_plane,
 		break;
 	case DISPC_AM625:
 	case DISPC_AM62A7:
+	case DISPC_AM62L:
+		dispc_am62l_ovr_set_plane(dispc, x, y);
+		break;
 	case DISPC_AM65X:
 		dispc_am65x_ovr_set_plane(dispc, hw_plane, hw_videoport,
 					  x, y, layer);
@@ -2308,6 +2446,7 @@ static void dispc_plane_init(struct dispc_device *dispc)
 		break;
 	case DISPC_AM625:
 	case DISPC_AM62A7:
+	case DISPC_AM62L:
 	case DISPC_AM65X:
 	case DISPC_J721E:
 		dispc_k3_plane_init(dispc);
@@ -2416,6 +2555,7 @@ static void dispc_vp_write_gamma_table(struct dispc_device *dispc,
 		break;
 	case DISPC_AM625:
 	case DISPC_AM62A7:
+	case DISPC_AM62L:
 	case DISPC_AM65X:
 		dispc_am65x_vp_write_gamma_table(dispc, hw_videoport);
 		break;
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 086327d51a90..275de8d02b75 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -62,6 +62,7 @@ enum dispc_dss_subrevision {
 	DISPC_K2G,
 	DISPC_AM625,
 	DISPC_AM62A7,
+	DISPC_AM62L,
 	DISPC_AM65X,
 	DISPC_J721E,
 };
@@ -91,6 +92,7 @@ struct dispc_features {
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

