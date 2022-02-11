Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B2D4B30EE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 23:40:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E1110EBE4;
	Fri, 11 Feb 2022 22:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10CA10EADD
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 16:18:43 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 a12-20020a056902056c00b0061dc0f2a94aso19721616ybt.6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 08:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=yZLJCK7E+jF9SMNP1+4R/zXh1+xClGhVRWVCTVgc4sc=;
 b=XMgJm0JnHLSh1BoAQZ0wKW1tqDREm4lLvo1GgrQbJjxOht9DuV2ml/M55v/YYYtwG0
 EiX+KPa11IXCkHxfjDJ+jqjtozMdXO8Np1xzeO0YafmBD2TU0JlinyFCVvLW1rCwcCdZ
 /67a9xCpHLDF2di7B26fW8eJ3s0rX9wB1nI24kFBk8sgAKm4tMtoVZMf/yF+8MHFUzmC
 QNdvprMkp7K7VXtvF+nMffFYcUR4zeTM22B4QkFSF1Qw8M748l+D1HGKINDyJL+qVrEZ
 7Hxo0m9piTC3QY0bjNEgwJt9fVXLWzIOFBU2gNAs/Btn+n7fz9/GKQAbXBpP767W1iWa
 t4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=yZLJCK7E+jF9SMNP1+4R/zXh1+xClGhVRWVCTVgc4sc=;
 b=2reBgVDjF6q74Hc6y76CVnXYUFqdhvPX0b6FujgtLwto/Qgqbd49rqvwO5x02zgIWA
 jnUHL9iVzZpByLEg2iERDum2x5ONXy1vSMcs3lWr1B4ZF93jC2N/1+wcjKGFK9UQ+wNO
 zWrett927TqhVBJby/Hlqf+dI3mWAQjQZ3UFPjK6fOvwHR4/95xIImHtwZwQW+bhaURO
 b9GysMiAZSWdEq7YTvWATZjelyUkr7JNbGEldSuFbMPHltykYdkvAdTYCnjYBbhfghRM
 lZK19yZk59pG6su1yjR+YnJkeymrtmEfEnS/fxNB4PbWRrla/bmiD+Ag+01MOOs7xXKU
 0URw==
X-Gm-Message-State: AOAM532psOSgtcoNznq6WEqceBvESBGIieaMtfL2SQYehpPKusaLdC1g
 bm3QAlw+WmBph7+2kdSQ6Q6nQ44upvTZWNw=
X-Google-Smtp-Source: ABdhPJzhF/L162IKZGA2v1vfeqRBtKk+kc26yO7jRh6AAqTqVZtjKGL2w7yvYf60mUisa/RM+m5bcl0vC/4rWsw=
X-Received: from tj2.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:187])
 (user=tjmercier job=sendgmr) by 2002:a5b:c6:: with SMTP id
 d6mr1955239ybp.273.1644596323025; Fri, 11 Feb 2022 08:18:43 -0800 (PST)
Date: Fri, 11 Feb 2022 16:18:23 +0000
Message-Id: <20220211161831.3493782-1-tjmercier@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [RFC v2 0/6] Proposal for a GPU cgroup controller
From: "T.J. Mercier" <tjmercier@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
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
 Johannes Weiner <hannes@cmpxchg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 11 Feb 2022 22:40:02 +0000
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
Cc: linux-doc@vger.kernel.org, Kenny.Ho@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kaleshsingh@google.com, cgroups@vger.kernel.org,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series revisits the proposal for a GPU cgroup controller to
track and limit memory allocations by various device/allocator
subsystems. The patch series also contains a simple prototype to
illustrate how Android intends to implement DMA-BUF allocator
attribution using the GPU cgroup controller. The prototype does not
include resource limit enforcements.

Changelog:

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

T.J. Mercier (6):
  gpu: rfc: Proposal for a GPU cgroup controller
  cgroup: gpu: Add a cgroup controller for allocator attribution of GPU
    memory
  dmabuf: Use the GPU cgroup charge/uncharge APIs
  dmabuf: heaps: export system_heap buffers with GPU cgroup charging
  dmabuf: Add gpu cgroup charge transfer function
  android: binder: Add a buffer flag to relinquish ownership of fds

 Documentation/gpu/rfc/gpu-cgroup.rst | 195 +++++++++++++++++
 Documentation/gpu/rfc/index.rst      |   4 +
 drivers/android/binder.c             |  26 +++
 drivers/dma-buf/dma-buf.c            | 100 +++++++++
 drivers/dma-buf/dma-heap.c           |  27 +++
 drivers/dma-buf/heaps/system_heap.c  |   3 +
 include/linux/cgroup_gpu.h           | 127 +++++++++++
 include/linux/cgroup_subsys.h        |   4 +
 include/linux/dma-buf.h              |  22 +-
 include/linux/dma-heap.h             |  11 +
 include/uapi/linux/android/binder.h  |   1 +
 init/Kconfig                         |   7 +
 kernel/cgroup/Makefile               |   1 +
 kernel/cgroup/gpu.c                  | 304 +++++++++++++++++++++++++++
 14 files changed, 830 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/gpu/rfc/gpu-cgroup.rst
 create mode 100644 include/linux/cgroup_gpu.h
 create mode 100644 kernel/cgroup/gpu.c

--=20
2.35.1.265.g69c8d7142f-goog

