Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8629BB5F24
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 07:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3C810E0BB;
	Fri,  3 Oct 2025 05:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IV+z/owU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF1710E040
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 05:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759469644; x=1791005644;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D7YiPZ4zvPyc8Z+D06CREkaLilkpjpF1Rbm3faMM6eA=;
 b=IV+z/owUv7e35hC/KgeJLPnZZVuXPzeDhft4ZjxKikh1iumHM37QnO82
 kLyq3PyP7y1YNzFpzGiaNwrw1WCuavlQGcPqHZafAmdxWZ+5pxwIfNlEl
 o+Tnt+rn7oT3w5IHVrthaUePb94Llwhg8wgPQpDzwwhBml7eUzXlewq42
 TYztLxuayvS/n+DoeTCzxloqHWwO5cCe5bFiDoZ3tNrK0GpWQNAzyzMdl
 PfwsKWWuILyD5qEDbgZVbNke7pevRpTEq2WnYTH0d9RZkW8CapFMLDmW5
 Ci7YZvY25xtI0J+40ZHr5tDwUDFQy3AUqGt3kaSiMoExz037i6qG1bZkP A==;
X-CSE-ConnectionGUID: E+DQZquNTVWmdOm9ow/i1A==
X-CSE-MsgGUID: 834YkjnoTtWQ388tfqcxug==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="65393210"
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; d="scan'208";a="65393210"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 22:34:04 -0700
X-CSE-ConnectionGUID: AkA/LvhCQreSmbc5PdYZMQ==
X-CSE-MsgGUID: 4ToAGRsnTEqrpMzws9TBAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; d="scan'208";a="179154854"
Received: from dongwonk-z390-aorus-ultra.fm.intel.com ([10.105.205.222])
 by fmviesa006.fm.intel.com with ESMTP; 02 Oct 2025 22:34:03 -0700
From: dongwon.kim@intel.com
To: dri-devel@lists.freedesktop.org
Cc: dmitry.osipenko@collabora.com,
	nirmoyd@nvidia.com
Subject: [PATCH v5 0/3] Virtio-GPU S4 support
Date: Thu,  2 Oct 2025 22:33:59 -0700
Message-Id: <20251003053402.732218-1-dongwon.kim@intel.com>
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

Dongwon Kim (3):
  drm/virtio: Freeze and restore hooks to support suspend and resume
  drm/virtio: Add support for saving and restoring virtio_gpu_objects
  drm/virtio: Add PM notifier to restore objects after hibernation

 drivers/gpu/drm/virtio/virtgpu_drv.c    | 60 +++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 12 +++++
 drivers/gpu/drm/virtio/virtgpu_kms.c    | 51 ++++++++++++++++++---
 drivers/gpu/drm/virtio/virtgpu_object.c | 61 +++++++++++++++++++++++++
 4 files changed, 177 insertions(+), 7 deletions(-)

-- 
2.34.1

