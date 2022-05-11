Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FBE522C4E
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 08:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C26110EA5A;
	Wed, 11 May 2022 06:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8966810F42E;
 Wed, 11 May 2022 00:58:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="251594206"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="251594206"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 17:58:11 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="593838070"
Received: from ymmonter-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.249.32.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 17:58:08 -0700
From: Andi Shyti <andi.shyti@studenti.polito.it>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 0/3] Clear TLB caches in all tiles when object is removed
Date: Wed, 11 May 2022 02:57:53 +0200
Message-Id: <20220511005756.113245-1-andi.shyti@studenti.polito.it>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 11 May 2022 06:30:33 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Andi Shyti <andi@etezian.org>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

The real fix is in patch 2. The rest is a helper that adds
the with_intel_gt_pm_if_awake() (from Chris) and one more check
on the status of the engine before accessing it for clearing the
TLB.

Andi

Changelog
=========
v2 -> v3 (v2: https://patchwork.freedesktop.org/series/103835/)
 - Add missing header file that was causing a compmile error.
 - Fix wrong patch formatting.

v1 -> v2 (v1: https://patchwork.freedesktop.org/series/103831/)
 - Add with_intel_gt_pm_if_awake() macro for gt specific wakeref.
 - Check if an engine is awake before invalidating its TLB.

Andi Shyti (2):
  drm/i915/gem: Flush TLBs for all the tiles when clearing an obj
  drm/i915/gt: Skip TLB invalidation if the engine is not awake

Chris Wilson (1):
  drm/i915/gt: Ignore TLB invalidations on idle engines

 drivers/gpu/drm/i915/gem/i915_gem_pages.c | 12 +++++++++---
 drivers/gpu/drm/i915/gt/intel_gt.c        |  4 ++++
 drivers/gpu/drm/i915/gt/intel_gt_pm.h     |  4 ++++
 3 files changed, 17 insertions(+), 3 deletions(-)

-- 
2.36.1

