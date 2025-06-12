Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEC8AD700D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 14:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DF010E806;
	Thu, 12 Jun 2025 12:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="d+GLDpvB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6MF9pz+c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d+GLDpvB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6MF9pz+c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB0410E806
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 12:20:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 186211F7E8;
 Thu, 12 Jun 2025 12:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749730820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v3Sr/WYmM/K8RwleAXmJicnh0jirgQWBbgJloi6ECWE=;
 b=d+GLDpvBRazVfNrgrVu9kRafUBUl3ZnoFnNpf0uOcI5Oe3vowS3q5jJBjF460rDX9qDh/u
 fpqUgSHKDQ5n2OTjxuCEaIyI3rj/YSFWtEwMKy/4J7S0BvgLEAMLoK02eXLONZ+UNpJao/
 duFxCDIYayFDgGGh5rkqkMTH7MGyMdQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749730820;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v3Sr/WYmM/K8RwleAXmJicnh0jirgQWBbgJloi6ECWE=;
 b=6MF9pz+cfOvj8xgJrMFco/W6SCttgYDbv83TTkvkd+8pLl7w4STW4xyP2wctc8DvQa1s9v
 sJeDx2960BukTwAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749730820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v3Sr/WYmM/K8RwleAXmJicnh0jirgQWBbgJloi6ECWE=;
 b=d+GLDpvBRazVfNrgrVu9kRafUBUl3ZnoFnNpf0uOcI5Oe3vowS3q5jJBjF460rDX9qDh/u
 fpqUgSHKDQ5n2OTjxuCEaIyI3rj/YSFWtEwMKy/4J7S0BvgLEAMLoK02eXLONZ+UNpJao/
 duFxCDIYayFDgGGh5rkqkMTH7MGyMdQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749730820;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v3Sr/WYmM/K8RwleAXmJicnh0jirgQWBbgJloi6ECWE=;
 b=6MF9pz+cfOvj8xgJrMFco/W6SCttgYDbv83TTkvkd+8pLl7w4STW4xyP2wctc8DvQa1s9v
 sJeDx2960BukTwAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D3719132D8;
 Thu, 12 Jun 2025 12:20:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MGjlMQPGSmhBdAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 12:20:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona.vetter@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/9] drm: Include <linux/export.h>
Date: Thu, 12 Jun 2025 14:09:56 +0200
Message-ID: <20250612121633.229222-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612121633.229222-1-tzimmermann@suse.de>
References: <20250612121633.229222-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_SHORT(-0.20)[-0.987]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 URIBL_BLOCKED(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,ffwll.ch:email];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:email,
 suse.de:mid]
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

