Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D62A22E6B0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 09:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AB089CF2;
	Mon, 27 Jul 2020 07:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A40489CCE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 07:37:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 51DFAB01D;
 Mon, 27 Jul 2020 07:37:24 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com
Subject: [PATCH 0/3] drm/ast: Disable HW cursor when switching modes
Date: Mon, 27 Jul 2020 09:37:04 +0200
Message-Id: <20200727073707.21097-1-tzimmermann@suse.de>
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

Since converting the ast driver to atomic modesettting, modesetting
occationally locks up the graphics hardware and turns the display
permanently dark. This happens once or twice per 10 modeswitches.
Investigation shows that the ast hardware presumably requires the HW
cursor to be disabled while the modeswitch takes place.

This patchset fixes the problem by disabling the HW cursor before
programming the CRTC mode. After changing the mode, the HW cursor gets
re-enabled if it was enabled before.

Patches #1 and #2 simplify the modesetting and cursor code in preparation
of the actual fix. Patch #3 adds the workaround. The CRTC's atomic_begin()
helper disables an active HW cursor and atomic_flush() re-enables it. The
process is transparent for userspace and the rest of the DRM code. For mere
pageflip operations, nothing changes.

Tested on AST2100 HW. The issue is not 100% reproducible, but does not
show up after applying the patchset. I think the problem has been fixed.

Thomas Zimmermann (3):
  drm/ast: Do full modeset if the primary plane's format changes
  drm/ast: Store image size in HW cursor info
  drm/ast: Disable cursor while switching display modes

 drivers/gpu/drm/ast/ast_cursor.c | 13 ++++-
 drivers/gpu/drm/ast/ast_drv.h    |  9 +++-
 drivers/gpu/drm/ast/ast_mode.c   | 82 ++++++++++++++++++++++++++------
 3 files changed, 86 insertions(+), 18 deletions(-)

--
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
