Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 931A01C4E99
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BE56E524;
	Tue,  5 May 2020 06:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7C5898BC;
 Mon,  4 May 2020 13:31:31 +0000 (UTC)
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 04 May 2020 19:01:27 +0530
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg02-blr.qualcomm.com with ESMTP; 04 May 2020 19:01:07 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id EAE0346E3; Mon,  4 May 2020 19:01:05 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v1] drm/msm/dpu: update bandwidth threshold check
Date: Mon,  4 May 2020 19:01:03 +0530
Message-Id: <1588599063-15754-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Tue, 05 May 2020 06:58:49 +0000
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 mka@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maximum allowed bandwidth  has no dependency on the type
of panel used. Hence, cleanup the code to use max_bw_high
as the threshold value for bandwidth checks.

Update the maximum allowed bandwidth as 6.8Gbps for
SC7180 target.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c  | 23 +----------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++--
 2 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 11f2beb..7c230f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -36,22 +36,6 @@ static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
 	return to_dpu_kms(priv->kms);
 }
 
-static bool _dpu_core_video_mode_intf_connected(struct drm_crtc *crtc)
-{
-	struct drm_crtc *tmp_crtc;
-
-	drm_for_each_crtc(tmp_crtc, crtc->dev) {
-		if ((dpu_crtc_get_intf_mode(tmp_crtc) == INTF_MODE_VIDEO) &&
-				tmp_crtc->enabled) {
-			DPU_DEBUG("video interface connected crtc:%d\n",
-				tmp_crtc->base.id);
-			return true;
-		}
-	}
-
-	return false;
-}
-
 static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
 		struct drm_crtc *crtc,
 		struct drm_crtc_state *state,
@@ -94,7 +78,6 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	u32 bw, threshold;
 	u64 bw_sum_of_intfs = 0;
 	enum dpu_crtc_client_type curr_client_type;
-	bool is_video_mode;
 	struct dpu_crtc_state *dpu_cstate;
 	struct drm_crtc *tmp_crtc;
 	struct dpu_kms *kms;
@@ -144,11 +127,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 		bw = DIV_ROUND_UP_ULL(bw_sum_of_intfs, 1000);
 		DPU_DEBUG("calculated bandwidth=%uk\n", bw);
 
-		is_video_mode = dpu_crtc_get_intf_mode(crtc) == INTF_MODE_VIDEO;
-		threshold = (is_video_mode ||
-			_dpu_core_video_mode_intf_connected(crtc)) ?
-			kms->catalog->perf.max_bw_low :
-			kms->catalog->perf.max_bw_high;
+		threshold = kms->catalog->perf.max_bw_high;
 
 		DPU_DEBUG("final threshold bw limit = %d\n", threshold);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index c567917..6ad7472 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -515,8 +515,8 @@
 };
 
 static const struct dpu_perf_cfg sc7180_perf_data = {
-	.max_bw_low = 3900000,
-	.max_bw_high = 5500000,
+	.max_bw_low = 6800000,
+	.max_bw_high = 6800000,
 	.min_core_ib = 2400000,
 	.min_llcc_ib = 800000,
 	.min_dram_ib = 800000,
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
