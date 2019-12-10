Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3B41182BA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B416E863;
	Tue, 10 Dec 2019 08:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9777A6E860
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:49:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1D52FAE5E;
 Tue, 10 Dec 2019 08:49:07 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com, noralf@tronnes.org, zboszor@pr.hu
Subject: [PATCH v3 0/9] drm/udl: Convert to simple-pipe helpers and clean up
Date: Tue, 10 Dec 2019 09:48:56 +0100
Message-Id: <20191210084905.5570-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.0
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

With only a single display pipeline and primary plane, udl is perfect
for simple-pipe helpers. Patches 1 to 4 do the convertion. This enables
atomic modesetting for udl devices.

Patches 5 to 8 clean up handling of color depth and framebuffers. With
universal planes that come with simple pipe, display updates can be
implemented with DRM's damage handlers. The primary plane's formats
array allows to export the correct preferred color depth. The original
value was choosen for maximum compatibility, but did not represent the
device's capability.

Patch 9 removes udl's remaining, unused fb code.

The patchset has been tested by running the fb console, X11 and Weston
on a DisplayLink adapter. Posting v3 for (hopefully) final comments.

v3:
	* use symbolic names for blanking ops
	* cosmetic changes
v2:
	* rebased on the recent udl damage-handler patchset
	* moved atomic suspend/resume conversion into separate patch
	* don't call drm_connector_{register,unregister}()

Thomas Zimmermann (9):
  drm/udl: Init connector before encoder and CRTC
  drm/udl: Convert to struct drm_simple_display_pipe
  drm/udl: Switch to atomic suspend/resume helpers
  drm/udl: Inline DPMS code into CRTC enable and disable functions
  drm/udl: Set preferred color depth to 16 bpp
  drm/udl: Convert to drm_atomic_helper_dirtyfb()
  drm/udl: Remove struct udl_device.active_fb_16
  drm/udl: Move udl_handle_damage() into udl_modeset.c
  drm/udl: Remove udl_fb.c

 drivers/gpu/drm/udl/Makefile        |   2 +-
 drivers/gpu/drm/udl/udl_connector.c |  21 +-
 drivers/gpu/drm/udl/udl_drv.c       |  11 +-
 drivers/gpu/drm/udl/udl_drv.h       |  29 +--
 drivers/gpu/drm/udl/udl_encoder.c   |  70 ------
 drivers/gpu/drm/udl/udl_fb.c        | 222 -----------------
 drivers/gpu/drm/udl/udl_main.c      |   3 -
 drivers/gpu/drm/udl/udl_modeset.c   | 369 ++++++++++++++++------------
 8 files changed, 238 insertions(+), 489 deletions(-)
 delete mode 100644 drivers/gpu/drm/udl/udl_encoder.c
 delete mode 100644 drivers/gpu/drm/udl/udl_fb.c

--
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
