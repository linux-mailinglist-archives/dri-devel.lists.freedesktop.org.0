Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150BB574CEB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 14:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A91E1129D6;
	Thu, 14 Jul 2022 12:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785171128FC;
 Thu, 14 Jul 2022 12:06:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DBABAB824D6;
 Thu, 14 Jul 2022 12:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC46C3411C;
 Thu, 14 Jul 2022 12:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657800390;
 bh=ioPt7kFKeifnjLXg/GVO5rsw0/XP4QklnHiUNXNykLo=;
 h=From:To:Cc:Subject:Date:From;
 b=Z7ro75iW1UoM7wHwaMx+qUHZI6vArOYbghmPbHedqR5hF+6JUW3pQMHJzbKJIjfeN
 rDZ8bY/IlvHm53HAUe67A8TPgkjjMFbp+d8q00Wxd4hV+FZRuiKwbhGDZCJY4EsT5j
 hsxaEQvBoeRs5G+JTdVUFRrRYRQFGTI4abDDjb6yUKdGQ4VMkW+IX4a1Y10yNtFj0D
 nsI88zyDDDGmEMEAI2dzJe+hmO724/ZjwBdKnutsxKwLSPCF7kL5X6E/nBfBTq+ukc
 BKaZC+FZP5Jk/riC30i7E6Qb1DvX8/AKB8HlO8luQXnvkFlY5WP6MIQ5Kh3fdU7kTA
 Z4iCW7eROb5JQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBxbv-0059sS-OX;
 Thu, 14 Jul 2022 13:06:27 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 00/21] Fix performance regressions with TLB and add GuC
 support
Date: Thu, 14 Jul 2022 13:06:05 +0100
Message-Id: <cover.1657800199.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TLB invalidation is a slow operation. It should not be doing lightly, as it
causes performance regressions, like this:

[178.821002] i915 0000:00:02.0: [drm] *ERROR* rcs0 TLB invalidation did not complete in 4ms!

This series contain 

1) some patches that makes TLB invalidation to happen only on
active, non-wedged engines, doing cache invalidation in batch 
and only when GT objects are exposed to userspace:

  drm/i915/gt: Ignore TLB invalidations on idle engines
  drm/i915/gt: Only invalidate TLBs exposed to user manipulation
  drm/i915/gt: Skip TLB invalidations once wedged
  drm/i915/gt: Batch TLB invalidations
  drm/i915/gt: Move TLB invalidation to its own file

2) It fixes two bugs, being the first a workaround:

  drm/i915/gt: Invalidate TLB of the OA unit at TLB invalidations
  drm/i915: Invalidate the TLBs on each GT

  drm/i915/guc: Introduce TLB_INVALIDATION_ALL action

3) It adds GuC support. Besides providing TLB invalidation on some
additional hardware, this should also help serializing GuC operations
with TLB invalidation:

  drm/i915/guc: Introduce TLB_INVALIDATION_ALL action
  drm/i915/guc: Define CTB based TLB invalidation routines
  drm/i915: Add platform macro for selective tlb flush
  drm/i915: Define GuC Based TLB invalidation routines
  drm/i915: Add generic interface for tlb invalidation for XeHP
  drm/i915: Use selective tlb invalidations where supported

4) It adds the corresponding kernel-doc markups for the kAPI
used for TLB invalidation.

While I could have split this into smaller pieces, I'm opting to send
them altogether, in order for CI trybot to better verify what issues
will be closed with this series.

---

v2:
  - no changes. Just rebased on the top of drm-tip: 2022y-07m-14d-08h-35m-36s,
   as CI trybot was having troubles applying it. Hopefully, it will now work.

Chris Wilson (7):
  drm/i915/gt: Ignore TLB invalidations on idle engines
  drm/i915/gt: Invalidate TLB of the OA unit at TLB invalidations
  drm/i915/gt: Only invalidate TLBs exposed to user manipulation
  drm/i915/gt: Skip TLB invalidations once wedged
  drm/i915/gt: Batch TLB invalidations
  drm/i915/gt: Move TLB invalidation to its own file
  drm/i915: Invalidate the TLBs on each GT

Mauro Carvalho Chehab (8):
  drm/i915/gt: document with_intel_gt_pm_if_awake()
  drm/i915/gt: describe the new tlb parameter at i915_vma_resource
  drm/i915/guc: use kernel-doc for enum intel_guc_tlb_inval_mode
  drm/i915/guc: document the TLB invalidation struct members
  drm/i915: document tlb field at struct drm_i915_gem_object
  drm/i915/gt: document TLB cache invalidation functions
  drm/i915/guc: describe enum intel_guc_tlb_invalidation_type
  drm/i915/guc: document TLB cache invalidation functions

Piotr Piórkowski (1):
  drm/i915/guc: Introduce TLB_INVALIDATION_ALL action

Prathap Kumar Valsan (5):
  drm/i915/guc: Define CTB based TLB invalidation routines
  drm/i915: Add platform macro for selective tlb flush
  drm/i915: Define GuC Based TLB invalidation routines
  drm/i915: Add generic interface for tlb invalidation for XeHP
  drm/i915: Use selective tlb invalidations where supported

 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  28 +-
 drivers/gpu/drm/i915/gt/intel_engine.h        |   1 +
 drivers/gpu/drm/i915/gt/intel_gt.c            | 125 +-------
 drivers/gpu/drm/i915/gt/intel_gt.h            |   2 -
 .../gpu/drm/i915/gt/intel_gt_buffer_pool.h    |   3 +-
 drivers/gpu/drm/i915/gt/intel_gt_defines.h    |  11 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.h         |  10 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   8 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |  22 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |   8 +-
 drivers/gpu/drm/i915/gt/intel_tlb.c           | 295 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_tlb.h           |  30 ++
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |  54 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 232 ++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  36 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  24 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   9 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  91 +++++-
 drivers/gpu/drm/i915/i915_drv.h               |   4 +-
 drivers/gpu/drm/i915/i915_pci.c               |   1 +
 drivers/gpu/drm/i915/i915_vma.c               |  46 ++-
 drivers/gpu/drm/i915/i915_vma.h               |   2 +
 drivers/gpu/drm/i915/i915_vma_resource.c      |   9 +-
 drivers/gpu/drm/i915/i915_vma_resource.h      |   6 +-
 drivers/gpu/drm/i915/intel_device_info.h      |   1 +
 27 files changed, 910 insertions(+), 155 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_defines.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_tlb.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_tlb.h

-- 
2.36.1


