Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD67914E81
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 15:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0DE10E24C;
	Mon, 24 Jun 2024 13:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nvSHYiCf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3BA10E24C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 13:29:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C161960C5C;
 Mon, 24 Jun 2024 13:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E997C2BBFC;
 Mon, 24 Jun 2024 13:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719235758;
 bh=8eQ3vjWbIPNKuR00ZsA+8U+jf29/BI77yt+GVwyLS6U=;
 h=From:To:Cc:Subject:Date:From;
 b=nvSHYiCfHEXLj4nyHmXwZT3bnft5CSmbgDuQWyL5boDFTHbKKg/JCwxGIiU8gCBO8
 uRSFZWnb204PWvsiGogWeqhfDA9gYjldF0/Gu8TsqlTn0SdXXz/0UghDH4BFiw28RI
 ZuwDJFm9fvwwumPt96Zzd4SoKh4ZHPoWjXB8e2DGTVIvV0JoQvd5qd61GWIePwcS1g
 x/s53S0KMZ7QIw6ZyDDqLWTA6IYE0LGPtoqqd+N+fe9CccUBvfGVWo1ZYes4ajDT4g
 7/16a2WO1p4kXUV7N51OmJQGadmQuF3MD8rb1Gp1vddaVBx3EYB6w+7Kcl8AhB6sLL
 bGFttOMlrRvsg==
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Helge Deller <deller@gmx.de>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Date: Mon, 24 Jun 2024 15:29:04 +0200
Message-ID: <20240624132905.1245221-2-ukleinek@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628; i=ukleinek@kernel.org;
 h=from:subject; bh=xekor7BpsrcZ5xz5Zo5vwbnz9/ZrRZLKRNB4Gve+3UA=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmeXShGQ6GmX9WaV1ylibHoJMCVX8p4Vcjw86+p
 XuHx2uFTUSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZnl0oQAKCRCPgPtYfRL+
 Ts/vCACzjHkYq9eKhcW9TqLnmR1Jc+TGYte+X1GTpUKTliNQP8sAK1r7dO/5VeKOO4U/lZXQQha
 efc7SFj5jL0dinYFv4PFgV6zi6v3MeBoZ4EXpeunTsvqRi2wkcWQPm3cjCzQcsNp7Gn6ugb3S4E
 xXLpdm8dQ2pBiKJXbSghFJSKDy98X6wpF2YLzi86DLc7u2FiA/KdKOwMjVvDYzSeitp4P4gor0M
 kjoxcMs3cDaPAyltjb/a8ssmVjNTjQAfFOpsIpR0SIrCqfpwSPua+91xMfh2fhf9z58SU/diKpP
 gT9zVfi2K+dHJTUxaeOLwPlewib7tfkf8cR5Oso+Ra0ZAdGI
X-Developer-Key: i=ukleinek@kernel.org; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/video/fbdev/matrox/matroxfb_maven.c | 2 +-
 drivers/video/fbdev/ssd1307fb.c             | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/matrox/matroxfb_maven.c b/drivers/video/fbdev/matrox/matroxfb_maven.c
index b15a8ad92ba7..dcfae770b42d 100644
--- a/drivers/video/fbdev/matrox/matroxfb_maven.c
+++ b/drivers/video/fbdev/matrox/matroxfb_maven.c
@@ -1282,7 +1282,7 @@ static void maven_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id maven_id[] = {
-	{ "maven", 0 },
+	{ "maven" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, maven_id);
diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 3f30af3c059e..aa6cc0a8151a 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -782,10 +782,10 @@ static void ssd1307fb_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ssd1307fb_i2c_id[] = {
-	{ "ssd1305fb", 0 },
-	{ "ssd1306fb", 0 },
-	{ "ssd1307fb", 0 },
-	{ "ssd1309fb", 0 },
+	{ "ssd1305fb" },
+	{ "ssd1306fb" },
+	{ "ssd1307fb" },
+	{ "ssd1309fb" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ssd1307fb_i2c_id);

base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
-- 
2.43.0

