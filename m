Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE77EAD7013
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 14:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85C810E823;
	Thu, 12 Jun 2025 12:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="trrhuNiq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q5+AX6hU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="trrhuNiq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q5+AX6hU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E6010E81D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 12:20:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2B8A61F834;
 Thu, 12 Jun 2025 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749730822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oEiZHNpO2Mrm7Gi7qfEOleqdlIu4/EJkxo+94JWC0vI=;
 b=trrhuNiqnwu+Iu5Xm6BWvXy6VQtb2+nHcUweY7SzabCM5SF70W4pO/Pe6MQXBUZlCfR1Nr
 Tv1uYm+E7MI+ku+U1ehGNUcKM3AEkCrImn0EqSAfmyBMNGa0WKovWqqNcSQ17kD/mJ7trT
 E0Gf5IY4eHOBodCPoXuy40b3kZDki3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749730822;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oEiZHNpO2Mrm7Gi7qfEOleqdlIu4/EJkxo+94JWC0vI=;
 b=q5+AX6hUvIVnq+4/DuLz/ve4R8hxT7E6+7ziMuQ77Ed4fvMtp9CKy+fgljPEErRpY0A/RG
 se2WVIDwx2THWABA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=trrhuNiq;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=q5+AX6hU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749730822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oEiZHNpO2Mrm7Gi7qfEOleqdlIu4/EJkxo+94JWC0vI=;
 b=trrhuNiqnwu+Iu5Xm6BWvXy6VQtb2+nHcUweY7SzabCM5SF70W4pO/Pe6MQXBUZlCfR1Nr
 Tv1uYm+E7MI+ku+U1ehGNUcKM3AEkCrImn0EqSAfmyBMNGa0WKovWqqNcSQ17kD/mJ7trT
 E0Gf5IY4eHOBodCPoXuy40b3kZDki3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749730822;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oEiZHNpO2Mrm7Gi7qfEOleqdlIu4/EJkxo+94JWC0vI=;
 b=q5+AX6hUvIVnq+4/DuLz/ve4R8hxT7E6+7ziMuQ77Ed4fvMtp9CKy+fgljPEErRpY0A/RG
 se2WVIDwx2THWABA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EFF79132D8;
 Thu, 12 Jun 2025 12:20:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6JBIOQXGSmhBdAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 12:20:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona.vetter@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 9/9] drm/ttm: Include <linux/export.h>
Date: Thu, 12 Jun 2025 14:10:03 +0200
Message-ID: <20250612121633.229222-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612121633.229222-1-tzimmermann@suse.de>
References: <20250612121633.229222-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2B8A61F834
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLa7dkhshwamq1oe933z1pzp6m)];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
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

Fix the compile-time warnings

  drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/ttm/tests/ttm_mock_manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/ttm/ttm_agp_backend.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/ttm/ttm_backup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/ttm/ttm_bo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/ttm/ttm_bo_util.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/ttm/ttm_bo_vm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/ttm/ttm_device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/ttm/ttm_execbuf_util.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/ttm/ttm_pool.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/ttm/ttm_range_manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/ttm/ttm_resource.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/ttm/ttm_tt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 3 +++
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  | 3 +++
 drivers/gpu/drm/ttm/ttm_agp_backend.c         | 1 +
 drivers/gpu/drm/ttm/ttm_backup.c              | 2 ++
 drivers/gpu/drm/ttm/ttm_bo.c                  | 1 +
 drivers/gpu/drm/ttm/ttm_bo_util.c             | 2 ++
 drivers/gpu/drm/ttm/ttm_bo_vm.c               | 2 ++
 drivers/gpu/drm/ttm/ttm_device.c              | 1 +
 drivers/gpu/drm/ttm/ttm_execbuf_util.c        | 2 ++
 drivers/gpu/drm/ttm/ttm_pool.c                | 1 +
 drivers/gpu/drm/ttm/ttm_range_manager.c       | 2 ++
 drivers/gpu/drm/ttm/ttm_resource.c            | 1 +
 drivers/gpu/drm/ttm/ttm_tt.c                  | 1 +
 13 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index b91c13f46225..7aaf0d1395ff 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -2,6 +2,9 @@
 /*
  * Copyright © 2023 Intel Corporation
  */
+
+#include <linux/export.h>
+
 #include <drm/ttm/ttm_tt.h>
 
 #include "ttm_kunit_helpers.h"
diff --git a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
index f6d1c8a2845d..d7eb6471f2ed 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
@@ -2,6 +2,9 @@
 /*
  * Copyright © 2023 Intel Corporation
  */
+
+#include <linux/export.h>
+
 #include <drm/ttm/ttm_resource.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/ttm/ttm_agp_backend.c
index d27691f2e451..fca0a1a3c6fd 100644
--- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
+++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
@@ -36,6 +36,7 @@
 #include <drm/ttm/ttm_tt.h>
 #include <drm/ttm/ttm_resource.h>
 #include <linux/agp_backend.h>
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/io.h>
diff --git a/drivers/gpu/drm/ttm/ttm_backup.c b/drivers/gpu/drm/ttm/ttm_backup.c
index ffaab68bd5dd..cb1b8e5dadf5 100644
--- a/drivers/gpu/drm/ttm/ttm_backup.c
+++ b/drivers/gpu/drm/ttm/ttm_backup.c
@@ -4,6 +4,8 @@
  */
 
 #include <drm/ttm/ttm_backup.h>
+
+#include <linux/export.h>
 #include <linux/page-flags.h>
 #include <linux/swap.h>
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 0f874f1e2526..bb9c5c8e16b5 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -35,6 +35,7 @@
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
 
+#include <linux/export.h>
 #include <linux/jiffies.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index b78365dc1fed..b9a772b26fa1 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -28,6 +28,8 @@
 /*
  * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
  */
+
+#include <linux/export.h>
 #include <linux/swap.h>
 #include <linux/vmalloc.h>
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index bdfa6ecfef05..b47020fca199 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -31,6 +31,8 @@
 
 #define pr_fmt(fmt) "[TTM] " fmt
 
+#include <linux/export.h>
+
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 36075772555a..816e2cba6016 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -28,6 +28,7 @@
 #define pr_fmt(fmt) "[TTM DEVICE] " fmt
 
 #include <linux/debugfs.h>
+#include <linux/export.h>
 #include <linux/mm.h>
 
 #include <drm/ttm/ttm_bo.h>
diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
index f1c60fa80c2d..bc7a83a9fe44 100644
--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
@@ -26,6 +26,8 @@
  *
  **************************************************************************/
 
+#include <linux/export.h>
+
 #include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_bo.h>
 
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index a0436971b6a6..baf27c70a419 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -31,6 +31,7 @@
  * cause they are rather slow compared to alloc_pages+map.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/dma-mapping.h>
 #include <linux/debugfs.h>
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index ae11d07eb63a..db854b581d83 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -34,6 +34,8 @@
 #include <drm/ttm/ttm_range_manager.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/drm_mm.h>
+
+#include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 006202fcd3c2..e2c82ad07eb4 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -23,6 +23,7 @@
  */
 
 #include <linux/debugfs.h>
+#include <linux/export.h>
 #include <linux/io-mapping.h>
 #include <linux/iosys-map.h>
 #include <linux/scatterlist.h>
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 698cd4bf5e46..506e257dfba8 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -33,6 +33,7 @@
 
 #include <linux/cc_platform.h>
 #include <linux/debugfs.h>
+#include <linux/export.h>
 #include <linux/file.h>
 #include <linux/module.h>
 #include <linux/sched.h>
-- 
2.49.0

