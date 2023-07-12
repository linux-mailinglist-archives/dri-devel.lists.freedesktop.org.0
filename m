Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15FA75141B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 01:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB9C10E061;
	Wed, 12 Jul 2023 23:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F35710E061
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 23:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689203222; x=1720739222;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sXsPKpaqXIP2G/3xgQRed7wv/jmAinqajX1Hr1JDYJQ=;
 b=KA7N+5RX5WIeKndr2PRXHhiZZxFy2qXbfwb3EdycoihkcNy6BHYeo0TM
 Z7+yaGbN6smz0Bzo0j+DeDV9Mo2lPJzCjMhuneyV6KEKGkxFWAdVIt210
 2Kda+cehuP4xL0cPKY+Bmrs6UEeWs+jgPf6zHFUNsUM3gV41MZNHI3YvY
 7r+5SHCbT0ntNyT8xJIouVJiR64z6BytjpvHE3DtyS4wNapyX8tNrkdbV
 ckdJw2+hz2cRPkok/up/Mtv88iVTQ6SrSBzr83HdAmE/lMAL1V78ikrVi
 le4CLd5niS4dEeHxAxluzOj9uApP42cPnX8wnwt935BUnxYAyVpVECWxf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="367654201"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; d="scan'208";a="367654201"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 16:07:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="895771980"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; d="scan'208";a="895771980"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by orsmga005.jf.intel.com with ESMTP; 12 Jul 2023 16:07:00 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PFC PATCH 0/3] drm/virtio: synchronous guest framebuffer update
Date: Wed, 12 Jul 2023 15:44:21 -0700
Message-Id: <20230712224424.30158-1-dongwon.kim@intel.com>
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
Cc: kraxel@redhat.com, Dongwon Kim <dongwon.kim@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Resubmission"

This series is for fixing issues regarding scanout synchronization with
host (e.g. QEMU/KVM) that uses virtio-gpu. This was submitted a while ago
but didn't get enough feedback/reviews so I am trying it again. This is a
rebased version. And the previous version is at
https://lists.freedesktop.org/archives/dri-devel/2022-September/373782.html

And very first version that has some feedbacks can be found here:
https://www.spinics.net/lists/dri-devel/msg349641.html

Dongwon Kim (3):
  drm/virtio: .release ops for virtgpu fence release
  drm/virtio: new fence for every plane update
  drm/virtio: drm_gem_plane_helper_prepare_fb for obj synchronization

 drivers/gpu/drm/virtio/virtgpu_drv.h   |  7 +++
 drivers/gpu/drm/virtio/virtgpu_fence.c |  8 +++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 80 +++++++++++++++-----------
 3 files changed, 63 insertions(+), 32 deletions(-)

-- 
2.20.1

