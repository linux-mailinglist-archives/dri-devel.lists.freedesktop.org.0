Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B754965B63
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDA710E955;
	Fri, 30 Aug 2024 08:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="meNG+NAP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u76u6Jc8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="meNG+NAP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u76u6Jc8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B384610E92B;
 Fri, 30 Aug 2024 08:45:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 705331FD15;
 Fri, 30 Aug 2024 08:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725007522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T2ga50HXI9taBcMmjeTPsffXTJt8bPtHcsmPWcAb25A=;
 b=meNG+NAPftRTfi7ttbr6rbaIuBkVD+TmA3wmWWIkKrJpfe/19zD9GL0kCkUY2eAXX0emry
 t51oYtK2dZ07mj5AOTrp/Iow3R7teB4AXMahXKUZSc2kJFuWYxyCBZkiFibVRR/HHTZiaT
 SN7UNrYnHcAdahG+adhNRwKsoN7A/54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725007522;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T2ga50HXI9taBcMmjeTPsffXTJt8bPtHcsmPWcAb25A=;
 b=u76u6Jc8G7BismxHhyKsXOe0JLCPh3KztHaHNhokGF2yMViWdq06jPXLHeI4oewCFoNONn
 /Po3QyN0N8mRm+DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725007522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T2ga50HXI9taBcMmjeTPsffXTJt8bPtHcsmPWcAb25A=;
 b=meNG+NAPftRTfi7ttbr6rbaIuBkVD+TmA3wmWWIkKrJpfe/19zD9GL0kCkUY2eAXX0emry
 t51oYtK2dZ07mj5AOTrp/Iow3R7teB4AXMahXKUZSc2kJFuWYxyCBZkiFibVRR/HHTZiaT
 SN7UNrYnHcAdahG+adhNRwKsoN7A/54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725007522;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T2ga50HXI9taBcMmjeTPsffXTJt8bPtHcsmPWcAb25A=;
 b=u76u6Jc8G7BismxHhyKsXOe0JLCPh3KztHaHNhokGF2yMViWdq06jPXLHeI4oewCFoNONn
 /Po3QyN0N8mRm+DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0982C13A3D;
 Fri, 30 Aug 2024 08:45:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +P8VAaKG0WbyegAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Aug 2024 08:45:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Subject: [PATCH v3 67/81] drm/hisilicon/hibmc: Run DRM default client setup
Date: Fri, 30 Aug 2024 10:40:51 +0200
Message-ID: <20240830084456.77630-68-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830084456.77630-1-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 RCPT_COUNT_TWELVE(0.00)[16]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -6.80
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Yongqin Liu <yongqin.liu@linaro.org>
Cc: John Stultz <jstultz@google.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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

