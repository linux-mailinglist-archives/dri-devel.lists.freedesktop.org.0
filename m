Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4F7708F31
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 07:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE9010E5C1;
	Fri, 19 May 2023 05:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC93910E5C1;
 Fri, 19 May 2023 05:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684473017; x=1716009017;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kl7vIwwU3aEwfK4AwV16Czz99R9haLLSCM98lsjsArE=;
 b=bSYeuQ3lgNqiXRmoRNjjrtFR4tXorlC62fIgIqEnzQv9Q8i0NpQN1w+0
 VgAT8bY8RzI12HeTI13y+mQ/Zhpl3TbHzijvSATAsZ1xiq+vDZxWfww8M
 1JHxx6luUFe5G31/oxQ1kKFCV006p3/vsVrNaQUwZzTD7aDeuAUcVocuv
 Utm/9qYsCxeBA2rM8qBPUOAMTvAOy2dk4prmbbrvSywdBBKgLn9eDxr26
 qAG/48EwGlnXL2y7Obsx5RVrCGhBsmO2J36HVWUrXM30WyYoSah8KPc9D
 6hPsN8n2IwxlrLdoo41OBsO9FARID/tnVcZsGR+CAsj5m5VxT94Xe9vYw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="336874206"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="336874206"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 22:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="652913150"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="652913150"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 22:10:16 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 0/2] drm/i915: Allow user to set cache at BO creation
Date: Thu, 18 May 2023 22:11:01 -0700
Message-Id: <20230519051103.3404990-1-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Fei Yang <fei.yang@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

This series introduce a new extension for GEM_CREATE,
1. end support for set caching ioctl [PATCH 1/2]
2. add set_pat extension for gem_create [PATCH 2/2]

v2: drop one patch that was merged separately
    commit 341ad0e8e254 ("drm/i915/mtl: Add PTE encode function")
v3: rebased on https://patchwork.freedesktop.org/series/117082/
v4: fix missing unlock introduced in v3, and
    solve a rebase conflict
v5: replace obj->cache_level with pat_set_by_user,
    fix i915_cache_level_str() for legacy platforms.
v6: rebased on https://patchwork.freedesktop.org/series/117480/
v7: rebased on https://patchwork.freedesktop.org/series/117528/
v8: dropped the two dependent patches that has been merged
    separately. Add IGT link and Tested-by (MESA).
v9: addressing comments (Andi)
v10: acked-by and tested-by MESA

Fei Yang (2):
  drm/i915/mtl: end support for set caching ioctl
  drm/i915: Allow user to set cache at BO creation

 drivers/gpu/drm/i915/gem/i915_gem_create.c | 36 +++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_domain.c |  3 ++
 drivers/gpu/drm/i915/gem/i915_gem_object.c |  6 ++++
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c  |  9 ++++-
 include/uapi/drm/i915_drm.h                | 42 ++++++++++++++++++++++
 tools/include/uapi/drm/i915_drm.h          | 42 ++++++++++++++++++++++
 6 files changed, 137 insertions(+), 1 deletion(-)

-- 
2.25.1

