Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6614D54BE9D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 02:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4329111370A;
	Wed, 15 Jun 2022 00:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605FD11359C;
 Wed, 15 Jun 2022 00:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655251827; x=1686787827;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=61Hgw/4/l82bXDp86jkZWvvNnPFfc9CkTy15P9jSxww=;
 b=ghLiynvjeDRgDVjlhg3RvZ22J3Wv48R353nCqWllARJUgUSH1kznfYqY
 uQSnARKjlJvJpCn4y7n1vPbWuosgU9Gbc7cQVXmnof0ksd8dBmMZ+pUZC
 TNR8forDvq0kCm8NdcH2OQgJKcrHW9oucwKxS5njBc6j452sDfAbMMMvs
 zY71p4Hbgh3/EPWy4LkA1IIRXRP7rO5IjtcYYS6fXy0n00O31rMugybc4
 BYK9cbU/qjQkeRfgv0tDxAF/7E1WyywzK2Ymmgf7AaNKuaS1ZdsF+e+uM
 2yyZj4P3cbrLBECzx3KBhKJeyO/b44WjwOvCQZTHSTtYRnulrdKXUynoC g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="304203760"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="304203760"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 17:10:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="712699129"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 17:10:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/2] i915: Extract, polish, and document multicast handling
Date: Tue, 14 Jun 2022 17:10:17 -0700
Message-Id: <20220615001019.1821989-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.3
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
Cc: harish.chegondi@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Multicast/replicated (MCR) registers on Intel hardware are a purely
GT-specific concept.  Rather than leaving MCR register handling spread
across several places throughout the driver (intel_uncore.c, intel_gt.c,
etc.) with confusing combinations of handler functions living in
different namespaces, let's consolidate it all into a single place
(intel_gt_mcr.c) and provide a more consistent and clearly-documented
interface for the rest of the driver to access such registers:

 * intel_gt_mcr_read -- unicast read from specific instance
 * intel_gt_mcr_read_any[_fw] -- unicast read from any non-terminated
   instance
 * intel_gt_mcr_unicast_write -- unicast write to specific instance
 * intel_gt_mcr_multicast_write[_fw] -- multicast write to all instances


v2:
 - Reference the new kerneldoc from i915.rst.  (Jani)
 - Tweak the wording of the documentation for a couple functions to
   clarify the difference between "_fw" and non-"_fw" forms.

Matt Roper (2):
  drm/i915/gt: Move multicast register handling to a dedicated file
  drm/i915/gt: Cleanup interface for MCR operations

 Documentation/gpu/i915.rst                  |  12 +
 drivers/gpu/drm/i915/Makefile               |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c  |   3 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c   |  36 +-
 drivers/gpu/drm/i915/gt/intel_gt.c          | 297 +-----------
 drivers/gpu/drm/i915/gt/intel_gt.h          |  15 -
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c  |   3 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 497 ++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h      |  34 ++
 drivers/gpu/drm/i915/gt/intel_region_lmem.c |   5 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c |   9 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  |   3 +-
 drivers/gpu/drm/i915/i915_drv.h             |   2 -
 drivers/gpu/drm/i915/intel_uncore.c         | 112 -----
 drivers/gpu/drm/i915/intel_uncore.h         |   8 -
 15 files changed, 577 insertions(+), 460 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_mcr.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_mcr.h

-- 
2.35.3

