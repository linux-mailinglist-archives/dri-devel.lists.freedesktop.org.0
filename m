Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDE039A4DE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 17:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B356F4C1;
	Thu,  3 Jun 2021 15:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DAC6F4B7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 15:40:42 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id v14so5438977pgi.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 08:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LZpq7f5pIJW2dDuLII86TMWxTbEjjl9Ioc6Cn93MUc8=;
 b=1a7CYz1qC7FklL6VqFEMj67DRmxSPiG4m6WbJPykddyzmDvCWZLUKyZtJ2RH22CzOv
 tQ46nZ1C9BwKTfZCjHApzDCEK+4HT+jM39ijzE5MKn4QT7fZxbk0v5BaPyhiuwl5cFJN
 Uz6xexqnRrO7/P8VaVSdQui1tMhyWh9v40odVnClU5ts4+OTeIbAhGh5ajwolCt5GK+o
 AWIbb1Lx5++7rpq6UNslXgHij/km6qusEl6VnpvhsLMez8dLOScNEEfWwpnj/ui8yIBk
 2k3dsGZgibXloLvyTL7QbruC8YqzqNw+jtK5jk8tn9nP3rpTjtCd+ZQbzAGTyhajiQhV
 26NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LZpq7f5pIJW2dDuLII86TMWxTbEjjl9Ioc6Cn93MUc8=;
 b=gUIzsaFhVal4vTBV2EGTiHeNNbOh70urjmmLl1PMmgx6uIK8qYFwUG+H9Ie2Prk9DI
 ocIjTmHciyTFlpXWxIhxRxvBGjMAGKNz4wuNrKIT8QX/H5YwiMA/OEJvvgm93CIoah+j
 qgS+p5dZS/WNMAuwJ7ytW2SK62yxIB4/SeNk+5wwxzHpuFNu3KU5cmY4M3UVNj7pZ7HZ
 GJXwQEEz6KGI0lg9/nJ7DAa9DjRjtn48AUmW36L+73twDRy8uIHmG/G2YIkR6q3PLRFE
 8mNATAbEBoNoK50wookYdzAHKhQMn5aoKDaQh8aG3+m/6WkpmLg1DuxiXgMAC9uUubNx
 NVVA==
X-Gm-Message-State: AOAM532z3m/BCJmQZ6+6tctwoZnX9KkwtfpLTd0A5BzA91hU/zOKzzdH
 1biozqss7MJ1WbCXT92LIHHxKA==
X-Google-Smtp-Source: ABdhPJyNA+dcEpwlJnsF5fN3j4ZSdFBOrqsQxFzV2HJkXCXq2H7Sa6lkhXN1kXJilu8tQT8otKeeXg==
X-Received: by 2002:a63:da15:: with SMTP id c21mr81239pgh.227.1622734841589;
 Thu, 03 Jun 2021 08:40:41 -0700 (PDT)
Received: from omlet.lan ([134.134.139.76])
 by smtp.gmail.com with ESMTPSA id mp21sm2681789pjb.50.2021.06.03.08.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:40:41 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915: Drop error handling from dma_fence_work
Date: Thu,  3 Jun 2021 10:40:26 -0500
Message-Id: <20210603154027.594906-5-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603154027.594906-1-jason@jlekstrand.net>
References: <20210603154027.594906-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Asynchronous command parsing was the only thing which ever returned a
non-zero error.  With that gone, we can drop the error handling from
dma_fence_work.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Jon Bloomfield <jon.bloomfield@intel.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c | 4 +---
 drivers/gpu/drm/i915/i915_sw_fence_work.c   | 5 +----
 drivers/gpu/drm/i915/i915_sw_fence_work.h   | 2 +-
 drivers/gpu/drm/i915/i915_vma.c             | 3 +--
 4 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
index daf9284ef1f54..f0435c6feb68b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
@@ -24,13 +24,11 @@ static void __do_clflush(struct drm_i915_gem_object *obj)
 	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
 }
 
-static int clflush_work(struct dma_fence_work *base)
+static void clflush_work(struct dma_fence_work *base)
 {
 	struct clflush *clflush = container_of(base, typeof(*clflush), base);
 
 	__do_clflush(clflush->obj);
-
-	return 0;
 }
 
 static void clflush_release(struct dma_fence_work *base)
diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.c b/drivers/gpu/drm/i915/i915_sw_fence_work.c
index a3a81bb8f2c36..5b33ef23d54c9 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence_work.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence_work.c
@@ -16,11 +16,8 @@ static void fence_complete(struct dma_fence_work *f)
 static void fence_work(struct work_struct *work)
 {
 	struct dma_fence_work *f = container_of(work, typeof(*f), work);
-	int err;
 
-	err = f->ops->work(f);
-	if (err)
-		dma_fence_set_error(&f->dma, err);
+	f->ops->work(f);
 
 	fence_complete(f);
 	dma_fence_put(&f->dma);
diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.h b/drivers/gpu/drm/i915/i915_sw_fence_work.h
index 2c409f11c5c59..d56806918d131 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence_work.h
+++ b/drivers/gpu/drm/i915/i915_sw_fence_work.h
@@ -17,7 +17,7 @@ struct dma_fence_work;
 
 struct dma_fence_work_ops {
 	const char *name;
-	int (*work)(struct dma_fence_work *f);
+	void (*work)(struct dma_fence_work *f);
 	void (*release)(struct dma_fence_work *f);
 };
 
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 0f227f28b2802..5b9dce0f443b0 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -300,14 +300,13 @@ struct i915_vma_work {
 	unsigned int flags;
 };
 
-static int __vma_bind(struct dma_fence_work *work)
+static void __vma_bind(struct dma_fence_work *work)
 {
 	struct i915_vma_work *vw = container_of(work, typeof(*vw), base);
 	struct i915_vma *vma = vw->vma;
 
 	vma->ops->bind_vma(vw->vm, &vw->stash,
 			   vma, vw->cache_level, vw->flags);
-	return 0;
 }
 
 static void __vma_release(struct dma_fence_work *work)
-- 
2.31.1

