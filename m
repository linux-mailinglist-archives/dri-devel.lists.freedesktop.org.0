Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA438A6C24
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA10112C78;
	Tue, 16 Apr 2024 13:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8lkq6pQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE961112C78
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713273798; x=1744809798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k5Nn7Y4N70IBHfvjePbQAdSnnRPjeh5RJru6z4W6u6g=;
 b=h8lkq6pQhVDZMysSEcYdPlcnUW4r/wTSpACucJxozQo1J8AICXgZ8f3d
 EXbGhlxRer6V558FcOU/GDcv9aokxg7ncMq5teiM+6PVh2ychK5Wta2Ug
 fx59VlZyfnr1Kx2txU2n89yj4wEncM2vNmTwd6yCycjDXpLlJbEmMFEED
 boEH2a8UchJepwr+0Oe1VUtuqZdqL0fPbpTFGmEdIpZqC9+ji0PgCpLhS
 fOuDrkHKgWFPNuYpO0JpNMWJKhPjqlfHZT6XdeqavI8+7VG3w8qUowoov
 b5JqTqfB76kXUQ+myC3H7anKIY4KcOGH+SlbZKqSe0yjzPdxQzrMmaK1p w==;
X-CSE-ConnectionGUID: zEoMfKdZQ4egjP7cbM7CUg==
X-CSE-MsgGUID: uW/2nxCUSdyVcDt+uI2e4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20131338"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="20131338"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:18 -0700
X-CSE-ConnectionGUID: 6m5C/fn+Rjyku3AFuaXfyw==
X-CSE-MsgGUID: bUhSljnzRgu7Q6liMxZhrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="27055383"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 08/15] drm/bridge: anx7625: use struct drm_edid more
Date: Tue, 16 Apr 2024 16:22:22 +0300
Message-Id: <7b0c0a010bd7c450e648865e85e9c238f65ef138.1713273659.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713273659.git.jani.nikula@intel.com>
References: <cover.1713273659.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
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

Prefer struct drm_edid based functions over struct edid.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 26 +++++++++++++++--------
 drivers/gpu/drm/bridge/analogix/anx7625.h | 10 ++-------
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 9d96d28d6fe8..efee71a450f3 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -464,9 +464,11 @@ static int anx7625_odfc_config(struct anx7625_data *ctx,
  */
 static int anx7625_set_k_value(struct anx7625_data *ctx)
 {
-	struct edid *edid = (struct edid *)ctx->slimport_edid_p.edid_raw_data;
+	struct drm_edid_product_id id;
 
-	if (edid->mfg_id[0] == IVO_MID0 && edid->mfg_id[1] == IVO_MID1)
+	drm_edid_get_product_id(ctx->cached_drm_edid, &id);
+
+	if (be16_to_cpu(id.manufacturer_name) == IVO_MID)
 		return anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
 					 MIPI_DIGITAL_ADJ_1, 0x3B);
 
@@ -1526,7 +1528,8 @@ static int anx7625_wait_hpd_asserted(struct drm_dp_aux *aux,
 
 static void anx7625_remove_edid(struct anx7625_data *ctx)
 {
-	ctx->slimport_edid_p.edid_block_num = -1;
+	drm_edid_free(ctx->cached_drm_edid);
+	ctx->cached_drm_edid = NULL;
 }
 
 static void anx7625_dp_adjust_swing(struct anx7625_data *ctx)
@@ -1787,27 +1790,32 @@ static ssize_t anx7625_aux_transfer(struct drm_dp_aux *aux,
 static const struct drm_edid *anx7625_edid_read(struct anx7625_data *ctx)
 {
 	struct device *dev = ctx->dev;
-	struct s_edid_data *p_edid = &ctx->slimport_edid_p;
+	u8 *edid_buf;
 	int edid_num;
 
-	if (ctx->slimport_edid_p.edid_block_num > 0)
+	if (ctx->cached_drm_edid)
 		goto out;
 
+	edid_buf = kmalloc(FOUR_BLOCK_SIZE, GFP_KERNEL);
+	if (!edid_buf)
+		return NULL;
+
 	pm_runtime_get_sync(dev);
 	_anx7625_hpd_polling(ctx, 5000 * 100);
-	edid_num = sp_tx_edid_read(ctx, p_edid->edid_raw_data);
+	edid_num = sp_tx_edid_read(ctx, edid_buf);
 	pm_runtime_put_sync(dev);
 
 	if (edid_num < 1) {
 		DRM_DEV_ERROR(dev, "Fail to read EDID: %d\n", edid_num);
+		kfree(edid_buf);
 		return NULL;
 	}
 
-	p_edid->edid_block_num = edid_num;
+	ctx->cached_drm_edid = drm_edid_alloc(edid_buf, FOUR_BLOCK_SIZE);
+	kfree(edid_buf);
 
 out:
-	return drm_edid_alloc(ctx->slimport_edid_p.edid_raw_data,
-			      FOUR_BLOCK_SIZE);
+	return drm_edid_dup(ctx->cached_drm_edid);
 }
 
 static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 39ed35d33836..eb5580f1ab2f 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -286,8 +286,7 @@
 
 #define  MIPI_LANE_CTRL_10               0x0F
 #define  MIPI_DIGITAL_ADJ_1     0x1B
-#define  IVO_MID0               0x26
-#define  IVO_MID1               0xCF
+#define  IVO_MID                0x26CF
 
 #define  MIPI_PLL_M_NUM_23_16   0x1E
 #define  MIPI_PLL_M_NUM_15_8    0x1F
@@ -417,11 +416,6 @@ enum audio_wd_len {
 #define EDID_TRY_CNT	3
 #define SUPPORT_PIXEL_CLOCK	300000
 
-struct s_edid_data {
-	int edid_block_num;
-	u8 edid_raw_data[FOUR_BLOCK_SIZE];
-};
-
 /***************** Display End *****************/
 
 #define MAX_LANES_SUPPORT	4
@@ -466,7 +460,7 @@ struct anx7625_data {
 	struct anx7625_i2c_client i2c;
 	struct i2c_client *last_client;
 	struct timer_list hdcp_timer;
-	struct s_edid_data slimport_edid_p;
+	const struct drm_edid *cached_drm_edid;
 	struct device *codec_dev;
 	hdmi_codec_plugged_cb plugged_cb;
 	struct work_struct work;
-- 
2.39.2

