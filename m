Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C4E8C31DA
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 16:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A47410E166;
	Sat, 11 May 2024 14:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="bceFpgC6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com
 [91.218.175.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212F810E166
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 14:30:36 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715437834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8lCE5BMQPZQrEu+DdqUQa+ciyt6sV2leU46hmIRgywE=;
 b=bceFpgC62YkDbNS/v2cATnJkVcA3lhWGkOE64zqb3ABgk66VZE1un2/0/5lGMwOrHOZMML
 xlgBFzdKYFpXs5ZNvidF/AEFeVKT+EBD0xAsIAGY74R2Ubxdjtnx5CsjRfKjjAumwqaEhX
 xgU3ugvwy7yZX+bCEpvXipXhwqkqTjg=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH] drm/bridge: cdns-mhdp8546: Remove a redundant check on
 existence of bridge->encoder
Date: Sat, 11 May 2024 22:30:27 +0800
Message-ID: <20240511143027.320180-1-sui.jingfeng@linux.dev>
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

In the cdns_mhdp_connector_init() function, the check on the existence
of bridge->encoder is not necessary, as it has already been done in the
drm_bridge_attach() function. And the check on the drm bridge core
happens before check in the implementation. Hence, it is guaranteed that
the .encoder member of the struct drm_bridge is not NULL when
adv7511_bridge_attach() function gets called.

Remove the redundant checking codes "if (!bridge->encoder) { ... }".

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index e226acc5c15e..16b58a7dcc54 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1697,11 +1697,6 @@ static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
 	struct drm_bridge *bridge = &mhdp->bridge;
 	int ret;
 
-	if (!bridge->encoder) {
-		dev_err(mhdp->dev, "Parent encoder object not found");
-		return -ENODEV;
-	}
-
 	conn->polled = DRM_CONNECTOR_POLL_HPD;
 
 	ret = drm_connector_init(bridge->dev, conn, &cdns_mhdp_conn_funcs,
-- 
2.43.0

