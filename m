Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2F2732D8E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 12:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4440810E5DC;
	Fri, 16 Jun 2023 10:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FE910E5DC
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 10:25:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 45792635E4;
 Fri, 16 Jun 2023 10:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54C3C433BD;
 Fri, 16 Jun 2023 10:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686911147;
 bh=ExstxKPrGbziirkucB5PqIckFETFvkocrqw85/Grcv4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VnTJ3de2zeV16ltBQyW4hUPjAz7PtnUC3L2sZD2/JuuIddWi3JspaPCmcKrzn8aWS
 g6EFtmKf0L1nEkC33Gv63ib/xMKF1uDFoGIFVPIGcVOwUvpizX1fd8j+FNb+hmecII
 y7fm+lSC6nRN6EMyDltq5DnsSI5jETufHhdmMHgb4MyC0Vpbc5/S9EZ3uXR+rCOhO4
 9igg3OAZWdgmMO+nyqBKCaG/ZvLE5dvV0r7YnQesTQdWsPHp0BV8cuw2HHfv01sM4Y
 aAHhocB7zmLE0AWgNuCo2YHCrnwK1XR7qa0/xOZZBDuZ5wQt/WVLbV3XdGqTGW6tC1
 XTKcZptHV0xfw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 13/30] drm/ast: Fix modeset failed on DisplayPort
Date: Fri, 16 Jun 2023 06:25:01 -0400
Message-Id: <20230616102521.673087-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616102521.673087-1-sashal@kernel.org>
References: <20230616102521.673087-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.3.8
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
Cc: Sasha Levin <sashal@kernel.org>, Jammy Huang <jammy_huang@aspeedtech.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jammy Huang <jammy_huang@aspeedtech.com>

[ Upstream commit 3692ababa322b4d9ffbd973865bc88018e896fcd ]

If we switch display and update cursor together, it could lead to
modeset failed because of concurrent access to IO registers.

Add lock protection in DP's edid access to avoid this problem.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20230601004847.1115-1-jammy_huang@aspeedtech.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/ast/ast_mode.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 984ec590a7e7d..e267cf9f505b9 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1635,6 +1635,8 @@ static int ast_dp501_output_init(struct ast_private *ast)
 static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 {
 	void *edid;
+	struct drm_device *dev = connector->dev;
+	struct ast_device *ast = to_ast_device(dev);
 
 	int succ;
 	int count;
@@ -1643,9 +1645,17 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
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
@@ -1653,7 +1663,8 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 
 	return count;
 
-err_kfree:
+err_mutex_unlock:
+	mutex_unlock(&ast->ioregs_lock);
 	kfree(edid);
 err_drm_connector_update_edid_property:
 	drm_connector_update_edid_property(connector, NULL);
-- 
2.39.2

