Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78977B2F6FC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 13:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855B610E93E;
	Thu, 21 Aug 2025 11:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SNbOWCcO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C86310E93E;
 Thu, 21 Aug 2025 11:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755776807; x=1787312807;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7uXfokjMPHH00LPtHChffrlYvCk5IWl4R1qCTaEowDw=;
 b=SNbOWCcOTWi8ITEv+4C4rKI82YkZ6CeCkhkj+fNuPy6CGOFEoEsR3NH9
 o+OZCyyymckeXNeNZq8QTs9SeAsNb4A1+KPMqxBQFR3rKdunYy11Qgjf5
 lcWiEEGvBU05/L5uycA/uzZZk1SwODcAaktOqlSOpiy4tj9K3ozpAm7pK
 2LoGVaOUx/a1ONSablJXPIhtEF8iFRB1k/4RH4U4IzbvMxjc96XtHI5eG
 tEiPbIgl09Y/Zu2hY/pT2SQzh6VzP8SJYjIIIPla83h/E8d5llVAh28j0
 tIPZITby+y+uOefO1fxJ4tYPs71dlis7n8zkCrG5dr3JmcbQDSQbhQgHm g==;
X-CSE-ConnectionGUID: DHCQjvhtR9+doDP2sbZXIw==
X-CSE-MsgGUID: dBsvI9DzQputPscGlZMI0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57989435"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="57989435"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 04:46:46 -0700
X-CSE-ConnectionGUID: Y8pJ+9VwQ6G4Wx9YReIMZg==
X-CSE-MsgGUID: MvxPC/g/T2aAKS3JJBXqIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="172613623"
Received: from johunt-mobl9.ger.corp.intel.com (HELO fedora) ([10.245.245.201])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 04:46:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 0/6] Two-pass MMU interval notifiers
Date: Thu, 21 Aug 2025 13:46:20 +0200
Message-ID: <20250821114626.89818-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GPU use-cases for mmu_interval_notifiers with hmm often involve
starting a gpu operation and then waiting for it to complete.
These operations are typically context preemption or TLB flushing.
    
With single-pass notifiers per GPU this doesn't scale in
multi-gpu scenarios. In those scenarios we'd want to first start
preemption- or TLB flushing on all GPUs and as a second pass wait
for them to complete.
    
One can do this on per-driver basis multiplexing per-driver
notifiers but that would mean sharing the notifier "user" lock
across all GPUs and that doesn't scale well either, so adding support
for two-pass in the core appears like the right choice.

So this series does that, with pach 1 implementing the core support
and also describes the choices made.
The rest of the patches implements a POC with drm_gpusvm, but this
will also come in handy for things like userptr where waiting for
bind completion, starting of preemption and waiting for
preemption completion can pe pipelined across GPUs.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: <dri-devel@lists.freedesktop.org>
Cc: <linux-mm@kvack.org>
Cc: <linux-kernel@vger.kernel.org>

Matthew Brost (5):
  drm/gpusvm, drm/xe: Update GPU SVM / Xe to twopass MMU notifier
  drm/gpusvm: Add drm_gpusvm_in_notifier_* helpers
  drm/xe: Skip waiting on unarmed fences in
    xe_gt_tlb_invalidation_fence_wait
  drm/xe: Add fences argument to xe_vm_range_tilemask_tlb_invalidation
  drm/xe: Implement two pass MMU notifiers for SVM

Thomas Hellström (1):
  mm/mmu_notifier: Allow two-pass struct mmu_interval_notifiers

 drivers/gpu/drm/drm_gpusvm.c                | 18 +++--
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  3 +-
 drivers/gpu/drm/xe/xe_svm.c                 | 83 +++++++++++++++++----
 drivers/gpu/drm/xe/xe_vm.c                  | 26 ++++---
 drivers/gpu/drm/xe/xe_vm.h                  |  6 +-
 include/drm/drm_gpusvm.h                    | 33 ++++++--
 include/linux/mmu_notifier.h                | 42 +++++++++++
 mm/mmu_notifier.c                           | 63 +++++++++++++---
 8 files changed, 224 insertions(+), 50 deletions(-)

-- 
2.50.1

