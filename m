Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F2252265B
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 23:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4B810E10C;
	Tue, 10 May 2022 21:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FEF510E0AB;
 Tue, 10 May 2022 21:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652218407; x=1683754407;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M6GlzO6Ay0nSAngYN1oRMJdH5qFEW7l3ClMYsjpzxy8=;
 b=MFHEEeTHjMaBQVSqXht3k4Mp+Jy+8Qb4jOyCSWJli6gspiiw5a3JuxNJ
 9ZgBd4TotncVb5ogP46bzf1LDBqt4xpxWUsAoy3B++MIFA+aTl4uUAGJ+
 qlHbMzdA1e+b/0RNnfOlr4wrdFBz77xye09qFyVx9V9itfCi+U5QFAHqM
 khCQ7UZJ4CD4W/nCIBph6xPGG+2b0A2v+CA4dLTpoyskp43WzV6L7xkQK
 HpznWnVv8l1H1CTai/uE9VnWpuD0ZiaWYxd5IX40OqDrw3gUPTYtzjWuR
 qhh29PGcAEE7MptCuXmneaf8tUola/XtJeQiukyPI1uhZa8HnCWVZbZrM g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="294746170"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="294746170"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 14:33:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="593769219"
Received: from brauta-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.50.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 14:33:23 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/3] Clear TLB caches in all tiles when object is removed 
Date: Tue, 10 May 2022 23:33:01 +0200
Message-Id: <20220510213304.101055-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.36.0
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

Andi Shyti (2):
  drm/i915/gem: Flush TLBs for all the tiles when clearing an obj
  drm/i915/gt: Skip TLB invalidation if the engine is not awake

Chris Wilson (1):
  drm/i915/gt: Ignore TLB invalidations on idle engines

 drivers/gpu/drm/i915/gem/i915_gem_pages.c | 12 +++++++++---
 drivers/gpu/drm/i915/gt/intel_gt.c        |  3 +++
 drivers/gpu/drm/i915/gt/intel_gt_pm.h     |  4 ++++
 3 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.36.0

