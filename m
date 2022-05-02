Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0518A51717E
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 16:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173BE10EBAA;
	Mon,  2 May 2022 14:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B847610EB66
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 14:25:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0DB3F21878;
 Mon,  2 May 2022 14:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651501529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kNEgVJyAXiUeJ1SSdQu3qjRW9AgTLMm5aqAXX4dowOM=;
 b=Lu2AHhWDWBoBQT368HT//SpdbAYI3FfR9J7yty8lYXx+zSpjPDtNKev/pCHqINwjjC/adX
 sf1azsVwyym6r4J7Hu9KCZUvPEsVvajtVCM6VRBx0K6KnxUe9fy7fxKXSgFm5CsA1oAv5y
 Fy8kZXdw2cDxWhXd4rkxk0ziAdniGnE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651501529;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kNEgVJyAXiUeJ1SSdQu3qjRW9AgTLMm5aqAXX4dowOM=;
 b=8BB+UG+LZJS1mCsyBT4VTyQuW/8vgZl7RNqnLcwrfuIk22dnGt9ZFBq0RYsc4XvgI60Cek
 OUE3cq+TGHHTD/DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DEC0213B0F;
 Mon,  2 May 2022 14:25:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EIemNdjpb2J4MgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 02 May 2022 14:25:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH 3/3] drm/mgag200: Protect concurrent access to I/O registers
 with lock
Date: Mon,  2 May 2022 16:25:14 +0200
Message-Id: <20220502142514.2174-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220502142514.2174-1-tzimmermann@suse.de>
References: <20220502142514.2174-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a mutex lock to protect concurrent access to I/O registers
against each other. This happens between invokataion of commit-
tail functions and get-mode operations. Both with use the CRTC
index registers MGA1064_GEN_IO_DATA and MGA1064_GEN_IO_CTL.
Concurrent access can lead to failed mode-setting operations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c  |  6 ++++++
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  1 +
 drivers/gpu/drm/mgag200/mgag200_mode.c | 14 ++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 217844d71ab5c..08839460606fe 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -14,6 +14,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_module.h>
 #include <drm/drm_pciids.h>
 
@@ -65,6 +66,11 @@ static int mgag200_regs_init(struct mga_device *mdev)
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	u32 option, option2;
 	u8 crtcext3;
+	int ret;
+
+	ret = drmm_mutex_init(dev, &mdev->rmmio_lock);
+	if (ret)
+		return ret;
 
 	switch (mdev->type) {
 	case G200_PCI:
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 4368112023f7c..18829eb8398a0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -213,6 +213,7 @@ struct mga_device {
 	struct drm_device		base;
 	unsigned long			flags;
 
+	struct mutex			rmmio_lock;
 	resource_size_t			rmmio_base;
 	resource_size_t			rmmio_size;
 	void __iomem			*rmmio;
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 6e18d3bbd7207..abde7655477db 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -881,6 +881,14 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 		.y2 = fb->height,
 	};
 
+	/*
+	 * Concurrent operations could possibly trigger a call to
+	 * drm_connector_helper_funcs.get_modes by trying to read the
+	 * display modes. Protect access to I/O registers by acquiring
+	 * the I/O-register lock.
+	 */
+	mutex_lock(&mdev->rmmio_lock);
+
 	if (mdev->type == G200_WB || mdev->type == G200_EW3)
 		mgag200_g200wb_hold_bmc(mdev);
 
@@ -904,6 +912,8 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	mgag200_enable_display(mdev);
 
 	mgag200_handle_damage(mdev, fb, &fullscreen, &shadow_plane_state->data[0]);
+
+	mutex_unlock(&mdev->rmmio_lock);
 }
 
 static void
@@ -963,8 +973,12 @@ mgag200_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (!fb)
 		return;
 
+	mutex_lock(&mdev->rmmio_lock);
+
 	if (drm_atomic_helper_damage_merged(old_state, state, &damage))
 		mgag200_handle_damage(mdev, fb, &damage, &shadow_plane_state->data[0]);
+
+	mutex_unlock(&mdev->rmmio_lock);
 }
 
 static struct drm_crtc_state *
-- 
2.36.0

