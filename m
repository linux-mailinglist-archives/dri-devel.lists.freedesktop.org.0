Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F6BAEB137
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 10:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3653D10E059;
	Fri, 27 Jun 2025 08:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZfhjzxQX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SGXusrlv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zEq2JLPi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DUV5RsZ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4507910E059
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 08:23:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DBCEA1F387;
 Fri, 27 Jun 2025 08:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751012629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+mXih3LTIHDYAvgNDfd3lZJ1IYE6rjF2/019w24ukbY=;
 b=ZfhjzxQX2/DSN0PosLGC+NJALd3qRJWGdSPUmGXhwUUNGNT7Rtpt5rwZ+Q1OTHhSN5uBuy
 dewx4R75t3C+90K370Wvb/7QR7kpSF8ibNzXz+8wxBcpXozcgnd88tUyGxqYc7K1xpokao
 gGr1Jg2UxDIKHKQNG+/hTjtwsaoFN74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751012629;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+mXih3LTIHDYAvgNDfd3lZJ1IYE6rjF2/019w24ukbY=;
 b=SGXusrlvkr/Quz+4DSDsUiZaPnPL7p82BhuVngSQT3QN2QZJnLTLzh2hz/uxDPAioxgD1B
 KVTAWxm4Lg8m04Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751012628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+mXih3LTIHDYAvgNDfd3lZJ1IYE6rjF2/019w24ukbY=;
 b=zEq2JLPiTtvXKkiBgbmvHc8fVNjwup++0Hu1Hwexc2b87riY7tKEN9RdupYmkWMoBNiqa7
 UMcZAxWb+P0Zkg1WjHmtyhrTBDxmKGjYn3zoWGnnvlKeyedvILkuO/DcjzJsYBw3Gox7pv
 V7NXQHeOf9vvorD6RWL6pA1qFRXi/yM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751012628;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+mXih3LTIHDYAvgNDfd3lZJ1IYE6rjF2/019w24ukbY=;
 b=DUV5RsZ2Aoe046S5TVucLHy88qvh5Wiy9rSdrDX0/hD4R8qUs8982S+k5CJ7TvzmZ2pnDD
 aYFWpBBh1CIrB+Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 843C313786;
 Fri, 27 Jun 2025 08:23:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GtC1HhRVXmhFWQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Jun 2025 08:23:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: christian.koenig@amd.com, asrivats@redhat.com,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org
Subject: [PATCH] drm/gem: Acquire references on GEM handles for framebuffers
Date: Fri, 27 Jun 2025 10:20:19 +0200
Message-ID: <20250627082052.26181-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_TWELVE(0.00)[12];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[amd.com,redhat.com,linux.intel.com,gmail.com,ffwll.ch];
 MIME_TRACE(0.00)[0:+];
 URIBL_BLOCKED(0.00)[suse.de:email,suse.de:mid,intel.com:email,linaro.org:email];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid, linaro.org:email,
 intel.com:email, imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A GEM handle can be released while the GEM buffer object is attached
to a DRM framebuffer. This leads to the release of the dma-buf backing
the buffer object, if any. [1] Trying to use the framebuffer in further
mode-setting operations leads to a segmentation fault. Most easily
happens with driver that use shadow planes for vmap-ing the dma-buf
during a page flip. An example is shown below.

[  156.791968] ------------[ cut here ]------------
[  156.796830] WARNING: CPU: 2 PID: 2255 at drivers/dma-buf/dma-buf.c:1527 dma_buf_vmap+0x224/0x430
[...]
[  156.942028] RIP: 0010:dma_buf_vmap+0x224/0x430
[  157.043420] Call Trace:
[  157.045898]  <TASK>
[  157.048030]  ? show_trace_log_lvl+0x1af/0x2c0
[  157.052436]  ? show_trace_log_lvl+0x1af/0x2c0
[  157.056836]  ? show_trace_log_lvl+0x1af/0x2c0
[  157.061253]  ? drm_gem_shmem_vmap+0x74/0x710
[  157.065567]  ? dma_buf_vmap+0x224/0x430
[  157.069446]  ? __warn.cold+0x58/0xe4
[  157.073061]  ? dma_buf_vmap+0x224/0x430
[  157.077111]  ? report_bug+0x1dd/0x390
[  157.080842]  ? handle_bug+0x5e/0xa0
[  157.084389]  ? exc_invalid_op+0x14/0x50
[  157.088291]  ? asm_exc_invalid_op+0x16/0x20
[  157.092548]  ? dma_buf_vmap+0x224/0x430
[  157.096663]  ? dma_resv_get_singleton+0x6d/0x230
[  157.101341]  ? __pfx_dma_buf_vmap+0x10/0x10
[  157.105588]  ? __pfx_dma_resv_get_singleton+0x10/0x10
[  157.110697]  drm_gem_shmem_vmap+0x74/0x710
[  157.114866]  drm_gem_vmap+0xa9/0x1b0
[  157.118763]  drm_gem_vmap_unlocked+0x46/0xa0
[  157.123086]  drm_gem_fb_vmap+0xab/0x300
[  157.126979]  drm_atomic_helper_prepare_planes.part.0+0x487/0xb10
[  157.133032]  ? lockdep_init_map_type+0x19d/0x880
[  157.137701]  drm_atomic_helper_commit+0x13d/0x2e0
[  157.142671]  ? drm_atomic_nonblocking_commit+0xa0/0x180
[  157.147988]  drm_mode_atomic_ioctl+0x766/0xe40
[...]
[  157.346424] ---[ end trace 0000000000000000 ]---

