Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D345C66106A
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 18:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4EA10E334;
	Sat,  7 Jan 2023 17:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0F610E334
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 17:23:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1673112186; cv=none; d=zohomail.in; s=zohoarc; 
 b=ZFy+q049p8UEuEPlwDXLSBhORYee1fHz5vIC5YFIDIHKAIYB2mlBpbXKALEdKDggv//rqwuMTZRlAIq9jE0Wbb5iMv+x+DY7u6A1xzykoRGRRoop6dtED8s47sYJ1y/MCR9RdQk48cfviWfmANuLzouMtUu8/sW+f28ZH8iAjSQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1673112186;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=LQ0euilCDjdIw8PHHQBN/T3GJ1JHMeysvp36vyCGdN0=; 
 b=DWLwOl2sXhy4LxBTtMTiTTVDXWb0oH9zSVQNX2LS6ouUtH2+GGQ43kYQSwMHPMTYwNPo+NwoDxJNd9gxI9GRoWzPphBvVhFn10pA5YCf6rMCFQ2M6wDtiPA7CZTYI659O61TNEIA27r0U/1BrUMtA5I9bPz7k4l+DIhd889YlOo=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1673112186; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=LQ0euilCDjdIw8PHHQBN/T3GJ1JHMeysvp36vyCGdN0=;
 b=CSEa2zdWIdSoH8UQJEJNLY9CbEzzef4kNZb/kYcJxN7xX6Qf4BEwRjQ2QDnIWCjD
 wf4THJBGmlbzY+ZY3VGk3m2cAAtdalC/gldvTUiR7WxWDGVwZCexD+2oCv1yPMkcplT
 WjtluMqQEMsCfYwLGl2Hh3gayWjpFau0c5o0wXAM=
Received: from kampyooter.. (110.226.31.37 [110.226.31.37]) by mx.zoho.in
 with SMTPS id 167311218532819.422634393506428;
 Sat, 7 Jan 2023 22:53:05 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 Jim Cromie <jim.cromie@gmail.com>
Message-ID: <cover.1673110890.git.code@siddh.me>
Subject: [PATCH v5 00/10] drm: Remove usage of deprecated DRM_* macros
Date: Sat,  7 Jan 2023 22:52:20 +0530
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset aims to remove usages of deprecated DRM_* macros from the
files residing in drivers/gpu/drm root.

In process, I found out that NULL as first argument of drm_dbg_* wasn't
working, but it was listed as the alternative in deprecation comment,
so I fixed that before removing usages of DRM_DEBUG_* macros. Courtesy
discussion on v1, I added support for NULL in drm_()* macros too.

This patchset should be applied in order as changes might be dependent.

Please review and let me know if any errors are there, and hopefully
this gets accepted.

---
Changes in v5
- Make separate function instead of using boolean in _Generic (sravn on IRC=
).
- Also, simplified the Generic macro, and renamed the function and macro.

Changes in v4:
- Fix commit message for DRM_NOTE erroneously mentioning DRM_INFO.
- Rebased to drm-misc-next, as 723dad977acd added drm_dbg_core() to some
  files.
- Move Generic out to a separate macro __drm_get_dev_ptr, so that interface
  of drm_dbg_*() is also same as other drm_*() macros.
- Fix comment in __drm_get_dev_ptr (now ___drm_get_dev_ptr) to use correct
  name.

Changes in v3:
- Added support for NULL is __drm_printk and thus by extension to drm_()*.
- Thus, converted dropped pr_()* changes to drm_*(NULL, ...).
- Rebased to drm-misc-next and resulting appropriate changes.

Changes in v2:
- Removed conversions to pr_*() in DRM_INFO, DRM_NOTE, and DRM_ERROR change=
s.
- Due to above, DRM_NOTE usage cannot be removed and the patch is dropped.
- DRY: NULL support is now achieved by way of a separate function.

