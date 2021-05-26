Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E041391C09
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 17:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A386E3F5;
	Wed, 26 May 2021 15:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9368E6E5AE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 15:31:05 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 f6-20020a1c1f060000b0290175ca89f698so767469wmf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RB2ZWVJP4SRB/tEOtf84RYCzItdRRncT9gVbFIJersM=;
 b=jUTaxs8wkvnpXVTo9NGd5DMUK4X7BLiCyc7IkcBcpKdpg2cu7cMaQnUlj3U1L2HHwj
 T0gIFLpPA+Id87xr9rm5QT1CzseB6PnvWpzV9jqu7FlYFQ1QqMcvYhJrbcjTkUTVzWXy
 sFen1l8p0mM4diskaTrZbyo2hBW2GRwQrucwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RB2ZWVJP4SRB/tEOtf84RYCzItdRRncT9gVbFIJersM=;
 b=EcbCjIhXh04t5ftDrz315dwGCfKK0uk6lb8MabPE92QtLFzHXZwbXjfe95f9YdKde7
 mGuqulSyE70W4E7uFyXbcwai58brkGsNgxHg7snr2B6HPVR76UvXA6pFzzSn3FFOre1H
 X2UpEJrY2CSl3bnJv1h7ZeuvVBGpvnsa6IMFB55ZQVrC8CUdrL+SQ6heBNrDDS/FgarR
 1O/UOVzm78NYjzOPbi9OIwYrJV4H/lnogOdX210YlTCuRWIPwF3vvNgUmARNjxuHWqYo
 r+ciafO6atYZDZI+EY6zErHncBd90MJxWHXm2WdwotTjngDRnkl62ZGoPPIH/cZ4tXMp
 ud0w==
X-Gm-Message-State: AOAM532Lo18nGwkEHg2sTKXJzbo0pjieMstIYt3JY94yZxxWIpCh4rd5
 yhVeO8ja1lDBqtbdcrCtpyJiLMwdlnRuiw==
X-Google-Smtp-Source: ABdhPJylB8/u0/JgesRvpK4QDmT4zR+S8J7rFzGdL/nnmwm9hzw9d8oFiUjh4Sdh2XdASIpILFY8ZA==
X-Received: by 2002:a1c:7f86:: with SMTP id a128mr28929956wmd.20.1622043064306; 
 Wed, 26 May 2021 08:31:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h15sm14965458wmq.1.2021.05.26.08.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 08:31:03 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/i915: Use generic_access_phys
Date: Wed, 26 May 2021 17:30:58 +0200
Message-Id: <20210526153058.3392996-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210526151106.3390006-1-daniel.vetter@ffwll.ch>
References: <20210526151106.3390006-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michel Lespinasse <walken@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since

commit 96667f8a4382db9ed042332ca6ee165ae9b91307
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri Nov 27 17:41:21 2020 +0100

    mm: Close race in generic_access_phys

it is race-free and can therefore be safely used for dynamic mappings
like we have too.

v2 git commit --amend

*sigh*

Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
Cc: Michel Lespinasse <walken@google.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 60 +++---------------------
 1 file changed, 6 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index f6fe5cb01438..16a059d54bda 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -414,58 +414,6 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 	return i915_error_to_vmf_fault(ret);
 }
 
-static int
-vm_access(struct vm_area_struct *area, unsigned long addr,
-	  void *buf, int len, int write)
-{
-	struct i915_mmap_offset *mmo = area->vm_private_data;
-	struct drm_i915_gem_object *obj = mmo->obj;
-	struct i915_gem_ww_ctx ww;
-	void *vaddr;
-	int err = 0;
-
-	if (i915_gem_object_is_readonly(obj) && write)
-		return -EACCES;
-
-	addr -= area->vm_start;
-	if (addr >= obj->base.size)
-		return -EINVAL;
-
-	i915_gem_ww_ctx_init(&ww, true);
-retry:
-	err = i915_gem_object_lock(obj, &ww);
-	if (err)
-		goto out;
-
-	/* As this is primarily for debugging, let's focus on simplicity */
-	vaddr = i915_gem_object_pin_map(obj, I915_MAP_FORCE_WC);
-	if (IS_ERR(vaddr)) {
-		err = PTR_ERR(vaddr);
-		goto out;
-	}
-
-	if (write) {
-		memcpy(vaddr + addr, buf, len);
-		__i915_gem_object_flush_map(obj, addr, len);
-	} else {
-		memcpy(buf, vaddr + addr, len);
-	}
-
-	i915_gem_object_unpin_map(obj);
-out:
-	if (err == -EDEADLK) {
-		err = i915_gem_ww_ctx_backoff(&ww);
-		if (!err)
-			goto retry;
-	}
-	i915_gem_ww_ctx_fini(&ww);
-
-	if (err)
-		return err;
-
-	return len;
-}
-
 void __i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj)
 {
 	struct i915_vma *vma;
@@ -801,14 +749,18 @@ static void vm_close(struct vm_area_struct *vma)
 
 static const struct vm_operations_struct vm_ops_gtt = {
 	.fault = vm_fault_gtt,
-	.access = vm_access,
+#ifdef CONFIG_HAVE_IOREMAP_PROT
+	.access = generic_access_phys,
+#endif
 	.open = vm_open,
 	.close = vm_close,
 };
 
 static const struct vm_operations_struct vm_ops_cpu = {
 	.fault = vm_fault_cpu,
-	.access = vm_access,
+#ifdef CONFIG_HAVE_IOREMAP_PROT
+	.access = generic_access_phys,
+#endif
 	.open = vm_open,
 	.close = vm_close,
 };
-- 
2.31.0

