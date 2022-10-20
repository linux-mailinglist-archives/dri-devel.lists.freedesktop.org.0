Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C266055FD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 05:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D70210E2F1;
	Thu, 20 Oct 2022 03:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C21410E26D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 03:41:39 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id C377333EF41;
 Thu, 20 Oct 2022 04:41:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666237297; bh=mJuSCIgEkE+lNoeSy3DTr0ygs9H52JFziwqHR2KRKaI=;
 h=From:To:Cc:Subject:Date:From;
 b=M8PAKNYjIMd7qAovIpZhyZMCx36IcbPxXzgcJydyvwW+d+jDVxov19t6DgP05UNNp
 0Lz6x1UWPXDIuHH2PVvyikiCo5ByR2mn7SJPb4BNmfD57lBBohvmDKQ0cWSr/hk9mf
 AOydfiOa8Yqg0AyPA6MNxPBy0b7gXalSrj7TerTcNAhHWlhv/HwiOK66LI+Qwpzg74
 jqpGv9JLS6ERmNqZSoPSnGwxqKdPv1X3muc3RHrVhmUpweChSwcF6kHBjyAYasnEr4
 +dmuc650bIzlkGs2X97NJ4odm6DJBlcy3/7/YDRNgkqSwdjfgMwptlcykJqZsWrGPo
 vUa+WR2EutBAA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/16] drm/vmwgfx: fb, cursors and hashtable refactor
Date: Wed, 19 Oct 2022 23:41:15 -0400
Message-Id: <20221020034131.491973-1-zack@kde.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

v2: Fix LKP and sparse reported issues

This is a bit larger series than usual but these are all connected in
various ways. The most important changes around everything is centered
include:
- finally getting rid of vmwgfx_hashtab and porting the driver to 
  linux/hashtable
- cleaning up the cursor mob handling, which fixes a bunch of cursor
  issues on kde configs
- removing vmwgfx fb code and porting it to drm fb helpers
- removing vmwgfx faked vblank handling

The rest is largely support code to make the transition easier (with some
igt fixes to get more of it running for regression testing). The result
is removal of over 1000loc with no loss in functionality.

Maaz Mombasawala (5):
  drm/vmwgfx: Refactor resource manager's hashtable to use
    linux/hashtable implementation.
  drm/vmwgfx: Remove ttm object hashtable
  drm/vmwgfx: Refactor resource validation hashtable to use
    linux/hashtable implementation.
  drm/vmwgfx: Refactor ttm reference object hashtable to use
    linux/hashtable.
  drm/vmwgfx : Remove vmwgfx_hashtab

Martin Krastev (1):
  drm/vmwgfx: Fix frame-size warning in vmw_mksstat_add_ioctl

Michael Banack (4):
  drm/vmwgfx: Clean up cursor mobs
  drm/vmwgfx: Start diffing new mob cursors against old ones
  drm/vmwgfx: Support cursor surfaces with mob cursor
  drm/vmwgfx: Diff cursors when using cmds

Zack Rusin (6):
  drm/vmwgfx: Write the driver id registers
  drm/vmwgfx: Do not allow invalid bpp's for dumb buffers
  drm/vmwgfx: Port the framebuffer code to drm fb helpers
  drm/vmwgfx: Remove explicit and broken vblank handling
  drm/vmwgfx: Add a mksstat counter for cotable resizes
  drm/vmwgfx: Optimize initial sizes of cotables

 Documentation/gpu/todo.rst                 |  11 -
 drivers/gpu/drm/vmwgfx/Kconfig             |   7 -
 drivers/gpu/drm/vmwgfx/Makefile            |   4 +-
 drivers/gpu/drm/vmwgfx/ttm_object.c        | 123 ++-
 drivers/gpu/drm/vmwgfx/ttm_object.h        |  20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         |  16 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c |  62 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c    |  29 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        | 129 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  49 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c    |  14 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c         | 831 ---------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.c    | 199 -----
 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.h    |  83 --
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c        | 639 ++++++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h        |  31 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c        |   8 -
 drivers/gpu/drm/vmwgfx/vmwgfx_mksstat.h    |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c        |  55 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c       |  31 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c       |  26 -
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c |  55 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h |  26 +-
 23 files changed, 650 insertions(+), 1800 deletions(-)
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.c
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.h

-- 
2.34.1

