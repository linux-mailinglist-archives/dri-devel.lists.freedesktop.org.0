Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF7870BD9D
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 14:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B76210E320;
	Mon, 22 May 2023 12:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5BC10E300;
 Mon, 22 May 2023 12:21:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 678801FECB;
 Mon, 22 May 2023 12:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684758103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G+jXxIm+6SQl8pNqKPP9fG1+JNcilSXWmHwdZQ4eT8I=;
 b=XMXG4MLpsJOEB7/vdi3cNN+GyzFadIVCTQ60jmRzhE29xKEckTp80sPyY9IXDewzmNi8pj
 lF72Ji8+FxZrz+5r4goTPm3NSvGygbZYHoS5axEzncq1Ncwvqtz9PIXOIvGOR6QswomA4S
 K2GYYsbKlHqOZPLg8uv3mDeFQemOTFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684758103;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G+jXxIm+6SQl8pNqKPP9fG1+JNcilSXWmHwdZQ4eT8I=;
 b=StoosslVVWp+/Zndrh+CaxY/Va/rV+istDzNRHI7tDshMuwEePMlBKbpvT7L0C+hsI1gbs
 Q2KUx1G5c8OghjDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A9E8139F5;
 Mon, 22 May 2023 12:21:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EBK5AVdea2RYVAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 22 May 2023 12:21:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com, sam@ravnborg.org
Subject: [PATCH v3 03/12] drm/exynos: Use regular fbdev I/O helpers
Date: Mon, 22 May 2023 14:21:31 +0200
Message-Id: <20230522122140.30131-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522122140.30131-1-tzimmermann@suse.de>
References: <20230522122140.30131-1-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the regular fbdev helpers for framebuffer I/O instead of DRM's
helpers. Exynos does not use damage handling, so DRM's fbdev helpers
are mere wrappers around the fbdev code.

By using fbdev helpers directly within each DRM fbdev emulation,
we can eventually remove DRM's wrapper functions entirely.

v3:
	* don't reorder Makefile rules (Sam)
v2:
	* use FB_IO_HELPERS option

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig            |  1 +
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 10 +++++-----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 0cb92d651ff1..7ca7e1dab52c 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -7,6 +7,7 @@ config DRM_EXYNOS
 	select DRM_DISPLAY_HELPER if DRM_EXYNOS_DP
 	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
+	select FB_IO_HELPERS if DRM_FBDEV_EMULATION
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	help
 	  Choose this option if you have a Samsung SoC Exynos chipset.
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index ea4b3d248aac..b3333dd1d087 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -8,6 +8,8 @@
  *	Seung-Woo Kim <sw0312.kim@samsung.com>
  */
 
+#include <linux/fb.h>
+
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
@@ -49,11 +51,9 @@ static const struct fb_ops exynos_drm_fb_ops = {
 	.owner		= THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_mmap        = exynos_drm_fb_mmap,
-	.fb_read	= drm_fb_helper_cfb_read,
-	.fb_write	= drm_fb_helper_cfb_write,
-	.fb_fillrect	= drm_fb_helper_cfb_fillrect,
-	.fb_copyarea	= drm_fb_helper_cfb_copyarea,
-	.fb_imageblit	= drm_fb_helper_cfb_imageblit,
+	.fb_fillrect	= cfb_fillrect,
+	.fb_copyarea	= cfb_copyarea,
+	.fb_imageblit	= cfb_imageblit,
 	.fb_destroy	= exynos_drm_fb_destroy,
 };
 
-- 
2.40.1

