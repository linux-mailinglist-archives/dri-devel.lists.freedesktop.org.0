Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EEA233366
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 15:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EF56E8F4;
	Thu, 30 Jul 2020 13:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288626E8F2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 13:52:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3D004AF37;
 Thu, 30 Jul 2020 13:52:20 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.l.velikov@gmail.com, kraxel@redhat.com, yc_chen@aspeedtech.com
Subject: [PATCH v2 0/9] drm/ast: Convert to managed initialization
Date: Thu, 30 Jul 2020 15:51:57 +0200
Message-Id: <20200730135206.30239-1-tzimmermann@suse.de>
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

This is the next patchset for converting ast to managed initialization.
For v2 of the series, I moved the I2C patches into a separate patchset.
This resolves a mid-series problem wrt to releasing I2C. The rest of
the patches are unchanged (except for a rebase).

Patches #1 to #6 address modesetting and device structures. All are
being embedded into struct ast_private. With struct ast_private being
a subclass of struct drm_device, patch #6 switches ast to DRM's managed-
allocation helpers.

Patches #7 and #8 address firmware memory that ast allocates
internally.

Finally, patch #9 removes ast's destroy function in favor of managed
release helpers.

Tested on AST 2100 HW.

v2:
	* removed I2C patches from series

Thomas Zimmermann (9):
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

 drivers/gpu/drm/ast/ast_cursor.c |  8 ++--
 drivers/gpu/drm/ast/ast_dp501.c  | 23 +++++----
 drivers/gpu/drm/ast/ast_drv.c    | 82 ++++++++++++++------------------
 drivers/gpu/drm/ast/ast_drv.h    | 43 +++++++++--------
 drivers/gpu/drm/ast/ast_main.c   | 74 ++++++++++++++--------------
 drivers/gpu/drm/ast/ast_mm.c     |  2 +-
 drivers/gpu/drm/ast/ast_mode.c   | 40 ++++------------
 drivers/gpu/drm/ast/ast_post.c   |  6 +--
 8 files changed, 130 insertions(+), 148 deletions(-)

--
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
