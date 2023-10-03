Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DA27B5EA9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 03:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A517110E199;
	Tue,  3 Oct 2023 01:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F44710E196
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 01:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696296407; x=1727832407;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J5m7lzW0PJRq2RFkCNMr2d2VPojM5nDP15Bh8RCBpJQ=;
 b=XiSOAepy7Y5vXECp8u1Ehwxj/BxoTdrU5RQ8z9yfMAN2DGsIPxsm3y5r
 47MkhXmhDkME0G3B0kBd4NZ9g971KNF2b0LPxpVoobIPgbyeHomqiUxL2
 CFhx7/BS3ijhMJytxs8nT0eT+7iSbwMATirmPWxH8AASL3SE8Xvnvr+9x
 dj03hJFdHRMdjezPAGcdpRdDomM+VkiJYUDUb5EXDS7p/fxw9Rs2Ac0SY
 3VZrHfizoLXBc+V8jY4d6p8jQpBxuUbDWHMzctTtKkQ4DH5kyyfws1PS6
 cdBYkmWLPluZUYT7YsE4q5zyD82dM+lqlyotyV95FfbxghN8ALcdT20A/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="446933377"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="446933377"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 18:26:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="1717189"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.124])
 by fmviesa001.fm.intel.com with ESMTP; 02 Oct 2023 18:26:51 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 0/1] fence per plane state
Date: Mon,  2 Oct 2023 18:00:12 -0700
Message-Id: <20231003010013.15794-1-dongwon.kim@intel.com>
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, kraxel@redhat.com,
 dmitry.osipenko@collabora.com, vivek.kasireddy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch "drm/virtio: new fence for every plane update" is to prevent a fence
synchronization problem when multiple planes are referencing a single large FB
(i.e. Xorg with multi displays configured as one extended surface.).

One example of a possible problematic flow is

1.virtio_gpu_plane_prepare_fb(plane_A) -> A fence for the FB is created (fence A)
2.virtio_gpu_resource_flush(plane_A) -> Fence A is emitted. Then it waits for the fence A
  to be signaled.
3.virtio_gpu_plane_prepare_fb(plane_B) -> A new fence for the FB is created (fence B) and
  FB->fence is replaced with fence B.
4.virtio_gpu_resource_flush(plane_A) -> Fence A is signaled but dma_fence_put is done for
  fence B because FB->fence = fence B already.
5.fence A won't be signaled or released for a long time, which leads to guest display and
  dmesg shows fence timeout errors.

The root-cause for problems is that the fence for the FB can be replaced with the new one
anytime another plain with the same FB is updated. So the proposed fix here is to allocate
a new fence per the plane state instead of per FB as described in the patch.

Tested system:

Host: QEMU + KVM on Linux running on Intel 12th Gen.
Guest: Ubuntu VM running Xorg w/ 2~3 virtual displays using blob scanouts

Dongwon Kim (1):
  drm/virtio: new fence for every plane update

 drivers/gpu/drm/virtio/virtgpu_drv.h   |  7 +++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 66 +++++++++++++++++---------
 2 files changed, 51 insertions(+), 22 deletions(-)

-- 
2.20.1

