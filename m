Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F665703A3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 14:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB388E4A8;
	Mon, 11 Jul 2022 12:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AE68E53A;
 Mon, 11 Jul 2022 12:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657544256; x=1689080256;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=IJwgUw/mIIKj1zqAJyxwd4+tzpUEr2xC/MuaDOMXlpk=;
 b=uXmwLGWFEStZ5jYNYB4y7eo7NGSqGjuwQYE+zGSRnMKcJipb2DQ9Yc3X
 gbwHu/MLATyB5j4esrp311IBtorFYpA4As+YLcBwEEUfYVtozqg7QVye/
 U3ItRWltB3gHAtrzcRPFkUKTW34GWeuBLqi9ASDnILcy934xc0LlhkrJT w=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 11 Jul 2022 05:57:35 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 11 Jul 2022 05:57:34 -0700
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 11 Jul 2022 18:27:11 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 6D8163E4D; Mon, 11 Jul 2022 18:27:07 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v6 08/10] drm/msm/disp/dpu: use atomic enable/disable
 callbacks for encoder functions
Date: Mon, 11 Jul 2022 18:27:02 +0530
Message-Id: <1657544224-10680-9-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
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
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com, quic_khsieh@quicinc.com,
 dianders@chromium.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use atomic variants for encoder callback functions such that
certain states like self-refresh can be accessed as part of
enable/disable sequence.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0fddc9d..3156efb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1129,7 +1129,8 @@ void dpu_encoder_virt_runtime_resume(struct drm_encoder *drm_enc)
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
+static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
+					struct drm_atomic_state *state)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	int ret = 0;
@@ -1165,7 +1166,8 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
+static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
+					struct drm_atomic_state *state)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	int i = 0;
@@ -2330,8 +2332,8 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 
 static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
-	.disable = dpu_encoder_virt_disable,
-	.enable = dpu_encoder_virt_enable,
+	.atomic_disable = dpu_encoder_virt_atomic_disable,
+	.atomic_enable = dpu_encoder_virt_atomic_enable,
 	.atomic_check = dpu_encoder_virt_atomic_check,
 };
 
-- 
2.7.4

