Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 655844BDA62
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 15:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEAF10E636;
	Mon, 21 Feb 2022 14:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595B010E53B;
 Mon, 21 Feb 2022 14:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645455122; x=1676991122;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=7zKbToleG1WT0KN2p5rHgnHFn63VOV0ZbE7O7kaL/+8=;
 b=ZWdweIy83urCMPWm9WpEK6CV8R0091c8SaYeRWo0xwNwMYkqs5hnygzV
 9JXTY6aFV3dgETPsrz6XNMIXljgop2rlKeUzKyD+wgGcuvpXGvxc6vdA8
 tDubwFtSZgHPEo9GYdycMadpTe9V6X191gj0ifFHxHt7IFElBDbIse/Ty o=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 21 Feb 2022 06:52:02 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 21 Feb 2022 06:52:00 -0800
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 21 Feb 2022 20:21:40 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id D88585392; Mon, 21 Feb 2022 20:21:38 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, robdclark@gmail.com, seanpaul@chromium.org,
 swboyd@chromium.org, dianders@chromium.org,
 krzysztof.kozlowski@canonical.com, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 3/4] drm/msm/disp/dpu1: use atomic enable/disable callbacks
 for encoder functions
Date: Mon, 21 Feb 2022 20:21:25 +0530
Message-Id: <1645455086-9359-4-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_vproddut@quicinc.com, Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use atomic variants for encoder callback functions such that
certain states like self-refresh can be accessed as part of
enable/disable sequence.

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Changes in v2:
- As per review suggestion by Dmitry.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1e648db..6eac417 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1138,7 +1138,8 @@ void dpu_encoder_virt_runtime_resume(struct drm_encoder *drm_enc)
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
+static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc,
+				struct drm_atomic_state *state)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	int ret = 0;
@@ -1176,7 +1177,8 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
+static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc,
+				struct drm_atomic_state *state)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	struct msm_drm_private *priv;
@@ -2094,8 +2096,8 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 
 static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 	.mode_set = dpu_encoder_virt_mode_set,
-	.disable = dpu_encoder_virt_disable,
-	.enable = dpu_encoder_virt_enable,
+	.atomic_disable = dpu_encoder_virt_disable,
+	.atomic_enable = dpu_encoder_virt_enable,
 	.atomic_check = dpu_encoder_virt_atomic_check,
 };
 
-- 
2.7.4

