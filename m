Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEAB6E12BC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 18:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AE110E173;
	Thu, 13 Apr 2023 16:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B32810E086;
 Thu, 13 Apr 2023 16:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681404578; x=1712940578;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=505ydyqQVkwE+TUn5wS7HTI14PcNmFy3LFysLltyEVc=;
 b=QlhYbnQCneHneICrDy/SHGtOO2TE5ercWcLDoBcjFFU6EQSEW0z6n3lb
 gXEEgoI3S/9o/xuhj5P/PSpcRYkJ7gUSS2DMZoyVC5EBIX6AfKg7n8NjP
 mxGFZTOvu/Wrq9uzHOnafW6QR8qd8BQqSJfvyvHXHM6iO/Gj8Oafs1co+
 J01If7z6jaI926ygJbY4jhkebAFI/XTLk3rgE0IhOiwyRJvP5+q86tap4
 33CQCq9hQespCJ8rtjHWgdh3wJ82yDPMnOjc5N6wRUOmNGBmE2KJcWTr9
 VhRy5uBoQ4t0tMluJrvvccBQdW0hW9Ks/TXDffKxc8jnJVwoVNaNmkz5Q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="342991047"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="342991047"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 09:49:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="692037910"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="692037910"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 13 Apr 2023 09:49:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 13 Apr 2023 19:49:16 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/7] drm/i915: CTM stuff mostly
Date: Thu, 13 Apr 2023 19:49:09 +0300
Message-Id: <20230413164916.4221-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Mostly some CTM stuff:
- document the uapi better
- fix CHV CSC negative coefficients
- expose CTM on ilk/snb/vlv
- a bonus gamma patch for gen3
- cure CGM CSC underruns on CHV (new in v2)

Test-with: 20230411161555.10001-1-ville.syrjala@linux.intel.com

Ville Syrjälä (7):
  drm/uapi: Document CTM matrix better
  drm/i915: Expose crtc CTM property on ilk/snb
  drm/i915: Fix CHV CGM CSC coefficient sign handling
  drm/i915: Always enable CGM CSC on CHV
  drm/i915: Implement CTM property support for VLV
  drm/i915: No 10bit gamma on desktop gen3 parts
  drm/i915: Do state check for color management changes

 drivers/gpu/drm/i915/display/intel_color.c    | 237 ++++++++++++++++--
 .../drm/i915/display/intel_crtc_state_dump.c  |   6 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   8 +
 .../drm/i915/display/intel_display_types.h    |   3 +
 .../drm/i915/display/intel_modeset_verify.c   |   2 +
 drivers/gpu/drm/i915/i915_pci.c               |   8 +-
 drivers/gpu/drm/i915/i915_reg.h               |  15 ++
 include/uapi/drm/drm_mode.h                   |   5 +
 8 files changed, 260 insertions(+), 24 deletions(-)

-- 
2.39.2

