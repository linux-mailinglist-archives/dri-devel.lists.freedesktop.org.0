Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2607C6C44C9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 09:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6115810E3A4;
	Wed, 22 Mar 2023 08:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 74725 seconds by postgrey-1.36 at gabe;
 Wed, 22 Mar 2023 08:21:46 UTC
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DC210E3A4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 08:21:46 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4PhLzX24dBz6FK2Y;
 Wed, 22 Mar 2023 16:21:44 +0800 (CST)
Received: from xaxapp03.zte.com.cn ([10.88.97.17])
 by mse-fl2.zte.com.cn with SMTP id 32M8LVA3098098;
 Wed, 22 Mar 2023 16:21:31 +0800 (+08)
 (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp02[null]) by mapi (Zmail) with MAPI id mid31;
 Wed, 22 Mar 2023 16:21:33 +0800 (CST)
Date: Wed, 22 Mar 2023 16:21:33 +0800 (CST)
X-Zmail-TransId: 2afa641aba8d2ae-91f88
X-Mailer: Zmail v1.0
Message-ID: <202303221621336645576@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <laurent.pinchart@ideasonboard.com>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vYnJpZGdlOiBkaXNwbGF5LWNvbm5lY3RvcjogVXNlIGRldl9lcnJfcHJvYmUoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 32M8LVA3098098
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 641ABA98.000/4PhLzX24dBz6FK2Y
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
 drivers/gpu/drm/bridge/display-connector.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index fbb3e102c02f..56ae511367b1 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -271,12 +271,9 @@ static int display_connector_probe(struct platform_device *pdev)
 	    type == DRM_MODE_CONNECTOR_DisplayPort) {
 		conn->hpd_gpio = devm_gpiod_get_optional(&pdev->dev, "hpd",
 							 GPIOD_IN);
-		if (IS_ERR(conn->hpd_gpio)) {
-			if (PTR_ERR(conn->hpd_gpio) != -EPROBE_DEFER)
-				dev_err(&pdev->dev,
-					"Unable to retrieve HPD GPIO\n");
-			return PTR_ERR(conn->hpd_gpio);
-		}
+		if (IS_ERR(conn->hpd_gpio))
+			return dev_err_probe(&pdev->dev, PTR_ERR(conn->hpd_gpio),
+					     "Unable to retrieve HPD GPIO\n");

 		conn->hpd_irq = gpiod_to_irq(conn->hpd_gpio);
 	} else {
-- 
2.25.1
