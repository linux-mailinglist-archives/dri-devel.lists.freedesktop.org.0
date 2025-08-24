Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07ADB32E5C
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 10:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978D010E076;
	Sun, 24 Aug 2025 08:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="K1n5JrAp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49214.qiye.163.com (mail-m49214.qiye.163.com
 [45.254.49.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CFDD10E076
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 08:45:46 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 20643f35e;
 Sun, 24 Aug 2025 16:45:43 +0800 (GMT+08:00)
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
Subject: [PATCH v1 1/4] drm/bridge: analogix_dp: Apply DP helper API
 drm_dp_dpcd_read_link_status()
Date: Sun, 24 Aug 2025 16:45:26 +0800
Message-Id: <20250824084529.3317985-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250824084529.3317985-1-damon.ding@rock-chips.com>
References: <20250824084529.3317985-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98db4141d603a3kunm71d2620e2ad685
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhhISVZIQxlLGEsaSE5NS0NWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=K1n5JrApL/05epZmMybeDKhmJCxEMLp8NBC30EVU8UMDmFq4k5yofuq07olJpJJzOWY5EleEKLYTnPz2l6cBAa4g5uSblUevRrGpnWUN768DJjXf/bJgwxYHfZ/nAtTQGMMGb5+byYJ0fKg988/pSKOGW46miurC0Uu8o72WsPQ=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=ee2Cm9agIGFWMrQ8tfeANTYqKDJm3XAtCYn236nugoU=;
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

Use existing DP helper API to read link status related DPCDs.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index ed35e567d117..6a3f3fb0ec0a 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -388,13 +388,13 @@ static int analogix_dp_process_clock_recovery(struct analogix_dp_device *dp)
 {
 	int lane, lane_count, retval;
 	u8 voltage_swing, pre_emphasis, training_lane;
-	u8 link_status[2], adjust_request[2];
+	u8 link_status[DP_LINK_STATUS_SIZE], adjust_request[2];
 
 	usleep_range(100, 101);
 
 	lane_count = dp->link_train.lane_count;
 
-	retval = drm_dp_dpcd_read(&dp->aux, DP_LANE0_1_STATUS, link_status, 2);
+	retval = drm_dp_dpcd_read_link_status(&dp->aux, link_status);
 	if (retval < 0)
 		return retval;
 
@@ -454,13 +454,13 @@ static int analogix_dp_process_equalizer_training(struct analogix_dp_device *dp)
 {
 	int lane_count, retval;
 	u32 reg;
-	u8 link_align, link_status[2], adjust_request[2];
+	u8 link_align, link_status[DP_LINK_STATUS_SIZE], adjust_request[2];
 
 	usleep_range(400, 401);
 
 	lane_count = dp->link_train.lane_count;
 
-	retval = drm_dp_dpcd_read(&dp->aux, DP_LANE0_1_STATUS, link_status, 2);
+	retval = drm_dp_dpcd_read_link_status(&dp->aux, link_status);
 	if (retval < 0)
 		return retval;
 
@@ -619,7 +619,7 @@ static int analogix_dp_full_link_train(struct analogix_dp_device *dp,
 static int analogix_dp_fast_link_train(struct analogix_dp_device *dp)
 {
 	int ret;
-	u8 link_align, link_status[2];
+	u8 link_align, link_status[DP_LINK_STATUS_SIZE];
 
 	analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
 	ret = analogix_dp_wait_pll_locked(dp);
@@ -661,8 +661,7 @@ static int analogix_dp_fast_link_train(struct analogix_dp_device *dp)
 			return ret;
 		}
 
-		ret = drm_dp_dpcd_read(&dp->aux, DP_LANE0_1_STATUS, link_status,
-				       2);
+		ret = drm_dp_dpcd_read_link_status(&dp->aux, link_status);
 		if (ret < 0) {
 			DRM_DEV_ERROR(dp->dev, "Read link status failed %d\n",
 				      ret);
-- 
2.34.1

