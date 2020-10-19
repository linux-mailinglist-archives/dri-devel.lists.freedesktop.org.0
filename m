Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F5C29303E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 23:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451BF6EACB;
	Mon, 19 Oct 2020 21:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359816EACB;
 Mon, 19 Oct 2020 21:09:45 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id a200so703314pfa.10;
 Mon, 19 Oct 2020 14:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oVpoxLyvSJwhFTFCM4f78os9oIARcFwIYFzKVqybLR8=;
 b=HOsDUt0X2qS2clSVv2Pkgq1aTYarSjtmAEsFUgKU6fACyyxMqSJIYS1xnRZaSW4K/p
 UHEyHUhGLZv/8U8n26hQHybfLSceuk+CkDlElCVPaJbfwhneda1zSiscnBXrl/TAsqrb
 EOE+Z5LYtzFdggEW1ObHBI+yjZQr37BhHI5dnFNUE1Iudn75JLCktxFR6fj/PGmZlzaO
 4KyFHt70gINApMBHwE7GnA1TKxW7TSujaUbzLWhfibNuq1H02h+oLgkB7yRx+su9bsEp
 81UHWw/QYZsUP5bja+da3d5KUjWOTGHWBeSvWxZk7Nh0ZT5hyM/35Q785i8DK/tVQ51Z
 Hz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oVpoxLyvSJwhFTFCM4f78os9oIARcFwIYFzKVqybLR8=;
 b=oJXHpm6I+WlEAZ6vnqUGxmA1fuj6JUU5PDGkFvK/nabGQS2ZHZajkYWTryUgZhM6oS
 mZmGVZ1SUrQPs0j8vMUH88MP4kyX5b0Wjbd4zrncz88kbF1ar9koSvAOknCq/NMNLq1/
 bCYgFpnCH/Pk10rZYEIX70rntArYXcIO5e0m6HY3R+KDHte0k3UOP6dOti9vq5z0lfbJ
 Ry2DTbxbNZQix8Kxt8AJw3oUANVXw8twawJODi3kit64HUdU4bUNhOWD3cxMXbEW9lvA
 x9ZNIxEVoP1UlqCoToa+vU5kgeDq1sqv4/SNfVTavRMZoK7crUKWDOfDzX8PIqaJWnGx
 CQKQ==
X-Gm-Message-State: AOAM531UMwmeoxdAA2uwFY4RLPINhk0n5PpZbnLJzRoND0aYOuCEinjP
 aw8FXLNRYOPOpHrYJ7NRGxWVHisrjRukxlBk
X-Google-Smtp-Source: ABdhPJwAEBbOXxq2GShWqiJyyWU3wRJ31+4ESlve3yTmVizuQBo7Qc6f4/OLvyFnUIKdqprJBSiW/Q==
X-Received: by 2002:a63:2021:: with SMTP id g33mr1446736pgg.5.1603141784278;
 Mon, 19 Oct 2020 14:09:44 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 d194sm639737pfd.172.2020.10.19.14.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 14:09:43 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm/kms: Update msm_kms_init/destroy
Date: Mon, 19 Oct 2020 14:10:52 -0700
Message-Id: <20201019211101.143327-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019211101.143327-1-robdclark@gmail.com>
References: <20201019211101.143327-1-robdclark@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Tanmay Shah <tanmay@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 Rob Clark <robdclark@chromium.org>, Qinglang Miao <miaoqinglang@huawei.com>,
 Roy Spliet <nouveau@spliet.org>, Wambui Karuga <wambui.karugax@gmail.com>,
 Joerg Roedel <jroedel@suse.de>, linux-arm-msm@vger.kernel.org,
 Kalyan Thota <kalyan_t@codeaurora.org>, Sean Paul <sean@poorly.run>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, tongtiangen <tongtiangen@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Drew Davenport <ddavenport@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add msm_kms_destroy() and add err return from msm_kms_init().  Prep work
for next patch.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  8 +++++++-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  8 +++++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 ++++++++---
 drivers/gpu/drm/msm/disp/mdp_kms.h       |  9 +++++++--
 drivers/gpu/drm/msm/msm_kms.h            |  8 +++++++-
 5 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index d93c44f6996d..b77d1a9ace2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -718,6 +718,8 @@ static void dpu_kms_destroy(struct msm_kms *kms)
 	dpu_kms = to_dpu_kms(kms);
 
 	_dpu_kms_hw_destroy(dpu_kms);
