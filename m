Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F745F63E8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 11:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE4A10E2F1;
	Thu,  6 Oct 2022 09:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BD010E09D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 09:53:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1397521990;
 Thu,  6 Oct 2022 09:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665050037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1em5hesKWRhJLTzm0Qb6KGTTmCVg0SINRlWYQ8jR+Qo=;
 b=vYEgE8CtVNIJ55kOgyL/PE4dVX1EQk2pnVhoDLytPIqp6nga1N5tcROUWAnZdY3QnHtQMA
 IrKFAtKEeQH38hHpP3A1y60C6HgrIvFqWSNqgdo8GsEtX+enbAdkc+HnmSeXuiBoZDBz6x
 wJm02tucg+apja6ZV6f9uMX4Jnt4bWQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665050037;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1em5hesKWRhJLTzm0Qb6KGTTmCVg0SINRlWYQ8jR+Qo=;
 b=Tty1qvkhN67VZ8KmOh5XwobeDxkO8ouHGmmUiHRiJ9V6VwPtc8kpyu7ecr+rAKej03WZgw
 oTk9px7HM2f++8Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E0F1B13ACC;
 Thu,  6 Oct 2022 09:53:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kAEaNrSlPmNnYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Oct 2022 09:53:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch
Subject: [PATCH v2 01/16] drm/udl: Rename struct udl_drm_connector to struct
 udl_connector
Date: Thu,  6 Oct 2022 11:53:40 +0200
Message-Id: <20221006095355.23579-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006095355.23579-1-tzimmermann@suse.de>
References: <20221006095355.23579-1-tzimmermann@suse.de>
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
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
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

