Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C9474BAB5
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 03:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E91210E052;
	Sat,  8 Jul 2023 01:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB32110E055
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:11 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b6c5ede714so45914681fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778250; x=1691370250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eMAmM9SKw/inKw+h9p1EJrIP33+OT6JDaPBmfl7Oyyg=;
 b=HAXK+PqbHSV6zSK7BV4lNH0HkMDmOiTv2ZVjb1vJlvSOp8jVHtKfGFqeG0dtrvbWHP
 mmip+GhJhkhwSU34Nq6G9+wmrRyXKg4TOZ0lvit9CbFU+kUdHl5R4lyEPvDTkV4PHTT0
 gmTFLzBqdDqKk6jbNL2Sgr8VcmeGkaZ7zXQKlAcVIsyLd7D4mB55L3FLCJFKEXKANc93
 HXfCxyH6NMsXvGeUEsxXJs2oeaZSqlX5CzonwG+mgIr35/oWa5xM+MK7WtQqrN5RWCtn
 cHAdnzTi+TaNdx5Z2UFB3MVGZgDdulwFM6I7CLUd4S2rtgldJAj4PdlAJecdcLjnZfMn
 vh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778250; x=1691370250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eMAmM9SKw/inKw+h9p1EJrIP33+OT6JDaPBmfl7Oyyg=;
 b=aTuSByep4eNrKMUiivdeCuub+unrHlhi+trOFyeXxAASlj2vV1Fo0TvKwt3rPgXFEN
 JVfQSqtPn/yDmNsqhZnD+RTquDvJ0ahBpiOykk0vFGHmNxXzBtGc2zaZ1RZxEZcD+yBT
 X0sAb5/pPPv12tZcBUGo+RdI+IOUkEEdLzBtt5190pynOI8NekKvW0twqx2YWiPdb9F3
 Ky1iUGl8BPXMdhRzjPYuVuYoGTmKoqLD9xP7P8UAkzTIPxg1GivXDSEUonwhCG0Wjabw
 DIaMovmIlZt1U02ceolH5NnyajzY87/iX1TckdQP+EtxG6WG0Mpgn8A42v7EKqfiHq62
 yzGg==
X-Gm-Message-State: ABy/qLYGzoEXvD4CxmqqKOhwOVDMGFfynajtIG3Pm4AmNde7JJyS2Zlr
 EAaKh28ci5kQvKDJ7bh189BUiQ==
X-Google-Smtp-Source: APBJJlHBVidCbm1Ynuoei++jdbP725lfezafJRwmcXXT3obwnVQzaaBL7n17UcKBjmisaTG0LZqGMQ==
X-Received: by 2002:a05:651c:3ca:b0:2b6:9f95:8118 with SMTP id
 f10-20020a05651c03ca00b002b69f958118mr3615228ljp.7.1688778250153; 
 Fri, 07 Jul 2023 18:04:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 02/17] drm/msm/mdp5: use devres-managed allocation for
 configuration data
Date: Sat,  8 Jul 2023 04:03:52 +0300
Message-Id: <20230708010407.3871346-3-dmitry.baryshkov@linaro.org>
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

Use devm_kzalloc to create configuration data structure. This allows us
to remove corresponding kfree and drop mdp5_cfg_destroy() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 24 +++++-------------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 --
 3 files changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index 694d54341337..c5179e4c393c 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -1350,23 +1350,17 @@ int mdp5_cfg_get_hw_rev(struct mdp5_cfg_handler *cfg_handler)
 	return cfg_handler->revision;
 }
 
-void mdp5_cfg_destroy(struct mdp5_cfg_handler *cfg_handler)
-{
-	kfree(cfg_handler);
-}
-
 struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
 		uint32_t major, uint32_t minor)
 {
 	struct drm_device *dev = mdp5_kms->dev;
 	struct mdp5_cfg_handler *cfg_handler;
 	const struct mdp5_cfg_handler *cfg_handlers;
-	int i, ret = 0, num_handlers;
+	int i, num_handlers;
 
-	cfg_handler = kzalloc(sizeof(*cfg_handler), GFP_KERNEL);
+	cfg_handler = devm_kzalloc(dev->dev, sizeof(*cfg_handler), GFP_KERNEL);
 	if (unlikely(!cfg_handler)) {
-		ret = -ENOMEM;
-		goto fail;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	switch (major) {
@@ -1381,8 +1375,7 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
 	default:
 		DRM_DEV_ERROR(dev->dev, "unexpected MDP major version: v%d.%d\n",
 				major, minor);
-		ret = -ENXIO;
-		goto fail;
+		return ERR_PTR(-ENXIO);
 	}
 
 	/* only after mdp5_cfg global pointer's init can we access the hw */
@@ -1396,8 +1389,7 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
 	if (unlikely(!mdp5_cfg)) {
 		DRM_DEV_ERROR(dev->dev, "unexpected MDP minor revision: v%d.%d\n",
 				major, minor);
-		ret = -ENXIO;
-		goto fail;
+		return ERR_PTR(-ENXIO);
 	}
 
 	cfg_handler->revision = minor;
@@ -1406,10 +1398,4 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
 	DBG("MDP5: %s hw config selected", mdp5_cfg->name);
 
 	return cfg_handler;
-
-fail:
-	if (cfg_handler)
-		mdp5_cfg_destroy(cfg_handler);
-
-	return ERR_PTR(ret);
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
index c2502cc33864..26c5d8b4ab46 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
@@ -121,6 +121,5 @@ int mdp5_cfg_get_hw_rev(struct mdp5_cfg_handler *cfg_hnd);
 
 struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
 		uint32_t major, uint32_t minor);
-void mdp5_cfg_destroy(struct mdp5_cfg_handler *cfg_hnd);
 
 #endif /* __MDP5_CFG_H__ */
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 52f176e08690..828634206185 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -629,8 +629,6 @@ static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 		mdp5_ctlm_destroy(mdp5_kms->ctlm);
 	if (mdp5_kms->smp)
 		mdp5_smp_destroy(mdp5_kms->smp);
-	if (mdp5_kms->cfg)
-		mdp5_cfg_destroy(mdp5_kms->cfg);
 
 	for (i = 0; i < mdp5_kms->num_intfs; i++)
 		kfree(mdp5_kms->intfs[i]);
-- 
2.39.2

