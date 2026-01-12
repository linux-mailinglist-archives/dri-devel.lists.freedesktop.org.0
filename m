Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D43A6D152A6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 21:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C5810E2B1;
	Mon, 12 Jan 2026 20:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PXHrlwZS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A8410E15A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 20:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768248876; x=1799784876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y6KvK+ainLdhebr1VoOlqEXxfqg2YXvQdqIbqlmSFVk=;
 b=PXHrlwZSVF1wIMwZU/kzdliZX1+/3rtJntmhrKFvrKfIaN9iLuEc+CK3
 Y00dK192KAf2xuI4czbUaGtDEfodjZSjrR7XQBcnTPubmwm5Xue3K0XZX
 JTytpPBTh63E9E8G3J9kY5btEQAY5oVfVBvuexYQYBAvRhObcuPwFLKQ5
 hhetNrmfTbWGbQmZXt+i9dQW4RA1xg9qf5XPy0yrjw1wuRMJBLjQsW642
 +0+ANprt2co5U8zwKrut2BTysUAjwTF8lFlAeBH/1gzwvVXr2Hx8Hc4nT
 fIeWZ3Pbv3DQruLkACqWmPfnQtli7eotOh+v1CgVLtvdTAac5z1olyzq7 Q==;
X-CSE-ConnectionGUID: Ct3Xo3DjRU6/Eh+bqGCHoQ==
X-CSE-MsgGUID: 6dmvHQ2pSvyDiqKtXc2PVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68536798"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="68536798"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 12:14:35 -0800
X-CSE-ConnectionGUID: EwjVuVapQISyMulmFMuKcg==
X-CSE-MsgGUID: 8LtlvcOuSdaxgkK71dk68A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="227424195"
Received: from dongwonk-z390-aorus-ultra.fm.intel.com ([10.105.205.222])
 by fmviesa002.fm.intel.com with ESMTP; 12 Jan 2026 12:14:35 -0800
From: dongwon.kim@intel.com
To: dri-devel@lists.freedesktop.org, airlied@redhat.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com
Cc: nirmoyd@nvidia.com,
	vivek.kasireddy@intel.com
Subject: [PATCH v8 0/3] Virtio-GPU S4 support
Date: Mon, 12 Jan 2026 12:09:41 -0800
Message-Id: <20260112200944.552464-1-dongwon.kim@intel.com>
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

v7: Add a helper, virtio_gpu_add_object_to_restore_list
    (Dmitry Osipenko)

    Unreference all objects before hibernation so they can be removed
    on the host side, since they will be fully restored anyway. This
    prevents the situation where host-side hibernation fails (leaving
    all associated resources still alive) while the virtio-gpu driver
    still attempts to restore those objects.
    (Dmitry Osipenko)

v8: Add drm_print.h to virtgpu_prime.c

Dongwon Kim (3):
  drm/virtio: Freeze and restore hooks to support suspend and resume
  drm/virtio: Add support for saving and restoring virtio_gpu_objects
  drm/virtio: Add PM notifier to restore objects after hibernation

 drivers/gpu/drm/virtio/virtgpu_drv.c    | 74 +++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 23 ++++++-
 drivers/gpu/drm/virtio/virtgpu_kms.c    | 54 ++++++++++++++--
 drivers/gpu/drm/virtio/virtgpu_object.c | 83 ++++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_prime.c  | 44 ++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 13 +++-
 drivers/gpu/drm/virtio/virtgpu_vram.c   |  4 +-
 7 files changed, 281 insertions(+), 14 deletions(-)

-- 
2.34.1

