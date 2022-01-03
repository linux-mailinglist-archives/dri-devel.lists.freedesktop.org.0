Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 125D84830CA
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 13:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8463010E18F;
	Mon,  3 Jan 2022 12:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C11F10E156;
 Mon,  3 Jan 2022 11:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641211199; x=1672747199;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kb/navi+wYvI5wAN9GhJp6q9tvI4ptBEkZRUdNlFILE=;
 b=MHXUKj+tZ7QqlE3HkopSEwYzpCyNVPpe/stxSxv1xOeKpMPBJAQoWhKf
 nUMfsg9vxUqqlp0aOTEqWoMNZftjuYJN1XL3YJjV5cv1fK/6uYLcdvEVQ
 F648RWguNOOt373l07w9kQ7T49gapBbb5QeHUGEaT9OZT71E2RCKzDBU3
 ONy3Pu4xGQ5tDsC3VXOFJOB/scHXU5BTCsK7cv4pcWumOM1ZePXTnPD32
 uSW24F78zXcAK4bkSn/J3G96LPOMS3WVsIwfm2rdXDRVaC9Fb6daPpfsZ
 B/z5mLNjVC+PSS5EfzrhUWiLkGM7xLoFdpoykp4VC5c2sJ3+2abLct7tK w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10215"; a="222044502"
X-IronPort-AV: E=Sophos;i="5.88,257,1635231600"; d="scan'208";a="222044502"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2022 03:59:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,257,1635231600"; d="scan'208";a="512018318"
Received: from mikaelsk-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.198])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2022 03:59:57 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/4] drm/i915: Asynchronous vma unbinding
Date: Mon,  3 Jan 2022 12:59:43 +0100
Message-Id: <20220103115947.92688-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series introduces infrastructure for asynchronous vma
unbinding. The single enabled use-case is initially at buffer object
migration where we otherwise sync when unbinding vmas before migration.
This in theory allows us to pipeline any number of migrations, but in
practice the number is restricted by a sync wait when filling the
migration context ring. We might want to look at that moving forward if
needed.

The other main use-case is to be able to pipeline vma evictions, for
example with softpinning where a new vma wants to reuse the vm range
of an already active vma. We can't support this just yet because we
need dma_resv locking around vma eviction for that, which is under
implementation.

Patch 1 introduces vma resource first for error capture purposes.
Patch 2 changes the vm backend interface to take vma resources rather than vmas,
Patch 3 introduces the async unbinding itself, and finally
Patch 4 realizes we have duplicated functionality and removes the vma snapshots.

v2:
-- Some kernel test robot reports addressed.
-- kmem cache for vma resources, See patch 6
-- Various fixes all over the place. See separate commit messages.
v3:
-- Re-add a missing i915_vma_resource_put()
-- Remove a stray debug printout
v4:
-- Patch series split in two. This is the second part.
-- Take cache coloring into account when searching for vma_resources
   pengind unbind. (Matthew Auld)

Thomas Hellström (4):
  drm/i915: Initial introduction of vma resources
  drm/i915: Use the vma resource as argument for gtt binding / unbinding
  drm/i915: Use vma resources for async unbinding
  drm/i915: Use struct vma_resource instead of struct vma_snapshot

 drivers/gpu/drm/i915/Makefile                 |   2 +-
 drivers/gpu/drm/i915/display/intel_dpt.c      |  27 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  17 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  27 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  11 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  37 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  19 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  37 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   9 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  72 +--
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   4 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  19 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  22 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  13 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   2 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |   3 +-
 drivers/gpu/drm/i915/i915_drv.h               |   1 +
 drivers/gpu/drm/i915/i915_gem.c               |  12 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |  87 ++--
 drivers/gpu/drm/i915/i915_module.c            |   3 +
 drivers/gpu/drm/i915/i915_request.c           |  12 +-
 drivers/gpu/drm/i915/i915_request.h           |   6 +-
 drivers/gpu/drm/i915/i915_vma.c               | 227 +++++++++-
 drivers/gpu/drm/i915/i915_vma.h               |  33 +-
 drivers/gpu/drm/i915/i915_vma_resource.c      | 417 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_vma_resource.h      | 235 ++++++++++
 drivers/gpu/drm/i915/i915_vma_snapshot.c      | 134 ------
 drivers/gpu/drm/i915/i915_vma_snapshot.h      | 112 -----
 drivers/gpu/drm/i915/i915_vma_types.h         |   5 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 159 ++++---
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |  12 +-
 31 files changed, 1215 insertions(+), 561 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_vma_resource.c
 create mode 100644 drivers/gpu/drm/i915/i915_vma_resource.h
 delete mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.c
 delete mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.h

-- 
2.31.1

