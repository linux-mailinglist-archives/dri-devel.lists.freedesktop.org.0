Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C3E6C70AD
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 20:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095A810EB0C;
	Thu, 23 Mar 2023 19:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B769910EB0C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 19:05:30 +0000 (UTC)
Received: from workpc.. (109-252-120-116.nat.spd-mgts.ru [109.252.120.116])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E618266030F3;
 Thu, 23 Mar 2023 19:05:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1679598329;
 bh=v8fPAAWWA6nbbxEf6OAFnarDXLLTXBINSP3vQpWeNuk=;
 h=From:To:Cc:Subject:Date:From;
 b=g5j/ChdZVl1HDfltRbYV/8/JzRgonxczfUHHn+4ZhVbIjA3wkohoCi1LXIKXIusqN
 maJrRXkLlY3dMNEoLGN7XDugT/mqghWhSgAi7DohPxVERWYh3Xrn+QoOmHcr5Ub6rg
 ivAuq5eABaYQ/oMNlnhL2gewOyEjfx3BvQqr3ZfKwJL2opyrFf9plu2EE4lg4lSZZa
 UEjZxiE5eYycfPdy3hOpga7ZN7SjBIWjfy9Wa0P9bMLH/rnz5mf3LR2lcWl0iUuj23
 L6AHfmEpgVHHqztCqPkmA15ILDt0vu0PXgrB5zd8VNtxsFCN3WBby6Yh7E0PJmDcmd
 cgijwFKW9VBSA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Subject: [PATCH v3 0/2] Add sync object UAPI support to VirtIO-GPU driver
Date: Thu, 23 Mar 2023 22:03:38 +0300
Message-Id: <20230323190340.950875-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.39.2
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have multiple Vulkan context types that are awaiting for the addition
of the sync object DRM UAPI support to the VirtIO-GPU kernel driver:

 1. Venus context
 2. Native contexts (virtio-freedreno, virtio-intel, virtio-amdgpu)

Mesa core supports DRM sync object UAPI, providing Vulkan drivers with a
generic fencing implementation that we want to utilize.

This patch adds initial sync objects support. It creates fundament for a
further fencing improvements. Later on we will want to extend the VirtIO-GPU
fencing API with passing fence IDs to host for waiting, it will be a new
additional VirtIO-GPU IOCTL and more. Today we have several VirtIO-GPU context
drivers in works that require VirtIO-GPU to support sync objects UAPI.

The patch is heavily inspired by the sync object UAPI implementation of the
MSM driver.

Changelog:

v3: - Switched to use dma_fence_unwrap_for_each(), like was suggested by
      Rob Clark.

    - Fixed missing dma_fence_put() in error code path that was spotted by
      Rob Clark.

    - Removed obsoleted comment to virtio_gpu_execbuffer_ioctl(), like was
      suggested by Rob Clark.

v2: - Fixed chain-fence context matching by making use of
      dma_fence_chain_contained().

    - Fixed potential uninitialized var usage in error code patch of
      parse_post_deps(). MSM driver had a similar issue that is fixed
      already in upstream.

    - Added new patch that refactors job submission code path. I found
      that it was very difficult to add a new/upcoming host-waits feature
      because of how variables are passed around the code, the virtgpu_ioctl.c
      also was growing to unmanageable size.

Dmitry Osipenko (2):
  drm/virtio: Refactor job submission code path
  drm/virtio: Support sync objects

 drivers/gpu/drm/virtio/Makefile         |   2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c    |   3 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h    |   4 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 182 ---------
 drivers/gpu/drm/virtio/virtgpu_submit.c | 513 ++++++++++++++++++++++++
 include/uapi/drm/virtgpu_drm.h          |  16 +-
 6 files changed, 535 insertions(+), 185 deletions(-)
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_submit.c

-- 
2.39.2

