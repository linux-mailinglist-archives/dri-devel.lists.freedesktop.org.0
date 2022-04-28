Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4036512A63
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 06:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F23810E344;
	Thu, 28 Apr 2022 04:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F096C10E16E;
 Thu, 28 Apr 2022 04:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651119583; x=1682655583;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/UzZiwvL/dsHVvmgIGNXphh4x/ft7iXHPNUUPwBsVpo=;
 b=Csvjech6PJWFo41mZMdPucuJNh3ee/hFpWHg4JpgrhghsBGvkr2sb490
 vOJdufPLvcpCvsPiKM07XVx9JXwf5RYKrE2QaNOZ/hzx130UIvgKsXp/i
 r64tuWtqRNCv+Ezw2Z6QMIAoyXpSyHrU0bhmgs7oFv4EF+4TTWKKJFCwh
 prp7O/QOkHu5RToFpxRZai6QU//QW8FE8uwLt55qYWiNVReaiQtVBaMgU
 1bwEihzKINnLy3IOb22TDtz5xKkxsEcAO6QxRPl6f3Zb/EbV/boggfAMC
 3UkD2TvUkTMjz2r4ZHHebirWQTXR5qQ6PCff9MItKwv746Xt0xWCzzK7X g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="326645777"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="326645777"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 21:19:42 -0700
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="559403034"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 21:19:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/4] i915: Turn on compute engine support
Date: Wed, 27 Apr 2022 21:19:22 -0700
Message-Id: <20220428041926.1483683-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the necessary GuC-based hardware workarounds have landed, we're
finally ready to actually enable compute engines for use by userspace.
All of the "under-the-hood" heavy lifting already landed a while back in
other series so all that remains now is to add I915_ENGINE_CLASS_COMPUTE
to the uapi enum and add the CCS engines to the engine lists for the
Xe_HP SDV and DG2.

Userspace (Mesa) is linked in the ABI patch.  Existing IGT tests (e.g.,
i915_hangman) provide test coverage for general engine behavior since compute
engines should follow the same general rules as other engines.  We've also
recently added some additional subtests like
igt@gem_reset_stats@shared-reset-domain to cover the user-visible impacts of
the compute engines sharing the same hardware reset domain as the render
engine.

v2:
 - Update TLB invalidation register for compute engines and move it to a
   separate patch since it isn't related to the new uapi.  (Tvrtko,
   Prathap)
 - Move new kerneldoc for pre-existing engine classes to a separate
   patch.  (Andi)
 - Drop the compute UMD merge request link for now because it also
   included some additional multi-tile uapi that we're not ready to
   upstream just yet.  Even if they don't have a disentangled MR ready
   for reference, we still have the Mesa MR as a key userspace consumer.
   (Tvrtko)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>

Daniele Ceraolo Spurio (1):
  drm/i915: Xe_HP SDV and DG2 have up to 4 CCS engines

Matt Roper (3):
  drm/i915/uapi: Add kerneldoc for engine class enum
  drm/i915/xehp: Add register for compute engine's MMIO-based TLB
    invalidation
  drm/i915/xehp: Add compute engine ABI

 drivers/gpu/drm/i915/gt/intel_engine_user.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c          |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  1 +
 drivers/gpu/drm/i915/i915_drm_client.c      |  1 +
 drivers/gpu/drm/i915/i915_drm_client.h      |  2 +-
 drivers/gpu/drm/i915/i915_pci.c             |  6 +-
 include/uapi/drm/i915_drm.h                 | 62 +++++++++++++++++++--
 7 files changed, 65 insertions(+), 10 deletions(-)

-- 
2.35.1

