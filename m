Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B52D07CC713
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 17:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF0010E302;
	Tue, 17 Oct 2023 15:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A95910E043;
 Tue, 17 Oct 2023 15:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697555374; x=1729091374;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q2tTXGUJtmv1KyMFJIVOBLcBkMIEDhDFXgVwUFNmlOc=;
 b=KbLy7HaA0pjqONZqHrdWkZJHmiEqUyfIyqBZnHXsPpnbaw4CiMHRB2bD
 I6uPJ/dm8303CPuTOOSJ4xxy9H0AFL/0LqQbrsJuPLlkLZGNnB9ZedSxV
 2CC3VO1b2W57JU2eX4RSwHTxyj07IM3S6gr4f0unstHmWi5mheubtfRrZ
 nECzP8Q8TYQPjx02irXw55DgqpWcMjEXdJe09nhMuoNore5ui3YwQDVt9
 G9/0KuLFLHhD/k7QvQg1iaDTBrJRoWjPsfiNgPmW9rSykHLsaHpBF/rwG
 qmRbL/XCB3E5FK13da3tzAyb840aq8QF7uorweNW7niPvVaXtFgb5fY/A A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="388665060"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="388665060"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 08:09:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="791257557"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="791257557"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 08:09:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v6 0/7] DRM scheduler changes for Xe
Date: Tue, 17 Oct 2023 08:09:51 -0700
Message-Id: <20231017150958.838613-1-matthew.brost@intel.com>
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
 Matthew Brost <matthew.brost@intel.com>, lina@asahilina.net,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
have been asked to merge our common DRM scheduler patches first.

This a continuation of a RFC [3] with all comments addressed, ready for
a full review, and hopefully in state which can merged in the near
future. More details of this series can found in the cover letter of the
RFC [3].

These changes have been tested with the Xe driver. Based on drm-tip branch.

A follow up series will be posted to address some of dakr requets for
kernel doc changes.

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

v4:
 - Drop message interface
 - Drop 'Flush pending jobs on entity fini'
 - Drop 'Add documentation for entity teardown'
 - Address all feedback

v5:
 - Address Luben's feedback
 - Drop starting TDR after calling run_job()
 - Drop adding Matthew Brost to maintainers of DRM scheduler

v6:
 - Address Luben's feedback
 - Include base commit

Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel
[2] https://patchwork.freedesktop.org/series/112188/
[3] https://patchwork.freedesktop.org/series/116055/


Matthew Brost (7):
  drm/sched: Add drm_sched_wqueue_* helpers
  drm/sched: Convert drm scheduler to use a work queue rather than
    kthread
  drm/sched: Move schedule policy to scheduler
  drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
  drm/sched: Split free_job into own work item
  drm/sched: Add drm_sched_start_timeout_unlocked helper
  drm/sched: Add a helper to queue TDR immediately

 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  15 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c       |   5 +-
 drivers/gpu/drm/lima/lima_sched.c             |   5 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |   6 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c          |   7 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c       |   5 +-
 drivers/gpu/drm/panfrost/panfrost_job.c       |   5 +-
 drivers/gpu/drm/scheduler/sched_entity.c      |  85 ++-
 drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c        | 507 ++++++++++++------
 drivers/gpu/drm/v3d/v3d_sched.c               |  25 +-
 include/drm/gpu_scheduler.h                   |  48 +-
 14 files changed, 498 insertions(+), 234 deletions(-)


base-commit: 201c8a7bd1f3f415920a2df4b8a8817e973f42fe
-- 
2.34.1

