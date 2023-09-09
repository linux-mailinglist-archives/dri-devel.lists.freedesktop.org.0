Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B0B79994C
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 17:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C9110E14F;
	Sat,  9 Sep 2023 15:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FA510E1B3
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 15:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694273492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wMX9epdJw7VIRhjP4Vcbo/msSPJpdqa4n0m167hBtu4=;
 b=MT29Q969kG4kcTreG+D5/OAPAP9nU9t7GXIdqh6mEU5zefuX7Ppax/e+VU2MckB6UTs84b
 eps9ELEznLBHOZp8Q3ziUxDPYU6BQ1pdLe6wieVksHQP3+enmza7tA0CdgVceAXYpX/v89
 uhTJSoFDKN5vq13RU9JnfOWFhyMkGAg=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-Bio10BJGNLaedpHaoJEn0g-1; Sat, 09 Sep 2023 11:31:30 -0400
X-MC-Unique: Bio10BJGNLaedpHaoJEn0g-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5009f4c933cso3283103e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Sep 2023 08:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694273489; x=1694878289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wMX9epdJw7VIRhjP4Vcbo/msSPJpdqa4n0m167hBtu4=;
 b=dsU/SHkLNdtb5l1g9nE2EXi4M00ifhW2mZZ+sg/uHp23FoS41DPCNDYmP5W+dbPz23
 50RNJiHDxx+Qekga6daMO+6rwtc9HVZEBD7UDzUgkqqawLEj4/kkMCiirAayltRi1BoP
 mq3VMsYACYAgYTFisBHWx9gHwPHsz1ZwQ9FWR7K3l5w+kwK2A4RZRRB+OYTgEULG5IrR
 vE0x8yljG+ShHvGM5k6OeeqZhsa52ZtM7pq1m8FlKFO/x9RDSZgH5C+mFzPx+mb46xSR
 IFA3aBcoTAuRSLWaTl6p0EmFki6627T8OoR15GNaJ8zITOvu1e116pdm0pI458zvsq2y
 flmg==
X-Gm-Message-State: AOJu0YwaPZ4LMq48YfiVQsXfXKav83BFUIK2HshzAvPgWNT08GjkMCkL
 iJUIsF4Uu+gfqvBC0AquPtB1oOBtf5l00T4lnr2QmGTtfguMZJDfqRF4EFi/hUsMp1ntt+uENg1
 IF7W2VDjxZS+zpgclDBj7DpFApGGX
X-Received: by 2002:a05:6512:32d0:b0:4fb:7675:1ff9 with SMTP id
 f16-20020a05651232d000b004fb76751ff9mr5021896lfg.9.1694273489418; 
 Sat, 09 Sep 2023 08:31:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD8rj+ysUKYXo1uAFPjqTXlP7TgWM6wuXtEKMVFchDL6HVoh1wkUrv+c5B0BwdlB/dM0cXqQ==
X-Received: by 2002:a05:6512:32d0:b0:4fb:7675:1ff9 with SMTP id
 f16-20020a05651232d000b004fb76751ff9mr5021888lfg.9.1694273489092; 
 Sat, 09 Sep 2023 08:31:29 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a17090646cc00b0099caf5bed64sm2487563ejs.57.2023.09.09.08.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 08:31:28 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Subject: [PATCH drm-misc-next v3 0/7] [RFC] DRM GPUVA Manager GPU-VM features
Date: Sat,  9 Sep 2023 17:31:07 +0200
Message-ID: <20230909153125.30032-1-dakr@redhat.com>
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

So far the DRM GPUVA manager offers common infrastructure to track GPU VA
allocations and mappings, generically connect GPU VA mappings to their
backing buffers and perform more complex mapping operations on the GPU VA
space.

However, there are more design patterns commonly used by drivers, which
can potentially be generalized in order to make the DRM GPUVA manager
represent a basic GPU-VM implementation. In this context, this patch series
aims at generalizing the following elements.

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

This patch series also renames struct drm_gpuva_manager to struct drm_gpuvm
including corresponding functions. This way the GPUVA manager's structures align
better with the documentation of VM_BIND [1] and VM_BIND locking [2]. It also
provides a better foundation for the naming of data structures and functions
introduced for implementing the features of this patch series.

This patch series is also available at [3].

[1] Documentation/gpu/drm-vm-bind-async.rst
[2] Documentation/gpu/drm-vm-bind-locking.rst
[3] https://gitlab.freedesktop.org/nouvelles/kernel/-/commits/gpuvm-next

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

Danilo Krummrich (7):
  drm/gpuvm: rename struct drm_gpuva_manager to struct drm_gpuvm
  drm/gpuvm: allow building as module
  drm/nouveau: uvmm: rename 'umgr' to 'base'
  drm/gpuvm: common dma-resv per struct drm_gpuvm
  drm/gpuvm: add an abstraction for a VM / BO combination
  drm/gpuvm: generalize dma_resv/extobj handling and GEM validation
  drm/nouveau: GPUVM dma-resv/extobj handling, GEM validation

 drivers/gpu/drm/Kconfig                       |    7 +
 drivers/gpu/drm/Makefile                      |    2 +-
 drivers/gpu/drm/drm_debugfs.c                 |   16 +-
 .../gpu/drm/{drm_gpuva_mgr.c => drm_gpuvm.c}  | 1209 ++++++++++++++---
 drivers/gpu/drm/nouveau/Kconfig               |    1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c          |    4 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c     |    2 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c        |   52 +-
 drivers/gpu/drm/nouveau/nouveau_exec.h        |    4 -
 drivers/gpu/drm/nouveau/nouveau_gem.c         |    4 +-
 drivers/gpu/drm/nouveau/nouveau_sched.h       |    4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  207 +--
 drivers/gpu/drm/nouveau/nouveau_uvmm.h        |    8 +-
 include/drm/drm_debugfs.h                     |    6 +-
 include/drm/drm_gem.h                         |   32 +-
 include/drm/{drm_gpuva_mgr.h => drm_gpuvm.h}  |  510 +++++--
 16 files changed, 1605 insertions(+), 463 deletions(-)
 rename drivers/gpu/drm/{drm_gpuva_mgr.c => drm_gpuvm.c} (51%)
 rename include/drm/{drm_gpuva_mgr.h => drm_gpuvm.h} (53%)


base-commit: 6bd3d8da51ca1ec97c724016466606aec7739b9f
-- 
2.41.0