Fix the compile-time warnings

  drivers/gpu/drm/drm_atomic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_atomic_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_atomic_state_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_atomic_uapi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_auth.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_buddy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_color_mgmt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_connector.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_damage_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_debugfs_crc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_drv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_edid.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_exec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_fb_dma_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_file.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_flip_work.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_format_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_gpusvm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_gpuvm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_managed.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_mipi_dbi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_mipi_dsi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_mode_config.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_modeset_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_modeset_lock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_panic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_plane.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_plane_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_print.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_privacy_screen.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_self_refresh_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_simple_kms_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_suballoc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_syncobj.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_vblank_work.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_vma_manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_writeback.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/lib/drm_random.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/tests/drm_kunit_helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_atomic.c              | 2 +-
 drivers/gpu/drm/drm_atomic_helper.c       | 1 +
 drivers/gpu/drm/drm_atomic_state_helper.c | 1 +
 drivers/gpu/drm/drm_atomic_uapi.c         | 1 +
 drivers/gpu/drm/drm_auth.c                | 1 +
 drivers/gpu/drm/drm_buddy.c               | 1 +
 drivers/gpu/drm/drm_color_mgmt.c          | 1 +
 drivers/gpu/drm/drm_connector.c           | 1 +
 drivers/gpu/drm/drm_damage_helper.c       | 2 ++
 drivers/gpu/drm/drm_debugfs_crc.c         | 1 +
 drivers/gpu/drm/drm_drv.c                 | 1 +
 drivers/gpu/drm/drm_edid.c                | 1 +
 drivers/gpu/drm/drm_exec.c                | 2 ++
 drivers/gpu/drm/drm_fb_dma_helper.c       | 2 ++
 drivers/gpu/drm/drm_file.c                | 1 +
 drivers/gpu/drm/drm_flip_work.c           | 1 +
 drivers/gpu/drm/drm_format_helper.c       | 1 +
 drivers/gpu/drm/drm_gpusvm.c              | 1 +
 drivers/gpu/drm/drm_gpuvm.c               | 1 +
 drivers/gpu/drm/drm_managed.c             | 1 +
 drivers/gpu/drm/drm_mipi_dbi.c            | 1 +
 drivers/gpu/drm/drm_mipi_dsi.c            | 1 +
 drivers/gpu/drm/drm_mode_config.c         | 1 +
 drivers/gpu/drm/drm_modeset_helper.c      | 2 ++
 drivers/gpu/drm/drm_modeset_lock.c        | 2 ++
 drivers/gpu/drm/drm_panic.c               | 1 +
 drivers/gpu/drm/drm_plane.c               | 1 +
 drivers/gpu/drm/drm_plane_helper.c        | 1 +
 drivers/gpu/drm/drm_print.c               | 1 +
 drivers/gpu/drm/drm_privacy_screen.c      | 1 +
 drivers/gpu/drm/drm_self_refresh_helper.c | 1 +
 drivers/gpu/drm/drm_simple_kms_helper.c   | 1 +
 drivers/gpu/drm/drm_suballoc.c            | 2 ++
 drivers/gpu/drm/drm_syncobj.c             | 1 +
 drivers/gpu/drm/drm_vblank_work.c         | 2 ++
 drivers/gpu/drm/drm_vma_manager.c         | 1 +
 drivers/gpu/drm/drm_writeback.c           | 1 +
 drivers/gpu/drm/lib/drm_random.c          | 1 +
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 1 +
 39 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 0138cf0b8b63..cd15cf52f0c9 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -26,7 +26,7 @@
  * Daniel Vetter <daniel.vetter@ffwll.ch>
  */
 
-
+#include <linux/export.h>
 #include <linux/sync_file.h>
 
 #include <drm/drm_atomic.h>
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 2fe6c91910a1..ef56b474acf5 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -25,6 +25,7 @@
  * Daniel Vetter <daniel.vetter@ffwll.ch>
  */
 
+#include <linux/export.h>
 #include <linux/dma-fence.h>
 #include <linux/ktime.h>
 
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 519228eb1095..7142e163e618 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -37,6 +37,7 @@
 #include <drm/drm_vblank.h>
 #include <drm/drm_writeback.h>
 
+#include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/dma-fence.h>
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index c2726af6698e..ecc73d52bfae 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -36,6 +36,7 @@
 #include <drm/drm_writeback.h>
 #include <drm/drm_vblank.h>
 
+#include <linux/export.h>
 #include <linux/dma-fence.h>
 #include <linux/uaccess.h>
 #include <linux/sync_file.h>
diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index d6bf605b4b90..a2556d16bed6 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -28,6 +28,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/export.h>
 #include <linux/slab.h>
 
 #include <drm/drm_auth.h>
diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 241c855f891f..a1e652b7631d 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -5,6 +5,7 @@
 
 #include <kunit/test-bug.h>
 
+#include <linux/export.h>
 #include <linux/kmemleak.h>
 #include <linux/module.h>
 #include <linux/sizes.h>
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 5399c111c51f..37a3270bc3c2 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -20,6 +20,7 @@
  * OF THIS SOFTWARE.
  */
 
+#include <linux/export.h>
 #include <linux/uaccess.h>
 
 #include <drm/drm_atomic.h>
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 395e1bf006bd..0167e0e0d425 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -33,6 +33,7 @@
 #include <drm/drm_sysfs.h>
 #include <drm/drm_utils.h>
 
+#include <linux/export.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/uaccess.h>
diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
index 44a5a36806e3..6a49e7a0ab84 100644
--- a/drivers/gpu/drm/drm_damage_helper.c
+++ b/drivers/gpu/drm/drm_damage_helper.c
@@ -30,6 +30,8 @@
  *
  **************************************************************************/
 
