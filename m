Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68424873F1C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13E711341A;
	Wed,  6 Mar 2024 18:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n7fn2KtJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00806113419;
 Wed,  6 Mar 2024 18:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709749896; x=1741285896;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0NjzrzYsB+G6nld/ESlRoRFT69ZVSxWjBZ9EHeOGscY=;
 b=n7fn2KtJXVUU34iK/owMrt9Ho/V8O7WPaArM5S/2EWAW8eO4EiR3m/op
 hg6l5c8qW7iNkp/UgL224AOiLXaTyO3ql7BwP7wjtRQsWfPM3yAE0sJU7
 aVT+5XMT5yBHya6/wdKxDhvu4nV70i57tSJdU3bhZ/zIBY9D7tpM28e5q
 EE2/MKFMVfHT+DDXrWzyOwa4FjTPz3WhmIWYaympS+GQRjGghRXXSCR1h
 a4IynjLsFnyBwBpG206KlRaueKy1jOOex0WgVAmnCIcIz73iOjlCSq/M2
 tXFJGkv8Pjltcses52y9jkJiEItlyiMKpII+HK4/iaGgEye9Qoc+X0bOf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15102538"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="15102538"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:31:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="14415709"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:31:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 00/22] drm: fix headers, add header test facility
Date: Wed,  6 Mar 2024 20:31:05 +0200
Message-Id: <cover.1709749576.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

First, fix a bunch of issues in drm headers, uncovered with the last
patch. A few kernel-doc warnings are just brushed under the carpet for
now, with a FIXME comment. Otherwise, pretty straightforward stuff.

Second, add a header test facility to catch issues at build time when
CONFIG_DRM_HEADER_TEST=y. This is the last patch, and I think needs
Masahiro's ack.

BR,
Jani.


Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>

Jani Nikula (22):
  drm/crtc: make drm_crtc_internal.h self-contained
  drm: add missing header guards to drm_internal.h
  drm/kunit: fix drm_kunit_helpers.h kernel-doc
  drm/amdgpu: make amd_asic_type.h self-contained
  drm: bridge: samsung-dsim: make samsung-dsim.h self-contained
  drm/dp_mst: fix drm_dp_mst_helper.h kernel-doc
  drm/crc: make drm_debugfs_crc.h self-contained and fix kernel-doc
  drm/encoder: silence drm_encoder_slave.h kernel-doc
  drm: fix drm_format_helper.h kernel-doc warnings
  drm/lease: make drm_lease.h self-contained
  drm: fix drm_gem_vram_helper.h kernel-doc
  drm/of: make drm_of.h self-contained
  drm/i2c: silence ch7006.h and sil164.h kernel-doc warnings
  drm/suballoc: fix drm_suballoc.h kernel-doc
  drm/i915: fix i915_gsc_proxy_mei_interface.h kernel-doc
  drm/i915/hdcp: fix i915_hdcp_interface.h kernel-doc warnings
  drm/i915/pxp: fix i915_pxp_tee_interface.h kernel-doc warnings
  drm/ttm: fix ttm_bo.h kernel-doc warnings
  drm/ttm: make ttm_caching.h self-contained
  drm/ttm: fix ttm_execbuf_util.h kernel-doc warnings
  drm/ttm: fix ttm_kmap_iter.h kernel-doc warnings
  drm: ensure drm headers are self-contained and pass kernel-doc

 Kbuild                                     |  1 +
 drivers/gpu/drm/Kconfig                    | 11 +++++++++++
 drivers/gpu/drm/Makefile                   | 18 ++++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h        |  1 +
 drivers/gpu/drm/drm_internal.h             |  5 +++++
 include/Kbuild                             |  1 +
 include/drm/Makefile                       | 18 ++++++++++++++++++
 include/drm/amd_asic_type.h                |  3 +++
 include/drm/bridge/samsung-dsim.h          |  4 +++-
 include/drm/display/drm_dp_mst_helper.h    |  1 -
 include/drm/drm_debugfs_crc.h              |  8 +++++++-
 include/drm/drm_encoder_slave.h            |  3 +++
 include/drm/drm_format_helper.h            |  1 +
 include/drm/drm_gem_vram_helper.h          |  1 -
 include/drm/drm_kunit_helpers.h            |  2 +-
 include/drm/drm_lease.h                    |  2 ++
 include/drm/drm_of.h                       |  1 +
 include/drm/drm_suballoc.h                 |  2 +-
 include/drm/i2c/ch7006.h                   |  1 +
 include/drm/i2c/sil164.h                   |  1 +
 include/drm/i915_gsc_proxy_mei_interface.h |  4 ++--
 include/drm/i915_hdcp_interface.h          | 18 +++++++++++++-----
 include/drm/i915_pxp_tee_interface.h       | 19 ++++++++++++-------
 include/drm/ttm/ttm_bo.h                   | 18 ++++++++++++------
 include/drm/ttm/ttm_caching.h              |  2 ++
 include/drm/ttm/ttm_execbuf_util.h         |  7 +++----
 include/drm/ttm/ttm_kmap_iter.h            |  4 ++--
 27 files changed, 125 insertions(+), 32 deletions(-)
 create mode 100644 include/Kbuild
 create mode 100644 include/drm/Makefile

-- 
2.39.2

