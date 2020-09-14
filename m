Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FE32685AF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5756E3DA;
	Mon, 14 Sep 2020 07:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423E86E288
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 07:22:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6E99DAC82;
 Mon, 14 Sep 2020 07:22:53 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com
Subject: [RESEND][PATCH v3 0/4] drm/ast: Disable HW cursor when switching modes
Date: Mon, 14 Sep 2020 09:22:32 +0200
Message-Id: <20200914072236.19398-1-tzimmermann@suse.de>
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

Since converting the ast driver to atomic modesetting, modesetting
occationally locks up the graphics hardware and turns the display
permanently dark. This happens once or twice per 10 mode switches.
Investigation shows that the ast hardware presumably requires the HW
cursor to be disabled while the modeswitch takes place.

This patchset fixes the problem by disabling planes before programming
the CRTC mode. After the switch, the planes gets re-enabled if they were
enabled before. For mere pageflip operations, nothing changes.

Patches #1 makes format changes work as intended: format registers are
only updated if necessary. They used to be changed on each pageflip.

Patches #2 to #4 change the modesetting logic such that planes will be
disabled with the CRTC, then the CRTC's new mode is being programmed,
and finally planes are reenabled. The primary plane is enabled before
the cursor plane. With this setup, the cursor plane always has a valid
mode and framebuffer available.

Tested on AST2100 HW. The issue is not 100% reproducible, but does not
show up after applying the patchset. I think the problem has been fixed.

Thomas Zimmermann (4):
  drm/ast: Set format registers in primary plane's update
  drm/ast: Disable planes while switching display modes
  drm/ast: Program display mode in CRTC's atomic_enable()
  drm/ast: Enable CRTC before planes

 drivers/gpu/drm/ast/ast_drv.h  |   2 +
 drivers/gpu/drm/ast/ast_mode.c | 103 ++++++++++++++++++++-------------
 2 files changed, 64 insertions(+), 41 deletions(-)

--
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
