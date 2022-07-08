Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6468956BEA1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C542610EBD1;
	Fri,  8 Jul 2022 18:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D71210EBD0
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:46 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by albert.telenet-ops.be with bizsmtp
 id siMk2700F4C55Sk06iMkay; Fri, 08 Jul 2022 20:21:46 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbg-002fKo-MX; Fri, 08 Jul 2022 20:21:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbg-00BtPq-6k; Fri, 08 Jul 2022 20:21:36 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 3/5] drm/modes: parse_cmdline: Make mode->*specified handling
 more uniform
Date: Fri,  8 Jul 2022 20:21:27 +0200
Message-Id: <4bd5f539b686fbcd097fa07cff2eb6f60ca9bec1.1657301107.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657301107.git.geert@linux-m68k.org>
References: <cover.1657301107.git.geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The various mode->*specified flags are not handled in an uniform way:
some flags are set by the corresponding drm_mode_parse_cmdline_*()
function, some flags by the caller of the function, and some flags by
both.

Make this uniform by making this the responsibility of the various
parsing helpers, i.e.
  - Move the setting of mode->specified from caller to callee,
  - Drop the duplicate setting of mode->bpp_specified and
    mode->refresh_specified from callers.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/gpu/drm/drm_modes.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 434383469e9d984d..9ce275fbda566b7c 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1599,6 +1599,7 @@ static int drm_mode_parse_cmdline_res_mode(const char *str, unsigned int length,
 	mode->yres = yres;
 	mode->cvt = cvt;
 	mode->rb = rb;
+	mode->specified = true;
 
 	return 0;
 }
@@ -1862,8 +1863,6 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 						      mode);
 		if (ret)
 			return false;
-
-		mode->specified = true;
 	}
 
 	/* No mode? Check for freestanding extras and/or options */
@@ -1885,8 +1884,6 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 		ret = drm_mode_parse_cmdline_bpp(bpp_ptr, &bpp_end_ptr, mode);
 		if (ret)
 			return false;
-
-		mode->bpp_specified = true;
 	}
 
 	if (refresh_ptr) {
@@ -1894,8 +1891,6 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 						     &refresh_end_ptr, mode);
 		if (ret)
 			return false;
-
-		mode->refresh_specified = true;
 	}
 
 	/*
-- 
2.25.1

