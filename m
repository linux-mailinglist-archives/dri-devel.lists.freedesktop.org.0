Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976D73B35C5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 20:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018D76EC7A;
	Thu, 24 Jun 2021 18:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94646EC78;
 Thu, 24 Jun 2021 18:31:25 +0000 (UTC)
IronPort-SDR: L/kXFticsq1TmKCGjTG6iFpPl/Pu94EaQrVmYRuc1YJP2EBZDrrzh4r3usDjTV5L6cLa3Gofu8
 p2XJQP2lex7A==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="207354183"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="207354183"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 11:31:25 -0700
IronPort-SDR: rx079BVLzev/HeNQJcHhqf5yLMfv1sZRdb+dSbF+j2JLvsRSWXP8xaDf+x8NpDjLZ+RX5jSkI8
 I9EDy4euCBEg==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="556585507"
Received: from mkayyal-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.243])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 11:31:22 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm/i915/gem: Introduce a migrate interface
Date: Thu, 24 Jun 2021 20:31:06 +0200
Message-Id: <20210624183110.22582-1-thomas.hellstrom@linux.intel.com>
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

We want to be able to explicitly migrate objects between gem memory
regions, initially for display and dma-buf, but there might be more
use-cases coming up.

Introduce a gem migrate interface, add a selftest and use it for
display fb pinning and dma-buf mapping.

This series should make the desktop light up on DG1 with DG1-enabled
mesa.

Matthew Auld (1):
  drm/i915/gem: Introduce a selftest for the gem object migrate
    functionality

Thomas Hellström (3):
  drm/i915/gem: Implement object migration
  drm/i915/display: Migrate objects to LMEM if possible for display
  drm/i915/gem: Migrate to system at dma-buf map time

 drivers/gpu/drm/i915/display/intel_display.c  |   5 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   9 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c      |  21 --
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  92 +++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  12 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   9 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  69 +++--
 drivers/gpu/drm/i915/gem/i915_gem_wait.c      |  19 ++
 .../drm/i915/gem/selftests/i915_gem_migrate.c | 237 ++++++++++++++++++
 .../drm/i915/selftests/i915_live_selftests.h  |   1 +
 11 files changed, 434 insertions(+), 42 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c

-- 
2.31.1

