Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34F188B0E8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 21:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81DE10E4A6;
	Mon, 25 Mar 2024 20:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193CC10E2ED
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 20:09:02 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6C2405CB5B;
 Mon, 25 Mar 2024 20:09:00 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 12D5413A71;
 Mon, 25 Mar 2024 20:09:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 4E1RA9zZAWaVcAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Mar 2024 20:09:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, sui.jingfeng@linux.dev,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v6 07/13] drm/ast: Pass AST device to ast_ddc_create()
Date: Mon, 25 Mar 2024 21:06:52 +0100
Message-ID: <20240325200855.21150-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325200855.21150-1-tzimmermann@suse.de>
References: <20240325200855.21150-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.00
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Rspamd-Queue-Id: 6C2405CB5B
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

The DDC code needs the AST device. Pass it to ast_ddc_create() and
avoid an internal upcast. Improves type safety within the DDC code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_ddc.c  | 3 ++-
 drivers/gpu/drm/ast/ast_ddc.h  | 3 ++-
 drivers/gpu/drm/ast/ast_mode.c | 6 ++++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_ddc.c b/drivers/gpu/drm/ast/ast_ddc.c
index c0e5d03c028d8..24b7d589f0d4c 100644
--- a/drivers/gpu/drm/ast/ast_ddc.c
+++ b/drivers/gpu/drm/ast/ast_ddc.c
@@ -110,8 +110,9 @@ static void ast_ddc_release(struct drm_device *dev, void *res)
 	i2c_del_adapter(&ddc->adapter);
 }
 
-struct ast_ddc *ast_ddc_create(struct drm_device *dev)
+struct ast_ddc *ast_ddc_create(struct ast_device *ast)
 {
+	struct drm_device *dev = &ast->base;
 	struct ast_ddc *ddc;
 	struct i2c_adapter *adapter;
 	struct i2c_algo_bit_data *bit;
diff --git a/drivers/gpu/drm/ast/ast_ddc.h b/drivers/gpu/drm/ast/ast_ddc.h
index 071f9be3e27de..d423b144a3458 100644
--- a/drivers/gpu/drm/ast/ast_ddc.h
+++ b/drivers/gpu/drm/ast/ast_ddc.h
@@ -6,6 +6,7 @@
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
 
+struct ast_device;
 struct drm_device;
 
 struct ast_ddc {
@@ -14,6 +15,6 @@ struct ast_ddc {
 	struct i2c_algo_bit_data bit;
 };
 
-struct ast_ddc *ast_ddc_create(struct drm_device *dev);
+struct ast_ddc *ast_ddc_create(struct ast_device *ast);
 
 #endif
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 40cb495acc908..fc73d3b65b2a1 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1388,10 +1388,11 @@ static const struct drm_connector_funcs ast_vga_connector_funcs = {
 
 static int ast_vga_connector_init(struct drm_device *dev, struct drm_connector *connector)
 {
+	struct ast_device *ast = to_ast_device(dev);
 	struct ast_ddc *ddc;
 	int ret;
 
-	ddc = ast_ddc_create(dev);
+	ddc = ast_ddc_create(ast);
 	if (IS_ERR(ddc)) {
 		ret = PTR_ERR(ddc);
 		drm_err(dev, "failed to add DDC bus for connector; ret=%d\n", ret);
@@ -1485,10 +1486,11 @@ static const struct drm_connector_funcs ast_sil164_connector_funcs = {
 
 static int ast_sil164_connector_init(struct drm_device *dev, struct drm_connector *connector)
 {
+	struct ast_device *ast = to_ast_device(dev);
 	struct ast_ddc *ddc;
 	int ret;
 
-	ddc = ast_ddc_create(dev);
+	ddc = ast_ddc_create(ast);
 	if (IS_ERR(ddc)) {
 		ret = PTR_ERR(ddc);
 		drm_err(dev, "failed to add DDC bus for connector; ret=%d\n", ret);
-- 
2.44.0

