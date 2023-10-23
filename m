Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B0F7D40AE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 22:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4298910E239;
	Mon, 23 Oct 2023 20:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF6A10E239
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 20:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698092226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pXbkmp90Ht3YmNZtihTIxAiHljHUVhjWIR13eg3J3rQ=;
 b=HJQbci3NvxT9c+D1ZYcbXkBKK4c1NRAwUcQZ/Tv7dftajR4JWWEIIitucfTXyjm6v7uHFM
 wO/Y2d2W9KLF+7odSqdQW4wUmKf0Fs+ZzjnO9FzJTg/L5ciIqX2uqfLNPoPgl2axOfpYDR
 wT64Yx382QeFgl98RViQ29xm6qceJOI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-e_shl_tsP2KsT6Iuf6CnjQ-1; Mon, 23 Oct 2023 16:17:05 -0400
X-MC-Unique: e_shl_tsP2KsT6Iuf6CnjQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-53e3120ae44so2573602a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 13:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698092223; x=1698697023;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pXbkmp90Ht3YmNZtihTIxAiHljHUVhjWIR13eg3J3rQ=;
 b=xJtkgNVqNLnb/jgqy8bdNEiyPaAQ21wtELeu1goWQJd+ifJMtsAGTRpm4Zl0AtmZ+c
 edVNYFYT1i4StD3d7Axrv9sCJ32PXI76wrYpJRbyc+gUsZ1hoH7vgjRCSKsjdSs/bvoL
 ugzzjpIx9tvGxxFTW18udnHHlOhvKpzXiqTardqSq8FDLROmEXaQOGUY4gGj0Vq40+WZ
 nY+9fPh8sER1h2hnILbFxDmUMLVyCAxRoLRHDybpJrXGupj4Rs62qe0GD1+UsIi/Uapy
 jq0XlqGXZbi63ATyj5U/wTYrO+Ydt3coA9e+bMiAWsQf4RCDNCxP4mhQOb3imYVt1KCR
 EpXA==
X-Gm-Message-State: AOJu0Ywz0HqU2JUGhHtNC9X7+jiYgrYgZ9dT+T8mJqqhhWB6Q+O0yc9T
 osn43lgljz5Ia4ml2OF3vMVKkPCntMzdHw22xoRtOlReqGx4RjHOvlvSb96q2uZlVtwbEwbGAys
 Gl7o05Dc3EdqlXLj64BwY7fEdpfv7KfXD4hEJ
X-Received: by 2002:a50:9fab:0:b0:53d:f4a2:5140 with SMTP id
 c40-20020a509fab000000b0053df4a25140mr6869148edf.33.1698092223711; 
 Mon, 23 Oct 2023 13:17:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbYenJR8HcVZz60pTEG64OAopaPu8nstbW/I+v8XUeZ5azRiemBnDLHFerTQ+m21QaMyAS+w==
X-Received: by 2002:a50:9fab:0:b0:53d:f4a2:5140 with SMTP id
 c40-20020a509fab000000b0053df4a25140mr6869131edf.33.1698092223407; 
 Mon, 23 Oct 2023 13:17:03 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a05640205c400b0053f9578ec97sm6745844edx.56.2023.10.23.13.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 13:17:02 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Subject: [PATCH drm-misc-next v7 0/7] [RFC] DRM GPUVM features
Date: Mon, 23 Oct 2023 22:16:46 +0200
Message-ID: <20231023201659.25332-1-dakr@redhat.com>
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

Changes in V7:
==============
  - add a patch converting WARN() macros to drm_WARN() variants
  - allow drivers to pass the number of fences to reserve and the drm_exec flags
    through struct drm_gpuvm_exec
  - rename 'root' GEM object to 'resv' GEM object
  - fix order of private_usage and extobj_usage in drm_gpuvm_resv_add_fence()
  - always set drm_gpuvm_bo::evicted accordingly
  - explicitly clear drm_gpuvm_bo from evict list after successful validation
  - group reference get() calls with pointer assignments
  - call drm_gem_object_put() after vm_bo_free() callback
  - make lockdep checks explicit for drm_gpuvm_bo_* functions
  - improve documentation of struct drm_gpuvm_bo
  - fix a few documentation typos and style issues
  - use BIT() instead of shift ops for enum drm_gpuvm_flags

Danilo Krummrich (7):
  drm/gpuvm: convert WARN() to drm_WARN() variants
  drm/gpuvm: add common dma-resv per struct drm_gpuvm
  drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
  drm/gpuvm: add an abstraction for a VM / BO combination
  drm/gpuvm: track/lock/validate external/evicted objects
  drm/nouveau: make use of the GPUVM's shared dma-resv
  drm/nouveau: use GPUVM common infrastructure

 drivers/gpu/drm/drm_gpuvm.c             | 1054 +++++++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_bo.c    |   15 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h    |    5 +
 drivers/gpu/drm/nouveau/nouveau_exec.c  |   57 +-
 drivers/gpu/drm/nouveau/nouveau_exec.h  |    4 -
 drivers/gpu/drm/nouveau/nouveau_gem.c   |   10 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c |    9 +-
 drivers/gpu/drm/nouveau/nouveau_sched.h |    7 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  189 ++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.h  |    1 -
 include/drm/drm_gem.h                   |   32 +-
 include/drm/drm_gpuvm.h                 |  492 ++++++++++-
 12 files changed, 1673 insertions(+), 202 deletions(-)


base-commit: f5b55f32ce4ba953c270b2e9c3f5d4cd6951b1a1
-- 
2.41.0

