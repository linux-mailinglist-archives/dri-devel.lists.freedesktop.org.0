Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD00716692
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 17:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F4210E3BB;
	Tue, 30 May 2023 15:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92B710E39E;
 Tue, 30 May 2023 15:12:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 84ED61FDD8;
 Tue, 30 May 2023 15:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685459551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X8flHs6R1pqdHnrlJdCmQ7jgjsdECjBLMt7eN2cM4Lc=;
 b=RCGnwTD0MWYJzFJHrD49YmCiZIdjUpqwdRZB9Q1DLVc+lS3rI8Jr2YEurofDBbDqdilp0O
 GovmoRZKaerpLcTHUThNv+Qq0jsgHR/OeZhT/XIZ5uq/OxQO/3XGB2QEsbCFQ5uFiXyDun
 NqG0tFUAbFgsl3r4lboSlXocGxd3yCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685459551;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X8flHs6R1pqdHnrlJdCmQ7jgjsdECjBLMt7eN2cM4Lc=;
 b=LePoQn93ixnJfWEcfkGemlV+7GzNjYpkaWpoHOeTyOIbAc9ItXu35Y/Aik5yi2XoxREuhF
 3Qqf4MTjK+7fucAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 30A2513A21;
 Tue, 30 May 2023 15:12:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AFAEC18SdmRjAQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 30 May 2023 15:12:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com, sam@ravnborg.org,
 suijingfeng@loongson.cn
Subject: [PATCH v5 03/13] drm/armada: Use regular fbdev I/O helpers
Date: Tue, 30 May 2023 17:12:18 +0200
Message-Id: <20230530151228.22979-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530151228.22979-1-tzimmermann@suse.de>
References: <20230530151228.22979-1-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the regular fbdev helpers for framebuffer I/O instead of DRM's
helpers. Armada does not use damage handling, so DRM's fbdev helpers
are mere wrappers around the fbdev code.

By using fbdev helpers directly within each DRM fbdev emulation,
we can eventually remove DRM's wrapper functions entirely.

v4:
	* use initializer macros for struct fb_ops
v2:
	* use FB_IO_HELPERS option

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Russell King <linux@armlinux.org.uk>
---
 drivers/gpu/drm/armada/Kconfig        | 1 +
 drivers/gpu/drm/armada/armada_fbdev.c | 7 ++-----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/armada/Kconfig b/drivers/gpu/drm/armada/Kconfig
index f5c66d89ba99..5afade25e217 100644
--- a/drivers/gpu/drm/armada/Kconfig
+++ b/drivers/gpu/drm/armada/Kconfig
@@ -3,6 +3,7 @@ config DRM_ARMADA
 	tristate "DRM support for Marvell Armada SoCs"
 	depends on DRM && HAVE_CLK && ARM && MMU
 	select DRM_KMS_HELPER
+	select FB_IO_HELPERS if DRM_FBDEV_EMULATION
 	help
 	  Support the "LCD" controllers found on the Marvell Armada 510
 	  devices.  There are two controllers on the device, each controller
diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index 0a5fd1aa86eb..3943e89cc06c 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/errno.h>
+#include <linux/fb.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
@@ -33,12 +34,8 @@ static void armada_fbdev_fb_destroy(struct fb_info *info)
 
 static const struct fb_ops armada_fb_ops = {
 	.owner		= THIS_MODULE,
+	FB_DEFAULT_IO_OPS,
 	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_read	= drm_fb_helper_cfb_read,
-	.fb_write	= drm_fb_helper_cfb_write,
-	.fb_fillrect	= drm_fb_helper_cfb_fillrect,
-	.fb_copyarea	= drm_fb_helper_cfb_copyarea,
-	.fb_imageblit	= drm_fb_helper_cfb_imageblit,
 	.fb_destroy	= armada_fbdev_fb_destroy,
 };
 
-- 
2.40.1

