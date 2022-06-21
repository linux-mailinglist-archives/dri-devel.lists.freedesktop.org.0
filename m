Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E99D55302E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 12:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F78B10EFA6;
	Tue, 21 Jun 2022 10:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352468825B;
 Tue, 21 Jun 2022 10:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655808828; x=1687344828;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=CfxCnLkx8qDNg+hw34ZntdovidZpeIyItmpLtPTt2cA=;
 b=VmrIl8mNBC2mWj4YZPFR4qEKrq/8FLw/XED1jj9TC7y0nPmM01XHtQgy
 fJzmfYToeSexFWJyTG+mPotoN3zlzr5VvrkD+QFJXS3Le/NbLFJXXjzig
 GBxnJFVSzpgmp8aG6svju4OIIMWDKzEy1tzZrbv7nh4FKTJHTTiNlwJrs s=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 21 Jun 2022 03:53:47 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 21 Jun 2022 03:53:46 -0700
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg01-blr.qualcomm.com with ESMTP; 21 Jun 2022 16:23:31 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id A28683D58; Tue, 21 Jun 2022 16:23:30 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: y@qualcomm.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [v3 4/5] drm/msm/disp/dpu1: use atomic enable/disable callbacks for
 encoder functions
Date: Tue, 21 Jun 2022 16:23:19 +0530
Message-Id: <1655808800-3996-5-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1655808800-3996-1-git-send-email-quic_vpolimer@quicinc.com>
References: <y>
 <1655808800-3996-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use atomic variants for encoder callback functions such that
certain states like self-refresh can be accessed as part of
enable/disable sequence.

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 52516eb..cc2809b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1130,7 +1130,8 @@ void dpu_encoder_virt_runtime_resume(struct drm_encoder *drm_enc)
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
+static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
+					struct drm_atomic_state *state)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	int ret = 0;
@@ -1166,7 +1167,8 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
+static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
+					struct drm_atomic_state *state)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	int i = 0;
@@ -2332,8 +2334,8 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 
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

