Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D82442DF790
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 02:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE386E424;
	Mon, 21 Dec 2020 01:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A27D6E425
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 01:57:46 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5D40122D;
 Mon, 21 Dec 2020 02:57:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608515863;
 bh=8VTe1QFjN/ZJNFZT8J9ROum+pNATiu0frxwtIj4+iMc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tWQMA9jidTCfAj25cSuTueW0+ttvpUkps0eSeJzCx0ssNfDuk39DUXjBd7YamsR37
 Juw/vUQgRyAPvva85XN3CkSKcTSjRwiBC4OsSmW8/ymgBHhqhr8ISCvC99M9iJ6YK5
 wChn/DcPLjo8DjwupLUFw5EQG/V8QPt4jnS/bYu0=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm: rcar-du: cmm: Provide 3D-CLU support
Date: Mon, 21 Dec 2020 03:57:28 +0200
Message-Id: <20201221015730.28333-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The CMM module provides a three-dimensional cubic look up table that
converts three-color-component data into desired three color components
by use of a lookup table.

While the 1D-LUT can only control each of three color components
separately, the 3D-CLU can be used for specific color adjustment.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_cmm.c | 52 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/rcar-du/rcar_cmm.h | 11 ++++---
 2 files changed, 57 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.c b/drivers/gpu/drm/rcar-du/rcar_cmm.c
index ccc8c8b03bac..9a20728a3534 100644
--- a/drivers/gpu/drm/rcar-du/rcar_cmm.c
+++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
@@ -17,9 +17,18 @@
 
 #define CM2_LUT_CTRL		0x0000
 #define CM2_LUT_CTRL_LUT_EN	BIT(0)
+
+#define CM2_CLU_CTRL		0x0100
+#define CM2_CLU_CTRL_CLU_EN	BIT(1)
+#define CM2_CLU_CTRL_MVS	BIT(24)
+#define CM2_CLU_CTRL_AAI	BIT(28)
+
 #define CM2_LUT_TBL_BASE	0x0600
 #define CM2_LUT_TBL(__i)	(CM2_LUT_TBL_BASE + (__i) * 4)
 
+#define CM2_CLU_ADDR		0x0a00
+#define CM2_CLU_DATA		0x0a04
+
 struct rcar_cmm {
 	void __iomem *base;
 
@@ -30,6 +39,10 @@ struct rcar_cmm {
 	struct {
 		bool enabled;
 	} lut;
+
+	struct {
+		bool enabled;
+	} clu;
 };
 
 static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
@@ -72,13 +85,44 @@ static void rcar_cmm_lut_configure(struct rcar_cmm *rcmm,
 	}
 }
 
+static void rcar_cmm_clu_configure(struct rcar_cmm *rcmm,
+				   const struct drm_color_lut *table)
+{
+	static const u32 cfg = CM2_CLU_CTRL_AAI
+			     | CM2_CLU_CTRL_MVS
+			     | CM2_CLU_CTRL_CLU_EN;
+	bool enable = !!table;
+
+	if (rcmm->clu.enabled != enable) {
+		rcar_cmm_write(rcmm, CM2_CLU_CTRL, enable ? cfg : 0);
+		rcmm->clu.enabled = enable;
+	}
+
+	if (table) {
+		unsigned int i;
+
+		/* Utilise CM2_CLU_CTRL_AAI (auto-increment). */
+		rcar_cmm_write(rcmm, CM2_CLU_ADDR, 0);
+
+		for (i = 0; i < CM2_CLU_SIZE; ++i) {
+			const struct drm_color_lut *lut = &table[i];
+
+			u32 entry = drm_color_lut_extract(lut->red, 8) << 16
+				  | drm_color_lut_extract(lut->green, 8) << 8
+				  | drm_color_lut_extract(lut->blue, 8);
+
+			rcar_cmm_write(rcmm, CM2_CLU_DATA, entry);
+		}
+	}
+}
+
 /*
  * rcar_cmm_setup() - Configure the CMM unit
  * @pdev: The platform device associated with the CMM instance
  * @config: The CMM unit configuration
  *
- * Configure the CMM unit with the given configuration. Currently enabling,
- * disabling and programming of the 1-D LUT unit is supported.
+ * Configure the CMM unit with the given configuration, handling both the
+ * 1-D LUT and the 3-D CLU.
  *
  * As rcar_cmm_setup() accesses the CMM registers the unit should be powered
  * and its functional clock enabled. To guarantee this, before any call to
@@ -96,6 +140,9 @@ int rcar_cmm_setup(struct platform_device *pdev,
 	if (config->lut.update)
 		rcar_cmm_lut_configure(rcmm, config->lut.table);
 
+	if (config->clu.update)
+		rcar_cmm_clu_configure(rcmm, config->clu.table);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(rcar_cmm_setup);
@@ -140,6 +187,7 @@ void rcar_cmm_disable(struct platform_device *pdev)
 	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
 
 	rcar_cmm_lut_configure(rcmm, NULL);
+	rcar_cmm_clu_configure(rcmm, NULL);
 
 	pm_runtime_put(&pdev->dev);
 }
diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.h b/drivers/gpu/drm/rcar-du/rcar_cmm.h
index f4b16535ec16..35f901158cec 100644
--- a/drivers/gpu/drm/rcar-du/rcar_cmm.h
+++ b/drivers/gpu/drm/rcar-du/rcar_cmm.h
@@ -9,14 +9,15 @@
 #define __RCAR_CMM_H__
 
 #define CM2_LUT_SIZE		256
+#define CM2_CLU_SIZE		(17 * 17 * 17)
 
 struct drm_color_lut;
 struct platform_device;
 
 /**
- * struct rcar_cmm_table_config - CMM LUT configuration
- * @update: When true, update the LUT configuration.
- * @table: Table data. The LUT is enabled if non-NULL, and disabled
+ * struct rcar_cmm_table_config - CMM LUT and CLU configuration
+ * @update: When true, update the LUT or CLU configuration.
+ * @table: Table data. The LUT or CLU is enabled if non-NULL, and disabled
  *	otherwise. The value is ignored if @update is false.
  */
 struct rcar_cmm_table_config {
@@ -26,10 +27,12 @@ struct rcar_cmm_table_config {
 
 /**
  * struct rcar_cmm_config - CMM configuration
- * @lut: 1D-LUT configuration
+ * @lut: 1D LUT configuration
+ * @clu: 3D (cubic) LUT configuration
  */
 struct rcar_cmm_config {
 	struct rcar_cmm_table_config lut;
+	struct rcar_cmm_table_config clu;
 };
 
 #if IS_ENABLED(CONFIG_DRM_RCAR_CMM)
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
