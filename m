Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BF95ECC09
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 20:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C978B10E04E;
	Tue, 27 Sep 2022 18:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2614710E04E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 18:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664302682; x=1695838682;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Siu46b5+z6WVbEgcXZmq+le5XEUNPHfWu22K22EDh/k=;
 b=dlh2z9brTtHvGi49BzzCI0QWJFVuvFJ0fxVCpS2FYFqe53Jp4rDlIZL/
 ZdXdRh+qOjVfb78h8XqnVtTGyHgMfz+a+5tuiMkx5O2BTTDQWZ/oQVg9f
 3q86FGpm8OmQEUpdY49Xtfvghs7iisWUmv4WwtxKmGOY9rdrQ70jDGDBX
 oMHFowxoG6+nnwy2TnEDcHT/WMGbfU7is8VAh5gBOsssJppIqTQP1uRfV
 wnGldyBrSUaBS8jbi+AT3qvEQ83fYMuYRFQpG+OmuKNhsPV9mR1/58vwP
 4q0ww345R0sOmvT2N2uBxVvlX6l+K/R1MShPJsxgGn+COyNEElcrvEVHH g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="281762892"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="281762892"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 11:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="623849301"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="623849301"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga007.fm.intel.com with ESMTP; 27 Sep 2022 11:18:01 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/2] drm/virtio:virtio-gpu driver freeze-and-restore
 implementation
Date: Tue, 27 Sep 2022 11:07:25 -0700
Message-Id: <20220927180727.5323-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: dongwon.kim@intel.com, kraxel@redhat.com, vivek.kasireddy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is for adding virtio-gpu driver the support for the suspend and resume
(or freeze and restore).

First patch adds virtio-dev hooks that adds .freeze and .restore hooks that basically
flush and remove virtqueue before going into suspension then reinitialize them upon
wake-up event.

Second patch is the implementation of virtio-gpu resource restoration machanism that
is needed for the synchronization of resources between the host and the guest when
suspend(and hibernation) and resume happens.

Dongwon Kim (2):
  drm/virtio: freeze and restore hooks to support suspend and resume
  drm/virtio: restore virtio_gpu_objects upon suspend and resume

 drivers/gpu/drm/virtio/virtgpu_drv.c    |  59 +++++++++++-
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  11 +++
 drivers/gpu/drm/virtio/virtgpu_kms.c    |  23 +++--
 drivers/gpu/drm/virtio/virtgpu_object.c | 122 ++++++++++++++++++------
 4 files changed, 179 insertions(+), 36 deletions(-)

-- 
2.20.1

