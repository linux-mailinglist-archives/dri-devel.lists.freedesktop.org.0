Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FA887984B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 16:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFEAC112EE8;
	Tue, 12 Mar 2024 15:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27027112EC2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 15:48:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CDEA73787C;
 Tue, 12 Mar 2024 15:48:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9400013976;
 Tue, 12 Mar 2024 15:48:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iI/AIl558GUhPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 12 Mar 2024 15:48:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 32/43] drm/tiny/hx8357d: Use fbdev-dma
Date: Tue, 12 Mar 2024 16:45:27 +0100
Message-ID: <20240312154834.26178-33-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312154834.26178-1-tzimmermann@suse.de>
References: <20240312154834.26178-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: CDEA73787C
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
damage handling, which is required by hx8357d. Avoids the overhead of
fbdev-generic's additional shadow buffering. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/hx8357d.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357d.c
index cdc4486e059b5..2e631282edeb4 100644
--- a/drivers/gpu/drm/tiny/hx8357d.c
+++ b/drivers/gpu/drm/tiny/hx8357d.c
@@ -18,7 +18,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
@@ -256,7 +256,7 @@ static int hx8357d_probe(struct spi_device *spi)
 
 	spi_set_drvdata(spi, drm);
 
-	drm_fbdev_generic_setup(drm, 0);
+	drm_fbdev_dma_setup(drm, 0);
 
 	return 0;
 }
-- 
2.44.0

