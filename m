Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A132C503F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 09:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE956E81F;
	Thu, 26 Nov 2020 08:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 364 seconds by postgrey-1.36 at gabe;
 Wed, 25 Nov 2020 10:09:29 UTC
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C66E6E88C;
 Wed, 25 Nov 2020 10:09:29 +0000 (UTC)
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 25 Nov 2020 02:03:23 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 25 Nov 2020 02:03:21 -0800
X-QCInternal: smtphost
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
 by ironmsg02-blr.qualcomm.com with ESMTP; 25 Nov 2020 15:32:46 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 2578917AA; Wed, 25 Nov 2020 02:02:45 -0800 (PST)
From: Kalyan Thota <kalyan_t@codeaurora.org>
To: y@qualcomm.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [v1] drm/msm/dpu: consider vertical front porch in the prefill bw
 calculation
Date: Wed, 25 Nov 2020 02:02:40 -0800
Message-Id: <1606298560-3003-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <y>
References: <y>
X-Mailman-Approved-At: Thu, 26 Nov 2020 08:24:08 +0000
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
Cc: amit.pundir@linaro.org, mkrishn@codeaurora.org, travitej@codeaurora.org,
 dianders@chromium.org, abhinavk@codeaurora.org, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org, Kalyan Thota <kalyan_t@codeaurora.org>,
 ddavenport@chromium.org, hoegsberg@chromium.org, swboyd@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case of panels with low vertical back porch, the prefill bw
requirement will be high as we will have less time(vbp+pw) to
fetch and fill the hw latency buffers before start of first line
in active period.

For ex:
Say hw_latency_line_buffers = 24, and if blanking vbp+pw = 10
Here we need to fetch 24 lines of data in 10 line times.
This will increase the bw to the ratio of linebuffers to blanking.

DPU hw can also fetch data during vertical front porch provided
interface prefetch is enabled. Use vfp in the prefill calculation
as dpu driver enables prefetch if the blanking is not sufficient
to fill the latency lines.

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 7ea90d2..315b999 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -151,7 +151,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 	u64 plane_bw;
 	u32 hw_latency_lines;
 	u64 scale_factor;
-	int vbp, vpw;
+	int vbp, vpw, vfp;
 
 	pstate = to_dpu_plane_state(plane->state);
 	mode = &plane->state->crtc->mode;
@@ -164,6 +164,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 	fps = drm_mode_vrefresh(mode);
 	vbp = mode->vtotal - mode->vsync_end;
 	vpw = mode->vsync_end - mode->vsync_start;
+	vfp = mode->vsync_start - mode->vdisplay;
 	hw_latency_lines =  dpu_kms->catalog->perf.min_prefill_lines;
 	scale_factor = src_height > dst_height ?
 		mult_frac(src_height, 1, dst_height) : 1;
@@ -176,7 +177,13 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 		src_width * hw_latency_lines * fps * fmt->bpp *
 		scale_factor * mode->vtotal;
 
-	do_div(plane_prefill_bw, (vbp+vpw));
+	if ((vbp+vpw) > hw_latency_lines)
+		do_div(plane_prefill_bw, (vbp+vpw));
+	else if ((vbp+vpw+vfp) < hw_latency_lines)
+		do_div(plane_prefill_bw, (vbp+vpw+vfp));
+	else
+		do_div(plane_prefill_bw, hw_latency_lines);
+
 
 	pstate->plane_fetch_bw = max(plane_bw, plane_prefill_bw);
 }
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
