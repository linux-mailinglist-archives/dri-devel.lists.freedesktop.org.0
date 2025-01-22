Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288B9A1966C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 17:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181FE10E730;
	Wed, 22 Jan 2025 16:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227A510E727;
 Wed, 22 Jan 2025 16:24:09 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D396C40CEE;
 Wed, 22 Jan 2025 17:24:06 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Wed, 22 Jan 2025 17:23:44 +0100
Subject: [PATCH v2] drm/msm/dpu: Fall back to a single DSC encoder (1:1:1)
 on small SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
X-B4-Tracking: v=1; b=H4sIAI8bkWcC/2WNQQ6CMBBFr0JmbU1nhIiuuIdhgWWESbBDWiQSw
 t0tbF2+l/z3V4gchCPcsxUCzxJFfQI6ZeD6xndspE0MZCm3ZHPTjh+DiGbSUQftFvNEcthySa5
 sIM3GwC/5HslHnbiXOGlYjocZd7vHCouE/7EZTbIWb+WVbOGKSxX13YgfxPNZQwf1tm0/5c/6S
 bUAAAA=
X-Change-ID: 20240204-dpu-111-topology-b12c1de82c8a
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.14.2
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

Some SoCs such as SC7280 (used in the Fairphone 5) have only a single
DSC "hard slice" encoder.  The current hardcoded use of 2:2:1 topology
(2 LM and 2 DSC for a single interface) make it impossible to use
Display Stream Compression panels with mainline, which is exactly what's
installed on the Fairphone 5.

By loosening the hardcoded `num_dsc = 2` to fall back to `num_dsc =
1` when the catalog only contains one entry, we can trivially support
this phone and unblock further panel enablement on mainline.  A few
more supporting changes in this patch ensure hardcoded constants of 2
DSC encoders are replaced to count or read back the actual number of
DSC hardware blocks that are enabled for the given virtual encoder.
Likewise DSC_MODE_SPLIT_PANEL can no longer be unconditionally enabled.

Cc: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
Note that this doesn't paint the full picture in case there are SoCs
with more DSC hardware blocks, but when multiple virtual encoders
have already allocated most of them.  My initial plan was to code
ahead for dynamically tracking and reallocating these blocks in RM, if
some virtual encoder could potentially be using too many DSC encoders
which, while "power optimal", may not be able to support the number of
requested displays/interfaces.  Such a solution would automatically
ensure DSCmerge is *not* used when there are not enough hardware blocks
available in the first place.
---
Changes in v2:
- Fairphone is one word, lowercase the P from phone (Luca);
- Skip unnecessary if (dpu_enc->dsc) check and always count the number
  of non-NULL dpu_enc->hw_dsc[i] instead (Dmitry);
- Revert irrelevant whitespace cleanup in DSC comment, even if
  worthless enough to send separately (Dmitry);
- Drop dsc_common_mode=0 initialization and move existing 0-assignment
  from a random place in the function down to where this variable is
  actually being updated (Dmitry);
- Link to v1: https://lore.kernel.org/r/20250121-dpu-111-topology-v1-1-d01987205c53@somainline.org
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 47 +++++++++++++++--------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5172ab4dea995a154cd88d05c3842d7425fc34ce..b585cd17462345f94bcc2ddd57902cc7c312ae63 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -622,9 +622,9 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 		if (dpu_enc->phys_encs[i])
 			intf_count++;
 
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
-	if (dpu_enc->dsc)
-		num_dsc = 2;
+	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
+		if (dpu_enc->hw_dsc[i])
+			num_dsc++;
 
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }
@@ -686,13 +686,19 @@ static struct msm_display_topology dpu_encoder_get_topology(
 
 	if (dsc) {
 		/*
-		 * In case of Display Stream Compression (DSC), we would use
-		 * 2 DSC encoders, 2 layer mixers and 1 interface
-		 * this is power optimal and can drive up to (including) 4k
-		 * screens
+		 * Use 2 DSC encoders and 2 layer mixers per single interface
+		 * when Display Stream Compression (DSC) is enabled,
+		 * and when enough DSC blocks are available.
+		 * This is power-optimal and can drive up to (including) 4k
+		 * screens.
 		 */
-		topology.num_dsc = 2;
-		topology.num_lm = 2;
+		if (dpu_kms->catalog->dsc_count >= 2) {
+			topology.num_dsc = 2;
+			topology.num_lm = 2;
+		} else {
+			topology.num_dsc = 1;
+			topology.num_lm = 1;
+		}
 		topology.num_intf = 1;
 	}
 
@@ -2020,7 +2026,6 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
 static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 				 struct drm_dsc_config *dsc)
 {
-	/* coding only for 2LM, 2enc, 1 dsc config */
 	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
 	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
@@ -2030,22 +2035,24 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	int dsc_common_mode;
 	int pic_width;
 	u32 initial_lines;
+	int num_dsc = 0;
 	int i;
 
 	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
 		hw_pp[i] = dpu_enc->hw_pp[i];
 		hw_dsc[i] = dpu_enc->hw_dsc[i];
 
-		if (!hw_pp[i] || !hw_dsc[i]) {
-			DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
-			return;
-		}
+		if (!hw_pp[i] || !hw_dsc[i])
+			break;
+
+		num_dsc++;
 	}
 
-	dsc_common_mode = 0;
 	pic_width = dsc->pic_width;
 
-	dsc_common_mode = DSC_MODE_SPLIT_PANEL;
+	dsc_common_mode = 0;
+	if (num_dsc > 1)
+		dsc_common_mode |= DSC_MODE_SPLIT_PANEL;
 	if (dpu_encoder_use_dsc_merge(enc_master->parent))
 		dsc_common_mode |= DSC_MODE_MULTIPLEX;
 	if (enc_master->intf_mode == INTF_MODE_VIDEO)
@@ -2054,14 +2061,10 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	this_frame_slices = pic_width / dsc->slice_width;
 	intf_ip_w = this_frame_slices * dsc->slice_width;
 
-	/*
-	 * dsc merge case: when using 2 encoders for the same stream,
-	 * no. of slices need to be same on both the encoders.
-	 */
-	enc_ip_w = intf_ip_w / 2;
+	enc_ip_w = intf_ip_w / num_dsc;
 	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
+	for (i = 0; i < num_dsc; i++)
 		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i],
 					 dsc, dsc_common_mode, initial_lines);
 }

---
base-commit: 1573c8d4cb206a2d1454ff711e79f8df2353290b
change-id: 20240204-dpu-111-topology-b12c1de82c8a

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>

