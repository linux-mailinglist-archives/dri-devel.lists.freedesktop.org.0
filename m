Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3A5801FE7
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 01:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C35010E245;
	Sun,  3 Dec 2023 00:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D34910E24B
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 00:05:40 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50be6c65112so850976e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 16:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701561938; x=1702166738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Dumt1dCkdFi8NtSV/s2hFPU6604xTCuNq1eJtpJNJ0=;
 b=WmDP2DPC1CxvDTup3IUHHHpfnLqG8wb7Io7xT06tft0JOAPxqm8qWaQb2Hz7zfZy7T
 2mOQsdVpq5wSovxHUhWSbUsE6wkt/39ZJE3Wcv/prtCNByQFlQzze0dibuIV6JD4V6j0
 534celN82cUD+Dh4uMY5lPNfBODmhmv+YZ9S24AoreU7Xadb8YZNdnXLHlfTbIGW1qyK
 DVsdO2D9mgVZT60+pJ+b+gorN6kbEjBAiaoPuvPVTFhrmK1hSNwt2TTiBgGwzY4qBTQF
 pZci57MUC5LmqOrMHf2dTAvGNv5jGb0ycTid3Rh1TFykBqHdkxMYg8Qlh2BosS1PtGdT
 VTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701561938; x=1702166738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Dumt1dCkdFi8NtSV/s2hFPU6604xTCuNq1eJtpJNJ0=;
 b=dogKojx67WhCuRWISxjRKyXT8xlrptf64jfhHoBn1whpQtKTP70oTmIdIKUZBnGazY
 yp8WtPAVJsrfApSKbOL2vTPvJRSOqxbWmUHHjf0B/5Rp95a7/4E28SVW6J4mKGPlpn55
 Gp4ovM7cn5W0hRn7c3j0weuuLam1c7M+qxh1t99BJHqqFMTwYuOOqO4BJFn5Vuti1zWH
 2Ysb3bJTGsgUJqYjtFtGPANgeOUqbtI7G4XHxbXWAqrki8n5ZcQMo+LhdZDeSb+gdQEn
 3z036scTvpgHLlj4Ve1zorUh+yhRUKneQe5OcnJNDknF8wpL+3KfC6ATJIIXrMsAQjd7
 70uw==
X-Gm-Message-State: AOJu0YyYBZqfJSSkG4CZUsQRGWgDyX3WawWCEHhl9B4tGvf84XQRQnaU
 8/EDHSec1lzzoPFQTYws83e8PA==
X-Google-Smtp-Source: AGHT+IER/lkHM6YBgTm+oPsGjrSaaKUQgAkDiVcDNXYpjXX8xjsC9WdyApirtDFvBpmfZpCP9+ry7g==
X-Received: by 2002:ac2:4a8b:0:b0:50b:bce5:2cca with SMTP id
 l11-20020ac24a8b000000b0050bbce52ccamr768305lfp.61.1701561938550; 
 Sat, 02 Dec 2023 16:05:38 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a19ad02000000b0050bc5edfa45sm826273lfc.85.2023.12.02.16.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 16:05:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RESEND 5/5] drm/msm/mdp5: drop global_state_lock
Date: Sun,  3 Dec 2023 03:05:32 +0300
Message-Id: <20231203000532.1290480-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
References: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
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
index cd46c2b0ec0c..b1d2f00974d5 100644
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
@@ -613,7 +606,6 @@ static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
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

