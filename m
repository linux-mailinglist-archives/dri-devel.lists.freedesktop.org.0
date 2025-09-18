Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFA3B32E5E
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 10:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F6110E124;
	Sun, 24 Aug 2025 08:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="BwKenBrL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49237.qiye.163.com (mail-m49237.qiye.163.com
 [45.254.49.237])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314CF10E124
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 08:45:49 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 20643f363;
 Sun, 24 Aug 2025 16:45:46 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v1 3/4] drm/bridge: analogix_dp: Apply DP helper API
 drm_dp_channel_eq_ok()
Date: Sun, 24 Aug 2025 16:45:28 +0800
Message-Id: <20250824084529.3317985-4-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250824084529.3317985-1-damon.ding@rock-chips.com>
References: <20250824084529.3317985-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98db414e4603a3kunm71d2620e2ad6a9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxhCGFZKSRgdSE4eSE5CTkhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=BwKenBrLxWevdvV/ixXPRfPsB6EWXQbqMejb+wf1M7vg00HdI15vBDRc7/+vhNpcLbDxGI1wIQvEQqSheapUR3VaXvQxaI3MpXHlQOKZgxpg3OLwhYUWF11mMOYxSNcXdTDpo81RP7UrM9BxT1YWJuye3DtIUj9n28wS2v+1IMw=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=sVIZVnZf9b9QQ+QfeX3l4+4DYZYTcsTOBXDyFq0XOL0=;
 h=date:mime-version:subject:message-id:from;
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

Use existing DP helper API instead of analogix_dp_channel_eq_ok()
with the same function.

In addtion, remove unused function analogix_dp_get_lane_status()

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 49 ++-----------------
 1 file changed, 4 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index fde190eac34e..1f1de45ca46f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -293,33 +293,6 @@ static int analogix_dp_link_start(struct analogix_dp_device *dp)
 	return 0;
 }
 
-static unsigned char analogix_dp_get_lane_status(u8 link_status[2], int lane)
-{
-	int shift = (lane & 1) * 4;
-	u8 link_value = link_status[lane >> 1];
-
-	return (link_value >> shift) & 0xf;
-}
-
-static int analogix_dp_channel_eq_ok(u8 link_status[2], u8 link_align,
-				     int lane_count)
-{
-	int lane;
-	u8 lane_status;
-
-	if ((link_align & DP_INTERLANE_ALIGN_DONE) == 0)
-		return -EINVAL;
-
-	for (lane = 0; lane < lane_count; lane++) {
-		lane_status = analogix_dp_get_lane_status(link_status, lane);
-		lane_status &= DP_CHANNEL_EQ_BITS;
-		if (lane_status != DP_CHANNEL_EQ_BITS)
-			return -EINVAL;
-	}
-
-	return 0;
-}
-
 static unsigned char
 analogix_dp_get_adjust_request_voltage(u8 adjust_request[2], int lane)
 {
@@ -441,7 +414,7 @@ static int analogix_dp_process_equalizer_training(struct analogix_dp_device *dp)
 {
 	int lane_count, retval;
 	u32 reg;
-	u8 link_align, link_status[DP_LINK_STATUS_SIZE], adjust_request[2];
+	u8 link_status[DP_LINK_STATUS_SIZE], adjust_request[2];
 
 	usleep_range(400, 401);
 
@@ -461,14 +434,9 @@ static int analogix_dp_process_equalizer_training(struct analogix_dp_device *dp)
 	if (retval < 0)
 		return retval;
 
-	retval = drm_dp_dpcd_readb(&dp->aux, DP_LANE_ALIGN_STATUS_UPDATED,
-				   &link_align);
-	if (retval < 0)
-		return retval;
-
 	analogix_dp_get_adjust_training_lane(dp, adjust_request);
 
-	if (!analogix_dp_channel_eq_ok(link_status, link_align, lane_count)) {
+	if (drm_dp_channel_eq_ok(link_status, lane_count)) {
 		/* traing pattern Set to Normal */
 		retval = analogix_dp_training_pattern_dis(dp);
 		if (retval < 0)
@@ -606,7 +574,7 @@ static int analogix_dp_full_link_train(struct analogix_dp_device *dp,
 static int analogix_dp_fast_link_train(struct analogix_dp_device *dp)
 {
 	int ret;
-	u8 link_align, link_status[DP_LINK_STATUS_SIZE];
+	u8 link_status[DP_LINK_STATUS_SIZE];
 
 	analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
 	ret = analogix_dp_wait_pll_locked(dp);
@@ -640,14 +608,6 @@ static int analogix_dp_fast_link_train(struct analogix_dp_device *dp)
 	 * speed
 	 */
 	if (verify_fast_training) {
-		ret = drm_dp_dpcd_readb(&dp->aux, DP_LANE_ALIGN_STATUS_UPDATED,
-					&link_align);
-		if (ret < 0) {
-			DRM_DEV_ERROR(dp->dev, "Read align status failed %d\n",
-				      ret);
-			return ret;
-		}
-
 		ret = drm_dp_dpcd_read_link_status(&dp->aux, link_status);
 		if (ret < 0) {
 			DRM_DEV_ERROR(dp->dev, "Read link status failed %d\n",
@@ -661,8 +621,7 @@ static int analogix_dp_fast_link_train(struct analogix_dp_device *dp)
 			return -EIO;
 		}
 
-		if (analogix_dp_channel_eq_ok(link_status, link_align,
-					      dp->link_train.lane_count)) {
+		if (!drm_dp_channel_eq_ok(link_status, dp->link_train.lane_count)) {
 			DRM_DEV_ERROR(dp->dev, "Channel EQ failed\n");
 			analogix_dp_reduce_link_rate(dp);
 			return -EIO;
-- 
2.34.1

