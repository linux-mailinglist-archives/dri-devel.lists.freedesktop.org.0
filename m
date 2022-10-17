Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C38B601813
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 21:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB08610E720;
	Mon, 17 Oct 2022 19:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8085810E71D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 19:54:52 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 358DC33BD8C;
 Mon, 17 Oct 2022 20:54:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666036490; bh=I5BOucy/iAxY7w5updYjhk2KWg/vl19imI9ClqtNyj4=;
 h=From:To:Cc:Subject:Date:From;
 b=IpL+kr7KSTnSj4fJX9oNQzhVHNVNSUL2mBzOHIOAHCEgngzEz7F9sIRu+cxVGAo8s
 ZXYZWGvPeby2D6XhkpiudcI5N4Upl/VJ2ILq20ed/io+FKtc7JtY9Kc7CW3U5m2C1j
 QCRNU8i4/FeAAN8EAgzRQopl+ShtIuaHbwAC4wXdvhjnZRU3kwfAg3ealRk6uKiT5w
 B1dtBWVt12gpHN80RGu/1fSAVVb0XvJVx83H2h7m25IJ6Y09k87Jpr8NE+YghW3aRE
 FZMx2jQR3B818aLYAJUNCgK9lLPFPfx+XChv/7foPAXy8xIaMwrx4elfi44L8R9PaC
 syiQWMEldIuig==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/16] vmwgfx: fb, cursors and hashtable refactor
Date: Mon, 17 Oct 2022 15:54:24 -0400
Message-Id: <20221017195440.311862-1-zack@kde.org>
X-Mailer: git-send-email 2.34.1
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
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c        | 622 +++++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h        |  31 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c        |   8 -
 drivers/gpu/drm/vmwgfx/vmwgfx_mksstat.h    |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c        |  53 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c       |  27 -
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c       |  26 -
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c |  55 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h |  26 +-
 23 files changed, 632 insertions(+), 1795 deletions(-)
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.c
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.h

-- 
2.34.1

