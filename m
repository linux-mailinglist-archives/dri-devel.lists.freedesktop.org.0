Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C54176390AC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 21:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057CC10E0E0;
	Fri, 25 Nov 2022 20:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F18710E0E0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 20:31:10 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d898:271f:7512:e47f])
 by albert.telenet-ops.be with bizsmtp
 id okX62800E4su47u06kX6PU; Fri, 25 Nov 2022 21:31:08 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oyfLj-001aQ8-Se; Fri, 25 Nov 2022 21:31:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oyfLj-003Kx4-Fq; Fri, 25 Nov 2022 21:31:03 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 2/2] drm/modes: Add support for driver-specific named modes
Date: Fri, 25 Nov 2022 21:31:01 +0100
Message-Id: <577fd80ce4b98a5517564eccf7b4dceaf823c545.1669405382.git.geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mode parsing code recognizes named modes only if they are explicitly
listed in the internal named mode list, which is currently limited to
"NTSC" and "PAL".

Provide a mechanism for drivers to override this list to support custom
modes.

Ideally, this list should just come from the driver's actual list of
modes, but connector->probed_modes is not yet populated at the time of
parsing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
I don't expect this patch to be acceptable as-is, but it's a dependency
for posting the RFC Atari DRM driver.

v3:
  - Update for the switch from names to named mode descriptors,

v2:
  - Add Reviewed-by.
---
 drivers/gpu/drm/drm_modes.c | 19 ++++++++-----------
 include/drm/drm_connector.h | 18 ++++++++++++++++++
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 45b9e6aab766002a..9ea928b35e728d13 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1751,14 +1751,6 @@ static int drm_mode_parse_cmdline_options(const char *str,
 	return 0;
 }
 
-struct drm_named_mode {
-	const char *name;
-	unsigned int pixel_clock_khz;
-	unsigned int xres;
-	unsigned int yres;
-	unsigned int flags;
-};
-
 #define NAMED_MODE(_name, _pclk, _x, _y, _flags)	\
 	{						\
 		.name = _name,				\
@@ -1771,12 +1763,15 @@ struct drm_named_mode {
 static const struct drm_named_mode drm_named_modes[] = {
 	NAMED_MODE("NTSC", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE),
 	NAMED_MODE("PAL", 13500, 720, 576, DRM_MODE_FLAG_INTERLACE),
+	{ /* sentinel */ }
 };
 
 static int drm_mode_parse_cmdline_named_mode(const char *name,
 					     unsigned int name_end,
+					     const struct drm_connector *connector,
 					     struct drm_cmdline_mode *cmdline_mode)
 {
+	const struct drm_named_mode *named_modes;
 	unsigned int i;
 
 	if (!name_end)
@@ -1802,8 +1797,9 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
 	 * We're sure we're a named mode at this point, iterate over the
 	 * list of modes we're aware of.
 	 */
-	for (i = 0; i < ARRAY_SIZE(drm_named_modes); i++) {
-		const struct drm_named_mode *mode = &drm_named_modes[i];
+	named_modes = connector->named_modes ? : drm_named_modes;
+	for (i = 0; named_modes[i].name; i++) {
+		const struct drm_named_mode *mode = &named_modes[i];
 		int ret;
 
 		ret = str_has_prefix(name, mode->name);
@@ -1903,7 +1899,8 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 	if (!mode_end)
 		return false;
 
-	ret = drm_mode_parse_cmdline_named_mode(name, mode_end, mode);
+	ret = drm_mode_parse_cmdline_named_mode(name, mode_end, connector,
+						mode);
 	if (ret < 0)
 		return false;
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 565cf9d3c550926f..ff78ac214e475086 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1315,6 +1315,14 @@ struct drm_cmdline_mode {
 	struct drm_connector_tv_margins tv_margins;
 };
 
+struct drm_named_mode {
+	const char *name;
+	unsigned int pixel_clock_khz;
+	unsigned int xres;
+	unsigned int yres;
+	unsigned int flags;
+};
+
 /**
  * struct drm_connector - central DRM connector control structure
  *
@@ -1708,6 +1716,16 @@ struct drm_connector {
 
 	/** @hdr_sink_metadata: HDR Metadata Information read from sink */
 	struct hdr_sink_metadata hdr_sink_metadata;
+
+	/**
+	 * @named_modes:
+	 *
+	 * Optional NULL-terminated array of names to be considered valid mode
+	 * names.  This lets the command line option parser distinguish between
+	 * mode names and freestanding extras and/or options.
+	 * If not set, a set of defaults will be used.
+	 */
+	const struct drm_named_mode *named_modes;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)
-- 
2.25.1

