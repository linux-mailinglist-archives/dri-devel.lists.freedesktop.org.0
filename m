Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920B894D8B5
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 00:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3127C10EA1A;
	Fri,  9 Aug 2024 22:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBKRwJjM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EFF10EA11;
 Fri,  9 Aug 2024 22:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723242464; x=1754778464;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eXVnnnar9saKdQimYvtgB6nNuDPP7ZZqNvvDa0T9rQ4=;
 b=TBKRwJjMvLJWsrJDcNfp16QD7jp/0nY9CR8MNFFeHFusS8V0rWo8MB+V
 8KmxUsZUhy9gCy232NvbP3RUUqDvA0/vueEAmNL4hWf85OyRmB9EZu/W0
 9DLqcNsxwcb86CvUEQNvpdO6+Q0uaDH18veNAorhEnSftLN6jDBwIIE+W
 emacTzRMIrPlmt53RY9aTdBPxTHGlcmW2SaHT2VD+VxXxj+vq76Vpi6Cj
 FFhvYHu/e9rhu5bln4MHKlqnJoDh6nbYgX/a/c0D8gPAbn9S/KkeRTs+b
 utq9Uhhhc4RlDCvXto1E4eIodMdxEKgm4fyTNvV6SAeEW+ftUKf5DyBfU A==;
X-CSE-ConnectionGUID: M7VvV6mfSaa0YV7ohO37zw==
X-CSE-MsgGUID: LBTFT9JuRkmfQAFdV0x+5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="25229637"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="25229637"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 15:27:43 -0700
X-CSE-ConnectionGUID: +Wr2FzcjTtudxBeyHgq/XQ==
X-CSE-MsgGUID: ySeNZa6ZR7qYyxhmgGEDeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="62641781"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 15:27:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: tj@kernel.org, jiangshanlai@gmail.com, christian.koenig@amd.com,
 ltuikov89@gmail.com, daniel@ffwll.ch
Subject: [PATCH v3 0/5] Use user-defined workqueue lockdep map for drm sched
Date: Fri,  9 Aug 2024 15:28:22 -0700
Message-Id: <20240809222827.3211998-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By default, each DRM scheduler instance creates an ordered workqueue for
submission, and each workqueue creation allocates a new lockdep map.
This becomes problematic when a DRM scheduler is created for every user
queue (e.g., in DRM drivers with firmware schedulers like Xe) due to the
limited number of available lockdep maps. With numerous user queues
being created and destroyed, lockdep may run out of maps, leading to
lockdep being disabled. Xe mitigated this by creating a pool of
workqueues for DRM scheduler use. However, this approach also encounters
issues if the driver is unloaded and reloaded multiple times or if many
VFs are probed.

To address this, we propose creating a single lockdep map for all DRM
scheduler workqueues, which will also resolve issues for other DRM
drivers that create a DRM scheduler per user queue.

This solution has been tested by unloading and reloading the Xe driver.
Before this series, around 30 driver reloads would result in lockdep
being turned off. After implementing the series, the driver can be
unloaded and reloaded hundreds of times without issues.

v2:
 - Split workqueue changes into multiple patches
 - Add alloc_workqueue_lockdep_map (Tejun)
 - Drop RFC
v3:
 - Drop __WQ_USER_OWNED_LOCKDEP (Tejun)
 - static inline alloc_ordered_workqueue_lockdep_map (Tejun)

Matt

Matthew Brost (5):
  workqueue: Split alloc_workqueue into internal function and lockdep
    init
  workqueue: Change workqueue lockdep map to pointer
  workqueue: Add interface for user-defined workqueue lockdep map
  drm/sched: Use drm sched lockdep map for submit_wq
  drm/xe: Drop GuC submit_wq pool

 drivers/gpu/drm/scheduler/sched_main.c | 11 ++++
 drivers/gpu/drm/xe/xe_guc_submit.c     | 60 +--------------------
 drivers/gpu/drm/xe/xe_guc_types.h      |  7 ---
 include/linux/workqueue.h              | 52 ++++++++++++++++++
 kernel/workqueue.c                     | 75 ++++++++++++++++++++------
 5 files changed, 124 insertions(+), 81 deletions(-)

-- 
2.34.1

