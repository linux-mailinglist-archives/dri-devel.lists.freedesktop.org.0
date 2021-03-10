Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F2633494A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 22:01:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE036EA5E;
	Wed, 10 Mar 2021 21:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9056EA5B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 21:00:55 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id e2so3840838pld.9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 13:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ik84YBzzUjW+xanhnX2Y30aWCflIMPvvkL8xxyTIkY8=;
 b=NO+0FTVuv+wutTpeUKOMHZOnz8qWAqwU55dot9OkFJIDWFb4/v/e4mMfHc6ALgZSUb
 RdtS0znpLoeSQm+eda/O7APHJTKbSKJ6EBbs2pBikjE7n39HqnwkDsZhQvRp6ThitgGt
 2bdo2JyIIqBUEyhN6cZqpaoGY5CoC7Wik95ZXDMOicWhhLeZMYsTjHxcORzXF2unfJm6
 oTA5Tn+H0ZEePObk0xMmoGYG7oZiDNz8Z8LGbUNX68ofgbUmEvPmCrcN8SbpoCJtyYej
 xUGNln2kxUUKv5Cq0bfO2Dg4J46AYFv024ztL5PkthtI+n1b0ms1RWNt+x9m2/pPHLGl
 btIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ik84YBzzUjW+xanhnX2Y30aWCflIMPvvkL8xxyTIkY8=;
 b=H3VGxUFPl1Bn0xR0R+OxkfjXcYNnHkMQGPvRDwZDwY+kLleBo4Kqd7/K7iDqFTaAZ7
 R7r7dnUfN3nbGQCKzPhWoN22UellPaWU5yOs/J9fjlqOsu2JCtls5bqZb6MnnPmgnB+Z
 o3Yhx6k2Dqvy8tzl7ZhD4kDkHHucgreLn9mJ+A4DUjYzMDdtu6e9EYXN4sB57F/KolbG
 P0hQgLa0s9tk3fCcedYEhWQO4jxV+ahxXRnIpKoDBH2l66UJvN9b0V6cm+8JVfWG6nph
 PMhgN7cG7BPBm39KTO8DMZ0rvxOnLGYG4Ur7B9lRI0mseXY7sEGM8u7UPgqOp98esptx
 RX7g==
X-Gm-Message-State: AOAM530BWg8KzacEaXbTjHAsQPpBq8uneo3t6wElDbaoleu0LtGWvTuG
 UQpFTNpxGPGZOFq3rzpYJguMdXMJK2x6Ig==
X-Google-Smtp-Source: ABdhPJwAFES6oHNRR64pzpLjmCm7O7I+4BvwaFyAyE87kW5c1AY88CgdoP1cXOfy1A0nagKbYbn1Fw==
X-Received: by 2002:a17:90a:a414:: with SMTP id
 y20mr5321134pjp.77.1615410054480; 
 Wed, 10 Mar 2021 13:00:54 -0800 (PST)
Received: from omlet.lan (jfdmzpr06-ext.jf.intel.com. [134.134.137.75])
 by smtp.gmail.com with ESMTPSA id w5sm373867pfn.51.2021.03.10.13.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 13:00:53 -0800 (PST)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 airlied@redhat.com
Subject: [PATCH] i915: Drop legacy execbuffer support
Date: Wed, 10 Mar 2021 15:00:49 -0600
Message-Id: <20210310210049.723206-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.29.2
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

libdrm has supported the newer execbuffer2 ioctl and using it by default
when it exists since libdrm commit b50964027bef249a0cc3d511de05c2464e0a1e22
which landed Mar 2, 2010.  The i915 and i965 drivers in Mesa at the time
both used libdrm and so did the Intel X11 back-end.  The SNA back-end
for X11 has always used execbuffer2.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 100 ------------------
 drivers/gpu/drm/i915/gem/i915_gem_ioctls.h    |   2 -
 drivers/gpu/drm/i915/i915_drv.c               |   2 +-
 3 files changed, 1 insertion(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index fe170186dd428..99772f37bff60 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3394,106 +3394,6 @@ static bool check_buffer_count(size_t count)
 	return !(count < 1 || count > INT_MAX || count > SIZE_MAX / sz - 1);
 }
 
