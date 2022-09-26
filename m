Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D69CF5EB551
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 01:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C44910E818;
	Mon, 26 Sep 2022 23:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8362810E815
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 23:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664234236; x=1695770236;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cxNrbqAjmClIvFG/OVKytkPgNtvi7T+9EIcqeNgq8Ic=;
 b=QF8kS1LM2XLaBg4Yq0+VOCbcmdnRrFwE1nSzcPhwXMqcsvyPNfZALMmS
 SWFeVJUuocaJbdozMgZjtQ8Fmyf47+B/eB+2rHfJF8FRSeaWJu4q7nbxr
 /QrQIyiO+D/GjlHtw6d1ODratpnpXzEXhaDVEb8H8hpZYsLU2wFQtP4vu
 oWkXbVwW3+nB56FvSpRu/iYOoHC0QfYhDhGw1z7CyB3J0aMpYirlHXtFJ
 0HeoBnZ3TXuYxBEb4Nel7Wt9bqqdoUN35a8ixX0bW2aLoBkVrqJW2HZCQ
 cnnE28ujAVSu5rFTQ8Mdu1n4n1H1sGQqMAGqizfee/k72WoU6/ToF4jYO A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="284285287"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; d="scan'208";a="284285287"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 16:17:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="763649541"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; d="scan'208";a="763649541"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2022 16:17:15 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PFC PATCH 0/3] drm/virtio: synchronous guest framebuffer update
Date: Mon, 26 Sep 2022 16:06:52 -0700
Message-Id: <20220926230655.2565-1-dongwon.kim@intel.com>
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
Cc: dongwon.kim@intel.com, vivek.kasireddy@intel.com, kraxel@redhat.com,
 gurchetansingh@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is for fixing some issues regarding scanout synchronization with
host (e.g. QEMU/KVM) that uses virtio-gpu. This series replaces the previously
submitted one, "[PATCH v2 0/2] drm/virtio: fence handling in case of multi
scanouts".

Dongwon Kim (3):
  drm/virtio: .release ops for virtgpu fence release
  drm/virtio: new fence for every plane update
  drm/virtio: drm_gem_plane_helper_prepare_fb for obj synchronization

 drivers/gpu/drm/virtio/virtgpu_drv.h   |  7 +++
 drivers/gpu/drm/virtio/virtgpu_fence.c |  8 +++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 85 +++++++++++++++-----------
 3 files changed, 65 insertions(+), 35 deletions(-)

-- 
2.20.1

