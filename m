Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABCF3B6D10
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 05:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4A56E5C6;
	Tue, 29 Jun 2021 03:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F3A6E5C6;
 Tue, 29 Jun 2021 03:38:00 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id i6so16068976pfq.1;
 Mon, 28 Jun 2021 20:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VkOFQf/536RNFMu+xaArckMzz68g/ujSW9t2Sns7i4U=;
 b=JBmBwYA7IT4xcNcqZ9oTxNv+fduy88l+lRYwHyOxAT4d74hZiHK2BqgFd8CRqzVKWB
 QqH/TArCcsaSc2CM3xquE3JQcDTzNsqJ/wPCtDhzJOeilygI9OWtGJkWX8HyEz0z46Cm
 EbqGpLPFrw0wICXehaI2HGKBXEfRARjdLK763N4wtu8JTZKvdfYgeu9fv9aafp43/C9b
 xYq2U8pRKQC9+mEt2mpiuDm7muP9zXvZyBZsP/V65CRGuTis5rxUtcNzI0nNSO45/3Fn
 UTrt6aLZw4qjfklyG7LB9ZxUNGfanmy8IyG05hdvWk10oFOdA9zUFtIDfptk/VRddVRY
 3Mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VkOFQf/536RNFMu+xaArckMzz68g/ujSW9t2Sns7i4U=;
 b=BBtDdHJFTPLvtvh80n1y5ji4HZTaiSJyUDYZsxOVzcp2eDSCYgUMhi1U+W7bAu6xee
 CaftMgTkAMndUJ8uDY0GSUVuUAmTgiF+6bGlV9fTPT8o03tu8bQliPVEfZEfgeFiuuy/
 UNq5L0kd8AoCBMK6UzHzfJLuNkKSyjWm+Vn3G4I3WW273j7+xgF47QxLpNLyDfMoQsO8
 IMUs4OunwrR+mbgrGTQCl4F+NQm2QCC00N+9ya5eiWQaWbz6zbbTnjh5E5QVGOxzHg+6
 j7+WnSJWbfJd8R9/btKGHZBfFB3THq+4+xLHmKzxE4Mx8S3kETls+rgBQ48bELkfncZh
 SvsA==
X-Gm-Message-State: AOAM532FQ+DXvuLCfqClWYkPh6m4KdtjFgOGbstc3Q0cTj+EmdLrFA8o
 ki7zAYf87cMbFAMG+QyRFdQ=
X-Google-Smtp-Source: ABdhPJyFDojKWVkhV0CV0B2CVgV3KJ4T9IPd2rw0iLhik1NNTjHtlY4m556JI3QqbHPac0YSuAv1xQ==
X-Received: by 2002:a63:d909:: with SMTP id r9mr26737857pgg.285.1624937880177; 
 Mon, 28 Jun 2021 20:38:00 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id d129sm14769076pfd.218.2021.06.28.20.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 20:37:59 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v5 1/3] drm: avoid circular locks in drm_mode_getconnector
Date: Tue, 29 Jun 2021 11:37:04 +0800
Message-Id: <20210629033706.20537-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629033706.20537-1-desmondcheongzx@gmail.com>
References: <20210629033706.20537-1-desmondcheongzx@gmail.com>
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

