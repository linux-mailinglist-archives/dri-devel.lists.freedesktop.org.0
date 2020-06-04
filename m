Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EB51EDF25
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 10:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377A56E2BD;
	Thu,  4 Jun 2020 08:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF29D6E2B4
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 08:12:34 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p5so5014796wrw.9
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jun 2020 01:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wjYKgl1BXaEH8GQKLg8VxMrSCY/k0US00QhIRvYYPEA=;
 b=kyBPPaRamy/HmHh5JRj3lm6cSO9mrjCTe6nPVNXWZl7sLcwpFLZH03d7IXCaDQAbU9
 bWT+/fuJcxKCIvQeAz+7/CPD/m6BbEWAbJlfzQwnsSAN+AsbvA8QndXdYZFwQO0ucpeW
 +N5wby58BJfSZKsnQFztX13ktrN76Zl77KJZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wjYKgl1BXaEH8GQKLg8VxMrSCY/k0US00QhIRvYYPEA=;
 b=UpuIBQFld0aoUkTuICnOVBaftWzSuoc9ED1uLlcSt3tlCmVGkpzFm7vsmu5dhaobZB
 jRSwQOlDgh/e0rdN6uyg7jb2NmkhveD4q8Vlw6ednvC1Dpg6kA83eYcahVFKh+QIjZKb
 VyTZq3YYbVdPka+hUXUvVjbz3bIZLPTME/ZoFTLDgPo/cxnPP6q0WQBS0PQIqoVZ5dwd
 +DVA42WznGj2+Zhj0WrC8tSXOb/jPZ1pVH/+yFFpzi7TWWk7cTRCacxKpHPbQ4FKBGYP
 L0EsTkcNcrjyA4ZG9NhSPtxytVbts5UIaIwocoF+0Xag9njj3wyQGByn5koMdt+TEYnV
 m7kQ==
X-Gm-Message-State: AOAM5311/X5BuTdie6o9u8un7wFx/rOCskIm32CxNVg91AItg9U7AcRw
 zEXMBq93ODHoZlHz4IrAnPwN3U9tTFE=
X-Google-Smtp-Source: ABdhPJwck51N31CTXP+8yfy3JqBTy0FFs7zaLP/6w37Ug1NNs626RcdqKC1IFsIertUA5A07+TX4Qw==
X-Received: by 2002:adf:aa97:: with SMTP id h23mr3419463wrc.251.1591258352295; 
 Thu, 04 Jun 2020 01:12:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f11sm6873305wrj.2.2020.06.04.01.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 01:12:31 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/18] dma-fence lockdep annotations, round 2
Date: Thu,  4 Jun 2020 10:12:06 +0200
Message-Id: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Still very much early stuff, still very much looking for initial thoughts
and maybe some ideas how this could all be rolled out across drivers.

Full intro probably best from the RFC cover letter:

https://lore.kernel.org/amd-gfx/20200512085944.222637-1-daniel.vetter@ffwll.ch/

Changes since last time around:

- might_sleep annotation has landed already, I split that out as a
  stand-alone

- now with an mm patch to improve direct reclaim annotations for mmu
  notifiers. This allows us to very easily catch issues in that area, no
  more need for exaustive testing and luck to make sure we're not leaving
  a GFP_NOFS or GPF_NOIO around which should be a GFP_ATOMIC

- kerneldoc that explains all the reasoning behind the annotations and
  priming, hopefully

Driver patches still largely just meant as examples to illustrate usage,
but from various irc chats I think discussing them is really useful to
gain clarity on the exact places the annotations should be put.

Cheers, Daniel

Daniel Vetter (18):
  mm: Track mmu notifiers in fs_reclaim_acquire/release
  dma-buf: minor doc touch-ups
  dma-fence: basic lockdep annotations
  dma-fence: prime lockdep annotations
  drm/vkms: Annotate vblank timer
  drm/vblank: Annotate with dma-fence signalling section
  drm/atomic-helper: Add dma-fence annotations
  drm/amdgpu: add dma-fence annotations to atomic commit path
  drm/scheduler: use dma-fence annotations in main thread
  drm/amdgpu: use dma-fence annotations in cs_submit()
  drm/amdgpu: s/GFP_KERNEL/GFP_ATOMIC in scheduler code
  drm/amdgpu: DC also loves to allocate stuff where it shouldn't
  drm/amdgpu/dc: Stop dma_resv_lock inversion in commit_tail
  drm/scheduler: use dma-fence annotations in tdr work
  drm/amdgpu: use dma-fence annotations for gpu reset code
  Revert "drm/amdgpu: add fbdev suspend/resume on gpu reset"
  drm/amdgpu: gpu recovery does full modesets
  drm/i915: Annotate dma_fence_work

 Documentation/driver-api/dma-buf.rst          |  18 +-
 drivers/dma-buf/dma-buf.c                     |   6 +-
 drivers/dma-buf/dma-fence.c                   | 202 ++++++++++++++++++
 drivers/dma-buf/dma-resv.c                    |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c      |   2 +-
 drivers/gpu/drm/amd/amdgpu/atom.c             |   2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  18 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c      |   4 +-
 drivers/gpu/drm/drm_atomic_helper.c           |  16 ++
 drivers/gpu/drm/drm_vblank.c                  |   8 +-
 drivers/gpu/drm/i915/i915_sw_fence_work.c     |   3 +
 drivers/gpu/drm/scheduler/sched_main.c        |  11 +
 drivers/gpu/drm/vkms/vkms_crtc.c              |   8 +-
 include/linux/dma-fence.h                     |  13 ++
 mm/mmu_notifier.c                             |   7 -
 mm/page_alloc.c                               |  23 +-
 20 files changed, 341 insertions(+), 35 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
