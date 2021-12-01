Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB814651B5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 16:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3FEA6EE05;
	Wed,  1 Dec 2021 15:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0A26EDFB
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 15:31:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3A00F212CB;
 Wed,  1 Dec 2021 15:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638372662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kqppizopGUQZZTVAK87nL2HM76acFAwsYBBjo6CfnN0=;
 b=zSpiZ3ItpX1bxQcVQSQjUUGMQHn5gSFAjJDpY3cHaV/ZLTpt9RdRC6uZPm46TEEsv8p7fn
 WtWe6wk9dbQZhUY8pY//rJOsVOmfnkT+cxGAS09HlEkZIIwA4Nw42XuvxH3V2T4TTJULYe
 ZWGv2lVDJ99+6SQU7trS59YbK5sDxqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638372662;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kqppizopGUQZZTVAK87nL2HM76acFAwsYBBjo6CfnN0=;
 b=/JtdqTssJGP6ITyZw7ZnzezxEJbnm0mMPM5hXiRkOkdMwoJPgkpfz2ofUKJEFULLdH5MAl
 SlfK8vRUtSg2IDCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 120821401C;
 Wed,  1 Dec 2021 15:31:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8JZ1AzaVp2GkfwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Dec 2021 15:31:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	daniel@ffwll.ch,
	sam@ravnborg.org
Subject: [PATCH 3/3] drm/ast: Fail if connector initialization fails
Date: Wed,  1 Dec 2021 16:31:00 +0100
Message-Id: <20211201153100.403-4-tzimmermann@suse.de>
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

Update the connector code to fail if the connector could not be
initialized. The current code just ignored the error and failed
later when the connector was supposed to be used.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index a84dced95440..c988991cad33 100644
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
2.34.0

