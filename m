Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949693926BF
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 07:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C066E1A7;
	Thu, 27 May 2021 05:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B700C6E1A7;
 Thu, 27 May 2021 05:08:25 +0000 (UTC)
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 26 May 2021 22:08:25 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 26 May 2021 22:08:23 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg01-blr.qualcomm.com with ESMTP; 27 May 2021 10:37:58 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id BB93820E58; Thu, 27 May 2021 10:37:57 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: [v1] drm/msm/disp/dpu1: avoid perf update in frame done event
Date: Thu, 27 May 2021 10:37:56 +0530
Message-Id: <1622092076-5100-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, dianders@chromium.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org, seanpaul@chromium.org,
 kalyan_t@codeaurora.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Crtc perf update from frame event work can result in
wrong bandwidth and clock update from dpu if the work
is scheduled after the swap state has happened.

Avoid such issues by moving perf update to complete
commit once the frame is accepted by the hardware.

Fixes: a29c8c024165 ("drm/msm/disp/dpu1: fix display underruns during modeset")
Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 18bc76b..4523d6b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -407,9 +407,6 @@ static void dpu_crtc_frame_event_work(struct kthread_work *work)
 								fevent->event);
 		}
 
-		if (fevent->event & DPU_ENCODER_FRAME_EVENT_DONE)
-			dpu_core_perf_crtc_update(crtc, 0, false);
-
 		if (fevent->event & (DPU_ENCODER_FRAME_EVENT_DONE
 					| DPU_ENCODER_FRAME_EVENT_ERROR))
 			frame_done = true;
@@ -477,6 +474,7 @@ static void dpu_crtc_frame_event_cb(void *data, u32 event)
 void dpu_crtc_complete_commit(struct drm_crtc *crtc)
 {
 	trace_dpu_crtc_complete_commit(DRMID(crtc));
+	dpu_core_perf_crtc_update(crtc, 0, false);
 	_dpu_crtc_complete_flip(crtc);
 }
 
-- 
2.7.4

