Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F3C3C3A0A
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 05:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9AB6EB85;
	Sun, 11 Jul 2021 03:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926086EB7F
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jul 2021 03:53:46 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id z3so17884782oib.9
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 20:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LZpq7f5pIJW2dDuLII86TMWxTbEjjl9Ioc6Cn93MUc8=;
 b=i3pFB0G0Am2qTjj86SlsImB9JKL/dG+A3JXSIH5l+4zASPN/MXS0zkrePlXzRXTfpV
 Zel+dh2is/Gg4/ghLFAvg3QDDhrDzBrFzNThOLBkkv1UBQe8LqPGTrXPpg4kx3Iungiu
 Nw2G7CTR4YY2najZXcDujNPGpu6regillJeAlA2giwNiSvzO4/kq6S8TD8NxxEPLh4Ki
 vl/Gu7iYS076Invq6ccqsr4oa225FG/B7JmX36cqCxBwDhFO1qzXnxTsPLC4e9YEdnS1
 oAi4DnlTuE+wDDB7IapVvPqpIwwrPO7yPEGIZFnRRd0rKKDEoMHGLbFAiCrFm79WSXXi
 C9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LZpq7f5pIJW2dDuLII86TMWxTbEjjl9Ioc6Cn93MUc8=;
 b=dziJ7S6EWqmIruvDm0fCttJgyyJBxmxF/2qe/vUuJeDatPRJylBiThSXfh5zRYfssy
 u9sS9D/dGF/ln0QZC7Qmyk6YQkqNVNDR2u6FsEnRiYZhHvQY3enwePydsxR0mUVTI5Wv
 lQtryAfVdQFP3JqX2X+m+V87opaorz0isIocx4rxc3SKDZ8zANTPQy4mhBD0umpQx8zs
 JyUc5PR3oxjjr6e4CZ9PfrzRvfwFPxc4xzZMX+0XYLjANw5kcaM3YTGhh4i2N32gd13t
 qtEW4PGXylUpggmcNYL/oJRunR48k9aFWRKh0keQmUwy0PwC7z5x1wSCbQPuBJGlI4mg
 qxtQ==
X-Gm-Message-State: AOAM532Xx2WtukG1iQgtMpp020ce7xajQHILoHZKUiANNMVw6nGVyVlh
 Oc4jbWkYqBSr448cLaMvb+Kq5TiZXExW+Q==
X-Google-Smtp-Source: ABdhPJz00rvYPJfSgaxmlJqYZsxGUbw/M/EotxVLTIXDetuA9UNqjIYaQQmOi8aY+IOs4XImwrs/nQ==
X-Received: by 2002:aca:6046:: with SMTP id u67mr5491114oib.23.1625975625817; 
 Sat, 10 Jul 2021 20:53:45 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id a11sm2310188otr.48.2021.07.10.20.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 20:53:45 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915: Drop error handling from dma_fence_work
Date: Sat, 10 Jul 2021 22:53:35 -0500
Message-Id: <20210711035336.803025-5-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711035336.803025-1-jason@jlekstrand.net>
References: <20210711035336.803025-1-jason@jlekstrand.net>
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

