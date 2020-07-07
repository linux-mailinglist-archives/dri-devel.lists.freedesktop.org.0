Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2812178A6
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 22:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B736E248;
	Tue,  7 Jul 2020 20:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EDE6E123
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 20:12:42 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r12so46525762wrj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 13:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uPjc1QiDkpaQJ6gj5QOnEN0IMsVli0wQ5gnB2ck1gMU=;
 b=EQACmdsr4BPtlAJqkzr9R5XdvYuqjZDGUJpcqynaR9dnUXl02uFKttw6FBlNs0dXdM
 F1WA5lhOXW8PWkJRtyNj9enm/04MG/SPTWbLk/B/DWmB8NUidBzFoxhIh+yWwjOicU8d
 l0HLk/Ns1FQJNcp2mnNmbINTdJZngyt/vHHzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uPjc1QiDkpaQJ6gj5QOnEN0IMsVli0wQ5gnB2ck1gMU=;
 b=V7DeYD3pwhLnJcpaYpIRZDbE0US4qsILziG32wrsI0F+1D8inScwVERbn5R0SN4Jud
 xwteSD2K8WL0nKoxhuUhNq32A5iiXKN2s/cNqG73JJnJD3FzZaX5v0Bt33HVr2o72w/s
 nkM7u1IW8FV6neXvasRv/H6GiFIYQhAcKxq9VGJVG4XEZyATqaKXkg3QD65m8QsFz9d9
 sgsESkwXYhuOCCRVQJmw5NEog96uMjMB+jjrBZ3sHBlIf7sDDVQ2DsXQYwKIkXXVz1BY
 60yp8k9Wt3Ml9WvpPzelsQKG2R+NF84Q7KHqVvVvDqEminBsIR5ZBKoyK4lBOBoqX8uC
 WfcA==
X-Gm-Message-State: AOAM532Gww5fBIUwJLIDWQO9TzzskqNbW8U7VdcWDtQebL3x0+n1IDTU
 v0Js+tOO62fAHQUHgLSb7zh9Xyd2wzM=
X-Google-Smtp-Source: ABdhPJzP+3waGhBq+3r68iTg+28anENV8Lyik0jqTsjw13d4CVIDG3/NEfzcHUaOmSNhle7ELZ4b7A==
X-Received: by 2002:adf:8b5a:: with SMTP id v26mr54730638wra.165.1594152760781; 
 Tue, 07 Jul 2020 13:12:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q7sm2515262wra.56.2020.07.07.13.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 13:12:40 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/25] dma-fence annotations, round 3
Date: Tue,  7 Jul 2020 22:12:04 +0200
Message-Id: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Bunch of changes that might matter:

- Clarification that dma_fences are for drivers/gpu, requested by Jason
  Gunthorpe.

- New patch to list all the past discussions around
  indefinite/future/whatever fences, and why this (sadly) still just plain
  doesn't work. Came up again when discussing this stuff, I'd like to just
  be able to point at some doc going forward.

- I rolled dma-fence critical section annotations to (almost, vc4, nouveau
  and i915 have a bit too much custom commit functions) atomic kms
  drivers. Really looking for some serious testing with these, aside from
  the amdgpu atomic commit issues we've also found some problems in vmwgfx
  commit code. All real issues, and noted in the patches.

After the modeset stuff there's still the drm/scheduler annotations.
Testing with other drivers than amdgpu using the drm scheduler would be
very much welcome.

Then the usual pile of amdgpu hacks that I used for developing this. That
stuff isn't for merging, I'm hoping amd is working on proper patches for
these things.

Testing for this series means, especially for the atomic kms drivers:
- build with CONFIG_PROVE_LOCKING
- run the kms_atomic igt, that one actually uses atomic in&out fences -
  withotu these it's only half the fun
- run anything else you feel like which might use fences, like your
  rendering driver. You do have testcases for that right :-)

The mmu notifier annotation integration landed in -mm for a few days
meanwhile, but I busted it pretty bad. That one needs more baking, I'm
trying to figure out how to write unit tests for these annotations so I'm
not blowing them up all the time.

Also I think it'd be nice if we could start merging some of the earlier
stuff maybe, that doest start to feel solid (at least to me).

Review, commenst and testing on drivers as per above very much welcome.

Thanks, Daniel

Daniel Vetter (25):
  dma-fence: basic lockdep annotations
  dma-fence: prime lockdep annotations
  dma-buf.rst: Document why idenfinite fences are a bad idea
  drm/vkms: Annotate vblank timer
  drm/vblank: Annotate with dma-fence signalling section
  drm/amdgpu: add dma-fence annotations to atomic commit path
  drm/komdea: Annotate dma-fence critical section in commit path
  drm/malidp: Annotate dma-fence critical section in commit path
  drm/atmel: Use drm_atomic_helper_commit
  drm/imx: Annotate dma-fence critical section in commit path
  drm/omapdrm: Annotate dma-fence critical section in commit path
  drm/rcar-du: Annotate dma-fence critical section in commit path
  drm/tegra: Annotate dma-fence critical section in commit path
  drm/tidss: Annotate dma-fence critical section in commit path
  drm/tilcdc: Use standard drm_atomic_helper_commit
  drm/atomic-helper: Add dma-fence annotations
  drm/scheduler: use dma-fence annotations in main thread
  drm/amdgpu: use dma-fence annotations in cs_submit()
  drm/amdgpu: s/GFP_KERNEL/GFP_ATOMIC in scheduler code
  drm/amdgpu: DC also loves to allocate stuff where it shouldn't
  drm/amdgpu/dc: Stop dma_resv_lock inversion in commit_tail
  drm/scheduler: use dma-fence annotations in tdr work
  drm/amdgpu: use dma-fence annotations for gpu reset code
  Revert "drm/amdgpu: add fbdev suspend/resume on gpu reset"
  drm/amdgpu: gpu recovery does full modesets

 Documentation/driver-api/dma-buf.rst          |  82 +++++++
 drivers/dma-buf/dma-fence.c                   | 207 ++++++++++++++++++
 drivers/dma-buf/dma-resv.c                    |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c      |   2 +-
 drivers/gpu/drm/amd/amdgpu/atom.c             |   2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  18 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c      |   4 +-
 .../gpu/drm/arm/display/komeda/komeda_kms.c   |   3 +
 drivers/gpu/drm/arm/malidp_drv.c              |   3 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  96 +-------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h  |   4 -
 drivers/gpu/drm/drm_atomic_helper.c           |  16 ++
 drivers/gpu/drm/drm_vblank.c                  |   8 +-
 drivers/gpu/drm/imx/imx-drm-core.c            |   2 +
 drivers/gpu/drm/omapdrm/omap_drv.c            |   9 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |   2 +
 drivers/gpu/drm/scheduler/sched_main.c        |  11 +
 drivers/gpu/drm/tegra/drm.c                   |   3 +
 drivers/gpu/drm/tidss/tidss_kms.c             |   4 +
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  47 +---
 drivers/gpu/drm/virtio/virtgpu_display.c      |  20 --
 drivers/gpu/drm/vkms/vkms_crtc.c              |   8 +-
 include/linux/dma-fence.h                     |  13 ++
 27 files changed, 421 insertions(+), 182 deletions(-)

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
