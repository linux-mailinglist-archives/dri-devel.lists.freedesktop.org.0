Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB47E4F270F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 10:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3199110EFFB;
	Tue,  5 Apr 2022 08:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B2010EFFB
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 08:06:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A0140B81BB2;
 Tue,  5 Apr 2022 08:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFFEC385A2;
 Tue,  5 Apr 2022 08:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1649145992;
 bh=weF/+fdsg4H1uMnMRru4rmj6Vwi3n8PJR9iKpewABAA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JNLVnZ2PsQNXsbZz9qt8XLbDMXijzgKvBtJ7/7dUVeyQOcKjWSB9twr++pdn6Wqzl
 ZUyzSAK5K9uQkST5ZDa3yHAYrTLXA85yi+MOYNYiKOL7wAmTwnfX5xqE7of+Wat8NM
 gL18VbRq3I7dRUbcRQfL0JXJxpqoOJjd89f+ocvY=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.17 0604/1126] drm/dp: Fix OOB read when handling Post
 Cursor2 register
Date: Tue,  5 Apr 2022 09:22:31 +0200
Message-Id: <20220405070425.363510901@linuxfoundation.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405070407.513532867@linuxfoundation.org>
References: <20220405070407.513532867@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, stable@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>, Kees Cook <keescook@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kees Cook <keescook@chromium.org>

[ Upstream commit a2151490cc6c57b368d7974ffd447a8b36ade639 ]

The link_status array was not large enough to read the Adjust Request
Post Cursor2 register, so remove the common helper function to avoid
an OOB read, found with a -Warray-bounds build:

drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_get_adjust_request_post_cursor':
drivers/gpu/drm/drm_dp_helper.c:59:27: error: array subscript 10 is outside array bounds of 'const u8[6]' {aka 'const unsigned char[6]'} [-Werror=array-bounds]
   59 |         return link_status[r - DP_LANE0_1_STATUS];
      |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/drm_dp_helper.c:147:51: note: while referencing 'link_status'
  147 | u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
      |                                          ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Replace the only user of the helper with an open-coded fetch and decode,
similar to drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Fixes: 79465e0ffeb9 ("drm/dp: Add helper to get post-cursor adjustments")
Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Link: https://lore.kernel.org/r/20220105173507.2420910-1-keescook@chromium.org
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_dp_helper.c | 10 ----------
 drivers/gpu/drm/tegra/dp.c      | 11 ++++++++++-
 include/drm/drm_dp_helper.h     |  2 --
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 23f9073bc473..c9528aa62c9c 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -144,16 +144,6 @@ u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
 }
 EXPORT_SYMBOL(drm_dp_get_adjust_tx_ffe_preset);
 
-u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
-					 unsigned int lane)
-{
-	unsigned int offset = DP_ADJUST_REQUEST_POST_CURSOR2;
-	u8 value = dp_link_status(link_status, offset);
-
-	return (value >> (lane << 1)) & 0x3;
-}
-EXPORT_SYMBOL(drm_dp_get_adjust_request_post_cursor);
-
 static int __8b10b_clock_recovery_delay_us(const struct drm_dp_aux *aux, u8 rd_interval)
 {
 	if (rd_interval > 4)
diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index 70dfb7d1dec5..f5535eb04c6b 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -549,6 +549,15 @@ static void drm_dp_link_get_adjustments(struct drm_dp_link *link,
 {
 	struct drm_dp_link_train_set *adjust = &link->train.adjust;
 	unsigned int i;
+	u8 post_cursor;
+	int err;
+
+	err = drm_dp_dpcd_read(link->aux, DP_ADJUST_REQUEST_POST_CURSOR2,
+			       &post_cursor, sizeof(post_cursor));
+	if (err < 0) {
+		DRM_ERROR("failed to read post_cursor2: %d\n", err);
+		post_cursor = 0;
+	}
 
 	for (i = 0; i < link->lanes; i++) {
 		adjust->voltage_swing[i] =
@@ -560,7 +569,7 @@ static void drm_dp_link_get_adjustments(struct drm_dp_link *link,
 				DP_TRAIN_PRE_EMPHASIS_SHIFT;
 
 		adjust->post_cursor[i] =
-			drm_dp_get_adjust_request_post_cursor(status, i);
+			(post_cursor >> (i << 1)) & 0x3;
 	}
 }
 
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 30359e434c3f..28378db676c8 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1528,8 +1528,6 @@ u8 drm_dp_get_adjust_request_pre_emphasis(const u8 link_status[DP_LINK_STATUS_SI
 					  int lane);
 u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
 				   int lane);
-u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
-					 unsigned int lane);
 
 #define DP_BRANCH_OUI_HEADER_SIZE	0xc
 #define DP_RECEIVER_CAP_SIZE		0xf
-- 
2.34.1



