Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEAB768348
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 03:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E7510E25F;
	Sun, 30 Jul 2023 01:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4186810E254
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 01:19:41 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5222bc91838so4828509a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 18:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690679979; x=1691284779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2fetHFJrVBIqajjO9vTTq/S6N654BcjogotSI7gQiFo=;
 b=ujNkHJAazoZqzoWj7LGFkhps5mu9P88G1UBvPqTugJhE3KNixYjxPGnw9I7WCLJOKJ
 NeWXMtY3LLRVvgz3cJFIYG3VuCgdtElJNeVxZW/ad6HNptLhAaqIxQ6Sqvv3dHzar9GL
 brpfnRMdVBvtmJw9QOMEMADFyva97Xy70n/IoIqRx0vVH9R6CeohL9Z1pi3AFjFKGdMu
 Q+CGsfgRtj078j8i23MgrW1gdxhXYhSmoUP8juVAHL5JIZ0s8wil0BWtzUKOThapNEL3
 ulw2td8WVE2AtydSvmF5L2icx3Vapyf3sm+DkpgYKnQa7FxhYA4Yt3Dxe1B6pYomGS3q
 3HQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690679979; x=1691284779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2fetHFJrVBIqajjO9vTTq/S6N654BcjogotSI7gQiFo=;
 b=CYtjnZYP4oMdZ/KW2KOjVUD2hJHSLcZAsivwj3Q5bk5TFCcRMMAcswjVhBXbwjQ0tB
 nDAY47n56TssX0k+sm39T0A5ReoFr7mmXs2Kr8tx1YJPjbQ+qQM91hqcERHgXKVNNkH8
 Z3AAXpFs5KrKa7lItLifY22luEKkg638DheLEwrlqhxUa4DhYn8XGJ+Eylc+W+PxQACF
 3DqWQ5FYLH5Gcuap4NrVpgjmUlYbY7LTZ33PkOj8BUuCDAI9fLdUCpdFJNHGAtLHRt7H
 bJ8YFuW9JT/q/3X2wCivziqyjnGsOhN+wVNV0gz/21tvww9RO7GgND9IIhTXOy10TSCM
 Eseg==
X-Gm-Message-State: ABy/qLb88CUAaj1VMgau905FjL9/LOw33ZObHq9eRZnVJGPHdYoAf90/
 vM6rCSMyP1SQhJteEoav8aPOLQ==
X-Google-Smtp-Source: APBJJlEmjqZdWteCTFoMqqW3CVl1NdBglW6pK0FOgL7T1Cv70ZrFJvc0u8h8dcsts4pr1EZw5c8mcg==
X-Received: by 2002:a17:906:739a:b0:98e:37fe:691b with SMTP id
 f26-20020a170906739a00b0098e37fe691bmr3651099ejl.34.1690679979761; 
 Sat, 29 Jul 2023 18:19:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 rk21-20020a170907215500b00992ea405a79sm3915835ejb.166.2023.07.29.18.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 18:19:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 12/13] drm/msm/dpu: drop dpu_encoder_phys_ops::destroy
Date: Sun, 30 Jul 2023 04:19:19 +0300
Message-Id: <20230730011920.354575-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
References: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the dpu_encoder_phys_ops' destroy() callback. No phys backend
implements it anymore, so it is useless.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c    | 18 ------------------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  2 --
 2 files changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 6a7ea73fe6e2..2b94ff3d08a1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -456,24 +456,6 @@ static void dpu_encoder_destroy(struct drm_encoder *drm_enc)
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
-	mutex_lock(&dpu_enc->enc_lock);
-
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-
-		if (phys->ops.destroy) {
-			phys->ops.destroy(phys);
-			--dpu_enc->num_phys_encs;
-			dpu_enc->phys_encs[i] = NULL;
-		}
-	}
-
-	if (dpu_enc->num_phys_encs)
-		DPU_ERROR_ENC(dpu_enc, "expected 0 num_phys_encs not %d\n",
-				dpu_enc->num_phys_encs);
-	dpu_enc->num_phys_encs = 0;
-	mutex_unlock(&dpu_enc->enc_lock);
-
 	drm_encoder_cleanup(drm_enc);
 	mutex_destroy(&dpu_enc->enc_lock);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 4fb0d95f3061..757ce58f958b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -72,7 +72,6 @@ struct dpu_encoder_phys;
  * @enable:			DRM Call. Enable a DRM mode.
  * @disable:			DRM Call. Disable mode.
  * @atomic_check:		DRM Call. Atomic check new DRM state.
- * @destroy:			DRM Call. Destroy and release resources.
  * @control_vblank_irq		Register/Deregister for VBLANK IRQ
  * @wait_for_commit_done:	Wait for hardware to have flushed the
  *				current pending frames to hardware
@@ -102,7 +101,6 @@ struct dpu_encoder_phys_ops {
 	int (*atomic_check)(struct dpu_encoder_phys *encoder,
 			    struct drm_crtc_state *crtc_state,
 			    struct drm_connector_state *conn_state);
-	void (*destroy)(struct dpu_encoder_phys *encoder);
 	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
 	int (*wait_for_commit_done)(struct dpu_encoder_phys *phys_enc);
 	int (*wait_for_tx_complete)(struct dpu_encoder_phys *phys_enc);
-- 
2.39.2

