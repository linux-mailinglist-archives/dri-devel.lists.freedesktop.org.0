Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E44390B23
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 23:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D866EB43;
	Tue, 25 May 2021 21:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC3B891DD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 21:18:00 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id p39so8259356pfw.8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 14:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nILHNGmu8Y21SdmE75vh1WZ+fVz99JwGV88AKu0E3kE=;
 b=TEKULZ8ZBVA/WK1SKJWgARRHvcJKyO+aZ6kPxRrixdM5ivQv+Hywzf3/5uj8tO4nWz
 evLwJRettbGAIPqrOWUwPYmYKzkB9vGXD6rIyMwMBuczRck/bmIIuuaD+qzOhnMT0ujq
 72b+eNnNNrsqR/SkP2+u3nW8X4mqKF30I6nP6cbnnGwn56GhC4GJQ0Em8jGGsO3vwhIQ
 2+cE90tc0LMyBpDsD7Cq3Y32BcWKfEvn5cjt//DpGaVanoSb7M0K8GkMO5KZkglhIqLe
 YOeNUY8gcxYdDd/z4SCbI8g+e1vlMMbcdHup9XdSpVWiOVePRcvXuSSc3bqXxYqcWorx
 iWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nILHNGmu8Y21SdmE75vh1WZ+fVz99JwGV88AKu0E3kE=;
 b=g86Aq12vf1NpVbVvbzM8+akd75gl76MqgUK+7iFxvh3QL/ZNThewZ+k4Yr30XvNyy/
 gxVuSXJP7qN2qSCQdXXPEmACwXCzRRucU5dJzj8LkmslKWlwDflkBnbrCMBNRFQmNRxK
 /ZdAW/PHUjjoF/nu+NPUgTU0So82CxEcn7OHrrwuv1rs8XV5gyaOyHZW6KwjrNd2ON6e
 3EMJmi2dwP+eNvmE5F1SKjSalivTQxNSDgQT5JahK1inWGUhrhBHeA+QEY+J6QTBp3+j
 92kTDpEhlQ2JYAHs1iHpK4RyAyloAFr1EbjTy5dBEeXUfQJ5RtzWNOgCZJEfkxXTW0Ji
 leGA==
X-Gm-Message-State: AOAM530HIWYVqKIP6nSB2FR/9CwMF4NlMwLvKqS74iSRWsO3rrOlsiAy
 QGO8/vkzx/B+0xqhvvp0D+kPXo4BUUzxGg==
X-Google-Smtp-Source: ABdhPJz3o1UPwkkAoIzPLBOdLlKVlhyYUBimCVpSoTN7gRADDfr7TVR0aXIkBp7wAop/N9GHaUiUbg==
X-Received: by 2002:a63:4a4e:: with SMTP id j14mr20589079pgl.221.1621977479790; 
 Tue, 25 May 2021 14:17:59 -0700 (PDT)
Received: from omlet.lan ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id e186sm14342278pfa.145.2021.05.25.14.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 14:17:59 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/7] dma-buf: Add an API for exporting sync files (v11)
Date: Tue, 25 May 2021 16:17:46 -0500
Message-Id: <20210525211753.1086069-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
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
Cc: Daniel Stone <daniels@collabora.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 wayland-devel@lists.freedesktop.org, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>, mesa-dev@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Modern userspace APIs like Vulkan are built on an explicit
synchronization model.  This doesn't always play nicely with the
implicit synchronization used in the kernel and assumed by X11 and
Wayland.  The client -> compositor half of the synchronization isn't too
bad, at least on intel, because we can control whether or not i915
synchronizes on the buffer and whether or not it's considered written.

The harder part is the compositor -> client synchronization when we get
the buffer back from the compositor.  We're required to be able to
provide the client with a VkSemaphore and VkFence representing the point
in time where the window system (compositor and/or display) finished
using the buffer.  With current APIs, it's very hard to do this in such
a way that we don't get confused by the Vulkan driver's access of the
buffer.  In particular, once we tell the kernel that we're rendering to
the buffer again, any CPU waits on the buffer or GPU dependencies will
wait on some of the client rendering and not just the compositor.

