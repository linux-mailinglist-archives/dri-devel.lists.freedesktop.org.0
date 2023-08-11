Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABAD77856B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 04:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A070A10E623;
	Fri, 11 Aug 2023 02:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F0C10E622;
 Fri, 11 Aug 2023 02:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691721100; x=1723257100;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gNpC6IDJcdEwBIqQRhXnCF7WIDFVYgrghGWcwj+TQS8=;
 b=M1y3otYtnuK8ljUf59L2+5NXjt4geU0ONhnT04B9Zz816brbvkADANRG
 MmLCEJogHonZhHYgk96e2UB/rf2kWjb0+aKt0e1++NT+FAgYR7wVx+XIE
 7Amlh/CejHSXHr7BKKec7kwo/5mNdVFKQT3c0XTZQxRcDQEpbAU94B+zp
 4A70iSqY6ZwEcVXwVPvbt+0qFlL1wmr7fT8X851hQyYiZXKWUPjt+rQ0B
 hzt0rYSU9BaThMbtCI82dWvMUSEu3dwscfvIRPHGMSdholfPGjQIVwmga
 0USZ1P5JoNLpvqPcdwrOp/1/dsAzs80rl8ReGFJGnzUOv+z8ltBziQnQu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="361714779"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="361714779"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 19:31:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="797838391"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="797838391"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 19:31:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/9] DRM scheduler changes for Xe
Date: Thu, 10 Aug 2023 19:31:28 -0700
Message-Id: <20230811023137.659037-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 Matthew Brost <matthew.brost@intel.com>, sarah.walker@imgtec.com,
 ketil.johnsen@arm.com, Liviu.Dudau@arm.com, luben.tuikov@amd.com,
 lina@asahilina.net, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
have been asked to merge our common DRM scheduler patches first.

This a continuation of a RFC [3] with all comments addressed, ready for
a full review, and hopefully in state which can merged in the near
future. More details of this series can found in the cover letter of the
RFC [3].

These changes have been tested with the Xe driver.

v2:
 - Break run job, free job, and process message in own work items
 - This might break other drivers as run job and free job now can run in
   parallel, can fix up if needed

Matt

Matthew Brost (9):
  drm/sched: Convert drm scheduler to use a work queue  rather than
    kthread
  drm/sched: Move schedule policy to scheduler / entity
  drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
  drm/sched: Split free_job into own work item
  drm/sched: Add generic scheduler message interface
  drm/sched: Add drm_sched_start_timeout_unlocked helper
  drm/sched: Start run wq before TDR in drm_sched_start
  drm/sched: Submit job before starting TDR
  drm/sched: Add helper to set TDR timeout

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   3 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   5 +-
 drivers/gpu/drm/lima/lima_sched.c          |   5 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c       |   5 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c    |   5 +-
 drivers/gpu/drm/panfrost/panfrost_job.c    |   5 +-
 drivers/gpu/drm/scheduler/sched_entity.c   |  85 ++++-
 drivers/gpu/drm/scheduler/sched_fence.c    |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c     | 408 ++++++++++++++++-----
 drivers/gpu/drm/v3d/v3d_sched.c            |  25 +-
 include/drm/gpu_scheduler.h                |  75 +++-
 11 files changed, 487 insertions(+), 136 deletions(-)

-- 
2.34.1

