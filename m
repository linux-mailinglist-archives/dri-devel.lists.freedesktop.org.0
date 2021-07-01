Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BE03B94E9
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 18:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BED76EB5B;
	Thu,  1 Jul 2021 16:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8A16EB5A;
 Thu,  1 Jul 2021 16:54:33 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so4308892pjo.3; 
 Thu, 01 Jul 2021 09:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vc5xi5ftWnxZlU1gt0+b48wT38LyZFngC4JD9PKuX7I=;
 b=XSI+quGbHhOHhJUhLMEFgKiAjU7ZWtY5gdFSDEnU2n0Qm6PybNqbvktJWF0XqrYyBR
 fM3tU5ZfsQ8kuOEzLk6+UmIMshjj09iaE8M0s63LbaZErj7JMvkJH4zexMx5xkaN3rYd
 ZWxy2XpsyReXtzXcCRHhHY/LTIwnZwg1CE72V38FclywmZypjluIMusOL8pHFMpJaXqR
 3lQcW0djA/y9x+i09J0pmBpDRQN3Z1jRH9ZItgID5cYsC7be1v3G4A2V4Y90hu39zZtO
 oAGamFkmxYcDsaUhcOT0007e0zylAmp6u+AHvNLRyIIJ+l+vItCXcRfCzAM6Yq7pZ2lJ
 VE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vc5xi5ftWnxZlU1gt0+b48wT38LyZFngC4JD9PKuX7I=;
 b=NiDPv1H+ToLvGmMAKhxQC9fyoUax41OIis8Uayx3yR9TAw+goFRJ7IzDmPtCk0oO82
 yHePFtFzCgfoQLX3Mq0LfRs5UL3rFzXRCYT3Rz8+5+GYOp6EvN4bSVTTFG3WYEMT20eO
 uZcqRpN8gS80ubSzuqEyP3tyaTocfZV8JIS5rLe4QNxgxUGbIjVl6iWnejA8mKSsbkFK
 vP+kpTSqUpHHN549jRB5JAShLGhF1E+03aKT8WsioBdeZIvFG47GE38zlkssO8a2s5r5
 YrJnNZK/4zailk+Ri5icq0Su/JtsKPgJUW7Txu070OgfCCRQY7UNE4e7R8WhcQTAprhD
 BTKQ==
X-Gm-Message-State: AOAM532S2qlQzqVhfpliNUU0YzYraAJg0gx3C74F67pUomGgEqZEJ7bJ
 JZpwUyvwUTF5avITryNIe2M=
X-Google-Smtp-Source: ABdhPJx0FRVHE0P9JY9PweVc7BKHZ6+iKxtn2+/VNCZJWOoD8ujSXIe+Xd4vpsLeQuU2hYVCbwcauw==
X-Received: by 2002:a17:90a:f684:: with SMTP id
 cl4mr594900pjb.197.1625158473088; 
 Thu, 01 Jul 2021 09:54:33 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id s20sm398738pgv.1.2021.07.01.09.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 09:54:32 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v7 1/5] drm: avoid circular locks in drm_mode_getconnector
Date: Fri,  2 Jul 2021 00:53:54 +0800
Message-Id: <20210701165358.19053-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701165358.19053-1-desmondcheongzx@gmail.com>
References: <20210701165358.19053-1-desmondcheongzx@gmail.com>
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

