Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D79C88BB113
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 18:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C50F113150;
	Fri,  3 May 2024 16:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="qE76TYkP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [95.215.58.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDBB113149
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 16:42:06 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714754525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FGxG50yC0CK36/qDO6i3sCZYl6lVuSyFdQFoLVbb7hE=;
 b=qE76TYkPHJUNZX0+NzadigGzNT+dJbx7TLDCism8XE63avWp7zQ2Ll64tuUAT0e809Zxvk
 w6GIX3DQ5ltVk2kn6xhbqjeyZQMLNu49hrHDyG571z0mA2Z6OkE+5R7GZLxwRg/ECB0u79
 vG+vltyYLhipnwHrO6T6B1xvdvVi0xI=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v5 10/10] drm/bridge: anx7688: Switch to use
 drm_bridge_set_node() helper
Date: Sat,  4 May 2024 00:41:06 +0800
Message-Id: <20240503164106.1172650-11-sui.jingfeng@linux.dev>
In-Reply-To: <20240503164106.1172650-1-sui.jingfeng@linux.dev>
References: <20240503164106.1172650-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Switch to use the freshly created drm_bridge_set_node() helper, because
fwnode APIs can be used to abstract DT dependent APIs away. As the fwnode
APIs has wider coverage than DT counterpart, driver don't have to bear
the burden of "OF dependent", let the core take the resposibility. No
functional changes.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/cros-ec-anx7688.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cros-ec-anx7688.c b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
index c8abd9920fee..30b27b808e02 100644
--- a/drivers/gpu/drm/bridge/cros-ec-anx7688.c
+++ b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
@@ -98,6 +98,7 @@ static const struct drm_bridge_funcs cros_ec_anx7688_bridge_funcs = {
 static int cros_ec_anx7688_bridge_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct cros_ec_anx7688 *anx7688;
 	u16 vendor, device, fw_version;
 	u8 buffer[4];
@@ -143,7 +144,7 @@ static int cros_ec_anx7688_bridge_probe(struct i2c_client *client)
 	fw_version = (u16)buffer[0] << 8 | buffer[1];
 	dev_info(dev, "ANX7688 firmware version 0x%04x\n", fw_version);
 
-	anx7688->bridge.of_node = dev->of_node;
+	drm_bridge_set_node(&anx7688->bridge, fwnode);
 
 	/* FW version >= 0.85 supports bandwidth/lane count registers */
 	if (fw_version >= ANX7688_MINIMUM_FW_VERSION)
-- 
2.34.1

