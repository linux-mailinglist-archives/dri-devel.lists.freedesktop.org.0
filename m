Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F618C31C4
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 16:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB44010E0EF;
	Sat, 11 May 2024 14:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="M/Vq35uZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com
 [91.218.175.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F6E10E0EF
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 14:11:06 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715436664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=a8dPyaiCOoPY+Q3gecWjt41rdV234ZLMDok9YAx2su8=;
 b=M/Vq35uZifBgcnTC/F4xsKyYQDfznva+NcK89//UhM+bURMQYzJ7aA92POckzjBp8cNQjZ
 UTw51PJgIczbbzktCRAQpzXbG4gTEQbjKtoKWIJKOf2KdIsop22c5I1QQJZen2WDaHyNEI
 dbYZVXTIjyiIQ8Ofv7YSaM3RAVI9ExY=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH] drm/bridge: it6505: Remove a redundant check on existence of
 bridge->encoder
Date: Sat, 11 May 2024 22:10:56 +0800
Message-ID: <20240511141056.318679-1-sui.jingfeng@linux.dev>
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

In it6505_bridge_attach(), the check on the existence of bridge->encoder
has already been done in the implementation of drm_bridge_attach(). And
it is done before the bridge->funcs->attach function hook is called. Hence,
it is guaranteed that the .encoder member of the struct drm_bridge is not
NULL when the panel_bridge_attach() is called.

There is no need to check the existence of bridge->encoder another time,
remove the redundant checking codes "if (!bridge->encoder) { ... }".

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 27334173e911..494030a75dba 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2881,11 +2881,6 @@ static int it6505_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (!bridge->encoder) {
-		dev_err(dev, "Parent encoder object not found");
-		return -ENODEV;
-	}
-
 	/* Register aux channel */
 	it6505->aux.drm_dev = bridge->dev;
 
-- 
2.43.0

