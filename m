Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD7B801536
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 22:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F0D10E972;
	Fri,  1 Dec 2023 21:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD4A10E966
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 21:19:03 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c9b88cf626so35543351fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 13:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701465541; x=1702070341; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cO2+rr8QXkIOXuaHuUAHDNGeKygnIFgZt3IFpOuo6+Y=;
 b=Zii9w1K+igPfvkZLDNVgwT7/3tC6F41xehZhoq8y7HhsBTef/2us57aNtRtb89rjh5
 z5B/N6OS0traO8w/W92YWlEJjVAhCT/ZmNFVqDGYH85O2rQ3SPTH7/quHMMlM+/xxyrw
 K4wKWNcbLnL84axGJPoU9erra+4cMSC3RAHLA+3HmPxi+xd/iqluSFzm4EropESAcR1g
 eHqaeQsYtm+UHlJcDquiNKjcl91VFIvUe1mJ5wPaU2DtgXEjd7FzTN7tHnGFsA/69Lm5
 j88YX2NonBDCRibIdm3nXBKCoHOPqS7SsCFfvTljtSvdMNRAPQ/nzkomg+xN1n7bCrst
 sGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701465541; x=1702070341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cO2+rr8QXkIOXuaHuUAHDNGeKygnIFgZt3IFpOuo6+Y=;
 b=JZWWnJOMoZueQXJyuS0y8KYXjxoX7kJIkal2d4DMkhwOI/coKHjqwSsmsx+YlMcca7
 W06P0xiBBwvg9dA9D7DL8aAI0dIWlTT4CMjWL5hRWTVBOtctKacZLVlIwRZIop2hTcVC
 N3doSoalCKVER8PN92DLUTmZK9baXmj0u7RWIyg8nl9mRSGwpCx8ev2UP9yeu6irD0XV
 jzBjvujElhZFy7ueswT2j/efODzSSch+UMUpzJvCAivfUM6q3K0v5ZErQosTs3Teyxm9
 10Y8CWmsKyEyQrbHR5AQCvyRFbi07f9a/ajvExFwJXgrcpishDLl9RCATvaVexTcmEqP
 H7vg==
X-Gm-Message-State: AOJu0YxfLHfmQ/3QXYQTHIYEhMMkICblnblCHKYGJ7T3HYiXwi6GHOCu
 72Grj17DQoAAaRdMf6pqlyzU/A==
X-Google-Smtp-Source: AGHT+IFCFo+Jf6rZMsjGqmd3OMOl4tSqAkYxIs4SXF4bO/2cwb5SK6Gr7JQd+eTDRs2IjRom2lhsQg==
X-Received: by 2002:a2e:9f4e:0:b0:2c9:d872:e7aa with SMTP id
 v14-20020a2e9f4e000000b002c9d872e7aamr1193435ljk.97.1701465541425; 
 Fri, 01 Dec 2023 13:19:01 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 13:19:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 12/13] drm/msm/dpu: drop dpu_encoder_phys_ops::destroy
Date: Sat,  2 Dec 2023 00:18:44 +0300
Message-Id: <20231201211845.1026967-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
References: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
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
index fdbaa92ec1ad..0dc74e315a9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -452,24 +452,6 @@ static void dpu_encoder_destroy(struct drm_encoder *drm_enc)
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
index 5dc53b65040e..b6b48e2c63ef 100644
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

