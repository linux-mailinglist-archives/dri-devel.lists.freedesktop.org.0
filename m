Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6544AC0C9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 15:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F9210E480;
	Mon,  7 Feb 2022 14:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED04D10E480
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 14:15:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7973D1F37F;
 Mon,  7 Feb 2022 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644243346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xSoaLvGbnE6644Gm23nTpexkOztdUv8Q+sIFAjAbG40=;
 b=kzaHxUpbx39QYXSWtHDrnqwb7MgxyRs/uwdu+QEsvJ8Xr/+ZmJsNpk4qAZK4GE5p/CsjKZ
 uzTmaX2D6/bxC0nmfhuXeCBYxw7om7hYplNE+i3km1dtMBCD2oC/qFvwqu4qSvIJx2HE4a
 aUeb6mBCdPrukDyp562QsKNh7/V8jvM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644243346;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xSoaLvGbnE6644Gm23nTpexkOztdUv8Q+sIFAjAbG40=;
 b=LcQTvOFK04ZWPu01S3rSRdvqad5wG3L+m7FjZIXKXXh/OqZFAHAhUexHgpG+y/MDMjytBn
 lBhgODxUKkgp+IAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4000A13C28;
 Mon,  7 Feb 2022 14:15:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id INC6DpIpAWKePQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Feb 2022 14:15:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, kuohsiang_chou@aspeedtech.com,
 tommy_huang@aspeedtech.com, jenmin_yuan@aspeedtech.com,
 arc_sung@aspeedtech.com
Subject: [PATCH v2 1/9] drm/ast: Fail if connector initialization fails
Date: Mon,  7 Feb 2022 15:15:36 +0100
Message-Id: <20220207141544.30015-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207141544.30015-1-tzimmermann@suse.de>
References: <20220207141544.30015-1-tzimmermann@suse.de>
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
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index ab52efb15670..51cc6fef1b92 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1322,18 +1322,21 @@ static int ast_connector_init(struct drm_device *dev)
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

