Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 236EF6390B7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 21:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC6C10E796;
	Fri, 25 Nov 2022 20:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD4C10E794
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 20:31:11 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d898:271f:7512:e47f])
 by michel.telenet-ops.be with bizsmtp
 id okX62800N4su47u06kX6c2; Fri, 25 Nov 2022 21:31:09 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oyfLj-001aQ7-Sv; Fri, 25 Nov 2022 21:31:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oyfLj-003Kwy-F9; Fri, 25 Nov 2022 21:31:03 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 1/2] drm/modes: parse_cmdline: Make mode->*specified
 handling more uniform
Date: Fri, 25 Nov 2022 21:31:00 +0100
Message-Id: <a1eb3580021afc5a6a50c8f049d78c66ab8c7177.1669405382.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669405382.git.geert@linux-m68k.org>
References: <cover.1669405382.git.geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Maxime Ripard <maxime@cerno.tech>
---
v3:
  - Add Acked-by,

v2:
  - Add Reviewed-by, Acked-by,
---
 drivers/gpu/drm/drm_modes.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 3c8034a8c27bd25a..45b9e6aab766002a 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1605,6 +1605,7 @@ static int drm_mode_parse_cmdline_res_mode(const char *str, unsigned int length,
 	mode->yres = yres;
 	mode->cvt = cvt;
 	mode->rb = rb;
+	mode->specified = true;
 
 	return 0;
 }
@@ -1921,8 +1922,6 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 						      mode);
 		if (ret)
 			return false;
-
-		mode->specified = true;
 	}
 
 	/* No mode? Check for freestanding extras and/or options */
@@ -1944,8 +1943,6 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 		ret = drm_mode_parse_cmdline_bpp(bpp_ptr, &bpp_end_ptr, mode);
 		if (ret)
 			return false;
-
-		mode->bpp_specified = true;
 	}
 
 	if (refresh_ptr) {
@@ -1953,8 +1950,6 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 						     &refresh_end_ptr, mode);
 		if (ret)
 			return false;
-
-		mode->refresh_specified = true;
 	}
 
 	/*
-- 
2.25.1

