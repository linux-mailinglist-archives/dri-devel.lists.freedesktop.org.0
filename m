Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BCF550642
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 19:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C7B10EA3C;
	Sat, 18 Jun 2022 17:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr
 [80.12.242.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A0310EA3C
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 17:08:17 +0000 (UTC)
Received: from pop-os.home ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id 2bvaoZWBzL5fD2bvboxfsD; Sat, 18 Jun 2022 19:08:15 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 18 Jun 2022 19:08:15 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andy Yan <andy.yan@rock-chips.com>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/rockchip: Fix an error handling path rockchip_dp_probe()
Date: Sat, 18 Jun 2022 19:08:05 +0200
Message-Id: <b719d9061bb97eb85145fbd3c5e63f4549f2e13e.1655572071.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Should component_add() fail, we should call analogix_dp_remove() in the
error handling path, as already done in the remove function.

Fixes: 152cce0006ab ("drm/bridge: analogix_dp: Split bind() into probe() and real bind()")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 70be64ca0a00..ad2d3ae7e621 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -408,7 +408,15 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	if (IS_ERR(dp->adp))
 		return PTR_ERR(dp->adp);
 
-	return component_add(dev, &rockchip_dp_component_ops);
+	ret = component_add(dev, &rockchip_dp_component_ops);
+	if (ret)
+		goto err_dp_remove;
+
+	return 0;
+
+err_dp_remove:
+	analogix_dp_remove(dp->adp);
+	return ret;
 }
 
 static int rockchip_dp_remove(struct platform_device *pdev)
-- 
2.34.1

