Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F2339F251
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 11:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB456EB5E;
	Tue,  8 Jun 2021 09:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184EF6EB59;
 Tue,  8 Jun 2021 09:29:02 +0000 (UTC)
IronPort-SDR: 2V0jOap7v/UWfPQ7w/BEIrtNmIW7mxoMjDoc/Jy2AXgogypNUDxr0k21hCKWlrd7a/qlLIcGbk
 iMlQ5vNm7WsA==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="226150947"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="226150947"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 02:29:01 -0700
IronPort-SDR: c1It2S4T6CGXRNG48guOPZZYK00ToqM5IrkpWyooiPJIDplfWpSNSfUfsyewg7ss/DoxHo47op
 iQd+9nr3Yo9w==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="551544329"
Received: from mkayyal-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.115])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 02:28:59 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/9] Prereqs for TTM accelerated migration
Date: Tue,  8 Jun 2021 11:28:37 +0200
Message-Id: <20210608092846.64198-1-thomas.hellstrom@linux.intel.com>
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

Chris Wilson (6):
  drm/i915/gt: Add an insert_entry for gen8_ppgtt
  drm/i915/gt: Add a routine to iterate over the pagetables of a GTT
  drm/i915/gt: Export the pinned context constructor
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
 drivers/gpu/drm/i915/gt/intel_engine.h        |  10 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  21 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |   2 +
 drivers/gpu/drm/i915/gt/intel_gt.c            |   4 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   3 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   7 +
 drivers/gpu/drm/i915/gt/intel_migrate.c       | 684 ++++++++++++++++++
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
 21 files changed, 1669 insertions(+), 73 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate_types.h
 create mode 100644 drivers/gpu/drm/i915/gt/selftest_migrate.c
 create mode 100644 drivers/gpu/drm/i915/i915_gem_ww.c
 create mode 100644 drivers/gpu/drm/i915/i915_gem_ww.h

-- 
2.31.1

