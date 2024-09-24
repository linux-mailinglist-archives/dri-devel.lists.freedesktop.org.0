Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA45983EE6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A91210E620;
	Tue, 24 Sep 2024 07:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="aRPYD8ig";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="scVR40qx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aRPYD8ig";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="scVR40qx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA9710E576;
 Tue, 24 Sep 2024 07:18:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 93B181FCD5;
 Tue, 24 Sep 2024 07:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162279; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=axI8fcaJJhu3mEsrHUGnbiSB9pLYLo37EKyG4sneZOg=;
 b=aRPYD8igA6zObqmsoW54ifwqrDPvYZh2bCeM6NP8WTbaVt81wqKPM3H7slH6HJ2Xw3+x2u
 O52VrP+68SfGd4Y4GL/z6Vt/r3Lw7et2sV0FVkYBZzVKeh9Xfr1mKdX3dkszuPkMTxLfYg
 7EQPD6GQA8XBfa6q51WjJmugbQc9BRA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162279;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=axI8fcaJJhu3mEsrHUGnbiSB9pLYLo37EKyG4sneZOg=;
 b=scVR40qxQ5wXlkGHvq3bFjPVZD9Rn9RRluYwxch1oaLXxsy9gJu7dyIlWajiq4q+98Wu27
 zPgqyLhjgDcIQECw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aRPYD8ig;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=scVR40qx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162279; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=axI8fcaJJhu3mEsrHUGnbiSB9pLYLo37EKyG4sneZOg=;
 b=aRPYD8igA6zObqmsoW54ifwqrDPvYZh2bCeM6NP8WTbaVt81wqKPM3H7slH6HJ2Xw3+x2u
 O52VrP+68SfGd4Y4GL/z6Vt/r3Lw7et2sV0FVkYBZzVKeh9Xfr1mKdX3dkszuPkMTxLfYg
 7EQPD6GQA8XBfa6q51WjJmugbQc9BRA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162279;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=axI8fcaJJhu3mEsrHUGnbiSB9pLYLo37EKyG4sneZOg=;
 b=scVR40qxQ5wXlkGHvq3bFjPVZD9Rn9RRluYwxch1oaLXxsy9gJu7dyIlWajiq4q+98Wu27
 zPgqyLhjgDcIQECw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 28E6E1386E;
 Tue, 24 Sep 2024 07:17:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WNWrCKdn8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:17:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Subject: [PATCH v5 66/80] drm/hisilicon/hibmc: Run DRM default client setup
Date: Tue, 24 Sep 2024 09:13:04 +0200
Message-ID: <20240924071734.98201-67-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 93B181FCD5
X-Spam-Level: 
X-Spamd-Result: default: False [-5.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_TWELVE(0.00)[15];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_RATELIMIT(0.00)[to(RLbwen1niosrcqbxsafh1),to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DKIM_TRACE(0.00)[suse.de:+]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -5.01
X-Spam-Flag: NO
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

The hibmc driver specifies a preferred color mode of 32. As this
is the default if no format has been given, leave it out entirely.

v5:
- select DRM_CLIENT_SELECTION

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Yongqin Liu <yongqin.liu@linaro.org>
Cc: John Stultz <jstultz@google.com>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/hisilicon/hibmc/Kconfig         | 1 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/Kconfig b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
index 126504318a4f..80253d39664a 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/Kconfig
+++ b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
@@ -3,6 +3,7 @@ config DRM_HISI_HIBMC
 	tristate "DRM Support for Hisilicon Hibmc"
 	depends on DRM && PCI && (ARM64 || COMPILE_TEST)
 	depends on MMU
+	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select DRM_VRAM_HELPER
 	select DRM_TTM
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 9f9b19ea0587..866a9ecaf8b9 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -16,6 +16,7 @@
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -63,6 +64,7 @@ static const struct drm_driver hibmc_driver = {
 	.debugfs_init		= drm_vram_mm_debugfs_init,
 	.dumb_create            = hibmc_dumb_create,
 	.dumb_map_offset        = drm_gem_ttm_dumb_map_offset,
+	DRM_FBDEV_TTM_DRIVER_OPS,
 };
 
 static int __maybe_unused hibmc_pm_suspend(struct device *dev)
@@ -339,7 +341,7 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
 		goto err_unload;
 	}
 
-	drm_fbdev_ttm_setup(dev, 32);
+	drm_client_setup(dev, NULL);
 
 	return 0;
 
-- 
2.46.0

