Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2364A983E24
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FA710E560;
	Tue, 24 Sep 2024 07:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xcXWm7C8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WBWEfx1e";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xcXWm7C8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WBWEfx1e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83F210E54E;
 Tue, 24 Sep 2024 07:17:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2CCBB1FC05;
 Tue, 24 Sep 2024 07:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tvjFSUHSl4t/WXf9TCHSsc5EwS4KECumr3yiUkYw7cw=;
 b=xcXWm7C8TgX+ZbMNZu9Yio+GRcNdDYB4DMXeFHcylRyqtTD2i0ksW5eyc/5/cO7rHn+qQp
 Cz6dF2AfFQT72En33iKvt7D84qG9h0dQYgpEOpSO0RAGMiu1sWzl10e3qnfzxux2X7liJ2
 J7I1c3ngTBcfC6mJqlfzrwEwP4XSgH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162271;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tvjFSUHSl4t/WXf9TCHSsc5EwS4KECumr3yiUkYw7cw=;
 b=WBWEfx1e21SRpqg9wWGYJBSRFIUBxZ6JiRh8CbU/orirdfHCnZ0uHuoltAFpkJ3eX+6NRx
 XTES5BL/5zyqAnDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tvjFSUHSl4t/WXf9TCHSsc5EwS4KECumr3yiUkYw7cw=;
 b=xcXWm7C8TgX+ZbMNZu9Yio+GRcNdDYB4DMXeFHcylRyqtTD2i0ksW5eyc/5/cO7rHn+qQp
 Cz6dF2AfFQT72En33iKvt7D84qG9h0dQYgpEOpSO0RAGMiu1sWzl10e3qnfzxux2X7liJ2
 J7I1c3ngTBcfC6mJqlfzrwEwP4XSgH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162271;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tvjFSUHSl4t/WXf9TCHSsc5EwS4KECumr3yiUkYw7cw=;
 b=WBWEfx1e21SRpqg9wWGYJBSRFIUBxZ6JiRh8CbU/orirdfHCnZ0uHuoltAFpkJ3eX+6NRx
 XTES5BL/5zyqAnDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C83D413AEE;
 Tue, 24 Sep 2024 07:17:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aCegL55n8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:17:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH v5 39/80] drm/stm: Run DRM default client setup
Date: Tue, 24 Sep 2024 09:12:37 +0200
Message-ID: <20240924071734.98201-40-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[14];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[]; TAGGED_RCPT(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,foss.st.com,gmail.com];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
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

Call drm_client_setup_with-fourcc() to run the kernel's default client
setup for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

v5:
- select DRM_CLIENT_SELECTION
v4:
- remove duplicated S-o-b tag (Gerd)
v2:
- use drm_client_setup_with_fourcc()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Philippe Cornu <philippe.cornu@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/gpu/drm/stm/Kconfig | 1 +
 drivers/gpu/drm/stm/drv.c   | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/Kconfig b/drivers/gpu/drm/stm/Kconfig
index d7f41a87808e..635be0ac00af 100644
--- a/drivers/gpu/drm/stm/Kconfig
+++ b/drivers/gpu/drm/stm/Kconfig
@@ -3,6 +3,7 @@ config DRM_STM
 	tristate "DRM Support for STMicroelectronics SoC Series"
 	depends on DRM && (ARCH_STM32 || COMPILE_TEST)
 	depends on COMMON_CLK
+	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_PANEL_BRIDGE
diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index e1232f74dfa5..fee274a60623 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -18,8 +18,10 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
@@ -66,6 +68,7 @@ static const struct drm_driver drv_driver = {
 	.patchlevel = 0,
 	.fops = &drv_driver_fops,
 	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(stm_gem_dma_dumb_create),
+	DRM_FBDEV_DMA_DRIVER_OPS,
 };
 
 static int drv_load(struct drm_device *ddev)
@@ -206,7 +209,7 @@ static int stm_drm_platform_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_unload;
 
-	drm_fbdev_dma_setup(ddev, 16);
+	drm_client_setup_with_fourcc(ddev, DRM_FORMAT_RGB565);
 
 	return 0;
 
-- 
2.46.0

