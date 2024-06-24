Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D5D91434B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F9E10E370;
	Mon, 24 Jun 2024 07:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOig9HBT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9616710E04F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719213231; x=1750749231;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I+dZWampZuXVH7B9szmu8Cai59OscXK0+5Mtan3DVJw=;
 b=aOig9HBTWkK34UTg5Mw8TETEgPUPClgzxtsZY8rGChP3K64/0mx5v19p
 ZxB/VR1gvkCPFX9uUHwU7YX+Chyt8NLB9+lKuzznT9NUg8yzJU5RJXm5G
 WcEZXgYnIeqvkyjj/LXxq3lZZJIxNVGrijtfu05AVJ7+bjGdo2rNQgZ5x
 PdzwJ3963YtmwCkh3c9EdWCgLjRfG9Me0K78wN7SrzideBox7zqt5G0lg
 7Abc9+XjYN/mIeoqWyBnpEYx5gDlZvyTDdOA5wwuYXIeAJ6OpR2zazQZD
 kHlQ01VvGDzvB4LPJPtljHOenjdLi6whHBlM7CAQXen9oukqntswPSoyK g==;
X-CSE-ConnectionGUID: 3NKTyx92S5+06NK60nb/Og==
X-CSE-MsgGUID: smg876AgQnWWc60C123feg==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16136014"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="16136014"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:13:51 -0700
X-CSE-ConnectionGUID: Bp2eSwmbSQC35+nAvXTy1w==
X-CSE-MsgGUID: 9DZ/S5WUSkCTbQymB2vKwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="73960053"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:13:49 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v1 0/5] drm/virtio: Import scanout buffers from other devices
Date: Sun, 23 Jun 2024 23:43:29 -0700
Message-ID: <20240624064841.1572452-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Having virtio-gpu import scanout buffers (via prime) from other
devices means that we'd be adding a head to headless GPUs assigned
to a Guest VM or additional heads to regular GPU devices that are
passthrough'd to the Guest. In these cases, the Guest compositor
can render into the scanout buffer using a primary GPU and has the
secondary GPU (virtio-gpu) import it for display purposes.

The main advantage with this is that the imported scanout buffer can
either be displayed locally on the Host (e.g, using Qemu + GTK UI)
or encoded and streamed to a remote client (e.g, Qemu + Spice UI).
Note that since Qemu uses udmabuf driver, there would be no copies
made of the scanout buffer as it is displayed. This should be
possible even when it might reside in device memory such has VRAM.

The specific use-case that can be supported with this series is when
running Weston or other guest compositors with "additional-devices"
feature (./weston --drm-device=card1 --additional-devices=card0).
More info about this feature can be found at:
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/736

In the above scenario, card1 could be a dGPU or an iGPU and card0
would be virtio-gpu in KMS only mode. However, the case where this
patch series could be particularly useful is when card1 is a GPU VF
that needs to share its scanout buffer (in a zero-copy way) with the
GPU PF on the Host. Or, it can also be useful when the scanout buffer
needs to be shared between any two GPU devices (assuming one of them
is assigned to a Guest VM) as long as they are P2P DMA compatible.

As part of the import, the virtio-gpu driver shares the dma
addresses and lengths with Qemu which then determines whether the
memory region they belong to is owned by a VFIO device or whether it
is part of the Guest's system ram. If it is the former, it uses the
VFIO_DEVICE_FEATURE_DMA_BUF feature flag while invoking the ioctl
against the VFIO device fd and gets a dmabuf fd in return. In the
latter case, Qemu obtains the dmabuf fd using the udmabuf driver.

Note that the virtio-gpu driver registers a move_notify() callback
to track location changes associated with the scanout buffer and
sends attach/detach backing cmds to Qemu when appropriate. And,
synchronization (that is, ensuring that Guest and Host are not
using the scanout buffer at the same time) is ensured by pinning/
unpinning the dmabuf as part of prepare/cleanup fb and using a
fence in resource_flush cmd. 

Changelog:

RFC -> v1:
- Use virtio_gpu_cleanup_object() to cleanup the imported obj
- Do pin/unpin as part of prepare and cleanup fb for the imported
  dmabuf obj instead doing it as part of plane update
- Tested with gnome-shell/mutter (wayland backend)

This series is available at:
https://gitlab.freedesktop.org/Vivek/drm-tip/-/commits/virtgpu_import_v1

along with additional patches for Qemu and Spice here:
https://gitlab.freedesktop.org/Vivek/qemu/-/commits/vfio_dmabuf_2
https://gitlab.freedesktop.org/Vivek/spice/-/commits/encode_dmabuf_v8

Patchset overview:

Patch 1:   Implement VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING cmd
Patch 2-3: Helpers to initalize, import, free imported object
Patch 4-5: Import and use buffers from other devices for scanout

This series is tested using the following method:
- Run Qemu with the following relevant options:
  qemu-system-x86_64 -m 4096m ....
  -device vfio-pci,host=0000:03:00.0
  -device virtio-vga,max_outputs=1,blob=true,xres=1920,yres=1080
  -spice port=3001,gl=on,disable-ticketing=on,preferred-codec=gstreamer:h264
  -object memory-backend-memfd,id=mem1,size=4096M
  -machine memory-backend=mem1 ...
- Run upstream Weston with the following options in the Guest VM:
  ./weston --drm-device=card1 --additional-devices=card0
- Run gnome-shell/Mutter (wayland backend) with this additional patch:
  https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3745

where card1 is a DG2 dGPU (passthrough'd and using xe driver in Guest VM),
card0 is virtio-gpu and the Host is using a RPL iGPU.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michael Tretter <m.tretter@pengutronix.de>

Vivek Kasireddy (5):
  drm/virtio: Implement VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING cmd
  drm/virtio: Add a helper to map and note the dma addrs and lengths
  drm/virtio: Add helpers to initialize and free the imported object
  drm/virtio: Import prime buffers from other devices as guest blobs
  drm/virtio: Add prepare and cleanup routines for imported dmabuf obj

 drivers/gpu/drm/virtio/virtgpu_drv.h    |   7 +
 drivers/gpu/drm/virtio/virtgpu_object.c |   3 +
 drivers/gpu/drm/virtio/virtgpu_plane.c  |  71 +++++++++-
 drivers/gpu/drm/virtio/virtgpu_prime.c  | 171 +++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_vq.c     |  15 +++
 5 files changed, 265 insertions(+), 2 deletions(-)

-- 
2.45.1

