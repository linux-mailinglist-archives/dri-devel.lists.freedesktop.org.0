Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 687BE7FE886
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 06:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0029410E6AD;
	Thu, 30 Nov 2023 05:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by gabe.freedesktop.org (Postfix) with SMTP id 0999210E6AD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 05:12:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [180.167.10.98])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 74E2861FB526E; 
 Thu, 30 Nov 2023 13:12:15 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com
Subject: [PATCH] backlight: ili922x: add an error code check in ili922x_write
Date: Thu, 30 Nov 2023 13:11:56 +0800
Message-Id: <20231130051155.1235972-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
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
Cc: linux-fbdev@vger.kernel.org, Su Hui <suhui@nfschina.com>,
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clang static analyzer complains that value stored to 'ret' is never read.
Return the error code when spi_sync() failed.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/video/backlight/ili922x.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
index e7b6bd827986..47b872ac64a7 100644
--- a/drivers/video/backlight/ili922x.c
+++ b/drivers/video/backlight/ili922x.c
@@ -269,6 +269,10 @@ static int ili922x_write(struct spi_device *spi, u8 reg, u16 value)
 	spi_message_add_tail(&xfer_regindex, &msg);
 
 	ret = spi_sync(spi, &msg);
+	if (ret < 0) {
+		dev_err(&spi->dev, "Error sending SPI message 0x%x", ret);
+		return ret;
+	}
 
 	spi_message_init(&msg);
 	tbuf[0] = set_tx_byte(START_BYTE(ili922x_id, START_RS_REG,
-- 
2.30.2

