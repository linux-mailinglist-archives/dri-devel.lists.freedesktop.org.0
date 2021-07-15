Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5785B3C9C58
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 12:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830F76E7F5;
	Thu, 15 Jul 2021 10:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD57F6E7F5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 10:03:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 937582292E;
 Thu, 15 Jul 2021 10:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626343381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TTJiLS1SqZqXUpzarqa9iMdem2gom5jB+GbHREAEndo=;
 b=ompT4TVYfygAeL+16TklyknkJ3GUtUmDQsyogyYLrTVjJ2eL+yvX/rBf2atpPPjEuSq9Zk
 r1LEUKLtFlMOKIUHjQodm17AYdAsLNjTa5pF7GmkqLsTSmXG9AGl1Q8H4kbSSQsBPd9okJ
 e/DIBL6GeyeqIWr/wU0Nl3GVg27Phgo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626343381;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TTJiLS1SqZqXUpzarqa9iMdem2gom5jB+GbHREAEndo=;
 b=F5iMgUiYf/qaamh8p7kjtDd9iEeEXzwij4iXp+hEdkw3P7nMlKAvs0+1HQ/rjYeBu7iIAz
 Nmxwvqet7ihLpADA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 634FD13C31;
 Thu, 15 Jul 2021 10:03:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XlNAF9UH8GCMEQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jul 2021 10:03:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: paul@crapouillou.net, airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org
Subject: [PATCH v2] drm/ingenic: Convert to Linux IRQ interfaces
Date: Thu, 15 Jul 2021 12:02:58 +0200
Message-Id: <20210715100258.6638-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
don't benefit from using it.

This patch also fixes a bug where the driver didn't release the
IRQ.

v2:
	* automatically release IRQ via devm_request_irq() (Paul)
	* mention the bugfix (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index c296472164d9..857ed070b21b 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -33,7 +33,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -799,8 +798,6 @@ static const struct drm_driver ingenic_drm_driver_data = {
 	.fops			= &ingenic_drm_fops,
 	.gem_create_object	= ingenic_drm_gem_create_object,
 	DRM_GEM_CMA_DRIVER_OPS,
-
-	.irq_handler		= ingenic_drm_irq_handler,
 };
 
 static const struct drm_plane_funcs ingenic_drm_primary_plane_funcs = {
@@ -1098,7 +1095,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		encoder->possible_clones = clone_mask;
 	}
 
-	ret = drm_irq_install(drm, irq);
+	ret = devm_request_irq(dev, irq, ingenic_drm_irq_handler, 0, drm->driver->name, drm);
 	if (ret) {
 		dev_err(dev, "Unable to install IRQ handler\n");
 		return ret;
-- 
2.32.0

