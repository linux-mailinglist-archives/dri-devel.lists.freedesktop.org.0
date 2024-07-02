Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB6E924C26
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 01:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB4110E50A;
	Tue,  2 Jul 2024 23:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="h1/yLHTu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558E110E50A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 23:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719963304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=CDJrW/fweje5WkTGpyth3SwWRqpHU5OBcviptdCfIuo=;
 b=h1/yLHTuLWRKl5nGQLi2BsLlILKsoKFK6JwUigIi/tWOoQNfCdD0jhWlCWjumcNhGvddZO
 cv6n/zsBrX8g5WIvm2JOqbnlsEZN6JoeJarLsAU5gOKvO7yHrXTFqDxVw6SdNdVndvHW9s
 XV5bCdogAS2C70Zy/mRMe350Gwf/p/0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-488-qxhzJhEWP-Wkz85eGRnjpA-1; Tue,
 02 Jul 2024 19:35:02 -0400
X-MC-Unique: qxhzJhEWP-Wkz85eGRnjpA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 93CA31956089; Tue,  2 Jul 2024 23:35:00 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.10.132])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 08B753000221; Tue,  2 Jul 2024 23:34:57 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/panic: Fix uninitialized spinlock acquisition with
 CONFIG_DRM_PANIC=n
Date: Tue,  2 Jul 2024 19:34:50 -0400
Message-ID: <20240702233451.1238645-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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

It turns out that if you happen to have a kernel config where
CONFIG_DRM_PANIC is disabled and spinlock debugging is enabled, along with
KMS being enabled - we'll end up trying to acquire an uninitialized
spin_lock with drm_panic_lock() when we try to do a commit:

  rvkms rvkms.0: [drm:drm_atomic_commit] committing 0000000068d2ade1
  INFO: trying to register non-static key.
  The code is fine but needs lockdep annotation, or maybe
  you didn't initialize this object before use?
  turning off the locking correctness validator.
  CPU: 4 PID: 1347 Comm: modprobe Not tainted 6.10.0-rc1Lyude-Test+ #272
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS edk2-20240524-3.fc40 05/24/2024
  Call Trace:
   <TASK>
   dump_stack_lvl+0x77/0xa0
   assign_lock_key+0x114/0x120
   register_lock_class+0xa8/0x2c0
   __lock_acquire+0x7d/0x2bd0
   ? __vmap_pages_range_noflush+0x3a8/0x550
   ? drm_atomic_helper_swap_state+0x2ad/0x3a0
   lock_acquire+0xec/0x290
   ? drm_atomic_helper_swap_state+0x2ad/0x3a0
   ? lock_release+0xee/0x310
   _raw_spin_lock_irqsave+0x4e/0x70
   ? drm_atomic_helper_swap_state+0x2ad/0x3a0
   drm_atomic_helper_swap_state+0x2ad/0x3a0
   drm_atomic_helper_commit+0xb1/0x270
   drm_atomic_commit+0xaf/0xe0
   ? __pfx___drm_printfn_info+0x10/0x10
   drm_client_modeset_commit_atomic+0x1a1/0x250
   drm_client_modeset_commit_locked+0x4b/0x180
   drm_client_modeset_commit+0x27/0x50
   __drm_fb_helper_restore_fbdev_mode_unlocked+0x76/0x90
   drm_fb_helper_set_par+0x38/0x40
   fbcon_init+0x3c4/0x690
   visual_init+0xc0/0x120
   do_bind_con_driver+0x409/0x4c0
   do_take_over_console+0x233/0x280
   do_fb_registered+0x11f/0x210
   fbcon_fb_registered+0x2c/0x60
   register_framebuffer+0x248/0x2a0
   __drm_fb_helper_initial_config_and_unlock+0x58a/0x720
   drm_fbdev_generic_client_hotplug+0x6e/0xb0
   drm_client_register+0x76/0xc0
   _RNvXs_CsHeezP08sTT_5rvkmsNtB4_5RvkmsNtNtCs1cdwasc6FUb_6kernel8platform6Driver5probe+0xed2/0x1060 [rvkms]
   ? _RNvMs_NtCs1cdwasc6FUb_6kernel8platformINtB4_7AdapterNtCsHeezP08sTT_5rvkms5RvkmsE14probe_callbackBQ_+0x2b/0x70 [rvkms]
   ? acpi_dev_pm_attach+0x25/0x110
   ? platform_probe+0x6a/0xa0
   ? really_probe+0x10b/0x400
   ? __driver_probe_device+0x7c/0x140
   ? driver_probe_device+0x22/0x1b0
   ? __device_attach_driver+0x13a/0x1c0
   ? __pfx___device_attach_driver+0x10/0x10
   ? bus_for_each_drv+0x114/0x170
   ? __device_attach+0xd6/0x1b0
   ? bus_probe_device+0x9e/0x120
   ? device_add+0x288/0x4b0
   ? platform_device_add+0x75/0x230
   ? platform_device_register_full+0x141/0x180
   ? rust_helper_platform_device_register_simple+0x85/0xb0
   ? _RNvMs2_NtCs1cdwasc6FUb_6kernel8platformNtB5_6Device13create_simple+0x1d/0x60
   ? _RNvXs0_CsHeezP08sTT_5rvkmsNtB5_5RvkmsNtCs1cdwasc6FUb_6kernel6Module4init+0x11e/0x160 [rvkms]
   ? 0xffffffffc083f000
   ? init_module+0x20/0x1000 [rvkms]
   ? kernfs_xattr_get+0x3e/0x80
   ? do_one_initcall+0x148/0x3f0
   ? __lock_acquire+0x5ef/0x2bd0
   ? __lock_acquire+0x5ef/0x2bd0
   ? __lock_acquire+0x5ef/0x2bd0
   ? put_cpu_partial+0x51/0x1d0
   ? lock_acquire+0xec/0x290
   ? put_cpu_partial+0x51/0x1d0
   ? lock_release+0xee/0x310
   ? put_cpu_partial+0x51/0x1d0
   ? fs_reclaim_acquire+0x69/0xf0
   ? lock_acquire+0xec/0x290
   ? fs_reclaim_acquire+0x69/0xf0
   ? kfree+0x22f/0x340
   ? lock_release+0xee/0x310
   ? kmalloc_trace_noprof+0x48/0x340
   ? do_init_module+0x22/0x240
   ? kmalloc_trace_noprof+0x155/0x340
   ? do_init_module+0x60/0x240
   ? __se_sys_finit_module+0x2e0/0x3f0
   ? do_syscall_64+0xa4/0x180
   ? syscall_exit_to_user_mode+0x108/0x140
   ? do_syscall_64+0xb0/0x180
   ? vma_end_read+0xd0/0xe0
   ? do_user_addr_fault+0x309/0x640
   ? clear_bhb_loop+0x45/0xa0
   ? clear_bhb_loop+0x45/0xa0
   ? clear_bhb_loop+0x45/0xa0
   ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
   </TASK>

