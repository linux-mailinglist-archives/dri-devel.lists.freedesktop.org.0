Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B9A4693BF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E207AC65;
	Mon,  6 Dec 2021 10:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B1F72DA4
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 09:11:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 92EEE1FD59;
 Mon,  6 Dec 2021 09:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638781889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VhubsVGX+tZLv/vKMsGrHoKMHW45cQIpb83eJfKk5N4=;
 b=DQQYNGo3zchlMIQztmZExUuWPovZSNRp1OTBPWDgk+NQnJNqc3+UidQOacvxQ1y+kAbBXk
 aDiRgxdN5UwSa0VkaazanCps99Q5hA3w9bBCzZvnl+tjyJXmX/OWiZSqApAhK7LvQ/LQ4N
 RFdTFayXMbfQJS9sBhV0D6rhh9kO1g4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638781889;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VhubsVGX+tZLv/vKMsGrHoKMHW45cQIpb83eJfKk5N4=;
 b=DBl37WRKS947it5VrARCTMnekhlyb0IvPCGLMAOUlxgdry97i3uZgljs/APcLu9plvngiu
 V51jx3Q1a+9OVECQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5FF2713B2D;
 Mon,  6 Dec 2021 09:11:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uIh2FsHTrWE8IwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Dec 2021 09:11:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
Subject: [PATCH v2 1/3] drm/ast: Handle failed I2C initialization gracefully
Date: Mon,  6 Dec 2021 10:11:23 +0100
Message-Id: <20211206091125.29501-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211206091125.29501-1-tzimmermann@suse.de>
References: <20211206091125.29501-1-tzimmermann@suse.de>
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

v2:
	* init edid to NULL to avoid uninitialized read

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 1e30eaeb0e1b..692e7a3b3555 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1210,9 +1210,9 @@ static int ast_get_modes(struct drm_connector *connector)
 {
 	struct ast_connector *ast_connector = to_ast_connector(connector);
 	struct ast_private *ast = to_ast_private(connector->dev);
-	struct edid *edid;
-	int ret;
+	struct edid *edid = NULL;
 	bool flags = false;
+	int ret;
 
 	if (ast->tx_chip_type == AST_TX_DP501) {
 		ast->dp501_maxclk = 0xff;
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
2.34.1

