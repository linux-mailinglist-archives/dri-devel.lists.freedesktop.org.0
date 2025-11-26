Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D26BDC8BCB7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 21:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5F710E68C;
	Wed, 26 Nov 2025 20:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYw0YJfs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCEE10E68C;
 Wed, 26 Nov 2025 20:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764188361; x=1795724361;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sxZGmUCNcy9Z4grHPLSSSsdhG0mH7jBV86IlobCttfY=;
 b=UYw0YJfsQ4sPcQL0yVYfZ0Wpkk0c6Kt7j2WcQ1Sz36MY/NoJmS2T1j0c
 EIzzrOtzsS1GUzY4BY51i+7QjMFi1T5mdsG45b4EDN6sPe1V7228aN0Zd
 NYc1e4EjSa/Y6Ad2mqCsONx1lopj6ZCkvSwPHPNk+/6tt3pQPj0xQWrnh
 JY3w7umjdsBFowH6g+g+F0KTEn4HTVEJjUlF0yQ44GADdMvHUy2sofgJk
 AdmpJfMLbFUk/ifUhBuq++sqMApUbt0nGnBDb9UX3oPGLdWWeJRaXyB3I
 Kxhn4i5Kg+UrWxwZSZyyXSjOwSuiJvEUKiXUUmwejBM9ytH5XG5vAo1hR g==;
X-CSE-ConnectionGUID: Rz+trGVpSTiSZsTtV454Og==
X-CSE-MsgGUID: zfqUAIxKR0W5vJGSP+pTXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76864161"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="76864161"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 12:19:20 -0800
X-CSE-ConnectionGUID: NgamUefXQUGMHRKLCQKJGg==
X-CSE-MsgGUID: ASfROYCZTRWyhEp00IfdbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193137292"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 12:19:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/8] Fix DRM scheduler layering violations in Xe
Date: Wed, 26 Nov 2025 12:19:08 -0800
Message-Id: <20251126201916.618996-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At XDC, we discussed that drivers should avoid accessing DRM scheduler
internals, misusing DRM scheduler locks, and adopt a well-defined
pending job list iterator. This series proposes the necessary changes to
the DRM scheduler to bring Xe in line with that agreement and updates Xe
to use the new DRM scheduler API.

While here, cleanup LR queue handling and simplify GuC state machine in
Xe too.

v2:
 - Fix checkpatch / naming issues
v3:
 - Only allow pending job list iterator to be called on stopped schedulers
 - Cleanup LR queue handling / fix a few misselanous Xe scheduler issues
v4:
 - Address Niranjana's feedback
 - Add patch to avoid toggling scheduler state in the TDR
v5:
 - Rebase
 - Fixup LRC timeout check (Umesh)

Matt

Matthew Brost (8):
  drm/sched: Add several job helpers to avoid drivers touching scheduler
    state
  drm/sched: Add pending job list iterator
  drm/xe: Add dedicated message lock
  drm/xe: Stop abusing DRM scheduler internals
  drm/xe: Only toggle scheduling in TDR if GuC is running
  drm/xe: Do not deregister queues in TDR
  drm/xe: Remove special casing for LR queues in submission
  drm/xe: Avoid toggling schedule state to check LRC timestamp in TDR

 drivers/gpu/drm/scheduler/sched_main.c       |   4 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        |   9 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h        |  37 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |   2 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   2 -
 drivers/gpu/drm/xe/xe_guc_submit.c           | 362 +++----------------
 drivers/gpu/drm/xe/xe_guc_submit_types.h     |  11 -
 drivers/gpu/drm/xe/xe_hw_fence.c             |  16 -
 drivers/gpu/drm/xe/xe_hw_fence.h             |   2 -
 drivers/gpu/drm/xe/xe_lrc.c                  |  42 ++-
 drivers/gpu/drm/xe/xe_lrc.h                  |   3 +-
 drivers/gpu/drm/xe/xe_sched_job.c            |   1 +
 drivers/gpu/drm/xe/xe_sched_job_types.h      |   2 +
 drivers/gpu/drm/xe/xe_trace.h                |   5 -
 include/drm/gpu_scheduler.h                  |  82 +++++
 15 files changed, 188 insertions(+), 392 deletions(-)

-- 
2.34.1

