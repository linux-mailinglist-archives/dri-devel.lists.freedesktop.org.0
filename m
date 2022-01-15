Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 659B148F3C2
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jan 2022 02:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0624D10E317;
	Sat, 15 Jan 2022 01:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE31910E317
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jan 2022 01:06:55 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 a84-20020a251a57000000b0061171f19f8dso21559722yba.13
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 17:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=wG/PbGVmKjgf1eOd11ftVQTDqJEywAnSirRvk8YQoEA=;
 b=ra40WJSnTd+Sg9D3TIvHREEZJO5QmFxwXzwakhy95Pj15AdCn96Rg7F+gGkzzdoPHL
 /LCXltr47kWOGGC4J/j+jKdN7xu6RyW7gUeuH5vavWrndAu7BzKurEIyahiOS6sTnazd
 kjhutzh5GjtqfNnBjsMi1N1OKm+eTNmejUCgViGcOUkB/EFui5twnu1ZKaXi21WPA1C7
 hDv3dAKWpj1mixAwX1dUro0zgPo6Npzf7sXOSvaZIstusYMToZmeNzSzidVL3FAMroY6
 HrShrnaUArO3g2alaInh2tQWQ8dpEbE6FBLnde1xIXMV4W2bjw4NgeUFBmdKReIihG44
 DGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=wG/PbGVmKjgf1eOd11ftVQTDqJEywAnSirRvk8YQoEA=;
 b=VU5hi1xFtEseLSqvWCknCoAAZ1ldd/5YMf4SifQtn9cDMuEkfTAFAmSV3NgPEBggk+
 VwTGV19LhKMyNkduhSQAin6GsFJKLyBoHBr1N/xQe9TFY5PNwceWqoz92JHH3iSGh9T2
 z4Ha5NcKY37Rwz7R65htzNLmPUTEfMEYvEAG49aOq9kL5AdTYmysWXcWi30Ic28mOEjt
 qE3bqrcz1z8wd56gmt/wNrk/B0G2PD6i6P99v9S0FAZoRI9TIM78u/vpNmAGVdUYI97t
 wqUT6Ypcn8T4l7JjitNRAUUHlSpD2b0VcVRp1THAFztvs9Lc+YyakikGocarnWLZmmQd
 R1NQ==
X-Gm-Message-State: AOAM532O7VC4iXqXwx9a+4/D33LWAtVj50rnu3b3ruKLrlMpjR6vqmVg
 BLsh7/a46JAKdg/gzxDYzfsOoQ3e6GA=
X-Google-Smtp-Source: ABdhPJxSKZys321+eazB1Vl7zKy4uxTVihorRmwSE2zTWXqOqP6AasI2307MgWBIYRtdeCJygiVD+3F2pr8=
X-Received: from hridya.mtv.corp.google.com
 ([2620:15c:211:200:5860:362a:3112:9d85])
 (user=hridya job=sendgmr) by 2002:a25:874a:: with SMTP id
 e10mr15875623ybn.422.1642208814583; 
 Fri, 14 Jan 2022 17:06:54 -0800 (PST)
Date: Fri, 14 Jan 2022 17:05:58 -0800
Message-Id: <20220115010622.3185921-1-hridya@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
Subject: [RFC 0/6] Proposal for a GPU cgroup controller
From: Hridya Valsaraju <hridya@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <christian@brauner.io>, 
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, 
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <john.stultz@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Tejun Heo <tj@kernel.org>, 
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Dave Airlie <airlied@redhat.com>, Matthew Brost <matthew.brost@intel.com>, 
 Kenneth Graunke <kenneth@whitecape.org>, Matthew Auld <matthew.auld@intel.com>,
 Li Li <dualli@google.com>, Marco Ballesio <balejs@google.com>,
 Finn Behrens <me@kloenk.de>, 
 Hang Lu <hangl@codeaurora.org>, Wedson Almeida Filho <wedsonaf@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Vipin Sharma <vipinsh@google.com>, Chris Down <chris@chrisdown.name>, 
 Daniel Borkmann <daniel@iogearbox.net>, Vlastimil Babka <vbabka@suse.cz>,
 Arnd Bergmann <arnd@arndb.de>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Kenny.Ho@amd.com, daniels@collabora.com, tjmercier@google.com,
 kaleshsingh@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series revisits the proposal for a GPU cgroup controller to
track and limit memory allocations by various device/allocator
subsystems. The patch series also contains a simple prototype to
illustrate how Android intends to implement DMA-BUF allocator
attribution using the GPU cgroup controller. The prototype does not
include resource limit enforcements.

History of the GPU cgroup controller
====================================
The GPU/DRM cgroup controller came into being when a consensus[1]
was reached that the resources it tracked were unsuitable to be integrated
into memcg. Originally, the proposed controller was specific to the DRM
subsystem and was intended to track GEM buffers and GPU-specific resources[2].
In order to help establish a unified memory accounting model for all GPU and
all related subsystems, Daniel Vetter put forth a suggestion to move it out of
the DRM subsystem so that it can be used by other DMA-BUF exporters as well[3].
This RFC proposes an interface that does the same.

[1]: https://patchwork.kernel.org/project/dri-devel/cover/20190501140438.9506-1-brian.welty@intel.com/#22624705
[2]: https://lore.kernel.org/amd-gfx/20210126214626.16260-1-brian.welty@intel.com/
[3]: https://lore.kernel.org/amd-gfx/YCVOl8%2F87bqRSQei@phenom.ffwll.local/

Hridya Valsaraju (6):
  gpu: rfc: Proposal for a GPU cgroup controller
  cgroup: gpu: Add a cgroup controller for allocator attribution of GPU
    memory
  dmabuf: heaps: Use the GPU cgroup charge/uncharge APIs
  dma-buf: Add DMA-BUF exporter op to charge a DMA-BUF to a cgroup.
  dmabuf: system_heap: implement dma-buf op for GPU cgroup charge
    transfer
  android: binder: Add a buffer flag to relinquish ownership of fds

 Documentation/gpu/rfc/gpu-cgroup.rst | 192 +++++++++++++++++
 Documentation/gpu/rfc/index.rst      |   4 +
 drivers/android/binder.c             |  32 +++
 drivers/dma-buf/dma-heap.c           |  27 +++
 drivers/dma-buf/heaps/system_heap.c  |  68 ++++++
 include/linux/cgroup_gpu.h           | 120 +++++++++++
 include/linux/cgroup_subsys.h        |   4 +
 include/linux/dma-buf.h              |  18 ++
 include/linux/dma-heap.h             |  11 +
 include/uapi/linux/android/binder.h  |   1 +
 init/Kconfig                         |   7 +
 kernel/cgroup/Makefile               |   1 +
 kernel/cgroup/gpu.c                  | 305 +++++++++++++++++++++++++++
 13 files changed, 790 insertions(+)
 create mode 100644 Documentation/gpu/rfc/gpu-cgroup.rst
 create mode 100644 include/linux/cgroup_gpu.h
 create mode 100644 kernel/cgroup/gpu.c

-- 
2.34.1.703.g22d0c6ccf7-goog

