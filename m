Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF806872381
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 17:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFB21125A1;
	Tue,  5 Mar 2024 16:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dZ/LT/5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E30112541;
 Tue,  5 Mar 2024 16:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709654558; x=1741190558;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KfPXzDhZw6K1bb5UJHweMx+YLbmt1xzNVP+kDJc2C00=;
 b=dZ/LT/5Jtuwrjpw/VIbzWlU/FXQNt1fws+JpNZir4dQ3n6MRB+Wj62ck
 XnSiWAUPjKel4jh0PhKuPt9OcLhaX3sXlyS/KWftYU2T8gSIyrSeocr94
 uTfZnS9xR4DDcrWSADxkljocPdNVjNS3a2AzX9AyFwWx1jQ/dBKE29o5s
 zS3VtjP+SyZgfTt/fbC/Rqa/11fqgBlr33jq6ab2uFVWkD8tk9i7hOAVJ
 8w64/yTizoDcR7WYkxdJuwLrcKKIy9AlWTFxjr46iTHBKtTtWo4L+Jmtq
 ZiW4sD6bGe3HfgtcyiQHFh8O0nZrgm73a5hmy1W9z6Di5WHj9ANNuoimf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4140844"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4140844"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 08:02:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="14001488"
Received: from haslam-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.144])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 08:02:22 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/4] TTM unlockable restartable LRU list iteration 
Date: Tue,  5 Mar 2024 17:01:58 +0100
Message-ID: <20240305160202.3555-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch-set is a prerequisite for a standalone TTM shrinker
and for exhaustive TTM eviction using sleeping dma_resv locks,
which is the motivation for it.

Currently when unlocking the TTM lru list lock, iteration needs
to be restarted from the beginning, rather from the next LRU list
node. This can potentially be a big problem, because if eviction
or shrinking fails for whatever reason after unlock, restarting
is likely to cause the same failure over and over again.

There are various schemes to be able to continue the list
iteration from where we left off. One such scheme used by the
GEM LRU list traversal is to pull items already considered off
the LRU list and reinsert them when iteration is done.
This has the drawback that concurrent list iteration doesn't see
the complete list (which is bad for exhaustive eviction) and also
doesn't lend itself well to bulk-move sublists since these will
be split in the process where items from those lists are
temporarily pulled from the list and moved to the list tail.

The approach taken here is that list iterators insert themselves
into the list next position using a special list node. Iteration
is then using that list node as starting point when restarting.
Concurrent iterators just skip over the special list nodes.

This is implemented in patch 1 and 2.

For bulk move sublist the approach is the same, but when a bulk
move sublist is moved to the tail, the iterator is also moved,
causing us to skip parts of the list. That is undesirable.
Patch 3 deals with that, and when iterator detects it is
traversing a sublist, it registers with the ttm_lru_bulk_move
struct using a linked list, and when that bulk move sublist
is moved to the tail, any iterator registered with it will
first be moved to the tail of the sublist.
This is implemented in patch 3.

The restartable property is used in patch 4 to restart swapout if
needed, but the main purpose is this paves the way for
shrinker- and exhaustive eviction.

v2:
- Rework patch 3 completely.
v3:
- Fix a NULL pointer dereference found by Xe CI.

Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: <dri-devel@lists.freedesktop.org>

Thomas Hellström (4):
  drm/ttm: Allow TTM LRU list nodes of different types
  drm/ttm: Use LRU hitches
  drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist
    moves
  drm/ttm: Allow continued swapout after -ENOSPC falure

 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |   4 +
 drivers/gpu/drm/ttm/ttm_bo.c           |   1 +
 drivers/gpu/drm/ttm/ttm_device.c       |  33 +++-
 drivers/gpu/drm/ttm/ttm_resource.c     | 228 ++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_vm.c             |   4 +
 include/drm/ttm/ttm_device.h           |   5 +
 include/drm/ttm/ttm_resource.h         |  96 +++++++++--
 7 files changed, 311 insertions(+), 60 deletions(-)

-- 
2.44.0

