Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5135781DA2
	for <lists+dri-devel@lfdr.de>; Sun, 20 Aug 2023 13:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C3410E13A;
	Sun, 20 Aug 2023 11:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27CE10E13B
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 11:56:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1692531655; cv=none; d=zohomail.in; s=zohoarc; 
 b=WCvoID1a9v2myWUiDiY3J3tTU56MHS2BnO/rzaZdhAHkXfAynJPbcRKadnaP1M6Frgo61R77GDpYdzu8b6MpkvRzVIAXhkrDLwwHnH0/RLQzguHrjiNbAxkTG/u2SqY2pbIWStXnRbq7HlUNwtBMY4U7xiDkOlFhSsuPMsP+GYs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1692531655;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=3hxbbBFuZstlYPg2W9Ussjf6EOSGFJd2ISQTxFwkPYk=; 
 b=CRHEzXwSGj1Ty0kYfh4A1Ki58sE4o3kjNrSpcrabMdX16LTRkoCs769lGUK2TukHU6kecnJ+/Qw9ybHz4Av9TX3eipqBZtoYVpFyKEhQ3fREfNrGOrEU3Gmx/atpWZrQiKQjLrME0vPNhGaXe5bYkY7fzAJGV2Jxdj/uHDLtRvo=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1692531655; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=3hxbbBFuZstlYPg2W9Ussjf6EOSGFJd2ISQTxFwkPYk=;
 b=SpeXrBzmf1D2b3Z6PuOY4pXA+D8IoLQxaBXFOiLOLbF5o4843qTgoc3T+lXwCVE0
 sS+7nTs8JlsceJyghWg/iqu3BbsxyL0pKUsPaks4AuAsfk/Gei7l4arcTolVttKhH1J
 KFbSysaLwhtJTEjp/zsW+xK5zRqMCJZO2g+Kdx4Q=
Received: from kampyooter.. (110.226.17.164 [110.226.17.164]) by mx.zoho.in
 with SMTPS id 169253165428199.21079002858937;
 Sun, 20 Aug 2023 17:10:54 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <cover.1692531217.git.code@siddh.me>
Subject: [PATCH v11 0/8] drm: Remove usage of deprecated DRM_* macros in DRM
 core
Date: Sun, 20 Aug 2023 17:10:36 +0530
X-Mailer: git-send-email 2.40.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset aims to completely remove usages of deprecated DRM_* macros
from the DRM core (i.e. drivers/gpu/drm/*.c).

This patchset should be applied in order as changes are dependent.

Thanks,
Siddh

---

v10 -> v11 (today):
- Rebased to drm-misc-next.
- Dropped the last patch removing print statements.

v9 -> v10 (7 Jun 2023)
- Picked up rb's from Laurent Pinchart.
- Clarified commit message to point out the changes are in DRM core.
- Remove superfluous print messages after the changes.
- Link: https://lore.kernel.org/all/cover.1686075579.git.code@siddh.me/

---

Siddh Raman Pant (8):
  Revert "drm: mipi-dsi: Convert logging to drm_* functions."
  drm/print: Fix and add support for NULL as first argument in drm_*
    macros
  drm: Remove usage of deprecated DRM_INFO in DRM core
  drm: Remove usage of deprecated DRM_NOTE in DRM core
  drm: Remove usage of deprecated DRM_ERROR in DRM core
  drm: Remove usage of deprecated DRM_DEBUG in DRM core
  drm: Remove usage of deprecated DRM_DEBUG_DRIVER in DRM core
  drm: Remove usage of deprecated DRM_DEBUG_KMS in DRM core

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
 drivers/gpu/drm/drm_sysfs.c             |  20 ++--
 drivers/gpu/drm/drm_vm.c                |  45 +++++----
 include/drm/drm_print.h                 |  81 ++++++++++------
 40 files changed, 479 insertions(+), 422 deletions(-)

--=20
2.40.1


