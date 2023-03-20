Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F394E6C1523
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D315E10E588;
	Mon, 20 Mar 2023 14:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0735510E58B;
 Mon, 20 Mar 2023 14:44:44 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id h8so12646774plf.10;
 Mon, 20 Mar 2023 07:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679323483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YjYkvhqut592WuSff3dyR3ovhFafDwjiBPIXBsiPTHA=;
 b=cOHoQlJ0xxnowDvRyQrlnClAHszOToY1+vnIF0VIIDgXA0RnF2Cl/GALLiqwt6XHAT
 y/tzmqUYHn53FusOSShO8LGtYTuDrh8DpRq9qd/Nl4y1IlQwOqIna913gt16RmzfHQZ9
 dZokgnhA/xss3xcfz35c3fKoCxs4ER9SNrjg6JXx1uXkxJNtRp7vYXmZSgx70JronGD6
 x0eXU6uMwh8V1hK9cpM87TFtDBhc/dbqaNahA2gbQYZ2ZhqNsT7TEC/ZfzmbYa2PqgOn
 GR8DiN6vcuIOnfYIrTW8fveCVpMVqlYu3eAeVKXbW3jBGGD4yoY5LJnyDt7t6GQF/mqx
 peUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YjYkvhqut592WuSff3dyR3ovhFafDwjiBPIXBsiPTHA=;
 b=Ge5fCwiMXccyhCH3BswGIfpYg+BTOo00oLNrED59Z11zfIrHxyAtSL+zIrs7iwxOZ6
 HqlmgHi5L1NNFqL8hM0yZuf0ypWLasoNW6qtAa4ypBvYcVTVDmcVw1NSgV8CDVlFJkDO
 8Y72V5VrTlQUeDvb4QpT7l0lictJMr0v/B35WHNAjqL/mac9iENvtkZF0uHNN9VikGPa
 rNS5xtFJcBSrZstblfMaBX1rFlbG1UzjOWKogzazInp5JwviAArgX9c+GCXV7LNj9Z8B
 G7zt3EmiRqfn8sHz2iEUk6PBOgDp9SEHfqJlyBgIiQFxu26dK84tbzuuOhznztdZgx/M
 o8Mg==
X-Gm-Message-State: AO0yUKUYPqDerJmJccqVut+0uMiT1cJSe05tUtBkH4yUemY4iqODaS5E
 hUCUmO4xgZY3ql0ThrdMnooPiR3rydo=
X-Google-Smtp-Source: AK7set8QgTzNPHFdn6ePXThhc0O7gvvVmy/zOlqo83fcmxzg8pOx366lz1ZPhithPcnrmPwO40UgtQ==
X-Received: by 2002:a17:903:186:b0:19e:6d83:8277 with SMTP id
 z6-20020a170903018600b0019e6d838277mr21841308plg.51.1679323483402; 
 Mon, 20 Mar 2023 07:44:43 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a170902728300b0019c32968271sm6809626pll.11.2023.03.20.07.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 07:44:43 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/23] drm/msm/gem: Move update_lru()
Date: Mon, 20 Mar 2023 07:43:29 -0700
Message-Id: <20230320144356.803762-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320144356.803762-1-robdclark@gmail.com>
References: <20230320144356.803762-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Just code-motion.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 46 +++++++++++++++++------------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 009a34b3a49b..c97dddf3e2f2 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -19,8 +19,6 @@
 #include "msm_gpu.h"
 #include "msm_mmu.h"
 
-static void update_lru(struct drm_gem_object *obj);
-
 static dma_addr_t physaddr(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
@@ -63,6 +61,28 @@ static void sync_for_cpu(struct msm_gem_object *msm_obj)
 	dma_unmap_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL, 0);
 }
 
+static void update_lru(struct drm_gem_object *obj)
+{
+	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+
+	msm_gem_assert_locked(&msm_obj->base);
+
+	if (!msm_obj->pages) {
+		GEM_WARN_ON(msm_obj->pin_count);
+
+		drm_gem_lru_move_tail(&priv->lru.unbacked, obj);
+	} else if (msm_obj->pin_count) {
+		drm_gem_lru_move_tail(&priv->lru.pinned, obj);
+	} else if (msm_obj->madv == MSM_MADV_WILLNEED) {
+		drm_gem_lru_move_tail(&priv->lru.willneed, obj);
+	} else {
+		GEM_WARN_ON(msm_obj->madv != MSM_MADV_DONTNEED);
+
+		drm_gem_lru_move_tail(&priv->lru.dontneed, obj);
+	}
+}
+
 /* allocate pages from VRAM carveout, used when no IOMMU: */
 static struct page **get_pages_vram(struct drm_gem_object *obj, int npages)
 {
@@ -804,28 +824,6 @@ void msm_gem_vunmap(struct drm_gem_object *obj)
 	msm_obj->vaddr = NULL;
 }
 
-static void update_lru(struct drm_gem_object *obj)
-{
-	struct msm_drm_private *priv = obj->dev->dev_private;
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-
-	msm_gem_assert_locked(&msm_obj->base);
-
-	if (!msm_obj->pages) {
-		GEM_WARN_ON(msm_obj->pin_count);
-
-		drm_gem_lru_move_tail(&priv->lru.unbacked, obj);
-	} else if (msm_obj->pin_count) {
-		drm_gem_lru_move_tail(&priv->lru.pinned, obj);
-	} else if (msm_obj->madv == MSM_MADV_WILLNEED) {
-		drm_gem_lru_move_tail(&priv->lru.willneed, obj);
-	} else {
-		GEM_WARN_ON(msm_obj->madv != MSM_MADV_DONTNEED);
-
-		drm_gem_lru_move_tail(&priv->lru.dontneed, obj);
-	}
-}
-
 bool msm_gem_active(struct drm_gem_object *obj)
 {
 	msm_gem_assert_locked(obj);
-- 
2.39.2

