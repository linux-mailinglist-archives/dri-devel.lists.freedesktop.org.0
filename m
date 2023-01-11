Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C67E5665F46
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA03210E76A;
	Wed, 11 Jan 2023 15:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C97610E76A;
 Wed, 11 Jan 2023 15:38:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A35C24CAF;
 Wed, 11 Jan 2023 15:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673451495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MJGfGfVefGEL7N6HPphyFura7q7rrK2NkqnFwM9VBeo=;
 b=LhpN/9qn9POSyc89imFbxAtUalpsKfozhNxe0p1JpdvZCe5FEoqgMbA7+O9ZO+B/Xxhqp0
 f/hARGRjBltev99VHkv5I7jGxhhc5Bz0RjnkMNFtkC5BcSJ1fpNxmPEyDk0Qp7ybTghVPD
 Y6W5jEI/RLlsPZzjwVmvqLfYXw8heAE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673451495;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MJGfGfVefGEL7N6HPphyFura7q7rrK2NkqnFwM9VBeo=;
 b=mKGqH5Y+ekjOQSQn0+DiQQP5LUBYNqrDQHUDGFmfNq9g5kRvCRu0/KGMTwdY7ByOM5/ENr
 7nVi78j9IHhQLMCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6C53B1358A;
 Wed, 11 Jan 2023 15:38:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1YtsGefXvmOOOAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Jan 2023 15:38:15 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, evan.quan@amd.com
Subject: [PATCH] drm/fb-helper: Set framebuffer for vga-switcheroo clients
Date: Wed, 11 Jan 2023 16:38:13 +0100
Message-Id: <20230111153813.16051-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the framebuffer info for drivers that support VGA switcheroo. Only
affects the amdgpu driver, which uses VGA switcheroo and generic fbdev
emulation. For other drivers, this does nothing.

Amdgpu's lastclose helper called vga_switcheroo_process_delayed_switch().
But as amdgpu uses generic fbdev emulation, it's better to call the helper
from drm_lastclose(), after the kernel client's screen has been restored.
So all drivers and clients can benefit. Radeon and nouveau with modernized
fbdev code are possible candidates.

There was an earlier patchset to do something similar. [1]

Suggested-by: Alexander Deucher <Alexander.Deucher@amd.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/amd-gfx/20221020143603.563929-1-alexander.deucher@amd.com/ # 1
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 12 ------------
 drivers/gpu/drm/drm_fb_helper.c         |  8 ++++++++
 drivers/gpu/drm/drm_file.c              |  3 +++
 5 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 63c921c55fb9..7120b9b6e580 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1330,7 +1330,6 @@ extern const int amdgpu_max_kms_ioctl;
 
 int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags);
 void amdgpu_driver_unload_kms(struct drm_device *dev);
-void amdgpu_driver_lastclose_kms(struct drm_device *dev);
 int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
 void amdgpu_driver_postclose_kms(struct drm_device *dev,
 				 struct drm_file *file_priv);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index ebc6e6cbe2ab..02d636f781a2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2784,7 +2784,6 @@ static const struct drm_driver amdgpu_kms_driver = {
 	    DRIVER_SYNCOBJ_TIMELINE,
 	.open = amdgpu_driver_open_kms,
 	.postclose = amdgpu_driver_postclose_kms,
-	.lastclose = amdgpu_driver_lastclose_kms,
 	.ioctls = amdgpu_ioctls_kms,
 	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
 	.dumb_create = amdgpu_mode_dumb_create,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 7aa7e52ca784..886739576d3d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1104,18 +1104,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 /*
  * Outdated mess for old drm with Xorg being in charge (void function now).
  */
-/**
- * amdgpu_driver_lastclose_kms - drm callback for last close
- *
- * @dev: drm dev pointer
- *
- * Switch vga_switcheroo state after last close (all asics).
- */
-void amdgpu_driver_lastclose_kms(struct drm_device *dev)
-{
-	drm_fb_helper_lastclose(dev);
-	vga_switcheroo_process_delayed_switch();
-}
 
 /**
  * amdgpu_driver_open_kms - drm callback for open
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 427631706128..5e445c61252d 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -30,7 +30,9 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/console.h>
+#include <linux/pci.h>
 #include <linux/sysrq.h>
+#include <linux/vga_switcheroo.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_drv.h>
@@ -1940,6 +1942,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
 					 int preferred_bpp)
 {
 	struct drm_client_dev *client = &fb_helper->client;
+	struct drm_device *dev = fb_helper->dev;
 	struct drm_fb_helper_surface_size sizes;
 	int ret;
 
@@ -1961,6 +1964,11 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
 		return ret;
 
 	strcpy(fb_helper->fb->comm, "[fbcon]");
+
+	/* Set the fb info for vgaswitcheroo clients. Does nothing otherwise. */
+	if (dev_is_pci(dev->dev))
+		vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), fb_helper->info);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index a51ff8cee049..314c309db9a3 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -38,6 +38,7 @@
 #include <linux/pci.h>
 #include <linux/poll.h>
 #include <linux/slab.h>
+#include <linux/vga_switcheroo.h>
 
 #include <drm/drm_client.h>
 #include <drm/drm_drv.h>
@@ -460,6 +461,8 @@ void drm_lastclose(struct drm_device * dev)
 		drm_legacy_dev_reinit(dev);
 
 	drm_client_dev_restore(dev);
+
+	vga_switcheroo_process_delayed_switch();
 }
 
 /**
-- 
2.39.0

