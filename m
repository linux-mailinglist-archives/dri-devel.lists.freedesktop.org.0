Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0074C87496C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 09:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F74710F1CD;
	Thu,  7 Mar 2024 08:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H6j7D6XS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD08F10EB2F;
 Thu,  7 Mar 2024 08:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709799574; x=1741335574;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=8SajkmoIGYCHcjekbiubVDIsvzd14v3ieYvtJch8Iy8=;
 b=H6j7D6XSWlvknTkg1+wKI9HJWI8hnmrp6cQ+QWruKKjXu6vWg7LiZKpW
 fxxTI0EGfJAB/qpqoXDO88gDbGTlO2YOsj4meuhBNyI5iDPZeZ3Mt+yXg
 ZALstSVr3y2KkQeEhnJumDT5XH+KLNiAf/hSsdgmzQcLLEf1IK2XlSeEr
 mW6x1DnJC+iyE8B4hRr2ClzIPmzvNzw2xxguYTfOE4ZJs7SPAOOexvuTm
 d6piRMQJizsI3NbXvJ3IhPG93HpR5sbOAw2xQ3PK5Dm7sL9f7hFuW5nYI
 ucKlX5kO/OlcLzDxL6E/Dxm9nVin5LFd2HD+h4JSu4t92Q2RO7oS+gyFT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15030029"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; d="scan'208";a="15030029"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 00:19:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; d="scan'208";a="47526631"
Received: from unknown (HELO localhost) ([10.245.244.162])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 00:19:27 -0800
Date: Thu, 7 Mar 2024 10:19:24 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Message-ID: <Zel4jMpJ2Fay5VeJ@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

Hi Dave & Sima,

Here goes the final drm-intel-fixes for v6.8.

This PR will appear to contain more patches than it does. It's 4 patches on top of
drm-fixes after Sima pulled the previous PR as you can observe from git log.

Fixes for kernel crash on UHD 730, boot delay regression on PSR, DP DSC
WARN splat and smaller fix for selftest.

Regards, Joonas

***

drm-intel-fixes-2024-03-07:
- Fix for #10184: Kernel crash on UHD Graphics 730 (Cc stable)
. Fix for #10284: Boot delay regresion with PSR
- Fix DP connector DSC HW state readout
- Selftest fix to convert msecs to jiffies

The following changes since commit 90d35da658da8cff0d4ecbb5113f5fac9d00eb72:

  Linux 6.8-rc7 (2024-03-03 13:02:52 -0800)

are available in the Git repository at:

  https://anongit.freedesktop.org/git/drm/drm-intel tags/drm-intel-fixes-2024-03-07

for you to fetch changes up to 984318aaf7b6516d03a2971a4a37bab4ea648461:

  drm/i915/panelreplay: Move out psr_init_dpcd() from init_connector() (2024-03-06 15:41:16 +0200)

----------------------------------------------------------------
- Fix for #10184: Kernel crash on UHD Graphics 730 (Cc stable)
. Fix for #10284: Boot delay regresion with PSR
- Fix DP connector DSC HW state readout
- Selftest fix to convert msecs to jiffies

----------------------------------------------------------------
Animesh Manna (1):
      drm/i915/panelreplay: Move out psr_init_dpcd() from init_connector()

Daniel Vetter (1):
      Merge tag 'drm-intel-fixes-2024-03-01' of https://anongit.freedesktop.org/git/drm/drm-intel into drm-fixes

Imre Deak (1):
      drm/i915/dp: Fix connector DSC HW state readout

Janusz Krzysztofik (1):
      drm/i915/selftests: Fix dependency of some timeouts on HZ

Nirmoy Das (1):
      drm/i915: Check before removing mm notifier

Suraj Kandpal (3):
      drm/i915/hdcp: Move to direct reads for HDCP
      drm/i915/hdcp: Remove additional timing for reading mst hdcp message
      drm/i915/hdcp: Extract hdcp structure from correct connector

Tvrtko Ursulin (1):
      MAINTAINERS: Update email address for Tvrtko Ursulin

Ville Syrjälä (1):
      drm/i915: Don't explode when the dig port we don't have an AUX CH

 .mailmap                                           |  5 +++
 MAINTAINERS                                        |  2 +-
 .../drm/i915/display/intel_display_power_well.c    | 17 ++++++--
 drivers/gpu/drm/i915/display/intel_display_types.h |  7 ++++
 drivers/gpu/drm/i915/display/intel_dp.c            | 16 ++++++++
 drivers/gpu/drm/i915/display/intel_dp.h            |  2 +
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       | 47 ++++++++--------------
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  1 +
 drivers/gpu/drm/i915/display/intel_modeset_setup.c | 13 +++---
 drivers/gpu/drm/i915/display/intel_psr.c           |  3 --
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |  3 ++
 .../drm/i915/selftests/intel_scheduler_helpers.c   |  6 ++-
 12 files changed, 75 insertions(+), 47 deletions(-)
