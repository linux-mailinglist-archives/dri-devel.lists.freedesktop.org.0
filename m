Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 193C794D761
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 21:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909F110E9F4;
	Fri,  9 Aug 2024 19:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="f3kf7JZJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com
 [95.215.58.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0736810E9F3
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 19:36:33 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1723232191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=quWhlQYCIJ5ooa/bXKzdLXD7dpTxps6C7G+W1eMFLO4=;
 b=f3kf7JZJNh6Fj4JJy6FTYFDxCEI0GxTlAZ/XgHhmyY469GU9Fa9Kxc2vKWS9LzrO9L8cVO
 Gyhyk6A9CygsqE87pZiFGtuyEByOh6FlToyB90i9ztVFOofgV376THJ5qiOUN79NhAEaYV
 VDzJCItHhhndgHAbOEsZQPL2z1W8dsw=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 David Airlie <airlied@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v6 6/8] drm: zynqmp_dp: Split off several helper functions
Date: Fri,  9 Aug 2024 15:35:58 -0400
Message-Id: <20240809193600.3360015-7-sean.anderson@linux.dev>
In-Reply-To: <20240809193600.3360015-1-sean.anderson@linux.dev>
References: <20240809193600.3360015-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

In preparation for supporting compliance testing, split off several
helper functions. No functional change intended.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---

(no changes since v1)

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 49 ++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index babfa3581014..e0ab3b3e8580 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -636,6 +636,7 @@ static void zynqmp_dp_adjust_train(struct zynqmp_dp *dp,
 /**
  * zynqmp_dp_update_vs_emph - Update the training values
  * @dp: DisplayPort IP core structure
+ * @train_set: A set of training values
  *
  * Update the training values based on the request from sink. The mapped values
  * are predefined, and values(vs, pe, pc) are from the device manual.
@@ -643,12 +644,12 @@ static void zynqmp_dp_adjust_train(struct zynqmp_dp *dp,
  * Return: 0 if vs and emph are updated successfully, or the error code returned
  * by drm_dp_dpcd_write().
  */
-static int zynqmp_dp_update_vs_emph(struct zynqmp_dp *dp)
+static int zynqmp_dp_update_vs_emph(struct zynqmp_dp *dp, u8 *train_set)
 {
 	unsigned int i;
 	int ret;
 
-	ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, dp->train_set,
+	ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, train_set,
 				dp->mode.lane_cnt);
 	if (ret < 0)
 		return ret;
@@ -656,7 +657,7 @@ static int zynqmp_dp_update_vs_emph(struct zynqmp_dp *dp)
 	for (i = 0; i < dp->mode.lane_cnt; i++) {
 		u32 reg = ZYNQMP_DP_SUB_TX_PHY_PRECURSOR_LANE_0 + i * 4;
 		union phy_configure_opts opts = { 0 };
-		u8 train = dp->train_set[i];
+		u8 train = train_set[i];
 
 		opts.dp.voltage[0] = (train & DP_TRAIN_VOLTAGE_SWING_MASK)
 				   >> DP_TRAIN_VOLTAGE_SWING_SHIFT;
@@ -700,7 +701,7 @@ static int zynqmp_dp_link_train_cr(struct zynqmp_dp *dp)
 	 * So, This loop should exit before 512 iterations
 	 */
 	for (max_tries = 0; max_tries < 512; max_tries++) {
-		ret = zynqmp_dp_update_vs_emph(dp);
+		ret = zynqmp_dp_update_vs_emph(dp, dp->train_set);
 		if (ret)
 			return ret;
 
@@ -765,7 +766,7 @@ static int zynqmp_dp_link_train_ce(struct zynqmp_dp *dp)
 		return ret;
 
 	for (tries = 0; tries < DP_MAX_TRAINING_TRIES; tries++) {
-		ret = zynqmp_dp_update_vs_emph(dp);
+		ret = zynqmp_dp_update_vs_emph(dp, dp->train_set);
 		if (ret)
 			return ret;
 
@@ -788,28 +789,29 @@ static int zynqmp_dp_link_train_ce(struct zynqmp_dp *dp)
 }
 
 /**
- * zynqmp_dp_train - Train the link
+ * zynqmp_dp_setup() - Set up major link parameters
  * @dp: DisplayPort IP core structure
+ * @bw_code: The link bandwidth as a multiple of 270 MHz
+ * @lane_cnt: The number of lanes to use
+ * @enhanced: Use enhanced framing
+ * @downspread: Enable spread-spectrum clocking
  *
- * Return: 0 if all trains are done successfully, or corresponding error code.
+ * Return: 0 on success, or -errno on failure
  */
-static int zynqmp_dp_train(struct zynqmp_dp *dp)
+static int zynqmp_dp_setup(struct zynqmp_dp *dp, u8 bw_code, u8 lane_cnt,
+			   bool enhanced, bool downspread)
 {
 	u32 reg;
-	u8 bw_code = dp->mode.bw_code;
-	u8 lane_cnt = dp->mode.lane_cnt;
 	u8 aux_lane_cnt = lane_cnt;
-	bool enhanced;
 	int ret;
 
 	zynqmp_dp_write(dp, ZYNQMP_DP_LANE_COUNT_SET, lane_cnt);
-	enhanced = drm_dp_enhanced_frame_cap(dp->dpcd);
 	if (enhanced) {
 		zynqmp_dp_write(dp, ZYNQMP_DP_ENHANCED_FRAME_EN, 1);
 		aux_lane_cnt |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
 	}
 
-	if (dp->dpcd[3] & 0x1) {
+	if (downspread) {
 		zynqmp_dp_write(dp, ZYNQMP_DP_DOWNSPREAD_CTL, 1);
 		drm_dp_dpcd_writeb(&dp->aux, DP_DOWNSPREAD_CTRL,
 				   DP_SPREAD_AMP_0_5);
@@ -852,8 +854,25 @@ static int zynqmp_dp_train(struct zynqmp_dp *dp)
 	}
 
 	zynqmp_dp_write(dp, ZYNQMP_DP_PHY_CLOCK_SELECT, reg);
-	ret = zynqmp_dp_phy_ready(dp);
-	if (ret < 0)
+	return zynqmp_dp_phy_ready(dp);
+}
+
+
+/**
+ * zynqmp_dp_train - Train the link
+ * @dp: DisplayPort IP core structure
+ *
+ * Return: 0 if all trains are done successfully, or corresponding error code.
+ */
+static int zynqmp_dp_train(struct zynqmp_dp *dp)
+{
+	int ret;
+
+	ret = zynqmp_dp_setup(dp, dp->mode.bw_code, dp->mode.lane_cnt,
+			      drm_dp_enhanced_frame_cap(dp->dpcd),
+			      dp->dpcd[DP_MAX_DOWNSPREAD] &
+			      DP_MAX_DOWNSPREAD_0_5);
+	if (ret)
 		return ret;
 
 	zynqmp_dp_write(dp, ZYNQMP_DP_SCRAMBLING_DISABLE, 1);
-- 
2.35.1.1320.gc452695387.dirty

