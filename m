Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A44657980CF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 05:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CDD10E862;
	Fri,  8 Sep 2023 03:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CF910E854
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 03:05:28 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so27117961fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Sep 2023 20:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694142326; x=1694747126; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4EuRyGB2FCn8eHtdShX5HJtuBHexPXckCeOw+rDTXl8=;
 b=r+FuWbVjv/e39xXFHzvP3qKZVniQ/hwkw2/39kqBmTt2B7mwXS1JHUp4a/ZWGE75BH
 jUp41Zu4gOlQT0Tt0/1Vfp0+xG0wi5E+6M3F/fVJZogZjUjxKHO0rp6+SkrNKHRuPUu/
 mtM69aQmOvtmzpgBB7gRgOBUioFNbW6tYFbPCO6i3Z71oFGCsZJSoJVpqCL7IZ4URO0y
 PSQnhfG5gvw1I727hdU/E0VFHOdj3Hathkh83ovB2N5VWmZXIIZ31ihgrI4Y9i5Yvxhc
 1VNWtK1ZxsBY4Oo+kumj4Uq9c9eV8+mYDzsT/rli3p8XIFVEPtGWt45YQ+Igl+J2dI3D
 bsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694142326; x=1694747126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4EuRyGB2FCn8eHtdShX5HJtuBHexPXckCeOw+rDTXl8=;
 b=RkL6KKJuYsupv5AVqEWlYLaAdtUbQ8PDDYVU3EVhxf5/xh6bDEqykn332kd7aAcbty
 PUpUkBy3c1enryHAazOFjv0Mv/LKb7BWT/Ml38Wo2RIA+1CZI8lNhJVZ4U53yWyDaqkN
 ZnezTy+H3+KhE1+H+6zSXaqvuuwijBfmwb3YHIlDHc3q35+j+KW2nFGYNkArE/yDqaGJ
 FCU4uVuG3v6TFIxDIyNVMf/9DyKDr/VTPk8oRv4Ppl9eUgaWFlH67vcendvkH7tQnX+Y
 BR8chKqxPGkhzX/gdznU6DyimuRMRNEWh+3Fsn0vnrdQDAXe5+S7QVJLl+MeZyojD0kc
 GNyw==
X-Gm-Message-State: AOJu0YwLk3y/MAexmeIomuzDExTbuy4YmUZfAgWzSVKcG8DiazrhCIM4
 wDysfN7nGTjJKXM/LCfq8nKfHQ==
X-Google-Smtp-Source: AGHT+IFb1SE2OljNZih8LbGcYPj0m1xg2/28UjpUhM0NBZt6+shhbkdtZRJ7HtZ9/1kaAYxCIHjKQw==
X-Received: by 2002:a2e:88d4:0:b0:2bc:cee6:4342 with SMTP id
 a20-20020a2e88d4000000b002bccee64342mr644830ljk.13.1694142326362; 
 Thu, 07 Sep 2023 20:05:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a2e8e8a000000b002b93d66b82asm128332ljk.112.2023.09.07.20.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 20:05:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 5/5] drm/msm/mdp5: drop global_state_lock
Date: Fri,  8 Sep 2023 06:05:21 +0300
Message-Id: <20230908030521.236309-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
References: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the commit b962a12050a3 ("drm/atomic: integrate modeset lock with
private objects") the DRM framework no longer requires the external
lock for private objects. Drop the lock, letting the DRM to manage
private object locking.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 8 --------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 4d51a736d1d0..c15fa9dafe55 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -84,11 +84,6 @@ struct mdp5_global_state *mdp5_get_global_state(struct drm_atomic_state *s)
 	struct msm_drm_private *priv = s->dev->dev_private;
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 	struct drm_private_state *priv_state;
-	int ret;
-
-	ret = drm_modeset_lock(&mdp5_kms->glob_state_lock, s->acquire_ctx);
-	if (ret)
-		return ERR_PTR(ret);
 
 	priv_state = drm_atomic_get_private_obj_state(s, &mdp5_kms->glob_state);
 	if (IS_ERR(priv_state))
@@ -138,8 +133,6 @@ static int mdp5_global_obj_init(struct mdp5_kms *mdp5_kms)
 {
 	struct mdp5_global_state *state;
 
-	drm_modeset_lock_init(&mdp5_kms->glob_state_lock);
-
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return -ENOMEM;
@@ -626,7 +619,6 @@ static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 		pm_runtime_disable(&mdp5_kms->pdev->dev);
 
 	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
-	drm_modeset_lock_fini(&mdp5_kms->glob_state_lock);
 }
 
 static int construct_pipes(struct mdp5_kms *mdp5_kms, int cnt,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index 29bf11f08601..70fdc0b6c7c5 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -40,7 +40,6 @@ struct mdp5_kms {
 	 * Global private object state, Do not access directly, use
 	 * mdp5_global_get_state()
 	 */
-	struct drm_modeset_lock glob_state_lock;
 	struct drm_private_obj glob_state;
 
 	struct mdp5_smp *smp;
-- 
2.39.2

