Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39010A9404B
	for <lists+dri-devel@lfdr.de>; Sat, 19 Apr 2025 01:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4CE10E3A5;
	Fri, 18 Apr 2025 23:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RWRQPEPp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897D210E2D4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 23:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745019057; x=1776555057;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I2JVM/XEx+ZeQrKYQQTHILcGV267L26tWQ6mtJazd9Q=;
 b=RWRQPEPpwjs70hyH3jE/+jCtFgYqWDVOqZL9EvXThJ64ZL2jzkuSVdbh
 EY0DayWwzFxcD2UAkrLV1y3z6gcb+e5JpnhWpyMP2KWeuN3RjGyuIIFtX
 TWXBqBWN7Wz5W8E4wP7qN7VUC6nu39WNAmojQly3Bel8XVDoDLZBeBlRA
 g7TNb0/YcbhenKO2MfvfBaJISYZysUW1gKFv7mbTthXwI0hmBycs1SqLr
 m8RninaoVDDU/IqcCZje+yA0akxUAhbtwklKcEcRRwGRRjPlS8dnM0ltz
 KHv44mzuIRMlBYn17YQ21wXU3a+oF4QQEeRkpDHzJOGKmCVxswbPWJl97 g==;
X-CSE-ConnectionGUID: yVfyPe7HQcSatxIZ1z9sAg==
X-CSE-MsgGUID: FKZuPnNzQHaPrUWFx3JIrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="58033862"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="58033862"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 16:30:57 -0700
X-CSE-ConnectionGUID: X2PJxYjxQwKpC06HejDuvA==
X-CSE-MsgGUID: eitAB/gTSw2mHtQ5QVlpCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="168436930"
Received: from dongwonk-z390-aorus-ultra.fm.intel.com ([10.105.129.124])
 by orviesa001.jf.intel.com with ESMTP; 18 Apr 2025 16:30:57 -0700
From: dongwon.kim@intel.com
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/2] Virtio-GPU suspend and resume
Date: Fri, 18 Apr 2025 16:29:47 -0700
Message-Id: <20250418232949.1032604-1-dongwon.kim@intel.com>
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

Dongwon Kim (2):
  drm/virtio: Freeze and restore hooks to support suspend and resume
  drm/virtio: Implement save and restore for virtio_gpu_objects

 drivers/gpu/drm/virtio/virtgpu_drv.c    | 59 +++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 11 +++++
 drivers/gpu/drm/virtio/virtgpu_kms.c    | 24 ++++++---
 drivers/gpu/drm/virtio/virtgpu_object.c | 65 +++++++++++++++++++++++++
 4 files changed, 152 insertions(+), 7 deletions(-)

-- 
2.34.1

