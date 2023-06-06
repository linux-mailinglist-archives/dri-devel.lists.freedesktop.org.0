Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD32E72584D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F403C10E462;
	Wed,  7 Jun 2023 08:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 907 seconds by postgrey-1.36 at gabe;
 Tue, 06 Jun 2023 11:00:46 UTC
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2D310E21E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 11:00:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1686048329; cv=none; d=zohomail.in; s=zohoarc; 
 b=SUUJfvwmR9ZlVVx6ic7ppJLDJSStuAva/Hg3kKZvJT/mzsF2pPGNNlnZR8VI6TIC5LLtDO18gcTb4W5+KtTa8LgasYY13PlbxVCjll3hX7Zjf10okfYO0owOn5mBSL5MD1xXOLCDD/zsjZMV6JwDyMtCXS2gT+xhmN93PcXJHBo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1686048329;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=R+uSifvcAIIkng6MgMYsizI9IW7hNDMBBna1u/nd3iQ=; 
 b=P6YshQCYFzSFPZrEsoiu+iLnzvzu1mxwut+2RZFBbfbcuG+FSrZtiFEAGy4z6EFkfmtP9iovw8eO3yEBhL+BxPOwYZ/wMZ5YxSpYBNp0b8M6knGwKZsqyya9BKkX/15P0Trj+hYpzpmwmIaFHPgmVYEH9u1wqqqXK1GrLhOH9vk=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686048329; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=R+uSifvcAIIkng6MgMYsizI9IW7hNDMBBna1u/nd3iQ=;
 b=BkEFf37VA2yFvCaLj3Q61WB5hjInoxrlo5/Z6uiZvT8y7G9CP5uaKLDpgFIPVw7k
 VEir34gmhvH/lR67T4KAtgPEt2bMJ/LpLRBQ03D4lQytF2sqr3i7BJ79HM8ftGGhH9n
 SXEsKdfQsEcsB9v/YKGXxhe4HMdWbZUeAfWfDMSk=
Received: from kampyooter.. (122.176.141.156 [122.176.141.156]) by mx.zoho.in
 with SMTPS id 168604832769234.06864649041506;
 Tue, 6 Jun 2023 16:15:27 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <cover.1686047727.git.code@siddh.me>
Subject: [PATCH v9 0/8] drm: Remove usage of deprecated DRM_* macros
Date: Tue,  6 Jun 2023 16:15:14 +0530
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Mailman-Approved-At: Wed, 07 Jun 2023 08:45:25 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset aims to remove usages of deprecated DRM_* macros from the
files residing in drivers/gpu/drm root.

In process, I found out that NULL as first argument of drm_dbg_* wasn't
working, but it was listed as the alternative in deprecation comment,
so I fixed that before removing usages of DRM_DEBUG_* macros.

Courtesy discussion on v1, I added support for NULL in drm_()* macros too.

Courtesy discussion on v7, I removed generic macro stuff meant to accomodat=
e
stuff like mipi_dsi_host, and instead reverted a commit which used the
drm_err() macro incorrectly by passing mipi_dsi_host.

This patchset should be applied in order as changes might be dependent.

Please review and let me know if any errors are there, and hopefully
this gets accepted.

---

v8 -> v9 (today):
- Rebased to drm-misc-next.

v7 -> v8 (28 Feb 2023):
- Reverted 1040e424353f ("drm: mipi-dsi: Convert logging to drm_* functions=
.")
  which used drm_err macro incorrectly by passing mipi_dsi_host.
- Thus, removed _Generic and allow only drm_device.

v6 -> v7 (26 Feb 2023):
- Rebased to drm-misc-next, accounting for the merger of last 3 patches
  in the previous series (4665280990fa, fc2602b553c8, 7bd224b6625a),
  and 7428ff70a18 ("drm: initialize accel framework").

v5 -> v6 (09 Jan 2023):
- Move drm_device to default case in _Generic as it is the default behaviou=
r.
- Fix incorrect const drm_device handling in _Generic.
- Minor positioning / comment changes.

v4 -> v5 (07 Jan 2023):
- Make separate function instead of using boolean in _Generic (sravn on IRC=
).
- Also, simplified the Generic macro, and renamed the function and macro.

v3 -> v4 (05 Jan 2023):
- Fix commit message for DRM_NOTE erroneously mentioning DRM_INFO.
- Rebased to drm-misc-next, as 723dad977acd added drm_dbg_core() to some
  files.
- Move Generic out to a separate macro __drm_get_dev_ptr, so that interface
  of drm_dbg_*() is also same as other drm_*() macros.
- Fix comment in __drm_get_dev_ptr (now ___drm_get_dev_ptr) to use correct
  name.

v2 -> v3 (26 Dec 2022):
- Added support for NULL in __drm_printk and thus by extension to drm_()*.
- Thus, converted dropped pr_()* changes to drm_*(NULL, ...).
- Rebased to drm-misc-next and resulting appropriate changes.

v1 (20 Dec 2022) -> v2 (22 Dec 2022):
- Removed conversions to pr_*() in DRM_INFO, DRM_NOTE, and DRM_ERROR change=
s.
- Due to above, DRM_NOTE usage cannot be removed and the patch is dropped.
- DRY: NULL support is now achieved by way of a separate function.

Siddh Raman Pant (8):
  Revert "drm: mipi-dsi: Convert logging to drm_* functions."
  drm/print: Fix and add support for NULL as first argument in drm_*
    macros
  drm: Remove usage of deprecated DRM_INFO
  drm: Remove usage of deprecated DRM_NOTE
  drm: Remove usage of deprecated DRM_ERROR
  drm: Remove usage of deprecated DRM_DEBUG
  drm: Remove usage of deprecated DRM_DEBUG_DRIVER
  drm: Remove usage of deprecated DRM_DEBUG_KMS

 drivers/gpu/drm/drm_agpsupport.c        |   4 +-
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
 drivers/gpu/drm/drm_drv.c               |  28 +++---
 drivers/gpu/drm/drm_edid.c              |  17 ++--
 drivers/gpu/drm/drm_flip_work.c         |   2 +-
 drivers/gpu/drm/drm_framebuffer.c       |   3 +-
 drivers/gpu/drm/drm_gem.c               |   7 +-
 drivers/gpu/drm/drm_gem_dma_helper.c    |   2 +-
 drivers/gpu/drm/drm_hashtab.c           |  10 +-
 drivers/gpu/drm/drm_irq.c               |   4 +-
 drivers/gpu/drm/drm_kms_helper_common.c |   2 +-
 drivers/gpu/drm/drm_lease.c             |   4 +-
 drivers/gpu/drm/drm_legacy_misc.c       |   4 +-
 drivers/gpu/drm/drm_lock.c              |  36 +++----
 drivers/gpu/drm/drm_mipi_dbi.c          |  19 ++--
 drivers/gpu/drm/drm_mipi_dsi.c          |  15 +--
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
 include/drm/drm_print.h                 |  81 ++++++++++------
 40 files changed, 480 insertions(+), 423 deletions(-)

--=20
2.39.2


