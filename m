Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E53270FEE9
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 22:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE4810E612;
	Wed, 24 May 2023 20:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F51C10E612;
 Wed, 24 May 2023 20:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684958535; x=1716494535;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6pMcCHsxLr92NgMmcCC8XuznPJjNYyHxJ0E6djeNR2w=;
 b=TufaEdoPfiCGyOFQVZVQsITBr7aJYS71VeTFquAeNWCW800EnzQB/qEm
 hSsMaBrfHBd27NkgY+j8XMdx5z04g87jsQ1rhIJ0lzePzw+WLHRKKhKRa
 jh4US674o1P7sLzojmn21ZeWGtfzOCj2m7TH6+TysobyoQNpLAvWj9FIm
 XPgoW9OYr9lPcXy909wI+le+X4Uxsj6M57V0bxGhl77mSZHZWoey4Hklq
 CI/Eyq6wsNo/3LP3xpdA4x6xpuWpCZCHwlplheAQzQ4TJgOzn1Z5FlcEI
 ioZQtA92nNXThPzNuY7q/xXEBWAlWUr8UvQTYjv7cKPzRPgBVwLrE8kOu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="352523011"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="352523011"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 13:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="704491868"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="704491868"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 13:02:13 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v12 0/1] drm/i915: Allow user to set cache at BO creation
Date: Wed, 24 May 2023 13:02:54 -0700
Message-Id: <20230524200255.443021-1-fei.yang@intel.com>
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
Cc: Fei Yang <fei.yang@intel.com>, andi.shyti@linux.intel.com,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
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
v11: drop "end support for set caching ioctl" (merged)
     remove tools/include/uapi/drm/i915_drm.h
v12: drop Bspec reference in comment. add to commit message instead

Fei Yang (1):
  drm/i915: Allow user to set cache at BO creation

 drivers/gpu/drm/i915/gem/i915_gem_create.c | 36 +++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.c |  6 ++++
 include/uapi/drm/i915_drm.h                | 41 ++++++++++++++++++++++
 3 files changed, 83 insertions(+)

-- 
2.25.1

