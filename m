Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F17766D557F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 02:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A5710E184;
	Tue,  4 Apr 2023 00:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8431910E05F;
 Tue,  4 Apr 2023 00:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680567743; x=1712103743;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fCoFiXdD9YSxQrmfqupncUpAoxasdJ1vKi5VN5O5pEU=;
 b=iGM1nj5UajjlrlemBxY8/+RVasxn1e5ylFPQfYEWD7SUVGvu7Z85g7co
 36xczc8+pEYbltywvWfOcqUSQgQHby17rneerIeVL6gmnmju6lwYoctET
 rM66wqSEFRYQ/S4VbLcj9TV75PVDhXAo+LC1eMcsNBqraFnGiMmTWM50G
 vLAGZ7+Lb4GWtvJbxtxOdIvEpQIwYHZA6wMEDvp4F6uuwFUrU1qOnkgyl
 yPiC46ydM5LoHb4nv+8UnIfPvlKcsNKql17BUP5PDdNTJiueD1UDLbAjP
 Kyhu7MvnhmXNR2teNX5PER4kDAPhlauCuEd7NQnpaL7P+5YuRcuobvyK+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="404810478"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="404810478"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 17:22:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="716460288"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="716460288"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 17:22:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Date: Mon,  3 Apr 2023 17:22:01 -0700
Message-Id: <20230404002211.3611376-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 lina@asahilina.net, boris.brezillon@collabora.com,
 Matthew Brost <matthew.brost@intel.com>, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
have been asked to merge our common DRM scheduler patches first as well
as develop a common solution for long running workloads with the DRM
scheduler. This RFC series is our first attempt at doing this. We
welcome any and all feedback.

This can we thought of as 4 parts detailed below.

- DRM scheduler changes for 1 to 1 relationship between scheduler and
entity (patches 1-3)

In Xe all of the scheduling of jobs is done by a firmware scheduler (the
GuC) which is a new paradigm WRT to the DRM scheduler and presents
severals problems as the DRM was originally designed to schedule jobs on
hardware queues. The main problem being that DRM scheduler expects the
submission order of jobs to be the completion order of jobs even across
multiple entities. This assumption falls apart with a firmware scheduler
as a firmware scheduler has no concept of jobs and jobs can complete out
of order. A novel solution for was originally thought of by Faith during
the initial prototype of Xe, create a 1 to 1 relationship between scheduler
and entity. I believe the AGX driver [3] is using this approach and
Boris may use approach as well for the Mali driver [4].

To support a 1 to 1 relationship we move the main execution function
from a kthread to a work queue and add a new scheduling mode which
bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
The new scheduling mode should unify all drivers usage with a 1 to 1
relationship and can be thought of as using scheduler as a dependency /
infligt job tracker rather than a true scheduler.

- Generic messaging interface for DRM scheduler

Idea is to be able to communicate to the submission backend with in band
(relative to main execution function) messages. Messages are backend
defined and flexable enough for any use case. In Xe we use these
messages to clean up entites, set properties for entites, and suspend /
resume execution of an entity [5]. I suspect other driver can leverage
this messaging concept too as it a convenient way to avoid races in the
backend.

- Support for using TDR for all error paths of a scheduler / entity

Fix a few races / bugs, add function to dynamically set the TDR timeout.

- Annotate dma-fences for long running workloads.

The idea here is to use dma-fences only as sync points within the
scheduler and never export them for long running workloads. By
annotating these fences as long running we ensure that these dma-fences
are never used in a way that breaks the dma-fence rules. A benefit of
thus approach is the scheduler can still safely flow control the
execution ring buffer via the job limit without breaking the dma-fence
rules.

Again this a first draft and looking forward to feedback.

Enjoy - Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel
[2] https://patchwork.freedesktop.org/series/112188/ 
[3] https://patchwork.freedesktop.org/series/114772/
[4] https://patchwork.freedesktop.org/patch/515854/?series=112188&rev=1
[5] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_guc_submit.c#L1031

Matthew Brost (8):
  drm/sched: Convert drm scheduler to use a work queue rather than
    kthread
  drm/sched: Move schedule policy to scheduler / entity
  drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
  drm/sched: Add generic scheduler message interface
  drm/sched: Start run wq before TDR in drm_sched_start
  drm/sched: Submit job before starting TDR
  drm/sched: Add helper to set TDR timeout
  drm/syncobj: Warn on long running dma-fences

Thomas Hellström (2):
  dma-buf/dma-fence: Introduce long-running completion fences
  drm/sched: Support long-running sched entities

 drivers/dma-buf/dma-fence.c                 | 142 +++++++---
 drivers/dma-buf/dma-resv.c                  |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
 drivers/gpu/drm/drm_syncobj.c               |   5 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
 drivers/gpu/drm/lima/lima_sched.c           |   5 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
 drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
 drivers/gpu/drm/scheduler/sched_entity.c    | 127 +++++++--
 drivers/gpu/drm/scheduler/sched_fence.c     |   6 +-
 drivers/gpu/drm/scheduler/sched_main.c      | 278 +++++++++++++++-----
 drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
 include/drm/gpu_scheduler.h                 | 130 +++++++--
 include/linux/dma-fence.h                   |  60 ++++-
 16 files changed, 649 insertions(+), 184 deletions(-)

-- 
2.34.1