Fix this by stubbing these macros out when this config option isn't
enabled, along with fixing the unused variable warning that introduces.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 2 +-
 include/drm/drm_panic.h             | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index fb97b51b38f15..dd5caa8030aa3 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3017,7 +3017,7 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
 				  bool stall)
 {
 	int i, ret;
-	unsigned long flags;
+	unsigned long __maybe_unused flags;
 	struct drm_connector *connector;
 	struct drm_connector_state *old_conn_state, *new_conn_state;
 	struct drm_crtc *crtc;
diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
index 822dbb1aa9d6f..9cd4239f09286 100644
--- a/include/drm/drm_panic.h
+++ b/include/drm/drm_panic.h
@@ -52,6 +52,8 @@ struct drm_scanout_buffer {
 	unsigned int pitch[DRM_FORMAT_MAX_PLANES];
 };
 
+#ifdef CONFIG_DRM_PANIC
+
 /**
  * drm_panic_trylock - try to enter the panic printing critical section
  * @dev: struct drm_device
@@ -137,13 +139,15 @@ struct drm_scanout_buffer {
 #define drm_panic_unlock(dev, flags) \
 	raw_spin_unlock_irqrestore(&(dev)->mode_config.panic_lock, flags)
 
-#ifdef CONFIG_DRM_PANIC
-
 void drm_panic_register(struct drm_device *dev);
 void drm_panic_unregister(struct drm_device *dev);
 
 #else
 
+#define drm_panic_trylock(dev, flags) (true)
+#define drm_panic_lock(dev, flags)
+#define drm_panic_unlock(dev, flags)
+
 static inline void drm_panic_register(struct drm_device *dev) {}
 static inline void drm_panic_unregister(struct drm_device *dev) {}
 
-- 
2.45.2