Siddh Raman Pant (10):
  drm/print: Fix and add support for NULL as first argument in drm_*
    macros
  drm: Remove usage of deprecated DRM_INFO
  drm: Remove usage of deprecated DRM_NOTE
  drm: Remove usage of deprecated DRM_ERROR
  drm: Remove usage of deprecated DRM_DEBUG
  drm: Remove usage of deprecated DRM_DEBUG_DRIVER
  drm: Remove usage of deprecated DRM_DEBUG_KMS
  drm: Remove usage of deprecated DRM_DEBUG_PRIME
  drm/drm_blend: Remove usage of deprecated DRM_DEBUG_ATOMIC
  drm/drm_lease: Remove usage of deprecated DRM_DEBUG_LEASE

 drivers/gpu/drm/drm_agpsupport.c        |   4 +-
 drivers/gpu/drm/drm_blend.c             |  13 ++-
 drivers/gpu/drm/drm_bridge.c            |   8 +-
 drivers/gpu/drm/drm_bufs.c              | 122 ++++++++++++------------
 drivers/gpu/drm/drm_client_modeset.c    | 118 +++++++++++++----------
 drivers/gpu/drm/drm_color_mgmt.c        |   4 +-
 drivers/gpu/drm/drm_connector.c         |  28 +++---
 drivers/gpu/drm/drm_context.c           |  18 ++--
 drivers/gpu/drm/drm_crtc.c              |  36 ++++---
 drivers/gpu/drm/drm_crtc_helper.c       |  62 ++++++------
 drivers/gpu/drm/drm_debugfs_crc.c       |   8 +-
 drivers/gpu/drm/drm_displayid.c         |   6 +-
 drivers/gpu/drm/drm_dma.c               |  10 +-
 drivers/gpu/drm/drm_drv.c               |  26 ++---
 drivers/gpu/drm/drm_edid.c              |  17 ++--
 drivers/gpu/drm/drm_flip_work.c         |   2 +-
 drivers/gpu/drm/drm_framebuffer.c       |   3 +-
 drivers/gpu/drm/drm_gem.c               |   7 +-
 drivers/gpu/drm/drm_gem_dma_helper.c    |   6 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c  |   6 +-
 drivers/gpu/drm/drm_hashtab.c           |  10 +-
 drivers/gpu/drm/drm_irq.c               |   4 +-
 drivers/gpu/drm/drm_kms_helper_common.c |   2 +-
 drivers/gpu/drm/drm_lease.c             |  68 ++++++-------
 drivers/gpu/drm/drm_legacy_misc.c       |   4 +-
 drivers/gpu/drm/drm_lock.c              |  36 +++----
 drivers/gpu/drm/drm_mipi_dbi.c          |  19 ++--
 drivers/gpu/drm/drm_mipi_dsi.c          |  12 +--
 drivers/gpu/drm/drm_mm.c                |   8 +-
 drivers/gpu/drm/drm_mode_config.c       |   2 +-
 drivers/gpu/drm/drm_mode_object.c       |   6 +-
 drivers/gpu/drm/drm_modes.c             |  36 +++----
 drivers/gpu/drm/drm_modeset_helper.c    |   2 +-
 drivers/gpu/drm/drm_pci.c               |  14 +--
 drivers/gpu/drm/drm_plane.c             |  46 ++++-----
 drivers/gpu/drm/drm_probe_helper.c      |  39 ++++----
 drivers/gpu/drm/drm_rect.c              |   4 +-
 drivers/gpu/drm/drm_scatter.c           |  19 ++--
 drivers/gpu/drm/drm_syncobj.c           |   2 +-
 drivers/gpu/drm/drm_sysfs.c             |  22 ++---
 drivers/gpu/drm/drm_vm.c                |  45 +++++----
 include/drm/drm_print.h                 | 111 +++++++++++++++------
 42 files changed, 551 insertions(+), 464 deletions(-)

--=20
2.39.0


