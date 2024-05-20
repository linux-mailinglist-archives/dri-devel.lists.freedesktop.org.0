Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7338C9BDD
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 13:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483BD10E611;
	Mon, 20 May 2024 11:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hLKdepSd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C075610E611;
 Mon, 20 May 2024 11:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716203070; x=1747739070;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PQhCRb+mQCBwJ5/z/XSHrbptac2w2qMbwSlHNGVVY/k=;
 b=hLKdepSd+y9LW8858RYyZmNSF+//lbnxibkzxOOtOSCiRDr3HUsbb3mL
 oET7WzR+TuZR8CJigWnBhfJnQjvYA1hL7O2TUFx1h0Wrvfj1LT9JslLmV
 7dmJFs9OFEFW9uRp/e4cfwmXm7Q3+OQ1nJ/c02imQj1HnjVzI2bGZf9CK
 dLeTMsRwRKKunby5fGGVBY+hTQPO+A9guBhC9SZB1qMbI41Eucx9mowUO
 qpOnIsBRPyPG3jQrgHOGJOWrD7zI3CI4/BGtkqq8yQoufeBZQzkNi1vLh
 feDO7/Vb04y/CXmw+Zz1NoErOL7/mZdJU+Y6sw2l8vhN7b7DR9nCrR0By A==;
X-CSE-ConnectionGUID: Jdz4lNu3SL2i+KBJQtbtgA==
X-CSE-MsgGUID: RdaoFiAQSbCC8X1fW5o3iw==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="22996338"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="22996338"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 04:04:29 -0700
X-CSE-ConnectionGUID: vUJob1dkSjSA6dQ/uAQerg==
X-CSE-MsgGUID: MSvkV5kYQDKCZiIXfeFONQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="63723541"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa001.fm.intel.com with ESMTP; 20 May 2024 04:04:27 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 jouni.hogander@intel.com, arun.r.murthy@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 0/6] Link off between frames for edp
Date: Mon, 20 May 2024 16:18:16 +0530
Message-Id: <20240520104822.1116122-1-animesh.manna@intel.com>
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

