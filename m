Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7489F7F45FA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 13:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03BB10E607;
	Wed, 22 Nov 2023 12:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D350610E021
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 12:24:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 94A0721940;
 Wed, 22 Nov 2023 12:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700655892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mRPyyn+WOYbdAkfK/0Dd9ZDvv/5PnVqCkJgLYnb52lo=;
 b=FJiQIZjD+2Vq4jf2jbMBZxFdgoTEdIWv+nk91sVIQxFjTDRKwKuD5Uwb/wM6cvwym1BEZC
 /SMJiGgmVZbME8qmybJG1miPUDsv0SmFSAjdS22jDPVGCgbGjwhhZuscVyITIcezOFhl+0
 Sn/P3JozJegFYGyBN+xCLhYT9qFm4gE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700655892;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mRPyyn+WOYbdAkfK/0Dd9ZDvv/5PnVqCkJgLYnb52lo=;
 b=G4cEkFt+lwOdCqSCiz5Ni/q/BRYVhNotl6cs+uOAoYwHCCBYsyCTlY15rtEZzUYVa6EnWo
 oSCSS7Mk7viR+TDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60C6813461;
 Wed, 22 Nov 2023 12:24:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mX20FhTzXWU2TAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Nov 2023 12:24:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, cai.huoqing@linux.dev
Subject: [PATCH 00/14] drm: Remove infrastructure for user-space mode setting
Date: Wed, 22 Nov 2023 13:09:29 +0100
Message-ID: <20231122122449.11588-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[7];
 MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,linux.dev];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The old drivers for user-space mode setting have been removed in Linux
v6.3. No one has complained or requested their return. It is time to
remove these drivers' infrastructure from the DRM core.

The recent Linux v6.6 has been designated as long-term release, [1] so
any remaining users have a few more years to get a new graphics card. The
legacy devices continue to be supported via simpledrm. Merging proper
drivers with kernel mode setting is also an option.

Patches 1 to 7 fix a few trivial issues that have been forgotten during
the removal of the drivers.

Patches 8 and 9 remove the leagcy ioctl interfaces. One op is different
from the others, so it gets its own patch.

Patches 10 to 12 remove the legacy source code from DRM. With that gone
patch 13, the AGP code can be simplified as well. There used to be
a device file for user-space mode setting, /dev/agpgart, that is now
obsolete.

Patch 14 removes the option from Kconfig.

[1] https://kernel.org/category/releases.html

Thomas Zimmermann (14):
  arch/powerpc: Remove legacy DRM drivers from default configs
  drm: Fix TODO list mentioning non-KMS drivers
  drm: Include <drm/drm_auth.h>
  drm/i915: Include <drm/drm_auth.h>
  accel: Include <drm/drm_auth.h>
  drm: Include <drm/drm_device.h>
  drm/radeon: Do not include <drm/drm_legacy.h>
  drm: Remove entry points for legacy ioctls
  drm: Remove the legacy DRM_IOCTL_MODESET_CTL ioctl
  drm: Remove support for legacy drivers
  drm: Remove locking for legacy ioctls and DRM_UNLOCKED
  drm: Remove source code for non-KMS drivers
  char/agp: Remove frontend code
  drm: Remove Kconfig option for legacy support (CONFIG_DRM_LEGACY)

 Documentation/gpu/todo.rst                    |    7 +-
 arch/powerpc/configs/pmac32_defconfig         |    2 -
 arch/powerpc/configs/ppc6xx_defconfig         |    7 -
 drivers/accel/drm_accel.c                     |    1 +
 drivers/char/agp/Makefile                     |    6 -
 drivers/char/agp/agp.h                        |    9 -
 drivers/char/agp/backend.c                    |   11 -
 drivers/char/agp/compat_ioctl.c               |  291 ---
 drivers/char/agp/compat_ioctl.h               |  106 --
 drivers/char/agp/frontend.c                   | 1068 -----------
 drivers/gpu/drm/Kconfig                       |   21 -
 drivers/gpu/drm/Makefile                      |   12 -
 drivers/gpu/drm/drm_agpsupport.c              |  451 -----
 drivers/gpu/drm/drm_auth.c                    |    8 +-
 drivers/gpu/drm/drm_bufs.c                    | 1627 -----------------
 drivers/gpu/drm/drm_context.c                 |  513 ------
 drivers/gpu/drm/drm_dma.c                     |  178 --
 drivers/gpu/drm/drm_drv.c                     |   17 -
 drivers/gpu/drm/drm_file.c                    |   64 +-
 drivers/gpu/drm/drm_hashtab.c                 |  203 --
 drivers/gpu/drm/drm_internal.h                |    7 -
 drivers/gpu/drm/drm_ioc32.c                   |  613 +------
 drivers/gpu/drm/drm_ioctl.c                   |   82 +-
 drivers/gpu/drm/drm_irq.c                     |  204 ---
 drivers/gpu/drm/drm_legacy.h                  |  290 ---
 drivers/gpu/drm/drm_legacy_misc.c             |  105 --
 drivers/gpu/drm/drm_lock.c                    |  373 ----
 drivers/gpu/drm/drm_memory.c                  |  138 --
 drivers/gpu/drm/drm_pci.c                     |  204 +--
 drivers/gpu/drm/drm_scatter.c                 |  220 ---
 drivers/gpu/drm/drm_vblank.c                  |  101 -
 drivers/gpu/drm/drm_vm.c                      |  665 -------
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |    1 +
 drivers/gpu/drm/radeon/radeon_drv.h           |    1 -
 include/drm/drm_auth.h                        |   22 -
 include/drm/drm_device.h                      |   71 +-
 include/drm/drm_drv.h                         |   19 -
 include/drm/drm_file.h                        |    5 -
 include/drm/drm_ioctl.h                       |   11 -
 include/drm/drm_legacy.h                      |  331 ----
 40 files changed, 20 insertions(+), 8045 deletions(-)
 delete mode 100644 drivers/char/agp/compat_ioctl.c
 delete mode 100644 drivers/char/agp/compat_ioctl.h
 delete mode 100644 drivers/char/agp/frontend.c
 delete mode 100644 drivers/gpu/drm/drm_agpsupport.c
 delete mode 100644 drivers/gpu/drm/drm_bufs.c
 delete mode 100644 drivers/gpu/drm/drm_context.c
 delete mode 100644 drivers/gpu/drm/drm_dma.c
 delete mode 100644 drivers/gpu/drm/drm_hashtab.c
 delete mode 100644 drivers/gpu/drm/drm_irq.c
 delete mode 100644 drivers/gpu/drm/drm_legacy.h
 delete mode 100644 drivers/gpu/drm/drm_legacy_misc.c
 delete mode 100644 drivers/gpu/drm/drm_lock.c
 delete mode 100644 drivers/gpu/drm/drm_memory.c
 delete mode 100644 drivers/gpu/drm/drm_scatter.c
 delete mode 100644 drivers/gpu/drm/drm_vm.c
 delete mode 100644 include/drm/drm_legacy.h

-- 
2.42.1

