Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105F7928BA5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 17:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7525B10EBFA;
	Fri,  5 Jul 2024 15:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TvIWTByL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C35610EBFA;
 Fri,  5 Jul 2024 15:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720193537; x=1751729537;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WKkiz+/zlxp+0HQSXay/z3v10pckoLidBbz4xyVLd2s=;
 b=TvIWTByLw0jMgKohJ/mY0+wI9SU7TBr2BTtNPZpCQmQItjnR1A9Dltzr
 1LiL/L2QXTUOg4F33wzO8sD9Pid2C3cR0J0fAtOwUkiSihiNVJ/IGAeAG
 D+6aCdQc4tYa6+pRAN6go4TzZSewH0JSDTAJLV9UOylWl/FMWXYoLYNEV
 0jkXP+GMoB8Z1k0OkX5lMRZX+95hpvvhnRNQbsZLCelCWGn7C+AG6F6yh
 App6Cd32ab8NylJF8tXT21JLSS2z3DdBzeWYAv39UT7k43zIyc9BxSt8Z
 L76hAElQWPrpml8vbEZ9U7r8boNYnNwyZXzQGfLTKi5arvqQrb6LUns7j g==;
X-CSE-ConnectionGUID: LpWuh9vKQZ+P7zBCFjvg7Q==
X-CSE-MsgGUID: e8kdbkCgRp6THDgOOR9XKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17622904"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="17622904"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 08:32:17 -0700
X-CSE-ConnectionGUID: fKZ1fOpNQIm4isUvroPOIQ==
X-CSE-MsgGUID: teUnP+aQT/6SiWPapVNLSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="46844934"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.166])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 08:32:15 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/8] TTM LRU-walk cherry-picks
Date: Fri,  5 Jul 2024 17:31:58 +0200
Message-ID: <20240705153206.68526-1-thomas.hellstrom@linux.intel.com>
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

These are cherry-picks from the xe shrinker series here:

https://patchwork.freedesktop.org/series/131815/

extracted to speed up review progress and inclusion.

The series provides a restartable LRU walk and makes it possible
resume the walk after dropping the lock to evict or swap out.

Patch 1-4 implements restartable LRU list iteration.

Patch 5 implements a LRU walker + resv locking helper

Patch 6 moves TTM swapping over to the walker.

Patch 7 moves TTM eviction over to the walker.

Patch 8 Balances the struct ttm_resource_cursor interface

v2:
- Squash obsolete revision history in the patch commit messages.
- Fix a couple of review comments by Christian
- Don't store the mem_type in the TTM managers but in the
  resource cursor.
- Rename introduced TTM *back_up* function names to *backup*
- Add ttm pool recovery fault injection.
- Shrinker xe kunit test
- Various bugfixes

v3:
- Address some review comments from Matthew Brost and Christian König.
- Use the restartable LRU walk for TTM swapping and eviction.
- Provide a POC drm_exec locking implementation for exhaustive
  eviction. (Christian König).

v4:
- Remove the RFC exhaustive eviction part. While the path to exhaustive
  eviction is pretty clear and demonstrated in v3, there is still some
  drm_exec work that needs to be agreed and implemented.
- Add shrinker power management. On some hw we need to wake when shrinking.
- Fix the lru walker helper for -EALREADY errors.
- Add drm/xe: Increase the XE_PL_TT watermark.

v5:
- Update also TTM kunit tests
- Handle ghost- and zombie objects in the shrinker.
- A couple of compile- and UAF fixes reported by Kernel Build Robot and
  Dan Carpenter.

v6:
- Address review comments from Matthew Brost as detailed in patches
  4/12, 5/12, 6/12, 7/12, 8/12.

v7:
- Drop previous patches 8-12 for now and concentrate on 1-7
- Add a new patch 8 to balance the ttm_resource_cursor interface
  (Christian König)
- Fix various style comments from Christian König in patch 5-7.
- Update Reviewed-by: and Acked tags.

Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>

Thomas Hellström (8):
  drm/ttm: Allow TTM LRU list nodes of different types
  drm/ttm: Slightly clean up LRU list iteration
  drm/ttm: Use LRU hitches
  drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist
    moves
  drm/ttm: Provide a generic LRU walker helper
  drm/ttm: Use the LRU walker helper for swapping
  drm/ttm: Use the LRU walker for eviction
  drm/ttm: Balance ttm_resource_cursor_init() and
    ttm_resource_cursor_fini()

 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   4 +
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |   6 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  | 461 ++++++++----------
 drivers/gpu/drm/ttm/ttm_bo_util.c             | 153 ++++++
 drivers/gpu/drm/ttm/ttm_device.c              |  29 +-
 drivers/gpu/drm/ttm/ttm_resource.c            | 269 +++++++---
 drivers/gpu/drm/xe/xe_vm.c                    |   4 +
 include/drm/ttm/ttm_bo.h                      |  48 +-
 include/drm/ttm/ttm_resource.h                | 109 ++++-
 10 files changed, 732 insertions(+), 353 deletions(-)

-- 
2.44.0

