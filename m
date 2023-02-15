Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7717E698072
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDA610EB13;
	Wed, 15 Feb 2023 16:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8F110EB0B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 16:15:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C06281FF2C;
 Wed, 15 Feb 2023 16:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676477725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8gebSqb+AhkQ2tf9gv7+vM4PmGbt+tZpVF7/RfH7WTc=;
 b=aDvIWVwRsx9v6VJlK49VPPGTfkvmTWnQ/N7NzSxtlIEOi7AlCT3bqvrwUD3QsdIwL08Avj
 2t8AsRv7H+7e0lxDhKFms8UMOyNa7Y+vgYTvaAC1EMXQ0rKxmSMvxaEiQJJygxNLG8lGmG
 hNRhTk0GB/Pl2WgOBf5JochSnwY1EZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676477725;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8gebSqb+AhkQ2tf9gv7+vM4PmGbt+tZpVF7/RfH7WTc=;
 b=Bq0HU5DRKHm24wZjUBikSexzAr+MCB3osMhGlxBqAacPb7ei54icISyA79wQr6uxxTdyuE
 gct7MsriYdXXnMDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6571F134BA;
 Wed, 15 Feb 2023 16:15:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IDjHFx0F7WNHOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Feb 2023 16:15:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 07/17] drm/cirrus: Move primary-plane format arrays
Date: Wed, 15 Feb 2023 17:15:07 +0100
Message-Id: <20230215161517.5113-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215161517.5113-1-tzimmermann@suse.de>
References: <20230215161517.5113-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the primary plane's format and modifier arrays within the
source file and adapt naming slightly. No functional changes.

Done in preparation of converting cirrus to regular atomic helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/cirrus.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index cc1d45ea1f62..7ca6a897a2b2 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -354,6 +354,17 @@ static int cirrus_check_size(int width, int height,
 /* ------------------------------------------------------------------ */
 /* cirrus display pipe						      */
 
+static const uint32_t cirrus_primary_plane_formats[] = {
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_XRGB8888,
+};
+
+static const uint64_t cirrus_primary_plane_format_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
 static enum drm_mode_status cirrus_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
 						   const struct drm_display_mode *mode)
 {
@@ -428,17 +439,6 @@ static const struct drm_simple_display_pipe_funcs cirrus_pipe_funcs = {
 	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
 };
 
-static const uint32_t cirrus_formats[] = {
-	DRM_FORMAT_RGB565,
-	DRM_FORMAT_RGB888,
-	DRM_FORMAT_XRGB8888,
-};
-
-static const uint64_t cirrus_modifiers[] = {
-	DRM_FORMAT_MOD_LINEAR,
-	DRM_FORMAT_MOD_INVALID
-};
-
 static int cirrus_connector_helper_get_modes(struct drm_connector *connector)
 {
 	int count;
@@ -478,9 +478,9 @@ static int cirrus_pipe_init(struct cirrus_device *cirrus)
 	return drm_simple_display_pipe_init(dev,
 					    &cirrus->pipe,
 					    &cirrus_pipe_funcs,
-					    cirrus_formats,
-					    ARRAY_SIZE(cirrus_formats),
-					    cirrus_modifiers,
+					    cirrus_primary_plane_formats,
+					    ARRAY_SIZE(cirrus_primary_plane_formats),
+					    cirrus_primary_plane_format_modifiers,
 					    connector);
 }
 
-- 
2.39.1

