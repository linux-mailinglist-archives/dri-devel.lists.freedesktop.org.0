Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D630E6CFCC3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8E810E12D;
	Thu, 30 Mar 2023 07:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F04710ED04
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:30:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C4CBB1FE8E;
 Thu, 30 Mar 2023 07:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680161449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EC8LFlENQsENM98He9moGigsZsCj9l+tIsoEPsYo9ak=;
 b=i7EgCDnq+q58LTm7P1urOqy9gt62nWBvDcIO++G5fxYH1YpXeHGF9u2cqABBzWTsHVjKEv
 ky2WIv8mbQH/ACB2CBxxdrLy/8of49y4dodRYbRiuA4eo32AhkJZBwH+AJvqAUPBTcUxv5
 TLYdoBXBYhIRPBl6zaO0iQcZHh9NEcI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680161449;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EC8LFlENQsENM98He9moGigsZsCj9l+tIsoEPsYo9ak=;
 b=gq1oKbZGM9CeZRn4ntFHSbH66YQJEg7EI9lrvtHloe9gwh7y8MdIXPbSh1ZeCVqR2Vc9Mo
 zxWwY1aOQmc65qDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A08321348E;
 Thu, 30 Mar 2023 07:30:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YLQfJqk6JWRNeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:30:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: linux@armlinux.org.uk, javierm@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 2/4] drm/armada: Hide fbdev support behind config option
Date: Thu, 30 Mar 2023 09:30:44 +0200
Message-Id: <20230330073046.7150-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330073046.7150-1-tzimmermann@suse.de>
References: <20230330073046.7150-1-tzimmermann@suse.de>
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

Only build armada's fbdev emulation if CONFIG_DRM_FBDEV_EMULATION
has been enabled. No functional changes, but allows to build armada
without fbdev.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/armada/Makefile     |  3 ++-
 drivers/gpu/drm/armada/armada_drm.h | 14 ++++++++++++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/armada/Makefile b/drivers/gpu/drm/armada/Makefile
index 9bc3c3213724..dc75a7db9ed3 100644
--- a/drivers/gpu/drm/armada/Makefile
+++ b/drivers/gpu/drm/armada/Makefile
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
-armada-y	:= armada_crtc.o armada_drv.o armada_fb.o armada_fbdev.o \
+armada-y	:= armada_crtc.o armada_drv.o armada_fb.o \
 		   armada_gem.o armada_overlay.o armada_plane.o armada_trace.o
 armada-y	+= armada_510.o
 armada-$(CONFIG_DEBUG_FS) += armada_debugfs.o
+armada-$(CONFIG_DRM_FBDEV_EMULATION) += armada_fbdev.o
 
 obj-$(CONFIG_DRM_ARMADA) := armada.o
diff --git a/drivers/gpu/drm/armada/armada_drm.h b/drivers/gpu/drm/armada/armada_drm.h
index 6a5a87932576..1475146b1c47 100644
--- a/drivers/gpu/drm/armada/armada_drm.h
+++ b/drivers/gpu/drm/armada/armada_drm.h
@@ -75,8 +75,18 @@ struct armada_private {
 
 #define drm_to_armada_dev(dev) container_of(dev, struct armada_private, drm)
 
-int armada_fbdev_init(struct drm_device *);
-void armada_fbdev_fini(struct drm_device *);
+#if defined(CONFIG_DRM_FBDEV_EMULATION)
+int armada_fbdev_init(struct drm_device *dev);
+void armada_fbdev_fini(struct drm_device *dev);
+#else
+static inline int armada_fbdev_init(struct drm_device *dev)
+{
+	return 0;
+}
+
+static inline void armada_fbdev_fini(struct drm_device *dev)
+{ }
+#endif
 
 int armada_overlay_plane_create(struct drm_device *, unsigned long);
 
-- 
2.40.0

