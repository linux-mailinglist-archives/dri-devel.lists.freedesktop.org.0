Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB2FC54CDD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 00:30:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0842610E7B7;
	Wed, 12 Nov 2025 23:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lYsQ6sBg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A430B10E0AD;
 Wed, 12 Nov 2025 23:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762990235; x=1794526235;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9MSGq/awMbntpV13wCO7Z1cNC0J7+aHVyfgdAp/SItg=;
 b=lYsQ6sBgIUaLF3H51o6VGbI2JgIxlLF/9TlyXeMhycRMmEtWaltBEeUK
 Y5mysi/3h+P/4h/HI+5CvAK0Apg8sGF/O5kzzrRTGOMggQaQGzTuCnmpl
 wQwkZrB0k9+WH4HpabIGgnT8aPrpakKiSmg3hXxM9e6N4elDtG3euHhfm
 WkldAVKpvGjfEC0ClFZCDMx7aVjV3TAZ5BClnSbzgaHtqo8qThljmfcC9
 jkJdhkgHmyIbOWID81iDngJr5EWE2aMioxagByAuRy32EYIT9VQvNYN1M
 YaozhlqsB6ZIZ/qTjfip+g1jBHwy2oYtNMiTkCx2eyX+lHW1bdsIcFnlW g==;
X-CSE-ConnectionGUID: zv4Sknx1TAmz17vOj1xUFQ==
X-CSE-MsgGUID: O623nShgTxeERlWHA70FIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="75373168"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="75373168"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 15:30:35 -0800
X-CSE-ConnectionGUID: oYSZ2LXvRKWv6EjFEIEYHw==
X-CSE-MsgGUID: eIweEjDyR+CZbOiPjp6tMQ==
X-ExtLoop1: 1
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.81])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 15:30:33 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] drm/i915: Async flip stuff
Date: Thu, 13 Nov 2025 01:30:27 +0200
Message-ID: <20251112233030.24117-1-ville.syrjala@linux.intel.com>
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

A few async flip related things.

Ville Syrjälä (3):
  drm/plane: Fix create_in_format_blob() return value
  drm/i915: Expose the IN_FORMATS_ASYNC blob for all planes
  drm/i915: Eliminate one more frequent drm_format_info()

 drivers/gpu/drm/drm_plane.c                   |  4 ++--
 drivers/gpu/drm/i915/display/i9xx_plane.c     |  4 ++--
 drivers/gpu/drm/i915/display/intel_cursor.c   |  1 +
 drivers/gpu/drm/i915/display/intel_display.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_plane.c    | 22 +++++++++++--------
 drivers/gpu/drm/i915/display/intel_plane.h    |  4 +++-
 drivers/gpu/drm/i915/display/intel_sprite.c   |  3 +++
 .../drm/i915/display/skl_universal_plane.c    |  2 +-
 8 files changed, 26 insertions(+), 16 deletions(-)

-- 
2.49.1

