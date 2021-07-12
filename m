Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9653C4321
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 06:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350A089BC0;
	Mon, 12 Jul 2021 04:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B49189BC0;
 Mon, 12 Jul 2021 04:35:56 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id 17so15241619pfz.4;
 Sun, 11 Jul 2021 21:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vc5xi5ftWnxZlU1gt0+b48wT38LyZFngC4JD9PKuX7I=;
 b=Cb3M3vkk3FuoDtvFBvEh8156faQwTUThdp+n0uUYWQBYv3ouu9t5ZNGd5SwrKX67Kt
 vl0hi9W3WmsJuZDYRTmIOr+4DeklTVF04l28vjLZf5qufrBH0FT1YD5Pslug4BG3Wtoe
 8AkwcOysJKQ6LzJP7JdbshGQu2qBgqICEslwnsXZ8jA0qGT1eqQko7RbSSIeNPZ0Wg4k
 HH6HAbsBVycseDYivQSwfVgRRi5N2iUJFGEcs38O1flBvrS0sNwNE4s7mek9uJCX67nY
 vZlOk9uRf2EmQ82ji96k3z3Z44BH3NKnBA78PtKalqTnCAMqh7uHRPCe7v3VojaTKZGx
 PGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vc5xi5ftWnxZlU1gt0+b48wT38LyZFngC4JD9PKuX7I=;
 b=TlGyg+PJAQrqDNbIwYkwQybzadtDXFeZ18FrHjlSBx/jiU845iXyy6fqcsue1KYx/t
 r5CX+sxqxRZqeS1gf9Kum+RTh7NKHltOU98EfOFblqhw3OBq3frp3CWWAVTlAWoH7dWs
 X6QVW8VDyIit6ojU0k/5+c2fZv8a/vIaayfrJLhVYBodUnyhrAuygb3X2Lk1+3G9/WUz
 ybVPojCmOvj91oKD6Sb+6A45E27NTzVnt11/2ah5Tv3oWtco6V71LvylWa+6KE0+w7xD
 PKuqWOUfmYrjBujxDpdXEzkphEp2QbGMskBpQdU8+n6EIELUzkX3Zw2HoLMoUsqkVgxG
 Xu6w==
X-Gm-Message-State: AOAM5309lXGXwxPUzvcHu7UHClMCDzBPn3hWnkzQlR7Cq+F71Uwek2Le
 Z03YzDYfI5KAgG0OxCr8z/0=
X-Google-Smtp-Source: ABdhPJxCujRkDQjCW3B0eNy7eTGjw4nq7M1Kn3DT88JRrgd3WhjryI26Pk/IICRmxm9iWx/UrR5ZbA==
X-Received: by 2002:a63:f241:: with SMTP id d1mr2270900pgk.424.1626064556049; 
 Sun, 11 Jul 2021 21:35:56 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id n3sm14242764pfn.216.2021.07.11.21.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 21:35:55 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v8 1/5] drm: avoid circular locks in drm_mode_getconnector
Date: Mon, 12 Jul 2021 12:35:04 +0800
Message-Id: <20210712043508.11584-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712043508.11584-1-desmondcheongzx@gmail.com>
References: <20210712043508.11584-1-desmondcheongzx@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, gregkh@linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, emil.l.velikov@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for a future patch to take a lock on
drm_device.master_mutex inside drm_is_current_master(), we first move
the call to drm_is_current_master() in drm_mode_getconnector out from the
section locked by &dev->mode_config.mutex. This avoids creating a
circular lock dependency.

Failing to avoid this lock dependency produces the following lockdep
splat:

======================================================
WARNING: possible circular locking dependency detected
5.13.0-rc7-CI-CI_DRM_10254+ #1 Not tainted
------------------------------------------------------
kms_frontbuffer/1087 is trying to acquire lock:
ffff88810dcd01a8 (&dev->master_mutex){+.+.}-{3:3}, at: drm_is_current_master+0x1b/0x40
but task is already holding lock:
ffff88810dcd0488 (&dev->mode_config.mutex){+.+.}-{3:3}, at: drm_mode_getconnector+0x1c6/0x4a0
which lock already depends on the new lock.
the existing dependency chain (in reverse order) is:
-> #2 (&dev->mode_config.mutex){+.+.}-{3:3}:
       __mutex_lock+0xab/0x970
       drm_client_modeset_probe+0x22e/0xca0
       __drm_fb_helper_initial_config_and_unlock+0x42/0x540
       intel_fbdev_initial_config+0xf/0x20 [i915]
       async_run_entry_fn+0x28/0x130
       process_one_work+0x26d/0x5c0
       worker_thread+0x37/0x380
       kthread+0x144/0x170
       ret_from_fork+0x1f/0x30
