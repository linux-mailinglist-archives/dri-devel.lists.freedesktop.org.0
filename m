Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E47A1B384D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868416E9D8;
	Wed, 22 Apr 2020 06:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1A989ECD
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 23:41:48 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id w29so276357qtv.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 16:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MXxHc8zF6zr0b8trV04SdIxBHpU7GIEyXW6bHvBYNVc=;
 b=rdqI60xoG5zmsw0bSUm3K3nIR3UcgkHQGQXFLhGFAyjnSmPTh4TytilGT07yWNPiLx
 Uvs4z1ES9NXSRjiRjM9uVC7CHzRFwIe0pnPFCh4uUnX7a9zmWTvAPkpdn1IUW40FTDEB
 Zb3/jSpGlF8OJiDkL+n6cJX95B4vpymMq6SpNpcXLT83XS2b46FiTmJZyOryeCj7Nyyv
 vY7pMwM7e6j1/fqYepD6n+/0OPd3SZoKzFMdTFX1MIu6xzGn3mPW7pcF3D8efrqUCiMf
 QFkqS4eImgcbJeCX+dSzuvVpxLo7c3RdRSbb7n5Sf+vYPo/XJxaDcXL9MHzosWaNcK7t
 G2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MXxHc8zF6zr0b8trV04SdIxBHpU7GIEyXW6bHvBYNVc=;
 b=Ao3E5ZUlZMRbyvZ5Oggh1WQMxmIBoPIV92ME9+L1KekeTFbcmolQoOrU08tcrPBtkY
 l5NPa04+5dsUAjV8vc9EYW6S8okZ3xR3ZHcZ80ReYBm3/6eEl3lHOTmPEDDXe6fMA07Z
 K9TzxGYpFDOt9Y95YOiaKR86lDbG/ScraAnHUYwhyIfyOAhP9bonhBOBjUhg6q7Bg1TQ
 7vpJWo7bIdEg4BSOZ1GUf7H+zbdoeIWTYoedAfYrTGYB4CAPq9sATxn86VvfSh7GJOKH
 l6QWtYpSFYIsg5I54iPLkNlG51U2Ll71MVvYxXoUmkjmh9YXK6AXBdwqAhaix3OXFOVx
 lr8Q==
X-Gm-Message-State: AGi0PuaUYwki87JwPQ7dYG9gTRJl64ZVsW/GHcIpAUeAQaUtDH4xS8Fo
 GfIzl17yINyR3XxPRkEoUJp73w==
X-Google-Smtp-Source: APiQypIOOvQ+E8HAbH+VcNAzmKzlejQhFhhj591z88JsdiFfwoWRMXFTAhNUTwJna4BGKHC0AMhJxA==
X-Received: by 2002:ac8:7581:: with SMTP id s1mr10232467qtq.77.1587512507318; 
 Tue, 21 Apr 2020 16:41:47 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id y17sm2664010qky.33.2020.04.21.16.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 16:41:46 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/9] drm/msm: add msm_gem_get_and_pin_iova_range
Date: Tue, 21 Apr 2020 19:41:19 -0400
Message-Id: <20200421234127.27965-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200421234127.27965-1-jonathan@marek.ca>
References: <20200421234127.27965-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Apr 2020 06:54:41 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function allows pinning iova to a specific page range (for a6xx GMU).

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/msm_drv.h     |  6 +++++-
 drivers/gpu/drm/msm/msm_gem.c     | 28 +++++++++++++++++++++-------
 drivers/gpu/drm/msm/msm_gem_vma.c |  6 ++++--
 3 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 194d900a460e..966fd9068c94 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -236,7 +236,8 @@ int msm_crtc_enable_vblank(struct drm_crtc *crtc);
 void msm_crtc_disable_vblank(struct drm_crtc *crtc);
 
 int msm_gem_init_vma(struct msm_gem_address_space *aspace,
-		struct msm_gem_vma *vma, int npages);
+		struct msm_gem_vma *vma, int npages,
+		u64 range_start, u64 range_end);
 void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma);
 void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
@@ -276,6 +277,9 @@ vm_fault_t msm_gem_fault(struct vm_fault *vmf);
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
 int msm_gem_get_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova);
+int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t *iova,
+		u64 range_start, u64 range_end);
 int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova);
 uint64_t msm_gem_iova(struct drm_gem_object *obj,
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5a6a79fbc9d6..d8f56a34c117 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -389,7 +389,8 @@ put_iova(struct drm_gem_object *obj)
 }
 
 static int msm_gem_get_iova_locked(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace, uint64_t *iova)
+		struct msm_gem_address_space *aspace, uint64_t *iova,
+		u64 range_start, u64 range_end)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
@@ -404,7 +405,8 @@ static int msm_gem_get_iova_locked(struct drm_gem_object *obj,
 		if (IS_ERR(vma))
 			return PTR_ERR(vma);
 
-		ret = msm_gem_init_vma(aspace, vma, obj->size >> PAGE_SHIFT);
+		ret = msm_gem_init_vma(aspace, vma, obj->size >> PAGE_SHIFT,
+			range_start, range_end);
 		if (ret) {
 			del_vma(vma);
 			return ret;
@@ -443,9 +445,13 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
 			msm_obj->sgt, obj->size >> PAGE_SHIFT);
 }
 
-/* get iova and pin it. Should have a matching put */
-int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace, uint64_t *iova)
+/*
+ * get iova and pin it. Should have a matching put
+ * limits iova to specified range (in pages)
+ */
+int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t *iova,
+		u64 range_start, u64 range_end)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	u64 local;
@@ -453,7 +459,8 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
 
 	mutex_lock(&msm_obj->lock);
 
-	ret = msm_gem_get_iova_locked(obj, aspace, &local);
+	ret = msm_gem_get_iova_locked(obj, aspace, &local,
+		range_start, range_end);
 
 	if (!ret)
 		ret = msm_gem_pin_iova(obj, aspace);
@@ -465,6 +472,13 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
 	return ret;
 }
 
+/* get iova and pin it. Should have a matching put */
+int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t *iova)
+{
+	return msm_gem_get_and_pin_iova_range(obj, aspace, iova, 0, U64_MAX);
+}
+
 /*
  * Get an iova but don't pin it. Doesn't need a put because iovas are currently
  * valid for the life of the object
@@ -476,7 +490,7 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 	int ret;
 
 	mutex_lock(&msm_obj->lock);
-	ret = msm_gem_get_iova_locked(obj, aspace, iova);
+	ret = msm_gem_get_iova_locked(obj, aspace, iova, 0, U64_MAX);
 	mutex_unlock(&msm_obj->lock);
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 1af5354bcd46..407b7ab82818 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -103,7 +103,8 @@ void msm_gem_close_vma(struct msm_gem_address_space *aspace,
 
 /* Initialize a new vma and allocate an iova for it */
 int msm_gem_init_vma(struct msm_gem_address_space *aspace,
-		struct msm_gem_vma *vma, int npages)
+		struct msm_gem_vma *vma, int npages,
+		u64 range_start, u64 range_end)
 {
 	int ret;
 
@@ -111,7 +112,8 @@ int msm_gem_init_vma(struct msm_gem_address_space *aspace,
 		return -EBUSY;
 
 	spin_lock(&aspace->lock);
-	ret = drm_mm_insert_node(&aspace->mm, &vma->node, npages);
+	ret = drm_mm_insert_node_in_range(&aspace->mm, &vma->node, npages, 0,
+		0, range_start, range_end, 0);
 	spin_unlock(&aspace->lock);
 
 	if (ret)
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
