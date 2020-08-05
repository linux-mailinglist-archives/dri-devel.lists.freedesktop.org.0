Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B8623CA0E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 12:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E153989EA6;
	Wed,  5 Aug 2020 10:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F6289337
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 10:54:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8F67CB680;
 Wed,  5 Aug 2020 10:54:48 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com
Subject: [PATCH v1 0/4] drm/ast: Disable HW cursor when switching modes
Date: Wed,  5 Aug 2020 12:54:24 +0200
Message-Id: <20200805105428.2590-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
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
permanently dark. This happens once or twice per 10 mode switches.
Investigation shows that the ast hardware presumably requires the HW
cursor to be disabled while the modeswitch takes place.

This patchset fixes the problem by disabling planes before programming
the CRTC mode or format. After the switch, the planes gets re-enabled if
they were enabled before. For mere pageflip operations, nothing changes.

Patches #1 makes format changes work as intended: format registers are
only updated if necessary. They used to be changed on each pageflip.
Patch #2 puts the modesetting code before the plane-update code. This
way, mode setting runs while planes are disabled. Patches #3 and #4
add a commit-tail function that disables planes if the display's mode
or format is going to change. The active planes will later get re-enabled
by the plane-update handler.

Tested on AST2100 HW. The issue is not 100% reproducible, but does not
show up after applying the patchset. I think the problem has been fixed.

v2:
	* rewrote the whole patchset
	* dropped the cursor patches
	* moved modesetting into atomic_begin()
	* disable planes in commit-tail function
	* don't require full modeset for format changes

Thomas Zimmermann (4):
  drm/ast: Only set format registers if primary plane's format changes
  drm/ast: Set display mode in atomic_begin()
  drm/ast: Add commit-tail function
  drm/ast: Disable planes while switching display modes

 drivers/gpu/drm/ast/ast_drv.h  |   2 +
 drivers/gpu/drm/ast/ast_mode.c | 148 +++++++++++++++++++++++++--------
 2 files changed, 114 insertions(+), 36 deletions(-)

--
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
