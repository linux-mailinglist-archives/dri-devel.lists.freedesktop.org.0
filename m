Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E92230858
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 13:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8156E264;
	Tue, 28 Jul 2020 11:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEBE6E264;
 Tue, 28 Jul 2020 11:04:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E0F67AC82;
 Tue, 28 Jul 2020 11:04:58 +0000 (UTC)
Date: Tue, 28 Jul 2020 13:04:46 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20200728110446.GA8076@linux-uq9g>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's this week's PR for drm-misc-fixes. It's mostly driver stuff.
There's one fix in the GEM ioctl code, but it has no impact on the
UAPI.

Best regards
Thomas

drm-misc-fixes-2020-07-28:
 * drm: fix possible use-after-free
 * dbi: fix SPI Type 1 transfer
 * drm_fb_helper: use memcpy_io on bochs' sparc64
 * mcde: fix stability
 * panel: fix display noise on auo,kd101n80-45na
 * panel: delay HPD checks for boe_nv133fhm_n61
 * bridge: drop connector check in nwl-dsi bridge
 * bridge: set proper bridge type for adv7511
 * of: fix a double free
The following changes since commit f3f90c6db188d437add55aaffadd5ad5bcb8cda6:

  drm/lima: fix wait pp reset timeout (2020-07-20 08:46:06 +0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-07-28

for you to fetch changes up to 8490d6a7e0a0a6fab5c2d82d57a3937306660864:

  drm: hold gem reference until object is no longer accessed (2020-07-27 22=
:05:51 +0200)

----------------------------------------------------------------
 * drm: fix possible use-after-free
 * dbi: fix SPI Type 1 transfer
 * drm_fb_helper: use memcpy_io on bochs' sparc64
 * mcde: fix stability
 * panel: fix display noise on auo,kd101n80-45na
 * panel: delay HPD checks for boe_nv133fhm_n61
 * bridge: drop connector check in nwl-dsi bridge
 * bridge: set proper bridge type for adv7511
 * of: fix a double free

----------------------------------------------------------------
Biju Das (1):
      drm: of: Fix double-free bug

Douglas Anderson (1):
      drm: panel: simple: Delay HPD checking on boe_nv133fhm_n61 for 15 ms

Guido G=FCnther (1):
      drm/bridge: nwl-dsi: Drop DRM_BRIDGE_ATTACH_NO_CONNECTOR check.

Jitao Shi (1):
      drm/panel: Fix auo, kd101n80-45na horizontal noise on edges of panel

Laurentiu Palcu (1):
      drm/bridge/adv7511: set the bridge type properly

Linus Walleij (1):
      drm/mcde: Fix stability issue

Paul Cercueil (1):
      drm/dbi: Fix SPI Type 1 (9-bit) transfer

Sam Ravnborg (1):
      drm/drm_fb_helper: fix fbdev with sparc64

Steve Cohen (1):
      drm: hold gem reference until object is no longer accessed

 drivers/gpu/drm/bochs/bochs_kms.c              |  1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c   |  1 +
 drivers/gpu/drm/bridge/nwl-dsi.c               |  5 -----
 drivers/gpu/drm/drm_fb_helper.c                |  6 +++++-
 drivers/gpu/drm/drm_gem.c                      | 10 ++++------
 drivers/gpu/drm/drm_mipi_dbi.c                 |  2 +-
 drivers/gpu/drm/drm_of.c                       |  4 +---
 drivers/gpu/drm/mcde/mcde_display.c            | 11 ++++++++---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c |  6 +++---
 drivers/gpu/drm/panel/panel-simple.c           | 16 +++++++++++++++-
 include/drm/drm_mode_config.h                  | 12 ++++++++++++
 11 files changed, 51 insertions(+), 23 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
