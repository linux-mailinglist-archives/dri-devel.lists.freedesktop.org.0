Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BEB7BC9A3
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 21:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7937110E02F;
	Sat,  7 Oct 2023 19:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C706510E02F
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Oct 2023 19:49:43 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7400F66072BB;
 Sat,  7 Oct 2023 20:49:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696708182;
 bh=jxn4oc/yI6t62r9mg5ChscM72pMr3cCvBu3CCP7Cs/g=;
 h=From:To:Cc:Subject:Date:From;
 b=liqlmvSZT4yO6UtBzTcdCt/d6abZsK75MrkAEpI+A9MbqIPxv5WBFmvQh7Cbms9Ip
 TYs9H636XezCKy0ebIHYapixbk57d02cwRdRKyDEY0zl6XwOhKAvGs5sbaFWvDSBnQ
 xSLtyBxKlgVoq0t/Z7hB/o3fUOy840AngfP3X+ZNL1daTAfcVwcv5Sx+kyXOOaQo8f
 8QZRE517bHDxxejGN/p7h3P18xybpXr+LPLwW/UBi9uXyFKSLw77G3Zd0i/2BPfTi4
 bWRZ+KQQ9xKsWvgF7LF9PsTP2FYoRlp1FHlCvLVS4ij58LEKoNELAXP3eBbxFZuVcW
 f08VvYRj2I8iA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [RFC PATCH v1 0/1] Support passing VirtIO-GPU fences to host for
 waiting
Date: Sat,  7 Oct 2023 22:47:46 +0300
Message-ID: <20231007194747.788934-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
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

Today's VirtIO-GPU driver always has to wait for in-fences on the guest
side, creating bottleneck for workloads that produce lots of job submissions
or require lower submission latency. This bottleneck is caused by a need
to do extra round trips between host and guest for the fence signalling.

The solution is to move fence signalling and waiting entierly to the host
side, where it can be done more efficiently, without holding the guest side.
The proposed patch introduces new "fence passing" VirtIO-GPU protocol
feature, which extends VIRTIO_GPU_CMD_SUBMIT_3D with array of in-fence IDs
that are passed from guest to host along with the 3D commands. Host then
takes the in-fence IDs and passes them to virglrender, where the fence IDs
are resolved into sync file fences and handled (waited) by a corresponding
virglrender context.

The patch is RFC because we want to do more testing with crosvm and
CrOS first, support fence-passing for Venus and virtio-wl. The new
virglrender experimental fence-passing API already has been merged [1]
and crosvm support began to pick it up [2]. Qemu patch is available at [3].

Fence passing was tested using WIP amdgpu and intel native contexts,
where it proved to be useful by increasing FPS up to 3x times.

[1] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1138
[2] https://chromium-review.googlesource.com/c/crosvm/crosvm/+/4679609
[3] https://gitlab.freedesktop.org/digetx/qemu/-/commits/native-context-iris

Dmitry Osipenko (1):
  drm/virtio: Support fence-passing feature

 drivers/gpu/drm/virtio/virtgpu_drv.c    |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 11 ++-
 drivers/gpu/drm/virtio/virtgpu_fence.c  | 15 +++-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 11 ++-
 drivers/gpu/drm/virtio/virtgpu_kms.c    |  8 +-
 drivers/gpu/drm/virtio/virtgpu_submit.c | 99 ++++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_vq.c     |  7 +-
 include/uapi/drm/virtgpu_drm.h          |  3 +
 include/uapi/linux/virtio_gpu.h         | 11 ++-
 9 files changed, 152 insertions(+), 14 deletions(-)

-- 
2.41.0

