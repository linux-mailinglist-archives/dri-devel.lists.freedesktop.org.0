Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FE239E68B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 20:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB676E02A;
	Mon,  7 Jun 2021 18:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56466E02A;
 Mon,  7 Jun 2021 18:24:01 +0000 (UTC)
IronPort-SDR: VM48LgduYwQKB0aZY6D5IKq2hArrq+6LIJkQOB9DKQ52g7N5etvmkJXqfzqaemtVdBIkhRqrJm
 IKz9V0OjljYg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="185051935"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="185051935"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 11:24:01 -0700
IronPort-SDR: xI2ghkBynp4BN09AoF0Z8UN1dsFMnjcf0d1VcQusg744KxuHkS186BHzEXZagL8sy8U443Z9w9
 p8hjq+dXnnPA==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="476295014"
Received: from iwilsonx-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.48])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 11:24:00 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/6] Add back the buddy allocator
Date: Mon,  7 Jun 2021 19:22:04 +0100
Message-Id: <20210607182210.99036-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Needs to be applied on top of:
https://patchwork.freedesktop.org/series/90681/

Matthew Auld (5):
  drm/i915/ttm: add ttm_buddy_man
  drm/i915/ttm: add i915_sg_from_buddy_resource
  drm/i915/ttm: pass along the I915_BO_ALLOC_CONTIGUOUS
  drm/i915/ttm: switch over to ttm_buddy_man
  drm/i915/ttm: restore min_page_size behaviour

Thomas Hellström (1):
  drm/i915/ttm: Calculate the object placement at get_pages time

 drivers/gpu/drm/i915/Makefile                 |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 105 ++-
 drivers/gpu/drm/i915/i915_buddy.c             | 412 +++++++++
 drivers/gpu/drm/i915/i915_buddy.h             | 133 +++
 drivers/gpu/drm/i915/i915_scatterlist.c       |  80 ++
 drivers/gpu/drm/i915/i915_scatterlist.h       |   5 +
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 246 ++++++
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |  56 ++
 drivers/gpu/drm/i915/intel_memory_region.c    |  55 +-
 drivers/gpu/drm/i915/intel_memory_region.h    |  20 +-
 drivers/gpu/drm/i915/intel_region_ttm.c       | 108 +--
 drivers/gpu/drm/i915/intel_region_ttm.h       |   2 +
 drivers/gpu/drm/i915/selftests/i915_buddy.c   | 789 ++++++++++++++++++
 .../drm/i915/selftests/intel_memory_region.c  | 170 ++--
 drivers/gpu/drm/i915/selftests/mock_region.c  |  17 +-
 15 files changed, 1970 insertions(+), 230 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_buddy.c
 create mode 100644 drivers/gpu/drm/i915/i915_buddy.h
 create mode 100644 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
 create mode 100644 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
 create mode 100644 drivers/gpu/drm/i915/selftests/i915_buddy.c

-- 
2.26.3

