Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EA7718FB1
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 02:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAB210E0EE;
	Thu,  1 Jun 2023 00:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878E610E06E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 00:48:55 +0000 (UTC)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 1 Jun 2023 08:48:51 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <tzimmermann@suse.de>, <airlied@redhat.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH v3] drm/ast: Fix modeset failed on DisplayPort
Date: Thu, 1 Jun 2023 08:48:47 +0800
Message-ID: <20230601004847.1115-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we switch display and update cursor together, it could lead to
modeset failed because of concurrent access to IO registers.

Add lock protection in DP's edid access to avoid this problem.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 v3 changes:
  - Update label name after mutex added.
 v2 changes:
  - Fix build error since new struct ast_device is used.
---
 drivers/gpu/drm/ast/ast_mode.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 36374828f6c8..b3c670af6ef2 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1647,6 +1647,8 @@ static int ast_dp501_output_init(struct ast_device *ast)
 static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 {
 	void *edid;
+	struct drm_device *dev = connector->dev;
+	struct ast_device *ast = to_ast_device(dev);
 
 	int succ;
 	int count;
@@ -1655,9 +1657,17 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 	if (!edid)
 		goto err_drm_connector_update_edid_property;
 
+	/*
+	 * Protect access to I/O registers from concurrent modesetting
+	 * by acquiring the I/O-register lock.
+	 */
+	mutex_lock(&ast->ioregs_lock);
+
 	succ = ast_astdp_read_edid(connector->dev, edid);
 	if (succ < 0)
-		goto err_kfree;
+		goto err_mutex_unlock;
+
+	mutex_unlock(&ast->ioregs_lock);
 
 	drm_connector_update_edid_property(connector, edid);
 	count = drm_add_edid_modes(connector, edid);
@@ -1665,7 +1675,8 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 
 	return count;
 
-err_kfree:
+err_mutex_unlock:
+	mutex_unlock(&ast->ioregs_lock);
 	kfree(edid);
 err_drm_connector_update_edid_property:
 	drm_connector_update_edid_property(connector, NULL);

base-commit: e338142b39cf40155054f95daa28d210d2ee1b2d
-- 
2.25.1

