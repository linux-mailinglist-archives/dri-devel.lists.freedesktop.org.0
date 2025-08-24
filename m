Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC0BB32D6A
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 05:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8315D10E07C;
	Sun, 24 Aug 2025 03:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="HfBMHENu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Sun, 24 Aug 2025 03:47:53 UTC
Received: from mail-m9329.xmail.ntesmail.com (mail-m9329.xmail.ntesmail.com
 [103.126.93.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835FC10E07C
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 03:47:53 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2061d68a8;
 Sun, 24 Aug 2025 11:42:47 +0800 (GMT+08:00)
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
Subject: [PATCH v1] drm/bridge: analogix_dp: Reuse &link_train.training_lane[]
 to set DPCD DP_TRAINING_LANEx_SET
Date: Sun, 24 Aug 2025 11:41:38 +0800
Message-Id: <20250824034138.3207855-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98da2be6d203a3kunme50173fe286e82
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkhOTlZCTB9DSx1KHx5MQ05WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=HfBMHENuq1cOiPb6Rcqorn47hRqYt1a5mik2233TjXGi3lq2rCbIw+mrvigLBzFaSwOUEc2htBvTLIBb/QwomabZND9vvREe7u6fNwrz3t9woYfHUbOoIKST21gd5aKDFqYQgknstbuQTRRO3Bt1l4tA8zLbvf4oAcYGus3awjk=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=NUUE6zxynpgWq/cJHFAolsgWAo9l5vDKKEudpxIVWow=;
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

In analogix_dp_link_start(), &link_train.training_lane[] is used to
set phy PE/VS configurations, and buf[] is initialized with the same
values to set DPCD DP_TRAINING_LANEx_SET.

It makes sense to reuse &link_train.training_lane[] to set DPCD
DP_TRAINING_LANEx_SET, which can remove the redundant assignments
and make codes more consice.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index ed35e567d117..ec8443d66075 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -281,12 +281,8 @@ static int analogix_dp_link_start(struct analogix_dp_device *dp)
 	if (retval < 0)
 		return retval;
 
-	for (lane = 0; lane < lane_count; lane++)
-		buf[lane] = DP_TRAIN_PRE_EMPH_LEVEL_0 |
-			    DP_TRAIN_VOLTAGE_SWING_LEVEL_0;
-
-	retval = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, buf,
-				   lane_count);
+	retval = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET,
+				   dp->link_train.training_lane, lane_count);
 	if (retval < 0)
 		return retval;
 
-- 
2.34.1

