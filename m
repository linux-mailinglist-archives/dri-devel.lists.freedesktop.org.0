Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C8976BEBE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 22:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED54710E3B6;
	Tue,  1 Aug 2023 20:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD14110E1E1;
 Tue,  1 Aug 2023 20:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690923070; x=1722459070;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Sc+DKWZsLaEOUez6dhquh5I+OF7DO1yNwPbZcj8NSPE=;
 b=WR4a9LmhElTdYLtES/3cDjy5ksF5fDtUFwPM8n28OP0ptsyz+ULrZ/w6
 CuytWpOsWH3maTmy2f8KIg9AtQ5ynfonC5bMM7HiNjUzRNerwIgjkdcpl
 ON9w28bmHu6YhEPagvFDomyCZJCtgpmzF7JRBfH0O3qzjXnym+Ty0UKMT
 sPO44CdeBEbln43ym3arIyV2dKQn8VYsqoeDn9bxmD+es8FPFaqqwpkox
 pQo3jbXf2ZjN2WEJYoklP0mm3fnIuiZW443rm1apOkeXYNpuXAo/zAjHm
 ZZ1Fhr9ZvKjroTWIT0Cj1cTpMgAJ+U1lLz4dDGdj6gw/APM93uvRQqMDI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="373051695"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="373051695"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 13:51:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="872215394"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 13:51:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 0/8] DRM scheduler changes for Xe
Date: Tue,  1 Aug 2023 13:50:55 -0700
Message-Id: <20230801205103.627779-1-matthew.brost@intel.com>
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

Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel
[2] https://patchwork.freedesktop.org/series/112188/
[3] https://patchwork.freedesktop.org/series/116055/

Matthew Brost (8):
  drm/sched: Convert drm scheduler to use a work queue rather than
    kthread
  drm/sched: Move schedule policy to scheduler / entity
  drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
  drm/sched: Add generic scheduler message interface
  drm/sched: Add drm_sched_start_timeout_unlocked helper
  drm/sched: Start run wq before TDR in drm_sched_start
  drm/sched: Submit job before starting TDR
  drm/sched: Add helper to set TDR timeout

 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
 drivers/gpu/drm/lima/lima_sched.c           |   5 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
 drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
 drivers/gpu/drm/scheduler/sched_entity.c    |  85 +++++-
 drivers/gpu/drm/scheduler/sched_fence.c     |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c      | 294 +++++++++++++++-----
 drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
 include/drm/gpu_scheduler.h                 |  70 ++++-
 12 files changed, 396 insertions(+), 135 deletions(-)

-- 
2.34.1

