Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AEAC11718
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 21:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0369810E0A5;
	Mon, 27 Oct 2025 20:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWgkPCr7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7686910E0A5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 20:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761598410; x=1793134410;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d/7gsOcOF/lWX9iezodUpKdrcPzqqWaCNAwQS20XKJo=;
 b=ZWgkPCr7+ukICJ0a7M+10W4ybrthE9uBhaZz8YXbSj3QAY3MHVVd183I
 /KcobUNEL/j1YcU+8lczjsKIrkccnaq9Tn0ZhFUYf0AO8tc8obz+OaMSP
 wd6G13JPuu32RAFpadpjjhRUSXdGoAuNvII7M6zPZsvjTskBirpJTVNSr
 hObqfNdsJ0tAPu1BP7EhyhSR/1aiGgddQtk0xEFfp2g4fA2mgbpgS2R7c
 2sJq9V/oMmYURLpFZx0dTGAQ9YUdw9mR+ErruUt82OLRCYMb0jyejN9M0
 Qp7P3VwyxtfM27SmgF4IPaYOQvVU6YTYZSjKF3OknRAz0jaQfe6R4ywbE Q==;
X-CSE-ConnectionGUID: H0l/hC8jQNSfdKg5Jqwh2A==
X-CSE-MsgGUID: 5PHuyb3LQ4W6irx4v8JaPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62895990"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="62895990"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 13:53:30 -0700
X-CSE-ConnectionGUID: C3g1swM3TYSjzRCjAtuu6g==
X-CSE-MsgGUID: 1LBWg0A7RsiUjrsaKlap0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184380553"
Received: from dongwonk-z390-aorus-ultra.fm.intel.com ([10.105.205.222])
 by orviesa010.jf.intel.com with ESMTP; 27 Oct 2025 13:53:30 -0700
From: dongwon.kim@intel.com
To: dri-devel@lists.freedesktop.org
Cc: dmitry.osipenko@collabora.com, airlied@redhat.com, kraxel@redhat.com,
 nirmoyd@nvidia.com
Subject: [PATCH v6 0/3] Virtio-GPU S4 support
Date: Mon, 27 Oct 2025 13:53:20 -0700
Message-Id: <20251027205323.491349-1-dongwon.kim@intel.com>
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

From: Dongwon Kim <dongwon.kim@intel.com>

This patch series implements functions for .freeze and .restore hooks for
virtio-gpu driver as well as pm-notifier to handle object restoration in
S4(hiberation) case.

First patch adds `virtgpu_freeze` and `virtgpu_restore` functions.
These functions handle the deletion of virtio queues before suspension and
their recreation during the restoration process.

Second patch implements a mechanism for restoring `virtio_gpu_object` instances.
This is necessary because the host (QEMU) deletes all associated resources during
the virtio-gpu reset, which occurs as part of hiberation/resume process.

Third patch adds pm-notifier to the driver that handles resubmission of virtio-gpu
objects to the QEMU once the guest resumes from hibenation.

These changes ensure that the virtio-gpu driver can properly handle hibernation
scenarios without resource loss.

v2: 10ms sleep is added in virtgpu_freeze to avoid the situation
    the driver is locked up during resumption.

v3: Plain 10ms delay (v2) is replaced with wait calls which wait until
    the virtio queue is empty.
    (Dmitry Osipenko)

v4: New version of patchset only covers S4 case because loss of resources in S3
    case can be avoided by skipping virtio-gpu-reset in QEMU (hw/display/virtio-gpu.c).
    To skip virtio-gpu-reset (soft-reset), virtio-gpu-pci device should be attached to
    PCIE bus AND a PCIE option, 'x-pcie-pm-no-soft-reset' should added and set to 'true'.
    (e.g. -device virtio-gpu-pci,bus=port,x-pcie-pm-no-soft-reset=true)

v5: Remove virtio_gpu_object from the restore list before freeing the object
    to prevent an use-after-free situation.
    (Nirmoy Das)

    Protect restore list operations with a spinlock
    (Nirmoy Das)

    Move restore list node into virtio_gpu_bo struct to reduce memory usage
    (Dmitry Osipenko)

    Remove unused header - drm_atomic_helper.h
    (Dmitry Osipenko)

v6: Include object backed by imported dmabuf
    (Dmitry Osipenko)

    Not storing virgl objects in the restore_list as virgl 3D objects are not
    recoverable.
    (Dmitry Osipenko)

    Change the name 'list',a node in restore_list to 'restore_node'
    (Nirmoy Das)

    Use mutex instead of spinlock when updating restore_list
    (Nirmoy Das)

    Initialize restore_node when virtio_gpu_object is created - this is to
    check if the node is in the list with 'list_empty' before removing it.

    Restoring objects in the PM notifier is too late, as virtio-gpu
    message communication begins in virtgpu_restore once virtqueues
    are re-established. To address this, a 'hibernation' flag is set
    during the PM_HIBERNATION_PREPARE phase in the notifier. This flag
    is then used in virtgpu_restore to detect if the system is resuming
    from S4, allowing objects to be recovered immediately after virtqueues
    are reconfigured.

Dongwon Kim (3):
  drm/virtio: Freeze and restore hooks to support suspend and resume
  drm/virtio: Add support for saving and restoring virtio_gpu_objects
  drm/virtio: Add PM notifier to restore objects after hibernation

 drivers/gpu/drm/virtio/virtgpu_drv.c    | 69 ++++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 15 ++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c    | 53 ++++++++++++++++---
 drivers/gpu/drm/virtio/virtgpu_object.c | 59 +++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_prime.c  | 44 ++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_vram.c   |  2 +
 6 files changed, 235 insertions(+), 7 deletions(-)

-- 
2.34.1

