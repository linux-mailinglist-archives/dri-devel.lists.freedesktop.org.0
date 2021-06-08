Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4FA39F133
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 10:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405956EB3A;
	Tue,  8 Jun 2021 08:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA8A6E0E8;
 Tue,  8 Jun 2021 08:44:55 +0000 (UTC)
IronPort-SDR: PoK9fuaobfJPyIjXF8IlpSMVePnlla2vyR0Fj9HkEv4LwqzBBqAChRmYb6Qb1PCTvpLUdMvVUk
 QjTZGs+7otRg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="202943813"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="202943813"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:44:55 -0700
IronPort-SDR: Don0Giq5XTFmzPgPGZmQJqJYn2z0HWBokPp7Lr+VlJ+zkbyNIRe4jtxf6LOoq6GJ4zeDz6cBRq
 Xas8Rjn+myYw==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="440381975"
Received: from mrahim1x-mobl.gar.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.215.170.251])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:44:52 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/6] Add back the buddy allocator
Date: Tue,  8 Jun 2021 09:44:22 +0100
Message-Id: <20210608084428.142676-1-matthew.auld@intel.com>
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
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 102 ++-
 drivers/gpu/drm/i915/i915_buddy.c             | 412 +++++++++
 drivers/gpu/drm/i915/i915_buddy.h             | 133 +++
 drivers/gpu/drm/i915/i915_scatterlist.c       |  80 ++
 drivers/gpu/drm/i915/i915_scatterlist.h       |   5 +
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 248 ++++++
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |  56 ++
 drivers/gpu/drm/i915/intel_memory_region.c    |  55 +-
 drivers/gpu/drm/i915/intel_memory_region.h    |  20 +-
 drivers/gpu/drm/i915/intel_region_ttm.c       | 108 +--
 drivers/gpu/drm/i915/intel_region_ttm.h       |   2 +
 drivers/gpu/drm/i915/selftests/i915_buddy.c   | 789 ++++++++++++++++++
 .../drm/i915/selftests/intel_memory_region.c  | 170 ++--
 drivers/gpu/drm/i915/selftests/mock_region.c  |  17 +-
 15 files changed, 1969 insertions(+), 230 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_buddy.c
 create mode 100644 drivers/gpu/drm/i915/i915_buddy.h
 create mode 100644 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
 create mode 100644 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
 create mode 100644 drivers/gpu/drm/i915/selftests/i915_buddy.c

-- 
2.26.3

