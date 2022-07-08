Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F1E56BE9C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACAB10EBC7;
	Fri,  8 Jul 2022 18:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79C910EBCD
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:38 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by laurent.telenet-ops.be with bizsmtp
 id siMd270054C55Sk01iMdqP; Fri, 08 Jul 2022 20:21:38 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbg-002fKn-LO; Fri, 08 Jul 2022 20:21:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbg-00BtPi-4r; Fri, 08 Jul 2022 20:21:36 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/5] drm/modes: Extract drm_mode_parse_cmdline_named_mode()
Date: Fri,  8 Jul 2022 20:21:26 +0200
Message-Id: <402dea47269f2e3960946d186ba3cb118066e74a.1657301107.git.geert@linux-m68k.org>
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

Extract the code to check for a named mode parameter into its own
function, to streamline the main parsing flow.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/gpu/drm/drm_modes.c | 41 +++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 30a7be97707bfb16..434383469e9d984d 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1749,6 +1749,30 @@ static const char * const drm_named_modes_whitelist[] = {
 	"PAL",
 };
 
+static int drm_mode_parse_cmdline_named_mode(const char *name,
+					     unsigned int length,
+					     bool refresh,
+					     struct drm_cmdline_mode *mode)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
+		ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
+		if (!ret)
+			continue;
+
+		if (refresh)
+			return -EINVAL; /* named + refresh is invalid */
+
+		strcpy(mode->name, drm_named_modes_whitelist[i]);
+		mode->specified = true;
+		return 0;
+	}
+
+	return 0;
+}
+
 /**
  * drm_mode_parse_command_line_for_connector - parse command line modeline for connector
  * @mode_option: optional per connector mode option
@@ -1785,7 +1809,7 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 	const char *bpp_ptr = NULL, *refresh_ptr = NULL, *extra_ptr = NULL;
 	const char *options_ptr = NULL;
 	char *bpp_end_ptr = NULL, *refresh_end_ptr = NULL;
-	int i, len, ret;
+	int len, ret;
 
 	memset(mode, 0, sizeof(*mode));
 	mode->panel_orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
@@ -1823,16 +1847,11 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 	}
 
 	/* First check for a named mode */
-	for (i = 0; mode_end && i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
-		ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
-		if (ret) {
-			if (refresh_ptr)
-				return false; /* named + refresh is invalid */
-
-			strcpy(mode->name, drm_named_modes_whitelist[i]);
-			mode->specified = true;
-			break;
-		}
+	if (mode_end) {
+		ret = drm_mode_parse_cmdline_named_mode(name, mode_end,
+							refresh_ptr, mode);
+		if (ret)
+			return false;
 	}
 
 	/* No named mode? Check for a normal mode argument, e.g. 1024x768 */
-- 
2.25.1

