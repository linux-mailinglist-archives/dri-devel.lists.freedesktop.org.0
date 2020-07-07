Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F50E216845
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 10:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327AD89CF3;
	Tue,  7 Jul 2020 08:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C137E89BDB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 08:24:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7981B11F;
 Tue,  7 Jul 2020 08:24:15 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com, john.p.donnelly@oracle.com,
 lyude@redhat.com
Subject: [PATCH 0/7] drm/mgag200: Inline prepare/commit helpers
Date: Tue,  7 Jul 2020 10:24:04 +0200
Message-Id: <20200707082411.6583-1-tzimmermann@suse.de>
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

Mgag200's modesetting still utilizes the prepare and commit functions
that were part of the non-atomic interface. This patchset integrates
them into the simple-display's enable function.

Patch 1 disables CRTC write protection once when initializing the
registers. Before, CRTC registers were temporarily write-protected for
no apparent reason.

The screen is toggled on and off multiple times while setting a mode.
Patch 3 removes any intermediate screen on/off changes.

In patch 4, DPMS functionality is reduced to on an off. The DPMS helper
function implemements on, off, suspend and standby. In atomic modesetting,
only on and off is required.

Tested on G200SE HW with Xorg, Weston and fbdev.

Thomas Zimmermann (7):
  drm/mgag200: Don't write-protect CRTC 0-7 while in mga_crtc_prepare()
  drm/mgag200: Move PLL setup out of mode-setting function
  drm/mgag200: Don't set or clear <scroff> field during modeset
  drm/mgag200: Split DPMS function into helpers
  drm/mgag200: Set/clear <syncrst> field in display enable/disable
    helpers
  drm/mgag200: Rename G200WB prepare/commit function
  drm/mgag200: Inline mga_crtc_{prepare,commit}() into enable function

 drivers/gpu/drm/mgag200/mgag200_drv.h  |   6 +
 drivers/gpu/drm/mgag200/mgag200_mode.c | 168 +++++++++----------------
 drivers/gpu/drm/mgag200/mgag200_reg.h  |  11 ++
 3 files changed, 76 insertions(+), 109 deletions(-)

--
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
