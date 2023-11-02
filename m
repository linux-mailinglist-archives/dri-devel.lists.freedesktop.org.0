Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F410C7DF5EA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 16:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB0C10E8F7;
	Thu,  2 Nov 2023 15:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516C910E8EB;
 Thu,  2 Nov 2023 15:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698937956; x=1730473956;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CLy1y5nIqzAmMc0U1jCcdZeU6NVug+2ZBa3uUHFLFTk=;
 b=FPYztSgR1V5+y4LSbvXsaNiiFX2n2wDfTdFQqd9S01L0LVdRgbYMq33P
 GMBIsekUDjKgYLiytSBERk7+2YIbvFSfvbPf5ahYfCaqwDEIKaz9FVPnV
 Gw5fNIvsdx0qhaXjzx0tkCImrngK5ePNZbfGX3kOmc55HC1tcWbzR8TkE
 aUjj7+mbCCWnaHGWU0Hu9DEA7Rxvpm8VjS9j2rVZWEHgz6lUSuz2KMOnD
 O8OsV9c1ZuD/6KOqif4g0inn8TW4mWHUuvoPIQ+wmBoUM50Xw5o9D0iLJ
 05BeRurFHDKs5h8yF/v2iI7c8P8Avbm+zaSnt+osQriCPA6olmcybeITN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1660145"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1660145"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 08:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="737784550"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="737784550"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 02 Nov 2023 08:12:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 76FA0560; Thu,  2 Nov 2023 17:12:30 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [rft,
 PATCH v3 00/15] drm/i915/dsi: 2nd attempt to get rid of IOSF GPIO
Date: Thu,  2 Nov 2023 17:12:13 +0200
Message-Id: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSI code for VBT has a set of ugly GPIO hacks, one of which is direct
talking to GPIO IP behind the actual driver's back. A second attempt
to fix that is here.

If I understood correctly, my approach should work in the similar way as
the current IOSF GPIO.

Hans, I believe you have some devices that use this piece of code,
is it possible to give a test run on (one of) them?

In v3:
- incorporated series by Jani
- incorporated couple of precursor patches by Hans
- added Rb tag for used to be first three patches (Andi)
- rebased on top of the above changes
- fixed indexing for multi-community devices, such as Cherry View

In v2:
- added a few cleanup patches
- reworked to use dynamic GPIO lookup tables
- converted CHV as well

Andy Shevchenko (8):
  drm/i915/dsi: Replace while(1) with one with clear exit condition
  drm/i915/dsi: Get rid of redundant 'else'
  drm/i915/dsi: Replace check with a (missing) MIPI sequence name
  drm/i915/dsi: Extract common soc_gpio_set_value() helper
  drm/i915/dsi: Replace poking of VLV GPIOs behind the driver's back
  drm/i915/dsi: Prepare soc_gpio_set_value() to distinguish GPIO
    communities
  drm/i915/dsi: Replace poking of CHV GPIOs behind the driver's back
  drm/i915/iosf: Drop unused APIs

Hans de Goede (2):
  drm/i915/dsi: Remove GPIO lookup table at the end of
    intel_dsi_vbt_gpio_init()
  drm/i915/dsi: Fix wrong initial value for GPIOs in bxt_exec_gpio()

Jani Nikula (5):
  drm/i915/dsi: assume BXT gpio works for non-native GPIO
  drm/i915/dsi: switch mipi_exec_gpio() from dev_priv to i915
  drm/i915/dsi: clarify GPIO exec sequence
  drm/i915/dsi: rename platform specific *_exec_gpio() to
    *_gpio_set_value()
  drm/i915/dsi: bxt/icl GPIO set value do not need gpio source

 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 355 +++++++------------
 drivers/gpu/drm/i915/vlv_sideband.c          |  17 -
 drivers/gpu/drm/i915/vlv_sideband.h          |   3 -
 3 files changed, 137 insertions(+), 238 deletions(-)

-- 
2.40.0.1.gaa8946217a0b

