Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ACF1B6711
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65A96EA40;
	Thu, 23 Apr 2020 22:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B116E9D5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 21:10:23 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id x8so6169341qtp.13
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 14:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MXxHc8zF6zr0b8trV04SdIxBHpU7GIEyXW6bHvBYNVc=;
 b=D6sJpwFAYpHqd8PX/6y6/o7HkP8BiVYz9g/6ZRNHeScbDO2X+ywWzs/Hh4MV4pMma1
 bByQHuY4co2thVRAfx4jXyszN+NFiB0ctbaoubyqDE57eev06LFSVnyb+f9UgFO+Oraj
 D/3dMZqDflqckiBbUjNH02GnYywhLb1aHGUWyF+al+WJBoOfHTXKkvk15pDBUEGILTHq
 llXteQNpBZ1FR5jq+W+Hu0rqXYGLjapgqyfzaV3cdCji4Z0MJysMmMLicooCRa6DM8Xc
 Y1uIftDzgv6jOQyBvbEwIJg5WuEyq3nhJ1bJpHbi8o/UhM/J/4uch3H0pdiB1OQc4xUy
 UytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MXxHc8zF6zr0b8trV04SdIxBHpU7GIEyXW6bHvBYNVc=;
 b=qkObz+k4tVqqqA5gULeYhekSW3wYjvC5rU4iqebCP9pB/Vjbh+/q3UC7mCiLBXL32i
 NUDo/DO6IvQ4QoIf7XL1zb3Y3n/8oIGru63daCx2Sf0aihEO+h/r6lnrH/TSEPdC7kRV
 2kOgMaUguoj4v/x6pbnlZD9IGoCwr4tbjD7d1m70YvSNawGG8/Km8YqOTsWAiiVT1+Rl
 CoUF0tSydDIFhxHok2QtzsiDvI5ZQhBaeRk2sZXcetJlGvMvgjasp6hM/8hGXT/seKon
 R7cjand/q50vIGSBmIMzAgXUCAGtK8rpXFQ65Gzl4dRwH0y8CfhD6WirN//95wAkPV42
 5jfw==
X-Gm-Message-State: AGi0PuawPJzdTiLonMqdZSWVY2ZeN02Zh619kjQSHGsYWTtGM7d5VwmY
 RItck2zbxpoMjOOEVizesCqnMw==
X-Google-Smtp-Source: APiQypJUMIE6mZ6Ebfbx5vwe0xfAMnDqVAb1YAzOvzRoxWOeD2wdwRP7QlMArdBeduHde/lqgHw75w==
X-Received: by 2002:ac8:7552:: with SMTP id b18mr5826642qtr.312.1587676222586; 
 Thu, 23 Apr 2020 14:10:22 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id n4sm2341495qkh.38.2020.04.23.14.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 14:10:22 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v3 1/9] drm/msm: add msm_gem_get_and_pin_iova_range
Date: Thu, 23 Apr 2020 17:09:13 -0400
Message-Id: <20200423210946.28867-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200423210946.28867-1-jonathan@marek.ca>
References: <20200423210946.28867-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
