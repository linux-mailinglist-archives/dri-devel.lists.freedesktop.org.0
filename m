Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C95B98D444
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 15:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEC110E150;
	Wed,  2 Oct 2024 13:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fllYyTrN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFDD10E164;
 Wed,  2 Oct 2024 13:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727874933; x=1759410933;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=At2Vm/40qVS8N1Rt8ypOf/eUuD9NFe5mXby12e05zV8=;
 b=fllYyTrNoTkzW0tTY1/e1f+/FIT3lBRkF0egpQUyub8uEttzemkwMjnU
 FKIrUxKqQGw+XnffnV1pyOy9EAEjF/29W6/md0EQkk4c3NPDQ10jD5T+e
 ll6UtvB1qsHC8ZF/695W4RjpNLnGu427z+BkyyA8Y2c1kkguI6alrRwo2
 rKCeSRyX24B6fy/Ac0/I1WhJ8M340UGyrLvmZeb0hkSUdfWqo60pP5NFR
 y6/IAfxpMLtNIDF7SGwjw/pORB4OJwkkuWN4mLAf2jRsyaPBLAd7KAPnl
 fEPhm4RXMgUOspmm+I4pWL8gPa7q7ZZYKyOm7rN2d/ZZGZL8w/G67SizI w==;
X-CSE-ConnectionGUID: sCYm8VEAQ7qObe0U1s2PnQ==
X-CSE-MsgGUID: gE1tCadCTt6CsVBezEphHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26834955"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="26834955"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 06:15:32 -0700
X-CSE-ConnectionGUID: 72J2Vay0Sp26BIYU4vVSGg==
X-CSE-MsgGUID: Deh9piA/TNya8xEkk3iL9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="111465245"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 06:15:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org,
	pstanner@redhat.com,
	ltuikov89@gmail.com
Subject: [PATCH v4 0/2] Use user-defined workqueue lockdep map for drm sched
Date: Wed,  2 Oct 2024 06:16:37 -0700
Message-Id: <20241002131639.3425022-1-matthew.brost@intel.com>
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
v4:
 - Rebase on 6.12 which has required work queue patches

Matt

Matthew Brost (2):
  drm/sched: Use drm sched lockdep map for submit_wq
  drm/xe: Drop GuC submit_wq pool

 drivers/gpu/drm/scheduler/sched_main.c | 11 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c     | 60 +-------------------------
 drivers/gpu/drm/xe/xe_guc_types.h      |  7 ---
 3 files changed, 12 insertions(+), 66 deletions(-)

-- 
2.34.1

