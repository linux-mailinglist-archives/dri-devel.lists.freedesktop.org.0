Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA65EB9BC47
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 21:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC5710E256;
	Wed, 24 Sep 2025 19:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXbZVtaC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E9010E071
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 19:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758743468; x=1790279468;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BIwRKdfn5smxBnaqewt6r3vKPlmmDH2N633EJk8fqP8=;
 b=HXbZVtaCLO/YPSXekifLVfKTIzrMgFD7L0Rp094gAL1c3OPxgDlNEcT7
 CVUJMvvTZ317QiD+mkFa/FZVdLZGclh2XDcRHYxcEL+SkYb5zeZlwA/C0
 YmjIr7iPvkNO3OT8/r/nLvMoJC7Rr15aOvijEb35NPF71QNXRvtPrkjAH
 0IlaKS+A2fu9khS2Y2tM/ZlKAqldEljw5qOJ/PIHrLoRm+axO6eRRCmc1
 KJvvatpE4HjJtR1C1Qpjd/vU8YVuVN5mQ43XsscXmUSAkobOazdGb6bDU
 B87Qr1I9StM9BQBT0WUKNafHZpaANJp1sQlD4E0Ko601zWN42zbDlTHp/ A==;
X-CSE-ConnectionGUID: oz1vonxITL+ekcL2og9TQg==
X-CSE-MsgGUID: OPBiVHT6RXmelwfqFJP0iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="64889872"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="64889872"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 12:51:08 -0700
X-CSE-ConnectionGUID: 2bsis17JRPmFFx6FjZir0A==
X-CSE-MsgGUID: ZkNqmLOlTayQTHKkyOb0Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="176966245"
Received: from dongwonk-z390-aorus-ultra.fm.intel.com ([10.105.205.222])
 by orviesa007.jf.intel.com with ESMTP; 24 Sep 2025 12:51:07 -0700
From: dongwon.kim@intel.com
To: dri-devel@lists.freedesktop.org
Cc: dmitry.osipenko@collabora.com
Subject: [PATCH v4 0/3] Virtio-GPU S4 support
Date: Wed, 24 Sep 2025 12:47:52 -0700
Message-Id: <20250924194755.1265531-1-dongwon.kim@intel.com>
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

This patch series introduces support for handling hibernation (S4)
in the virtio-gpu driver by implementing .freeze and .restore hooks,
along with a PM notifier to restore GPU resources upon resume.

Patch 1 adds virtgpu_freeze and virtgpu_restore functions, which manage
virtio queue teardown before suspend/hibernation and reinitialization
during resume.

Patch 2 implements a mechanism to track and restore virtio_gpu_object
instances, addressing the issue where QEMU discards resources during
virtio-gpu-reset triggered by hibernation.

Patch 3 adds a PM notifier that triggers resubmission of GPU objects to
QEMU when the guest resumes from hibernation.

These changes ensure that the virtio-gpu driver can reliably restore
virtio-gpu resources after hibernation, preventing resource loss that
leads to system's instability.

v2: 10ms sleep is added in virtgpu_freeze to avoid the situation
    the driver is locked up during resumption.

v3: Plain 10ms delay (v2) is replaced with wait calls which wait until
    the virtio queue is empty.
    (Dmitry Osipenko)

v4: New version of patchset only covers S4 case because loss of resources
    in S3 case can be avoided by skipping virtio-gpu-reset in QEMU
    (hw/display/virtio-gpu.c). For this, virtio-gpu-pci device should be
    attached to PCIE bus AND a PCIE option, 'x-pcie-pm-no-soft-reset' needs
    to be enabled when launching QEMU
    (e.g. -device virtio-gpu-pci,bus=port,x-pcie-pm-no-soft-reset=true)

Dongwon Kim (3):
  drm/virtio: Freeze and restore hooks to support suspend and resume
  drm/virtio: Add support for saving and restoring virtio_gpu_objects
  drm/virtio: Restore Virt-GPU res on hibernation resume via PM notifier

 drivers/gpu/drm/virtio/virtgpu_drv.c    | 60 ++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 13 +++++
 drivers/gpu/drm/virtio/virtgpu_kms.c    | 49 ++++++++++++++---
 drivers/gpu/drm/virtio/virtgpu_object.c | 71 +++++++++++++++++++++++++
 4 files changed, 186 insertions(+), 7 deletions(-)

-- 
2.34.1

