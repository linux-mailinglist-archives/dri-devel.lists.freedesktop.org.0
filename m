Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 256CA88C64A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 16:06:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C628B10F01C;
	Tue, 26 Mar 2024 15:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sZ7mBzFB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0337310F01C;
 Tue, 26 Mar 2024 15:06:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6D98C612B7;
 Tue, 26 Mar 2024 15:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730D5C433F1;
 Tue, 26 Mar 2024 15:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711465607;
 bh=B8qB9LxYp7aNKSjYMyDo0CeyGwOCmr2Wum7lcf6UN68=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=sZ7mBzFBLFf12dooN8ORVs6+Y8YzQYmspv4TjUHZQVyAGyC0jkX0QnERlhsU1ixK1
 4TCk+Uy+JuxduXqVTxXW67mDT1h3qdDWwijvr8+UTf6J4Yw5HSHxUJHNmmE441mBb8
 ClxJwmptyw4hlYv/o3LqgBbulq9Ry0iEa1VwhpJT/ecJBHwDpI+joO6dYOM1NOLfCz
 4A9R4Zjd+Z8sKmHRJy727lu8OV7Gs6MF/3uIkEkPNJkNaz2D8MiwcUh1Va4KGqFkTX
 SxxBiDwevSwTB8974XGph5wAnZ5OaRLSYZuArLmdXIn7Q7UlqnnpWB4rw2AWCiToo6
 hsaEbTvkXJByg==
From: Bjorn Andersson <andersson@kernel.org>
Date: Tue, 26 Mar 2024 08:11:33 -0700
Subject: [PATCH 5/6] drm/msm/dp: Use function arguments for timing
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-msm-dp-cleanup-v1-5-e775556ecec0@quicinc.com>
References: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
In-Reply-To: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4568;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=xZExesJNk5HfEJV3vYrPFpgGd0WDPR48SsGygxZe6Ww=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmAuWi+J5SrwhQNjnbx2S5Y1gIXzgu0EGG2KJya
 FXiFCVEhX+JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZgLlohUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWO4w//eXXBSpZLedSHEbpDs5uQkVixX5+acoyhToUQyoR
 J/sYm5CJuC9YPBb4DmJnxkp3SCVXVcxfhV+QGAc2Un9VuIFy02JbhEsyqSXskKGdwyWRKCQJe63
 yWa+eA73pbB21RxcFjzkaZzeV01niw98YCXKAPZvNyfwyAsJjy6eFpQQwjm/Xrq2DotfLC9lUiw
 bVjEJRY0cY1er4X6Ywxmpp0F0yM06LsHdRh3ZsiENcY+wF2wCKpcsekdcDRshYb68n+n/M+4WfT
 WF4yxFDgocFfxJRQMedeDejn+gQF25J+FdyeVQtXvkz9CRsZi+/0xcSz7QnAQFlxOfWl9I+LXwl
 GwAAxgUtMaIY6Uuh18DMScB/xflWXr1j530rDQ3r1S8V1CzITY8RqW9oSmbw/fwy5zNUfpilxvm
 kzEDlxrU0Xo+Cmlx2RMJHOcCVGnz6HLO0Gf89CBNzts1yGAHgF+pslKSau3TLtvKOPBK/fuVhBq
 Nb1G/Vxj4YYmbvJqGNZDQgMtJS5ahzXEXQkHq/G7SoiLyVsI4Nlk626YkbkKGD7S019nNIoQla3
 Yabbt+jMl8GprKDGrc3ch/3eYKBn5vIXb/hXHNyfD/mQQ8htG6/OKbi+BxBIOBaRVz6TrVQ9Fd2
 edFUDcCxVvSPWZyDp653+s1aNGKfKBJsXpgy8N9y0tbE=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
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

From: Bjorn Andersson <quic_bjorande@quicinc.com>

dp_catalog_panel_timing_cfg() takes 4 arguments, which are passed from
the calling function through members of struct dp_catalog.

No state is maintained other than across this call, so switch to
function arguments to clean up the code.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 14 ++++++--------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  7 ++-----
 drivers/gpu/drm/msm/dp/dp_panel.c   | 14 +++++++++-----
 3 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 295bd4cb72cc..00ad3ebaa5a1 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -880,19 +880,17 @@ u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog)
 }
 
 /* panel related catalog functions */
-int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
+int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog, u32 total,
+				u32 sync_start, u32 width_blanking, u32 dp_active)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
 	u32 reg;
 
-	dp_write_link(catalog, REG_DP_TOTAL_HOR_VER,
-				dp_catalog->total);
-	dp_write_link(catalog, REG_DP_START_HOR_VER_FROM_SYNC,
-				dp_catalog->sync_start);
-	dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY,
-				dp_catalog->width_blanking);
-	dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, dp_catalog->dp_active);
+	dp_write_link(catalog, REG_DP_TOTAL_HOR_VER, total);
+	dp_write_link(catalog, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
+	dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
+	dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, dp_active);
 
 	reg = dp_read_p0(catalog, MMSS_DP_INTF_CONFIG);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 290ef8180c12..a82ab4856b50 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -48,10 +48,6 @@ enum dp_catalog_audio_header_type {
 };
 
 struct dp_catalog {
-	u32 total;
-	u32 sync_start;
-	u32 width_blanking;
-	u32 dp_active;
 	enum dp_catalog_audio_sdp_type sdp_type;
 	enum dp_catalog_audio_header_type sdp_header;
 	u32 audio_data;
@@ -106,7 +102,8 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
 u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog);
 
 /* DP Panel APIs */
-int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog);
+int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog, u32 total,
+				u32 sync_start, u32 width_blanking, u32 dp_active);
 void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog, struct dp_sdp *vsc_sdp);
 void dp_catalog_panel_disable_vsc_sdp(struct dp_catalog *dp_catalog);
 void dp_catalog_dump_regs(struct dp_catalog *dp_catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 8e7069453952..07db8f37cd06 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -353,6 +353,10 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
 	struct dp_catalog *catalog;
 	struct dp_panel_private *panel;
 	struct drm_display_mode *drm_mode;
+	u32 width_blanking;
+	u32 sync_start;
+	u32 dp_active;
+	u32 total;
 
 	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
 	catalog = panel->catalog;
@@ -376,13 +380,13 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
 	data <<= 16;
 	data |= total_hor;
 
-	catalog->total = data;
+	total = data;
 
 	data = (drm_mode->vtotal - drm_mode->vsync_start);
 	data <<= 16;
 	data |= (drm_mode->htotal - drm_mode->hsync_start);
 
-	catalog->sync_start = data;
+	sync_start = data;
 
 	data = drm_mode->vsync_end - drm_mode->vsync_start;
 	data <<= 16;
@@ -390,15 +394,15 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
 	data |= drm_mode->hsync_end - drm_mode->hsync_start;
 	data |= (panel->dp_panel.dp_mode.h_active_low << 15);
 
-	catalog->width_blanking = data;
+	width_blanking = data;
 
 	data = drm_mode->vdisplay;
 	data <<= 16;
 	data |= drm_mode->hdisplay;
 
-	catalog->dp_active = data;
+	dp_active = data;
 
-	dp_catalog_panel_timing_cfg(catalog);
+	dp_catalog_panel_timing_cfg(catalog, total, sync_start, width_blanking, dp_active);
 
 	if (dp_panel->dp_mode.out_fmt_is_yuv_420)
 		dp_panel_setup_vsc_sdp_yuv_420(dp_panel);

-- 
2.43.0

