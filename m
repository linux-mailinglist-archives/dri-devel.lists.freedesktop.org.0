Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B875C5BCC77
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 15:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2388810E270;
	Mon, 19 Sep 2022 13:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E19710E298
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 13:04:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1FD7C1F8F1;
 Mon, 19 Sep 2022 13:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663592652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U9VxpEvvBa8kQo1bA/4qn3kRvOosfYPYqqL8uT05qW0=;
 b=nP9SfctxcVpKk2d2SkuNGjxHeO9bb4wBYEqVSOzxVozepjwUDGjrMrdf5dcFot+2ZPwKPZ
 ebKNulkmwoBt4aJ4ECNprOgCjjNmW9D/Wgl2amMC5okDOK/c3X/55GvYG+N7vhdv9IWdzE
 y7V2n0z5K1GKCHRc/NDIeHxkCJ4iDUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663592652;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U9VxpEvvBa8kQo1bA/4qn3kRvOosfYPYqqL8uT05qW0=;
 b=urWaIfOKyNzudAe+d26TqggX+swbkwkBRM+tIjuj3Sg0aIaoeLCJMOW8P9jwFvHnxK9zsO
 I30RWxtzY0BMRuBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EF55613ACE;
 Mon, 19 Sep 2022 13:04:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eM+NOctoKGMzOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Sep 2022 13:04:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	daniel@ffwll.ch
Subject: [PATCH 01/16] drm/udl: Rename struct udl_drm_connector to struct
 udl_connector
Date: Mon, 19 Sep 2022 15:03:53 +0200
Message-Id: <20220919130408.21486-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919130408.21486-1-tzimmermann@suse.de>
References: <20220919130408.21486-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the _drm_ infix from struct udl_drm_connector and introduce a
macro for upcasting from struct drm_connector. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_connector.c | 19 +++++--------------
 drivers/gpu/drm/udl/udl_connector.h | 10 ++++++++--
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl/udl_connector.c
index fade4c7adbf7..3c8068626384 100644
--- a/drivers/gpu/drm/udl/udl_connector.c
+++ b/drivers/gpu/drm/udl/udl_connector.c
@@ -46,10 +46,7 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block,
 
 static int udl_get_modes(struct drm_connector *connector)
 {
-	struct udl_drm_connector *udl_connector =
-					container_of(connector,
-					struct udl_drm_connector,
-					connector);
+	struct udl_connector *udl_connector = to_udl_connector(connector);
 
 	drm_connector_update_edid_property(connector, udl_connector->edid);
 	if (udl_connector->edid)
@@ -74,10 +71,7 @@ static enum drm_connector_status
 udl_detect(struct drm_connector *connector, bool force)
 {
 	struct udl_device *udl = to_udl(connector->dev);
-	struct udl_drm_connector *udl_connector =
-					container_of(connector,
-					struct udl_drm_connector,
-					connector);
+	struct udl_connector *udl_connector = to_udl_connector(connector);
 
 	/* cleanup previous edid */
 	if (udl_connector->edid != NULL) {
@@ -94,10 +88,7 @@ udl_detect(struct drm_connector *connector, bool force)
 
 static void udl_connector_destroy(struct drm_connector *connector)
 {
-	struct udl_drm_connector *udl_connector =
-					container_of(connector,
-					struct udl_drm_connector,
-					connector);
+	struct udl_connector *udl_connector = to_udl_connector(connector);
 
 	drm_connector_cleanup(connector);
 	kfree(udl_connector->edid);
@@ -120,10 +111,10 @@ static const struct drm_connector_funcs udl_connector_funcs = {
 
 struct drm_connector *udl_connector_init(struct drm_device *dev)
 {
-	struct udl_drm_connector *udl_connector;
+	struct udl_connector *udl_connector;
 	struct drm_connector *connector;
 
-	udl_connector = kzalloc(sizeof(struct udl_drm_connector), GFP_KERNEL);
+	udl_connector = kzalloc(sizeof(*udl_connector), GFP_KERNEL);
 	if (!udl_connector)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/gpu/drm/udl/udl_connector.h b/drivers/gpu/drm/udl/udl_connector.h
index 7f2d392df173..74ad68fd3cc9 100644
--- a/drivers/gpu/drm/udl/udl_connector.h
+++ b/drivers/gpu/drm/udl/udl_connector.h
@@ -1,15 +1,21 @@
 #ifndef __UDL_CONNECTOR_H__
 #define __UDL_CONNECTOR_H__
 
-#include <drm/drm_crtc.h>
+#include <linux/container_of.h>
+
+#include <drm/drm_connector.h>
 
 struct edid;
 
-struct udl_drm_connector {
+struct udl_connector {
 	struct drm_connector connector;
 	/* last udl_detect edid */
 	struct edid *edid;
 };
 
+static inline struct udl_connector *to_udl_connector(struct drm_connector *connector)
+{
+	return container_of(connector, struct udl_connector, connector);
+}
 
 #endif //__UDL_CONNECTOR_H__
-- 
2.37.3

