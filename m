Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A883A24F2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 09:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB866E915;
	Thu, 10 Jun 2021 07:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEDA6E5A2;
 Thu, 10 Jun 2021 07:02:25 +0000 (UTC)
IronPort-SDR: 7pcwbkyqyPDitMYxguOCVmJjEQ8GhJq8PZVan6IwY34m3VB+IMjJX6lJI6/iz80DcHfIlTSTqe
 CuvMpIyvM9dQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="192351618"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="192351618"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 00:02:20 -0700
IronPort-SDR: 3qKiKzNxg88m0klcp+jTIuphXr694PbOml29B44zdkrp2NICOR0nbSgvh6XJLD6m29H6GR72TV
 0j4IV1+U3onw==
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="482717885"
Received: from smirnov2-mobl.ccr.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.160])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 00:02:16 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v11 0/4] Move LMEM (VRAM) management over to TTM
Date: Thu, 10 Jun 2021 09:01:48 +0200
Message-Id: <20210610070152.572423-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remaining patches rebased on latest TTM changes posted for reference and CI.

Maarten Lankhorst (2):
  drm/vma: Add a driver_private member to vma_node.
  drm/i915: Use ttm mmap handling for ttm bo's.

Thomas Hellström (2):
  drm/i915/ttm: Introduce a TTM i915 gem object backend
  drm/i915/lmem: Verify checks for lmem residency

 drivers/gpu/drm/drm_gem.c                     |   9 -
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_display.c  |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c    |   9 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c      | 126 ++--
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h      |   5 -
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  83 ++-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 143 ++--
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  19 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  30 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.c    |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 647 ++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |  48 ++
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  90 +--
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   |   3 +-
 drivers/gpu/drm/i915/i915_gem.c               |   5 +-
 drivers/gpu/drm/i915/intel_memory_region.c    |   1 -
 drivers/gpu/drm/i915/intel_memory_region.h    |   1 -
 drivers/gpu/drm/i915/intel_region_ttm.c       |   8 +-
 drivers/gpu/drm/i915/intel_region_ttm.h       |  11 +-
 drivers/gpu/drm/i915/selftests/igt_mmap.c     |  25 +-
 drivers/gpu/drm/i915/selftests/igt_mmap.h     |  12 +-
 include/drm/drm_vma_manager.h                 |   2 +-
 24 files changed, 1039 insertions(+), 250 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.h

-- 
2.31.1