+#include <linux/export.h>
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
diff --git a/drivers/gpu/drm/drm_debugfs_crc.c b/drivers/gpu/drm/drm_debugfs_crc.c
index bbc3bc4ba844..6b43b1cf2327 100644
--- a/drivers/gpu/drm/drm_debugfs_crc.c
+++ b/drivers/gpu/drm/drm_debugfs_crc.c
@@ -29,6 +29,7 @@
 #include <linux/circ_buf.h>
 #include <linux/ctype.h>
 #include <linux/debugfs.h>
+#include <linux/export.h>
 #include <linux/poll.h>
 #include <linux/uaccess.h>
 
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 56dd61f8e05a..bb291c4ac4d5 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -29,6 +29,7 @@
 #include <linux/bitops.h>
 #include <linux/cgroup_dmem.h>
 #include <linux/debugfs.h>
+#include <linux/export.h>
 #include <linux/fs.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 74e77742b2bd..4b4f27896161 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -31,6 +31,7 @@
 #include <linux/bitfield.h>
 #include <linux/byteorder/generic.h>
 #include <linux/cec.h>
+#include <linux/export.h>
 #include <linux/hdmi.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 18e366cc4993..8d0601400182 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -2,7 +2,9 @@
 
 #include <drm/drm_exec.h>
 #include <drm/drm_gem.h>
+
 #include <linux/dma-resv.h>
+#include <linux/export.h>
 
 /**
  * DOC: Overview
diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index 2c4dc7ebc0c3..fd71969d2fb1 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -17,7 +17,9 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_panic.h>
 #include <drm/drm_plane.h>
+
 #include <linux/dma-mapping.h>
+#include <linux/export.h>
 #include <linux/module.h>
 
 /**
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 246cf845e2c9..bf9d93e2e251 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -33,6 +33,7 @@
 
 #include <linux/anon_inodes.h>
 #include <linux/dma-fence.h>
+#include <linux/export.h>
 #include <linux/file.h>
 #include <linux/module.h>
 #include <linux/pci.h>
diff --git a/drivers/gpu/drm/drm_flip_work.c b/drivers/gpu/drm/drm_flip_work.c
index 8c6090a90d56..f5889dd8e7aa 100644
--- a/drivers/gpu/drm/drm_flip_work.c
+++ b/drivers/gpu/drm/drm_flip_work.c
@@ -21,6 +21,7 @@
  * SOFTWARE.
  */
 
+#include <linux/export.h>
 #include <linux/slab.h>
 
 #include <drm/drm_flip_work.h>
diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index d36e6cacc575..0c04247ef702 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -8,6 +8,7 @@
  * (at your option) any later version.
  */
 
+#include <linux/export.h>
 #include <linux/io.h>
 #include <linux/iosys-map.h>
 #include <linux/module.h>
diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 7ff81aa0a1ca..ab198645d90f 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/dma-mapping.h>
+#include <linux/export.h>
 #include <linux/hmm.h>
 #include <linux/memremap.h>
 #include <linux/migrate.h>
diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..e89b932e987c 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -27,6 +27,7 @@
 
 #include <drm/drm_gpuvm.h>
 
+#include <linux/export.h>
 #include <linux/interval_tree_generic.h>
 #include <linux/mm.h>
 
diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index cc4c463daae7..247f468731de 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_managed.h>
 
+#include <linux/export.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index a4cd476f9b30..ba4be6be5d28 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -8,6 +8,7 @@
 #include <linux/backlight.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
+#include <linux/export.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index e5184a0c2465..a00d76443128 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -26,6 +26,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index b4239fd04e9d..25f376869b3a 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -20,6 +20,7 @@
  * OF THIS SOFTWARE.
  */
 
+#include <linux/export.h>
 #include <linux/uaccess.h>
 
 #include <drm/drm_drv.h>
diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
index 5565464c1734..ef32f6af10d4 100644
--- a/drivers/gpu/drm/drm_modeset_helper.c
+++ b/drivers/gpu/drm/drm_modeset_helper.c
@@ -20,6 +20,8 @@
  * OF THIS SOFTWARE.
  */
 
+#include <linux/export.h>
+
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_client_event.h>
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
index 7694b85e75e3..beb91a13a312 100644
--- a/drivers/gpu/drm/drm_modeset_lock.c
+++ b/drivers/gpu/drm/drm_modeset_lock.c
@@ -21,6 +21,8 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/export.h>
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index b4de79583805..1d6312fa1429 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -6,6 +6,7 @@
  * Tux Ascii art taken from cowsay written by Tony Monroe
  */
 
