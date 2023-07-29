Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AB576816D
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 21:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B9D10E21A;
	Sat, 29 Jul 2023 19:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0682410E21A
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 19:32:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 82F481FE99;
 Sat, 29 Jul 2023 19:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690659119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Gnmpdvsr88StgXvE9YePSotJhqeLmb0MGwWW956LeGM=;
 b=JeuHxT0TcjJ3qq5+iRSj6132VV2LM+sdeZGHCSpFcpNr4R9EliQvAYFPq3qD2DN97GIm4i
 VihV3pb1mWmaBd7Vc7BSneJmM7i2AQZMvOuYBk7atwJuf7PmOiEhJnedL3zIkcSlsdTxEW
 wgztb6MsUyWCBuPXhTaLRL3d5JHQRC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690659119;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Gnmpdvsr88StgXvE9YePSotJhqeLmb0MGwWW956LeGM=;
 b=/aDIrKIYnkrJEev0Opj3BSLkjMkb0U3JJpiCfvNAxOBVTOvbf5Ykm+hVbCWLb7yE8d7lQU
 Xddm0H8t89bVyuBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 56C4013596;
 Sat, 29 Jul 2023 19:31:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UXOPEy9pxWSGGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sat, 29 Jul 2023 19:31:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	sam@ravnborg.org,
	javierm@redhat.com
Subject: [PATCH 0/4] fbdev: Rename helpers for struct fb_ops
Date: Sat, 29 Jul 2023 21:26:45 +0200
Message-ID: <20230729193157.15446-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
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

As discussed at [1], rename helpers for struct fb_ops to include
'MEM' in their name to signal that these helpers operate on a
certain type of memory address; either I/O, system or DMA-able
ranges. These are trival renames without any functional changes.

[1] https://lore.kernel.org/dri-devel/1ab418ae-592f-4347-fa75-bf9b00115afe@gmx.de/T/#mcb92691d6131333782cc83190a5fc00bd575a0c5

Thomas Zimmermann (4):
  fbdev: Use _IOMEM_ infix for I/O-memory helpers
  fbdev: Use _SYSMEM_ infix for system-memory helpers
  fbdev: Use _DMAMEM_ infix for DMA-memory helpers
  fbdev: Align deferred I/O with naming of helpers

 drivers/gpu/drm/Kconfig                    |  4 ++--
 drivers/gpu/drm/armada/Kconfig             |  2 +-
 drivers/gpu/drm/armada/armada_fbdev.c      |  2 +-
 drivers/gpu/drm/drm_fbdev_dma.c            |  4 ++--
 drivers/gpu/drm/drm_fbdev_generic.c        |  6 ++---
 drivers/gpu/drm/exynos/Kconfig             |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |  4 ++--
 drivers/gpu/drm/gma500/Kconfig             |  2 +-
 drivers/gpu/drm/gma500/fbdev.c             |  4 ++--
 drivers/gpu/drm/i915/Kconfig               |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c |  6 ++---
 drivers/gpu/drm/msm/Kconfig                |  2 +-
 drivers/gpu/drm/msm/msm_fbdev.c            |  6 ++---
 drivers/gpu/drm/omapdrm/Kconfig            |  2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c       |  4 ++--
 drivers/gpu/drm/radeon/Kconfig             |  2 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c      |  2 +-
 drivers/gpu/drm/tegra/Kconfig              |  2 +-
 drivers/gpu/drm/tegra/fbdev.c              |  4 ++--
 drivers/video/fbdev/Kconfig                | 10 ++++-----
 drivers/video/fbdev/broadsheetfb.c         |  6 ++---
 drivers/video/fbdev/core/Kconfig           | 10 ++++-----
 drivers/video/fbdev/hecubafb.c             |  6 ++---
 drivers/video/fbdev/metronomefb.c          |  6 ++---
 drivers/video/fbdev/ssd1307fb.c            |  6 ++---
 drivers/video/fbdev/xen-fbfront.c          |  6 ++---
 include/linux/fb.h                         | 26 +++++++++++-----------
 27 files changed, 69 insertions(+), 69 deletions(-)


base-commit: fba8a13ec9ae1a7175cc0dda7235b3d2df0f0f90
-- 
2.41.0

