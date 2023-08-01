Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC04976B72A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 16:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3FE10E3FF;
	Tue,  1 Aug 2023 14:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92C710E3FA;
 Tue,  1 Aug 2023 14:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690899610; x=1722435610;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l4J5zsTb7mSM2fk/iTcxzzcaI0h6RjZo3tvY7nEVjkI=;
 b=OZvUCtjonpCkg8UNLVFV0jZ/Yaj8VEW9BVkjqa8Kyxga4PcM9ptn2qn/
 DZUgjR6j9FDUxPHSjeYNDZzMO/VqcIVH/edgeLJKWQIeuO0p0k4FRGL6T
 fv9l+lGFB/UxYTfOz8EPj+/TeUN91O3UkWyrHC9MmT82rx4pbKijHRqkE
 C7R6d/a6qQ/E7jbVfZxbyI1h4yNNajvhQqxkZYKws/0Ob1+92U4mEbpKn
 ssbqqWSxuSopG83nxBJ2WHTpCASZGMZ1OSxqt3g/aC4fSOg8ZYV8sSmFb
 VUa+rF0+PYzhr4zbUBiDiYE08hmgVhmEyQmnRe01I1ndrfsHhCUjH9yyf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="372023366"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="372023366"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 07:20:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="678687193"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="678687193"
Received: from jhajducz-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.37.77])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 07:20:08 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH 0/4] Invalidate TLB cache for all GT's
Date: Tue,  1 Aug 2023 16:19:51 +0200
Message-Id: <20230801141955.383305-1-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series revisits a once-trendy topic: TLB invalidation
support for multi-gt.  It's a theme that's been passed around and
reshaped by several of us.

I've filtered out most of the original changes from this series,
initially sent by Mauro [1]. His ideas were inspired by some
changes from Chris, who in turn was inspired by a change from
me[2], all of which stemmed from offline talks by Chris (it's
like a game of inspiration tag!).

What I've done is simply rebase and refactor the patches,
focusing solely on the changes needed for multi-gt TLB
invalidation in MMIO memory. The result is a leaner, more
targeted proposal.

Other patches from the original series might follow.

Thanks,
Andi

[1] https://patchwork.freedesktop.org/series/106293/
[2] https://patchwork.freedesktop.org/series/103831/

Andi Shyti (2):
  i915/drm/gt: Move the gt defines in the gt directory
  drm/i915: Remove unnecessary include

Chris Wilson (2):
  drm/i915/gt: Move TLB invalidation to its own file
  drm/i915: Invalidate the TLBs on each GT

 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  15 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            | 140 +--------------
 drivers/gpu/drm/i915/gt/intel_gt.h            |  12 --
 drivers/gpu/drm/i915/gt/intel_gt_defines.h    |  11 ++
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |   4 +-
 drivers/gpu/drm/i915/gt/intel_tlb.c           | 159 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_tlb.h           |  29 ++++
 drivers/gpu/drm/i915/gt/selftest_tlb.c        |   3 +-
 drivers/gpu/drm/i915/i915_drv.h               |   1 -
 drivers/gpu/drm/i915/i915_vma.c               |  15 +-
 12 files changed, 231 insertions(+), 163 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_defines.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_tlb.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_tlb.h

-- 
2.40.1

