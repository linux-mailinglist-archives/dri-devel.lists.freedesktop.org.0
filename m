Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6957543B8B8
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 19:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C280D89DED;
	Tue, 26 Oct 2021 17:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33ADF89DED
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 17:57:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 82E45218B1;
 Tue, 26 Oct 2021 17:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635271023; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pufgyQ21EPCQaZNiC0I1LZVy2XyH6k678EUnM3VCmDk=;
 b=BHUndMm2GCAXSMuggaFA8iiRFecv9Wiu4Kv96rpKw7pGx2uA8m3fMcCYgP1aWl73dezvLD
 mIaifb5eYSINXnLGr8T2prCu+qiZF/PMdip0jFUrdU9BptsAtGz5BwvUZOU7ENEX+JFS9I
 eMFwDnrppF1DCGAoQ+rDue2/DvUihCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635271023;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pufgyQ21EPCQaZNiC0I1LZVy2XyH6k678EUnM3VCmDk=;
 b=VZsI+XTyKJt5ZAYCqE6xJ/jRLtfq/gi73V3zi7i/LhgM3uw6pO8db0iWvR2tGkVtWxWt86
 gZwEQkjUmb0POJAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5091913EE9;
 Tue, 26 Oct 2021 17:57:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id meelEm9BeGGpbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Oct 2021 17:57:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mripard@kernel.org, maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, naresh.kamboju@linaro.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] drm: Link CMA framebuffer helpers into KMS helper library
Date: Tue, 26 Oct 2021 19:57:00 +0200
Message-Id: <20211026175700.27664-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Linking the CMA frambuffer helpers into a CMA helper library in
commit 4b2b5e142ff4 ("drm: Move GEM memory managers into modules")
results in linker errors:

  arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.o: \
	  in function `drm_fb_cma_get_gem_obj': \
	  drivers/gpu/drm/drm_fb_cma_helper.c:46: undefined reference \
	  to `drm_gem_fb_get_obj'
  arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.c:46: \
	  undefined reference to `drm_gem_fb_get_obj'
  arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.c:46: \
	  undefined reference to `drm_gem_fb_get_obj'
  arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.o: in \
	  function `drm_fb_cma_sync_non_coherent': \
	  drivers/gpu/drm/drm_fb_cma_helper.c:133: undefined reference \
	  to `drm_atomic_helper_damage_iter_init'
  arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.c:135: \
	  undefined reference to `drm_atomic_helper_damage_iter_next'

Link the CMA framebuffer helpers into the KMS helper library to
fix the problem.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 4b2b5e142ff4 ("drm: Move GEM memory managers into modules")
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 7f6eb11b6aac..1c41156deb5f 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -34,7 +34,6 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o drm_privacy_screen_x86.
 obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
 
 drm_cma_helper-y := drm_gem_cma_helper.o
-drm_cma_helper-$(CONFIG_DRM_KMS_CMA_HELPER) += drm_fb_cma_helper.o
 obj-$(CONFIG_DRM_GEM_CMA_HELPER) += drm_cma_helper.o
 
 drm_shmem_helper-y := drm_gem_shmem_helper.o
@@ -59,6 +58,7 @@ drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o drm_dp_helper.o \
 
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
+drm_kms_helper-$(CONFIG_DRM_KMS_CMA_HELPER) += drm_fb_cma_helper.o
 drm_kms_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
 drm_kms_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
 
-- 
2.33.1

