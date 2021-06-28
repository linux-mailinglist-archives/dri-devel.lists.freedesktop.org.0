Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3253B5AF1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 11:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9056E2ED;
	Mon, 28 Jun 2021 09:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA7E6E2E6;
 Mon, 28 Jun 2021 09:10:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="271774861"
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="271774861"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 02:09:59 -0700
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="419097090"
Received: from danielmi-mobl2.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.242])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 02:09:57 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/5]  drm/i915/gem: Introduce a migrate interface
Date: Mon, 28 Jun 2021 11:09:38 +0200
Message-Id: <20210628090943.45690-1-thomas.hellstrom@linux.intel.com>
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

This series should make accelerated desktop work on DG1 with DG1-enabled
OpenGL.

v2:
- Address review comments by Matthew Auld on patch 1/5. More details on
  the patch commit message.
- Address a dma-buf locking issue pointed out by Michael Ruhl, and
  add a selftest to catch that issue moving forward.
- Rebase the dma-buf migration patch on the above-mentioned fix.

Matthew Auld (1):
  drm/i915/gem: Introduce a selftest for the gem object migrate
    functionality

Thomas Hellström (4):
  drm/i915/gem: Implement object migration
  drm/i915/display: Migrate objects to LMEM if possible for display
  drm/i915/gem: Fix same-driver-another-instance dma-buf export
  drm/i915/gem: Migrate to system at dma-buf map time

 drivers/gpu/drm/i915/display/intel_display.c  |   5 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  36 ++-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c      |  21 --
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  97 +++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  12 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   9 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  69 +++--
 drivers/gpu/drm/i915/gem/i915_gem_wait.c      |  19 ++
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  83 +++++-
 .../drm/i915/gem/selftests/i915_gem_migrate.c | 237 ++++++++++++++++++
 .../drm/i915/selftests/i915_live_selftests.h  |   1 +
 12 files changed, 546 insertions(+), 45 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c

-- 
2.31.1

