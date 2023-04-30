Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A036F2BB4
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 01:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0126A10E14E;
	Sun, 30 Apr 2023 23:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7FD10E110
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 23:57:38 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2a8ba693f69so20601761fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 16:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682899055; x=1685491055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZOrIz3NMUHzc4Jds1q96BiI5FcvAaLjz05V/ffabh1k=;
 b=mxbwUkNrs08+j6OpQviJACylAMwExoOacy7GIWiAZk1z8Cr/dpulcT21TV4ouibs/J
 Qkehfi3YkFQMZi1Jj/6cdtyQ7VMMPOMy2VIniaPyaixvkuNL1XyZameYnxBWzG+QxoWy
 upY9Rk9rOPu8igdA+J7QbtgASphFP/payC/PJeFkXwCMWUNyQfJ+5N5/0Prw62Uaf96B
 FehmwiyN507YHmRZ2aTSr7i+DSwBwoXMSN/dESfXg1lSTn77Q27+mpgnu+aDEFvMA914
 6lTP6jJ2rrwIGnoMUYo73ufVhqeFWxhnQCDWsM4b+RbBsF+zfeqamAsZqY1IWj79+sTv
 4YlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682899055; x=1685491055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZOrIz3NMUHzc4Jds1q96BiI5FcvAaLjz05V/ffabh1k=;
 b=dVt61PRWrFn1olGb7TOyITWpM4AjJGhBvrDbzbO3iTR/Y3u7NeZfneKaLOPD4FTjnc
 iWzvjtAoC5bVnBOWJhUDtFGOY979k7ikEQIyE6YlaeyJe6ofDa+codBTjdOLNerdlkND
 rXMF0E8L2vdqVrt/+6VRKHHF2D4pm0Rz+gEUjSPrJzcPSLGWvCB7WYHwrz2hGSXK4GeN
 Sa43lva0uJdRjmhToQvM3LnLeHiygwS8q2V9Q1liWK432BwAA3KhSzciSDCa12mtbdqb
 CypIk8M7JEIonlOEE0XE33hxgitBy2u/d7i+cBQ8DgMtR+lM1N5rYjQ6vEUPHNaoSVxa
 2d/w==
X-Gm-Message-State: AC+VfDwo7FHmb354+uDF1fQMkI33yyXU1aau3by1Kw7vt0rLpayVMolc
 43whAylOq5j3M0KPkhtvhpVLUQ==
X-Google-Smtp-Source: ACHHUZ7XhNfYFsiX56pvRTS+MsN4k/Ki6ULAaiGilTkcMepabLO3IyC5lMv+9nwArMycl14Q0rZDtQ==
X-Received: by 2002:a05:651c:105:b0:2a9:f94f:d304 with SMTP id
 a5-20020a05651c010500b002a9f94fd304mr3425249ljb.19.1682899054856; 
 Sun, 30 Apr 2023 16:57:34 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 p19-20020a2e9a93000000b002a9f022e8bcsm4292099lji.65.2023.04.30.16.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 16:57:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 2/7] drm/msm/dpu: drop dpu_encoder_early_unregister
Date: Mon,  1 May 2023 02:57:27 +0300
Message-Id: <20230430235732.3341119-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need to clean up debugfs manually, it will be done by the
DRM core on device deregistration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 32785cb1b079..8c45c949ec39 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2154,13 +2154,6 @@ static int dpu_encoder_late_register(struct drm_encoder *encoder)
 	return _dpu_encoder_init_debugfs(encoder);
 }
 
-static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
-{
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
-
-	debugfs_remove_recursive(dpu_enc->debugfs_root);
-}
-
 static int dpu_encoder_virt_add_phys_encs(
 		struct msm_display_info *disp_info,
 		struct dpu_encoder_virt *dpu_enc,
@@ -2374,7 +2367,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
 		.destroy = dpu_encoder_destroy,
 		.late_register = dpu_encoder_late_register,
-		.early_unregister = dpu_encoder_early_unregister,
 };
 
 struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
-- 
2.39.2

