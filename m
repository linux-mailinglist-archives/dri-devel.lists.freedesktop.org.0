Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7104D18F4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 14:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D49D10E4AB;
	Tue,  8 Mar 2022 13:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E999410E4AB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 13:17:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id A43E61F44049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646745457;
 bh=zcqcE7dIUc7tx7i1KnnMTJpX/TOVNA/MHpX4Pjw5exg=;
 h=From:To:Cc:Subject:Date:From;
 b=HKfueVRLzYyO7heYtKq0P/VcD/mvjVk9O+tlsnYuUALjo1FEabj4WwLBiVWL4Av90
 uVcDFyMWpNldyoeq/D1suqnKq1P0WFuhcj4bj5KWotnShNHJdaomZzegK+sgxLzaGh
 UPRHSrtVQqZMvjiaJ2+DHew1T80/308r6GFNpQpATODJcrO2YO63bZNR+t3o3YBD4c
 m7uy3eScR6qnPupk0ewJL2RF8oj9M2lV0b5ZxjCdUfhs1RYJ8zSS6EnScZRIidZXTR
 ASbl241baqqO2DnpZ4AHIJIvPbrifE/YXG8iUN/PnlBTF1gPVJ3Fi63Luk8a4YanB3
 JOs7NFZaib1bA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>
Subject: [PATCH v1 0/5] Add memory shrinker to VirtIO-GPU DRM driver
Date: Tue,  8 Mar 2022 16:17:20 +0300
Message-Id: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patchset introduces memory shrinker for the VirtIO-GPU DRM driver.
During OOM, the shrinker will release BOs that are marked as "not needed"
by userspace using the new madvise IOCTL. The userspace in this case is
the Mesa VirGL driver, it will mark the cached BOs as "not needed",
allowing kernel driver to release memory of the cached shmem BOs on lowmem
situations, preventing OOM kills.

This patchset includes couple fixes for problems I found while was working
on the shrinker, it also includes prerequisite DMA API usage improvement
needed by the shrinker.

The Mesa and IGT patches will be kept on hold until this kernel series
will be approved and applied.

This patchset was tested using Qemu and crosvm, including both cases of
IOMMU off/on.

Mesa: https://gitlab.freedesktop.org/digetx/mesa/-/commits/virgl-madvise
IGT:  https://gitlab.freedesktop.org/digetx/igt-gpu-tools/-/tree/virtio-madvise

Dmitry Osipenko (5):
  drm/virtio: Correct drm_gem_shmem_get_sg_table() error handling
  drm/virtio: Check whether transferred 2D BO is shmem
  drm/virtio: Unlock GEM reservations in error code path
  drm/virtio: Improve DMA API usage for shmem BOs
  drm/virtio: Add memory shrinker

 drivers/gpu/drm/virtio/Makefile               |   3 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c          |  22 +++-
 drivers/gpu/drm/virtio/virtgpu_drv.h          |  31 ++++-
 drivers/gpu/drm/virtio/virtgpu_gem.c          |  84 ++++++++++++
 drivers/gpu/drm/virtio/virtgpu_gem_shrinker.c | 124 ++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c        |  37 ++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c          |  17 ++-
 drivers/gpu/drm/virtio/virtgpu_object.c       |  63 +++------
 drivers/gpu/drm/virtio/virtgpu_plane.c        |  17 ++-
 drivers/gpu/drm/virtio/virtgpu_vq.c           |  30 +++--
 include/uapi/drm/virtgpu_drm.h                |  14 ++
 11 files changed, 373 insertions(+), 69 deletions(-)
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_gem_shrinker.c

-- 
2.35.1

