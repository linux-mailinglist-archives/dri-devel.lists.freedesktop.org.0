Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C361AEE106
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 16:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B047410E469;
	Mon, 30 Jun 2025 14:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="CaILw/bG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HPw8Yusm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hp201Z/M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wbmgqzvJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C93410E469
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 14:38:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 72EAB1F393;
 Mon, 30 Jun 2025 14:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751294333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O9ZK+AMRYTAMRQmB/iWri0FNg1btiSjt/DprHFG/O30=;
 b=CaILw/bG8vcb7bkRDONaTvEwfFEfgb78zAG2l6mGVtXcx2lxE8Bu5gptwtRwRelcia6Owk
 UwG5qT7WbdXtH1W2TsQDQOwm6Eg+UaJ7dUgSs3W78AxzC/UND5GVGvspS6x6qPBUu/4xrY
 MZkxTyHbbAJaIkP0SLrqxE4lTLvuOME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751294333;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O9ZK+AMRYTAMRQmB/iWri0FNg1btiSjt/DprHFG/O30=;
 b=HPw8Yusm0EOz/JJl2r1XqS1P0idoK8thamF6bgKXLdsJHkyOoQoAbTM6KiQVuG1qp5DKX8
 3wsF4l0KptIE8+Aw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751294332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O9ZK+AMRYTAMRQmB/iWri0FNg1btiSjt/DprHFG/O30=;
 b=hp201Z/MBDfll8jiZruxsI4n7AwwHsYI7QzEgTmj49J1/+yfwKhc8P7irB0Wrbtk3NDy37
 +MfuujAwFraDHBm03SWfh5DgFhlXqdY5EIzuDugQ3ikwRm+l8ouyPYfe0K2JazETkx25VY
 Gl/SWQwTov6sWIJDv0rZwWn6N7bIywg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751294332;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O9ZK+AMRYTAMRQmB/iWri0FNg1btiSjt/DprHFG/O30=;
 b=wbmgqzvJX0XmHMJT0SiEDe2U5KdlLdKRR9hu4QTgmaEGS4ADa6hWDTePvBycAHIXjLHCBM
 GuqYej4sO8OoKTAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 13E2A1399F;
 Mon, 30 Jun 2025 14:38:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id XtGrA3yhYmj7cwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 30 Jun 2025 14:38:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: christian.koenig@amd.com, oushixiong@kylinos.cn, louis.chauvet@bootlin.com,
 zenghui.yu@linux.dev, hamohammed.sa@gmail.com, simona@ffwll.ch,
 melissa.srw@gmail.com, airlied@redhat.com, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH] drm/gem-shmem: Do not map s/g table by default
Date: Mon, 30 Jun 2025 16:34:11 +0200
Message-ID: <20250630143537.309052-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[15];
 FREEMAIL_TO(0.00)[amd.com,kylinos.cn,bootlin.com,linux.dev,gmail.com,ffwll.ch,redhat.com,linux.intel.com,kernel.org,poorly.run];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,gmail.com];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid, linux.dev:email,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.80
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

The vast majority of drivers that use GEM-SHMEM helpers do not use
an s/g table for imported buffers; specifically all drivers that use
DRM_GEM_SHMEM_DRIVER_OPS. Therefore convert the initializer macro
to DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT and remove the latter. This
helps to avoid swiotbl errors, such as seen with some Aspeed systems

  ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)

The error is caused by the system's limited DMA capabilities and can
happen with any GEM-SHMEM-based driver. It results in a performance
penalty.

In the case of vgem and vkms, the devices do not support DMA at all,
which can result in failure to map the buffer object into the kernel's
address space. [1][2] Avoiding the s/g table fixes this problem.

The other drivers based on GEM-SHMEM, imagination, lima, panfrost,
panthor, v3d and virtio, use the s/g table of imported buffers. Neither
driver uses the default initializer, so they won't be affected by
this change.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reported-by: Zenghui Yu <zenghui.yu@linux.dev>
Closes: https://lore.kernel.org/dri-devel/6d22bce3-4533-4cfa-96ba-64352b715741@linux.dev/ # [1]
Reported-by: José Expósito <jose.exposito89@gmail.com>
Closes: https://lore.kernel.org/dri-devel/20250311172054.2903-1-jose.exposito89@gmail.com/ # [2]
---
 drivers/gpu/drm/ast/ast_drv.c      |  2 +-
 drivers/gpu/drm/udl/udl_drv.c      |  2 +-
 include/drm/drm_gem_shmem_helper.h | 18 +++---------------
 3 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 054acda41909..6fbf62a99c48 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -64,7 +64,7 @@ static const struct drm_driver ast_driver = {
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
 
-	DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT,
+	DRM_GEM_SHMEM_DRIVER_OPS,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 };
 
diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index ce5ae7cacb90..1922988625eb 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -57,7 +57,7 @@ static const struct drm_driver driver = {
 
 	/* GEM hooks */
 	.fops = &udl_driver_fops,
-	DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT,
+	DRM_GEM_SHMEM_DRIVER_OPS,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 
 	.name = DRIVER_NAME,
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 35f7466dca84..92f5db84b9c2 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -293,23 +293,11 @@ struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
 /**
  * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
  *
- * This macro provides a shortcut for setting the shmem GEM operations in
- * the &drm_driver structure.
+ * This macro provides a shortcut for setting the shmem GEM operations
+ * in the &drm_driver structure. Drivers that do not require an s/g table
+ * for imported buffers should use this.
  */
 #define DRM_GEM_SHMEM_DRIVER_OPS \
-	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
-	.dumb_create		   = drm_gem_shmem_dumb_create
-
-/**
- * DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT - shmem GEM operations
- *                                       without mapping sg_table on
- *                                       imported buffer.
- *
- * This macro provides a shortcut for setting the shmem GEM operations in
- * the &drm_driver structure for drivers that do not require a sg_table on
- * imported buffers.
- */
-#define DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT \
 	.gem_prime_import       = drm_gem_shmem_prime_import_no_map, \
 	.dumb_create            = drm_gem_shmem_dumb_create
 
-- 
2.50.0

