Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B677BD12C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 01:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF88A10E092;
	Sun,  8 Oct 2023 23:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D2910E052
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Oct 2023 23:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696807940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ow/gplROD9H6T65YO7aNN3J+/eH6h1lHYqZ/YYWLM9A=;
 b=dTzRobMfp5OhA4uTCPZPz+BQQbNu25Yitvi2RXLkyOXOUX6BUE4m0xBFVzOudi0Chqq9gu
 wDph2saip85kXZpK33fwoHpGa9tdOk2BVjv1YAbPqaXSdeVfic66pZLFI1eml8maK095pt
 3UHllRO0K/jgu6+4aE9L5ateaWdTpZU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-V-PmV7m8N92qdJklT2bJgg-1; Sun, 08 Oct 2023 19:32:19 -0400
X-MC-Unique: V-PmV7m8N92qdJklT2bJgg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-99bcb13d8ddso68085266b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Oct 2023 16:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696807938; x=1697412738;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ow/gplROD9H6T65YO7aNN3J+/eH6h1lHYqZ/YYWLM9A=;
 b=xT9bZaot3KAXXjRn/QBmpuNhOOFZdGxR94T4Yu4GD+NzxXzOd4Kg/r89oe542R9DSU
 fmBaZxAOj7Ac2cEtgbGjh8ZS1Ki2ZP1SRykJ6nj27PEKPsTyFBXWsPtwVOpZuFimsQD7
 fmkB9BjvFn0h//aOim0tee0aDTd3N8+0OAGkX6E/l3UcCWVcgKn+FMn/hMKTv0bBGOJ/
 +0ny5aPKe24a0GslFcscC2EQLVOYE0mIP4F9OaXhbw9F9gflfXtGoWvtKkBHQGRw6Xok
 ShT6+d40OQRZSeLV/gUYw+ARv8VVhfnzIPSeuRDe/Eg7+uFabKcf/HILCWmCIkMun0sf
 c/Uw==
X-Gm-Message-State: AOJu0YyDAIK/ObSMeLS7JfAxSKak+jG01A8uWnG6wW6mXlvq92jcChDn
 +UCXtDrlXNuooyLQwVQciz4sva3pkEkiLTFJ8AzqR/XQQQaxYF74KGNDiHboKOAW4dP29lcL1kb
 M7Z4uVVlnEkknAhhx+zzqmJh16fW8
X-Received: by 2002:a17:906:cc47:b0:9a9:dfbe:ca88 with SMTP id
 mm7-20020a170906cc4700b009a9dfbeca88mr12309474ejb.55.1696807938322; 
 Sun, 08 Oct 2023 16:32:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNdGpeEsVIcwyi6ITiForOrXf2d0Q5e5rWU6KUlCoqC1w1+P604nHmrgwlZAxD1X8mAY3ceQ==
X-Received: by 2002:a17:906:cc47:b0:9a9:dfbe:ca88 with SMTP id
 mm7-20020a170906cc4700b009a9dfbeca88mr12309460ejb.55.1696807938038; 
 Sun, 08 Oct 2023 16:32:18 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 o23-20020a17090611d700b009887f4e0291sm6028454eja.27.2023.10.08.16.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 16:32:17 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Subject: [PATCH drm-misc-next v6 0/6] [RFC] DRM GPUVM features
Date: Mon,  9 Oct 2023 01:32:00 +0200
Message-ID: <20231008233212.13815-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Currently GPUVM offers common infrastructure to track GPU VA allocations
and mappings, generically connect GPU VA mappings to their backing
buffers and perform more complex mapping operations on the GPU VA space.

However, there are more design patterns commonly used by drivers, which
can potentially be generalized in order to make GPUVM represent the
basis of a VM implementation. In this context, this patch series aims at
generalizing the following elements.

1) Provide a common dma-resv for GEM objects not being used outside of
   this GPU-VM.

2) Provide tracking of external GEM objects (GEM objects which are
   shared with other GPU-VMs).

3) Provide functions to efficiently lock all GEM objects dma-resv the
   GPU-VM contains mappings of.

4) Provide tracking of evicted GEM objects the GPU-VM contains mappings
   of, such that validation of evicted GEM objects is accelerated.

5) Provide some convinience functions for common patterns.

The implementation introduces struct drm_gpuvm_bo, which serves as abstraction
combining a struct drm_gpuvm and struct drm_gem_object, similar to what
amdgpu does with struct amdgpu_bo_vm. While this adds a bit of complexity it
improves the efficiency of tracking external and evicted GEM objects.

This patch series is also available at [3].

[1] https://gitlab.freedesktop.org/nouvelles/kernel/-/commits/gpuvm-next

