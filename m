Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B40674BAC1
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 03:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B7010E161;
	Sat,  8 Jul 2023 01:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF07E10E055
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:12 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b63e5f94f1so31584481fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778251; x=1691370251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FhZxoa6vuDbilJsKkx3e64dlv9EEmCnJ4NShTCH1woQ=;
 b=WR2v2wjRNClqpLniua2drXqwsSn/u6s094y3iOx4FDSbPOJDzvFYcvSuuS7oQbQ0uT
 X41/1Sd4YLwvjYWux8RPuopUyimF6etV63QOHf1Q29Ehbr5JEFNsmlVBHOMacyP1swDb
 vUTDTKTZ2+gqFw1FIjJfEqzS5X7Z3J9Ly0zWwratIppJ90QO7l0VQdHX0UxlURhC7GTp
 10070CTQDC8F50RkRmhqF9WtZG0xJGJG0uja6hq8DJKotKcX6a5i0FKr/OW7rjqNvitB
 dhJTirrxGWmdm/h1epSePP3FXCkItkE3hjqAGCaY8ilItsvIOwAMNJ1bTBgyK3JGGFCZ
 kS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778251; x=1691370251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FhZxoa6vuDbilJsKkx3e64dlv9EEmCnJ4NShTCH1woQ=;
 b=JPyNt12ZPQN9k67NJ7qt9M5/+bBx8DNccyrN5FHTU/qlAYENg9ytZSDrK9gqxMflZr
 dj0dsbHboO7/eNFnpbcripmfCyrjoyBe5TY+QGp7AnNBYM5K4Cnf8X0oLeMf8tb0jbht
 KkDyJ5nh2XsDZr6+hR8hzr/q+74jeYKh+ew8PGDnp6HeUvjkvxMGjE8mJLZTf2Gi6xds
 YOA6tqlZhPgeeoK6M7lx2IO95ck1L8Qh/oW0HmeE/1v2v/4P4INEs0yLyDhvn+xzZiuG
 blNUB7/m9UiPfg/wESk8bRgSHXbjb5UQrCFeyqKTvPKpM6VXPZ5wFLNJDV/wUPLC1zYJ
 ihbA==
X-Gm-Message-State: ABy/qLa190cpK2vje2d6m1bb+eUYolHOsYvBUgr+02vlXqsCOH+1VqRL
 ETxSIf1sSt4JYEAQeX1NGkAq7g==
X-Google-Smtp-Source: APBJJlGvn73jNS+QweO+UmzyrjUSBb1BZwNN5wkpgMNIosKfJKqTYRz4PxGLqAWCoaTWyDbCONrS8g==
X-Received: by 2002:a05:651c:107b:b0:2b6:d7d2:1a65 with SMTP id
 y27-20020a05651c107b00b002b6d7d21a65mr3852447ljm.18.1688778250909; 
 Fri, 07 Jul 2023 18:04:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 03/17] drm/msm/mdp5: use devres-managed allocation for CTL
 manager data
Date: Sat,  8 Jul 2023 04:03:53 +0300
Message-Id: <20230708010407.3871346-4-dmitry.baryshkov@linaro.org>
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

Use devm_kzalloc to create CTL manager data structure. This allows us
to remove corresponding kfree and drop mdp5_ctlm_destroy() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c | 21 ++++-----------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 --
 3 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
index 1220f2b20e05..666de99a46a5 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
@@ -681,11 +681,6 @@ void mdp5_ctlm_hw_reset(struct mdp5_ctl_manager *ctl_mgr)
 	}
 }
 
-void mdp5_ctlm_destroy(struct mdp5_ctl_manager *ctl_mgr)
-{
-	kfree(ctl_mgr);
-}
-
 struct mdp5_ctl_manager *mdp5_ctlm_init(struct drm_device *dev,
 		void __iomem *mmio_base, struct mdp5_cfg_handler *cfg_hnd)
 {
@@ -697,18 +692,16 @@ struct mdp5_ctl_manager *mdp5_ctlm_init(struct drm_device *dev,
 	unsigned long flags;
 	int c, ret;
 
-	ctl_mgr = kzalloc(sizeof(*ctl_mgr), GFP_KERNEL);
+	ctl_mgr = devm_kzalloc(dev->dev, sizeof(*ctl_mgr), GFP_KERNEL);
 	if (!ctl_mgr) {
 		DRM_DEV_ERROR(dev->dev, "failed to allocate CTL manager\n");
-		ret = -ENOMEM;
-		goto fail;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	if (WARN_ON(ctl_cfg->count > MAX_CTL)) {
 		DRM_DEV_ERROR(dev->dev, "Increase static pool size to at least %d\n",
 				ctl_cfg->count);
-		ret = -ENOSPC;
-		goto fail;
+		return ERR_PTR(-ENOSPC);
 	}
 
 	/* initialize the CTL manager: */
@@ -727,7 +720,7 @@ struct mdp5_ctl_manager *mdp5_ctlm_init(struct drm_device *dev,
 			DRM_DEV_ERROR(dev->dev, "CTL_%d: base is null!\n", c);
 			ret = -EINVAL;
 			spin_unlock_irqrestore(&ctl_mgr->pool_lock, flags);
-			goto fail;
+			return ERR_PTR(ret);
 		}
 		ctl->ctlm = ctl_mgr;
 		ctl->id = c;
@@ -755,10 +748,4 @@ struct mdp5_ctl_manager *mdp5_ctlm_init(struct drm_device *dev,
 	DBG("Pool of %d CTLs created.", ctl_mgr->nctl);
 
 	return ctl_mgr;
-
-fail:
-	if (ctl_mgr)
-		mdp5_ctlm_destroy(ctl_mgr);
-
-	return ERR_PTR(ret);
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h
index c2af68aa77ae..9020e8efc4e4 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h
@@ -17,7 +17,6 @@ struct mdp5_ctl_manager;
 struct mdp5_ctl_manager *mdp5_ctlm_init(struct drm_device *dev,
 		void __iomem *mmio_base, struct mdp5_cfg_handler *cfg_hnd);
 void mdp5_ctlm_hw_reset(struct mdp5_ctl_manager *ctlm);
-void mdp5_ctlm_destroy(struct mdp5_ctl_manager *ctlm);
 
 /*
  * CTL prototypes:
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 828634206185..e20ead138602 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -625,8 +625,6 @@ static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 {
 	int i;
 
-	if (mdp5_kms->ctlm)
-		mdp5_ctlm_destroy(mdp5_kms->ctlm);
 	if (mdp5_kms->smp)
 		mdp5_smp_destroy(mdp5_kms->smp);
 
-- 
2.39.2

