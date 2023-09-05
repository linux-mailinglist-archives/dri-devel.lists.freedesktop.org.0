Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E8E792135
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 10:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF5110E46B;
	Tue,  5 Sep 2023 08:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14B510E46B;
 Tue,  5 Sep 2023 08:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693904343; x=1725440343;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jGv/zmUrrZpk/cV6dpatnnCoaFnOOBoMyp6AEK5XBy4=;
 b=D+5wrM/qlIrk1qeA4sYn9VhFC41mxyyPW4sbCgJTJfc9MsqdPiAMhNPt
 jv8Cs/chjkyLCBEMZVufePBPwYLv+OT+IlX+MNEQdDhp7x4y4fdMfND7q
 kOIS8+tCp1iJQL2ccIKM+VmR5qWXgXOCP1XkM8iODEXATZI57v8ukC2xj
 QhS+WrXzIo5A3pm3IA3hT4oGpVBmN5CPQPvQw/wBVQjW/PxpCqPQVd2mG
 5Qs8H2Uc3/lF1kDkxCyzcKXnWT5a4tMxBBUDiicO1Cp3LH6eiIUS6aBbi
 D/VlscJ9TktgHIi0myGIxO3D3T2Psja1+JGJaE7lGhCz8HS026ymNrXic Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="407732471"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="407732471"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 01:59:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="744203595"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="744203595"
Received: from chenxi4-mobl1.ccr.corp.intel.com (HELO fedora..)
 ([10.249.254.154])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 01:59:01 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/drm_exec,
 drm/drm_kunit: Fix / WA for uaf and lock alloc tracking.
Date: Tue,  5 Sep 2023 10:58:29 +0200
Message-ID: <20230905085832.2103-1-thomas.hellstrom@linux.intel.com>
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
due to a bug in the drm kunit helpers.

Patch 1 fixes that drm kunit UAF.
Patch 2 introduces a drm_exec kunit subtest that shows the weird lock
alloc tracking warning if CONFIG_DEBUG_LOCK_ALLOC is set.
Patch 3 modifies drm_exec to avoid that lock alloc tracking warning. Although
the proper fix would probably be to modify lockdep to track the lock held
status differently, this workaround at pushes the problem out of drm_exec,
so that any drm_exec users relying on its refcounting don't run into this.

Cc: Christian König <christian.koenig@amd.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org

Thomas Hellström (3):
  drm/kunit: Avoid a driver uaf
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

