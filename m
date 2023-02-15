Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57684698078
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF5610EB0C;
	Wed, 15 Feb 2023 16:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A038110EB0F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 16:15:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 602E8339A0;
 Wed, 15 Feb 2023 16:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676477725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Td7BEA0MN8XpWW9zByk8L0tyeZNlU1us7NjRcWSUMoM=;
 b=nLmhXgLslKeDw/TKWMVvXVRYuMJ8MkWotFo9Xb8dz8E634L+HaRDbc8LglOoHL7aiIcdf+
 SNSovfyPreowKudcYh4WBc/ifJGI2AduBZSfLs2RC87zRwDu2LMdwvkoJsgl641XO3O18z
 trBBEw6rCiSBs01//ySCGfV/mur9FHw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676477725;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Td7BEA0MN8XpWW9zByk8L0tyeZNlU1us7NjRcWSUMoM=;
 b=oWU/Tww85wr4l4YINwdEjmK6qM4S+a5PEYMfJT+0lq3qcdA8N/mWPygv5FxHegGSbK9sFE
 7sxt+m0rSE8It6Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F1A12134BA;
 Wed, 15 Feb 2023 16:15:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cO/3ORwF7WNHOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Feb 2023 16:15:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 06/17] drm/cirrus: Integrate connector into pipeline code
Date: Wed, 15 Feb 2023 17:15:06 +0100
Message-Id: <20230215161517.5113-7-tzimmermann@suse.de>
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

Integrate the connector with the rest of the pipeline setup code.
Move some helpers within the file and adapt naming slightly. No
functional changes.

Done in preparation of converting cirrus to regular atomic helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/cirrus.c | 80 +++++++++++++++++------------------
 1 file changed, 38 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 60488e49bdb5..cc1d45ea1f62 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -57,7 +57,7 @@
 struct cirrus_device {
 	struct drm_device	       dev;
 	struct drm_simple_display_pipe pipe;
-	struct drm_connector	       conn;
+	struct drm_connector	       connector;
 	const struct drm_format_info   *format;
 	unsigned int		       pitch;
 	void __iomem		       *vram;
@@ -352,41 +352,7 @@ static int cirrus_check_size(int width, int height,
 }
 
 /* ------------------------------------------------------------------ */
-/* cirrus connector						      */
-
-static int cirrus_conn_get_modes(struct drm_connector *conn)
-{
-	int count;
-
-	count = drm_add_modes_noedid(conn,
-				     conn->dev->mode_config.max_width,
-				     conn->dev->mode_config.max_height);
-	drm_set_preferred_mode(conn, 1024, 768);
-	return count;
-}
-
-static const struct drm_connector_helper_funcs cirrus_conn_helper_funcs = {
-	.get_modes = cirrus_conn_get_modes,
-};
-
-static const struct drm_connector_funcs cirrus_conn_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static int cirrus_conn_init(struct cirrus_device *cirrus)
-{
-	drm_connector_helper_add(&cirrus->conn, &cirrus_conn_helper_funcs);
-	return drm_connector_init(&cirrus->dev, &cirrus->conn,
-				  &cirrus_conn_funcs, DRM_MODE_CONNECTOR_VGA);
-
-}
-
-/* ------------------------------------------------------------------ */
-/* cirrus (simple) display pipe					      */
+/* cirrus display pipe						      */
 
 static enum drm_mode_status cirrus_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
 						   const struct drm_display_mode *mode)
@@ -473,15 +439,49 @@ static const uint64_t cirrus_modifiers[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
+static int cirrus_connector_helper_get_modes(struct drm_connector *connector)
+{
+	int count;
+
+	count = drm_add_modes_noedid(connector,
+				     connector->dev->mode_config.max_width,
+				     connector->dev->mode_config.max_height);
+	drm_set_preferred_mode(connector, 1024, 768);
+	return count;
+}
+
+static const struct drm_connector_helper_funcs cirrus_connector_helper_funcs = {
+	.get_modes = cirrus_connector_helper_get_modes,
+};
+
+static const struct drm_connector_funcs cirrus_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
 static int cirrus_pipe_init(struct cirrus_device *cirrus)
 {
-	return drm_simple_display_pipe_init(&cirrus->dev,
+	struct drm_device *dev = &cirrus->dev;
+	struct drm_connector *connector;
+	int ret;
+
+	connector = &cirrus->connector;
+	ret = drm_connector_init(&cirrus->dev, connector, &cirrus_connector_funcs,
+				 DRM_MODE_CONNECTOR_VGA);
+	if (ret)
+		return ret;
+	drm_connector_helper_add(connector, &cirrus_connector_helper_funcs);
+
+	return drm_simple_display_pipe_init(dev,
 					    &cirrus->pipe,
 					    &cirrus_pipe_funcs,
 					    cirrus_formats,
 					    ARRAY_SIZE(cirrus_formats),
 					    cirrus_modifiers,
-					    &cirrus->conn);
+					    connector);
 }
 
 /* ------------------------------------------------------------------ */
@@ -584,10 +584,6 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	ret = cirrus_conn_init(cirrus);
-	if (ret < 0)
-		return ret;
-
 	ret = cirrus_pipe_init(cirrus);
 	if (ret < 0)
 		return ret;
-- 
2.39.1

