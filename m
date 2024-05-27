Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6810E8CFBC0
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 10:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A1110E7F3;
	Mon, 27 May 2024 08:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AgqF5Itq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5140D10E08B;
 Mon, 27 May 2024 08:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716799371; x=1748335371;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PQhCRb+mQCBwJ5/z/XSHrbptac2w2qMbwSlHNGVVY/k=;
 b=AgqF5ItqjAtow8RrhTDlOvUHmVfxbGx+I8NoyqoRmTeo2MF9pLwSY5Cd
 RdKxcSj1QXw7I9Wet6e/SP/sxZuaAxKHOH6kPXbrjbRrHUy3oBZdI6mlG
 y7fXEE+DCqpMMFFIEn1tz119b4obeF+oY9KbEzolg4skFptopZ1+nyrBX
 gddbtt6DgShhfOIVZpkf+8LiRfOpISKJO8qyNVKVU5B+xs6elLWij1DNr
 X0f3FRJr3FxD8Y2VPrfK0OaRthNPAqB7B5VimL29+dAYVoHxhscpHlgJa
 W2XDG9/cdQgRwRnS03/kMFiHujdwllFPTMrb5tBvXqaNtf1Wn5vVUN/io g==;
X-CSE-ConnectionGUID: Kzmt+GT/QZ+/ejIIU/ZcwQ==
X-CSE-MsgGUID: XUv1SF85Q7eYLcYQ4cky6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="13048972"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="13048972"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 01:42:51 -0700
X-CSE-ConnectionGUID: oeYBIOo1Q3mkGkuBkpOCMA==
X-CSE-MsgGUID: o7CDOXCdQ/+UVgKJhTScyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34676822"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa008.fm.intel.com with ESMTP; 27 May 2024 01:42:49 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, jouni.hogander@intel.com, arun.r.murthy@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v6 0/6] Link off between frames for edp
Date: Mon, 27 May 2024 13:56:30 +0530
Message-Id: <20240527082636.1519057-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Link Off Between Active Frames (LOBF) allows an eDP link to be turned Off and On
durning long VBLANK durations without enabling any of the PSR/PSR2/PR modes of operation.

Bspec: 71477

Note: Lobf need to be enabled adaptive sync fixed refresh mode
where vmin = vmax = flipline, which will arise after cmmr feature
enablement. Currently existing code refactored and make compute-config()
and enabling function ready. Will add enabling sequence in a separate patch.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>

Animesh Manna (5):
  drm/i915/alpm: Move alpm parameters from intel_psr
  drm/i915/alpm: Move alpm related code to a new file
  drm/i915/alpm: Add compute config for lobf
  drm/i915/alpm: Enable lobf from source in ALPM_CTL
  drm/i915/alpm: Add debugfs for LOBF

Jouni Högander (1):
  drm/display: Add missing aux less alpm wake related bits

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_alpm.c     | 411 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h     |  25 ++
 .../drm/i915/display/intel_display_debugfs.c  |   2 +
 .../drm/i915/display/intel_display_types.h    |  26 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |   4 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 303 +------------
 drivers/gpu/drm/xe/Makefile                   |   1 +
 include/drm/display/drm_dp.h                  |   5 +-
 9 files changed, 475 insertions(+), 303 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_alpm.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_alpm.h

-- 
2.29.0

