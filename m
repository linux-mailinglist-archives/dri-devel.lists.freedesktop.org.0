Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA8E54FD5E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 21:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130EC10E11D;
	Fri, 17 Jun 2022 19:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7903D10E11D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 19:15:04 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id d19so5669861lji.10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 12:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y577pvISUj8Bc1m6l2z73H1VKVdWpOuKQNmOPguXFKA=;
 b=RDBTxvEqVD73tIF7jTz8ytucFLzJBg+L7DRbFwD3OjOsa3nVhf8a1GKFBBLnmbOtL2
 e7HmUGz/005nZ1LdWAgHoOMvWEEhIJC4gt9X/AAvONOFQke+OAyDbZcP7a0YiLUhJsho
 wqw+pV/uRAyrc9Kf2H9K0psnKYFohFXNjdzt9pmV4dYRVN/Ery/b0KjGxJStI4ALFQNL
 i0e+WYytVzzZy04gCyLqWxhv/ovzbb6YxJJWsINfKdyBWMWJ8lgGTgPLULxin6UlMykB
 PBrJyeEPpEg1Ou7Tav+/Uh1n4dI3tF0+BtGEMduywkwOvOVj/If5glPTTKfBSPcmwPAV
 fr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y577pvISUj8Bc1m6l2z73H1VKVdWpOuKQNmOPguXFKA=;
 b=rY1cuU7nWG+wTYmAjzQT7uSofTWmOKeeyd9h0FJjwbUulp+BzEbeAoBuxsYF612KP0
 S5/3V+CPO4cHbNQE6MRFShZn/QQgDbZhpGkktchCMAmNeDIK6ShiDwA8V0vKJU8Wg5gG
 Ahv6570XFtKAlcK9S2mmMKtXT7osBL9imhuUbzg5vxSNohR8oQ4nu5gCoWPFIoaRfDeB
 cpmhlKzxLyr35cOIAjj7GRRIADv9D18fjE5zovVybQAGxkswlAPAwFjSbWn7QfRqmRic
 +wKAsFsPqurFrL6+k2Ms/fhzvW0a2/NgKSD0so+V9C25NGxBkkN6aPyHFFMv9LlCGLkq
 4NAA==
X-Gm-Message-State: AJIora9ZHFWf/T4ACy13jOppvoY2jb9w1dIbNUNBwGyuS9MoITMafEqj
 LTRfL+scDS/aHZbg50mrUBxkiw==
X-Google-Smtp-Source: AGRyM1vlflghs40TeHGgnPYgNxZc/gaw3KoSYm+M4XoqGA6M0Fkf1+wKSb8VqZQCvUKng+Ne+hg5bg==
X-Received: by 2002:a2e:b0e6:0:b0:255:6cf9:ea90 with SMTP id
 h6-20020a2eb0e6000000b002556cf9ea90mr5679387ljl.425.1655493304003; 
 Fri, 17 Jun 2022 12:15:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([95.161.222.59])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a2e920f000000b00253e1833e8bsm639680ljg.117.2022.06.17.12.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 12:15:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 3/3] drm/msm: stop storing the array of CRTCs in struct
 msm_drm_private
Date: Fri, 17 Jun 2022 22:14:29 +0300
Message-Id: <20220617191429.1087634-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617191429.1087634-1-dmitry.baryshkov@linaro.org>
References: <20220617191429.1087634-1-dmitry.baryshkov@linaro.org>
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The array of CRTC in the struct msm_drm_private duplicates a list of
CRTCs in the drm_device. Drop it and use the existing list for CRTC
enumeration.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.c            | 44 +++++++++++++-----------
 drivers/gpu/drm/msm/msm_drv.h            |  3 +-
 5 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e23e2552e802..e79f0a8817ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -806,7 +806,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			ret = PTR_ERR(crtc);
 			return ret;
 		}
-		priv->crtcs[priv->num_crtcs++] = crtc;
+		priv->num_crtcs++;
 	}
 
 	/* All CRTCs are compatible with all encoders */
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index fb48c8c19ec3..7449c1693e45 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -337,7 +337,7 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
 			goto fail;
 		}
 
-		priv->crtcs[priv->num_crtcs++] = crtc;
+		priv->num_crtcs++;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3d5621a68f85..36808990f840 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -497,7 +497,7 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 			DRM_DEV_ERROR(dev->dev, "failed to construct crtc %d (%d)\n", i, ret);
 			goto fail;
 		}