-> #1 (&client->modeset_mutex){+.+.}-{3:3}:
       __mutex_lock+0xab/0x970
       drm_client_modeset_commit_locked+0x1c/0x180
       drm_client_modeset_commit+0x1c/0x40
       __drm_fb_helper_restore_fbdev_mode_unlocked+0x88/0xb0
       drm_fb_helper_set_par+0x34/0x40
       intel_fbdev_set_par+0x11/0x40 [i915]
       fbcon_init+0x270/0x4f0
       visual_init+0xc6/0x130
       do_bind_con_driver+0x1e5/0x2d0
       do_take_over_console+0x10e/0x180
       do_fbcon_takeover+0x53/0xb0
       register_framebuffer+0x22d/0x310
       __drm_fb_helper_initial_config_and_unlock+0x36c/0x540
       intel_fbdev_initial_config+0xf/0x20 [i915]
       async_run_entry_fn+0x28/0x130
       process_one_work+0x26d/0x5c0
       worker_thread+0x37/0x380
       kthread+0x144/0x170
       ret_from_fork+0x1f/0x30
-> #0 (&dev->master_mutex){+.+.}-{3:3}:
       __lock_acquire+0x151e/0x2590
       lock_acquire+0xd1/0x3d0
       __mutex_lock+0xab/0x970
       drm_is_current_master+0x1b/0x40
       drm_mode_getconnector+0x37e/0x4a0
       drm_ioctl_kernel+0xa8/0xf0
       drm_ioctl+0x1e8/0x390
       __x64_sys_ioctl+0x6a/0xa0
       do_syscall_64+0x39/0xb0
       entry_SYSCALL_64_after_hwframe+0x44/0xae
other info that might help us debug this:
Chain exists of: &dev->master_mutex --> &client->modeset_mutex --> &dev->mode_config.mutex
 Possible unsafe locking scenario:
       CPU0                    CPU1
       ----                    ----
  lock(&dev->mode_config.mutex);
                               lock(&client->modeset_mutex);
                               lock(&dev->mode_config.mutex);
  lock(&dev->master_mutex);
*** DEADLOCK ***
1 lock held by kms_frontbuffer/1087:
 #0: ffff88810dcd0488 (&dev->mode_config.mutex){+.+.}-{3:3}, at: drm_mode_getconnector+0x1c6/0x4a0
stack backtrace:
CPU: 7 PID: 1087 Comm: kms_frontbuffer Not tainted 5.13.0-rc7-CI-CI_DRM_10254+ #1
Hardware name: Intel Corporation Ice Lake Client Platform/IceLake U DDR4 SODIMM PD RVP TLC, BIOS ICLSFWR1.R00.3234.A01.1906141750 06/14/2019
Call Trace:
 dump_stack+0x7f/0xad
 check_noncircular+0x12e/0x150
 __lock_acquire+0x151e/0x2590
 lock_acquire+0xd1/0x3d0
 __mutex_lock+0xab/0x970
 drm_is_current_master+0x1b/0x40
 drm_mode_getconnector+0x37e/0x4a0
 drm_ioctl_kernel+0xa8/0xf0
 drm_ioctl+0x1e8/0x390
 __x64_sys_ioctl+0x6a/0xa0
 do_syscall_64+0x39/0xb0
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index da39e7ff6965..2ba257b1ae20 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2414,6 +2414,7 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
 	struct drm_mode_modeinfo u_mode;
 	struct drm_mode_modeinfo __user *mode_ptr;
 	uint32_t __user *encoder_ptr;
+	bool is_current_master;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
@@ -2444,9 +2445,11 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
 	out_resp->connector_type = connector->connector_type;
 	out_resp->connector_type_id = connector->connector_type_id;
 
+	is_current_master = drm_is_current_master(file_priv);
+
 	mutex_lock(&dev->mode_config.mutex);
 	if (out_resp->count_modes == 0) {
-		if (drm_is_current_master(file_priv))
+		if (is_current_master)
 			connector->funcs->fill_modes(connector,
 						     dev->mode_config.max_width,
 						     dev->mode_config.max_height);
-- 
2.25.1