-/*
- * Legacy execbuffer just creates an exec2 list from the original exec object
- * list array and passes it to the real function.
- */
-int
-i915_gem_execbuffer_ioctl(struct drm_device *dev, void *data,
-			  struct drm_file *file)
-{
-	struct drm_i915_private *i915 = to_i915(dev);
-	struct drm_i915_gem_execbuffer *args = data;
-	struct drm_i915_gem_execbuffer2 exec2;
-	struct drm_i915_gem_exec_object *exec_list = NULL;
-	struct drm_i915_gem_exec_object2 *exec2_list = NULL;
-	const size_t count = args->buffer_count;
-	unsigned int i;
-	int err;
-
-	if (!check_buffer_count(count)) {
-		drm_dbg(&i915->drm, "execbuf2 with %zd buffers\n", count);
-		return -EINVAL;
-	}
-
-	exec2.buffers_ptr = args->buffers_ptr;
-	exec2.buffer_count = args->buffer_count;
-	exec2.batch_start_offset = args->batch_start_offset;
-	exec2.batch_len = args->batch_len;
-	exec2.DR1 = args->DR1;
-	exec2.DR4 = args->DR4;
-	exec2.num_cliprects = args->num_cliprects;
-	exec2.cliprects_ptr = args->cliprects_ptr;
-	exec2.flags = I915_EXEC_RENDER;
-	i915_execbuffer2_set_context_id(exec2, 0);
-
-	err = i915_gem_check_execbuffer(&exec2);
-	if (err)
-		return err;
-
-	/* Copy in the exec list from userland */
-	exec_list = kvmalloc_array(count, sizeof(*exec_list),
-				   __GFP_NOWARN | GFP_KERNEL);
-
-	/* Allocate extra slots for use by the command parser */
-	exec2_list = kvmalloc_array(count + 2, eb_element_size(),
-				    __GFP_NOWARN | GFP_KERNEL);
-	if (exec_list == NULL || exec2_list == NULL) {
-		drm_dbg(&i915->drm,
-			"Failed to allocate exec list for %d buffers\n",
-			args->buffer_count);
-		kvfree(exec_list);
-		kvfree(exec2_list);
-		return -ENOMEM;
-	}
-	err = copy_from_user(exec_list,
-			     u64_to_user_ptr(args->buffers_ptr),
-			     sizeof(*exec_list) * count);
-	if (err) {
-		drm_dbg(&i915->drm, "copy %d exec entries failed %d\n",
-			args->buffer_count, err);
-		kvfree(exec_list);
-		kvfree(exec2_list);
-		return -EFAULT;
-	}
-
-	for (i = 0; i < args->buffer_count; i++) {
-		exec2_list[i].handle = exec_list[i].handle;
-		exec2_list[i].relocation_count = exec_list[i].relocation_count;
-		exec2_list[i].relocs_ptr = exec_list[i].relocs_ptr;
-		exec2_list[i].alignment = exec_list[i].alignment;
-		exec2_list[i].offset = exec_list[i].offset;
-		if (INTEL_GEN(to_i915(dev)) < 4)
-			exec2_list[i].flags = EXEC_OBJECT_NEEDS_FENCE;
-		else
-			exec2_list[i].flags = 0;
-	}
-
-	err = i915_gem_do_execbuffer(dev, file, &exec2, exec2_list);
-	if (exec2.flags & __EXEC_HAS_RELOC) {
-		struct drm_i915_gem_exec_object __user *user_exec_list =
-			u64_to_user_ptr(args->buffers_ptr);
-
-		/* Copy the new buffer offsets back to the user's exec list. */
-		for (i = 0; i < args->buffer_count; i++) {
-			if (!(exec2_list[i].offset & UPDATE))
-				continue;
-
-			exec2_list[i].offset =
-				gen8_canonical_addr(exec2_list[i].offset & PIN_OFFSET_MASK);
-			exec2_list[i].offset &= PIN_OFFSET_MASK;
-			if (__copy_to_user(&user_exec_list[i].offset,
-					   &exec2_list[i].offset,
-					   sizeof(user_exec_list[i].offset)))
-				break;
-		}
-	}
-
-	kvfree(exec_list);
-	kvfree(exec2_list);
-	return err;
-}
-
 int
 i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 			   struct drm_file *file)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h b/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
index 87d8b27f426de..7fd22f3efbef0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
@@ -14,8 +14,6 @@ int i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 int i915_gem_create_ioctl(struct drm_device *dev, void *data,
 			  struct drm_file *file);
-int i915_gem_execbuffer_ioctl(struct drm_device *dev, void *data,
-			      struct drm_file *file);
 int i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 			       struct drm_file *file);
 int i915_gem_get_aperture_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 3edd5e47ad682..64edcab59fe12 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1701,7 +1701,7 @@ static const struct drm_ioctl_desc i915_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(I915_VBLANK_SWAP, drm_noop, DRM_AUTH),
 	DRM_IOCTL_DEF_DRV(I915_HWS_ADDR, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
 	DRM_IOCTL_DEF_DRV(I915_GEM_INIT, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_IOCTL_DEF_DRV(I915_GEM_EXECBUFFER, i915_gem_execbuffer_ioctl, DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(I915_GEM_EXECBUFFER, drm_invalid_op, DRM_AUTH),
 	DRM_IOCTL_DEF_DRV(I915_GEM_EXECBUFFER2_WR, i915_gem_execbuffer2_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(I915_GEM_PIN, i915_gem_reject_pin_ioctl, DRM_AUTH|DRM_ROOT_ONLY),
 	DRM_IOCTL_DEF_DRV(I915_GEM_UNPIN, i915_gem_reject_pin_ioctl, DRM_AUTH|DRM_ROOT_ONLY),
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
