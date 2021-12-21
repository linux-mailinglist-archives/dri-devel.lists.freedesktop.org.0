Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CB047C7F0
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 21:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA9C10FD3C;
	Tue, 21 Dec 2021 20:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED48010FCAF;
 Tue, 21 Dec 2021 20:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640116869; x=1671652869;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gesx5pjCCoUny+2tRQR1pkzY1KpuMOmp37xuIFEbTdw=;
 b=l2mF2nl7NoZiCTRSh3XfR1CmlL7JC4F2lw0RESNNEmBbwqsg/lerhOCH
 stSjXOgm8MAD9etHFg/Fu3vpSS/ssIhgT/uOoxGmWPYpyv371PYFidIj3
 U1mjhZxg6zsNgtPppaVqE/Q2iJhlJll4RH/gAehHZ3Keie6o0DUmum8KY
 4WeJKUBcexGLfVPeQQvvqm/C90i6Tv7buRUo3awsUA+eriuET8vcEDWaT
 CMOlRHhQOThyh37002BBQ4CjSKDyOcBcwr0k+Dpqp1s9pCxbffioyjRwW
 U1xddPA3703larblqA5UGuQr2pqXPc/4V5vHKCKsoGZngFQl7BM1IyW9o A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="221157915"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="221157915"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 12:01:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="616887383"
Received: from arajji-mobl.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.222])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 12:01:05 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/4] drm/i915: Asynchronous vma unbinding part1
Date: Tue, 21 Dec 2021 21:00:46 +0100
Message-Id: <20211221200050.436316-1-thomas.hellstrom@linux.intel.com>
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

This is the first three already reviewed patches from the patch series titled
"Asynchronous vma unbinding", with an additional cleanup patch from Christian,
which would otherwise conflict heavily with this series.

Christian König (1):
  drm/i915: remove questionable fence optimization during copy

Thomas Hellström (3):
  drm/i915: Avoid using the i915_fence_array when collecting
    dependencies
  drm/i915: Break out the i915_deps utility
  drm/i915: Require the vm mutex for i915_vma_bind()

 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  50 ++-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 323 +++---------------
 drivers/gpu/drm/i915/gt/intel_migrate.c       |  24 +-
 drivers/gpu/drm/i915/gt/intel_migrate.h       |   9 +-
 drivers/gpu/drm/i915/i915_deps.c              | 237 +++++++++++++
 drivers/gpu/drm/i915/i915_deps.h              |  45 +++
 drivers/gpu/drm/i915/i915_request.c           |  22 ++
 drivers/gpu/drm/i915/i915_request.h           |   2 +
 drivers/gpu/drm/i915/i915_vma.c               |   1 +
 10 files changed, 412 insertions(+), 302 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_deps.c
 create mode 100644 drivers/gpu/drm/i915/i915_deps.h

-- 
2.31.1

