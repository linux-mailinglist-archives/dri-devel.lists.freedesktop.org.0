Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE051983A7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 20:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF736E198;
	Mon, 30 Mar 2020 18:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33C16E198;
 Mon, 30 Mar 2020 18:48:15 +0000 (UTC)
IronPort-SDR: 58w2iK9ZZs4CgEV1ynvnG8G+vyKHgpaUIwRAIcrJgbkWhkxcQ3TEvGcQ13A8qWLHb4QQTifVL2
 qK4qYytyNhKQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 11:48:14 -0700
IronPort-SDR: Qqp1hwkXNa4EiHzYA/yU4LUpeRHJGhRwitz8twTnoL8DlBxLrT1TmtYKcQ+rOhmcwvWTGfhI+z
 sb+3zWGva5Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,325,1580803200"; d="scan'208";a="267012962"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by orsmga002.jf.intel.com with ESMTP; 30 Mar 2020 11:48:10 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, daniels@collabora.com
Subject: [PATCH v3 0/5] Introduce drm scaling filter property
Date: Tue, 31 Mar 2020 00:08:52 +0530
Message-Id: <20200330183857.13270-1-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is the continuation for the RFC that I posted earlier [1]

[1] RFC: https://patchwork.freedesktop.org/series/73884/

Integer scaling (IS) is a nearest-neighbor upscaling technique that
simply scales up the existing pixels by an integer (i.e., whole
number) multiplier. Nearest-neighbor (NN) interpolation works by
filling in the missing color values in the upscaled image with that of
the coordinate-mapped nearest source pixel value.

Both IS and NN preserve the clarity of the original image. In
contrast, traditional upscaling algorithms, such as bilinear or
bicubic interpolation, result in blurry upscaled images because they
employ interpolation techniques that smooth out the transition from
one pixel to another.  Therefore, integer scaling is particularly
useful for pixel art games that rely on sharp, blocky images to
deliver their distinctive look.

Many gaming communities have been asking for integer-mode scaling
support, some links and background:

https://software.intel.com/en-us/articles/integer-scaling-support-on-intel-graphics
http://tanalin.com/en/articles/lossless-scaling/
https://community.amd.com/thread/209107
https://www.nvidia.com/en-us/geforce/forums/game-ready-drivers/13/1002/feature-request-nonblurry-upscaling-at-integer-rat/

This patch series -
  - Introduces new scaling filter properties to allow userspace to
    select  the driver's default scaling filter or
    Nearest-neighbor(NN) filter for scaling operations on crtc and plane.
  - Implements and enable integer scaling for i915

Userspace patch series link: https://github.com/lrusak/xbmc/pull/24 

Thanks to Shashank for initiating this work. His initial work can be
found here [2]

[2] https://patchwork.freedesktop.org/patch/337082/

changes since v2:
* Add per-crtc and per-plane scaling filter property (Ville)
* Rename/refoctor functions and macros.
* Duplicate the scaling filter in crtc and plane hw state (Ville)
 
changes since v1: 
* Add userspace patch link to this cover letter.
* 4/5 - Rearrange skl_scaler_setup_nearest_neighbor_filter() to iterate
  the registers directly instead of the phases and taps (Ville)

Pankaj Bharadiya (5):
  drm: Introduce plane and CRTC scaling filter properties
  drm/drm-kms.rst: Add plane and CRTC scaling filter property
    documentation
  drm/i915: Introduce scaling filter related registers and bit fields.
  drm/i915/display: Add Nearest-neighbor based integer scaling support
  drm/i915: Enable scaling filter for plane and CRTC

 Documentation/gpu/drm-kms.rst                 |  12 ++
 drivers/gpu/drm/drm_atomic_uapi.c             |   8 ++
 drivers/gpu/drm/drm_crtc.c                    |  78 ++++++++++++
 drivers/gpu/drm/drm_plane.c                   |  78 ++++++++++++
 .../gpu/drm/i915/display/intel_atomic_plane.c |   1 +
 drivers/gpu/drm/i915/display/intel_display.c  | 116 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_display.h  |   4 +
 .../drm/i915/display/intel_display_types.h    |   2 +
 drivers/gpu/drm/i915/display/intel_sprite.c   |  15 ++-
 drivers/gpu/drm/i915/i915_reg.h               |  22 ++++
 include/drm/drm_crtc.h                        |  16 +++
 include/drm/drm_plane.h                       |  21 ++++
 12 files changed, 369 insertions(+), 4 deletions(-)

-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
