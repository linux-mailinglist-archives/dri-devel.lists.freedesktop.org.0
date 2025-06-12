Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11212AD7012
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 14:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C3210E81A;
	Thu, 12 Jun 2025 12:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="K+OyJ1f9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0QmNc7DX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K+OyJ1f9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0QmNc7DX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF7510E823
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 12:20:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8F8A2219B7;
 Thu, 12 Jun 2025 12:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749730820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IAP7FkX1JVnezL77kxzxEXWT2eTEjUC/sl2nw3EC+vg=;
 b=K+OyJ1f9t40MCDWvSDyA3m+Ne80Bowa3FDV782ZRjSv/ePtqm8/5zEn/wC46nokgaKgDdc
 98Z/Vz7UAiEbOQ7gBmNmsLwNgm6ZgtnvI8Cj1qLNnEXMnByAegn+woAdb6Grxxkgbv5GYI
 8S1YMBjdbEzsDeDlpA8TsIxHypwAQtE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749730820;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IAP7FkX1JVnezL77kxzxEXWT2eTEjUC/sl2nw3EC+vg=;
 b=0QmNc7DXYayzAkauC2eJIUNgq0xP6xH+3wbwbNLsPkMJitncJ2GX5+AUQJFVCEHrWA99Z+
 O64YvpRi+CxUPVDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749730820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IAP7FkX1JVnezL77kxzxEXWT2eTEjUC/sl2nw3EC+vg=;
 b=K+OyJ1f9t40MCDWvSDyA3m+Ne80Bowa3FDV782ZRjSv/ePtqm8/5zEn/wC46nokgaKgDdc
 98Z/Vz7UAiEbOQ7gBmNmsLwNgm6ZgtnvI8Cj1qLNnEXMnByAegn+woAdb6Grxxkgbv5GYI
 8S1YMBjdbEzsDeDlpA8TsIxHypwAQtE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749730820;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IAP7FkX1JVnezL77kxzxEXWT2eTEjUC/sl2nw3EC+vg=;
 b=0QmNc7DXYayzAkauC2eJIUNgq0xP6xH+3wbwbNLsPkMJitncJ2GX5+AUQJFVCEHrWA99Z+
 O64YvpRi+CxUPVDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5B22513ADE;
 Thu, 12 Jun 2025 12:20:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wIS6FATGSmhBdAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 12:20:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona.vetter@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/9] drm/client: Include <linux/export.h>
Date: Thu, 12 Jun 2025 14:09:58 +0200
Message-ID: <20250612121633.229222-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612121633.229222-1-tzimmermann@suse.de>
References: <20250612121633.229222-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_SHORT(-0.20)[-0.986]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 URIBL_BLOCKED(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30
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

Fixes the compile-time warnings

  drivers/gpu/drm/clients/drm_client_setup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_client.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_client_event.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_client_modeset.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_fb_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_fbdev_dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_fbdev_shmem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_fbdev_ttm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/clients/drm_client_setup.c | 2 ++
 drivers/gpu/drm/drm_client.c               | 1 +
 drivers/gpu/drm/drm_client_event.c         | 1 +
 drivers/gpu/drm/drm_client_modeset.c       | 2 ++
 drivers/gpu/drm/drm_fb_helper.c            | 1 +
 drivers/gpu/drm/drm_fbdev_dma.c            | 1 +
 drivers/gpu/drm/drm_fbdev_shmem.c          | 1 +
 drivers/gpu/drm/drm_fbdev_ttm.c            | 1 +
 8 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/clients/drm_client_setup.c b/drivers/gpu/drm/clients/drm_client_setup.c
index e17265039ca8..aec2fab6d2bf 100644
--- a/drivers/gpu/drm/clients/drm_client_setup.c
+++ b/drivers/gpu/drm/clients/drm_client_setup.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: MIT
 
+#include <linux/export.h>
+
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_device.h>
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index f7197a07c045..3fa38d4ac70b 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -3,6 +3,7 @@
  * Copyright 2018 Noralf Trønnes
  */
 
+#include <linux/export.h>
 #include <linux/iosys-map.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_client_event.c
index bd93cd93d519..c83196ad8b59 100644
--- a/drivers/gpu/drm/drm_client_event.c
+++ b/drivers/gpu/drm/drm_client_event.c
@@ -3,6 +3,7 @@
  * Copyright 2018 Noralf Trønnes
  */
 
+#include <linux/export.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/seq_file.h>
diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 0f9d5ba36c81..9c2c3b0c8c47 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -8,6 +8,8 @@
  */
 
 #include "drm/drm_modeset_lock.h"
+
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 937c3939e502..11a5b60cb9ce 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -30,6 +30,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/console.h>
+#include <linux/export.h>
 #include <linux/pci.h>
 #include <linux/sysrq.h>
 #include <linux/vga_switcheroo.h>
diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index 02a516e77192..8bd626ef16c7 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: MIT
 
+#include <linux/export.h>
 #include <linux/fb.h>
 #include <linux/vmalloc.h>
 
diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbdev_shmem.c
index f824369baacd..1e827bf8b815 100644
--- a/drivers/gpu/drm/drm_fbdev_shmem.c
+++ b/drivers/gpu/drm/drm_fbdev_shmem.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: MIT
 
+#include <linux/export.h>
 #include <linux/fb.h>
 
 #include <drm/drm_drv.h>
diff --git a/drivers/gpu/drm/drm_fbdev_ttm.c b/drivers/gpu/drm/drm_fbdev_ttm.c
index 73d35d59590c..85feb55bba11 100644
--- a/drivers/gpu/drm/drm_fbdev_ttm.c
+++ b/drivers/gpu/drm/drm_fbdev_ttm.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: MIT
 
+#include <linux/export.h>
 #include <linux/moduleparam.h>
 #include <linux/vmalloc.h>
 
-- 
2.49.0

