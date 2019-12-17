Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 373A8122F48
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D9D6E9FE;
	Tue, 17 Dec 2019 14:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383596E9FE
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:52:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id E152B2926EE
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv5 00/34] Add AFBC support for Rockchip
Date: Tue, 17 Dec 2019 15:49:46 +0100
Message-Id: <20191217145020.14645-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213173350.GJ624164@phenom.ffwll.local>
References: <20191213173350.GJ624164@phenom.ffwll.local>
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
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds AFBC support for Rockchip. It is inspired by:

https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/factory-gru-9017.B-chromeos-4.4/drivers/gpu/drm/rockchip/rockchip_drm_vop.c

This is the fifth iteration of the afbc series. Between v3 and v4 a lot of
rework has been done, the main goal of which was to move all afbc-related
checks to helpers, so that core does not deal with it.

A new struct drm_afbc_framebuffer is added, which stores afbc-related
driver-specific data. Because of that, in drivers that wish to
use this feature, the struct must be allocated directly in the driver
code rather than inside helpers, so the first portion of the patchset
does the necessary refactoring.

Then, there are 3 users of afbc: komeda, malidp and, finally, rockchip,
the latter being the ultimate purpose of this work and the 3 subsequent
portions of the patchset move komeda and malidp to generic helpers and add
afbc support to rockchip.

The idea is to make all afbc users follow a similar pattern. In fb_create()
they allocate struct drm_afbc_framebuffer, do their specific checks which
can be done before object lookups, do object lookups and a special version
of a size check, which understands struct drm_afbc_framebuffer, followed
by any other driver-specific checks and initializing the gem object.
The helpers for the common parts are factored out so that drivers
can use them.

The komeda driver has been the farthest away from such a pattern, so it
required most changes. However, due to the fact that I don't have any
komeda hardware I did the changes to komeda in an incremental fashion with
a series of (usually) very small, easy to understand steps. malidp was
pretty straightforward, and rockchip's afbc checks follow the pattern.

I kindly ask for reviewing the series. I need to mention that my ultimate
goal is merging afbc for rockchip and I don't have other hardware, so some
help from malidp and komeda developers/maintainers would be appreciated.

@Liviu, @James, @Mihail, @Brian: a kind request to you to have a look and
test the patchset, as I don't have appropriate hardware.

Rebased onto drm-misc-next.

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
- coding style fixes** BLURB HERE ***


Andrzej Pietrasiewicz (34):
  drm/core: Add afbc helper functions
  drm/gem-fb-helper: Allow drivers to allocate struct drm_framebuffer on
    their own
  drm/gem-fb-helper: Add special version of drm_gem_fb_size_check
  drm/gem-fb-helper: Add generic afbc size checks
  drm/komeda: Use afbc helper
  drm/komeda: Move checking src coordinates to komeda_fb_create
  drm/komeda: Use the already available local variable
  drm/komeda: Retrieve drm_format_info once
  drm/komeda: Explicitly require 1 plane for AFBC
  drm/komeda: Move pitches comparison to komeda_fb_create
  drm/komeda: Provide and use komeda_fb_get_pixel_addr variant not
    requiring a fb
  drm/komeda: Factor out object lookups for non-afbc case
  drm/komeda: Make komeda_fb_none_size_check independent from
    framebuffer
  drm/komeda: Factor out object lookups for afbc case
  drm/komeda: Free komeda_fb_afbc_size_check from framebuffer dependency
  drm/komeda: Simplify error handling
  drm/komeda: Move object lookup before size checks
  drm/komeda: Move object assignments to framebuffer to after size
    checks
  drm/komeda: Make the size checks independent from framebuffer
    structure
  drm/komeda: Move helper invocation to after size checks
  drm/komeda: Use helper for common tasks
  drm/komeda: Use return value of drm_gem_fb_lookup
  drm/komeda: Use special helper for non-afbc size checks
  drm/komeda: Factor in the invocation of special helper
  drm/komeda: Use special helper for afbc case size check
  drm/komeda: Factor in the invocation of special helper, afbc case
  drm/komeda: Move special helper invocation outside if-else
  drm/komeda: Move to helper checking afbc buffer size
  drm/arm/malidp: Make verify funcitons invocations independent
  drm/arm/malidp: Integrate verify functions
  drm/arm/malidp: Factor in afbc framebuffer verification
  drm/arm/malidp: Use generic helpers for afbc checks
  drm/rockchip: Use helper for common task
  drm/rockchip: Add support for afbc

 .../arm/display/komeda/d71/d71_component.c    |   6 +-
 .../arm/display/komeda/komeda_framebuffer.c   | 273 ++++++++---------
 .../arm/display/komeda/komeda_framebuffer.h   |  21 +-
 .../display/komeda/komeda_pipeline_state.c    |  14 +-
 drivers/gpu/drm/arm/malidp_drv.c              | 155 ++++------
 drivers/gpu/drm/drm_fourcc.c                  |  53 ++++
 drivers/gpu/drm/drm_gem_framebuffer_helper.c  | 287 ++++++++++++++----
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c    | 111 ++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   | 147 ++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h   |  12 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c   |  83 ++++-
 include/drm/drm_fourcc.h                      |   4 +
 include/drm/drm_framebuffer.h                 |  50 +++
 include/drm/drm_gem_framebuffer_helper.h      |  34 +++
 14 files changed, 907 insertions(+), 343 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
