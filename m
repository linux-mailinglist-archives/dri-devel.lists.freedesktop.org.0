Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D235D3B4484
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 15:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE336EDC7;
	Fri, 25 Jun 2021 13:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC826EDD4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 13:33:42 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E3A171F40482;
 Fri, 25 Jun 2021 14:33:34 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 00/15] drm/panfrost: Misc improvements
Date: Fri, 25 Jun 2021 15:33:12 +0200
Message-Id: <20210625133327.2598825-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This is a merge of [1] and [2] since the second series depends on
patches in the preparatory series.

The main change in this v3 is the addition of patch 1 and 9 simplifying
the reset synchronisation as suggested by Daniel.

Also addressed Steve's comments, and IGT tests are now passing reliably
(which doesn't guarantee much, but that's still an improvement since
pan-reset was unreliable with v2).

Regards,

Boris

Boris Brezillon (14):
  drm/sched: Allow using a dedicated workqueue for the timeout/fault tdr
  drm/panfrost: Make ->run_job() return an ERR_PTR() when appropriate
  drm/panfrost: Get rid of the unused JS_STATUS_EVENT_ACTIVE definition
  drm/panfrost: Drop the pfdev argument passed to
    panfrost_exception_name()
  drm/panfrost: Expose exception types to userspace
  drm/panfrost: Do the exception -> string translation using a table
  drm/panfrost: Expose a helper to trigger a GPU reset
  drm/panfrost: Use a threaded IRQ for job interrupts
  drm/panfrost: Simplify the reset serialization logic
  drm/panfrost: Make sure job interrupts are masked before resetting
  drm/panfrost: Disable the AS on unhandled page faults
  drm/panfrost: Reset the GPU when the AS_ACTIVE bit is stuck
  drm/panfrost: Don't reset the GPU on job faults unless we really have
    to
  drm/panfrost: Kill in-flight jobs on FD close

Steven Price (1):
  drm/panfrost: Queue jobs on the hardware

 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   3 +-
 drivers/gpu/drm/lima/lima_sched.c          |   3 +-
 drivers/gpu/drm/panfrost/panfrost_device.c | 139 +++--
 drivers/gpu/drm/panfrost/panfrost_device.h |  15 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c    |   2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c    | 630 +++++++++++++++------
 drivers/gpu/drm/panfrost/panfrost_mmu.c    |  41 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h   |   3 -
 drivers/gpu/drm/scheduler/sched_main.c     |   6 +-
 drivers/gpu/drm/v3d/v3d_sched.c            |  10 +-
 include/drm/gpu_scheduler.h                |   5 +-
 include/uapi/drm/panfrost_drm.h            |  71 +++
 13 files changed, 679 insertions(+), 251 deletions(-)

-- 
2.31.1

