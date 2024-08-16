Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5D09549B7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 14:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC2610E685;
	Fri, 16 Aug 2024 12:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mpYp+8Cc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KCRsEsnC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EZvsK2g1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bSuV6wkO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C5510E635;
 Fri, 16 Aug 2024 12:54:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E91E42229B;
 Fri, 16 Aug 2024 12:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723812862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSmIeqIH9vKqu3bWwbjc4jcZgku8WHZANkIdYTJFL7A=;
 b=mpYp+8CcEf0Ltqjw4tciwen7fUdTpEPyiOHG7VAmecUpPqDgDOH63NDrfpdvACqua4f8F8
 jpKQeZBgLqPwx6P6r12f7OXbl6mKGb7JnWPX1VcsGV2sVZvQI0KS1/+/F9wVWvEd70c/zf
 nbujBpeQ+HgclHpbZWq5gS3ShL4TV+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723812862;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSmIeqIH9vKqu3bWwbjc4jcZgku8WHZANkIdYTJFL7A=;
 b=KCRsEsnCYbYqpfYUF8sB1yN0MfFwKYYiSs3DvwHSHQR81/mRy4JXIxPZmrDetiJI10EqD8
 syfPMwBb8Q8xLSCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723812861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSmIeqIH9vKqu3bWwbjc4jcZgku8WHZANkIdYTJFL7A=;
 b=EZvsK2g1k5wVuE+RnuNAAyNXo0ItjtSnMwjFx1uLzs68GLLQ/1ArtqurDRzjbmQX0iB5OV
 8grI0yfI0VQmBQc/0Oue7nBnAfo+0egKWL2qrj98k1tjh4wbbLnt1HbOJUlLDWOIT9x42P
 Qwmi2eK3kiNKjfRE47C6eFDoR7e4TbE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723812861;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSmIeqIH9vKqu3bWwbjc4jcZgku8WHZANkIdYTJFL7A=;
 b=bSuV6wkOnuSQpVJ98DxoIWWrxRbX1XfWqPkmMovFZ223xlrRIz/8BQ0mJQrttVH4chHaME
 XU1YoV0113DmFAAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97CF913ACA;
 Fri, 16 Aug 2024 12:54:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MN+9I/1Lv2bdbgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Aug 2024 12:54:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH 31/86] drm/panel/ili9341: Run DRM default client setup
Date: Fri, 16 Aug 2024 14:22:57 +0200
Message-ID: <20240816125408.310253-32-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816125408.310253-1-tzimmermann@suse.de>
References: <20240816125408.310253-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,linaro.org:email];
 RCPT_COUNT_TWELVE(0.00)[12]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index 775d5d5e828c..0ef9f7b59ccb 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -31,6 +31,7 @@
 #include <video/mipi_display.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -591,6 +592,7 @@ static struct drm_driver ili9341_dbi_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &ili9341_dbi_fops,
 	DRM_GEM_DMA_DRIVER_OPS_VMAP,
+	DRM_FBDEV_DMA_DRIVER_OPS,
 	.debugfs_init		= mipi_dbi_debugfs_init,
 	.name			= "ili9341",
 	.desc			= "Ilitek ILI9341",
@@ -651,7 +653,7 @@ static int ili9341_dbi_probe(struct spi_device *spi, struct gpio_desc *dc,
 
 	spi_set_drvdata(spi, drm);
 
-	drm_fbdev_dma_setup(drm, 0);
+	drm_client_setup(drm, NULL);
 
 	return 0;
 }
-- 
2.46.0

