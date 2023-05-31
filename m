Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14936718821
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 19:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACC310E2D5;
	Wed, 31 May 2023 17:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784AE10E031;
 Wed, 31 May 2023 17:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685552974; x=1717088974;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ye92QWyDTaYoc3R9yPdl4fT/7I+IcjA3u7F4sOaAQkM=;
 b=mxFomU3QZMso/epFVAcJFaPJYZTIRfOUxPk6W4FWk2x1Oq/AR5zXeNxb
 7ZAjpzeKmL0vxTCkeRPwYpqLdg1jzAgrOtYxLrsPptEw98RrYk6J1bkhR
 caKHz2HA2llf3d9BAjURe2+y528N+aj8fSGeSf5mYcyAhJ8gUcrMEyAfD
 Dcc/uIsFp7wfHRBjNF5w94Ghj51yyBHrm9rCTvzpL6r76zIbikk4Vu6lM
 XGWEU7haWAVs6ryLnK29ZKW4yzFEkLULgOzglp+6IklGUFzVLi7Nbob+t
 BLlOe1BWWX2MDG15b7EI/NPkt0RCFiM6/R6tzS1s4vKjsVZ5UyyGDyDpu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="352804810"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="352804810"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 10:09:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="831286031"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="831286031"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 10:09:33 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v15 0/1] drm/i915: Allow user to set cache at BO creation
Date: Wed, 31 May 2023 10:10:07 -0700
Message-Id: <20230531171008.1738759-1-fei.yang@intel.com>
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
 dri-devel@lists.freedesktop.org
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
v13: sent to test with igt@gem_create@create-ext-set-pat
v14: sent to test with igt@gem_create@create-ext-set-pat
v15: update commit message with documentation note and t-b/a-b from
     Media driver folks.

Fei Yang (1):
  drm/i915: Allow user to set cache at BO creation

 drivers/gpu/drm/i915/gem/i915_gem_create.c | 36 +++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.c |  6 ++++
 include/uapi/drm/i915_drm.h                | 41 ++++++++++++++++++++++
 3 files changed, 83 insertions(+)

-- 
2.25.1

