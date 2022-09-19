Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452AE5BCC79
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 15:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B50610E298;
	Mon, 19 Sep 2022 13:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6824D10E298
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 13:04:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4A1F52214C;
 Mon, 19 Sep 2022 13:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663592652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Z2K9/RzQtGok/oGJt1z8+SWckYdZyBgJC+89r8EKs0=;
 b=ZsEyvi2kSzV+AlOn4fZJ8B9pDxeT/UKlvT3aYoy1EkkYJsJT4Lmeit8cb1ZgkXZNQSRmQM
 oPDrTxz2xoQ7ESJ4lXxazkwdef5JTx2m/RzXgopLG4abAeRxlr0f4D/YoD/7jdYGkSxq+f
 AqV4mATnO/cfJdendF/nHQan5XyOQYw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663592652;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Z2K9/RzQtGok/oGJt1z8+SWckYdZyBgJC+89r8EKs0=;
 b=kRCkl2Agq3JE/kyEKiB54HQ9N8Ci7O1qk1Ix8zjvZ6GvpRMdXK7pD+GBifhimMkXyR/Mjy
 eBCVYodwhFAWgTBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2420F13A96;
 Mon, 19 Sep 2022 13:04:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ONq4B8xoKGMzOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Sep 2022 13:04:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	daniel@ffwll.ch
Subject: [PATCH 02/16] drm/udl: Test pixel limit in mode-config's mode-valid
 function
Date: Mon, 19 Sep 2022 15:03:54 +0200
Message-Id: <20220919130408.21486-3-tzimmermann@suse.de>
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

The sku_pixel_limit is a per-device property, similar to the amount
of available video memory. Move the respective mode-valid test from
the connector to the mode-config structure.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_connector.c | 14 --------------
 drivers/gpu/drm/udl/udl_modeset.c   | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl/udl_connector.c
index 3c8068626384..e9539829032c 100644
--- a/drivers/gpu/drm/udl/udl_connector.c
+++ b/drivers/gpu/drm/udl/udl_connector.c
@@ -54,19 +54,6 @@ static int udl_get_modes(struct drm_connector *connector)
 	return 0;
 }
 
-static enum drm_mode_status udl_mode_valid(struct drm_connector *connector,
-			  struct drm_display_mode *mode)
-{
-	struct udl_device *udl = to_udl(connector->dev);
-	if (!udl->sku_pixel_limit)
-		return 0;
-
-	if (mode->vdisplay * mode->hdisplay > udl->sku_pixel_limit)
-		return MODE_VIRTUAL_Y;
-
-	return 0;
-}
-
 static enum drm_connector_status
 udl_detect(struct drm_connector *connector, bool force)
 {
@@ -97,7 +84,6 @@ static void udl_connector_destroy(struct drm_connector *connector)
 
 static const struct drm_connector_helper_funcs udl_connector_helper_funcs = {
 	.get_modes = udl_get_modes,
-	.mode_valid = udl_mode_valid,
 };
 
 static const struct drm_connector_funcs udl_connector_funcs = {
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index ec6876f449f3..c7adc29a53a1 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -407,8 +407,22 @@ static const struct drm_simple_display_pipe_funcs udl_simple_display_pipe_funcs
  * Modesetting
  */
 
+static enum drm_mode_status udl_mode_config_mode_valid(struct drm_device *dev,
+						       const struct drm_display_mode *mode)
+{
+	struct udl_device *udl = to_udl(dev);
+
+	if (udl->sku_pixel_limit) {
+		if (mode->vdisplay * mode->hdisplay > udl->sku_pixel_limit)
+			return MODE_MEM;
+	}
+
+	return MODE_OK;
+}
+
 static const struct drm_mode_config_funcs udl_mode_funcs = {
 	.fb_create = drm_gem_fb_create_with_dirty,
+	.mode_valid = udl_mode_config_mode_valid,
 	.atomic_check  = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
-- 
2.37.3

