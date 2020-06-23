Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8EA204C22
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 10:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50C16E973;
	Tue, 23 Jun 2020 08:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D7C6E96B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 08:19:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D6663ADD5;
 Tue, 23 Jun 2020 08:19:02 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, noralf@tronnes.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Subject: [PATCH 00/14] drm/ast: Managed modesetting
Date: Tue, 23 Jun 2020 10:18:47 +0200
Message-Id: <20200623081901.10667-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the first patchset to convert ast to use managed interfaces. These
patches address modesetting. I expect that there will be at least one more
set of patches for memory management and one for device strcutures.

Patches 1 to 11 tackle HW cursor handling. The overall point is to get
cursor support out of the plane functions and put the code into helpers.
There are quite a few improvements that make cursors easier and faster to
use. Patch 10 converts cursors to managed release.

With cursors out of the way, modesetting initialization is much more
simple. Patches 12 to 14 put all related code next to each other and
switch to managed initialization.

The patchset was tested on AST2100 hardware.

Thomas Zimmermann (14):
  drm/ast: Move cursor functions to ast_cursor.c
  drm/ast: Pass struct ast_private instance to cursor init/fini
    functions
  drm/ast: Move cursor fb pinning and mapping into helper
  drm/ast: Update cursor image and checksum from same function
  drm/ast: Move cursor pageflip into helper
  drm/ast: Replace ast_cursor_move() with ast_cursor_show()
  drm/ast: Don't enable HW cursors twice during atomic update
  drm/ast: Add helper to hide cursor
  drm/ast: Keep cursor HW BOs mapped
  drm/ast: Managed cursor release
  drm/ast: Init cursors before creating modesetting structures
  drm/ast: Replace struct ast_crtc with struct drm_crtc
  drm/ast: Use managed mode-config init
  drm/ast: Initialize mode setting in ast_mode_config_init()

 drivers/gpu/drm/ast/Makefile     |   3 +-
 drivers/gpu/drm/ast/ast_cursor.c | 289 +++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_drv.h    |  19 +-
 drivers/gpu/drm/ast/ast_main.c   |  35 +---
 drivers/gpu/drm/ast/ast_mode.c   | 322 ++++++-------------------------
 5 files changed, 359 insertions(+), 309 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_cursor.c

--
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
