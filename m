Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E37A18B12ED
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 20:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781BC113D3A;
	Wed, 24 Apr 2024 18:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kA1wikSR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1763610FFD2;
 Wed, 24 Apr 2024 18:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713984839; x=1745520839;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZsHdvo3cFIlh84WiJH23R9BB0b24ZZA5xBvPTaKR1Js=;
 b=kA1wikSRbNtRnnB6Yf4m+3RuNMOe/qUbG6wS7MmmLHl8gN7OI/0+Gyas
 UfQ4bxegQK/n34x5hrA4hvjvxuZ6au2fJnIJ5EZU7/tLtnIPJuLN5jcOq
 O0gaFJPDvncE1SEAL22xDjw1f8WQppebt5x3vaUr3+vXTcU6kNbmhnE6X
 MF3jLEQQdVwzMKehSnE19m9RdxxkMteX3Cp/DRSqLBX9QYN10U3V7eLgE
 xWNvdw1AZYymmqxBi9NCAWLDf1aQkiuIMwIdrOIRjabVrAnhg+02Tqa94
 jmuX4NGx9XCr5h0mx42ZZip9xW0KlyDqpk6sJ9OCzimFHuEOksKJqOP99 A==;
X-CSE-ConnectionGUID: YCjsf/VPQr+Q0/5m21xPyA==
X-CSE-MsgGUID: J0+seyQZRz22xML6Zsmofg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="21061091"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="21061091"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 11:53:58 -0700
X-CSE-ConnectionGUID: FTaYZZSGTdicTVPLuekCAg==
X-CSE-MsgGUID: uPuMSPG+QNuv3fItRLmCgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="25240479"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 24 Apr 2024 11:53:57 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 jouni.hogander@intel.com, arun.r.murthy@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v3 0/6] Link off between frames for edp
Date: Thu, 25 Apr 2024 00:08:14 +0530
Message-Id: <20240424183820.3591593-1-animesh.manna@intel.com>
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
 drivers/gpu/drm/i915/display/intel_alpm.c     | 393 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h     |  25 ++
 .../drm/i915/display/intel_display_debugfs.c  |   2 +
 .../drm/i915/display/intel_display_types.h    |  25 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |   4 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 299 +------------
 include/drm/display/drm_dp.h                  |   5 +-
 8 files changed, 455 insertions(+), 299 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_alpm.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_alpm.h

-- 
2.29.0

