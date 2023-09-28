Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF747B1BE7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 14:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFCB10E635;
	Thu, 28 Sep 2023 12:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DD210E638
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 12:16:25 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:e207:8adb:af22:7f1e])
 by laurent.telenet-ops.be with bizsmtp
 id rQGH2A00P3w8i7m01QGHJn; Thu, 28 Sep 2023 14:16:22 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qlpvt-004mR5-5A;
 Thu, 28 Sep 2023 14:16:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qlpwH-001OAd-JO;
 Thu, 28 Sep 2023 14:16:17 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/3] drm: Split drm_modeset_helper_vtables.h
Date: Thu, 28 Sep 2023 14:16:10 +0200
Message-Id: <cover.1695903065.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	Hi all,

<drm/drm_modeset_helper_vtables.h> is the second largest header file in
the DRM subsystem, and declares helpers vtables for various DRM
components.  Several vtables contain methods with the same name, and all
but one vtable do not fit on the screen, making it hard to navigate to
the actual method one is interested in.

Hence this patch series splits <drm/drm_modeset_helper_vtables.h> in
multiple header files, one per DRM component, preceded by a few spelling
fix this to avoid checkpatch warnings.  A future patch could replace
inclusion of <drm/drm_modeset_helper_vtables.h> by inclusion of one or
more of the new files, to reduce compilation time.

I marked the last patch RFC, the first two patches can be applied
immediately.

Thanks for your comments!

Geert Uytterhoeven (3):
  drm: Spelling s/hardward/hardware/g
  drm: Spelling s/preceeding/preceding/g
  [RFC] drm: Split drm_modeset_helper_vtables.h

 drivers/gpu/drm/drm_atomic_helper.c         |    4 +-
 include/drm/drm_bridge.h                    |    2 +-
 include/drm/drm_connector_helper_vtable.h   |  364 +++++
 include/drm/drm_crtc_helper_vtable.h        |  483 ++++++
 include/drm/drm_encoder_helper_vtable.h     |  381 +++++
 include/drm/drm_mode_config_helper_vtable.h |   97 ++
 include/drm/drm_modeset_helper_vtables.h    | 1466 +------------------
 include/drm/drm_plane_helper_vtable.h       |  297 ++++
 8 files changed, 1630 insertions(+), 1464 deletions(-)
 create mode 100644 include/drm/drm_connector_helper_vtable.h
 create mode 100644 include/drm/drm_crtc_helper_vtable.h
 create mode 100644 include/drm/drm_encoder_helper_vtable.h
 create mode 100644 include/drm/drm_mode_config_helper_vtable.h
 create mode 100644 include/drm/drm_plane_helper_vtable.h

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
