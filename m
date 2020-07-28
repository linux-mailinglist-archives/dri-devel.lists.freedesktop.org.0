Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CE8230460
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 09:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F0A6E1CF;
	Tue, 28 Jul 2020 07:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00FD6E1CF
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 07:44:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 046F8AC22;
 Tue, 28 Jul 2020 07:44:41 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.l.velikov@gmail.com, kraxel@redhat.com, yc_chen@aspeedtech.com
Subject: [PATCH 00/13] drm/ast: Convert to managed initialization
Date: Tue, 28 Jul 2020 09:44:12 +0200
Message-Id: <20200728074425.2749-1-tzimmermann@suse.de>
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

This is the final patchset for converting ast to managed initialization.

Patches #1 to #4 address I2C helpers. The structures are being stored
in struct ast_connector. The initialization and cleanups is being converted
to managed release helpers.

Patches #5 to #10 address modesetting and device structures. All are
being embedded into struct ast_private. With struct ast_private being
a subclass of struct drm_device, patch #10 switches ast to DRM's managed-
allocation helpers.

Patches #11 and #12 address firmware memory that ast allocates
internally.

Finally, patch #13 removes ast's destroy function in favor of managed
release helpers.

Tested on AST 2100 HW.

Thomas Zimmermann (13):
  drm/ast: Move I2C code within ast_mode.c
  drm/ast: Test if I2C support has been initialized
  drm/ast: Embed I2C fields in struct ast_connector
  drm/ast: Managed release of I2C adapter
  drm/ast: Embed CRTC and connector in struct ast_private
  drm/ast: Separate DRM driver from PCI code
  drm/ast: Replace driver load/unload functions with device
    create/destroy
  drm/ast: Replace struct_drm_device.dev_private with to_ast_private()
  drm/ast: Don't use ast->dev if dev is available
  drm/ast: Embed struct drm_device in struct ast_private
  drm/ast: Managed release of ast firmware
  drm/ast: Manage release of firmware backup memory
  drm/ast: Managed device release

 drivers/gpu/drm/ast/ast_cursor.c |   8 +-
 drivers/gpu/drm/ast/ast_dp501.c  |  23 ++-
 drivers/gpu/drm/ast/ast_drv.c    |  82 ++++----
 drivers/gpu/drm/ast/ast_drv.h    |  43 +++--
 drivers/gpu/drm/ast/ast_main.c   |  74 ++++----
 drivers/gpu/drm/ast/ast_mm.c     |   2 +-
 drivers/gpu/drm/ast/ast_mode.c   | 310 ++++++++++++++-----------------
 drivers/gpu/drm/ast/ast_post.c   |   6 +-
 8 files changed, 263 insertions(+), 285 deletions(-)

--
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
