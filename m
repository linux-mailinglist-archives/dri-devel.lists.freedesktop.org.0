Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7B354DB6D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 09:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C440C10EBFA;
	Thu, 16 Jun 2022 07:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 366 seconds by postgrey-1.36 at gabe;
 Thu, 16 Jun 2022 06:48:37 UTC
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB2410FFD0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 06:48:37 +0000 (UTC)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net ((D)) with ASMTP (SSL) id KCG00125;
 Thu, 16 Jun 2022 14:42:25 +0800
Received: from localhost.localdomain (10.200.104.97) by
 jtjnmail201601.home.langchao.com (10.100.2.1) with Microsoft SMTP Server id
 15.1.2308.27; Thu, 16 Jun 2022 14:42:18 +0800
From: Bo Liu <liubo03@inspur.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/connector: Remove usage of the deprecated ida_simple_xxx
 API
Date: Thu, 16 Jun 2022 01:18:29 -0400
Message-ID: <20220616051829.4071-1-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.200.104.97]
tUid: 20226161442258a626e91cc77798f89a1e77992f45337
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Mailman-Approved-At: Thu, 16 Jun 2022 07:22:25 +0000
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
Cc: Bo Liu <liubo03@inspur.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use ida_alloc_xxx()/ida_free() instead of
ida_simple_get()/ida_simple_remove().
The latter is deprecated and more verbose.

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 drivers/gpu/drm/drm_connector.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 1c48d162c77e..e3484b115ae6 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -250,7 +250,7 @@ int drm_connector_init(struct drm_device *dev,
 	connector->funcs = funcs;
 
 	/* connector index is used with 32bit bitmasks */
-	ret = ida_simple_get(&config->connector_ida, 0, 32, GFP_KERNEL);
+	ret = ida_alloc_max(&config->connector_ida, 31, GFP_KERNEL);
 	if (ret < 0) {
 		DRM_DEBUG_KMS("Failed to allocate %s connector index: %d\n",
 			      drm_connector_enum_list[connector_type].name,
@@ -262,7 +262,7 @@ int drm_connector_init(struct drm_device *dev,
 
 	connector->connector_type = connector_type;
 	connector->connector_type_id =
-		ida_simple_get(connector_ida, 1, 0, GFP_KERNEL);
+		ida_alloc_min(connector_ida, 1, GFP_KERNEL);
 	if (connector->connector_type_id < 0) {
 		ret = connector->connector_type_id;
 		goto out_put_id;
@@ -322,10 +322,10 @@ int drm_connector_init(struct drm_device *dev,
 	connector->debugfs_entry = NULL;
 out_put_type_id:
 	if (ret)
-		ida_simple_remove(connector_ida, connector->connector_type_id);
+		ida_free(connector_ida, connector->connector_type_id);
 out_put_id:
 	if (ret)
-		ida_simple_remove(&config->connector_ida, connector->index);
+		ida_free(&config->connector_ida, connector->index);
 out_put:
 	if (ret)
 		drm_mode_object_unregister(dev, &connector->base);
@@ -479,10 +479,10 @@ void drm_connector_cleanup(struct drm_connector *connector)
 	list_for_each_entry_safe(mode, t, &connector->modes, head)
 		drm_mode_remove(connector, mode);
 
-	ida_simple_remove(&drm_connector_enum_list[connector->connector_type].ida,
+	ida_free(&drm_connector_enum_list[connector->connector_type].ida,
 			  connector->connector_type_id);
 
-	ida_simple_remove(&dev->mode_config.connector_ida,
+	ida_free(&dev->mode_config.connector_ida,
 			  connector->index);
 
 	kfree(connector->display_info.bus_formats);
-- 
2.27.0

