Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C87414CBF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 17:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6D66EB24;
	Wed, 22 Sep 2021 15:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F6C6EB24
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 15:11:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6B3D60F9D;
 Wed, 22 Sep 2021 15:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632323460;
 bh=gWgb8f+cYpnddZ+ewJORCnsBgA7i+6sYa5SLW89x2WA=;
 h=From:To:Cc:Subject:Date:From;
 b=AB1qDrm7catdntDfH6HCd/U3sy9iX2gON2k23xQPsQ1BnZQ+XDz1LwePz7SxS/hWX
 8o1MtrMwSMLTeYiURfEr4cd+LO9tGUVOn5473AmctfMFDyP4fUT8E8siIUsTEZ/vSF
 ArQuURZ9vudh6pqoGH9q6P3O75/PT7g435j0xR4hUpA2HVMq+rW44s2BqsRO0GWBiW
 OXNgn5/1q8R+V3afKCk4LnRpZuvEpfnW3EO/0NEGPNApUUtxn79dwGuCXomIMwrsyn
 vGVHi5dDD9IlI4Y4nejRpeG3xm8TQNvMAaatk0t/ftJkCDkW3N4iwPfP8s7gD3eHmE
 2l515bRC13rSw==
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH] backlight: hx8357: Add SPI device ID table
Date: Wed, 22 Sep 2021 16:10:14 +0100
Message-Id: <20210922151014.49719-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398; h=from:subject;
 bh=gWgb8f+cYpnddZ+ewJORCnsBgA7i+6sYa5SLW89x2WA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhS0cqqPqGGWr36vpjFHQK66EpHeoiCcvFeAS+vIig
 jRqmlaeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUtHKgAKCRAk1otyXVSH0OGIB/
 93JLhwCTB/3UbWP9iHf8x4q+TMjIyp1q2YApxBFJhNTUEGVZyW2B7YEj1TiClJ5AStmBy+4q07XK/W
 ts9ieKcwDkM0R8eF9emw+TFsHVEUAuRJ8ZePrefIk4B4nqAla7AsArkJkjSvqazcuWrKpzhAwtCtuG
 QW99WUix67qpTgv7/+t5avRVIv7vlDyTYRQ0OqHC7AXvdJCyKA3Xn4VAfrn1wg6PpQtadeWcgXhPxK
 BNUErVmtZJYxTpwsavsI7RB6gELcK3eYCWIlaWLe5wlSIec9hhVF4BWMRtaa1hC6awbdH1QgeFSAOB
 fgWDU+MH/YkZLbFk1R5ApkM04LepAE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

Currently autoloading for SPI devices does not use the DT ID table, it uses
SPI modalises. Supporting OF modalises is going to be difficult if not
impractical, an attempt was made but has been reverted, so ensure that
module autoloading works for this driver by adding a SPI device ID table.

Fixes: 96c8395e2166 ("spi: Revert modalias changes")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/video/backlight/hx8357.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
index 9b50bc96e00f..c64b1fbe027f 100644
--- a/drivers/video/backlight/hx8357.c
+++ b/drivers/video/backlight/hx8357.c
@@ -565,6 +565,19 @@ static struct lcd_ops hx8357_ops = {
 	.get_power	= hx8357_get_power,
 };
 
+static const struct spi_device_id hx8357_spi_ids[] = {
+	{
+		.name = "hx8357",
+		.driver_data = (kernel_ulong_t)hx8357_lcd_init,
+	},
+	{
+		.name = "hx8369",
+		.driver_data = (kernel_ulong_t)hx8369_lcd_init,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(spi, hx8357_spi_ids);
+
 static const struct of_device_id hx8357_dt_ids[] = {
 	{
 		.compatible = "himax,hx8357",
@@ -672,6 +685,7 @@ static struct spi_driver hx8357_driver = {
 		.name = "hx8357",
 		.of_match_table = hx8357_dt_ids,
 	},
+	.id_table = hx8357_spi_ids,
 };
 
 module_spi_driver(hx8357_driver);
-- 
2.20.1

