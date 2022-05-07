Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4303B51E2E1
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 03:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B3110F032;
	Sat,  7 May 2022 01:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5F910F006
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 01:00:48 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id v4so11036094ljd.10
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 18:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zsynBbueSToYzX5WMMz7SkW3IlbctHxAF7JF9/2O4nY=;
 b=WAdHJaX982/fR1DGH3s8YtXLo96nhQCg98G0gDgIU1fZstmx5WubyFH8Yc8lKr6PyD
 sAuirokaBXI9YZ3GlCsAGotxOP9w7gyc4IbQXIkvLYQMf+nXF16Lku3G9wRoKf1d96H8
 IMSOnL3iN9DGaiK+ABvkIF2Dc4zBe6cl1ms/Bi1BbZ8PyC2kWqfcp/1/xzM3a+u1cwLO
 SxT9NIfjSIIHWFu76CwtLpbJ+j6yAWnHiQrZhk0HxXNbOirvB5ntWuIamPHDzdKXLcuR
 cv60RMMfH3lVSfqb1iI/qNHFp5v+UpxZlXG4oOBhngcpd3mYC9AbV9phBzNpVOAUH4ok
 +ZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zsynBbueSToYzX5WMMz7SkW3IlbctHxAF7JF9/2O4nY=;
 b=SS86pFYfcZDFFw3T6WrubLORMFsdPQcBBJZ2kcuruFvUKiWB44t4czH17O+7z0OJd7
 6fQMzf64xFye7cSNUDfsJ/2ARGl/9PDhcMp5v3qr8PyFfcbOesXFSJmwasUwNF76f2aA
 DZMgW16ecF1Wa+QCPkmh/r9qbErXHQp/lGlwYM3Aloj/bdov2xkxsooHR5N+iDZbBqD9
 Ggi9bMh3z9KX5SvoS5DElQD61XEp1t2ZDeu9n/Flo6PSsf7toA/BcAt7/eH0HoNQX+kb
 wXzYr8S1UEfZC+nlyHVbQkrE4I5h8eK8mmjS/lql2GEJ9Tvmqjkdom58L85jTAhFNNxR
 rXBA==
X-Gm-Message-State: AOAM533ArgcjnKR7caRTXCIyyBsmAsdxUKfodEet+GMVyNsa7SFBelSz
 c/8orj10JlSB6br3GdpwCTLfOg==
X-Google-Smtp-Source: ABdhPJypb/gJ6z2lXz/aRu6eSZL+QrLD7NYp78yWw0SrcxAm8OzLPDD40inSRGuwO9m05QLRoNniSg==
X-Received: by 2002:a2e:9e03:0:b0:24f:153c:c479 with SMTP id
 e3-20020a2e9e03000000b0024f153cc479mr3740299ljk.13.1651885247869; 
 Fri, 06 May 2022 18:00:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 m8-20020a0565120a8800b0047255d21123sm886335lfu.82.2022.05.06.18.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 18:00:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/3] drm/msm/mdp5: convert to drm_crtc_handle_vblank()
Date: Sat,  7 May 2022 04:00:45 +0300
Message-Id: <20220507010046.1667809-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507010046.1667809-1-dmitry.baryshkov@linaro.org>
References: <20220507010046.1667809-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stop using deprecated drm_handle_vblank(), use drm_crtc_handle_vblank()
instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
index d573ff29d5a4..18cc62f1e7ec 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
@@ -85,8 +85,7 @@ static irqreturn_t mdp5_irq(int irq, void *arg)
 	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(mdp_kms);
 	struct drm_device *dev = mdp5_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	unsigned int id;
+	struct drm_crtc *crtc;
 	uint32_t status, enable;
 
 	enable = mdp5_read(mdp5_kms, REG_MDP5_INTR_EN);
@@ -97,9 +96,9 @@ static irqreturn_t mdp5_irq(int irq, void *arg)
 
 	mdp_dispatch_irqs(mdp_kms, status);
 
-	for (id = 0; id < priv->num_crtcs; id++)
-		if (status & mdp5_crtc_vblank(priv->crtcs[id]))
-			drm_handle_vblank(dev, id);
+	drm_for_each_crtc(crtc, dev)
+		if (status & mdp5_crtc_vblank(crtc))
+			drm_crtc_handle_vblank(crtc);
 
 	return IRQ_HANDLED;
 }
-- 
2.35.1

