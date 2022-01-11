Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 543F448AD35
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 13:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8AC10E473;
	Tue, 11 Jan 2022 12:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B4610E473
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 12:01:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8E7FF212CB;
 Tue, 11 Jan 2022 12:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641902461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UV77AdCYbeKumL8Rv40SUIfARnHdRrqjSsLiqSJCjT4=;
 b=hqebEgdaU6LPhXbQOhCaOgj22f5gDIMvu72wQ/o6Q0WZCG6vNUrT+Nts2IyjXz364ycIuB
 q+/a0J54e4siDsriTHC0xdBtXghdayuQP2ijMK21RYld6I93/zfVqjnn3f7Nn8k/z9pQk0
 m0Da2rjBr3wHOgVPGKS48pvrSWIh8dg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641902461;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UV77AdCYbeKumL8Rv40SUIfARnHdRrqjSsLiqSJCjT4=;
 b=CTPjATF7uQeafYTCr7hBtotxMYZSoOG/S6BDBqILaM/RzzQ+s+XEb0Wna4Rzh2K3QyF6jI
 iM0erHzINKeHA6CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 587FC14001;
 Tue, 11 Jan 2022 12:01:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mDKtFH1x3WEeFQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jan 2022 12:01:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
Subject: [PATCH 1/8] drm/ast: Fail if connector initialization fails
Date: Tue, 11 Jan 2022 13:00:51 +0100
Message-Id: <20220111120058.10510-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111120058.10510-1-tzimmermann@suse.de>
References: <20220111120058.10510-1-tzimmermann@suse.de>
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
Cc: jenmin_yuan@aspeedtech.com, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, tommy_huang@aspeedtech.com,
 arc_sung@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the connector code to fail if the connector could not be
initialized. The current code just ignored the error and failed
later when the connector was supposed to be used.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 956c8982192b..20626c78a693 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1319,18 +1319,21 @@ static int ast_connector_init(struct drm_device *dev)
 	struct ast_connector *ast_connector = &ast->connector;
 	struct drm_connector *connector = &ast_connector->base;
 	struct drm_encoder *encoder = &ast->encoder;
+	int ret;
 
 	ast_connector->i2c = ast_i2c_create(dev);
 	if (!ast_connector->i2c)
 		drm_err(dev, "failed to add ddc bus for connector\n");
 
 	if (ast_connector->i2c)
-		drm_connector_init_with_ddc(dev, connector, &ast_connector_funcs,
-					    DRM_MODE_CONNECTOR_VGA,
-					    &ast_connector->i2c->adapter);
+		ret = drm_connector_init_with_ddc(dev, connector, &ast_connector_funcs,
+						  DRM_MODE_CONNECTOR_VGA,
+						  &ast_connector->i2c->adapter);
 	else
-		drm_connector_init(dev, connector, &ast_connector_funcs,
-				   DRM_MODE_CONNECTOR_VGA);
+		ret = drm_connector_init(dev, connector, &ast_connector_funcs,
+					 DRM_MODE_CONNECTOR_VGA);
+	if (ret)
+		return ret;
 
 	drm_connector_helper_add(connector, &ast_connector_helper_funcs);
 
-- 
2.34.1

