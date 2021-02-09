Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A50F3150A7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 14:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9876EB41;
	Tue,  9 Feb 2021 13:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CDD6EB41
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 13:46:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3962AAD6A;
 Tue,  9 Feb 2021 13:46:35 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH v2 00/10] drm/ast: Clean-up cursor-plane updates
Date: Tue,  9 Feb 2021 14:46:22 +0100
Message-Id: <20210209134632.12157-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
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

(was: drm/ast: Move cursor vmap calls out of commit tail)

Ast has vmap calls in its cursor's atomic_update function. This is not
supported as vmap might aquire the dma reservation lock. While at it,
cleanup the whole cursor code: the patchset removes all possible runtime
errors from the atomic_update function and reduces the overhead from
vmap calls on the HW cursor BOs to a minimum.

Patches 1 to 3 update the cursor code and prepare before the refactoring.

Patch 4 and 5 inline the cursor update logic into the rsp cursor-plane
functions. This is mostly about moving code around.

Patches 6 to 9 add a dedicated cursor plane that maintains the two BOs
for HW cursors. The HW cursor BOs are permanently pinned and vmapped
while the cursor plane is initialized. Thus removing the related vmap
operations from atomic_update.

Finally patch 10 converts ast cursors to struct drm_shadow_plane_state.
BOs with cursor image data from userspace are vmapped in prepare_fb and
vunampped in cleanup_fb. The actual update of the cursor image is being
moved from prepare_fb to atomic_update.

With the patchset applied, all cursor preparation is performed before
the commit-tail functions; while the actual update is performed within.

Tested by running X11 and Weston on ast hardware.

v2:
	* convert to drm_shadow_plane_state helpers

Thomas Zimmermann (10):
  drm/ast: Add constants for VGACRCB register bits
  drm/ast: Fix invalid usage of AST_MAX_HWC_WIDTH in cursor atomic_check
  drm/ast: Initialize planes in helper functions
  drm/ast: Allocate HW cursor BOs during cursor-plane initialization
  drm/ast: Inline ast cursor-update functions into modesetting code
  drm/ast: Add cursor-plane data structure
  drm/ast: Store cursor BOs in cursor plane
  drm/ast: Map HW cursor BOs permanently
  drm/ast: Store each HW cursor offset after pinning the rsp BO
  drm/ast: Move all of the cursor-update functionality to atomic_update

 drivers/gpu/drm/ast/Makefile     |   3 +-
 drivers/gpu/drm/ast/ast_cursor.c | 286 --------------------------
 drivers/gpu/drm/ast/ast_drv.h    |  47 +++--
 drivers/gpu/drm/ast/ast_mode.c   | 334 +++++++++++++++++++++++++------
 4 files changed, 312 insertions(+), 358 deletions(-)
 delete mode 100644 drivers/gpu/drm/ast/ast_cursor.c

--
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
