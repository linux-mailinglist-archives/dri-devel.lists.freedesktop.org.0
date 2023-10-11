Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEE67C614F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 01:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9131210E3C4;
	Wed, 11 Oct 2023 23:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2367710E2E4;
 Wed, 11 Oct 2023 23:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697068685; x=1728604685;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t2e2noLURdhre8xhBhm1fSjzcgcTsK6c35zfm0wJy1E=;
 b=S4f6PAWr9/QmkNAQN2JX8S7aEk2fITUM0Imc/rg3d2fVbD+xPNQupr6+
 Kx8V6xEEDOVGzjYu7KWRO/W8SB0axciHrEfBs3CCuMPmsxOJJYM94F9+B
 NIOx4Fb62Vhds4TOsvUDCOaIi9LeXyYWiDi88F3Zgq29HTWi1fbTj7pt8
 I5THK1kIesIH5AV5wZHoyVyyASxDByDGWJ6GJa8ODR3u3Fs1dHV94CJYr
 M7rPf8NL/esUp6k/6F1qr1INyTH4gKi8XpcUZOg3Cc/r0pu6JlBw4ZduD
 4DGg5VP4bomKdZEV0aaucFfKb/WQQxy3SZ4VfyPTYQIgkSQEXb6QkaZjR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="387637351"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="387637351"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 16:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="824367781"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="824367781"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 16:58:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v5 0/7] DRM scheduler changes for Xe
Date: Wed, 11 Oct 2023 16:58:19 -0700
Message-Id: <20231011235826.585624-1-matthew.brost@intel.com>
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

v4:
 - Drop message interface
 - Drop 'Flush pending jobs on entity fini'
 - Drop 'Add documentation for entity teardown'
 - Address all feedback

v5:
 - Address Luben's feedback
 - Drop starting TDR after calling run_job()
 - Drop adding Matthew Brost to maintainers of DRM scheduler

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
  drm/sched: Add helper to queue TDR immediately for current and future
    jobs

 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  15 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c       |   5 +-
 drivers/gpu/drm/lima/lima_sched.c             |   5 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |   6 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c          |   7 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c       |   5 +-
 drivers/gpu/drm/panfrost/panfrost_job.c       |   5 +-
 drivers/gpu/drm/scheduler/sched_entity.c      |  86 ++-
 drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c        | 506 ++++++++++++------
 drivers/gpu/drm/v3d/v3d_sched.c               |  25 +-
 include/drm/gpu_scheduler.h                   |  48 +-
 14 files changed, 499 insertions(+), 233 deletions(-)

-- 
2.34.1

