Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7533A37F9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 01:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7856EE1B;
	Thu, 10 Jun 2021 23:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F9D6EE2D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 23:37:30 +0000 (UTC)
IronPort-SDR: lQUaGwPTarHu6iDObBkGwqGTAgu9NMeMqmYQdan4SnRjZ2hHnpLPYZUB5upk/KueX1KwZ8dVWE
 6HqBiNkCYZpg==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="291059221"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="291059221"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:37:29 -0700
IronPort-SDR: Pb8uxr7R9J4YEiD0BX+kPEK3Y0ljR1Vod140iFCgVUcYSBEYIyhWXAvt0pbdwnE36yj/Hpfu0l
 DnsosMOMCbPw==
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="414275086"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:37:29 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/3] drm/virtio: Add a default synchronization mechanism
 for blobs
Date: Thu, 10 Jun 2021 16:24:53 -0700
Message-Id: <20210610232456.671905-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, Tina Zhang <tina.zhang@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This 3 patch series is the counterpart for this other series:
https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg02906.html

It makes it possible for the Guest to wait until the Host has 
completely consumed its FB before reusing it again thereby ensuring
that both the parties don't access it at the same time.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Tina Zhang <tina.zhang@intel.com>

Vivek Kasireddy (3):
  drm/virtio: Add fences for Guest blobs
  drm/virtio: Prepare resource_flush to accept a fence
  drm/virtio: Add the fence in resource_flush if present

 drivers/gpu/drm/virtio/virtgpu_drv.h   |  4 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c | 64 ++++++++++++++++++++------
 drivers/gpu/drm/virtio/virtgpu_vq.c    |  7 ++-
 3 files changed, 59 insertions(+), 16 deletions(-)

-- 
2.30.2

