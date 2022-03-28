Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 608F14E8CBE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 06:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248F310E13A;
	Mon, 28 Mar 2022 04:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0447910E578
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 03:59:57 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 w1-20020a5b08c1000000b00633be107f28so9988764ybq.4
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 20:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=ZanSM+z+bqiT+dazTvxIhzoTPKfBDbdIJDmpkh0ngiA=;
 b=dEZSetUwhJ77JER9uOFHsQsp76JzF2DjT1q6+REMveb9Wt4BrGDGIQgD1zzZM9bma+
 yhEZCho/DguXCN/LWIpS6/sXTLVs/7I8V57LnPEuNyRfMseJ+ScdFrLfEpJoGDWtMIFM
 t64Dd1vWRIhCANW1YNotTj71VdF86eU/Z1yZ/2P1/oZx3uAbxFDxrqLAVLQm8PT6wR0S
 qEnNzRfOZYWdnMNSE8GFnj9hFuliT0+m6mkGHNaGsEGbIMS5RBIfRao1fm6MCxklAbdl
 N8IuezzihPA3MdxNEuigRrXDRU77mTQDN2Wi23Fw13t4QVAYQLDOIAduNv28SyaFtkAo
 +W/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=ZanSM+z+bqiT+dazTvxIhzoTPKfBDbdIJDmpkh0ngiA=;
 b=kNEVS9jFPBbl6nCgAPiI9z+SprDR91AIJDUEdp3ICE8FWOVPKxOteE8Gm4s5iGq7Hr
 MXu5vWZuvenumqNUwXvEcYUh7GB1aiTgtdeU7dOGxGDUDGOFJe80Qa3JRjCB53y1IDAv
 PSOn/9JnpZHyKqyHCaXWcFQXRxIrnBXL6vcexaXVPl/j+T7LJxdUTki/EulXOk3rdheX
 4xhknirpX7ncO5VgVDEhr2XiOBJPtfo/Tw9bIFXIjEI7CFCFp54KgiyQVCP1PALOH7iQ
 hxzDyPYz20pSe4iccfqVXYoyXuRPBqDvjiotFzaz8vKP6NWofADIhBfDCj3zV0pw00nR
 Tm+A==
X-Gm-Message-State: AOAM532o+MGNc/xX8nj7CfZSZ7K+M/4L0Wvb+NdP1ss9nOUaWJ4niIBm
 muEP/LcpJwx/085oQLSYEXCYP/jjf9JKMfY=
X-Google-Smtp-Source: ABdhPJxDNziGYjzb/ZRm1pevbyvVdw8eQjc7VwyCozk0n3Hczh8k36e8/hVih9NxH0h+d3gtUEehLBH2IOPtLgg=
X-Received: from tj2.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:187])
 (user=tjmercier job=sendgmr) by 2002:a25:25c3:0:b0:633:8079:1768 with SMTP id
 l186-20020a2525c3000000b0063380791768mr21066931ybl.488.1648439997054; Sun, 27
 Mar 2022 20:59:57 -0700 (PDT)
Date: Mon, 28 Mar 2022 03:59:39 +0000
Message-Id: <20220328035951.1817417-1-tjmercier@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
Subject: [RFC v4 0/8] Proposal for a GPU cgroup controller
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>,
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, 
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <john.stultz@linaro.org>, 
 Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-doc@vger.kernel.org, Kenny.Ho@amd.com, kaleshsingh@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, mkoutny@suse.com,
 linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org,
 cgroups@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series revisits the proposal for a GPU cgroup controller to
track and limit memory allocations by various device/allocator
subsystems. The patch series also contains a simple prototype to
illustrate how Android intends to implement DMA-BUF allocator
attribution using the GPU cgroup controller. The prototype does not
include resource limit enforcements.

Changelog:
v4:
Skip test if not run as root per Shuah Khan

Add better test logging for abnormal child termination per Shuah Khan

Adjust ordering of charge/uncharge during transfer to avoid potentially
hitting cgroup limit per Michal Koutn=C3=BD

Adjust gpucg_try_charge critical section for charge transfer functionality

Fix uninitialized return code error for dmabuf_try_charge error case

v3:
Remove Upstreaming Plan from gpu-cgroup.rst per John Stultz

Use more common dual author commit message format per John Stultz

Remove android from binder changes title per Todd Kjos