This new IOCTL solves this problem by allowing us to get a snapshot of
the implicit synchronization state of a given dma-buf in the form of a
sync file.  It's effectively the same as a poll() or I915_GEM_WAIT only,
instead of CPU waiting directly, it encapsulates the wait operation, at
the current moment in time, in a sync_file so we can check/wait on it
later.  As long as the Vulkan driver does the sync_file export from the
dma-buf before we re-introduce it for rendering, it will only contain
fences from the compositor or display.  This allows to accurately turn
it into a VkFence or VkSemaphore without any over- synchronization.

This patch series actually contains two new ioctls.  There is the export
one mentioned above as well as an RFC for an import ioctl which provides
the other half.  The intention is to land the export ioctl since it seems
like there's no real disagreement on that one.  The import ioctl, however,
has a lot of debate around it so it's intended to be RFC-only for now.

Mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037
IGT tests: https://patchwork.freedesktop.org/series/90490/

v10 (Jason Ekstrand, Daniel Vetter):
 - Add reviews/acks
 - Add a patch to rename _rcu to _unlocked
 - Split things better so import is clearly RFC status

v11 (Daniel Vetter):
 - Add more CCs to try and get maintainers
 - Add a patch to document DMA_BUF_IOCTL_SYNC
 - Generally better docs
 - Use separate structs for import/export (easier to document)
 - Fix an issue in the import patch

Cc: Christian König <christian.koenig@amd.com>
Cc: Michel Dänzer <michel@daenzer.net>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Cc: Daniel Stone <daniels@collabora.com>
Cc: mesa-dev@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org
Test-with: 20210524205225.872316-1-jason@jlekstrand.net

Christian König (1):
  dma-buf: Add dma_fence_array_for_each (v2)

Jason Ekstrand (6):
  dma-buf: Rename dma_resv helpers from _rcu to _unlocked (v2)
  dma-buf: Add dma_resv_get_singleton_unlocked (v5)
  dma-buf: Document DMA_BUF_IOCTL_SYNC
  dma-buf: Add an API for exporting sync files (v11)
  RFC: dma-buf: Add an extra fence to dma_resv_get_singleton_unlocked
  RFC: dma-buf: Add an API for importing sync files (v7)

 Documentation/driver-api/dma-buf.rst          |   8 +
 drivers/dma-buf/dma-buf.c                     | 107 +++++++++++++-
 drivers/dma-buf/dma-fence-array.c             |  27 ++++
 drivers/dma-buf/dma-resv.c                    | 139 ++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c       |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c        |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  14 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   6 +-
 drivers/gpu/drm/drm_gem.c                     |  10 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c       |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |   7 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |   8 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   2 +-
 drivers/gpu/drm/i915/dma_resv_utils.c         |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_busy.c      |   2 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c      |  10 +-
 drivers/gpu/drm/i915/i915_request.c           |   6 +-
 drivers/gpu/drm/i915/i915_sw_fence.c          |   4 +-
 drivers/gpu/drm/msm/msm_gem.c                 |   3 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c       |   2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |   4 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |   4 +-
 drivers/gpu/drm/panfrost/panfrost_job.c       |   2 +-
 drivers/gpu/drm/radeon/radeon_gem.c           |   6 +-
 drivers/gpu/drm/radeon/radeon_mn.c            |   4 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  18 +--
 drivers/gpu/drm/vgem/vgem_fence.c             |   4 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c        |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |   2 +-
 include/linux/dma-fence-array.h               |  17 +++
 include/linux/dma-resv.h                      |  21 +--
 include/uapi/linux/dma-buf.h                  |  89 ++++++++++-
 40 files changed, 465 insertions(+), 111 deletions(-)

-- 
2.31.1

