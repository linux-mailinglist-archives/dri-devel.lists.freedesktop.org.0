Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D43C74AD16
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 10:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5293C10E528;
	Fri,  7 Jul 2023 08:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB3610E528
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 08:34:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E9EE81FDC8;
 Fri,  7 Jul 2023 08:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688718866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XootyEfuEdowwsYT1ndkIQz3oHSLOKT3pacwPLWntsg=;
 b=dx/gDdbQ4xnS05jx1iSmnV6XtaZ9vD7ISa4MD/WnsqFFpeoZQYOFcHqXyoth6H7UPPdcdz
 /SHnehS6f4eN8mZVI+t+7ELV9roqFyaTZznHm4hBJS5NBfarO51mg6yri8ks5sASxy2h9H
 AHm1pCKlFaQutDHNS5K2mh+C5vJl1Qw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688718866;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XootyEfuEdowwsYT1ndkIQz3oHSLOKT3pacwPLWntsg=;
 b=OiJBDPWdlRKfjoA4N3bJxp4wW1HJv83ERAj1+AZi2etMnCprCk6P3FFrB/IYVpA7HpN2A7
 xzAet8SDo2SrOoAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B83411346D;
 Fri,  7 Jul 2023 08:34:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qPsCLBLOp2RdQAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Jul 2023 08:34:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v3 02/12] drm/fbdev-dma: Use fbdev DMA helpers
Date: Fri,  7 Jul 2023 10:31:53 +0200
Message-ID: <20230707083422.18691-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707083422.18691-1-tzimmermann@suse.de>
References: <20230707083422.18691-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use fbdev's DMA helpers for fbdev-dma. They are equivalent to the
previously used system-memory helpers, so no functional changes here.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/Kconfig         | 2 +-
 drivers/gpu/drm/drm_fbdev_dma.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index afb3b2f5f425..da3aa0625c36 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -216,7 +216,7 @@ config DRM_TTM_HELPER
 config DRM_GEM_DMA_HELPER
 	tristate
 	depends on DRM
-	select FB_SYS_HELPERS if DRM_FBDEV_EMULATION
+	select FB_DMA_HELPERS if DRM_FBDEV_EMULATION
 	help
 	  Choose this if you need the GEM DMA helper functions
 
diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index 8217f1ddc007..040c229a1737 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -62,9 +62,9 @@ static const struct fb_ops drm_fbdev_dma_fb_ops = {
 	.owner = THIS_MODULE,
 	.fb_open = drm_fbdev_dma_fb_open,
 	.fb_release = drm_fbdev_dma_fb_release,
-	__FB_DEFAULT_SYS_OPS_RDWR,
+	__FB_DEFAULT_DMA_OPS_RDWR,
 	DRM_FB_HELPER_DEFAULT_OPS,
-	__FB_DEFAULT_SYS_OPS_DRAW,
+	__FB_DEFAULT_DMA_OPS_DRAW,
 	.fb_mmap = drm_fbdev_dma_fb_mmap,
 	.fb_destroy = drm_fbdev_dma_fb_destroy,
 };
-- 
2.41.0