Changes in V2:
==============
  - rename 'drm_gpuva_manager' -> 'drm_gpuvm' which generally leads to more
    consistent naming
  - properly separate commits (introduce common dma-resv, drm_gpuvm_bo
    abstraction, etc.)
  - remove maple tree for tracking external objects, use a list drm_gpuvm_bos
    per drm_gpuvm instead
  - rework dma-resv locking helpers (Thomas)
  - add a locking helper for a given range of the VA space (Christian)
  - make the GPUVA manager buildable as module, rather than drm_exec
    builtin (Christian)

Changes in V3:
==============
  - rename missing function and files (Boris)
  - warn if vm_obj->obj != obj in drm_gpuva_link() (Boris)
  - don't expose drm_gpuvm_bo_destroy() (Boris)
  - unlink VM_BO from GEM in drm_gpuvm_bo_destroy() rather than
    drm_gpuva_unlink() and link within drm_gpuvm_bo_obtain() to keep
    drm_gpuvm_bo instances unique
  - add internal locking to external and evicted object lists to support drivers
    updating the VA space from within the fence signalling critical path (Boris)
  - unlink external objects and evicted objects from the GPUVM's list in
    drm_gpuvm_bo_destroy()
  - add more documentation and fix some kernel doc issues

Changes in V4:
==============
  - add a drm_gpuvm_resv() helper (Boris)
  - add a drm_gpuvm::<list_name>::local_list field (Boris)
  - remove drm_gpuvm_bo_get_unless_zero() helper (Boris)
  - fix missing NULL assignment in get_next_vm_bo_from_list() (Boris)
  - keep a drm_gem_object reference on potential vm_bo destroy (alternatively we
    could free the vm_bo and drop the vm_bo's drm_gem_object reference through
    async work)
  - introduce DRM_GPUVM_RESV_PROTECTED flag to indicate external locking through
    the corresponding dma-resv locks to optimize for drivers already holding
    them when needed; add the corresponding lock_assert_held() calls (Thomas)
  - make drm_gpuvm_bo_evict() per vm_bo and add a drm_gpuvm_bo_gem_evict()
    helper (Thomas)
  - pass a drm_gpuvm_bo in drm_gpuvm_ops::vm_bo_validate() (Thomas)
  - documentation fixes

Changes in V5:
==============
  - use a root drm_gem_object provided by the driver as a base for the VM's
    common dma-resv (Christian)
  - provide a helper to allocate a "dummy" root GEM object in case a driver
    specific root GEM object isn't available
  - add a dedicated patch for nouveau to make use of the GPUVM's shared dma-resv
  - improve documentation (Boris)
  - the following patches are removed from the series, since they already landed
    in drm-misc-next
    - f72c2db47080 ("drm/gpuvm: rename struct drm_gpuva_manager to struct drm_gpuvm")
    - fe7acaa727e1 ("drm/gpuvm: allow building as module")
    - 78f54469b871 ("drm/nouveau: uvmm: rename 'umgr' to 'base'")

Changes in V6:
==============
  - add drm_gpuvm_bo::evicted field protected by the drm_gem_object's dma-resv
    lock (Thomas)
    - additionally to the original proposal, always use drm_gpuvm_bo::evicted
      regardless of the used locking scheme and always keep it up to date
  - remove unneccesary get->put dance in drm_gpuva_unlink() (Thomas)
  - fix commit message wording (Thomas)
  - fix kernel doc warnings (kernel test robot)

Danilo Krummrich (6):
  drm/gpuvm: add common dma-resv per struct drm_gpuvm
  drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
  drm/gpuvm: add an abstraction for a VM / BO combination
  drm/gpuvm: track/lock/validate external/evicted objects
  drm/nouveau: make use of the GPUVM's shared dma-resv
  drm/nouveau: use GPUVM common infrastructure

 drivers/gpu/drm/drm_gpuvm.c             | 1038 +++++++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_bo.c    |   15 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h    |    5 +
 drivers/gpu/drm/nouveau/nouveau_exec.c  |   52 +-
 drivers/gpu/drm/nouveau/nouveau_exec.h  |    4 -
 drivers/gpu/drm/nouveau/nouveau_gem.c   |   10 +-
 drivers/gpu/drm/nouveau/nouveau_sched.h |    4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  183 ++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.h  |    1 -
 include/drm/drm_gem.h                   |   32 +-
 include/drm/drm_gpuvm.h                 |  471 +++++++++-
 11 files changed, 1633 insertions(+), 182 deletions(-)


base-commit: c1698c73f4aaef2fd406da1c0a92e1c8f7b7780c
-- 
2.41.0

