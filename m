Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6915078203D
	for <lists+dri-devel@lfdr.de>; Sun, 20 Aug 2023 23:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B2110E15F;
	Sun, 20 Aug 2023 21:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFE310E15F
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 21:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692568451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M4vIZkwPS+ZQov4UL+Fk7Hf/Kd7fgNhda5kiRYBSffg=;
 b=Eu6G65GJTfRoORZ3BNbvczjvZ4kQeF8pC9lpQKcuZjUbnqHjLa7eIkE8AkT/CL54XrWQT5
 iy5UCIjtvgvEOgpdHScodtxoTKBhfV6sovKj4dIhyLORf36ZvCmShU0IdLoOL2S797wuL3
 JBWTrc7jFvUvTlXCTVaQb+77U5tgFNc=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-382o4n5XMNyCQizmYfKakA-1; Sun, 20 Aug 2023 17:54:09 -0400
X-MC-Unique: 382o4n5XMNyCQizmYfKakA-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4fe56b43af3so2569261e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 14:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692568448; x=1693173248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M4vIZkwPS+ZQov4UL+Fk7Hf/Kd7fgNhda5kiRYBSffg=;
 b=EXfhK9VBxdOty6veA8SNtiMmmff29yfOtb2MHARfyEnwD6bkyCPDe3H2kr+nvZscu4
 XIgHuUJoEHWKExw0JnIM6MUHe2wDK2+T3ZE8suHK49am/pfhF9XM2ismxKRVJizafDX/
 5MzeJWzAdKxul5aWiZqOJrInpHcJFjF+Nv0uItSIdCmNjnnDgrgIlpbaoWHR1h/zQNft
 PPIFcVvy7aI9t2U5tGaV/XCaZyPHQ6dFQKEc3IgpAn2HsbokYTswZPiECdVclBWBTKok
 9lHavndSYbDrxuoVnrj+KWcMS27SHTFiTwwE64/Fw/E/I71aHGObHAQ32aUVe9sNjxn+
 FQ6A==
X-Gm-Message-State: AOJu0Yyvt1cU2X5IDCXenzAiNd1SdfFAjGR7S38/aUcoJQekCKL1Pnfs
 GQsajHVfVmSmxt1xa+4xCsaTiVrZ3QHwvnMgYXvN0aIhO5PdYeH5YPxJXOTNiEQy/reLYx0kZaI
 rYip+BDzRKLqfRkPrpmfP0fr6zIKv
X-Received: by 2002:ac2:4f15:0:b0:4fb:8bab:48b6 with SMTP id
 k21-20020ac24f15000000b004fb8bab48b6mr3925840lfr.52.1692568448253; 
 Sun, 20 Aug 2023 14:54:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAZXjzsPM9goXTH3dmZ8rgr6Mp+E+RlZMS0dK0JUhqJLysGLS+LL7CvcluY0OjXk0lsaZwJg==
X-Received: by 2002:ac2:4f15:0:b0:4fb:8bab:48b6 with SMTP id
 k21-20020ac24f15000000b004fb8bab48b6mr3925827lfr.52.1692568447849; 
 Sun, 20 Aug 2023 14:54:07 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a170906170600b0099e05fb8f95sm5298869eje.137.2023.08.20.14.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Aug 2023 14:54:07 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com, bskeggs@redhat.com,
 Liam.Howlett@oracle.com
Subject: [PATCH drm-misc-next 0/3] [RFC] DRM GPUVA Manager GPU-VM features
Date: Sun, 20 Aug 2023 23:53:07 +0200
Message-ID: <20230820215320.4187-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

Rather than being designed as a "framework", the target is to make all
features appear as a collection of optional helper functions, such that
drivers are free to make use of the DRM GPUVA managers basic
functionality and opt-in for other features without setting any feature
flags, just by making use of the corresponding functions.

The implementation introduces struct drm_gpuva_gem, which serves as abstraction
combining a struct drm_gpuva_manager and struct drm_gem_object, similar to what
amdgpu does with struct amdgpu_bo_vm. While this adds a bit of complexity it
improves the efficiency of tracking evicted GEM objects. [1] provides an
alternative implementation using a maple_tree, resulting into a fairly simpler
API. [2] points to the full patch series providing the alternative
implementation. [3] points to this patch series.

[1] https://gitlab.freedesktop.org/nouvelles/kernel/-/commit/2a7e1b0ece2c3bba43376783b577d97ae6f6e54f
[2] https://gitlab.freedesktop.org/nouvelles/kernel/-/commits/gpuva-vm-resv
[3] https://gitlab.freedesktop.org/nouvelles/kernel/-/commits/gpuva-vm-resv-vm-bo

Danilo Krummrich (3):
  drm: drm_exec: build always builtin
  drm/gpuva_mgr: generalize dma_resv/extobj handling and GEM validation
  drm/nouveau: gpuva mgr dma-resv/extobj handling, GEM validation

 drivers/gpu/drm/Kconfig                 |   6 -
 drivers/gpu/drm/Makefile                |   3 +-
 drivers/gpu/drm/drm_gpuva_mgr.c         | 688 +++++++++++++++++++++++-
 drivers/gpu/drm/nouveau/Kconfig         |   1 -
 drivers/gpu/drm/nouveau/nouveau_bo.c    |   4 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c  |  51 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c   |   4 +-
 drivers/gpu/drm/nouveau/nouveau_sched.h |   2 -
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  | 191 +++++--
 include/drm/drm_gem.h                   |  48 +-
 include/drm/drm_gpuva_mgr.h             | 302 ++++++++++-
 11 files changed, 1161 insertions(+), 139 deletions(-)


base-commit: 25205087df1ffe06ccea9302944ed1f77dc68c6f
-- 
2.41.0

