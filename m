Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B8B4FC70D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 23:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9A210E2D7;
	Mon, 11 Apr 2022 21:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3D110E0B5;
 Mon, 11 Apr 2022 21:58:31 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id u2so69599pgq.10;
 Mon, 11 Apr 2022 14:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u0tHIsGzTPzPZiDuRsukQZsT+v6AmVTymqyX9Izja0U=;
 b=XBNJN50310yoSuZnkMOOCReIaTtnynwQjf9jZTd/YlXFVdIYSy2I1BQ9Ytmlw/JnRf
 5QGcSe3d8ubjM8Gx62SzIXdnJ0/H/yAl2FGzmJAwglobBLbBH1RJ4Rm2smiGSWHeASs2
 xBQ+bCMXecuCAKJdgxpmAEDWk18R7FdqKewqM4Ul8VvBRcnBevlzyGLDYvChlry05OPN
 t6Wr9cSvYFMm+dGG97AJAELZr8QRW0Vb21coZgULcIN3i3U28DrLEIxxnKLoQ2o4vVlf
 mykUEiR9NVdhQUf6lhI1KYpzmNnvNWWM43mo9yZumPnnZr2LISnGuYzsWpSyN86fQsiA
 icQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u0tHIsGzTPzPZiDuRsukQZsT+v6AmVTymqyX9Izja0U=;
 b=g7ktMmqT84NoRxMVaQklO4iT4CW7/wRkOzNyeAi5FBCjXXfIpyGF2dEsXm+7uOywR/
 tdmHbBMJWxi/Xg/T6Pd2GuGEnIKzWfGP+05ngfeG2pMUSGX8FHj62hvIiZb/Fh91HORO
 fP6lMLpHel+66u8VUKZsjIYmizSdQj/8wewD+LqpM3CEpx1EFhyJR7OyjRvcIwlzAIsb
 6X4OESNSkHiOXgjZ9JhAISVrooSWp0pi08NfOHJaXvnJU1HD9wr3fuiG8Oh6rwG918y0
 X/8b0xvjEpDMV9lPFPc0Th70UzM932lQj+Qf9LFX5dKeS+1qNGYuf2aMZkW7n/UcPv0G
 yMdg==
X-Gm-Message-State: AOAM533b/2TCynhE/QusYlVuiNhCd5mQh1DGyxrRql4jhFWYQaT6Eg88
 QktKLe9IlC2P171Phk+HPstarWqH3UI=
X-Google-Smtp-Source: ABdhPJy/opVYLoBSZxFmdyMpT1eQqfRBY2ZrNEMM0e0xhcAV2z58F889PMTtmbxAzHa6fZjgzY9xTw==
X-Received: by 2002:a05:6a00:1145:b0:4f6:3ebc:a79b with SMTP id
 b5-20020a056a00114500b004f63ebca79bmr34524616pfm.41.1649714310017; 
 Mon, 11 Apr 2022 14:58:30 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 6-20020a621406000000b00505ad87290dsm6711688pfu.162.2022.04.11.14.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 14:58:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 06/10] drm/msm: Drop msm_gem_iova()
Date: Mon, 11 Apr 2022 14:58:35 -0700
Message-Id: <20220411215849.297838-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411215849.297838-1-robdclark@gmail.com>
References: <20220411215849.297838-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

There was only a single user, which could just as easily stash the iova
when pinning.

v2: fix prepare->prepare->cleanup->cleanup sequences

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_fb.c  | 20 ++++++++++++++------
 drivers/gpu/drm/msm/msm_gem.c | 16 ----------------
 drivers/gpu/drm/msm/msm_gem.h |  2 --
 3 files changed, 14 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 7137492fe78e..362775ae50af 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -21,6 +21,10 @@ struct msm_framebuffer {
 
 	/* Count of # of attached planes which need dirtyfb: */
 	refcount_t dirtyfb;
+
+	/* Framebuffer per-plane address, if pinned, else zero: */
+	uint64_t iova[DRM_FORMAT_MAX_PLANES];
+	atomic_t prepare_count;
 };
 #define to_msm_framebuffer(x) container_of(x, struct msm_framebuffer, base)
 
@@ -76,14 +80,16 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb,
 {
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
 	int ret, i, n = fb->format->num_planes;
-	uint64_t iova;
 
 	if (needs_dirtyfb)
 		refcount_inc(&msm_fb->dirtyfb);
 
+	atomic_inc(&msm_fb->prepare_count);
+
 	for (i = 0; i < n; i++) {
-		ret = msm_gem_get_and_pin_iova(fb->obj[i], aspace, &iova);
-		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)", fb->base.id, i, iova, ret);
+		ret = msm_gem_get_and_pin_iova(fb->obj[i], aspace, &msm_fb->iova[i]);
+		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)",
+			      fb->base.id, i, msm_fb->iova[i], ret);
 		if (ret)
 			return ret;
 	}
@@ -103,14 +109,16 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
 
 	for (i = 0; i < n; i++)
 		msm_gem_unpin_iova(fb->obj[i], aspace);
+
+	if (!atomic_dec_return(&msm_fb->prepare_count))
+		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb,
 		struct msm_gem_address_space *aspace, int plane)
 {
-	if (!fb->obj[plane])
-		return 0;
-	return msm_gem_iova(fb->obj[plane], aspace) + fb->offsets[plane];
+	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
+	return msm_fb->iova[plane];
 }
 
 struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane)
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index f4b68bb28a4d..deafae6feaa8 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -509,22 +509,6 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 	return ret;
 }
 
-/* get iova without taking a reference, used in places where you have
- * already done a 'msm_gem_get_and_pin_iova' or 'msm_gem_get_iova'
- */
-uint64_t msm_gem_iova(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace)
-{
-	struct msm_gem_vma *vma;
-
-	msm_gem_lock(obj);
-	vma = lookup_vma(obj, aspace);
-	msm_gem_unlock(obj);
-	GEM_WARN_ON(!vma);
-
-	return vma ? vma->iova : 0;
-}
-
 /*
  * Locked variant of msm_gem_unpin_iova()
  */
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 090c3b1a6d9a..772de010a669 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -142,8 +142,6 @@ int msm_gem_get_and_pin_iova_locked(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova);
 int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova);
-uint64_t msm_gem_iova(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace);
 void msm_gem_unpin_iova_locked(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace);
 void msm_gem_unpin_iova(struct drm_gem_object *obj,
-- 
2.35.1

