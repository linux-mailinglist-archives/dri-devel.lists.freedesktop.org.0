Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64171AC2BA0
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 00:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4644110E0E1;
	Fri, 23 May 2025 22:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ar3EscER";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB17810E0E1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 22:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748037779; x=1779573779;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xuuum/p+lIwW7Ttw8TbbLLBrGVea9lJnW9pvKZKX7kk=;
 b=Ar3EscERt5WX6SqpUBBxfDvlsnih5xdhdZnNZHUxgw3ER/TELaIsYwTs
 i4j8yvzq8lLX6Z3C2VZ74iHbDr/nzPMJw5RKhNww9HADYaWyxD0UfgkJu
 Nzam1tHQK3BVa8Csa2IsFIDuS6X+NHPayPNEDOOSaELWMU5L/erPlKjOj
 oKsfFvac/N5AkaLqflZNXzF5UV0QaaFl5qPnozE+0u181hWmSEXZIcy3Q
 68G3rfvrJiSsM/bRp+Eh8KB05Sw4aTvhRLOB5W1aUpMGqDa+nhXsCJcTf
 igdtm5wHUQtcfQmv2jZ9GR3U5yi4Wb9PjJzY+Klkw2hHlZSI5haNNk1oC Q==;
X-CSE-ConnectionGUID: MHoUwPijROOx+n2yCo21jg==
X-CSE-MsgGUID: AkyzYMiKRH2GRE2BoijZmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49994365"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="49994365"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 15:02:50 -0700
X-CSE-ConnectionGUID: PDr/4lNWSsuvJ6hFmW8TgA==
X-CSE-MsgGUID: 8UW7iDW2Rh6NPlGwSFGe4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="172272180"
Received: from dongwonk-z390-aorus-ultra.fm.intel.com ([10.105.129.124])
 by fmviesa001.fm.intel.com with ESMTP; 23 May 2025 15:02:49 -0700
From: dongwon.kim@intel.com
To: dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [RFC PATCH v2 0/2] Virtio-GPU suspend and resume
Date: Fri, 23 May 2025 15:00:13 -0700
Message-Id: <20250523220015.994716-1-dongwon.kim@intel.com>
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

 drivers/gpu/drm/virtio/virtgpu_drv.c    | 65 +++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 11 ++++
 drivers/gpu/drm/virtio/virtgpu_kms.c    | 24 ++++++---
 drivers/gpu/drm/virtio/virtgpu_object.c | 72 +++++++++++++++++++++++++
 4 files changed, 165 insertions(+), 7 deletions(-)

-- 
2.34.1

