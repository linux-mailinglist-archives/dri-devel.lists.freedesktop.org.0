Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD6CAF652E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 00:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D36010E797;
	Wed,  2 Jul 2025 22:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MmEEAvwf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5302F10E08A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 22:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751495238; x=1783031238;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kUDDjceBZ5f6RHW36kiU0m2wmYaGjNaOBj7YI3gXy6g=;
 b=MmEEAvwfYaGvRmsyRTFWH5+Y83WJx72f5cz3UqCLM6k8Vyc4no0nbhdM
 LHzGSHZ5ne5VwgVcF+qOIezvKuRMuFzX/tewsMKdgII6dcq5MoRu+7F8T
 KSNoYhA2rimfDTRLqU/LY4v1n9rYkzUKlfE818qVxHQcWntXRTholoQdl
 EUV/nDl02CkEhFjsKognt0+UIQi8TUExn9HyXINE9rxRmJCFCalwC/oZ/
 OaGwGEpe1xWURT8pKAG1MAdapWP9UNA1rtKCZgY4YwmCZ/PT3FEdPR1tf
 4KfaXdOwBmVLMNOIA1YAA18gy/tec+IEejUSKbQ2iiq29k3bIqGXqyswy w==;
X-CSE-ConnectionGUID: zIy+Qa+JQA+GjKPODGWBiA==
X-CSE-MsgGUID: M06N18XrT323LaiiXnrTKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64407289"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="64407289"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 15:27:17 -0700
X-CSE-ConnectionGUID: SbNs6gY9SfyDPhtPdQNpLw==
X-CSE-MsgGUID: tZjdu7jtRkqIw0aoRrU8iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="158767779"
Received: from dongwonk-z390-aorus-ultra.fm.intel.com ([10.105.129.124])
 by orviesa004.jf.intel.com with ESMTP; 02 Jul 2025 15:27:18 -0700
From: dongwon.kim@intel.com
To: dri-devel@lists.freedesktop.org
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v3 0/2] Virtio-GPU suspend and resume
Date: Wed,  2 Jul 2025 15:24:28 -0700
Message-Id: <20250702222430.2316723-1-dongwon.kim@intel.com>
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

This patch series introduces a freeze and restore mechanism for
the virtio-gpu driver:

First patch adds `virtgpu_freeze` and `virtgpu_restore` functions.
These functions handle the deletion of virtio queues before suspension and
their recreation during the restoration process.

Second patch implements a mechanism for restoring `virtio_gpu_object` instances.
This is necessary because the host (QEMU) deletes all associated resources during
the virtio-gpu reset, which occurs as part of the restoration process.

These changes ensure that the virtio-gpu driver can properly handle suspend and
resume scenarios without resource loss.

v2: 10ms sleep is added in virtgpu_freeze to avoid the situation
    the driver is locked up during resumption.

v3: Plain 10ms delay (v2) is replaced with wait calls which wait until
    the virtio queue is empty.
    (Dmitry Osipenko)

Dongwon Kim (2):
  drm/virtio: Freeze and restore hooks to support suspend and resume
  drm/virtio: Implement save and restore for virtio_gpu_objects

 drivers/gpu/drm/virtio/virtgpu_drv.c    | 67 ++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 11 ++++
 drivers/gpu/drm/virtio/virtgpu_kms.c    | 24 ++++++---
 drivers/gpu/drm/virtio/virtgpu_object.c | 72 +++++++++++++++++++++++++
 4 files changed, 167 insertions(+), 7 deletions(-)

-- 
2.34.1

