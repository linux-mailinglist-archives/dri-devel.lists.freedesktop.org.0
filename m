Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5417994229B
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 00:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A222410E311;
	Tue, 30 Jul 2024 22:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cIThiYea";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E8210E305;
 Tue, 30 Jul 2024 22:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722377815; x=1753913815;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gEPb57BREpeXHaJKVZXrhup82u31NcDS3AdggQZJUoM=;
 b=cIThiYeaaUg5cIurG1MooSX/9np1aa+X4ETn/FT/YhvueP4NVijahjJQ
 WG9dv0fBsjzpxMWtDt4nQduF2wgknSh+0L57h6E2Fojr3YOqv+Zr0ZZI6
 CPYG5O7wEnLXlFrIgyjO3r6H6oLglZhCiM98TylNN5kWjTYxaUoPnxz7O
 aI2PKUSq9RdogkiZcwNTx+mtpRlYHc5IaHsqqBSkq8YgPKOEPhXgJUBfG
 TGzNESMhTn4LVVqf8m34NuB0+//V7AQ83kUu6rS0ZAmVPfyYXb2qX5i03
 dqRd8ewTNaFze2FmU1VUJU1eAyErFfTFM9tjw7UvjvBGzLxj7PmkTXXSw A==;
X-CSE-ConnectionGUID: 5f26o5hHRSq00IuvIbjpLg==
X-CSE-MsgGUID: jaBz93nbRimo0IMb6PN3rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="24094117"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="24094117"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 15:16:54 -0700
X-CSE-ConnectionGUID: TOVCBaCnSMKa+N946Z7rCg==
X-CSE-MsgGUID: i7g48lOkSq2E/tN3BkAgOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="58613340"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 15:16:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: tj@kernel.org, jiangshanlai@gmail.com, christian.koenig@amd.com,
 ltuikov89@gmail.com, daniel@ffwll.ch
Subject: [RFC PATCH 0/3] Use user-defined workqueue lockdep map for drm sched
Date: Tue, 30 Jul 2024 15:17:39 -0700
Message-Id: <20240730221742.2248527-1-matthew.brost@intel.com>
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

This is being sent as an RFC to gather feedback from workqueue
maintainers on the viability of this solution.

Matt

Matthew Brost (3):
  workqueue: Add interface for user-defined workqueue lockdep map
  drm/sched: Use drm sched lockdep map for submit_wq
  drm/xe: Drop GuC submit_wq pool

 drivers/gpu/drm/scheduler/sched_main.c | 12 +++++-
 drivers/gpu/drm/xe/xe_guc_submit.c     | 60 +-------------------------
 drivers/gpu/drm/xe/xe_guc_types.h      |  7 ---
 include/linux/workqueue.h              |  3 ++
 kernel/workqueue.c                     | 44 ++++++++++++++++---
 5 files changed, 52 insertions(+), 74 deletions(-)

-- 
2.34.1

