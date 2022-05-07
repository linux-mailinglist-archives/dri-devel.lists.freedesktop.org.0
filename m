Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB08051E8D7
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 19:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D6710EB96;
	Sat,  7 May 2022 17:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D585A10EB96
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 17:09:26 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id w19so17286354lfu.11
 for <dri-devel@lists.freedesktop.org>; Sat, 07 May 2022 10:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jHDRJOheaN9Ke/+xaTIfLp8HPoD3ikp08lVBr1HW+Kw=;
 b=pyWcSSNgvp7yQdVCBADdq13hmeOTh4B0SCaxGwrkdYe0hf0Xz35oprHFfQQFE64VtZ
 HrzPAG319W1oRtdjeCkCSAq4UH3sVPRHrFuYrlczKJUpuzmgaTb+AnL5YeFsLiVrvMP4
 snDDhrxVobpaDPhvyG9/ljW/ZtRGzOVCTGo59GcqyTYaXkJmTTLwvuwJ/9SBRLlG3lPp
 7d/kSdY0W62n56j9Pxud56xuFOElyhgu+wEYvvb8tH1WB5C15P80scJG/BMRH5PChQoP
 k6FDZDQBDUxpq5nip6UAK6Zh5VxULoVhCuBlUzjiXp1Or5UZ3hwrNtUp2HpXEiLge3Ai
 dArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jHDRJOheaN9Ke/+xaTIfLp8HPoD3ikp08lVBr1HW+Kw=;
 b=yvUXNggIcFuBwuxsyWTyI9A8uSzShPzDLr4npEJBFIxBtOdoCm645g3+5o26oJIzrI
 OnUwQw0ZTVYLUlSXDV9gD7X/O1Om0hJHtJ/T4M/TtgvFj3BvS99OmOmi5VVCQOoLhMg/
 sPj6twi82FP249ajrLHYG5Xr+8tJFLRST2iLxnXBj3rJzGT4hRrFlU4qm634JfBEM2PF
 65PpHItKUl+YhIrT8jBjO+/jhrg+ie3b/F2e1PO2cx8l4Y2djTtU/hi6+XPCSjQf0xSe
 UZ1TsiGaxRf/+MJjJxsyR7ld3PV4eAI0NKpPv40mm9E6zfnD/0Bdc2Ufq0Hn0pWjsane
 0nGg==
X-Gm-Message-State: AOAM530O3UGWHNBX53tByAThX+0M0IwVbPGpAe9GDYRGpYKZeaKkWjvc
 QIlqqmhQMKZKCTwP2Rbdnr9dQA==
X-Google-Smtp-Source: ABdhPJzigrCUwpoqfPE1LC+g/sENWK+0OQhGslut0HmshE54YWflI28/IMe4QI56N4AukhGmDZuOCA==
X-Received: by 2002:a19:4343:0:b0:474:d7a:634d with SMTP id
 m3-20020a194343000000b004740d7a634dmr2909583lfj.168.1651943365097; 
 Sat, 07 May 2022 10:09:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 n14-20020a05651203ee00b0047255d211f9sm1175308lfq.296.2022.05.07.10.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 10:09:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 3/3] drm/msm: stop storing the array of CRTCs in struct
 msm_drm_private
Date: Sat,  7 May 2022 20:09:22 +0300
Message-Id: <20220507170922.1723712-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507170922.1723712-1-dmitry.baryshkov@linaro.org>
References: <20220507170922.1723712-1-dmitry.baryshkov@linaro.org>
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

Handling the array of CRTC duplicate the struct msm_drm_private
duplicates a list of CRTCs in the drm_device. Drop it and use the
existing list for CRTC enumeration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Intialize the index variable in msm_drm_init() / event thread
  initialization.

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.c            | 29 ++++++++++++------------
 drivers/gpu/drm/msm/msm_drv.h            |  3 +--
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 2b9d931474e0..c84859fb2d9b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -808,7 +808,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
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
index 4a3dda23e3e0..db676a142ac1 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -144,7 +144,7 @@ static void msm_irq_uninstall(struct drm_device *dev)
 
 struct msm_vblank_work {
 	struct work_struct work;
-	int crtc_id;
+	struct drm_crtc *crtc;
 	bool enable;
 	struct msm_drm_private *priv;
 };
@@ -157,15 +157,15 @@ static void vblank_ctrl_worker(struct work_struct *work)
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
 
@@ -175,7 +175,7 @@ static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
 
 	INIT_WORK(&vbl_work->work, vblank_ctrl_worker);
 
-	vbl_work->crtc_id = crtc_id;
+	vbl_work->crtc = crtc;
 	vbl_work->enable = enable;
 	vbl_work->priv = priv;
 
@@ -349,6 +349,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev;
 	struct msm_kms *kms;
+	struct drm_crtc *crtc;
 	int ret, i;
 
 	if (drm_firmware_drivers_only())
@@ -422,12 +423,14 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	ddev->mode_config.funcs = &mode_config_funcs;
 	ddev->mode_config.helper_private = &mode_config_helper_funcs;
 
-	for (i = 0; i < priv->num_crtcs; i++) {
+	drm_for_each_crtc(crtc, ddev) {
+		i = drm_crtc_index(crtc);
+
 		/* initialize event thread */
-		priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
+		priv->event_thread[i].crtc = crtc;
 		priv->event_thread[i].dev = ddev;
 		priv->event_thread[i].worker = kthread_create_worker(0,
-			"crtc_event:%d", priv->event_thread[i].crtc_id);
+			"crtc_event:%d", priv->event_thread[i].crtc->base.id);
 		if (IS_ERR(priv->event_thread[i].worker)) {
 			ret = PTR_ERR(priv->event_thread[i].worker);
 			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
@@ -558,25 +561,23 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
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
index fdbaad53eb84..2ba57c575e13 100644
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

