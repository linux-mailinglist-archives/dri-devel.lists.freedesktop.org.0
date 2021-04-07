Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58389356CF0
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 15:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD79899DE;
	Wed,  7 Apr 2021 13:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m121143.qiye.163.com (mail-m121143.qiye.163.com
 [115.236.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D9D89971;
 Wed,  7 Apr 2021 13:08:05 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m121143.qiye.163.com (Hmail) with ESMTPA id D428254048C;
 Wed,  7 Apr 2021 21:07:53 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Tanmay Shah <tanmay@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Bernard Zhao <bernard@vivo.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: remove unneeded variable ret
Date: Wed,  7 Apr 2021 06:06:21 -0700
Message-Id: <20210407130654.3387-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSUpMTUtIHUNIQ04dVkpNSkxDS0tDTE9JSE5VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MiI6OBw5Vj8OKCMQSSEIAU8Q
 TB8aCQFVSlVKTUpMQ0tLQ0xPTktCVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
 TklVSk9OVUpDSllXWQgBWUFIT05LNwY+
X-HM-Tid: 0a78ac7248b0b038kuuud428254048c
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch fix coccicheck warning:
drivers/gpu/drm/msm/dp/dp_link.c:848:5-8: Unneeded variable: "ret". Return "0" on line 880
Also remove unneeded function return value check.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/dp/dp_link.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index be986da78c4a..3395b08155a6 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -843,10 +843,8 @@ bool dp_link_send_edid_checksum(struct dp_link *dp_link, u8 checksum)
 	return ret == 1;
 }
 
-static int dp_link_parse_vx_px(struct dp_link_private *link)
+static void dp_link_parse_vx_px(struct dp_link_private *link)
 {
-	int ret = 0;
-
 	DRM_DEBUG_DP("vx: 0=%d, 1=%d, 2=%d, 3=%d\n",
 		drm_dp_get_adjust_request_voltage(link->link_status, 0),
 		drm_dp_get_adjust_request_voltage(link->link_status, 1),
@@ -876,8 +874,6 @@ static int dp_link_parse_vx_px(struct dp_link_private *link)
 	DRM_DEBUG_DP("Requested: v_level = 0x%x, p_level = 0x%x\n",
 			link->dp_link.phy_params.v_level,
 			link->dp_link.phy_params.p_level);
-
-	return ret;
 }
 
 /**
@@ -891,8 +887,6 @@ static int dp_link_parse_vx_px(struct dp_link_private *link)
 static int dp_link_process_phy_test_pattern_request(
 		struct dp_link_private *link)
 {
-	int ret = 0;
-
 	if (!(link->request.test_requested & DP_TEST_LINK_PHY_TEST_PATTERN)) {
 		DRM_DEBUG_DP("no phy test\n");
 		return -EINVAL;
@@ -918,12 +912,9 @@ static int dp_link_process_phy_test_pattern_request(
 	link->dp_link.link_params.rate =
 		drm_dp_bw_code_to_link_rate(link->request.test_link_rate);
 
-	ret = dp_link_parse_vx_px(link);
-
-	if (ret)
-		DRM_ERROR("parse_vx_px failed. ret=%d\n", ret);
+	dp_link_parse_vx_px(link);
 
-	return ret;
+	return 0;
 }
 
 static u8 get_link_status(const u8 link_status[DP_LINK_STATUS_SIZE], int r)
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
