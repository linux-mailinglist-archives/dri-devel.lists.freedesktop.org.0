Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C4C2B0642
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 14:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67F86E102;
	Thu, 12 Nov 2020 13:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45956E102;
 Thu, 12 Nov 2020 13:21:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 61F1EAC75;
 Thu, 12 Nov 2020 13:21:28 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH 0/7] drm/radeon: Convert to generic fbdev emulation
Date: Thu, 12 Nov 2020 14:21:10 +0100
Message-Id: <20201112132117.27228-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset replaces radeon's framebuffer emulation with the generic
code from fb helpers. This reduces the driver size and complexity. As
a nice side effect, it also reduces memory pressure on low-memory devices.

Patches #1 and #2 add features to fbdev emulation to bring it on par with
radeons code.

Patch #4 adds internal pinning to vmap operations. This guarantess that
the framebuffer BO is not relocated while being updated.

Patch #5 and #6 replace radeon's framebuffer code with the generic helper
with shadow buffering. All userspace mappings interact with the shadow
buffer and the BO can be relocated an necessary. This allows to enable
32-bit colors on low-memory devices.

Patches #3 and #7 are merely cleanups.

Smoke tested with an AMD R5 (Oland) card by running the console and
switching to/from Xorg and weston.

Thomas Zimmermann (7):
  drm/fb-helper: Set framebuffer for vga-switcheroo clients
  drm/fb-helper: Add hint to enable VT switching during suspend/resume
  drm/radeon: Whitespace fixes
  drm/radeon: Pin buffers while they are vmap'ed
  drm/radeon: Replace framebuffer console with generic implementation
  drm/radeon: Use fbdev shadow fb
  drm/radeon: Move radeon_align_pitch() next to its only caller

 drivers/gpu/drm/drm_fb_helper.c         |  16 +-
 drivers/gpu/drm/radeon/radeon_device.c  |  11 +-
 drivers/gpu/drm/radeon/radeon_display.c |   2 -
 drivers/gpu/drm/radeon/radeon_drv.c     |   5 +-
 drivers/gpu/drm/radeon/radeon_fb.c      | 366 +-----------------------
 drivers/gpu/drm/radeon/radeon_gem.c     |  77 ++++-
 drivers/gpu/drm/radeon/radeon_kms.c     |  14 +-
 drivers/gpu/drm/radeon/radeon_mode.h    |  10 +-
 include/drm/drm_mode_config.h           |   7 +
 9 files changed, 111 insertions(+), 397 deletions(-)

--
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
