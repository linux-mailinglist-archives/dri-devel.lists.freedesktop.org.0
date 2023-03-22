Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B516C44CF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 09:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A3810E89F;
	Wed, 22 Mar 2023 08:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F90710E89F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 08:23:02 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4PhM110wYwz8R041;
 Wed, 22 Mar 2023 16:23:01 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
 by mse-fl2.zte.com.cn with SMTP id 32M8MmLe099387;
 Wed, 22 Mar 2023 16:22:49 +0800 (+08)
 (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp02[null]) by mapi (Zmail) with MAPI id mid31;
 Wed, 22 Mar 2023 16:22:51 +0800 (CST)
Date: Wed, 22 Mar 2023 16:22:51 +0800 (CST)
X-Zmail-TransId: 2afa641abadbffffffffd7f-95a56
X-Mailer: Zmail v1.0
Message-ID: <202303221622511915615@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <laurent.pinchart@ideasonboard.com>
Subject: =?UTF-8?B?W1BBVENIXSBkcm06IGJyaWRnZTogc2ltcGxlLWJyaWRnZTogVXNlIGRldl9lcnJfcHJvYmUoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 32M8MmLe099387
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.137.novalocal with ID
 641ABAE5.000 by FangMail milter!
X-FangMail-Envelope: 1679473381/4PhM110wYwz8R041/641ABAE5.000/10.5.228.133/[10.5.228.133]/mse-fl2.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 641ABAE5.000/4PhM110wYwz8R041
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ye Xingchen <ye.xingchen@zte.com.cn>

Replace the open-code with dev_err_probe() to simplify the code.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 5ede3e111096..d85d9ee463b8 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -202,11 +202,9 @@ static int simple_bridge_probe(struct platform_device *pdev)

 	sbridge->enable = devm_gpiod_get_optional(&pdev->dev, "enable",
 						  GPIOD_OUT_LOW);
-	if (IS_ERR(sbridge->enable)) {
-		if (PTR_ERR(sbridge->enable) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Unable to retrieve enable GPIO\n");
-		return PTR_ERR(sbridge->enable);
-	}
+	if (IS_ERR(sbridge->enable))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sbridge->enable),
+				     "Unable to retrieve enable GPIO\n");

 	/* Register the bridge. */
 	sbridge->bridge.funcs = &simple_bridge_bridge_funcs;
-- 
2.25.1
