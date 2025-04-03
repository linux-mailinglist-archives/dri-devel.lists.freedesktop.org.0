Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09547A7AB4A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 21:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A0F10EB19;
	Thu,  3 Apr 2025 19:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MOw29Imm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439B110EB19
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 19:19:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9F4724400C;
 Thu,  3 Apr 2025 19:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40DBC4CEE3;
 Thu,  3 Apr 2025 19:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743707975;
 bh=Aukq3tmQCLJmA1gdRb8cjrzyv0lX691slKjdUWkiyqo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MOw29Imm1PZjPBrONBcENM1gL/ls29M2ilwzx4KLNkVIaFfD+H4LQ+u/69Ckpbfqv
 Xv123dkxYtB3cAtIdHkOVNo9GXc2rAPMFO7g017hfybo0UNxm83N1BVx3lbBdjFJyP
 iW6QOQucWyuFEViGK4qra87caym+O6MUHx0M/PBkrVUnSxCV9x4CFeGiWeTxXspXYh
 eJAnX4+G0hfetn/yECKmLYnhEKAYnw/ZGLc/SJVNraX+nUzyC2JPhd1yg8KJFwIy2H
 GSqa0QEwQaAHFAajNzbCSbU05g+L45bf5muw+taBS/T+zJBAh9Ac2AjDtmlb3TQOtr
 Ipno7tkOvP/3g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Sasha Levin <sashal@kernel.org>,
 neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 08/20] drm/bridge: panel: forbid initializing a
 panel with unknown connector type
Date: Thu,  3 Apr 2025 15:19:01 -0400
Message-Id: <20250403191913.2681831-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191913.2681831-1-sashal@kernel.org>
References: <20250403191913.2681831-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.132
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

[ Upstream commit b296955b3a740ecc8b3b08e34fd64f1ceabb8fb4 ]

Having an DRM_MODE_CONNECTOR_Unknown connector type is considered bad, and
drm_panel_bridge_add_typed() and derivatives are deprecated for this.

drm_panel_init() won't prevent initializing a panel with a
DRM_MODE_CONNECTOR_Unknown connector type. Luckily there are no in-tree
users doing it, so take this as an opportinuty to document a valid
connector type must be passed.

Returning an error if this rule is violated is not possible because
drm_panel_init() is a void function. Add at least a warning to make any
violations noticeable, especially to non-upstream drivers.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Robert Foss <rfoss@kernel.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20250214-drm-assorted-cleanups-v7-5-88ca5827d7af@bootlin.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_panel.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 7fd3de89ed079..acd29b4f43f84 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -49,7 +49,7 @@ static LIST_HEAD(panel_list);
  * @dev: parent device of the panel
  * @funcs: panel operations
  * @connector_type: the connector type (DRM_MODE_CONNECTOR_*) corresponding to
- *	the panel interface
+ *	the panel interface (must NOT be DRM_MODE_CONNECTOR_Unknown)
  *
  * Initialize the panel structure for subsequent registration with
  * drm_panel_add().
@@ -57,6 +57,9 @@ static LIST_HEAD(panel_list);
 void drm_panel_init(struct drm_panel *panel, struct device *dev,
 		    const struct drm_panel_funcs *funcs, int connector_type)
 {
+	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
+		DRM_WARN("%s: %s: a valid connector type is required!\n", __func__, dev_name(dev));
+
 	INIT_LIST_HEAD(&panel->list);
 	panel->dev = dev;
 	panel->funcs = funcs;
-- 
2.39.5

