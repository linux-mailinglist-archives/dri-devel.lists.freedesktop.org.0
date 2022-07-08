Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D9A56BE9F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01ED10EBCF;
	Fri,  8 Jul 2022 18:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACE310EBC7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:40 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by michel.telenet-ops.be with bizsmtp
 id siMf2700n4C55Sk06iMfjX; Fri, 08 Jul 2022 20:21:40 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbg-002fKp-Nn; Fri, 08 Jul 2022 20:21:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbg-00BtPy-8U; Fri, 08 Jul 2022 20:21:36 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 4/5] drm/modes: Add support for driver-specific named modes
Date: Fri,  8 Jul 2022 20:21:28 +0200
Message-Id: <68923c8a129b6c2a70b570103679a1cf7876bbc2.1657301107.git.geert@linux-m68k.org>
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

The mode parsing code recognizes named modes only if they are explicitly
listed in the internal whitelist, which is currently limited to "NTSC"
and "PAL".

Provide a mechanism for drivers to override this list to support custom
mode names.

Ideally, this list should just come from the driver's actual list of
modes, but connector->probed_modes is not yet populated at the time of
parsing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/gpu/drm/drm_modes.c | 15 +++++++++++----
 include/drm/drm_connector.h | 10 ++++++++++
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 9ce275fbda566b7c..7a00eb6df502e991 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1748,25 +1748,31 @@ static int drm_mode_parse_cmdline_options(const char *str,
 static const char * const drm_named_modes_whitelist[] = {
 	"NTSC",
 	"PAL",
+	NULL
 };
 
 static int drm_mode_parse_cmdline_named_mode(const char *name,
 					     unsigned int length,
 					     bool refresh,
+					     const struct drm_connector *connector,
 					     struct drm_cmdline_mode *mode)
 {
+	const char * const *named_modes_whitelist;
 	unsigned int i;
 	int ret;
 
-	for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
-		ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
+	named_modes_whitelist = connector->named_modes_whitelist ? :
+				drm_named_modes_whitelist;
+
+	for (i = 0; named_modes_whitelist[i]; i++) {
+		ret = str_has_prefix(name, named_modes_whitelist[i]);
 		if (!ret)
 			continue;
 
 		if (refresh)
 			return -EINVAL; /* named + refresh is invalid */
 
-		strcpy(mode->name, drm_named_modes_whitelist[i]);
+		strcpy(mode->name, named_modes_whitelist[i]);
 		mode->specified = true;
 		return 0;
 	}
@@ -1850,7 +1856,8 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 	/* First check for a named mode */
 	if (mode_end) {
 		ret = drm_mode_parse_cmdline_named_mode(name, mode_end,
-							refresh_ptr, mode);
+							refresh_ptr, connector,
+							mode);
 		if (ret)
 			return false;
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 3ac4bf87f2571c4c..6361f8a596c01107 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1659,6 +1659,16 @@ struct drm_connector {
 
 	/** @hdr_sink_metadata: HDR Metadata Information read from sink */
 	struct hdr_sink_metadata hdr_sink_metadata;
+
+	/**
+	 * @named_modes_whitelist:
+	 *
+	 * Optional NULL-terminated array of names to be considered valid mode
+	 * names.  This lets the command line option parser distinguish between
+	 * mode names and freestanding extras and/or options.
+	 * If not set, a set of defaults will be used.
+	 */
+	const char * const *named_modes_whitelist;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)
-- 
2.25.1

