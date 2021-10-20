Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BF0434BF0
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 15:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8CA892E4;
	Wed, 20 Oct 2021 13:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DC6893A7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 13:19:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CBABF218D5;
 Wed, 20 Oct 2021 13:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634735982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uUhlnrtP8COpTEv6xu/kJJcfGWbIJrfzNGQ+EUOaE0c=;
 b=fsN0t9Thnir4ZXft6Nu73x1MTD/IfuwRGss4iQtUmuWaNiyEpUoMwG/u9og2NP0Hopx+PC
 8OEB4YHpyOFFmgL5JEMci9KSTWeidevKfuKE5FYohTS5XlRt6m/5DpMcp1Tat+Uncnt8h6
 1D6F97vRSukOazE5tCUTbjQIarSYloY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634735982;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uUhlnrtP8COpTEv6xu/kJJcfGWbIJrfzNGQ+EUOaE0c=;
 b=cCsJObOC1UqbVbefTp5qSXx29pT8dorNfdjlT3TIvsj3uGRwQ9Xuxb7zlc9b30UBiwjJsR
 tP/AZaeLUga01FAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A586E140A6;
 Wed, 20 Oct 2021 13:19:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SHJ4J24XcGHsdwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Oct 2021 13:19:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/3] drm: Build drm_irq.o only if CONFIG_DRM_LEGACY has been
 set
Date: Wed, 20 Oct 2021 15:19:39 +0200
Message-Id: <20211020131941.15367-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020131941.15367-1-tzimmermann@suse.de>
References: <20211020131941.15367-1-tzimmermann@suse.de>
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

All code in drm_irq.o is for legacy UMs drivers. Only build and link
the file if CONFIG_DRM_LEGACY has been enabled.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Makefile  | 6 +++---
 drivers/gpu/drm/drm_irq.c | 2 --
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 12997ca5670d..6f07609fa453 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -4,7 +4,7 @@
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
 drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
-		drm_file.o drm_gem.o drm_ioctl.o drm_irq.o \
+		drm_file.o drm_gem.o drm_ioctl.o \
 		drm_drv.o \
 		drm_sysfs.o drm_hashtab.o drm_mm.o \
 		drm_crtc.o drm_fourcc.o drm_modes.o drm_edid.o drm_displayid.o \
@@ -21,8 +21,8 @@ drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
 		drm_managed.o drm_vblank_work.o
 
 drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
-			    drm_legacy_misc.o drm_lock.o drm_memory.o drm_scatter.o \
-			    drm_vm.o
+			    drm_irq.o drm_legacy_misc.o drm_lock.o drm_memory.o \
+			    drm_scatter.o drm_vm.o
 drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
 drm-$(CONFIG_DRM_GEM_CMA_HELPER) += drm_gem_cma_helper.o
diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
index 13e1d5c4ec82..d327638e15ee 100644
--- a/drivers/gpu/drm/drm_irq.c
+++ b/drivers/gpu/drm/drm_irq.c
@@ -66,7 +66,6 @@
 
 #include "drm_internal.h"
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
 static int drm_legacy_irq_install(struct drm_device *dev, int irq)
 {
 	int ret;
@@ -203,4 +202,3 @@ int drm_legacy_irq_control(struct drm_device *dev, void *data,
 		return -EINVAL;
 	}
 }
-#endif
-- 
2.33.0

