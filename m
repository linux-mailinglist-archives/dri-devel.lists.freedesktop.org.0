Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB187055B3
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 20:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2552C10E033;
	Tue, 16 May 2023 18:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A287410E033;
 Tue, 16 May 2023 18:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684260653; x=1715796653;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mWn+72/EXbDmJhtyLaTs/M8Egtw+0wplkhHmEDARglU=;
 b=gCeNHM9LRaiXc0xjSdh3dqXrdpp7v8P8Xv0NNKZyAkGxiYsWs7/6jUuT
 wJUhTK7LkwQ8SS5TkEvwmbOELV4nXoAzbQS6hFFq1oVkf3Sb4D1vsIMwe
 M0aZH5QJRzinZRNfv/EMyKy4cY1hCWO5mw/Sysab4wlUyNjaVKZjcuuDw
 YEqH3RIst/syxGEOGrkc8UZ+1IGuuBq+01nXQfwQtA0xf4BBVnXd0aGen
 MN9jrssp/p8nOaTIfUIsEUDnw4A9tgAbpn/H+j/6LT6HFWU2Vf4MNOEfu
 EFSWyR206Vv6CREWibsy6/2PWBBxsY69qJYsS7Z3GPRMW8Z3a/b7fIcRs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="336100983"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="336100983"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 11:10:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="701445547"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="701445547"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 11:10:51 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 0/2] drm/i915: Allow user to set cache at BO creation
Date: Tue, 16 May 2023 11:11:38 -0700
Message-Id: <20230516181140.1372245-1-fei.yang@intel.com>
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
1. end support for set caching ioctl [PATCH 4/5]
2. add set_pat extension for gem_create [PATCH 5/5]

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

