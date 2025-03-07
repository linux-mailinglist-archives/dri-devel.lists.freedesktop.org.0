Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFE3A560C5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 07:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345E810EAF4;
	Fri,  7 Mar 2025 06:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SbAXzbP4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21DA10E0A8;
 Fri,  7 Mar 2025 06:25:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2F6F7A4551C;
 Fri,  7 Mar 2025 06:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA8AC4CED1;
 Fri,  7 Mar 2025 06:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741328704;
 bh=nJoWHOMQ8q8HP76pYfSPuPBQ6x3qxxqKS53pX2IDBLI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SbAXzbP4PqqfXPNpC7j7AaLa0fIiaCe2lm52upDJmU7dwS3uhbWFoi3EYq3vgByqO
 Uy3RAsdmRwosVmumzSKSOgQp/az7VL1dkMPTfF9XjqL2n3QJ/9PgB8IW+A5j/CV8bB
 S0jbAIgkNtBuPnejMq17PrRXjrn6xYh1hvBZHMTuue0asJhrIzBSdsryZpu6fRFINh
 loftolThnJxqhYsJ9MVY/48Xn/2ugzXH5LmPJlhdTRPKJh8k65YW6bv0N9jWAEMmI9
 6ezsItBolOTEgvfwY8ASUgA9+/4ZQcY7xWcX1gwop7CHbVBFEU5XuldtUrLwYmJ7KT
 ksbuDF/xGiUyg==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Fri, 07 Mar 2025 08:24:51 +0200
Subject: [PATCH v3 3/8] drm/msm/dpu: pass master interface to CTL configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-dpu-active-ctl-v3-3-5d20655f10ca@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
In-Reply-To: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2026;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oVfKOWmTPH50k3vMdPgIIC2WrqXf0n9e3Mps/0OUaaQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnypE0/QQLLH8Tc8Vq3wDQPyBTwbI1ZpZuH9xQC
 qFLLhWC556JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8qRNAAKCRCLPIo+Aiko
 1e9vB/924ommEply1S72q20YfRcBAI1r6VU6QVp/4u0zddnvilukGQ2rSvYuDzpdVxvTKTmu2V+
 c3RANegzKbWxA83T6XesT3em9SoGRDpgxyFcy4LW7Xcpxnq4iml8jAoo6SgT86zpTrNGCBQalkj
 7MDFs0j/XiefmeZ2RYy7oTm4vhHkWLzGgpidDiC4jcetNRM+ya+RuZfqxyo3M05F1+9FvuVcTJ4
 qjT2+UqCMg4MnJgH72qux8ia2GSU5Z7MEkMmoQM+LT6tU0NmmavAGpV42gb9fiXT983LJzsK3OD
 p1TtBPQIbIWsTho3ybni6vnTeL13PDRi9+oONMjgp3N/UjvS
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Active controls require setup of the master interface. Pass the selected
interface to CTL configuration.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index da9994a79ca293ec0265680c438835742102db2a..a0ba55ab3c894c200225fe48ec6214ae4135d059 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -60,6 +60,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 		return;
 
 	intf_cfg.intf = phys_enc->hw_intf->idx;
+	if (phys_enc->split_role == ENC_ROLE_MASTER)
+		intf_cfg.intf_master = phys_enc->hw_intf->idx;
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
 	intf_cfg.stream_sel = cmd_enc->stream_sel;
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index abd6600046cb3a91bf88ca240fd9b9c306b0ea2e..232055473ba55998b79dd2e8c752c129bbffbff4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -298,6 +298,8 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	if (phys_enc->hw_cdm)
 		intf_cfg.cdm = phys_enc->hw_cdm->idx;
 	intf_cfg.intf = phys_enc->hw_intf->idx;
+	if (phys_enc->split_role == ENC_ROLE_MASTER)
+		intf_cfg.intf_master = phys_enc->hw_intf->idx;
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_VID;
 	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);

-- 
2.39.5

