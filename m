Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E1E8A3323
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 18:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5291A10F74A;
	Fri, 12 Apr 2024 16:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ge4k8vYe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F26610EAEB;
 Fri, 12 Apr 2024 16:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712938088; x=1744474088;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aKu16Da3WBp0jLPJc98fFFBOmHtW5W/vgKLVLv9FzKQ=;
 b=ge4k8vYehuqhSolTJL/343+HysClUpLLJpb8v6x+7dUsnpKipKb9Ykm8
 Meti/z6dXgKum8BOEIeSbPm07O8e3NnU3cHwA078cVZrOnMu3Iztzeffu
 4wRMXfYr2uOg10c6j6JelGzmSPkvRgVHfFbsk/ht+FZfizPaNMFP5OnFo
 6YxBvq+fRtA8ypwxWA1X58Q9XlOmuw630wmAO9G4aq5KaWo/FuJM3Jh4k
 8XjGBezYK3e6B5Ixw9ep/VAEJGxpsgLLa1mMhI1P8meaJFkI8qry4NM9t
 6sGVxmHkPp9N5B2oOdMKJRvxCR40xENqM/d4a3ulxkLTT1jZibL8t57Uv Q==;
X-CSE-ConnectionGUID: WOT2IInrRSirMTlpwyvQCA==
X-CSE-MsgGUID: GZPCeGXERM+81xa6P+Bjtw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8256898"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8256898"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 09:08:07 -0700
X-CSE-ConnectionGUID: 4Ol8kwqeSOaPwS3j/seBzQ==
X-CSE-MsgGUID: lWkcuQ3iT+yPIeCDcGQWZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="25963919"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa003.jf.intel.com with ESMTP; 12 Apr 2024 09:08:06 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 jouni.hogander@intel.com, arun.r.murthy@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v2 0/6] Link off between frames for edp
Date: Fri, 12 Apr 2024 21:22:37 +0530
Message-Id: <20240412155243.2891996-1-animesh.manna@intel.com>
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

Note: These patches are not tested, sending early for review feedback.

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
 drivers/gpu/drm/i915/display/intel_alpm.c     | 388 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h     |  25 ++
 .../drm/i915/display/intel_display_debugfs.c  |   2 +
 .../drm/i915/display/intel_display_types.h    |  26 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |   5 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 299 +-------------
 include/drm/display/drm_dp.h                  |   5 +-
 8 files changed, 452 insertions(+), 299 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_alpm.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_alpm.h

-- 
2.29.0

