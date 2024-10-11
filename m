Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2BF999D46
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 08:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA70C10EA4B;
	Fri, 11 Oct 2024 06:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D122610EA4A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 06:57:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9EF811F829;
 Fri, 11 Oct 2024 06:57:09 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60F781370C;
 Fri, 11 Oct 2024 06:57:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wIhaFkXMCGcRfAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Oct 2024 06:57:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, jani.nikula@linux.intel.com, airlied@redhat.com,
 jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/7] drm: Add physical status to connector
Date: Fri, 11 Oct 2024 08:43:07 +0200
Message-ID: <20241011065705.6728-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241011065705.6728-1-tzimmermann@suse.de>
References: <20241011065705.6728-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 9EF811F829
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
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

Track the connector's physical status in addition to its logical
status. The latter is directly derived from the former and for most
connectors both values are in sync.

Server chips with BMC, such as Aspeed, Matrox and HiSilicon, often
provide virtual outputs for remote management. Without a connected
display, fbcon or userspace compositors disabek the output and stop
displaying to the BMC.

Connectors have therefore to remain in connected status, even if the
display has been physically disconnected. Tracking both physical and
logical state in separate fields will enable that. The physical status
is transparent to drivers and clients, but changes update the epoch
counter. This generates a hotplug events for clients. Clients will then
pick up changes to resolutions supported, if any.

The ast driver already contains code to track the physical status. This
commit generalizes the logic for use with other drivers. Candidates are
mgag200 and hibmc.

This commit adds the physical status and makes the regular, logical
status a copy of it. A later change will add the flag for BMC support.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_connector.c    |  1 +
 drivers/gpu/drm/drm_probe_helper.c | 13 ++++++++-----
 include/drm/drm_connector.h        |  7 +++++++
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index fc35f47e2849..901d73416f98 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -282,6 +282,7 @@ static int __drm_connector_init(struct drm_device *dev,
 	connector->edid_blob_ptr = NULL;
 	connector->epoch_counter = 0;
 	connector->tile_blob_ptr = NULL;
+	connector->physical_status = connector_status_unknown;
 	connector->status = connector_status_unknown;
 	connector->display_info.panel_orientation =
 		DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 62a2e5bcb315..df44be128e72 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -373,7 +373,7 @@ drm_helper_probe_detect_ctx(struct drm_connector *connector, bool force)
 	if (WARN_ON(ret < 0))
 		ret = connector_status_unknown;
 
-	if (ret != connector->status)
+	if (ret != connector->physical_status)
 		connector->epoch_counter += 1;
 
 	drm_modeset_drop_locks(&ctx);
@@ -409,7 +409,7 @@ drm_helper_probe_detect(struct drm_connector *connector,
 
 	ret = detect_connector_status(connector, ctx, force);
 
-	if (ret != connector->status)
+	if (ret != connector->physical_status)
 		connector->epoch_counter += 1;
 
 	return ret;
@@ -588,9 +588,11 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 	if (connector->force) {
 		if (connector->force == DRM_FORCE_ON ||
 		    connector->force == DRM_FORCE_ON_DIGITAL)
-			connector->status = connector_status_connected;
+			connector->physical_status = connector_status_connected;
 		else
-			connector->status = connector_status_disconnected;
+			connector->physical_status = connector_status_disconnected;
+		connector->status = connector->physical_status;
+
 		if (connector->funcs->force)
 			connector->funcs->force(connector);
 	} else {
@@ -602,7 +604,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 		} else if (WARN(ret < 0, "Invalid return value %i for connector detection\n", ret))
 			ret = connector_status_unknown;
 
-		connector->status = ret;
+		connector->physical_status = ret;
+		connector->status = connector->physical_status;
 	}
 
 	/*
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index e3fa43291f44..37e951f04ae8 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1817,6 +1817,13 @@ struct drm_connector {
 	 */
 	struct list_head modes;
 
+	/**
+	 * @physical_status:
+	 * One of the drm_connector_status enums (connected, not, or unknown).
+	 * Protected by &drm_mode_config.mutex.
+	 */
+	enum drm_connector_status physical_status;
+
 	/**
 	 * @status:
 	 * One of the drm_connector_status enums (connected, not, or unknown).
-- 
2.46.0

