Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74499608413
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 06:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D1D10E6B2;
	Sat, 22 Oct 2022 04:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0BC10E2CC
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Oct 2022 04:02:42 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id C4375320A04;
 Sat, 22 Oct 2022 05:02:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666411360; bh=v+WYZAqplnLUCVBKZvvAqkfjVfHEahj8zJSCQJZ2Bno=;
 h=From:To:Cc:Subject:Date:From;
 b=KcsgXtn5vXwS5yqJgXYeFZ3zKIY6mtsSZYPLHPZ2u5pHHgG8tEUUj9Vunhr/iODub
 nDAV33q4Y7xhRM/322gCDWxQ8EZgeRWQKdkD/fnVCNh06Cjejk+DYDPnIYcFmZgo6I
 OYGs30p784pv2YnUruE3JclQaqIzR46NaaV2Sm/kTMV5LeNf0ScpDvjz3Rjzk4T7Jj
 sjSGBRuEi6Fw4/fcim7tOzwp+PUN+QKqXarM0iUWhSFDXoP/8ENHjvPBpVr2O7Gh/U
 F5qz+gFZJz0QWMyqw+/xNZrMEAqK6uRMPAg7avWKTKsoCh6dSs0LHXQoy+I3Uz/Il7
 zq5Am/I0Bkz0w==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 00/17] drm/vmwgfx: fb, cursors and hashtable refactor
Date: Sat, 22 Oct 2022 00:02:19 -0400
Message-Id: <20221022040236.616490-1-zack@kde.org>
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

v4: Fix one more LPK warning found in the "Fix frame-size warning in
    vmw_mksstat_add_ioctl" change
v3: Add improvements suggested by Thomas for the fb port change and add
a commit that fixes a sparse kernel doc warning
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
  drm/vmwgfx: Remove vmwgfx_hashtab

Martin Krastev (1):
  drm/vmwgfx: Fix frame-size warning in vmw_mksstat_add_ioctl

Michael Banack (4):
  drm/vmwgfx: Clean up cursor mobs
  drm/vmwgfx: Start diffing new mob cursors against old ones
  drm/vmwgfx: Support cursor surfaces with mob cursor
  drm/vmwgfx: Diff cursors when using cmds

Zack Rusin (7):
  drm/vmwgfx: Write the driver id registers
  drm/vmwgfx: Do not allow invalid bpp's for dumb buffers
  drm/vmwgfx: Port the framebuffer code to drm fb helpers
  drm/vmwgfx: Remove explicit and broken vblank handling
  drm/vmwgfx: Add a mksstat counter for cotable resizes
  drm/vmwgfx: Optimize initial sizes of cotables
  drm/vmwgfx: Fix a sparse warning in kernel docs

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
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c    |  15 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c         | 831 ---------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.c    | 199 -----
 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.h    |  83 --
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c        | 641 ++++++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h        |  31 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c        |   8 -
 drivers/gpu/drm/vmwgfx/vmwgfx_mksstat.h    |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c        |  59 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c       |  31 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c       |  26 -
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c |  55 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h |  26 +-
 23 files changed, 654 insertions(+), 1803 deletions(-)
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.c
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.h

-- 
2.34.1

