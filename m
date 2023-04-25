Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D926EE3F2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 16:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5086410E75B;
	Tue, 25 Apr 2023 14:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684FC10E735
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 14:28:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2EAF71FDA6;
 Tue, 25 Apr 2023 14:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682432929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kZb5AYHxFFhMP6xupqT3f9APNbR+VPklPqZGgGYTKfI=;
 b=0Mj9n6wBn4SHKpT4eCOVFBMmTftdf/ReCwrlams1QkKx87RUQJQMRLW/n7sdNAcL6MKDbN
 ROUdSJOYsKmNB3ADdvlnKzRBs7cOVfger4qaqzy9CyXnsa/IYvp+CEMe8HKA3f5XkQR2B5
 XDrVwy7y2TjekhwYZiO+hPUFhiqxe4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682432929;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kZb5AYHxFFhMP6xupqT3f9APNbR+VPklPqZGgGYTKfI=;
 b=mhE25a2KwJng+5pys70nA8p7WOQ4/6Tn57fu5rOANHwOPwY+HhDwM3ces6XfbI2Qrujjzv
 nX3jQEGrnlc5oiCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D894B138E3;
 Tue, 25 Apr 2023 14:28:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NrXtM6DjR2ReOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Apr 2023 14:28:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: [PATCH 0/6] drm,fbdev: Use fbdev's I/O helpers
Date: Tue, 25 Apr 2023 16:28:40 +0200
Message-Id: <20230425142846.730-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make fbdev's built-in helpers for reading and writing I/O and system
memory available to DRM. Replace DRM's internal helpers.

The first patch resolves a bug that's been in the fbdev code for
more than 15 years. Makes the read/write helpers work successfully
with the IGT tests.

Patches 2 to 4 streamline fbdev's file-I/O code and remove a few
duplicate checks.

Patch 5 moves the default-I/O code into the new helpers fb_cfb_read()
and fb_cfb_write(); patch 6 uses them in DRM. This allows us to remove
quite a bit of code from DRM's internal fbdev helpers.

Tested with i915 and simpledrm.

The next step here is to remove the drm_fb_helper_{cfb,sys}_*()
entirely. They where mostly introduced because fbdev doesn't protect
it's public interfaces with an CONFIG_FB preprocessor guards. But all
of DRM driver's fbdev emulation won't be build without CONFIG_FB, so
this is not an issue in practice. Removing the DRM wrappers will
further simplify the DRM code.

Thomas Zimmermann (6):
  fbdev: Return number of bytes read or written
  fbdev: Use screen_buffer in fb_sys_{read,write}()
  fbdev: Don't re-validate info->state in fb_ops implementations
  fbdev: Validate info->screen_{base,buffer} in fb_ops implementations
  fbdev: Move CFB read and write code into helper functions
  drm/fb-helper: Use fb_{cfb,sys}_{read, write}()

 drivers/gpu/drm/drm_fb_helper.c        | 174 +------------------------
 drivers/video/fbdev/cobalt_lcdfb.c     |   6 +
 drivers/video/fbdev/core/Makefile      |   2 +-
 drivers/video/fbdev/core/fb_cfb_fops.c | 126 ++++++++++++++++++
 drivers/video/fbdev/core/fb_sys_fops.c |  36 ++---
 drivers/video/fbdev/core/fbmem.c       | 111 +---------------
 drivers/video/fbdev/sm712fb.c          |  10 +-
 include/linux/fb.h                     |  10 ++
 8 files changed, 173 insertions(+), 302 deletions(-)
 create mode 100644 drivers/video/fbdev/core/fb_cfb_fops.c

-- 
2.40.0

