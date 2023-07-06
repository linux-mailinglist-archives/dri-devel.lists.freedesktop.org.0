Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD87749C6B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 14:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C31A10E3F4;
	Thu,  6 Jul 2023 12:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A0510E3F4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 12:49:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 49FC41FE7B;
 Thu,  6 Jul 2023 12:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688647747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wg/jKgVOvScklcFceYa+q6oTO7GnzG6ukG3hy+E8U84=;
 b=ewxeSIsrzJdnad57RPZaRj6uX/zhKJ6VI5rR5wrTwxyqYdFmTAh+3rh1pglr/VHTVPxTur
 QWa7eB8P8PY/iX1G/rIGngDc9tuRICAXy1T1oHKqhNgJ46+1nAWfasvX6Y9BEWYiJF317j
 o3rZgXpZoZaYbUDgZdZjKKRiOhNkNDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688647747;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wg/jKgVOvScklcFceYa+q6oTO7GnzG6ukG3hy+E8U84=;
 b=Svbue0Y6YlEv97YJRY9vL11Vmf6g8HciT6eyRM0FYq+5MfU/3LaLF17vuRfUbH3brwJ4Qg
 yzc7JHeA9fHq5KAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 161CD138FC;
 Thu,  6 Jul 2023 12:49:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nnx1BEO4pmS7QgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 12:49:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v2 00/11] drm: Improve fbdev emulation for DMA-able
 framebuffers
Date: Thu,  6 Jul 2023 14:46:38 +0200
Message-ID: <20230706124905.15134-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add fbdev helpers for framebuffers in DMA-able memory and update
fbdev emulation in the respective DRM drivers. DMA memory used to
handled as system memory. Improve this and prepare for possible
future changes.

Patch 1 adds initializer macros for struct fb_ops and a Kconfig
token for framebuffers in DMA memory.

Patches 2 to 4 update fbdev-dma and tegra. No functional changes
are expected as both used system memory before.

Patches 5 and 6 update exynos to use DMA helpers. Exynos incorrectly
used fbdev's I/O-memory helpers. Fix this.

Patches 7 to 9 update omapdrm to use DMA helpers. Patch 7 first
reworks the driver's mmap to current best practices. This also makes
it suitable for use with fbdev, which patches 8 and 9 implement.

Patchies 10 removes some fbdev macros for system memory that are now
unused; patch 11 fixes some comments.

The patchset would ideally go through drm-misc-next. Future patches
can build upon it and update fbdev drivers in similar ways.

v2:
	* fix omap mmap flags
	* drop FBINFO_DEFAULT from patches
	* minor cleanups

Thomas Zimmermann (11):
  fbdev: Add fb_ops init macros for framebuffers in DMA-able memory
  drm/fbdev-dma: Use fbdev DMA helpers
  drm/tegra: Use fbdev DMA helpers
  drm/tegra: Set fbdev FBINFO_VIRTFB flag
  drm/exynos: Use fbdev DMA helpers
  drm/exynos: Set fbdev FBINFO_VIRTFB flag
  drm/omapdrm: Set VM flags in GEM-object mmap function
  drm/omapdrm: Use GEM mmap for fbdev emulation
  drm/omapdrm: Set fbdev FBINFO_VIRTFB flag
  fbdev: Remove FB_DEFAULT_SYS_OPS
  fbdev: Harmonize some comments in <linux/fb.h>

 drivers/gpu/drm/Kconfig                   |  2 +-
 drivers/gpu/drm/drm_fbdev_dma.c           |  4 ++--
 drivers/gpu/drm/exynos/Kconfig            |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c |  5 ++--
 drivers/gpu/drm/omapdrm/Kconfig           |  2 +-
 drivers/gpu/drm/omapdrm/omap_drv.c        | 12 +---------
 drivers/gpu/drm/omapdrm/omap_fbdev.c      | 16 +++++++++++--
 drivers/gpu/drm/omapdrm/omap_gem.c        | 24 +++++--------------
 drivers/gpu/drm/omapdrm/omap_gem.h        |  3 ---
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c |  7 +-----
 drivers/gpu/drm/tegra/Kconfig             |  2 +-
 drivers/gpu/drm/tegra/fbdev.c             |  5 ++--
 drivers/video/fbdev/Kconfig               |  8 +++++++
 include/linux/fb.h                        | 29 ++++++++++-------------
 14 files changed, 55 insertions(+), 66 deletions(-)

-- 
2.41.0

