Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0C6999D47
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 08:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0807110EA4E;
	Fri, 11 Oct 2024 06:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E6510EA4A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 06:57:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5B3BB1F7DB;
 Fri, 11 Oct 2024 06:57:09 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DFF313AAF;
 Fri, 11 Oct 2024 06:57:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iFIQBkXMCGcRfAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Oct 2024 06:57:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, jani.nikula@linux.intel.com, airlied@redhat.com,
 jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/7] drm/probe-helper: Call connector detect functions in
 single helper
Date: Fri, 11 Oct 2024 08:43:06 +0200
Message-ID: <20241011065705.6728-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241011065705.6728-1-tzimmermann@suse.de>
References: <20241011065705.6728-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 5B3BB1F7DB
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the logic to call the connector's detect helper into a single
internal function. Reduces code duplication.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_probe_helper.c | 33 +++++++++++++++---------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 92f21764246f..62a2e5bcb315 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -338,10 +338,23 @@ void drm_kms_helper_poll_reschedule(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_kms_helper_poll_reschedule);
 
+static int detect_connector_status(struct drm_connector *connector,
+				   struct drm_modeset_acquire_ctx *ctx,
+				   bool force)
+{
+	const struct drm_connector_helper_funcs *funcs = connector->helper_private;
+
+	if (funcs->detect_ctx)
+		return funcs->detect_ctx(connector, ctx, force);
+	else if (connector->funcs->detect)
+		return connector->funcs->detect(connector, force);
+
+	return connector_status_connected;
+}
+
 static enum drm_connector_status
 drm_helper_probe_detect_ctx(struct drm_connector *connector, bool force)
 {
-	const struct drm_connector_helper_funcs *funcs = connector->helper_private;
 	struct drm_modeset_acquire_ctx ctx;
 	int ret;
 
@@ -349,14 +362,8 @@ drm_helper_probe_detect_ctx(struct drm_connector *connector, bool force)
 
 retry:
 	ret = drm_modeset_lock(&connector->dev->mode_config.connection_mutex, &ctx);
-	if (!ret) {
-		if (funcs->detect_ctx)
-			ret = funcs->detect_ctx(connector, &ctx, force);
-		else if (connector->funcs->detect)
-			ret = connector->funcs->detect(connector, force);
-		else
-			ret = connector_status_connected;
-	}
+	if (!ret)
+		ret = detect_connector_status(connector, &ctx, force);
 
 	if (ret == -EDEADLK) {
 		drm_modeset_backoff(&ctx);
@@ -390,7 +397,6 @@ drm_helper_probe_detect(struct drm_connector *connector,
 			struct drm_modeset_acquire_ctx *ctx,
 			bool force)
 {
-	const struct drm_connector_helper_funcs *funcs = connector->helper_private;
 	struct drm_device *dev = connector->dev;
 	int ret;
 
@@ -401,12 +407,7 @@ drm_helper_probe_detect(struct drm_connector *connector,
 	if (ret)
 		return ret;
 
-	if (funcs->detect_ctx)
-		ret = funcs->detect_ctx(connector, ctx, force);
-	else if (connector->funcs->detect)
-		ret = connector->funcs->detect(connector, force);
-	else
-		ret = connector_status_connected;
+	ret = detect_connector_status(connector, ctx, force);
 
 	if (ret != connector->status)
 		connector->epoch_counter += 1;
-- 
2.46.0

