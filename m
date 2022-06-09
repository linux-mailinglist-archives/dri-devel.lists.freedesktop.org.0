Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9FB545262
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 18:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD1811A98F;
	Thu,  9 Jun 2022 16:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878B711A8B7;
 Thu,  9 Jun 2022 16:52:24 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E56D666017AF;
 Thu,  9 Jun 2022 17:52:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654793543;
 bh=pQCbRn0lVajQk4VcAMZCeQpf9tg2Mi87SQhPp9uya5o=;
 h=From:To:Cc:Subject:Date:From;
 b=a4/bgd1loAfBcHpIZIkM9KCjjSeTQB/KSyl2JM5H3xp+o4uanBoKLs0IMtVAsnqoJ
 s6CEUVWuKt3KFc4Qzjb3ENm8hB4rR5Cz7iBHXtkLMgFLF5bSOzY4wtYHnsxxzuYtHc
 OimHPLWyuwPCGu9JS3c3Vs9JrRd15fa+PXlFTDG1e2xb3qoX2yKvkCi9oIULItgzUu
 iIwWbDzBpqqAaMyO+tscY2u5RgpImmfiFS5LpH+y/zT2bNzRSmQTmY2ZcvEsM6A0XV
 e3Ux81/hfc3IgGXvNpIa80ooAxrItrlTyXkpCx0R/PuHySdTkRG/dPGr/YSEPEfvHC
 4S7se0jewuu/Q==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/8] drm/i915: ttm for internal
Date: Thu,  9 Jun 2022 16:51:52 +0000
Message-Id: <20220609165200.842821-1-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 kernel@collabora.com, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series refactors i915's internal buffer backend to use ttm.
It uses ttm's pool allocator to allocate volatile pages in place of the
old code which rolled its own via alloc_pages.
This is continuing progress to align all backends on using ttm.

v2:	- commit message improvements to add detail
	- fix i915_ttm_shrink to purge !is_shmem volatile buffers
	- limit ttm pool allocator to using dma32 on i965G[M]
	- fix mman selftest to always use smem buffers
	- create new internal memory region
	- make internal backend allocate from internal region
	- Fixed various issues with tests and i915 ttm usage as a result
	  of supporting regions other than lmem via ttm.

v4:	- limit i915 ttm default cache_level selection to only trust
v4:	- limit i915 ttm default cache_level selection to only trust
	  HAS_SNOOP on DGFX.

Robert Beckett (8):
  drm/i915/ttm: dont trample cache_level overrides during ttm move
  drm/i915: add gen6 ppgtt dummy creation function
  drm/i915: setup ggtt scratch page after memory regions
  drm/i915: allow volatile buffers to use ttm pool allocator
  drm/i915: limit ttm to dma32 for i965G[M]
  drm/i915/gem: further fix mman selftest
  drm/i915/ttm: only trust snooping for dgfx when deciding default
    cache_level
  drm/i915: internal buffers use ttm backend

 drivers/gpu/drm/i915/gem/i915_gem_internal.c  | 187 +-----------------
 drivers/gpu/drm/i915/gem/i915_gem_internal.h  |   5 -
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   1 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  13 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  20 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  43 +++-
 drivers/gpu/drm/i915/gt/intel_gt_gmch.c       |  20 +-
 drivers/gpu/drm/i915/gt/intel_gt_gmch.h       |   6 +
 drivers/gpu/drm/i915/i915_driver.c            |  16 +-
 drivers/gpu/drm/i915/i915_pci.c               |   4 +-
 drivers/gpu/drm/i915/intel_memory_region.c    |   8 +-
 drivers/gpu/drm/i915/intel_memory_region.h    |   2 +
 drivers/gpu/drm/i915/intel_region_ttm.c       |   7 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |   2 +-
 17 files changed, 123 insertions(+), 221 deletions(-)

-- 
2.25.1

