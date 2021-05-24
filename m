Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E2938F4A6
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 23:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3EC6E957;
	Mon, 24 May 2021 21:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC42F6E954
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 21:00:04 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id g18so20189347pfr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 14:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FIQwcb+R3Fe4tk+8Me5Va022ROpmH6AgGLeYDpIii+c=;
 b=KvSNWrUUwrew785VZJzltgHAP3ZmVCbG8cjqtUZOu2Q0GwuNCnzdAJbPv5PaG5h881
 l0Q5L8niVRxofOpGJeMQNngvVXUhUEZ/wouXF9JudBPz3RdMGnfISkIixx6fSvitXzbK
 iGMnbDnQVbzcJnoaqdJKiJl5mEPeC/O+R7qWmKsaiS242+W2jrWOkaqaQhlOINwPCk36
 JylfdxKgh2TjT5maCVB35pPVu+IwNp3EYSmC2n9tdJvT2KMQMPWfvhCQMnSGPE+pmiJT
 rM4XX5oohJgBHTjsv54nWEy0p8iilkZhyOW+5Z9yIE3RpoTY1C2MzkYbJUotO61nkhSQ
 9kqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FIQwcb+R3Fe4tk+8Me5Va022ROpmH6AgGLeYDpIii+c=;
 b=qOuHOim1fljL7x/+9VRPxL7dMKWb2eprdkrUTqHyUL4ACH3hdCl74UZXiMv8zgOsE7
 hsYIGWDxE65mv6EOBy2BrsqzHncVe86YeT7Vhi068hHQONGfKVi/Nxdl4W7FjgIWzqyS
 P2HG5FPyMX4pXzGsubfveJEtOH09V53GUn/54Z/B5yKHKGuHlt+zndevzyulWR5XeHou
 AbLgz0R2EDzvrmznji/+qp36nz2p+BZ/4X0AaxyeIxbkD3B5F/yBNrnJqFN8k8HTEkDY
 6jzrIwK29TG84oNJEp6CkzpKCJi8K1NHPiwHsebwipElv9313I6uzKdGRJbLAtOsradO
 JOFw==
X-Gm-Message-State: AOAM531779+JkaL7aslDH3CfhHkQpoMzhmgOdeiVYvA87hh6WB0AjD9r
 oewR1Y7AKmpFFxxc0EiKnH5lJtAfnMn17Q==
X-Google-Smtp-Source: ABdhPJx6MNegbWI1+KqpaEZjdU/+/lHaoQSr5ysemEusdhnZohYDZLBaaIbL3bdV6+ivdkTksIaKog==
X-Received: by 2002:a63:d709:: with SMTP id d9mr15566431pgg.337.1621890003684; 
 Mon, 24 May 2021 14:00:03 -0700 (PDT)
Received: from omlet.com ([134.134.139.76])
 by smtp.gmail.com with ESMTPSA id c195sm12354958pfb.144.2021.05.24.14.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 14:00:03 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/6] dma-buf: Add an API for exporting sync files (v10)
Date: Mon, 24 May 2021 15:59:48 -0500
Message-Id: <20210524205954.872814-1-jason@jlekstrand.net>
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

Cc: Christian König <christian.koenig@amd.com>
Cc: Michel Dänzer <michel@daenzer.net>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Cc: Daniel Stone <daniels@collabora.com>
Cc: mesa-dev@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org
Test-with: 20210524205225.872316-1-jason@jlekstrand.net

Christian König (1):
  dma-buf: add dma_fence_array_for_each (v2)

Jason Ekstrand (5):
  dma-buf: Rename dma_resv helpers from _rcu to _unlocked
  dma-buf: add dma_resv_get_singleton_unlocked (v4)
  dma-buf: Add an API for exporting sync files (v9)
  RFC: dma-buf: Add an extra fence to dma_resv_get_singleton_unlocked
  RFC: dma-buf: Add an API for importing sync files (v6)

 drivers/dma-buf/dma-buf.c                     | 100 ++++++++++++-
 drivers/dma-buf/dma-fence-array.c             |  27 ++++
 drivers/dma-buf/dma-resv.c                    | 140 ++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   8 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   2 +-
 drivers/gpu/drm/drm_gem.c                     |   6 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c       |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |   4 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |   4 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   2 +-
 drivers/gpu/drm/i915/dma_resv_utils.c         |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_busy.c      |   2 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c      |  10 +-
 drivers/gpu/drm/i915/i915_request.c           |   4 +-
 drivers/gpu/drm/i915/i915_sw_fence.c          |   4 +-
 drivers/gpu/drm/msm/msm_gem.c                 |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c       |   2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |   2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |   2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c       |   2 +-
 drivers/gpu/drm/radeon/radeon_gem.c           |   6 +-
 drivers/gpu/drm/radeon/radeon_mn.c            |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  12 +-
 drivers/gpu/drm/vgem/vgem_fence.c             |   2 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c        |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |   2 +-
 include/linux/dma-fence-array.h               |  17 +++
 include/linux/dma-resv.h                      |  21 +--
 include/uapi/linux/dma-buf.h                  |  25 ++++
 39 files changed, 361 insertions(+), 79 deletions(-)

-- 
2.31.1

