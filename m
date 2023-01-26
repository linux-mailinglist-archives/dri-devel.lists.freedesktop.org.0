Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCE367D357
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 18:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B3210E071;
	Thu, 26 Jan 2023 17:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398C110E071
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 17:38:21 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id D51763249F1;
 Thu, 26 Jan 2023 17:38:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1674754699; bh=es1zleiu3H1hWmCJ+XXOPgscWSEOvO6MaZIereWqZKs=;
 h=From:To:Cc:Subject:Date:From;
 b=DwZk/nxQPKJ9YD5Oa/IXoUeAuIgo0olRx7UL3DTIF4ugbQZOeSJoky/P3OjUeL0su
 9rCiJbe0yFXhF4ducNpxc9hQKnusYlwCjYKQhP9JPnFinI1qBDf+XxnNoiKKk4lv+o
 LRhDC2OegQEgq7T8liHLfUNWmikCACG5/8SiYfOgmt4mwzDcs54mEwKPDgFf0rDx6s
 9yliUuQ5oYVGy00aNr2DVrHxrjWAcggUMYshp4RNWhaxgHw19rXY4Qgn+O9RUIkwzs
 IGIgwt252/YeBGkopu6qloD9ZgHLdw3uqKY2+AfydTvoahP5zjNakOY/vMvMme2ksy
 +aQntsQhiNADg==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/7] drm/vmwgfx: Refactor the buffer object code
Date: Thu, 26 Jan 2023 12:38:06 -0500
Message-Id: <20230126173813.602748-1-zack@kde.org>
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

Zack Rusin (7):
  drm/vmwgfx: Use the common gem mmap instead of the custom code
  drm/vmwgfx: Remove the duplicate bo_free function
  drm/vmwgfx: Rename vmw_buffer_object to vmw_bo
  drm/vmwgfx: Simplify fb pinning
  drm/vmwgfx: Cleanup the vmw bo usage in the cursor paths
  drm/vmwgfx: Abstract placement selection
  drm/vmwgfx: Stop using raw ttm_buffer_object's

 drivers/gpu/drm/vmwgfx/Makefile               |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            | 401 +++++++++---------
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h            | 217 ++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c           |  14 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c        |  53 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c       |  36 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c       |  65 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  26 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           | 243 ++---------
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c       | 103 +++--
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c         |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c           |  86 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 230 ++++------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h           |  43 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c           |  57 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c           |  45 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c       |  20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c    |  59 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      | 239 ++++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_resource_priv.h |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c          |  53 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c        |  65 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_so.c            |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          | 323 ++------------
 drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c  |  20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       | 111 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c    | 116 +----
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c      | 110 -----
 drivers/gpu/drm/vmwgfx/vmwgfx_va.c            |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c    | 150 +++----
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h    |  10 +-
 31 files changed, 1266 insertions(+), 1655 deletions(-)
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c

-- 
2.38.1

