Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF0E79C28B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 04:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB8910E2AF;
	Tue, 12 Sep 2023 02:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DB310E20C;
 Tue, 12 Sep 2023 02:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694485038; x=1726021038;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h5gfFuH0qzZ8hKLRvjpzDfG27EwDGDzMd9cbPcP9aLc=;
 b=BXlrPu/OuUuZS9jmUtaGzG665A8tu+XbjheyH+m6ra78H7DZpMHttluf
 yCviX0bSwhKnv+YkP+Cz+jFfW3rU7NZim+PKRXBAp/kmYieYGiYi3PAmm
 wLnGc8+8bybO/6aN7rnhiyJBEiQGD/TtjPh82Q6KOoeQVtgVXGFQc5jNP
 Vf3r7P/TgQ1J4vnHrJJ4o/W4P+ln8xasqDNTYL6HEgfgns2mJHdaAaIjZ
 8VOg3ImCALF35wck+A8eEo1tOyjUyW7bQyp3hpMfHyPuOy+kdQYAcqyBx
 dtfgZd4DWwinN667491VvmhwQx0uDhmIy5xaz2wSuRFKQ5HTC+g97Xtmg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="377172491"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="377172491"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 19:16:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="917255553"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="917255553"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 19:16:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v3 00/13] DRM scheduler changes for Xe
Date: Mon, 11 Sep 2023 19:16:02 -0700
Message-Id: <20230912021615.2086698-1-matthew.brost@intel.com>
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
 ketil.johnsen@arm.com, mcanal@igalia.com, Liviu.Dudau@arm.com,
 luben.tuikov@amd.com, lina@asahilina.net, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
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

v3:
 - Include missing patch 'drm/sched: Add drm_sched_submit_* helpers'
 - Fix issue with setting timestamp to early
 - Don't dequeue jobs for single entity after calling entity fini
 - Flush pending jobs on entity fini
 - Add documentation for entity teardown
 - Add Matthew Brost to maintainers of DRM scheduler

Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel
[2] https://patchwork.freedesktop.org/series/112188/
[3] https://patchwork.freedesktop.org/series/116055/

Matthew Brost (13):
  drm/sched: Add drm_sched_submit_* helpers
  drm/sched: Convert drm scheduler to use a work queue rather than
    kthread
  drm/sched: Move schedule policy to scheduler / entity
  drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
  drm/sched: Split free_job into own work item
  drm/sched: Add generic scheduler message interface
  drm/sched: Add drm_sched_start_timeout_unlocked helper
  drm/sched: Start run wq before TDR in drm_sched_start
  drm/sched: Submit job before starting TDR
  drm/sched: Add helper to set TDR timeout
  drm/sched: Waiting for pending jobs to complete in scheduler kill
  drm/sched/doc: Add Entity teardown documentaion
  drm/sched: Update maintainers of GPU scheduler

 Documentation/gpu/drm-mm.rst                  |   6 +
 MAINTAINERS                                   |   1 +
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  15 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c       |   5 +-
 drivers/gpu/drm/lima/lima_sched.c             |   5 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |   6 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c          |   5 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c       |   5 +-
 drivers/gpu/drm/panfrost/panfrost_job.c       |   5 +-
 drivers/gpu/drm/scheduler/sched_entity.c      | 111 +++-
 drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c        | 497 ++++++++++++++----
 drivers/gpu/drm/v3d/v3d_sched.c               |  25 +-
 include/drm/gpu_scheduler.h                   |  96 +++-
 16 files changed, 644 insertions(+), 159 deletions(-)

-- 
2.34.1

