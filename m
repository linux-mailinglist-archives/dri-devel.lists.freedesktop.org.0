Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD32E39F488
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 13:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4B06E118;
	Tue,  8 Jun 2021 11:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347ED6E111;
 Tue,  8 Jun 2021 11:03:32 +0000 (UTC)
IronPort-SDR: UPmivUV+U7ygOv/7SBBaeRfqYcwFuAyMSFidqLpyAF+NJfh8JtH7rMzgRro3ogkBjDwWBS0yHF
 KI2hTFtWf4xA==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="268674730"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="268674730"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 04:03:20 -0700
IronPort-SDR: YwYXbRV02K4qmf/ff3BjIHxbhp2CuuvSZpnYvRa+PX6eFzDU6wQEVUlPZJswYQCPkCLt7qBPI7
 1ozx10AUbX/w==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="552237143"
Received: from mrahim1x-mobl.gar.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.215.170.251])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 04:03:17 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/7] Add back the buddy allocator
Date: Tue,  8 Jun 2021 12:02:47 +0100
Message-Id: <20210608110254.169357-1-matthew.auld@intel.com>
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

Matthew Auld (6):
  drm/i915/ttm: add ttm_buddy_man
  drm/i915/ttm: add i915_sg_from_buddy_resource
  drm/i915/ttm: pass along the I915_BO_ALLOC_CONTIGUOUS
  drm/i915/ttm: remove node usage in our naming
  drm/i915/ttm: switch over to ttm_buddy_man
  drm/i915/ttm: restore min_page_size behaviour

Thomas Hellström (1):
  drm/i915/ttm: Calculate the object placement at get_pages time

 drivers/gpu/drm/i915/Makefile                 |   2 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   5 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  98 ++-
 drivers/gpu/drm/i915/i915_buddy.c             | 412 +++++++++
 drivers/gpu/drm/i915/i915_buddy.h             | 133 +++
 drivers/gpu/drm/i915/i915_scatterlist.c       |  80 ++
 drivers/gpu/drm/i915/i915_scatterlist.h       |   5 +
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 248 ++++++
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |  56 ++
 drivers/gpu/drm/i915/intel_memory_region.c    |  55 +-
 drivers/gpu/drm/i915/intel_memory_region.h    |  20 +-
 drivers/gpu/drm/i915/intel_region_ttm.c       | 139 ++-
 drivers/gpu/drm/i915/intel_region_ttm.h       |  16 +-
 drivers/gpu/drm/i915/selftests/i915_buddy.c   | 789 ++++++++++++++++++
 .../drm/i915/selftests/intel_memory_region.c  | 170 ++--
 drivers/gpu/drm/i915/selftests/mock_region.c  |  28 +-
 16 files changed, 2003 insertions(+), 253 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_buddy.c
 create mode 100644 drivers/gpu/drm/i915/i915_buddy.h
 create mode 100644 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
 create mode 100644 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
 create mode 100644 drivers/gpu/drm/i915/selftests/i915_buddy.c

-- 
2.26.3

