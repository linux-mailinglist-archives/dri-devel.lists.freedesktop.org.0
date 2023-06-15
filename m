Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 535A6731CA0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 17:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69CA10E08D;
	Thu, 15 Jun 2023 15:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF9C10E08D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 15:28:30 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 78625862AA;
 Thu, 15 Jun 2023 17:28:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1686842905;
 bh=M7iF13PuQEmrGb2wYAeEH5tf5PbQ+j/i58iX/elzJOY=;
 h=From:To:Cc:Subject:Date:From;
 b=q/z55cDHgsKK7QX4SE68WpfUa2KtQxs25JsKVQWl07Dsh/BJXy+rxOJDbiA1AGDDV
 6BxpglO7N0BoAlNJ1EOZB/zZaQtVfUBAn6rTRIT8BSsfYRGAd6XycHfmBnYsH7JmDM
 qqqn31Qaea4CCLp8fBE8MBfbqtkla3BUUH9MJin2W9i8NcXhD+r/9zI3/DG3PynAQS
 uvpqxz7pRXE5+xETdCY/oiP0QZHR7FFXqRsUKxyDQQvOdgivV/WCfszXKcyWBLz7x2
 kObZpd5I3XbowjPxvOGMCmTqqrSEQx+LBI9HmbwHRf4Fw75Y3WmqxzdaywPvZnRVck
 d9sUiQ6zXWD3Q==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: tc358764: Fix debug print parameter order
Date: Thu, 15 Jun 2023 17:28:17 +0200
Message-Id: <20230615152817.359420-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The debug print parameters were swapped in the output and they were
printed as decimal values, both the hardware address and the value.
Update the debug print to print the parameters in correct order, and
use hexadecimal print for both address and value.

Fixes: f38b7cca6d0e ("drm/bridge: tc358764: Add DSI to LVDS bridge driver")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/tc358764.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index f85654f1b1045..8e938a7480f37 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -176,7 +176,7 @@ static void tc358764_read(struct tc358764 *ctx, u16 addr, u32 *val)
 	if (ret >= 0)
 		le32_to_cpus(val);
 
-	dev_dbg(ctx->dev, "read: %d, addr: %d\n", addr, *val);
+	dev_dbg(ctx->dev, "read: addr=0x%04x data=0x%08x\n", addr, *val);
 }
 
 static void tc358764_write(struct tc358764 *ctx, u16 addr, u32 val)
-- 
2.39.2

