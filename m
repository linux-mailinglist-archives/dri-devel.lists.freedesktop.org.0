Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A191FC754
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54796EABE;
	Wed, 17 Jun 2020 07:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from v6.sk (v6.sk [167.172.42.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5186E99B;
 Tue, 16 Jun 2020 21:21:36 +0000 (UTC)
Received: from localhost (v6.sk [IPv6:::1])
 by v6.sk (Postfix) with ESMTP id E9F7C61636;
 Tue, 16 Jun 2020 21:21:33 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: [RESEND PATCH v2 1/4] drm/etnaviv: Fix error path on failure to
 enable bus clk
Date: Tue, 16 Jun 2020 23:21:24 +0200
Message-Id: <20200616212127.986410-2-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200616212127.986410-1-lkundrak@v3.sk>
References: <20200616212127.986410-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:03 +0000
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

Since commit 65f037e8e908 ("drm/etnaviv: add support for slave interface
clock") the reg clock is enabled before the bus clock and we need to undo
its enablement on error.

Fixes: 65f037e8e908 ("drm/etnaviv: add support for slave interface clock")
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index a31eeff2b297a..c6dacfe3d321e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1496,7 +1496,7 @@ static int etnaviv_gpu_clk_enable(struct etnaviv_gpu *gpu)
 	if (gpu->clk_bus) {
 		ret = clk_prepare_enable(gpu->clk_bus);
 		if (ret)
-			return ret;
+			goto disable_clk_reg;
 	}
 
 	if (gpu->clk_core) {
@@ -1519,6 +1519,9 @@ static int etnaviv_gpu_clk_enable(struct etnaviv_gpu *gpu)
 disable_clk_bus:
 	if (gpu->clk_bus)
 		clk_disable_unprepare(gpu->clk_bus);
+disable_clk_reg:
+	if (gpu->clk_reg)
+		clk_disable_unprepare(gpu->clk_reg);
 
 	return ret;
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
