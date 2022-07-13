Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF1F573795
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 15:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDEE10EDC7;
	Wed, 13 Jul 2022 13:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD2B10E39F;
 Wed, 13 Jul 2022 13:38:39 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 576D666019B6;
 Wed, 13 Jul 2022 14:38:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657719518;
 bh=s+i54G2qFMY7k4hZiW6XrnLWSTCsbPrc1QYLZP1Vpqk=;
 h=From:To:Cc:Subject:Date:From;
 b=VhnZQq1tK/0oM/jV0oh3yvhbcDKYFbLCkh1hbuh1GxunyjZ1NKwkIVpMBDeqfrD3c
 ZkhAn8Q7nGgZbVaAKcXjzsfumXQfZRcj6QJ9LHcJ6ft5SMxQ2PFS5ioFy+FxKu6GPU
 cNBfTs+er73jsOkx3TtY1gy5+hoiQ235jMa8kkfQjU87ISXCT+ZqsvDTBvfcYB7quw
 9LS6WccB3TzZ8RXvU5gUjTPoXtQ7HEu/iKVQeSUhFLTy4AEqP7jVOhjJMT7iv9JFcI
 /M42clRdfDQqTQB+r3VWe1rzrC6TQpSLwvar4GyfiAz+ZOayV9sYnA8IHzacyPLQkC
 L2bf1jRp4tBDw==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 0/8] drm/i915: ttm for internal
Date: Wed, 13 Jul 2022 14:38:10 +0100
Message-Id: <20220713133818.3699604-1-bob.beckett@collabora.com>
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

v3:	- limit i915 ttm default cache_level selection to only trust
	  HAS_SNOOP on DGFX.

v4:	- rebase to drm-tip and handle conflicts

Robert Beckett (8):
  drm/i915/ttm: dont trample cache_level overrides during ttm move
  drm/i915: limit ttm to dma32 for i965G[M]
  drm/i915/ttm: only trust snooping for dgfx when deciding default
    cache_level
  drm/i915: add gen6 ppgtt dummy creation function
  drm/i915: setup ggtt scratch page after memory regions
  drm/i915: allow volatile buffers to use ttm pool allocator
  drm/i915/gem: further fix mman selftest
  drm/i915: internal buffers use ttm backend

 drivers/gpu/drm/i915/gem/i915_gem_internal.c  | 187 +-----------------
 drivers/gpu/drm/i915/gem/i915_gem_internal.h  |   5 -
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   1 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  13 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  17 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  43 +++-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  20 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   1 +
 drivers/gpu/drm/i915/i915_driver.c            |  16 +-
 drivers/gpu/drm/i915/i915_pci.c               |   4 +-
 drivers/gpu/drm/i915/intel_memory_region.c    |   8 +-
 drivers/gpu/drm/i915/intel_memory_region.h    |   2 +
 drivers/gpu/drm/i915/intel_region_ttm.c       |   7 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |   2 +-
 16 files changed, 114 insertions(+), 221 deletions(-)

-- 
2.25.1

