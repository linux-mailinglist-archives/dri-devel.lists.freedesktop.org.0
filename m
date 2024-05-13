Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5778C4435
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 17:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D3910E840;
	Mon, 13 May 2024 15:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="cw4tRIsd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com
 [95.215.58.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EE510E840
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 15:31:38 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715614296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iDFYXwTyTrz+GVTosm5TTL0X5z5slov+AkciH3erF0Y=;
 b=cw4tRIsdJz9b1hZUYpylnVeS3YuHdagO7osHbd96/U6R0w3jlXpGYMVZ8ET5QL0p6hWQUY
 V4K56+7jLQ0Hc+i5z2Kmu+hEMA6CgLc8OLZgTGCda5zmYkfGmtzdBRuVr3G6Yq+3IAdpRc
 LUqoYXZiY1D2ML2QT/FRax/EQfVZB5w=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Douglas Anderson <dianders@chromium.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, Sui Jingfeng <sui.jingfeng@linux.dev>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 05/12] drm/bridge: it6505: Remove a redundant check on
 existence of bridge->encoder
Date: Mon, 13 May 2024 23:31:02 +0800
Message-ID: <20240513153109.46786-6-sui.jingfeng@linux.dev>
In-Reply-To: <20240513153109.46786-1-sui.jingfeng@linux.dev>
References: <20240513153109.46786-1-sui.jingfeng@linux.dev>
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

In it6505_bridge_attach(), the check on the existence of 'bridge->encoder'
is not necessary, as it has already been checked in the drm_bridge_attach()
which happens prior to it6505_bridge_attach() get called. Note that the
it6505_bridge_attach() will only be called by .attach() of the previous
bridge or KMS driver. The previous drm_bridge_attach() will quit with a
negative error code returned if it fails for some reasons. Hence, it is
guaranteed that the .encoder member of the drm_bridge instance is not NULL
when it6505_bridge_attach() function get called.

Remove the redundant checking codes "if (!bridge->encoder) { ... }".

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 3f68c82888c2..469157341f3a 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2882,11 +2882,6 @@ static int it6505_bridge_attach(struct drm_bridge *bridge,
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

