Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B9089F39D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 15:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A851811335C;
	Wed, 10 Apr 2024 13:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="qNtSsl8M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/Badxoyk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QD/zIeKg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8EMNSCe5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36891113343
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 13:06:13 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 660D35CDB3;
 Wed, 10 Apr 2024 13:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712754371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nAhqWkadr5rDPH11xJHe3PwShNbpXUh2ZpEhYp0QwpM=;
 b=qNtSsl8MPqhmOx38oH0NAhzHI8usYAG05p4Hu5rCtJhAt100DxManUvjyIMLMZhU56Fjss
 AcOrfUNsXbMOYl44e+333VVaHTrtcIAEGEqs5sJ32c/MHah6AQUnZcutERJLJR0NGn8Evq
 Q7YV2Q4sGDbYBNzCsEZUPjeWBI9pSac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712754371;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nAhqWkadr5rDPH11xJHe3PwShNbpXUh2ZpEhYp0QwpM=;
 b=/BadxoykCkfNNkmrOI3N2C9/9lHI0qUDUseIIXSjWYdigmPOSajpbjvXeD5DM7QMYpVyQL
 RUVtUGxeeuvA1hAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712754370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nAhqWkadr5rDPH11xJHe3PwShNbpXUh2ZpEhYp0QwpM=;
 b=QD/zIeKghR0le+sMwK0BwAvpF7Hd9FfutnXH1dLaY7fdv8c/WLAbLVjt9pcqifBKXm959a
 /fHiFhJGzgmIJzkU7CqfgcAGpcF8bJUx11I8/jYbil+k87NlnKJa84P3+ygugfN+QfmEK9
 hqKT4zfO8Qg1TEoE95pOSgGRP/pxA+M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712754370;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nAhqWkadr5rDPH11xJHe3PwShNbpXUh2ZpEhYp0QwpM=;
 b=8EMNSCe5qY1LiRZXcovXpaedQ7CtwDCcSkKxCAKBTRGEda/bVFKA5m7TwmdFyirfmnvWxv
 ndM8sWtITyXvxxBg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 25B211390D;
 Wed, 10 Apr 2024 13:06:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id qIIJCMKOFmYdEgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Apr 2024 13:06:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 43/43] drm/fbdev: Clean up fbdev documentation
Date: Wed, 10 Apr 2024 15:02:39 +0200
Message-ID: <20240410130557.31572-44-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410130557.31572-1-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns,lwn.net:email,suse.de:email];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
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

Rewrite some docs that are not up-to-date any longer. Remove the TODO
item for fbdev-generic conversion, as the helper has been replaced. Make
documentation for DMA, SHMEM and TTM emulation available.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/gpu/drm-kms-helpers.rst | 12 +++++++++---
 Documentation/gpu/todo.rst            | 13 -------------
 drivers/gpu/drm/drm_drv.c             |  2 +-
 drivers/gpu/drm/drm_fb_helper.c       | 11 ++---------
 include/drm/drm_mode_config.h         |  4 ++--
 5 files changed, 14 insertions(+), 28 deletions(-)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index e46ab9b670acd..8435e8621cc08 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -110,15 +110,21 @@ fbdev Helper Functions Reference
 .. kernel-doc:: drivers/gpu/drm/drm_fb_helper.c
    :doc: fbdev helpers
 
-.. kernel-doc:: include/drm/drm_fb_helper.h
-   :internal:
+.. kernel-doc:: drivers/gpu/drm/drm_fbdev_dma.c
+   :export:
 
-.. kernel-doc:: drivers/gpu/drm/drm_fb_helper.c
+.. kernel-doc:: drivers/gpu/drm/drm_fbdev_shmem.c
    :export:
 
 .. kernel-doc:: drivers/gpu/drm/drm_fbdev_ttm.c
    :export:
 
+.. kernel-doc:: include/drm/drm_fb_helper.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_fb_helper.c
+   :export:
+
 format Helper Functions Reference
 =================================
 
diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index fb9ad120b1414..e2a0585915b32 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -243,19 +243,6 @@ Contact: Maintainer of the driver you plan to convert
 
 Level: Intermediate
 
-Convert drivers to use drm_fbdev_generic_setup()
-------------------------------------------------
-
-Most drivers can use drm_fbdev_generic_setup(). Driver have to implement
-atomic modesetting and GEM vmap support. Historically, generic fbdev emulation
-expected the framebuffer in system memory or system-like memory. By employing
-struct iosys_map, drivers with frambuffers in I/O memory can be supported
-as well.
-
-Contact: Maintainer of the driver you plan to convert
-
-Level: Intermediate
-
 Reimplement functions in drm_fbdev_fb_ops without fbdev
 -------------------------------------------------------
 
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 243cacb3575c0..cfcd45480d326 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -345,7 +345,7 @@ void drm_minor_release(struct drm_minor *minor)
  *		if (ret)
  *			return ret;
  *
- *		drm_fbdev_generic_setup(drm, 32);
+ *		drm_fbdev_{...}_setup(drm, 32);
  *
  *		return 0;
  *	}
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d612133e2cf7e..e2e19f49342e1 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -85,12 +85,8 @@ static DEFINE_MUTEX(kernel_fb_helper_lock);
  * The fb helper functions are useful to provide an fbdev on top of a drm kernel
  * mode setting driver. They can be used mostly independently from the crtc
  * helper functions used by many drivers to implement the kernel mode setting
- * interfaces.
- *
- * Drivers that support a dumb buffer with a virtual address and mmap support,
- * should try out the generic fbdev emulation using drm_fbdev_generic_setup().
- * It will automatically set up deferred I/O if the driver requires a shadow
- * buffer.
+ * interfaces. Drivers that use one of the shared memory managers, TTM, SHMEM,
+ * DMA, should instead use the corresponding fbdev emulation.
  *
  * Existing fbdev implementations should restore the fbdev console by using
  * drm_fb_helper_lastclose() as their &drm_driver.lastclose callback.
@@ -126,9 +122,6 @@ static DEFINE_MUTEX(kernel_fb_helper_lock);
  * atomic context. If drm_fb_helper_deferred_io() is used as the deferred_io
  * callback it will also schedule dirty_work with the damage collected from the
  * mmap page writes.
- *
- * Deferred I/O is not compatible with SHMEM. Such drivers should request an
- * fbdev shadow buffer and call drm_fbdev_generic_setup() instead.
  */
 
 static void drm_fb_helper_restore_lut_atomic(struct drm_crtc *crtc)
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 973119a9176b2..1e4b8d01212e6 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -106,8 +106,8 @@ struct drm_mode_config_funcs {
 	 * Drivers implementing fbdev emulation use drm_kms_helper_hotplug_event()
 	 * to call this hook to inform the fbdev helper of output changes.
 	 *
-	 * This hook is deprecated, drivers should instead use
-	 * drm_fbdev_generic_setup() which takes care of any necessary
+	 * This hook is deprecated, drivers should instead implement fbdev
+	 * support with struct drm_client, which takes care of any necessary
 	 * hotplug event forwarding already without further involvement by
 	 * the driver.
 	 */
-- 
2.44.0

