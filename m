Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A8598D313
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 14:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E1A10E709;
	Wed,  2 Oct 2024 12:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ipdT19hv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C11E10E204;
 Wed,  2 Oct 2024 12:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727871883; x=1759407883;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S73w0Dupi7vDTH7lqcJXtf7MvEjQ2efkpDxP9sz4ekM=;
 b=ipdT19hvmyxN10YavN7qQBw6OvSR+Pn9f01UfWMsmY+8wQouNtfcd8rZ
 AhKGSrmv5p4CX9AmOCeDhBbCsYdO5kZCXxRYXDAXxJEXyVOT5jOpbetX9
 j0UvDCab4zhFtDnEb4IhD9M+D4nHsrr/2Sm2BNc5inkXmFN8yoimVBS+7
 Ph1Hb5ZSjS/qSK8fCPNqB0NKoexsgwKwEDRpX2m7I3QlQzHHZFSNanpli
 TDTKDhYXunHdrfG4iAdChlztgwIyg8F1nT9YvKRKdMxeSX4TAt0MGUHVe
 3s7bNWW5Q8R6pQTLsQVlRh0nkPmVs7W7WZMofHYIG550tyX2V58sXmHCy g==;
X-CSE-ConnectionGUID: 8+ja7SVOR1iPFFSxY2lnQw==
X-CSE-MsgGUID: xajXIug1Q66Vn68P9S4zdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="30735377"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="30735377"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 05:24:43 -0700
X-CSE-ConnectionGUID: aXzl/KrASwC3xlNNtsn1DA==
X-CSE-MsgGUID: 0YP0m1IZRxCW9/L/ZZTVGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="74221149"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.67])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 05:24:41 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Zack Rusin <zack.rusin@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Sui Jingfeng <suijingfeng@loongson.cn>
Subject: [PATCH v2 0/2] drm/ttm: Add an option to report graphics memory OOM 
Date: Wed,  2 Oct 2024 14:24:20 +0200
Message-ID: <20241002122422.287276-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
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

Some graphics APIs differentiate between out-of-graphics-memory and
out-of-host-memory (system memory). Add a device init flag to
have -ENOSPC propagated from the resource managers instead of being
converted to -ENOMEM, to aid driver stacks in determining what
error code to return or whether corrective action can be taken at
the driver level.

The first patch deals with a ttm_device_init() interface change,
The Second patch adds the actual functionality.

A follow-up will be posted for Xe once this is merged / backmerged.

Thomas Hellström (2):
  drm/ttm: Change ttm_device_init to use a struct instead of multiple
    bools
  drm/ttm: Add a device flag to propagate -ENOSPC on OOM

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  6 +++--
 drivers/gpu/drm/drm_gem_vram_helper.c         |  7 +++---
 drivers/gpu/drm/i915/intel_region_ttm.c       |  3 ++-
 drivers/gpu/drm/loongson/lsdc_ttm.c           |  5 +++-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |  7 ++++--
 drivers/gpu/drm/qxl/qxl_ttm.c                 |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c           |  6 +++--
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 16 ++++++------
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  3 ++-
 drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 16 ++++++------
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 20 ++++++---------
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  6 ++---
 drivers/gpu/drm/ttm/ttm_bo.c                  |  2 +-
 drivers/gpu/drm/ttm/ttm_device.c              |  8 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  4 +--
 drivers/gpu/drm/xe/xe_device.c                |  3 ++-
 include/drm/ttm/ttm_device.h                  | 25 ++++++++++++++++++-
 17 files changed, 86 insertions(+), 53 deletions(-)

-- 
2.46.0

