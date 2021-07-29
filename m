Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6373D9F95
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 10:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A2E6ECA0;
	Thu, 29 Jul 2021 08:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6D96ECA0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 08:29:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="276612147"
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="276612147"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 01:29:50 -0700
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="507013876"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 01:29:49 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Date: Thu, 29 Jul 2021 01:16:55 -0700
Message-Id: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Tina Zhang <tina.zhang@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By separating the OUT_FENCE signalling from pageflip completion allows
a Guest compositor to start a new repaint cycle with a new buffer
instead of waiting for the old buffer to be free. 

This work is based on the idea/suggestion from Simon and Pekka.

This capability can be a solution for this issue:
https://gitlab.freedesktop.org/wayland/weston/-/issues/514

Corresponding Weston MR:
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/668

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Michel Dänzer <michel@daenzer.net>
Cc: Tina Zhang <tina.zhang@intel.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>

Vivek Kasireddy (4):
  drm: Add a capability flag to support deferred out_fence signalling
  virtio-gpu uapi: Add VIRTIO_GPU_F_OUT_FENCE feature
  drm/virtio: Add VIRTIO_GPU_CMD_RESOURCE_OUT_FENCE cmd
  drm/virtio: Probe and implement VIRTIO_GPU_F_OUT_FENCE feature

 drivers/gpu/drm/drm_file.c               | 11 +++---
 drivers/gpu/drm/drm_ioctl.c              |  3 ++
 drivers/gpu/drm/virtio/virtgpu_debugfs.c |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c     |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  6 ++++
 drivers/gpu/drm/virtio/virtgpu_fence.c   |  9 +++++
 drivers/gpu/drm/virtio/virtgpu_kms.c     | 10 ++++--
 drivers/gpu/drm/virtio/virtgpu_plane.c   | 44 +++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 17 +++++++++
 include/drm/drm_mode_config.h            |  9 +++++
 include/uapi/drm/drm.h                   |  1 +
 include/uapi/linux/virtio_gpu.h          | 12 +++++++
 12 files changed, 117 insertions(+), 7 deletions(-)

-- 
2.30.2

