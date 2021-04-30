Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B298370140
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 21:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE446F5AF;
	Fri, 30 Apr 2021 19:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3017D6F5A0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 19:31:08 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 z6-20020a17090a1706b0290155e8a752d8so2271431pjd.4
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 12:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jKrCMFaUZYfC0G8NCT7F60Xv834i4CVQddCUf4DQYq0=;
 b=cTPHj+Vz4O5A0F8McNO8BVWBJKCM+QJSRwxLLEwWGmsMDEns00UnT5P061Rbph8rt+
 6EfiKvfguHCzoBDfVKTAbn663PqpZyTpotGSy/BkUO8EgBOUiYYIobp/jk8CxAZK3S7U
 dswSQJK4GMfzaZ4ToJ+bg2lbeTx+WbMmDD5Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jKrCMFaUZYfC0G8NCT7F60Xv834i4CVQddCUf4DQYq0=;
 b=AcfpBvnyWNsdk8NkQYP0u+T6YjsLY7PMmnLjmybJESAOPRaLR2A1ge8Y7NkngKTknf
 fzP8NQsvoEtOEBy9CTBTFiLPzYWsAPxKKY18HXmhzVC7y0G4DslOSjqSiiN3CkINX7le
 Z7G8sNsmNReeYfENqnTlE4aPcc6rF7hiIUPy71uZ+ARKSq2220adDJ9sTaVS6Bw7jyfA
 cIwuawbwzTwc05g5Z3VWGfZ2HDWqlrBhQ/IZNhzjUhAHvJ9yH65EdOefxFpwxER8Gtc1
 mwV0TuapqSOEIOViVuYEwzsyZrCaY7CEv3jhMs6qoJTrcfQ2q/Nkzg90ObYIWWyzLk7f
 mNYg==
X-Gm-Message-State: AOAM533+SacHkJFRbmYcy6X/bOg4A8Tr53qZD2L+Xl+e3TXhfZlDg3dz
 mSV/DHNfDghHPhgXJXfKQV3s7Q==
X-Google-Smtp-Source: ABdhPJyWXB03cIj9xky5L3f/X35TMsnbMkOr8+xmL7ReqVKkoBkiONcQBBzP1LUaiv5gnOs2rZuwyg==
X-Received: by 2002:a17:90a:bb13:: with SMTP id
 u19mr6766979pjr.96.1619811067805; 
 Fri, 30 Apr 2021 12:31:07 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:dacb:8fee:a41f:12ac])
 by smtp.gmail.com with ESMTPSA id t6sm3143500pjl.57.2021.04.30.12.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 12:31:07 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH 1/6] drm/msm: Move vblank debug prints to drm_dbg_vbl()
Date: Fri, 30 Apr 2021 12:30:59 -0700
Message-Id: <20210430193104.1770538-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210430193104.1770538-1-swboyd@chromium.org>
References: <20210430193104.1770538-1-swboyd@chromium.org>
MIME-Version: 1.0
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Put these debug prints in the vblank code into the appropriate vblank
category via drm_dbg_vbl().

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: aravindh@codeaurora.org
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
 drivers/gpu/drm/msm/msm_drv.c                        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 9a69fad832cd..9bb2d13a1f44 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -416,7 +416,7 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
 		goto end;
 	}
 
-	DRM_DEBUG_KMS("id:%u enable=%d/%d\n", DRMID(phys_enc->parent), enable,
+	DRM_DEBUG_VBL("id:%u enable=%d/%d\n", DRMID(phys_enc->parent), enable,
 		      atomic_read(&phys_enc->vblank_refcount));
 
 	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 196907689c82..ad79c37d4df9 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -683,7 +683,7 @@ int msm_crtc_enable_vblank(struct drm_crtc *crtc)
 	struct msm_kms *kms = priv->kms;
 	if (!kms)
 		return -ENXIO;
-	DBG("dev=%p, crtc=%u", dev, pipe);
+	drm_dbg_vbl(dev, "crtc=%u", pipe);
 	return vblank_ctrl_queue_work(priv, pipe, true);
 }
 
@@ -695,7 +695,7 @@ void msm_crtc_disable_vblank(struct drm_crtc *crtc)
 	struct msm_kms *kms = priv->kms;
 	if (!kms)
 		return;
-	DBG("dev=%p, crtc=%u", dev, pipe);
+	drm_dbg_vbl(dev, "crtc=%u", pipe);
 	vblank_ctrl_queue_work(priv, pipe, false);
 }
 
-- 
https://chromeos.dev

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
