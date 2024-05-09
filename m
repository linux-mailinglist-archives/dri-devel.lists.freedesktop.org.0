Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DF58C0B1F
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 07:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD04110E13E;
	Thu,  9 May 2024 05:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRPHCXOg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B834E10E13E;
 Thu,  9 May 2024 05:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715233671; x=1746769671;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z0ofP8b8xVz/hcwjIWxDId0pRjehukJynCHU5at7sCI=;
 b=ZRPHCXOgoXjOrhaJDpYh6JXZ+cAmhevpXe0MhFp7cWrJADj5LHE3RcfR
 gQCb3QK0DYAZtsyBFJU3Ophmp9XNhR6XEmgqwyzR3cyLCkBY+AlEq0d37
 VMCdKx2PcIqc8JiD3xdOQwOqNbNDMHXSueSBzxeOa30VBXzPnXxAb7QiV
 qSMv2hFjJjp6istoIfW6wwtpkLvcXkauBZTeK5yrjs0uljTlT0lRr1AWS
 a2OB2rIo4YcWtQDGYbu/J1jBK8J+BVXdXL9JGt/VlTYeD2U/v4iJsmoGJ
 j/7K93sFrsGJR9fmBDiQdtwZXRVzd0LPwbnMk07RSMQ7s90ZcJhGCPC0M w==;
X-CSE-ConnectionGUID: nOpP09r4T5OSRO3tzvGB3g==
X-CSE-MsgGUID: SAYov37tQamUCARVipr8Ng==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="28645984"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="28645984"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 22:47:50 -0700
X-CSE-ConnectionGUID: /jOmStZkSeS+6Wm9yAhMww==
X-CSE-MsgGUID: JUxgSwPjS2iZCwG2lBS0wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="33817619"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa003.jf.intel.com with ESMTP; 08 May 2024 22:47:48 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 jouni.hogander@intel.com, arun.r.murthy@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v4 0/6] Link off between frames for edp
Date: Thu,  9 May 2024 11:01:49 +0530
Message-Id: <20240509053155.327071-1-animesh.manna@intel.com>
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
 drivers/gpu/drm/i915/display/intel_alpm.c     | 405 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h     |  25 ++
 .../drm/i915/display/intel_display_debugfs.c  |   2 +
 .../drm/i915/display/intel_display_types.h    |  32 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |   4 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 301 +------------
 drivers/gpu/drm/xe/Makefile                   |   1 +
 include/drm/display/drm_dp.h                  |   5 +-
 9 files changed, 475 insertions(+), 301 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_alpm.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_alpm.h

-- 
2.29.0