Add a kselftest for this new behavior per Greg Kroah-Hartman

Include details on behavior for all combinations of kernel/userspace
versions in changelog (thanks Suren Baghdasaryan) per Greg Kroah-Hartman.

Fix pid and uid types in binder UAPI header

v2:
See the previous revision of this change submitted by Hridya Valsaraju
at: https://lore.kernel.org/all/20220115010622.3185921-1-hridya@google.com/

Move dma-buf cgroup charge transfer from a dma_buf_op defined by every
heap to a single dma-buf function for all heaps per Daniel Vetter and
Christian K=C3=B6nig. Pointers to struct gpucg and struct gpucg_device
tracking the current associations were added to the dma_buf struct to
achieve this.

Fix incorrect Kconfig help section indentation per Randy Dunlap.

History of the GPU cgroup controller
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The GPU/DRM cgroup controller came into being when a consensus[1]
was reached that the resources it tracked were unsuitable to be integrated
into memcg. Originally, the proposed controller was specific to the DRM
subsystem and was intended to track GEM buffers and GPU-specific
resources[2]. In order to help establish a unified memory accounting model
for all GPU and all related subsystems, Daniel Vetter put forth a
suggestion to move it out of the DRM subsystem so that it can be used by
other DMA-BUF exporters as well[3]. This RFC proposes an interface that
does the same.

[1]: https://patchwork.kernel.org/project/dri-devel/cover/20190501140438.95=
06-1-brian.welty@intel.com/#22624705
[2]: https://lore.kernel.org/amd-gfx/20210126214626.16260-1-brian.welty@int=
el.com/
[3]: https://lore.kernel.org/amd-gfx/YCVOl8%2F87bqRSQei@phenom.ffwll.local/

Hridya Valsaraju (5):
  gpu: rfc: Proposal for a GPU cgroup controller
  cgroup: gpu: Add a cgroup controller for allocator attribution of GPU
    memory
  dmabuf: heaps: export system_heap buffers with GPU cgroup charging
  dmabuf: Add gpu cgroup charge transfer function
  binder: Add a buffer flag to relinquish ownership of fds

T.J. Mercier (3):
  dmabuf: Use the GPU cgroup charge/uncharge APIs
  binder: use __kernel_pid_t and __kernel_uid_t for userspace
  selftests: Add binder cgroup gpu memory transfer test

 Documentation/gpu/rfc/gpu-cgroup.rst          | 183 +++++++
 Documentation/gpu/rfc/index.rst               |   4 +
 drivers/android/binder.c                      |  26 +
 drivers/dma-buf/dma-buf.c                     | 107 ++++
 drivers/dma-buf/dma-heap.c                    |  27 +
 drivers/dma-buf/heaps/system_heap.c           |   3 +
 include/linux/cgroup_gpu.h                    | 139 +++++
 include/linux/cgroup_subsys.h                 |   4 +
 include/linux/dma-buf.h                       |  22 +-
 include/linux/dma-heap.h                      |  11 +
 include/uapi/linux/android/binder.h           |   5 +-
 init/Kconfig                                  |   7 +
 kernel/cgroup/Makefile                        |   1 +
 kernel/cgroup/gpu.c                           | 362 +++++++++++++
 .../selftests/drivers/android/binder/Makefile |   8 +
 .../drivers/android/binder/binder_util.c      | 254 +++++++++
 .../drivers/android/binder/binder_util.h      |  32 ++
 .../selftests/drivers/android/binder/config   |   4 +
 .../binder/test_dmabuf_cgroup_transfer.c      | 484 ++++++++++++++++++
 19 files changed, 1679 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/gpu/rfc/gpu-cgroup.rst
 create mode 100644 include/linux/cgroup_gpu.h
 create mode 100644 kernel/cgroup/gpu.c
 create mode 100644 tools/testing/selftests/drivers/android/binder/Makefile
 create mode 100644 tools/testing/selftests/drivers/android/binder/binder_u=
til.c
 create mode 100644 tools/testing/selftests/drivers/android/binder/binder_u=
til.h
 create mode 100644 tools/testing/selftests/drivers/android/binder/config
 create mode 100644 tools/testing/selftests/drivers/android/binder/test_dma=
buf_cgroup_transfer.c

--=20
2.35.1.1021.g381101b075-goog

