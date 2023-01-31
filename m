Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A676822E3
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 04:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7EC10E0C8;
	Tue, 31 Jan 2023 03:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0135E10E065
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 03:35:47 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 66E663211E2;
 Tue, 31 Jan 2023 03:35:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1675136145; bh=wqcqBx4Qvz2cL98OMKzs0u4i98LBRJXNznZ45MW24P8=;
 h=From:To:Cc:Subject:Date:From;
 b=bvAK6Q8sl3XXbzTWzxiP53p7DraS7EFoGKgq0wqOvJeCUGxWMOfaAPfz/MNa3dAh+
 HatM16yhfSbg9vQVB3EWLx/LRYS2Fj6lfvLAmE5tqzdUC5vxuvm14svRiCqLEn927y
 DKr6lVUMmy9a1YzECPrdEEbdrBtr+fhlUwZi5SEQMM39jbDE6X6GW7gVK20nj12gpN
 TgKEi51P5M4gkCbK9bMutRjXjaJhMV3Rz1l7IVezShUQYdcY8J12iq62OQsAotYhQK
 JPSBi0hjIs4cluYVYgU0s+S0iJTm1rE2liBv0LEokERlAX/8YEpEQgxElXgvc+Y+QL
 xWSKQGddbzaMg==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/8] drm/vmwgfx: Refactor the buffer object code
Date: Mon, 30 Jan 2023 22:35:34 -0500
Message-Id: <20230131033542.953249-1-zack@kde.org>
X-Mailer: git-send-email 2.38.1
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

v2: Fix all the issues which Thomas pointed out in the initial review
and split the "simplify fb pinning" change into two commits with the
second one being just the rename.

The series refactors the buffer object code to make more alike the
other ttm drivers. The placement becomes a property of the bo which makes
it a lot easier to correctly validate based on the current usage.
vmwgfx tends to do more validation due to forced moves, because the
buffer placement sometimes need to change due to userspace commands, i.e.
some commands e.g. SURFACE_DMA implies GMR's which are really deprecated
in favor of MOB's, but the x11 driver still uses GMR's so buffers tend
to flip between GMR's and MOB's a bit when running on X11.
                                                                           
The functionality remains largely unchanged, but the LOC are reduced by
about 400 and the groundwork is done for adding prime support with SG
ttm buffers.

Zack Rusin (8):
  drm/vmwgfx: Use the common gem mmap instead of the custom code
  drm/vmwgfx: Remove the duplicate bo_free function
  drm/vmwgfx: Rename vmw_buffer_object to vmw_bo
  drm/vmwgfx: Simplify fb pinning
  drm/vmwgfx: Cleanup the vmw bo usage in the cursor paths
  drm/vmwgfx: Rename dummy to is_iomem
  drm/vmwgfx: Abstract placement selection
  drm/vmwgfx: Stop using raw ttm_buffer_object's

 drivers/gpu/drm/vmwgfx/Makefile               |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            | 392 +++++++++---------
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h            | 203 +++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c           |  14 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c        |  53 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c       |  36 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c       |  65 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  26 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           | 245 +++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c       | 102 +++--
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c         |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c           |  89 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 230 ++++------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h           |  43 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c           |  57 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c           |  45 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c       |  20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c    |  68 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      | 243 +++++------
 drivers/gpu/drm/vmwgfx/vmwgfx_resource_priv.h |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c          |  53 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c        |  65 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_so.c            |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          | 323 ++-------------
 drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c  |  20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       | 111 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c    | 116 +-----
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c      | 110 -----
 drivers/gpu/drm/vmwgfx/vmwgfx_va.c            |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c    | 150 +++----
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h    |  10 +-
 31 files changed, 1248 insertions(+), 1667 deletions(-)
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c

-- 
2.38.1

