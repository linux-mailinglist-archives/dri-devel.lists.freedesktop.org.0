Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F699ADA8E8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 09:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE39010E2C4;
	Mon, 16 Jun 2025 07:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="N784zPPY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id E564510E2C4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 07:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=wh
 +CPnClds++E2FomsMltkrI9VhXG10y8m6a304zDFY=; b=N784zPPYbzkId2zVdi
 HJqnG2zlh0hp2ckBXIxuiEBAr7bRt6ej4gaswDJBE38iIoEwaGWdtjNMqK+Ye0m7
 jsTo6D/VfFHobyuX80ljT6vJQ1EWzzqSBiYrKCFYnhBTiwzcyVJfd4hENzOfYx/X
 IBNbLTrazHTADNTGJWgTpI2zI=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id
 _____wCXq3hDwk9oF3UMIg--.6743S3; 
 Mon, 16 Jun 2025 15:05:44 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: neil.armstrong@linaro.org
Cc: conor+dt@kernel.org, quic_jesszhan@quicinc.com, krzk+dt@kernel.org,
 robh@kernel.org, sebastian.reichel@collabora.com, tzimmermann@suse.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 2/2] drivers/panel: raydium-rm67200: Make reset-gpio optional
Date: Mon, 16 Jun 2025 15:05:17 +0800
Message-ID: <20250616070536.670519-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616070536.670519-1-andyshrk@163.com>
References: <20250616070536.670519-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXq3hDwk9oF3UMIg--.6743S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF18ZFW8Gw1DGrWftw48tFb_yoW8Zw4rpr
 43Gay3AFykXFsIvFWvvan7uFyrAF1IqF4SkFn7K39xCw1UXw4UKw1akry5Wry2gryxtFya
 grZIkF13uFW0krJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jo1v3UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hFuXmhPwHxAuQAAsR
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

From: Andy Yan <andy.yan@rock-chips.com>

Although the datasheet of the panel module describes that it has a
reset pin, in the actual hardware design, we often use an RC circuit
to control the reset, and rarely use GPIO to control the reset. This
is the way it is done on our numerous development boards (such as
RK3568/RK3576 EVB).

So make the reset-gpio optional.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/panel/panel-raydium-rm67200.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67200.c b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
index 205273163cb97..add6099ae8a64 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67200.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
@@ -36,12 +36,14 @@ static inline struct raydium_rm67200 *to_raydium_rm67200(struct drm_panel *panel
 
 static void raydium_rm67200_reset(struct raydium_rm67200 *ctx)
 {
-	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
-	msleep(60);
-	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
-	msleep(60);
-	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
-	msleep(60);
+	if (ctx->reset_gpio) {
+		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+		msleep(60);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		msleep(60);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+		msleep(60);
+	}
 }
 
 static void raydium_rm67200_write(struct mipi_dsi_multi_context *ctx,
@@ -412,7 +414,7 @@ static int raydium_rm67200_probe(struct mipi_dsi_device *dsi)
 	if (ret < 0)
 		return ret;
 
-	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->reset_gpio))
 		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
 				     "Failed to get reset-gpios\n");
-- 
2.43.0

base-commit: 8c98c2c9ebeaa472e742d664b714aed5ab7c6f53
branch: rk356x_rk3588_rk3576_dsi