Acquiring GEM handles for the framebuffer's GEM buffer objects prevents
this from happening. The framebuffer's cleanup later puts the handle
references.

The Fixes tag points to commit 1a148af06000 ("drm/gem-shmem: Use dma_buf
from GEM object instance"), which triggers the segmentation fault. The
issue has been present before.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 1a148af06000 ("drm/gem-shmem: Use dma_buf from GEM object instance")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Anusha Srivatsa <asrivats@redhat.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/drm_gem.c                    | 44 ++++++++++++++++++--
 drivers/gpu/drm/drm_gem_framebuffer_helper.c |  7 +++-
 drivers/gpu/drm/drm_internal.h               |  2 +
 3 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 19d50d254fe6..8be50b3cc9c2 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -213,6 +213,35 @@ void drm_gem_private_object_fini(struct drm_gem_object *obj)
 }
 EXPORT_SYMBOL(drm_gem_private_object_fini);
 
+static void drm_gem_object_handle_get(struct drm_gem_object *obj)
+{
+	struct drm_device *dev = obj->dev;
+
+	drm_WARN_ON(dev, !mutex_is_locked(&dev->object_name_lock));
+
+	if (obj->handle_count++ == 0)
+		drm_gem_object_get(obj);
+}
+
+/**
+ * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
+ * @obj: GEM object
+ *
+ * Acquires a reference on the GEM buffer object's handle. Required
+ * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
+ * to release the reference.
+ */
+void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
+{
+	struct drm_device *dev = obj->dev;
+
+	guard(mutex)(&dev->object_name_lock);
+
+	drm_WARN_ON(dev, !obj->handle_count); // first ref taken in create-tail helper
+	drm_gem_object_handle_get(obj);
+}
+EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
+
 /**
  * drm_gem_object_handle_free - release resources bound to userspace handles
  * @obj: GEM object to clean up.
@@ -243,8 +272,14 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
 	}
 }
 
-static void
-drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
+/**
+ * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
+ * @obj: GEM object
+ *
+ * Releases a reference on the GEM buffer object's handle. Possibly releases
+ * the GEM buffer object and associated dma-buf objects.
+ */
+void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 {
 	struct drm_device *dev = obj->dev;
 	bool final = false;
@@ -269,6 +304,7 @@ drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 	if (final)
 		drm_gem_object_put(obj);
 }
+EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
 
 /*
  * Called at device or object close to release the file's
@@ -390,8 +426,8 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
 	int ret;
 
 	WARN_ON(!mutex_is_locked(&dev->object_name_lock));
-	if (obj->handle_count++ == 0)
-		drm_gem_object_get(obj);
+
+	drm_gem_object_handle_get(obj);
 
 	/*
 	 * Get the user-visible handle using idr.  Preload and perform
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 618ce725cd75..723f1d652c01 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -99,8 +99,10 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
 {
 	unsigned int i;
 
-	for (i = 0; i < fb->format->num_planes; i++)
+	for (i = 0; i < fb->format->num_planes; i++) {
+		drm_gem_object_handle_put_unlocked(fb->obj[i]);
 		drm_gem_object_put(fb->obj[i]);
+	}
 
 	drm_framebuffer_cleanup(fb);
 	kfree(fb);
@@ -185,6 +187,7 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
 			ret = -ENOENT;
 			goto err_gem_object_put;
 		}
+		drm_gem_object_handle_get_unlocked(objs[i]);
 
 		min_size = (height - 1) * mode_cmd->pitches[i]
 			 + drm_format_info_min_pitch(info, i, width)
@@ -195,6 +198,7 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
 				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
 				    objs[i]->size, min_size, i);
 			drm_gem_object_put(objs[i]);
+			drm_gem_object_handle_put_unlocked(objs[i]);
 			ret = -EINVAL;
 			goto err_gem_object_put;
 		}
@@ -210,6 +214,7 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
 	while (i > 0) {
 		--i;
 		drm_gem_object_put(objs[i]);
+		drm_gem_object_handle_put_unlocked(objs[i]);
 	}
 	return ret;
 }
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 442eb31351dd..f7b414a813ae 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -161,6 +161,8 @@ void drm_sysfs_lease_event(struct drm_device *dev);
 
 /* drm_gem.c */
 int drm_gem_init(struct drm_device *dev);
+void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
+void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
 int drm_gem_handle_create_tail(struct drm_file *file_priv,
 			       struct drm_gem_object *obj,
 			       u32 *handlep);
-- 
2.50.0

