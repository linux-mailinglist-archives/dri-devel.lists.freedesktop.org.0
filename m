Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6892425406
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 15:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDDE6F49A;
	Thu,  7 Oct 2021 13:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65096F49A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 13:26:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="206367340"
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="206367340"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 06:26:49 -0700
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="440264987"
Received: from ibanaga-mobl.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.250])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 06:26:47 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [RFC PATCH 0/2] drm/amdgpu: Reduce the notifier_lock contention
Date: Thu,  7 Oct 2021 15:26:28 +0200
Message-Id: <20211007132630.495184-1-thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the interest of sharing as much of possible of the userptr design,
two rfc patches that are aiming to reduce the userptr notifier_lock
contention.

We have these changes already in i915, but we wanted to lift them to dri-
devel in the amdgpu context for discussion to make sure we don't miss
anything important.

The first patch addresses the case where idling a single userptr bo
for even a simple invalidation, stalls command submission across the device.
Since the notifier callback is guaranteed to run to *completion* by the
notifier code without a racing successful command submission, moving the
fence wait out of the notifier lock should be safe.

The second patch probably has a smaller impact and might avoid some
contention particularly if traversing long userptr lists. The notifier sem
is also locked interruptible during command submission.

Any comments appreciated.

Cc: Christian König <christian.koenig@amd.com>

Thomas Hellström (2):
  drm/amdgpu: Move dma_resv waiting outside the notifier lock
  drm/amdgpu: Use an rwsem for the notifier lock

 drivers/gpu/drm/amd/amdgpu/amdgpu.h              |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           | 12 ++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c           | 11 ++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c          |  2 +-
 6 files changed, 18 insertions(+), 13 deletions(-)

-- 
2.31.1

