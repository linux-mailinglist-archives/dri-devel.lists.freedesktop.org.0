Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD4C9436EB
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 22:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2266B10E6C6;
	Wed, 31 Jul 2024 20:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PdP9yCjo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F84710E6C6
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 20:14:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 992EFCE1812;
 Wed, 31 Jul 2024 20:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8606C116B1;
 Wed, 31 Jul 2024 20:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722456880;
 bh=+JRx7YZVVmat6vfPo2gFiywJDPLdH779FTMjtYnw98k=;
 h=From:To:Cc:Subject:Date:From;
 b=PdP9yCjoLHeWQmDDclv8rVkTxnbNwPeLTuJAoqytzWqQtzob1vH5akCSnbuC5dbmU
 AjHzucZDOw0LD05kvg8kA3Vq+8RM7z7/lNgi8mP/VS/Vl+kmWjS+94Lt3h2mWEdL8H
 7P67K+ByRgplB7CQ/dpP/lk+tI+yzack0Eqtf1COWqe6BWlQZa1tkM87Oq1ApK2Z29
 Gjc+mXeuY99SDeWuGbqYJjcUYRZa+JjUtYhXrAQKbSRgGt8iLjd6QOTN0zInS72CLC
 ToHLXhotuMYepBiHPpudfVrQgGG8CyWzn0FSFva5RDTBqgd6SA4ZxkkLwvrmjXCPCO
 fDURP5oCkqVtg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm: bridge: anx7625: Use of_property_read_variable_u8_array()
Date: Wed, 31 Jul 2024 14:13:59 -0600
Message-ID: <20240731201407.1838385-4-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no need to get the length of an DT array property before
parsing the array. of_property_read_variable_u8_array() takes a minimum
and maximum length and returns the actual length (or error code).

This is part of a larger effort to remove callers of of_get_property()
and similar functions. of_get_property() leaks the DT property data
pointer which is a problem for dynamically allocated nodes which may
be freed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 88e4aa5830f3..a2e9bb485c36 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1647,25 +1647,15 @@ static int anx7625_get_swing_setting(struct device *dev,
 {
 	int num_regs;
 
-	if (of_get_property(dev->of_node,
-			    "analogix,lane0-swing", &num_regs)) {
-		if (num_regs > DP_TX_SWING_REG_CNT)
-			num_regs = DP_TX_SWING_REG_CNT;
-
+	num_regs = of_property_read_variable_u8_array(dev->of_node, "analogix,lane0-swing",
+						      pdata->lane0_reg_data, 1, DP_TX_SWING_REG_CNT);
+	if (num_regs > 0)
 		pdata->dp_lane0_swing_reg_cnt = num_regs;
-		of_property_read_u8_array(dev->of_node, "analogix,lane0-swing",
-					  pdata->lane0_reg_data, num_regs);
-	}
-
-	if (of_get_property(dev->of_node,
-			    "analogix,lane1-swing", &num_regs)) {
-		if (num_regs > DP_TX_SWING_REG_CNT)
-			num_regs = DP_TX_SWING_REG_CNT;
 
+	num_regs = of_property_read_variable_u8_array(dev->of_node, "analogix,lane1-swing",
+						      pdata->lane1_reg_data, 1, DP_TX_SWING_REG_CNT);
+	if (num_regs > 0)
 		pdata->dp_lane1_swing_reg_cnt = num_regs;
-		of_property_read_u8_array(dev->of_node, "analogix,lane1-swing",
-					  pdata->lane1_reg_data, num_regs);
-	}
 
 	return 0;
 }
-- 
2.43.0

