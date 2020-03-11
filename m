Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D1D181BCC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 15:55:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BAE6E996;
	Wed, 11 Mar 2020 14:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5D46E996
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 14:55:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 30C3B28A9BC
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv7 0/6] Add AFBC support for Rockchip
Date: Wed, 11 Mar 2020 15:55:35 +0100
Message-Id: <20200311145541.29186-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Sandy Huang <hjc@rock-chips.com>,
 James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds AFBC support for Rockchip. It is inspired by:

https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/factory-gru-9017.B-chromeos-4.4/drivers/gpu/drm/rockchip/rockchip_drm_vop.c

This is the seventh iteration of the afbc series, which addresses
comments received for v6.

Compared to v5 it simplifies the way afbc-related helpers are
exposed to their users.

A new struct drm_afbc_framebuffer is added, which stores afbc-related
driver-specific data. Interested drivers need to explicitly allocate
an instance of struct drm_afbc_framebuffer, use drm_gem_fb_init_with_funcs()
call drm_gem_fb_afbc_init() and do their specific afbc-related checks.

There are 3 interested drivers: malidp, komeda and rockchip and I only have
rockchip hardware. As Liviu reports, due to the coronavirus outbreak,
it is difficult to test komeda now, so, according to his suggestion,
I purposedly omit changes to komeda. Malidp is changed accordingly, though,
which is a proof that it can be done. Then adding afbc support for rockchip
follows the malidp example.

I kindly ask for reviewing the series. I need to mention that my ultimate
goal is merging afbc for rockchip and I don't have other hardware, so some
help from malidp developers/maintainers would be appreciated.

Rebased onto drm-misc-next.

v6..v7:
- used IS_ERR() instead of IS_ERR_OR_NULL() (Emil)
- made drm_gem_fb_afbc_init() symmetric in terms of not putting the objects
in case of error, it is now caller's responsibility (Emil)
- added an entry in Documentation/gpu/todo.rst about drivers not encoding
cpp in their format info (Emil)
- sticked to the 80 columns per line rule wherever possible, excluding
error messages so that they can be grepped (Emil)
- removed redundant WARN_ON() in rockchip_mod_supported() (Emil)
- made drm_gem_fb_init() and drm_gem_fb_init_with_funcs() return an int (James)
- factored in drm_afbc_get_superblock_wh() (James)
- eliminated unknown types error for u32/u64 (kbuild)

v5..v6:
- reworked the way afbc-specific helpers are exposed to drivers (Daniel)
- not checking block size mask in drm_is_afbc (James)
- fixed the test for afbc format (Boris)
- documented unused afbc format modifier values in drm_afbc_get_superblock_wh()
(Boris)
- changed drm_is_afbc to a macro
- renamed drm_gem_fb_lookup() to drm_gem_fb_objs_lookup() (James)
- eliminated storing block/tile alignment constraint in
 struct drm_afbc_framebuffer (James)
- eliminated storing afbc header alignment constraint
 in struct drm_afbc_framebuffer (James)
- eliminated storing afbc payload's offset in struct
drm_afbc_framebuffer (James)
- moved to taking bpp value from drm_format_info except malidp which doesn't
set it properly (James)
- removed unrelated coding style fixes in rockchip (Boris)
- consolidated 2-line error messages into one-liners in rockchip (Boris)
- added checking that there is at most one AFBC plane in
vop_crtc_atomic_check() (Boris)
- added checking that AFBC format is indeed supported in
rockchip_mod_supported() (Boris)
- removed requirement of exactly one color plane in rockchip_mod_supported()
- removed afbc_win hack in rockchip in favor of adding a field to crtc state
and ensuring only one AFBC plane in crtc's atomic check (Boris)

v4..v5:
- used proper way of subclassing drm_framebuffer (Daniel Vetter)
- added documentation to exported functions (Liviu Dudau)
- reordered new functions in drm_gem_framebuffer_helper.c to make a saner
diff (Liviu Dudau)
- used "2" suffix instead of "_special" for the special version of size
checks (Liviu Dudau)
- dropped unnecessarily added condition in drm_get_format_info() (Liviu
Dudau)
- dropped "block_size = 0;" trick in framebuffer_check() (Daniel Vetter)
- relaxed sticking to 80 characters per line rule in some cases

v3..v4:

- addressed (some) comments from Daniel Stone, Ezequiel Garcia, Daniel
Vetter and James Qian Wang - thank you for input
- refactored helpers to ease accommodating drivers with afbc needs
- moved afbc checks to helpers
- converted komeda, malidp and (the newly added) rockchip to use the afbc
helpers
- eliminated a separate, dedicated source code file

v2..v3:

- addressed (some) comments from Daniel Stone, Liviu Dudau, Daniel Vetter
and Brian Starkey - thank you all

In this iteration some rework has been done. The checking logic is now moved
to framebuffer_check() so it is common to all drivers. But the common part
is not good for komeda, so this series is not good for merging yet.
I kindly ask for feedback whether the changes are in the right direction.
I also kindly ask for input on how to accommodate komeda.

The CONFIG_DRM_AFBC option has been eliminated in favour of adding
drm_afbc.c to drm_kms_helper.

v1..v2:

- addressed comments from Daniel Stone, Ayan Halder, Mihail Atanassov
- coding style fixes

Andrzej Pietrasiewicz (6):
  drm/core: Allow drivers allocate a subclass of struct drm_framebuffer
  drm/core: Add drm_afbc_framebuffer and a corresponding helper
  drm/arm/malidp: Factor-in framebuffer creation
  drm/arm/malidp: Allocate an afbc-specific drm_framebuffer
  drm/arm/malidp: Switch to afbc helpers
  drm/rockchip: Add support for afbc

 Documentation/gpu/todo.rst                   |  15 ++
 drivers/gpu/drm/arm/malidp_drv.c             | 151 ++++++--------
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 195 ++++++++++++++++---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h  |   1 +
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c   |  43 +++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c  | 137 ++++++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h  |  17 ++
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c  |  83 +++++++-
 include/drm/drm_framebuffer.h                |  45 +++++
 include/drm/drm_gem_framebuffer_helper.h     |  15 ++
 10 files changed, 580 insertions(+), 122 deletions(-)


base-commit: 41252c6d1c3bc640c3283a797400719fbe7dcec1
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
