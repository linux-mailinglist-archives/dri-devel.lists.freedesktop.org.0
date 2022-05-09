Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E51DD51FA0E
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 12:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BAF10E961;
	Mon,  9 May 2022 10:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E5810E92C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 10:36:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6AC461FA0C;
 Mon,  9 May 2022 10:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652092559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UIXydrWXIwg4HrDHl6qdqWNPOkZa9qKs3HMVDOFmypE=;
 b=CBnxzSkz/TEDpGNpXJFgR70+m6ZE8aYcjSUI4SpqzShn7aK6sqMqAarpNuEbz5wGQVBX75
 V7jbSMRoWtwsZTHBSiqDJCSEDOFS0akSL6v2QNkmYfueanN+MYjO2rg2v5dDiHcCSFPs2Z
 cWLmO+qo97DPngvkAitacEdCSeMKBdc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652092559;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UIXydrWXIwg4HrDHl6qdqWNPOkZa9qKs3HMVDOFmypE=;
 b=fRJ1W2xV/xs+Vw2HPd75Znn/Psr4C6nwDcq8h8d0NKzVNdzbwHlLKxWm9djqfBLkyl4zQ1
 6HBTmxUC3+JNeUCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 42160132C0;
 Mon,  9 May 2022 10:35:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0NY/D4/ueGJ9AgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 May 2022 10:35:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH 6/7] drm/mgag200: Test memory requirements in
 drm_mode_config_funcs.mode_valid
Date: Mon,  9 May 2022 12:35:53 +0200
Message-Id: <20220509103554.11996-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220509103554.11996-1-tzimmermann@suse.de>
References: <20220509103554.11996-1-tzimmermann@suse.de>
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

Test for a mode's memory requirements in the device-wide mode_valid
helper. For simplicify, always assume a 32-bit color format. While
some rejected modes would work with less colors, implementing this
is probably not worth the effort.

Also remove the memory-related test from the connector's mode_valid
helper. The test uses the bpp value that users can specify on the
kernel's command line. This value is unrelated and the test would
belong into atomic_check.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 35 +++++++++++++++-----------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index eb4d585709a4..92d3ae9489f0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -772,18 +772,6 @@ static enum drm_mode_status mga_vga_mode_valid(struct drm_connector *connector,
 		return MODE_BAD;
 	}
 
-	/* Validate the mode input by the user */
-	if (connector->cmdline_mode.specified) {
-		if (connector->cmdline_mode.bpp_specified)
-			bpp = connector->cmdline_mode.bpp;
-	}
-
-	if ((mode->hdisplay * mode->vdisplay * (bpp/8)) > mdev->vram_fb_available) {
-		if (connector->cmdline_mode.specified)
-			connector->cmdline_mode.specified = false;
-		return MODE_BAD;
-	}
-
 	return MODE_OK;
 }
 
@@ -1021,9 +1009,28 @@ static const uint64_t mgag200_simple_display_pipe_fmtmods[] = {
  * Mode config
  */
 
+static enum drm_mode_status mgag200_mode_config_mode_valid(struct drm_device *dev,
+							   const struct drm_display_mode *mode)
+{
+	static const unsigned int max_bpp = 4; // DRM_FORMAT_XRGB8888
+	struct mga_device *mdev = to_mga_device(dev);
+	unsigned long fbsize, fbpages, max_fbpages;
+
+	max_fbpages = mdev->vram_fb_available >> PAGE_SHIFT;
+
+	fbsize = mode->hdisplay * mode->vdisplay * max_bpp;
+	fbpages = DIV_ROUND_UP(fbsize, PAGE_SIZE);
+
+	if (fbpages > max_fbpages)
+		return MODE_MEM;
+
+	return MODE_OK;
+}
+
 static const struct drm_mode_config_funcs mgag200_mode_config_funcs = {
-	.fb_create     = drm_gem_fb_create_with_dirty,
-	.atomic_check  = drm_atomic_helper_check,
+	.fb_create = drm_gem_fb_create_with_dirty,
+	.mode_valid = mgag200_mode_config_mode_valid,
+	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-- 
2.36.0

