Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B483A0C77
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 08:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080356E0DF;
	Wed,  9 Jun 2021 06:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5956E0D6;
 Wed,  9 Jun 2021 06:34:47 +0000 (UTC)
IronPort-SDR: u5DcUwIvC3h7BXb6bVl3R/7eyvUIdR11LaJI/zRBJH9zqDGxcwkJqHCfOqjoZg/nvhzr9Kxycy
 cKz7ReMmfxxg==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="268868875"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="268868875"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 23:34:47 -0700
IronPort-SDR: dK3sOhMys9p6HyLNjO+s5/pR6rdE+fPtUcJDd1O+urh4+kOeU6bN4+dRsnmnrNhFDNDkiFrWfy
 ok6nSc4kh4cg==
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="482265758"
Received: from ekolpasx-mobl.ccr.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.109])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 23:34:44 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/9] Prereqs for TTM accelerated migration
Date: Wed,  9 Jun 2021 08:34:27 +0200
Message-Id: <20210609063436.284332-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A couple of patches from Chris which implement pipelined migration and
clears by atomically writing the PTEs in place before performing the
actual blit.

Some ww utilities mainly for the accompanying selftests added by Thomas,
as well as modified the above patches for ww locking- and lmem support.

The actual hook up to the i915 ttm backend is being worked on and not
included yet, so this is considered to be an early review opportunity.

v2:
- A couple of minor style fixes pointed out by Matthew Auld
- Export and use intel_engine_destroy_pinned_context() to address a
  CI warning / failure.

Chris Wilson (6):
  drm/i915/gt: Add an insert_entry for gen8_ppgtt
  drm/i915/gt: Add a routine to iterate over the pagetables of a GTT
  drm/i915/gt: Export the pinned context constructor and destructor
  drm/i915/gt: Pipelined page migration
  drm/i915/gt: Pipelined clear
  drm/i915/gt: Setup a default migration context on the GT

Thomas Hellström (3):
  drm/i915: Reference objects on the ww object list
  drm/i915: Break out dma_resv ww locking utilities to separate files
  drm/i915: Introduce a ww transaction helper

 drivers/gpu/drm/i915/Makefile                 |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   9 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  68 ++
 drivers/gpu/drm/i915/gt/intel_engine.h        |  12 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  27 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |   2 +
 drivers/gpu/drm/i915/gt/intel_gt.c            |   4 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   3 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   7 +
 drivers/gpu/drm/i915/gt/intel_migrate.c       | 685 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_migrate.h       |  65 ++
 drivers/gpu/drm/i915/gt/intel_migrate_types.h |  15 +
 drivers/gpu/drm/i915/gt/intel_renderstate.h   |   1 +
 drivers/gpu/drm/i915/gt/intel_ring.h          |   1 +
 drivers/gpu/drm/i915/gt/selftest_migrate.c    | 671 +++++++++++++++++
 drivers/gpu/drm/i915/i915_gem.c               |  52 --
 drivers/gpu/drm/i915/i915_gem.h               |  12 -
 drivers/gpu/drm/i915/i915_gem_ww.c            |  63 ++
 drivers/gpu/drm/i915/i915_gem_ww.h            |  50 ++
 .../drm/i915/selftests/i915_live_selftests.h  |   1 +
 .../drm/i915/selftests/i915_perf_selftests.h  |   1 +
 21 files changed, 1675 insertions(+), 76 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate_types.h
 create mode 100644 drivers/gpu/drm/i915/gt/selftest_migrate.c
 create mode 100644 drivers/gpu/drm/i915/i915_gem_ww.c
 create mode 100644 drivers/gpu/drm/i915/i915_gem_ww.h

-- 
2.31.1

