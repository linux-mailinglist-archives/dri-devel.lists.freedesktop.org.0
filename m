Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB666B32E5D
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 10:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1463910E127;
	Sun, 24 Aug 2025 08:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="VeaQFn94";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49226.qiye.163.com (mail-m49226.qiye.163.com
 [45.254.49.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833EA10E076
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 08:45:48 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 20643f361;
 Sun, 24 Aug 2025 16:45:45 +0800 (GMT+08:00)
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
Subject: [PATCH v1 2/4] drm/bridge: analogix_dp: Apply DP helper API
 drm_dp_clock_recovery_ok()
Date: Sun, 24 Aug 2025 16:45:27 +0800
Message-Id: <20250824084529.3317985-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250824084529.3317985-1-damon.ding@rock-chips.com>
References: <20250824084529.3317985-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98db41480603a3kunm71d2620e2ad69e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUIaQ1YeTEsfQk8aGB0aGk5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=VeaQFn94L+wyz4Rw5Y5kZepE9VGCGXUo/WWA6xLCSDGtYdqwZpU2XIjQ4sy7TTeejHbHjzzF08a2XgcQtDeqEBfb75jjfSvahXubBRWjyjx1lTmANWQLwafiH5FWPohNAgPxeIjva5nEwgy9GacnfDl2NdyqzeP2SNnoTaC1GGo=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=A9bgi49Xgv4Om5tHr8MtwDx3tD7Zaj9Nr4+eowxlYhU=;
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

Use existing DP helper API instead of analogix_dp_clock_recovery_ok()
with the same function.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 20 +++----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 6a3f3fb0ec0a..fde190eac34e 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -301,19 +301,6 @@ static unsigned char analogix_dp_get_lane_status(u8 link_status[2], int lane)
 	return (link_value >> shift) & 0xf;
 }
 
-static int analogix_dp_clock_recovery_ok(u8 link_status[2], int lane_count)
-{
-	int lane;
-	u8 lane_status;
-
-	for (lane = 0; lane < lane_count; lane++) {
-		lane_status = analogix_dp_get_lane_status(link_status, lane);
-		if ((lane_status & DP_LANE_CR_DONE) == 0)
-			return -EINVAL;
-	}
-	return 0;
-}
-
 static int analogix_dp_channel_eq_ok(u8 link_status[2], u8 link_align,
 				     int lane_count)
 {
@@ -398,7 +385,7 @@ static int analogix_dp_process_clock_recovery(struct analogix_dp_device *dp)
 	if (retval < 0)
 		return retval;
 
-	if (analogix_dp_clock_recovery_ok(link_status, lane_count) == 0) {
+	if (drm_dp_clock_recovery_ok(link_status, lane_count)) {
 		/* set training pattern 2 for EQ */
 		analogix_dp_set_training_pattern(dp, TRAINING_PTN2);
 
@@ -464,7 +451,7 @@ static int analogix_dp_process_equalizer_training(struct analogix_dp_device *dp)
 	if (retval < 0)
 		return retval;
 
-	if (analogix_dp_clock_recovery_ok(link_status, lane_count)) {
+	if (!drm_dp_clock_recovery_ok(link_status, lane_count)) {
 		analogix_dp_reduce_link_rate(dp);
 		return -EIO;
 	}
@@ -668,8 +655,7 @@ static int analogix_dp_fast_link_train(struct analogix_dp_device *dp)
 			return ret;
 		}
 
-		if (analogix_dp_clock_recovery_ok(link_status,
-						  dp->link_train.lane_count)) {
+		if (!drm_dp_clock_recovery_ok(link_status, dp->link_train.lane_count)) {
 			DRM_DEV_ERROR(dp->dev, "Clock recovery failed\n");
 			analogix_dp_reduce_link_rate(dp);
 			return -EIO;
-- 
2.34.1

