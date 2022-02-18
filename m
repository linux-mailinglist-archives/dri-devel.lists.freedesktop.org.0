Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1C14BC027
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 20:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264C310E170;
	Fri, 18 Feb 2022 19:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B933710E170
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 19:12:57 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id cm8so7462812edb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 11:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kFx5mVaEHwZpR1G+osdopjqc+OzJyT2vvM3+pSprCFk=;
 b=EQ+kstcsfvyoiVxpZH4DOveKWuo8ZLZzYUIop0Vlthf3r2DTADG1kDnjLZlmhEiEk+
 6G1pQYgdE0Nh9wv/F/mr614cojFdmQRp2bm+wGYz7pZOcacHQguC10UzY7EM+1ffc44f
 Wm1l5TaMSkrezOOuca+rkd439a22duxj7f/9y8nVcQJWPTcyz8zTDf/7iz5H+ApzRhTQ
 NbqGdRr/U/H9RUKkTlGKY86fsffbY3C0Y3yyKrxlpGI6ol/qaBZxmLnCbHD8+AclEyv0
 7/rPTsF6rq9ujxffbMlZt2i1zvBQfzL4TUlU49jq+ZYhmHm7rxl9MwWPEqQDFslXytJ8
 Gf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kFx5mVaEHwZpR1G+osdopjqc+OzJyT2vvM3+pSprCFk=;
 b=LdhqSJfBiqkdxO93hpeYwov/r6xncZacAaq5XepZZn8GOxH4DrnSoS9gzKTSx0+t8h
 7o6xnTcWVpdVTYgJIaG47LTi9Y31MzaITnQsEv2BG02Ydfs9CL9rPciya1PFT90OT6Wb
 4ydDd9sUuti2VQfw6DhOZJyrhWeD5UU6xq1b0Xa+AAh1p7INe7k6rsbaJTEjiaDf/geU
 CT7dkn3mUJyAaeERWBokOlLhYdKwtKpYd0XY6NbVCAnLsE+hh++WODFEWPn6nFsgb6d9
 xcYzZFFhT0GRwk1pBPG1bT2GDhteF9HKHGJoZgA9GcBnqOpaYxoS5ps09n9/AqgRHQhD
 wa6Q==
X-Gm-Message-State: AOAM532F01yKX5MqP9Bif3NcdUiNeT9beF8r9o3/WpDansm4jl9aR1Kj
 +kR7CLByhcYgGyRSCBjc4IB5wCJfQMEtCtBwIYg+5w==
X-Google-Smtp-Source: ABdhPJx3RFzhIbi2OeHNvwEo2c7s9U+9friyhOB0W2+wJsBDRyonLy4N3OFnI5CX3I+UAblAArNaJNvZqMIqINE8LuU=
X-Received: by 2002:aa7:c0d0:0:b0:410:d576:8808 with SMTP id
 j16-20020aa7c0d0000000b00410d5768808mr9831902edp.340.1645211575981; Fri, 18
 Feb 2022 11:12:55 -0800 (PST)
MIME-Version: 1.0
References: <20220211161831.3493782-1-tjmercier@google.com>
In-Reply-To: <20220211161831.3493782-1-tjmercier@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 18 Feb 2022 11:12:44 -0800
Message-ID: <CABdmKX3qO7UW-HGXMdZZdVi1P8FnKDh0H=TGT_ct=tHoAeVxbw@mail.gmail.com>
Subject: Re: [RFC v2 0/6] Proposal for a GPU cgroup controller
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>,
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, 
 Laura Abbott <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <john.stultz@linaro.org>, Tejun Heo <tj@kernel.org>, 
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>
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
Cc: linux-doc@vger.kernel.org, Kenny.Ho@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Kalesh Singh <kaleshsingh@google.com>, cgroups@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 8:18 AM T.J. Mercier <tjmercier@google.com> wrote:
>
> This patch series revisits the proposal for a GPU cgroup controller to
> track and limit memory allocations by various device/allocator
> subsystems. The patch series also contains a simple prototype to
> illustrate how Android intends to implement DMA-BUF allocator
> attribution using the GPU cgroup controller. The prototype does not
> include resource limit enforcements.
>
> Changelog:
>
> v2:
> See the previous revision of this change submitted by Hridya Valsaraju
> at: https://lore.kernel.org/all/20220115010622.3185921-1-hridya@google.co=
m/
>
> Move dma-buf cgroup charge transfer from a dma_buf_op defined by every
> heap to a single dma-buf function for all heaps per Daniel Vetter and
> Christian K=C3=B6nig. Pointers to struct gpucg and struct gpucg_device
> tracking the current associations were added to the dma_buf struct to
> achieve this.
>
> Fix incorrect Kconfig help section indentation per Randy Dunlap.
>
> History of the GPU cgroup controller
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The GPU/DRM cgroup controller came into being when a consensus[1]
> was reached that the resources it tracked were unsuitable to be integrate=
d
> into memcg. Originally, the proposed controller was specific to the DRM
> subsystem and was intended to track GEM buffers and GPU-specific
> resources[2]. In order to help establish a unified memory accounting mode=
l
> for all GPU and all related subsystems, Daniel Vetter put forth a
> suggestion to move it out of the DRM subsystem so that it can be used by
> other DMA-BUF exporters as well[3]. This RFC proposes an interface that
> does the same.
>
> [1]: https://patchwork.kernel.org/project/dri-devel/cover/20190501140438.=
9506-1-brian.welty@intel.com/#22624705
> [2]: https://lore.kernel.org/amd-gfx/20210126214626.16260-1-brian.welty@i=
ntel.com/
> [3]: https://lore.kernel.org/amd-gfx/YCVOl8%2F87bqRSQei@phenom.ffwll.loca=
l/
>
> T.J. Mercier (6):
>   gpu: rfc: Proposal for a GPU cgroup controller
>   cgroup: gpu: Add a cgroup controller for allocator attribution of GPU
>     memory
>   dmabuf: Use the GPU cgroup charge/uncharge APIs
>   dmabuf: heaps: export system_heap buffers with GPU cgroup charging
>   dmabuf: Add gpu cgroup charge transfer function
>   android: binder: Add a buffer flag to relinquish ownership of fds
>
>  Documentation/gpu/rfc/gpu-cgroup.rst | 195 +++++++++++++++++
>  Documentation/gpu/rfc/index.rst      |   4 +
>  drivers/android/binder.c             |  26 +++
>  drivers/dma-buf/dma-buf.c            | 100 +++++++++
>  drivers/dma-buf/dma-heap.c           |  27 +++
>  drivers/dma-buf/heaps/system_heap.c  |   3 +
>  include/linux/cgroup_gpu.h           | 127 +++++++++++
>  include/linux/cgroup_subsys.h        |   4 +
>  include/linux/dma-buf.h              |  22 +-
>  include/linux/dma-heap.h             |  11 +
>  include/uapi/linux/android/binder.h  |   1 +
>  init/Kconfig                         |   7 +
>  kernel/cgroup/Makefile               |   1 +
>  kernel/cgroup/gpu.c                  | 304 +++++++++++++++++++++++++++
>  14 files changed, 830 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/gpu/rfc/gpu-cgroup.rst
>  create mode 100644 include/linux/cgroup_gpu.h
>  create mode 100644 kernel/cgroup/gpu.c
>
> --
> 2.35.1.265.g69c8d7142f-goog
>

Gentle nudge to GPU maintainers to please provide their feedback on
this RFC. Thanks!
