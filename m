Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7743C8BC4
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 21:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46656E4DE;
	Wed, 14 Jul 2021 19:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2C56E4E3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 19:34:35 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 70so201263pgh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 12:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LZpq7f5pIJW2dDuLII86TMWxTbEjjl9Ioc6Cn93MUc8=;
 b=w8YZPuh7S9TVbLNxwc2NO+izQBE6O8DlmY5cOOm8k27HMoIa5GY/QLy2EbKEu3fA+M
 bXPi3tECWjahQNfvYBDAk8vdEpRyynez6sKCU7xiM4313cw4kGYYOeFiY0WR97Vh4xZi
 0yP+REhgB1A7uIP82b58AVnZNi/deuiOkwohLR3zcFWFcfrAwshDUduPtzaW9lbSXWSq
 ji0xrZGg+fCN9Xf/KcDD8uPsSj0UvAGQKJl3gCslpPFru69+RXd8pAYLP2Gbp3O2Ib1y
 cNN2gY+OjhgqOd1DcD01fAjw42jxAhLBgAbmQg0iAV8wWgmjYsMD5M1dL9dsAMqYwbWQ
 M9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LZpq7f5pIJW2dDuLII86TMWxTbEjjl9Ioc6Cn93MUc8=;
 b=Yn37/wveEFltDA8+0R74exHDn2yy6dA46ghF16yL6THlxm/cPWWPEdNpO+Tv/ysF0H
 D7J8fsUR8nqX9KJAZpnvAT2oz8C6QrssI4kGCYkTp/e8cfcLDtuvRN33H2xSpAkeNZnl
 oZmiSj5nY2i1lCAA+uuGcyB6VMxVyXA2M8jbztrkqjfVR5RCgvAS1t2IQ4GvDxrMiZBy
 yNRMR6KGeSv5mUQo0rNuA2T+rCPMgWTXZtGWnaG70JD4Z+s3y+YSOgP5rcu2Ziggw72Y
 DEP23DFPQxBEXfR5Y5tCrqg0rD6Y9InhLANsLy1Ndcm6SMjGyH+KdTzvrEfDnZh4zkwM
 kzww==
X-Gm-Message-State: AOAM531XpmymfVLqLbfcrYUnQ2Ns5BknITrWz4exBnjYaAwNKOLYjmwM
 xn785gJ+ccs6ik8NPwP4n+jKgw==
X-Google-Smtp-Source: ABdhPJysyhnL3fYVRgercJqJ73t2gaymGr5FvicIcps9O0xIGvBq0LW1ljxM8eRy7rYCS0KqYQNypQ==
X-Received: by 2002:a63:f516:: with SMTP id w22mr11230436pgh.188.1626291274624; 
 Wed, 14 Jul 2021 12:34:34 -0700 (PDT)
Received: from omlet.com ([134.134.139.71])
 by smtp.gmail.com with ESMTPSA id i1sm3679740pfo.37.2021.07.14.12.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 12:34:33 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915: Drop error handling from dma_fence_work
Date: Wed, 14 Jul 2021 14:34:18 -0500
Message-Id: <20210714193419.1459723-5-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714193419.1459723-1-jason@jlekstrand.net>
References: <20210714193419.1459723-1-jason@jlekstrand.net>
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

