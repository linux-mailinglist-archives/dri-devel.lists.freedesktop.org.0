Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CD44651B2
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 16:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E98B6EDF8;
	Wed,  1 Dec 2021 15:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405576EDFB
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 15:31:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DA22D1FD5C;
 Wed,  1 Dec 2021 15:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638372661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nN7HSD8tPKdam7jUafO04ykvVpcE+ftmiwmvuzkzwZ0=;
 b=Ykn0MzoAH4oAfbd6HZquFWR/6+O6wsvNiMACNM4AB6IfYcRPhVyTzbSp0Q0A4J0jgiEHol
 1lS75pe07sXQa6sZ/qowdCiCab+aTv/TkpFI9ynYDD6+670va2zRFYSuuXqVXf04VsSXmP
 HN5MCYP2QsSxHAQB6tRQ+8wY1iBdDIs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638372661;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nN7HSD8tPKdam7jUafO04ykvVpcE+ftmiwmvuzkzwZ0=;
 b=9CYtB3OaRRmSFWbssij1jm7D36zqDuCo8PJkhBtkFATByaiOg947UBMdb0FuF1fv3kYMm5
 XWux/FlARcs/juCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B6F291401C;
 Wed,  1 Dec 2021 15:31:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eDenKzWVp2GkfwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Dec 2021 15:31:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	daniel@ffwll.ch,
	sam@ravnborg.org
Subject: [PATCH 1/3] drm/ast: Handle failed I2C initialization gracefully
Date: Wed,  1 Dec 2021 16:30:58 +0100
Message-Id: <20211201153100.403-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211201153100.403-1-tzimmermann@suse.de>
References: <20211201153100.403-1-tzimmermann@suse.de>
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

I2C initialization is allowed to fail. In this case, create a connector
without DDC adapter. The current code would dereference a NULL pointer.

Reading the modes from the connector is supposed to work without I2C
adapter. Add the respective test.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 1e30eaeb0e1b..3f0c8c1f9777 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1226,7 +1226,7 @@ static int ast_get_modes(struct drm_connector *connector)
 		else
 			kfree(edid);
 	}
-	if (!flags)
+	if (!flags && ast_connector->i2c)
 		edid = drm_get_edid(connector, &ast_connector->i2c->adapter);
 	if (edid) {
 		drm_connector_update_edid_property(&ast_connector->base, edid);
@@ -1332,10 +1332,13 @@ static int ast_connector_init(struct drm_device *dev)
 	if (!ast_connector->i2c)
 		drm_err(dev, "failed to add ddc bus for connector\n");
 
-	drm_connector_init_with_ddc(dev, connector,
-				    &ast_connector_funcs,
-				    DRM_MODE_CONNECTOR_VGA,
-				    &ast_connector->i2c->adapter);
+	if (ast_connector->i2c)
+		drm_connector_init_with_ddc(dev, connector, &ast_connector_funcs,
+					    DRM_MODE_CONNECTOR_VGA,
+					    &ast_connector->i2c->adapter);
+	else
+		drm_connector_init(dev, connector, &ast_connector_funcs,
+				   DRM_MODE_CONNECTOR_VGA);
 
 	drm_connector_helper_add(connector, &ast_connector_helper_funcs);
 
-- 
2.34.0

