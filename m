Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E2188FA94
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 10:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B37A11237F;
	Thu, 28 Mar 2024 09:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQBxnMm9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783F2112375
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711616465; x=1743152465;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dwwdy2QobEbUoMEnBfAvfQGjdGPu4wQpj4H0AU3Wkps=;
 b=hQBxnMm9rUC9Ah6kNirLNv+xIWw+cnTursPu4CfxfO9w59NdLQ3kwDcF
 1tA8wfr5WnaEMw2Y2d+5z0MXDqqcMKEFuVlNxa6TRgahKOly61NGujuCC
 rU9G18kIeZbZ21RLe63IkpjDthVNIWkPV2VNfYo+zdpCkYvt4d8P1202v
 w6xzCL6dw/HQ21hG+j/Kd8+AHWhkOEztT/JuyPaKzEWTTDDDCLbbFdmKz
 hXlNX4c+7LrCswv2g78OlYHqRuP1hdY6qNX6KDtX4968IOTkoxPRMag8M
 J1Cv3qG8sfsKlFuYWT8QIlQse6GU7IzfYFxDwphnV7qZxIh8k/2Wnk6hm Q==;
X-CSE-ConnectionGUID: hiPp6U9vRV6rgHzKf6luzg==
X-CSE-MsgGUID: MiCo+HynQNGuksJhl3ZfUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="7355684"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="7355684"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:01:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="21078208"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:01:02 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@chromium.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Michael Tretter <m.tretter@pengutronix.de>
Subject: [RFC 0/7] drm/virtio: Import scanout buffers from other devices
Date: Thu, 28 Mar 2024 01:32:53 -0700
Message-ID: <20240328083615.2662516-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.43.0
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
memory region they belong to is owned by a PCI device or whether it
is part of the Guest's system ram. If it is the former, it identifies
the devid (or bdf) and bar and provides this info (along with offsets
and sizes) to the udmabuf driver. In the latter case, instead of the
the devid and bar it provides the memfd. The udmabuf driver then
creates a dmabuf using this info that Qemu shares with Spice for
encode via Gstreamer.

Note that the virtio-gpu driver registers a move_notify() callback
to track location changes associated with the scanout buffer and
sends attach/detach backing cmds to Qemu when appropriate. And,
synchronization (that is, ensuring that Guest and Host are not
using the scanout buffer at the same time) is ensured by pinning/
unpinning the dmabuf as part of plane update and using a fence
in resource_flush cmd. 

This series is available at:
https://gitlab.freedesktop.org/Vivek/drm-tip/-/commits/virtgpu_import_rfc

along with additional patches for Qemu and Spice here:
https://gitlab.freedesktop.org/Vivek/qemu/-/commits/virtgpu_dmabuf_pcidev
https://gitlab.freedesktop.org/Vivek/spice/-/commits/encode_dmabuf_v4 

Patchset overview:

Patch 1:   Implement VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING cmd
Patch 2-3: Helpers to initalize, import, free imported object
Patch 4-5: Import and use buffers from other devices for scanout
Patch 6-7: Have udmabuf driver create dmabuf from PCI bars for P2P DMA

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

where card1 is a DG2 dGPU (passthrough'd and using xe driver in Guest VM),
card0 is virtio-gpu and the Host is using a RPL iGPU.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Rob Clark <robdclark@chromium.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michael Tretter <m.tretter@pengutronix.de>

Vivek Kasireddy (7):
  drm/virtio: Implement VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING cmd
  drm/virtio: Add a helper to map and note the dma addrs and lengths
  drm/virtio: Add helpers to initialize and free the imported object
  drm/virtio: Import prime buffers from other devices as guest blobs
  drm/virtio: Ensure that bo's backing store is valid while updating
    plane
  udmabuf/uapi: Add new ioctl to create a dmabuf from PCI bar regions
  udmabuf: Implement UDMABUF_CREATE_LIST_FOR_PCIDEV ioctl

 drivers/dma-buf/udmabuf.c              | 122 ++++++++++++++++--
 drivers/gpu/drm/virtio/virtgpu_drv.h   |   8 ++
 drivers/gpu/drm/virtio/virtgpu_plane.c |  56 ++++++++-
 drivers/gpu/drm/virtio/virtgpu_prime.c | 167 ++++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_vq.c    |  15 +++
 include/uapi/linux/udmabuf.h           |  11 +-
 6 files changed, 368 insertions(+), 11 deletions(-)

-- 
2.43.0

