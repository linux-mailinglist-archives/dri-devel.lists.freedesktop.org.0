Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F215CFF765
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 19:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A3910E1E9;
	Wed,  7 Jan 2026 18:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdZw3Klr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B929E10E1E9
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 18:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767810757; x=1799346757;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s6jUO88M3hrWrlMhXFf8mvAuzkcTXFpFKXDwt6ODa9Y=;
 b=bdZw3KlrnEZKNC7S2SEprhaimEIgAVzFNt+C6sywJ0HY9mCw0W5/FmTR
 pUAUGwMltqMDLhlrYbm4hUrX9blUqY0EbY8mpKamKeH0muIZbQPKsjNZl
 E7DVisZYPB8SdGm28qiI8p4795SuMN5A3VyRo1I7MMuZiISPqGyhpIv0d
 kyvzA86Bb7ugLLCzLbbkP5f3IJP7nd2s30GdhIXv3ulz7jlomc4MO6ypy
 hWyfhOpzTnMqERe9RIgkX1nQA3jWNlIreLONBV4myhmhh9/itkvxVnkq9
 a64093nR/zABcUX26+Y+7M2QKVNuKo2wiwX4awfggb37c6uZa6MOOYOvW Q==;
X-CSE-ConnectionGUID: S0dTniMTQbSERXtlNoSmbw==
X-CSE-MsgGUID: MB6JJu5ZTx2UqO66SrrtPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="68923694"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="68923694"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:32:37 -0800
X-CSE-ConnectionGUID: yQrVtxBpTqmDs3B029P0Sw==
X-CSE-MsgGUID: brQ1jcCSTb6g9Obd1e4qVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="207138295"
Received: from dongwonk-z390-aorus-ultra.fm.intel.com ([10.105.205.222])
 by orviesa003.jf.intel.com with ESMTP; 07 Jan 2026 10:32:37 -0800
From: dongwon.kim@intel.com
To: dri-devel@lists.freedesktop.org, airlied@redhat.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com
Cc: nirmoyd@nvidia.com,
	vivek.kasireddy@intel.com
Subject: [PATCH v7 0/3] Virtio-GPU S4 support
Date: Wed,  7 Jan 2026 10:27:42 -0800
Message-Id: <20260107182745.229481-1-dongwon.kim@intel.com>
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

Dongwon Kim (3):
  drm/virtio: Freeze and restore hooks to support suspend and resume
  drm/virtio: Add support for saving and restoring virtio_gpu_objects
  drm/virtio: Add PM notifier to restore objects after hibernation

 drivers/gpu/drm/virtio/virtgpu_drv.c    | 74 +++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 23 ++++++-
 drivers/gpu/drm/virtio/virtgpu_kms.c    | 54 ++++++++++++++--
 drivers/gpu/drm/virtio/virtgpu_object.c | 83 ++++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_prime.c  | 43 ++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 13 +++-
 drivers/gpu/drm/virtio/virtgpu_vram.c   |  4 +-
 7 files changed, 280 insertions(+), 14 deletions(-)

-- 
2.34.1