-		priv->crtcs[priv->num_crtcs++] = crtc;
+		priv->num_crtcs++;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 44485363f37a..567e77dae43b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -149,7 +149,7 @@ static void msm_irq_uninstall(struct drm_device *dev)
 
 struct msm_vblank_work {
 	struct work_struct work;
-	int crtc_id;
+	struct drm_crtc *crtc;
 	bool enable;
 	struct msm_drm_private *priv;
 };
@@ -162,15 +162,15 @@ static void vblank_ctrl_worker(struct work_struct *work)
 	struct msm_kms *kms = priv->kms;
 
 	if (vbl_work->enable)
-		kms->funcs->enable_vblank(kms, priv->crtcs[vbl_work->crtc_id]);
+		kms->funcs->enable_vblank(kms, vbl_work->crtc);
 	else
-		kms->funcs->disable_vblank(kms,	priv->crtcs[vbl_work->crtc_id]);
+		kms->funcs->disable_vblank(kms,	vbl_work->crtc);
 
 	kfree(vbl_work);
 }
 
 static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
-					int crtc_id, bool enable)
+					struct drm_crtc *crtc, bool enable)
 {
 	struct msm_vblank_work *vbl_work;
 
@@ -180,7 +180,7 @@ static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
 
 	INIT_WORK(&vbl_work->work, vblank_ctrl_worker);
 
-	vbl_work->crtc_id = crtc_id;
+	vbl_work->crtc = crtc;
 	vbl_work->enable = enable;
 	vbl_work->priv = priv;
 
@@ -354,7 +354,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev;
 	struct msm_kms *kms;
-	int ret, i;
+	struct drm_crtc *crtc;
+	int ret;
 
 	if (drm_firmware_drivers_only())
 		return -ENODEV;
@@ -427,20 +428,23 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	ddev->mode_config.funcs = &mode_config_funcs;
 	ddev->mode_config.helper_private = &mode_config_helper_funcs;
 
-	for (i = 0; i < priv->num_crtcs; i++) {
+	drm_for_each_crtc(crtc, ddev) {
+		struct msm_drm_thread *ev_thread;
+
 		/* initialize event thread */
-		priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
-		priv->event_thread[i].dev = ddev;
-		priv->event_thread[i].worker = kthread_create_worker(0,
-			"crtc_event:%d", priv->event_thread[i].crtc_id);
-		if (IS_ERR(priv->event_thread[i].worker)) {
-			ret = PTR_ERR(priv->event_thread[i].worker);
+		ev_thread = &priv->event_thread[drm_crtc_index(crtc)];
+		ev_thread->crtc = crtc;
+		ev_thread->dev = ddev;
+		ev_thread->worker = kthread_create_worker(0,
+			"crtc_event:%d", ev_thread->crtc->base.id);
+		if (IS_ERR(ev_thread->worker)) {
+			ret = PTR_ERR(ev_thread->worker);
 			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
-			ret = PTR_ERR(priv->event_thread[i].worker);
+			ev_thread->worker = NULL;
 			goto err_msm_uninit;
 		}
 
-		sched_set_fifo(priv->event_thread[i].worker->task);
+		sched_set_fifo(ev_thread->worker->task);
 	}
 
 	ret = drm_vblank_init(ddev, priv->num_crtcs);
@@ -563,25 +567,23 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 int msm_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	unsigned int pipe = crtc->index;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	if (!kms)
 		return -ENXIO;
-	drm_dbg_vbl(dev, "crtc=%u", pipe);
-	return vblank_ctrl_queue_work(priv, pipe, true);
+	drm_dbg_vbl(dev, "crtc=%u", crtc->base.id);
+	return vblank_ctrl_queue_work(priv, crtc, true);
 }
 
 void msm_crtc_disable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	unsigned int pipe = crtc->index;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	if (!kms)
 		return;
-	drm_dbg_vbl(dev, "crtc=%u", pipe);
-	vblank_ctrl_queue_work(priv, pipe, false);
+	drm_dbg_vbl(dev, "crtc=%u", crtc->base.id);
+	vblank_ctrl_queue_work(priv, crtc, false);
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 08388d742d65..0e98b6f161df 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -102,7 +102,7 @@ struct msm_display_topology {
 /* Commit/Event thread specific structure */
 struct msm_drm_thread {
 	struct drm_device *dev;
-	unsigned int crtc_id;
+	struct drm_crtc *crtc;
 	struct kthread_worker *worker;
 };
 
@@ -178,7 +178,6 @@ struct msm_drm_private {
 	struct workqueue_struct *wq;
 
 	unsigned int num_crtcs;
-	struct drm_crtc *crtcs[MAX_CRTCS];
 
 	struct msm_drm_thread event_thread[MAX_CRTCS];
 
-- 
2.35.1

