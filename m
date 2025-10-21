Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812C6BF84A2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 21:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F7710E312;
	Tue, 21 Oct 2025 19:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpNJtfGh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9439B10E0B4;
 Tue, 21 Oct 2025 19:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761075901; x=1792611901;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f3ICTFaAHGcsUVc07h+mbHRfVNmGHf8xBqK4qiTc3O0=;
 b=dpNJtfGhVwE1NQyJBlNzTClp7cZ5NuyrUw/W5Z4bKfc1i+Qj+ICnCwPv
 HAXaDMAkhMBq6cbxp8QjkfHb1mjoopIRZz8dEvyp8GPSJg7iMS7+HZmp0
 XmJ1v1k/H1o+6PuL2/4LG019VJmO3pxmK2zTMu0wIigGu3x/ZQ0gn/2ni
 Hhdvwjk+ySQWPDoM4Z/A461g1KbOpIKMmvJAkv7anjY0Ad+D4w9C982sD
 m6E9PwxNKLb/H+yE98UTgXYTc65yPiZS/ljxaRW01+W3oA6eaUj501JGf
 6tC/UI4gwcgAzsOjOcU/alp7uaHckYrvGHQ/giLPD8GeN56fZa0gg1Wdk w==;
X-CSE-ConnectionGUID: 09ctqbCeRBq2oLXLtXnNHw==
X-CSE-MsgGUID: wwzCRFsCTYiL0EawvmDJog==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67078285"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="67078285"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 12:45:00 -0700
X-CSE-ConnectionGUID: O2z44/q6Rfimlklu2PDdpg==
X-CSE-MsgGUID: 6zS/YJXASaescIHFmEjcmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="214311994"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.214])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 12:44:58 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH 0/5] drm/uapi: Intoduce DRM_MODE_DUMB_CURSOR
Date: Tue, 21 Oct 2025 22:44:50 +0300
Message-ID: <20251021194455.24297-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Currently DRM_IOCTL_MODE_CREATE_DUMB isn't really suitable for
allocating buffers for cursor planes (at least on Intel GPUs).

Introduce a new DRM_MODE_DUMB_CURSOR flag for
DRM_IOCTL_MODE_CREATE_DUMB so that userspace can tell us that
it wants a dumb buffer for a cursor plane. And implement support
fot the new flag in i915.

This is more of an RFC at this point to see what people think.
I haven't done any userspace changes yet. Figured I'd gauge
the general interest first...

Cc: Daniel Stone <daniels@collabora.com>

Ville Syrjälä (5):
  drm/uapi: Validate DRM_IOCTL_MODE_CREATE_DUMB flags
  drm/uapi: Introduce the DRM_MODE_DUMB_CURSOR flag
  drm/i915/dumb: Move the display dumb buffer stuff into the display
    code
  drm/i915/dumb: Reject dumb buffer that exceed max fb dimensions
  drm/i915/dumb: Handle DRM_MODE_DUMB_CURSOR

 drivers/gpu/drm/drm_dumb_buffers.c           |  2 +
 drivers/gpu/drm/i915/display/intel_cursor.c  | 38 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_cursor.h  |  3 ++
 drivers/gpu/drm/i915/display/intel_display.c | 11 ++++
 drivers/gpu/drm/i915/display/intel_display.h |  3 ++
 drivers/gpu/drm/i915/display/intel_plane.c   | 39 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_plane.h   |  4 ++
 drivers/gpu/drm/i915/gem/i915_gem_create.c   | 55 ++++++++++----------
 include/uapi/drm/drm_mode.h                  |  4 +-
 9 files changed, 130 insertions(+), 29 deletions(-)

-- 
2.49.1

