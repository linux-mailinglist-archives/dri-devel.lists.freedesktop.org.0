Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7DB74BACC
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 03:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DAE10E63B;
	Sat,  8 Jul 2023 01:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A4010E06D
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:14 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b6afc1ceffso40739771fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778253; x=1691370253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2II3eP/imOK3wgOrSDeLiLVf5Scf+gSw5v2bj8N9xHc=;
 b=RZocBjiVJprEs93xGEUXJmEZg67XQcLKV4GI9CSye+jwEprd1kpbiEBCi4dgD099JV
 YUuv3FlJPcrrk20avme4buforkmOmZqUrykOulLb8jpuqbyzt1zzox+/2G8ONG0Ayl2J
 52RqOEF0K+eI18akuycEowccqK0k7FCGdG5IGSEq9mkN2QELYa7rHjClfupNsgdFjm9g
 j97SMUhgkLSsLgAPYUOTHGql1pwaTjtiM/oavPOu++HzYBDNh4fVc4azmCHZOPrNNemy
 F9Mip/77U5cPEGYCIof9tmCKVMOteo3JO6E85mOP/rIqlZs+WvvXorhA1lQvKyXFpldk
 5f3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778253; x=1691370253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2II3eP/imOK3wgOrSDeLiLVf5Scf+gSw5v2bj8N9xHc=;
 b=gFH90Poe8aa+ng4OiSedLUlSEK32ZbHC5yCRPjzOcMQyIoM0Rilskl4RyRGFmcJTu0
 YFaBHXBeonn+4ScykWxfK4yQ6Qvbk6D3mGgP7IMRlVgbeWbc3I1PeMqH6LvuuJUVqm2c
 DvbHMuYADhwyh7DeD8pBBAL0beKKRLpMNBaY1Gi0qs1+Robes2ZwF4nbWdpNatyYr2fo
 BkIeDDcbls/jo93HkzCUVAQMilTXbuqcCoC0l84Drmrsd5TwZEy22Li8OCmDjdfAYgqR
 sEvBnFJIpnC9aEfco6lIR8lwpOJBK9+ZOWGCiz30R/sR/rjN235TzDE9zSuJ9Q6JYDeM
 cqIg==
X-Gm-Message-State: ABy/qLYB+aLAthFVJM3q1pBz9UBIWL2CffiaU7zDmzGLT2ayRTWH9v2a
 Hlhm8r0P9isAWFBnw68Af54i+A==
X-Google-Smtp-Source: APBJJlGP8VAjq6k876CRT56faHFdQfRap+fUYG9xImOyv+dOqSre58JgXws72E9dWNiKNRgoi9Q8oA==
X-Received: by 2002:a2e:80cd:0:b0:2b6:dd9a:e1d3 with SMTP id
 r13-20020a2e80cd000000b002b6dd9ae1d3mr4753616ljg.44.1688778253013; 
 Fri, 07 Jul 2023 18:04:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 06/17] drm/msm/mdp5: use devres-managed allocation for SMP data
Date: Sat,  8 Jul 2023 04:03:56 +0300
Message-Id: <20230708010407.3871346-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
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

Use devm_kzalloc to create SMP data structure. This allows us
to remove corresponding kfree and drop mdp5_smp_destroy() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  3 ---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c | 19 ++++---------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h |  1 -
 3 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index be4338a48e52..0a85777625d3 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -618,9 +618,6 @@ static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 {
 	int i;
 
-	if (mdp5_kms->smp)
-		mdp5_smp_destroy(mdp5_kms->smp);
-
 	for (i = 0; i < mdp5_kms->num_intfs; i++)
 		kfree(mdp5_kms->intfs[i]);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
index 56a3063545ec..d7c957207255 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
@@ -370,23 +370,17 @@ void mdp5_smp_dump(struct mdp5_smp *smp, struct drm_printer *p)
 		drm_modeset_unlock(&mdp5_kms->glob_state_lock);
 }
 
-void mdp5_smp_destroy(struct mdp5_smp *smp)
-{
-	kfree(smp);
-}
 
 struct mdp5_smp *mdp5_smp_init(struct mdp5_kms *mdp5_kms, const struct mdp5_smp_block *cfg)
 {
+	struct drm_device *dev = mdp5_kms->dev;
 	struct mdp5_smp_state *state;
 	struct mdp5_global_state *global_state;
 	struct mdp5_smp *smp = NULL;
-	int ret;
 
-	smp = kzalloc(sizeof(*smp), GFP_KERNEL);
-	if (unlikely(!smp)) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	smp = devm_kzalloc(dev->dev, sizeof(*smp), GFP_KERNEL);
+	if (unlikely(!smp))
+		return ERR_PTR(-ENOMEM);
 
 	smp->dev = mdp5_kms->dev;
 	smp->blk_cnt = cfg->mmb_count;
@@ -400,9 +394,4 @@ struct mdp5_smp *mdp5_smp_init(struct mdp5_kms *mdp5_kms, const struct mdp5_smp_
 	memcpy(smp->reserved, cfg->reserved, sizeof(smp->reserved));
 
 	return smp;
-fail:
-	if (smp)
-		mdp5_smp_destroy(smp);
-
-	return ERR_PTR(ret);
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h
index ba5618e136c3..d8b6a11413d9 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h
@@ -68,7 +68,6 @@ struct mdp5_smp;
 
 struct mdp5_smp *mdp5_smp_init(struct mdp5_kms *mdp5_kms,
 		const struct mdp5_smp_block *cfg);
-void  mdp5_smp_destroy(struct mdp5_smp *smp);
 
 void mdp5_smp_dump(struct mdp5_smp *smp, struct drm_printer *p);
 
-- 
2.39.2

