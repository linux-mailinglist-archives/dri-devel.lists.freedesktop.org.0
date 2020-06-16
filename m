Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B481FC744
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F10C6EAA5;
	Wed, 17 Jun 2020 07:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from v6.sk (v6.sk [167.172.42.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3C76E99B;
 Tue, 16 Jun 2020 21:21:37 +0000 (UTC)
Received: from localhost (v6.sk [IPv6:::1])
 by v6.sk (Postfix) with ESMTP id 3DC5261638;
 Tue, 16 Jun 2020 21:21:36 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: [RESEND PATCH v2 2/4] drm/etnaviv: Don't ignore errors on getting
 clocks
Date: Tue, 16 Jun 2020 23:21:25 +0200
Message-Id: <20200616212127.986410-3-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200616212127.986410-1-lkundrak@v3.sk>
References: <20200616212127.986410-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:02 +0000
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
Cc: Russell King <linux+etnaviv@arlinux.org.uk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 Lubomir Rintel <lkundrak@v3.sk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There might be good reasons why the getting a clock failed. To treat the
clocks as optional we're specifically only interested in ignoring -ENOENT,
and devm_clk_get_optional() does just that.

Note that this preserves the original behavior of all clocks being
optional. The binding document mandates the "bus" clock while the dove
machine only specifies "core".

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v1:
- Fix the actual return value

 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index c6dacfe3d321e..f303172c091db 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1786,26 +1786,26 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 	}
 
 	/* Get Clocks: */
-	gpu->clk_reg = devm_clk_get(&pdev->dev, "reg");
+	gpu->clk_reg = devm_clk_get_optional(&pdev->dev, "reg");
 	DBG("clk_reg: %p", gpu->clk_reg);
 	if (IS_ERR(gpu->clk_reg))
-		gpu->clk_reg = NULL;
+		return PTR_ERR(gpu->clk_reg);
 
-	gpu->clk_bus = devm_clk_get(&pdev->dev, "bus");
+	gpu->clk_bus = devm_clk_get_optional(&pdev->dev, "bus");
 	DBG("clk_bus: %p", gpu->clk_bus);
 	if (IS_ERR(gpu->clk_bus))
-		gpu->clk_bus = NULL;
+		return PTR_ERR(gpu->clk_bus);
 
-	gpu->clk_core = devm_clk_get(&pdev->dev, "core");
+	gpu->clk_core = devm_clk_get_optional(&pdev->dev, "core");
 	DBG("clk_core: %p", gpu->clk_core);
 	if (IS_ERR(gpu->clk_core))
-		gpu->clk_core = NULL;
+		return PTR_ERR(gpu->clk_core);
 	gpu->base_rate_core = clk_get_rate(gpu->clk_core);
 
-	gpu->clk_shader = devm_clk_get(&pdev->dev, "shader");
+	gpu->clk_shader = devm_clk_get_optional(&pdev->dev, "shader");
 	DBG("clk_shader: %p", gpu->clk_shader);
 	if (IS_ERR(gpu->clk_shader))
-		gpu->clk_shader = NULL;
+		return PTR_ERR(gpu->clk_shader);
 	gpu->base_rate_shader = clk_get_rate(gpu->clk_shader);
 
 	/* TODO: figure out max mapped size */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
