Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000E2242899
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 13:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDD26E8D4;
	Wed, 12 Aug 2020 11:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3E06E8D4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 11:26:36 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07CBQWle100715;
 Wed, 12 Aug 2020 06:26:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1597231592;
 bh=f4RHJ14Y3f32Gu3AdhDDlCKoLvZ47K8+yr0QHoJy0ys=;
 h=From:To:CC:Subject:Date;
 b=sKY2mwM23XTrG2kjLRhUjbbQ3QY9GH2smUtIjjS2jrLvblDpfegGOi6mrCwlMjEh7
 Y1GBANumXE49aiq9bA/s3DCn9NLPR08Hd/oDdPiNvEUiQh0oVQsNteOga5LJQdVF1J
 yMeBAZ3zxwE/inmTuHP8HWtQzM5vU7VXYA1G8iV4=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07CBQWj9040861;
 Wed, 12 Aug 2020 06:26:32 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 12
 Aug 2020 06:26:31 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 12 Aug 2020 06:26:31 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07CBQUoe039710;
 Wed, 12 Aug 2020 06:26:30 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Jyri Sarha <jsarha@ti.com>, Jan Kiszka
 <jan.kiszka@siemens.com>
Subject: [PATCH] drm/tidss: implement WA for AM65xx erratum i2000
Date: Wed, 12 Aug 2020 14:26:25 +0300
Message-ID: <20200812112625.59897-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch implements WA for AM65xx erratum i2000, which causes YUV
formats to show wrong colors.

An earlier patch removed a partial WA:

a8d9d7da1546349f18eb2d6b6b3a04bdeb38719d ("drm/tidss: remove AM65x PG1 YUV erratum code")

The patch explains the reasoning for removal. The change in plans has
been that it has become clear that there are and will be users for PG1
SoCs and as such it's good to implement the WA for PG1s.

This patch adds the WA back so that it is only used on SR1.0 (which is
the new name for PG1). The previous WA code didn't check the SoC
revision, which this patch does.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 32 +++++++++++++++++++++++++----
 drivers/gpu/drm/tidss/tidss_dispc.h |  4 ++++
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 629dd06393f6..a3e8caf319bb 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -19,6 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/sys_soc.h>
 
 #include <drm/drm_fourcc.h>
 #include <drm/drm_fb_cma_helper.h>
@@ -302,6 +303,8 @@ struct dispc_device {
 	u32 num_fourccs;
 
 	u32 memory_bandwidth_limit;
+
+	struct dispc_errata errata;
 };
 
 static void dispc_write(struct dispc_device *dispc, u16 reg, u32 val)
@@ -2641,6 +2644,19 @@ static int dispc_init_am65x_oldi_io_ctrl(struct device *dev,
 	return 0;
 }
 
+static void dispc_init_errata(struct dispc_device *dispc)
+{
+	static const struct soc_device_attribute am65x_sr10_soc_devices[] = {
+		{ .family = "AM65X", .revision = "SR1.0" },
+		{ /* sentinel */ }
+	};
+
+	if (soc_device_match(am65x_sr10_soc_devices)) {
+		dispc->errata.i2000 = true;
+		dev_info(dispc->dev, "WA for erratum i2000: YUV formats disabled\n");
+	}
+}
+
 int dispc_init(struct tidss_device *tidss)
 {
 	struct device *dev = tidss->dev;
@@ -2664,19 +2680,27 @@ int dispc_init(struct tidss_device *tidss)
 	if (!dispc)
 		return -ENOMEM;
 
+	dispc->tidss = tidss;
+	dispc->dev = dev;
+	dispc->feat = feat;
+
+	dispc_init_errata(dispc);
+
 	dispc->fourccs = devm_kcalloc(dev, ARRAY_SIZE(dispc_color_formats),
 				      sizeof(*dispc->fourccs), GFP_KERNEL);
 	if (!dispc->fourccs)
 		return -ENOMEM;
 
 	num_fourccs = 0;
-	for (i = 0; i < ARRAY_SIZE(dispc_color_formats); ++i)
+	for (i = 0; i < ARRAY_SIZE(dispc_color_formats); ++i) {
+		if (dispc->errata.i2000 &&
+		    dispc_fourcc_is_yuv(dispc_color_formats[i].fourcc)) {
+			continue;
+		}
 		dispc->fourccs[num_fourccs++] = dispc_color_formats[i].fourcc;
+	}
 
 	dispc->num_fourccs = num_fourccs;
-	dispc->tidss = tidss;
-	dispc->dev = dev;
-	dispc->feat = feat;
 
 	dispc_common_regmap = dispc->feat->common_regs;
 
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 902e612ff7ac..353972fe658a 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -46,6 +46,10 @@ struct dispc_features_scaling {
 	u32 xinc_max;
 };
 
+struct dispc_errata {
+	bool i2000; /* DSS Does Not Support YUV Pixel Data Formats */
+};
+
 enum dispc_vp_bus_type {
 	DISPC_VP_DPI,		/* DPI output */
 	DISPC_VP_OLDI,		/* OLDI (LVDS) output */
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
