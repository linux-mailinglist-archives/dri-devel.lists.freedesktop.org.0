Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F3E239E56
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 06:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4226E112;
	Mon,  3 Aug 2020 04:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB5E89DFC;
 Mon,  3 Aug 2020 04:34:38 +0000 (UTC)
IronPort-SDR: TiVq+omSaxYjaQehOA9eiLHJufD3qT9nrrJFTLsNTNasYZmQ1hEwOF66KsWrc+2Md3H7T8lYMO
 VQ9bneMZkkgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="151248499"
X-IronPort-AV: E=Sophos;i="5.75,428,1589266800"; d="scan'208";a="151248499"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 21:34:37 -0700
IronPort-SDR: Xvufpy/50NWvjwQfJQXk+j5OG54+DjOh+7UGmYZsHWombfm/n/48v/Ee1d/OApjppSupOY6KFl
 lQrIcr/tDyTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,428,1589266800"; d="scan'208";a="314528971"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga004.fm.intel.com with ESMTP; 02 Aug 2020 21:34:34 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, daniels@collabora.com,
 sameer.lattannavar@intel.com
Subject: [PATCH v5 0/5] Introduce drm scaling filter property
Date: Mon,  3 Aug 2020 09:59:48 +0530
Message-Id: <20200803042953.7626-1-pankaj.laxminarayan.bharadiya@intel.com>
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

Earlier, I kept this series on hold since we wanted to have a 
reference userspace implementation in place.

Now, Sameer has implemented Integer scaling in Kodi Retro gaming
framework which demonstrate how Integer scaling gives distinctive
look to pixel art games when played on higher resolution monitors. 

Kodi patches are almost reviewed and closer to merge now.
Here is the userspace patch series link:
https://github.com/xbmc/xbmc/pull/18194

Background on Integer scaling:

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

* Changes in v5:
 - Rebase to latest drm-tip.

Pankaj Bharadiya (5):
  drm: Introduce plane and CRTC scaling filter properties
  drm/drm-kms.rst: Add plane and CRTC scaling filter property
    documentation
  drm/i915: Introduce scaling filter related registers and bit fields.
  drm/i915/display: Add Nearest-neighbor based integer scaling support
  drm/i915: Enable scaling filter for plane and CRTC

 Documentation/gpu/drm-kms.rst                 |  12 ++
 drivers/gpu/drm/drm_atomic_uapi.c             |   8 ++
 drivers/gpu/drm/drm_crtc.c                    |  48 +++++++
 drivers/gpu/drm/drm_crtc_internal.h           |   3 +
 drivers/gpu/drm/drm_plane.c                   |  90 ++++++++++++++
 .../gpu/drm/i915/display/intel_atomic_plane.c |   1 +
 drivers/gpu/drm/i915/display/intel_display.c  | 117 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_display.h  |   4 +
 .../drm/i915/display/intel_display_types.h    |   2 +
 drivers/gpu/drm/i915/display/intel_sprite.c   |  15 ++-
 drivers/gpu/drm/i915/i915_reg.h               |  22 ++++
 include/drm/drm_crtc.h                        |  16 +++
 include/drm/drm_plane.h                       |  21 ++++
 13 files changed, 355 insertions(+), 4 deletions(-)

-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
