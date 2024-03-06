Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC34872F22
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 08:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8F8112F6B;
	Wed,  6 Mar 2024 07:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c1LRJwBR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C176112D88;
 Wed,  6 Mar 2024 07:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709708499; x=1741244499;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cv8IgEE2bAZ2HssNjlkHruYeU7ncm7wpmqAMQS9TlWE=;
 b=c1LRJwBRk1EBAPEfqn1wi2LGBjKHmD3B9Wfx0UcvUrKTqtFTGMaMIcmQ
 KvDibBtuX4YgyKKjyrSnhKNkoRbyHEnyBhkruNW7OtvHHT+l5SoCc5otq
 qTDPn5de63in9ao0kDxkkmyK+c9ahGNX1BMLUyS/sXJxY5E2w/Wrs5OZg
 UemrtRTX6tvj394fPrEmgD4R6dyt7WuzBiBNjgjpzLfYN5OJU5cf+Nwq1
 afQ0iOXMVkYm9dI7LCyEek+uMJbOB9YFR/0vQ7VbU4shZ1l6zrYJhlNh4
 ZxJ6zV7EwUtJpw/oLPVdVr+ZLl84In6Uc60BAnie/mEgrt4FV7ccm0FdQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4457464"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4457464"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 23:01:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; d="scan'208";a="14314379"
Received: from fatinf5x-mobl.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 23:01:37 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/4] TTM unlockable restartable LRU list iteration
Date: Wed,  6 Mar 2024 08:01:21 +0100
Message-ID: <20240306070125.27071-1-thomas.hellstrom@linux.intel.com>
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
v4:
- Remove some leftover code causing build problems.

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
 include/drm/ttm/ttm_device.h           |   2 +
 include/drm/ttm/ttm_resource.h         |  96 +++++++++--
 7 files changed, 308 insertions(+), 60 deletions(-)

-- 
2.44.0

