Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6706710260
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 03:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3E210E0AB;
	Thu, 25 May 2023 01:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038AE10E625
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 01:29:27 +0000 (UTC)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 25 May 2023 09:29:21 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <tzimmermann@suse.de>, <airlied@redhat.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH v2] drm/ast: Fix modeset failed on DisplayPort
Date: Thu, 25 May 2023 09:29:18 +0800
Message-ID: <20230525012918.11918-1-jammy_huang@aspeedtech.com>
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

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 v2 changes:
  - Fix build error since new struct ast_device is used.
---
 drivers/gpu/drm/ast/ast_mode.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 36374828f6c8..9fcbf540d6fc 100644
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
@@ -1655,10 +1657,18 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
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
 		goto err_kfree;
 
+	mutex_unlock(&ast->ioregs_lock);
+
 	drm_connector_update_edid_property(connector, edid);
 	count = drm_add_edid_modes(connector, edid);
 	kfree(edid);
@@ -1666,6 +1676,7 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 	return count;
 
 err_kfree:
+	mutex_unlock(&ast->ioregs_lock);
 	kfree(edid);
 err_drm_connector_update_edid_property:
 	drm_connector_update_edid_property(connector, NULL);

base-commit: 933174ae28ba72ab8de5b35cb7c98fc211235096
-- 
2.25.1

