Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 888C3723EC3
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 12:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDDA10E32C;
	Tue,  6 Jun 2023 10:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84ACF10E330;
 Tue,  6 Jun 2023 10:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686045663; x=1717581663;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n94++11zhNNJJHyWKuO5ppjhkUli135MQSEuxQ/j0MM=;
 b=JKoAM/Dmm59oqgg2IuN/EEpxpvWN4VTRWyqjellqEcb5udVnJG3sGTAu
 4dv5OR+0L+cX1jGYMFbJXrPPNoHka8OkO0/JjvfHqlnfxTYph6c0TmkmL
 n+dNkDzLv2vYgisCkJLq5g5VYVnmrNsKKw9gHcGKroMibJJzr7Fo9MuYf
 xF+62ON8h0z2Gu4HFaoMoenioEkJEFV5Hcl80oQ7fUsRQcDKv5OLTS6K9
 kx3teZwS1HTRut45xc++KNI6a3egXAXcJhGCanjci57E2ibtLpdfK7Wuq
 MW4r6b1fQWGEbt/ukZqm+AACOmSWC+3V68E1/rPtHV9CReF9Bl9tQXKSl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359939548"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="359939548"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 03:01:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="659454106"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="659454106"
Received: from yuguen-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.252.57.68])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 03:00:58 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Fei Yang <fei.yang@intel.com>
Subject: [PATCH v17 0/1] drm/i915: Allow user to set cache at BO creation
Date: Tue,  6 Jun 2023 12:00:41 +0200
Message-Id: <20230606100042.482345-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Lihao Gu <lihao.gu@intel.com>, Jordan Justen <jordan.l.justen@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>, Carl Zhang <carl.zhang@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Matt Roper <matthew.d.roper@intel.com>
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
v16: limiting the extension to GEN12+
v17: limiting the extension to Meteor Lake

Test-with: 20230606095123.476130-2-andi.shyti@linux.intel.com

Fei Yang (1):
  drm/i915: Allow user to set cache at BO creation

 drivers/gpu/drm/i915/gem/i915_gem_create.c | 40 +++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.c |  6 ++++
 include/uapi/drm/i915_drm.h                | 41 ++++++++++++++++++++++
 3 files changed, 87 insertions(+)

-- 
2.40.1