+
+	msm_kms_destroy(&dpu_kms->base);
 }
 
 static void _dpu_kms_set_encoder_mode(struct msm_kms *kms,
@@ -1108,7 +1110,11 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 
 	platform_set_drvdata(pdev, dpu_kms);
 
-	msm_kms_init(&dpu_kms->base, &kms_funcs);
+	ret = msm_kms_init(&dpu_kms->base, &kms_funcs);
+	if (ret) {
+		DPU_ERROR("failed to init kms, ret=%d\n", ret);
+		goto err;
+	}
 	dpu_kms->dev = ddev;
 	dpu_kms->pdev = pdev;
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index dbf8d429223e..3d729270bde1 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -175,6 +175,8 @@ static void mdp4_destroy(struct msm_kms *kms)
 	if (mdp4_kms->rpm_enabled)
 		pm_runtime_disable(dev);
 
+	mdp_kms_destroy(&mdp4_kms->base);
+
 	kfree(mdp4_kms);
 }
 
@@ -427,7 +429,11 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 		goto fail;
 	}
 
-	mdp_kms_init(&mdp4_kms->base, &kms_funcs);
+	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
+	if (ret) {
+		DRM_DEV_ERROR(dev->dev, "failed to init kms\n");
+		goto fail;
+	}
 
 	kms = &mdp4_kms->base.base;
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index e193865ce9a2..b3eecf869477 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -232,6 +232,8 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
 		aspace->mmu->funcs->detach(aspace->mmu);
 		msm_gem_address_space_put(aspace);
 	}
+
+	mdp_kms_destroy(&mdp5_kms->base);
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -592,11 +594,14 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 		return NULL;
 
 	mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
-
-	mdp_kms_init(&mdp5_kms->base, &kms_funcs);
-
 	pdev = mdp5_kms->pdev;
 
+	ret = mdp_kms_init(&mdp5_kms->base, &kms_funcs);
+	if (ret) {
+		DRM_DEV_ERROR(&pdev->dev, "failed to init kms\n");
+		goto fail;
+	}
+
 	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
 	if (irq < 0) {
 		ret = irq;
diff --git a/drivers/gpu/drm/msm/disp/mdp_kms.h b/drivers/gpu/drm/msm/disp/mdp_kms.h
index 1535c5618491..b0286d5d5130 100644
--- a/drivers/gpu/drm/msm/disp/mdp_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp_kms.h
@@ -36,12 +36,17 @@ struct mdp_kms {
 };
 #define to_mdp_kms(x) container_of(x, struct mdp_kms, base)
 
-static inline void mdp_kms_init(struct mdp_kms *mdp_kms,
+static inline int mdp_kms_init(struct mdp_kms *mdp_kms,
 		const struct mdp_kms_funcs *funcs)
 {
 	mdp_kms->funcs = funcs;
 	INIT_LIST_HEAD(&mdp_kms->irq_list);
-	msm_kms_init(&mdp_kms->base, &funcs->base);
+	return msm_kms_init(&mdp_kms->base, &funcs->base);
+}
+
+static inline void mdp_kms_destroy(struct mdp_kms *mdp_kms)
+{
+	msm_kms_destroy(&mdp_kms->base);
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 1cbef6b200b7..0be9e6487556 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -160,7 +160,7 @@ struct msm_kms {
 	struct msm_pending_timer pending_timers[MAX_CRTCS];
 };
 
-static inline void msm_kms_init(struct msm_kms *kms,
+static inline int msm_kms_init(struct msm_kms *kms,
 		const struct msm_kms_funcs *funcs)
 {
 	unsigned i;
@@ -170,6 +170,12 @@ static inline void msm_kms_init(struct msm_kms *kms,
 
 	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++)
 		msm_atomic_init_pending_timer(&kms->pending_timers[i], kms, i);
+
+	return 0;
+}
+
+static inline void msm_kms_destroy(struct msm_kms *kms)
+{
 }
 
 struct msm_kms *mdp4_kms_init(struct drm_device *dev);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
