Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C688A983E6E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEF410E5AE;
	Tue, 24 Sep 2024 07:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1jXxqCvf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dkfSWkt8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1jXxqCvf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dkfSWkt8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26F810E4FA;
 Tue, 24 Sep 2024 07:17:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7A3CC21BA5;
 Tue, 24 Sep 2024 07:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZXIz+SceB1WEoUrR5sjPMDItZI6yJbyHzZHnUIsuYTw=;
 b=1jXxqCvfSFl7xZjEs44HeQRlzjSMwh58xa4y/0e35S81LIbMgGaafHkvaMergVdyj6Zpf3
 RxBBnndYdxN7ITrnCMOV+BhyUftA/h0R9bz68Z8t76tCFGFkn8Vzo6YRbiJKslZQvjzaxV
 0C6NC5Dk/gXt/aS5E/tCPyW5zDzXPNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162265;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZXIz+SceB1WEoUrR5sjPMDItZI6yJbyHzZHnUIsuYTw=;
 b=dkfSWkt8kQs+XSLAR3piVSzP3H4yF4WUq1M0k0ecIsIU87kfq5BSuOwv0oTSrqnbXs5eTq
 Z5CHlLy0Gi/56cAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZXIz+SceB1WEoUrR5sjPMDItZI6yJbyHzZHnUIsuYTw=;
 b=1jXxqCvfSFl7xZjEs44HeQRlzjSMwh58xa4y/0e35S81LIbMgGaafHkvaMergVdyj6Zpf3
 RxBBnndYdxN7ITrnCMOV+BhyUftA/h0R9bz68Z8t76tCFGFkn8Vzo6YRbiJKslZQvjzaxV
 0C6NC5Dk/gXt/aS5E/tCPyW5zDzXPNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162265;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZXIz+SceB1WEoUrR5sjPMDItZI6yJbyHzZHnUIsuYTw=;
 b=dkfSWkt8kQs+XSLAR3piVSzP3H4yF4WUq1M0k0ecIsIU87kfq5BSuOwv0oTSrqnbXs5eTq
 Z5CHlLy0Gi/56cAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2CA2313AE2;
 Tue, 24 Sep 2024 07:17:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uGW1CZln8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:17:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v5 21/80] drm/imx/lcdc: Run DRM default client setup
Date: Tue, 24 Sep 2024 09:12:19 +0200
Message-ID: <20240924071734.98201-22-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCVD_COUNT_TWO(0.00)[2];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[13];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,kernel.org,pengutronix.de,gmail.com];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
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

Call drm_client_setup() to run the kernel's default client setup
for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

v5:
- select DRM_CLIENT_SELECTION

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/imx/lcdc/Kconfig    | 1 +
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/lcdc/Kconfig b/drivers/gpu/drm/imx/lcdc/Kconfig
index 9c28bb0f4662..75869489b0e6 100644
--- a/drivers/gpu/drm/imx/lcdc/Kconfig
+++ b/drivers/gpu/drm/imx/lcdc/Kconfig
@@ -1,6 +1,7 @@
 config DRM_IMX_LCDC
       tristate "Freescale i.MX LCDC displays"
       depends on DRM && (ARCH_MXC || COMPILE_TEST)
+      select DRM_CLIENT_SELECTION
       select DRM_GEM_DMA_HELPER
       select DRM_KMS_HELPER
       select DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index 36668455aee8..3215c4acd675 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -3,6 +3,7 @@
 
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
@@ -348,6 +349,7 @@ static struct drm_driver imx_lcdc_drm_driver = {
 	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops = &imx_lcdc_drm_fops,
 	DRM_GEM_DMA_DRIVER_OPS_VMAP,
+	DRM_FBDEV_DMA_DRIVER_OPS,
 	.name = "imx-lcdc",
 	.desc = "i.MX LCDC driver",
 	.date = "20200716",
@@ -501,7 +503,7 @@ static int imx_lcdc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Cannot register device\n");
 
-	drm_fbdev_dma_setup(drm, 0);
+	drm_client_setup(drm, NULL);
 
 	return 0;
 }
-- 
2.46.0

