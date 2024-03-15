Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4A787D72F
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 00:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D0811269C;
	Fri, 15 Mar 2024 23:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="tTOCd92z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com
 [95.215.58.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B257E11269C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 23:09:35 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710544174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2iCejvqA5IbzASiXQE6xrf0mIzF3OuUDUKlOJcBerFY=;
 b=tTOCd92zqEXX69LmQS9XAiZrEQdbzzyrOmbVeN3kSGIjYq/h/7Vz38DXpQE72l7TTNH8cC
 2+SgkUQBW8h2oQ2tM+N9gEo393sCF4tto1OlQOcdFOrUagGkmLIm9UF45kodIDTnJy3nsU
 7UoG7DkoiKNQpGH0z4W00x/+zHpRBY4=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 5/6] drm: zynqmp_dp: Optionally ignore DPCD errors
Date: Fri, 15 Mar 2024 19:09:15 -0400
Message-Id: <20240315230916.1759060-6-sean.anderson@linux.dev>
In-Reply-To: <20240315230916.1759060-1-sean.anderson@linux.dev>
References: <20240315230916.1759060-1-sean.anderson@linux.dev>
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

When testing, it's convenient to be able to ignore DPCD errors if there
is test equipment which can't emulate a DPRX connected to the output.
Add some (currently-unused) options to ignore these errors and just
reconfigure our internal registers as we usually would.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 37 ++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 24043847dab4..040f7b88ee51 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -628,6 +628,7 @@ static void zynqmp_dp_adjust_train(struct zynqmp_dp *dp,
  * zynqmp_dp_update_vs_emph - Update the training values
  * @dp: DisplayPort IP core structure
  * @train_set: A set of training values
+ * @ignore_dpcd: Ignore DPCD errors
  *
  * Update the training values based on the request from sink. The mapped values
  * are predefined, and values(vs, pe, pc) are from the device manual.
@@ -635,15 +636,19 @@ static void zynqmp_dp_adjust_train(struct zynqmp_dp *dp,
  * Return: 0 if vs and emph are updated successfully, or the error code returned
  * by drm_dp_dpcd_write().
  */
-static int zynqmp_dp_update_vs_emph(struct zynqmp_dp *dp, u8 *train_set)
+static int zynqmp_dp_update_vs_emph(struct zynqmp_dp *dp, u8 *train_set,
+				    bool ignore_dpcd)
 {
 	unsigned int i;
 	int ret;
 
 	ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, train_set,
 				dp->mode.lane_cnt);
-	if (ret < 0)
-		return ret;
+	if (ret < 0) {
+		if (!ignore_dpcd)
+			return ret;
+		dev_warn(dp->dev, "failed to update vs/emph\n");
+	}
 
 	for (i = 0; i < dp->mode.lane_cnt; i++) {
 		u32 reg = ZYNQMP_DP_SUB_TX_PHY_PRECURSOR_LANE_0 + i * 4;
@@ -692,7 +697,7 @@ static int zynqmp_dp_link_train_cr(struct zynqmp_dp *dp)
 	 * So, This loop should exit before 512 iterations
 	 */
 	for (max_tries = 0; max_tries < 512; max_tries++) {
-		ret = zynqmp_dp_update_vs_emph(dp, dp->train_set);
+		ret = zynqmp_dp_update_vs_emph(dp, dp->train_set, false);
 		if (ret)
 			return ret;
 
@@ -757,7 +762,7 @@ static int zynqmp_dp_link_train_ce(struct zynqmp_dp *dp)
 		return ret;
 
 	for (tries = 0; tries < DP_MAX_TRAINING_TRIES; tries++) {
-		ret = zynqmp_dp_update_vs_emph(dp, dp->train_set);
+		ret = zynqmp_dp_update_vs_emph(dp, dp->train_set, false);
 		if (ret)
 			return ret;
 
@@ -785,11 +790,12 @@ static int zynqmp_dp_link_train_ce(struct zynqmp_dp *dp)
  * @lane_cnt: The number of lanes to use
  * @enhanced: Use enhanced framing
  * @downspread: Enable spread-spectrum clocking
+ * @ignore_dpcd: Ignore DPCD errors; useful for testing
  *
  * Return: 0 on success, or -errno on failure
  */
 static int zynqmp_dp_setup(struct zynqmp_dp *dp, u8 bw_code, u8 lane_cnt,
-			   bool enhanced, bool downspread)
+			   bool enhanced, bool downspread, bool ignore_dpcd)
 {
 	u32 reg;
 	u8 aux_lane_cnt = lane_cnt;
@@ -812,21 +818,24 @@ static int zynqmp_dp_setup(struct zynqmp_dp *dp, u8 bw_code, u8 lane_cnt,
 
 	ret = drm_dp_dpcd_writeb(&dp->aux, DP_LANE_COUNT_SET, aux_lane_cnt);
 	if (ret < 0) {
-		dev_err(dp->dev, "failed to set lane count\n");
-		return ret;
+		dev_warn(dp->dev, "failed to set lane count\n");
+		if (!ignore_dpcd)
+			return ret;
 	}
 
 	ret = drm_dp_dpcd_writeb(&dp->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
 				 DP_SET_ANSI_8B10B);
 	if (ret < 0) {
-		dev_err(dp->dev, "failed to set ANSI 8B/10B encoding\n");
-		return ret;
+		dev_warn(dp->dev, "failed to set ANSI 8B/10B encoding\n");
+		if (!ignore_dpcd)
+			return ret;
 	}
 
 	ret = drm_dp_dpcd_writeb(&dp->aux, DP_LINK_BW_SET, bw_code);
 	if (ret < 0) {
-		dev_err(dp->dev, "failed to set DP bandwidth\n");
-		return ret;
+		dev_warn(dp->dev, "failed to set DP bandwidth\n");
+		if (!ignore_dpcd)
+			return ret;
 	}
 
 	zynqmp_dp_write(dp, ZYNQMP_DP_LINK_BW_SET, bw_code);
@@ -860,7 +869,7 @@ static int zynqmp_dp_train(struct zynqmp_dp *dp)
 
 	ret = zynqmp_dp_setup(dp, dp->mode.bw_code, dp->mode.lane_cnt,
 			      drm_dp_enhanced_frame_cap(dp->dpcd),
-			      dp->dpcd[3] & 0x1);
+			      dp->dpcd[3] & 0x1, false);
 	if (ret)
 		return ret;
 
@@ -877,7 +886,7 @@ static int zynqmp_dp_train(struct zynqmp_dp *dp)
 	ret = drm_dp_dpcd_writeb(&dp->aux, DP_TRAINING_PATTERN_SET,
 				 DP_TRAINING_PATTERN_DISABLE);
 	if (ret < 0) {
-		dev_err(dp->dev, "failed to disable training pattern\n");
+		dev_warn(dp->dev, "failed to disable training pattern\n");
 		return ret;
 	}
 	zynqmp_dp_write(dp, ZYNQMP_DP_TRAINING_PATTERN_SET,
-- 
2.35.1.1320.gc452695387.dirty

