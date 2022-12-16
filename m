Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E43F664EAF8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 12:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B30010E5B5;
	Fri, 16 Dec 2022 11:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C06310E5B5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 11:54:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 29FE233682;
 Fri, 16 Dec 2022 11:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671191650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DzCTfg6se+1JetEh498R/yoPRSVUCCLildz/Adw8aKo=;
 b=soX9VXDSd+4TxjB1xhEmoTIjhCvvnEFuga3LG0ieiPSfiYrIktP8vFh9FKeiLJlf+F3YW5
 So4ch5tcCzHboSFe2Srd+JtN9OiFbbX4YrGxmDdrfwIHvwY9wfOz54HgSrL0GWHpu5FTRq
 meL6IhHB6hZLlJkkReBMB940X3yYL4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671191650;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DzCTfg6se+1JetEh498R/yoPRSVUCCLildz/Adw8aKo=;
 b=XE4uxzdageOhF/7049g3LifV0OdRt8pakO47wgfrv0g3MLmG26i/xM8FEdOv9s70I9S/Jf
 CIRNiPAT9evz3CCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00FCC138F0;
 Fri, 16 Dec 2022 11:54:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Sa0nOWFcnGOtGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Dec 2022 11:54:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	daniel@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 0/2] fbdev: Remove struct fb_ops.fb_release return type
Date: Fri, 16 Dec 2022 12:54:02 +0100
Message-Id: <20221216115404.20742-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
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

Remove the return type from struct fb_ops.fb_release. It is never
handled, it is never locked at. Originaly done for further updates
under DRM, but the majority of changes is within fbdev drivers.

Also fix trailing whitespaces before modifying hgafb.c.

Thomas Zimmermann (2):
  fbdev/hgafb: Remove trailing whitespaces
  fbdev: Don't return value from struct fb_ops.fb_release

 drivers/gpu/drm/drm_fbdev_generic.c          |  4 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c      |  3 +-
 drivers/gpu/drm/radeon/radeon_fb.c           |  3 +-
 drivers/video/fbdev/arcfb.c                  |  7 ++--
 drivers/video/fbdev/arkfb.c                  |  8 ++--
 drivers/video/fbdev/aty/atyfb_base.c         | 10 ++---
 drivers/video/fbdev/cirrusfb.c               |  3 +-
 drivers/video/fbdev/fsl-diu-fb.c             |  3 +-
 drivers/video/fbdev/hgafb.c                  | 39 ++++++++++----------
 drivers/video/fbdev/i740fb.c                 |  6 +--
 drivers/video/fbdev/i810/i810_main.c         |  8 ++--
 drivers/video/fbdev/intelfb/intelfbdrv.c     |  6 +--
 drivers/video/fbdev/matrox/matroxfb_base.c   |  3 +-
 drivers/video/fbdev/matrox/matroxfb_crtc2.c  | 10 ++---
 drivers/video/fbdev/neofb.c                  |  8 ++--
 drivers/video/fbdev/nvidia/nvidia.c          | 11 ++----
 drivers/video/fbdev/omap/omapfb_main.c       |  3 +-
 drivers/video/fbdev/ps3fb.c                  |  3 +-
 drivers/video/fbdev/pxafb.c                  |  3 +-
 drivers/video/fbdev/riva/fbdev.c             |  7 ++--
 drivers/video/fbdev/s3fb.c                   |  8 ++--
 drivers/video/fbdev/savage/savagefb_driver.c |  3 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c       |  4 +-
 drivers/video/fbdev/sis/sis_main.c           |  3 +-
 drivers/video/fbdev/skeletonfb.c             |  5 +--
 drivers/video/fbdev/smscufx.c                |  4 +-
 drivers/video/fbdev/udlfb.c                  |  4 +-
 drivers/video/fbdev/uvesafb.c                |  7 ++--
 drivers/video/fbdev/vermilion/vermilion.c    |  4 +-
 drivers/video/fbdev/vga16fb.c                |  8 ++--
 drivers/video/fbdev/via/viafbdev.c           |  3 +-
 drivers/video/fbdev/vt8623fb.c               |  8 ++--
 include/linux/fb.h                           |  2 +-
 33 files changed, 79 insertions(+), 132 deletions(-)

-- 
2.38.1

