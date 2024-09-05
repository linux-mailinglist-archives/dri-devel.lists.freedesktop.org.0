Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441B996D35F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 11:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DD310E834;
	Thu,  5 Sep 2024 09:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzbEsBxu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC92E10E832;
 Thu,  5 Sep 2024 09:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725528829; x=1757064829;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pdljWs+jYa99JbSULneYMqlSrY4Ry24sHTLd/ITcgg8=;
 b=TzbEsBxupMGGPqDEZYJrOD+VoM2IsK4E0cXvHjBUgDKgO1820Bv2ManY
 5dYtnE2wSW2wepj1E8cAc3+BDQFJashNPu5ZEBNtl2lWz8nw2RXmDuUJ0
 iC/lwD22fkq87IA4E5AxzXxMve3l6mEqGEnvtc+NEx9mEnBqbDGEuUaP6
 6Les3YSX5zle/M7W7RjXytKo80LJ62eUhsFF4BghShQBkK5L41PUsKoCc
 Y9OouUo30H7gPKFKVSYpE273s2gN4ygaswJxUXYXiIHMs7x3PPE0o++/H
 CLxm7elGh44Kx+uw14qaXJv2nJDJzh6Jv+sDuZWg/MvyQnHj3Bg2JSeZd A==;
X-CSE-ConnectionGUID: 4bmYqYVYTyeBSnG7DxAYIQ==
X-CSE-MsgGUID: n8bovD74QNeT4icu3kMp6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24391702"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="24391702"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:33:48 -0700
X-CSE-ConnectionGUID: SMCT81NrTQa+BH5329+BIA==
X-CSE-MsgGUID: Y1ciEvOxRXCXhpzHd4Ticg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="96354370"
Received: from unknown (HELO fedora..) ([10.245.245.247])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:33:45 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Zack Rusin <zack.rusin@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Sui Jingfeng <suijingfeng@loongson.cn>
Subject: [PATCH 0/2] drm/ttm: Add an option to report graphics memory OOM
Date: Thu,  5 Sep 2024 11:33:20 +0200
Message-ID: <20240905093322.29786-1-thomas.hellstrom@linux.intel.com>
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
 16 files changed, 82 insertions(+), 50 deletions(-)

-- 
2.46.0

