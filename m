Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2E019BC82
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 09:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C826E9E1;
	Thu,  2 Apr 2020 07:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7366E983
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 18:38:27 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j17so1218906wru.13
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 11:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=peAJjtDQg/2A1FS43m5gFLWbl2kMRlMPGVs3RKXnXPk=;
 b=ffUsEswzhsOpKVQX/NQMjXLnB3nOsBYYDbc9nY3JwBCx+0XusGP5dy4wCf0ZtyQSTf
 Qk8V4NBGcTSeJ8PPXuu88iS34jL8qXyq684SBTsxRsriiqppTsNMbEP/DawmaKNphW/B
 oSNpT349rfBsT5UWjpDF0ixkyRqtLVvdD6npIaEtgf3nel+gpNUXSD96ihfAYGCOmEyv
 4VPuMsZjAI8ks2hwwgpvW8pI7un2RGIaOVvHSYUqtVscLuk91k/cOXEtzXAI8IQ4Jsih
 LrnTxneHm0drzD11JhSojc3lqkD+SunlWT33/aDHmOhJuTtixN2hZOPQUls392P5m/Q9
 U+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=peAJjtDQg/2A1FS43m5gFLWbl2kMRlMPGVs3RKXnXPk=;
 b=NRdTvn3hE6HKy4mu1WfaBu/dzKXOFcenzh61/EXnZzYXKX6wtBbSOCeXUG1ho2Wkd3
 gfrI8mWwT1vF4BT6grNMfhaLf7Y6d37NmLnaHM7Fz1uQ/kfxgFES+qJPBaOdzayK2yqt
 Ttm1k6mWFlaGvJWEHcKCnvbsQHCt1O/26GrSY00RGMq6FUr54Jtd7FV3J+dfaCpgSTLQ
 utAFiJ7ZToyOFDAjWcA9r4pSYBeYq1grJZqDacicM8zbUWp9pyfypj4isSF0rxNhPgvU
 PgM+BqFxSV3SFh7YFYAOAMkSaFl7OqP9Lf+22QWAjwQuQyaDN9sKIZb8RcWfds940YPo
 3OkA==
X-Gm-Message-State: ANhLgQ3n83NuIsbFW/rTc24dJfQzGt9Ps8JlShNgNKp7FtO/ZDfJAOci
 gfOVXPbo1BbS8RXerXZIaAqRggsZx54=
X-Google-Smtp-Source: ADFU+vu2gSEdMxGImKW4b8x/IiulFcn4UN70VuEN2M9Ysu4Xbi4xIy7NSw+2oEup6KRoJDMJfmE49Q==
X-Received: by 2002:adf:e44a:: with SMTP id t10mr27007495wrm.322.1585766305545; 
 Wed, 01 Apr 2020 11:38:25 -0700 (PDT)
Received: from brihaspati.fritz.box (p5DE52E4E.dip0.t-ipconnect.de.
 [93.229.46.78])
 by smtp.gmail.com with ESMTPSA id b11sm3976973wrq.26.2020.04.01.11.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 11:38:24 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/8] do not store GPU address in TTM
Date: Wed,  1 Apr 2020 20:42:39 +0200
Message-Id: <20200401184247.16643-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Apr 2020 07:17:56 +0000
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With this patch series I am trying to remove GPU address dependency in
TTM and moving GPU address calculation to individual drm drivers. This
cleanup will simplify introduction of drm_mem_region/domain work started
by Brian Welty[1].


It would be nice if someone test this for nouveau. Rest of the drivers
are already tested.

v2:
* set bo->offset = 0 for drm/nouveau if bo->mem.mm_node == NULL

v3:
* catch return value of drm_gem_vram_offset() in drm/bochs
* introduce drm_gem_vram_pg_offset() in vram helper
* improve nbo->offset calculation for nouveau

v4:
* minor coding style fixes in amdgpu and radeon
* remove unnecessary kerneldoc for internal function

v5:
* rebase on top of drm-misc-next
* fix return value of drm_gem_vram_pg_offset()
* add a comment in drm_gem_vram_pg_offset() to clearify why we return 0.

Nirmoy Das (8):
  drm/amdgpu: move ttm bo->offset to amdgpu_bo
  drm/radeon: don't use ttm bo->offset
  drm/vmwgfx: don't use ttm bo->offset
  drm/nouveau: don't use ttm bo->offset v3
  drm/qxl: don't use ttm bo->offset
  drm/vram-helper: don't use ttm bo->offset v4
  drm/bochs: use drm_gem_vram_offset to get bo offset v2
  drm/ttm: do not keep GPU dependent addresses

 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 22 ++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 29 ++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |  2 +-
 drivers/gpu/drm/bochs/bochs_kms.c           |  7 ++++-
 drivers/gpu/drm/drm_gem_vram_helper.c       | 11 +++++++-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c     |  6 ++---
 drivers/gpu/drm/nouveau/dispnv04/disp.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/overlay.c  |  6 ++---
 drivers/gpu/drm/nouveau/dispnv50/base507c.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/core507d.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c     |  8 +++---
 drivers/gpu/drm/nouveau/nouveau_bo.c        |  8 ++++++
 drivers/gpu/drm/nouveau/nouveau_bo.h        |  3 +++
 drivers/gpu/drm/nouveau/nouveau_chan.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c       | 10 +++----
 drivers/gpu/drm/qxl/qxl_drv.h               |  6 ++---
 drivers/gpu/drm/qxl/qxl_kms.c               |  5 ++--
 drivers/gpu/drm/qxl/qxl_object.h            |  5 ----
 drivers/gpu/drm/qxl/qxl_ttm.c               |  9 -------
 drivers/gpu/drm/radeon/radeon.h             |  1 +
 drivers/gpu/drm/radeon/radeon_object.h      | 16 +++++++++++-
 drivers/gpu/drm/radeon/radeon_ttm.c         |  4 +--
 drivers/gpu/drm/ttm/ttm_bo.c                |  7 -----
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c          |  4 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c     |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c        |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  2 --
 include/drm/ttm/ttm_bo_api.h                |  2 --
 include/drm/ttm/ttm_bo_driver.h             |  1 -
 36 files changed, 121 insertions(+), 77 deletions(-)

--
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