+#include <linux/export.h>
 #include <linux/font.h>
 #include <linux/highmem.h>
 #include <linux/init.h>
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 04992dfd4c79..38f82391bfda 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -20,6 +20,7 @@
  * OF THIS SOFTWARE.
  */
 
+#include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 
diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
index 7982be4b0306..747d248aaf02 100644
--- a/drivers/gpu/drm/drm_plane_helper.c
+++ b/drivers/gpu/drm/drm_plane_helper.c
@@ -23,6 +23,7 @@
  * SOFTWARE.
  */
 
+#include <linux/export.h>
 #include <linux/list.h>
 
 #include <drm/drm_atomic.h>
diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 79517bd4418f..ded9461df5f2 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -25,6 +25,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/dynamic_debug.h>
+#include <linux/export.h>
 #include <linux/io.h>
 #include <linux/moduleparam.h>
 #include <linux/seq_file.h>
diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
index 6cc39e30781f..8959f7084e0b 100644
--- a/drivers/gpu/drm/drm_privacy_screen.c
+++ b/drivers/gpu/drm/drm_privacy_screen.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/module.h>
diff --git a/drivers/gpu/drm/drm_self_refresh_helper.c b/drivers/gpu/drm/drm_self_refresh_helper.c
index dd33fec5aabd..c0948586b7fd 100644
--- a/drivers/gpu/drm/drm_self_refresh_helper.c
+++ b/drivers/gpu/drm/drm_self_refresh_helper.c
@@ -7,6 +7,7 @@
  */
 #include <linux/average.h>
 #include <linux/bitops.h>
+#include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 
diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 250819fbc5ce..fcbcaaa36b5f 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2016 Noralf Trønnes
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 
diff --git a/drivers/gpu/drm/drm_suballoc.c b/drivers/gpu/drm/drm_suballoc.c
index 38cc7a123819..879ea33dbbc4 100644
--- a/drivers/gpu/drm/drm_suballoc.c
+++ b/drivers/gpu/drm/drm_suballoc.c
@@ -42,6 +42,8 @@
 
 #include <drm/drm_suballoc.h>
 #include <drm/drm_print.h>
+
+#include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/wait.h>
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 636cd83ca29e..e1b0fa4000cd 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -195,6 +195,7 @@
 #include <linux/anon_inodes.h>
 #include <linux/dma-fence-unwrap.h>
 #include <linux/eventfd.h>
+#include <linux/export.h>
 #include <linux/file.h>
 #include <linux/fs.h>
 #include <linux/sched/signal.h>
diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
index 9cc71120246f..e4e1873f0e1e 100644
--- a/drivers/gpu/drm/drm_vblank_work.c
+++ b/drivers/gpu/drm/drm_vblank_work.c
@@ -2,6 +2,8 @@
 
 #include <uapi/linux/sched/types.h>
 
+#include <linux/export.h>
+
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_work.h>
diff --git a/drivers/gpu/drm/drm_vma_manager.c b/drivers/gpu/drm/drm_vma_manager.c
index 83229a031af0..58659c16874c 100644
--- a/drivers/gpu/drm/drm_vma_manager.c
+++ b/drivers/gpu/drm/drm_vma_manager.c
@@ -23,6 +23,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/rbtree.h>
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index edbeab88ff2b..ace8c98c3e04 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/dma-fence.h>
+#include <linux/export.h>
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
diff --git a/drivers/gpu/drm/lib/drm_random.c b/drivers/gpu/drm/lib/drm_random.c
index 31b5a3e21911..0e9dba1ef4af 100644
--- a/drivers/gpu/drm/lib/drm_random.c
+++ b/drivers/gpu/drm/lib/drm_random.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/bitops.h>
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/random.h>
 #include <linux/slab.h>
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 5f7257840d8e..04edb6079c0d 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -13,6 +13,7 @@
 #include <kunit/resource.h>
 
 #include <linux/device.h>
+#include <linux/export.h>
 #include <linux/platform_device.h>
 
 #define KUNIT_DEVICE_NAME	"drm-kunit-mock-device"
-- 
2.49.0

