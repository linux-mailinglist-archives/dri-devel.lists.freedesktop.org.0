Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9912A539A6A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 02:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D1910FC79;
	Wed,  1 Jun 2022 00:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F369410FC78
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 00:39:53 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id rs12so540512ejb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 17:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DCZ3JA1DbqsXip9vWEDIa4CSQ2C4LDkNE3hTYI0lc6w=;
 b=ZfgE9nvIaNGTgUrSB2jShElgLgsj5/bRyn/gUyRFefGbPHwddsnUmVDewZbidcXR61
 jsVwFbcwBxMeMH5IKz7XgJTjpk966TApEBNZkdRkUzst3SfNOJW/I4/q5d3uMctQX7i/
 WPIEVIRaB2P6BCLfBIxrDlmBbH+ojFvGibijcfappdHWGRSw/VcojHkrEaQoEV0eJsXr
 cBps3AGYYiX42QXNyP2IIV2eLJnDcTQbeUOvuQTYA7Hro2mV/Xccm8xvWlxjuqmgLR9U
 44zD/zeRePub6FqzOGHr/4ek1/wRJmOPGHdBOAcJ8LI4EncdeFrGT9L6udGb06Z4knkj
 iePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DCZ3JA1DbqsXip9vWEDIa4CSQ2C4LDkNE3hTYI0lc6w=;
 b=OI2HzBu5P4Rl1Ob092bsNEnKK0jvKAeNrmoJW3JaSQoaVoGHRILEiyRbD5Q+JVEwj3
 rpxY1z91Y8r0L4TDfm6qfJvClj5SNnf6Vq3LXbWP65Ri+U5oZ0OLOOG2kwa40udBV7H2
 iEoNQgWE2xf3mNo/CWZqM8IuCnYGc2ajVO95ynQVZCRJOVI+TWFrIOV76wOt2R2oiJ/7
 cfpGmFKePlyJOWvgjn2nJr2qMp4tlXTeorXpWVwZ5ckml+VTJh96VvgE3uZ5P4mztK1A
 vRhjWNptUHNVxuAc5RZYhyDESDIHzNsyZ5zDdw1ZlPQ2/VbpmWaG6fcqfMVyAEVUCdZ9
 4img==
X-Gm-Message-State: AOAM531kCGv9LrcPIE9Gq70R/DYFIqxx25izFacodTKS1R6rJlfAdb+u
 WhkoYmvsdMF1aP9EfTKOdgOYGrMX4B8zQA==
X-Google-Smtp-Source: ABdhPJydBrpy+L5lbHSJ09M6rQfVyuYVvlX6zRWxxsetVHlcxRZeZQTmfwEfo58z0h9+A1hi+Fijfw==
X-Received: by 2002:a17:907:7e9e:b0:6fe:e21a:1e12 with SMTP id
 qb30-20020a1709077e9e00b006fee21a1e12mr41725198ejc.703.1654043992178; 
 Tue, 31 May 2022 17:39:52 -0700 (PDT)
Received: from bas-workstation.. ([2a02:aa12:a77f:2000:7285:c2ff:fe67:a82f])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a056402001500b0042aa23fa93bsm106182edu.20.2022.05.31.17.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 17:39:51 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/5] Add option to disable implicit sync for userspace
 submits.
Date: Wed,  1 Jun 2022 02:40:09 +0200
Message-Id: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
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
Cc: christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds a context option to use DMA_RESV_USAGE_BOOKKEEP for userspace submissions,
based on Christians TTM work.

Disabling implicit sync is something we've wanted in radv for a while for resolving
some corner cases. A more immediate thing that would be solved here is avoiding a
bunch of implicit sync on GPU map/unmap operations as well, which helps with stutter
around sparse maps/unmaps.

I have experimental userspace in radv, but it isn't 100% ready yet. There are still
issues with some games that I'm looking at, but in the meantime I'm looking for early
feedback on the idea.

Besides the debugging an open question is whether it is worth adding the option to
wait on additional explicit syncobj in the VM map/unmap operations. My current radv
code waits on the wait syncobj in userspace on a thread before doing the operation
which results in some corner cases because we can't provide binary syncobj at
submission time (impacting the usual sync file exports). However adding these fences
adds the risk of head of line blocking because all VM operations get executed on the
same ring, so all later operations get blocked by waiting on the fences as well, which
can cause head of line blocking.

I'm looking to get more implementation experience with different games to see if we
need this, but if we need it it would be a somewhat separate addition to the UAPI.

Bas Nieuwenhuizen (5):
  drm/ttm: Refactor num_shared into usage.
  drm/amdgpu: Add separate mode for syncing DMA_RESV_USAGE_BOOKKEEP.
  drm/amdgpu: Allow explicit sync for VM ops.
  drm/amdgpu: Refactor amdgpu_vm_get_pd_bo.
  drm/amdgpu: Add option to disable implicit sync for a context.

 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 21 ++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        | 19 ++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c       | 32 +++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h       |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 10 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 11 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c      | 11 +++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h      |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  7 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
 drivers/gpu/drm/qxl/qxl_release.c             |  2 +-
 drivers/gpu/drm/radeon/radeon_cs.c            |  5 +--
 drivers/gpu/drm/radeon/radeon_gem.c           |  2 +-
 drivers/gpu/drm/radeon/radeon_vm.c            |  4 +--
 drivers/gpu/drm/ttm/ttm_execbuf_util.c        |  5 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      | 10 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c    |  2 +-
 include/drm/ttm/ttm_execbuf_util.h            |  3 +-
 include/uapi/drm/amdgpu_drm.h                 |  3 ++
 28 files changed, 112 insertions(+), 63 deletions(-)

-- 
2.36.1

