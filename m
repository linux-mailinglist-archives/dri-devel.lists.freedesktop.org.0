Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFCA7938D8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A765010E5BA;
	Wed,  6 Sep 2023 09:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EE910E1DF;
 Wed,  6 Sep 2023 09:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693993863; x=1725529863;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RGR9dfTKHIbJLouubNv9zhA3VfRTlmFaVLfcd+JrnYo=;
 b=WcpR5xM7EHeYY9v7ooN3yhLe8vo96hmSR48GKnJ9zT+6SoKTVMVYHNI6
 OkCjZfzJNqP6tEOO03GUaFI0cUOOKEiOxPvQdDTy6zYyDxRRNynC4uJIb
 o/r26mDaLzRtyXMOMiPwQFrtLlb3GcGW3UO1SdpLsJI4AG3UUuVtr2qA2
 JIM033TFlVP3t2zkzXaEm/TewYcl2UkxnXjFwIT9s6VYq2Uugi9m2PwbJ
 Cbs5O6QghvCbY5ED3C9wo5gZH5zBsURclnsdWTHPbayZtOD1ssTTh27ws
 WWb5J99asw+5CSGS9maW3/71QJm8yVkikQ1AeQcvVjROEnM6fEanrHlZf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="357331461"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="357331461"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 02:51:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="806948075"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="806948075"
Received: from igorhaza-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.161])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 02:51:01 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/drm_exec,
 drm/tests: Fix / WA for uaf and lock alloc tracking
Date: Wed,  6 Sep 2023 11:50:36 +0200
Message-ID: <20230906095039.3320-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While trying to replicate a weird drm_exec lock alloc tracking warning
using the drm_exec kunit test, the warning was shadowed by a UAF warning
from KASAN due to a bug in the drm kunit helpers.

Patch 1 fixes that drm kunit UAF.
Patch 2 introduces a drm_exec kunit subtest that shows the weird lock
alloc tracking warning if CONFIG_DEBUG_LOCK_ALLOC is set.
Patch 3 modifies drm_exec to avoid that lock alloc tracking warning. Although
the proper fix would probably be to modify lockdep to track the lock held
status differently, this workaround pushes the problem out of drm_exec,
so that any drm_exec users relying on its refcounting don't run into this.

v2:
- Rewording of commit messages
- Fix a typo (Danilo Krummrich)
- Add some commit message tags

Cc: Christian König <christian.koenig@amd.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org

Thomas Hellström (3):
  drm/tests: helpers: Avoid a driver uaf
  drm/tests/drm_exec: Add a test for object freeing within
    drm_exec_fini()
  drm/drm_exec: Work around a WW mutex lockdep oddity

 drivers/gpu/drm/drm_exec.c            |  2 +-
 drivers/gpu/drm/tests/drm_exec_test.c | 47 +++++++++++++++++++++++++++
 include/drm/drm_exec.h                | 35 +++++++++++++++++---
 include/drm/drm_kunit_helpers.h       |  4 ++-
 4 files changed, 82 insertions(+), 6 deletions(-)

-- 
2.41.0

