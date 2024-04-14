Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AD98A43E5
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 18:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228DE1120E5;
	Sun, 14 Apr 2024 16:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="adfu4CSE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9695A1120E6
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 16:37:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 163FC60B2C;
 Sun, 14 Apr 2024 16:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2548C072AA;
 Sun, 14 Apr 2024 16:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713112634;
 bh=usQ+7RLGSrfvZ4Uc8oRh0XRypcsevdJ9gNL16CX2QCM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=adfu4CSE4wZoiQtjjxEG8lx3swCraVR9aNGBbOFneSiUvNIlK1iihctdNVjYhhA+I
 Ix1Y+p0A4RtqiXdiNzbg7Rd2PS53TCPV0ZXPfPnM9SuqdQS6wFPJ259P9qDgUqkKzV
 iDlGfx2mZ2/3D+JJP4jCFSSvCR/aNpwYnxwPf4HvxMhwRz55ZbB6nuPmfhYfaDewQR
 m4CufNNYCTYUg2xfF+94HnmSqlY61e/uQgUnuw4AK2TKEJjJ89QwjFFM8SGHHoi0PC
 jn/kPVoG15kXn9lOtrn5GvXr6EuYIimAt2zpnj4r7KBVMM5qKUqaNTjfeY5Gvdx2CT
 97GvXcGUF6oLw==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 18:36:08 +0200
Subject: [PATCH 10/18] backlight: lms501kf03: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-video-backlight-lcd-ops-v1-10-9b37fcbf546a@kernel.org>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 =?utf-8?q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=816; i=krzk@kernel.org;
 h=from:subject:message-id; bh=usQ+7RLGSrfvZ4Uc8oRh0XRypcsevdJ9gNL16CX2QCM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHAX7FpzuMjvna8Y31zY0lIuxkts9wlMdSq0t0
 7hivN2rfQKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwF+wAKCRDBN2bmhouD
 1yFDD/4kuHtI7okgawLZYg49MQ9QNb0rJPtMTrHPxA3noOeBmJdpgvme/nc8w8UnvjPflwmfzyu
 ZMiKj3sd6Tsuil8yYpgvSGIPXhtqXAiQRNDu4xg384bAMJq7iTRFOUzXhrNGn8b+vAliVl77AL3
 pLUWOsESv4207ssMlr5pxVOfaZMerWiZtnVe2cWB6n9B+Oytrrbn4xnzXT4ncWARYq2Jrp8AQ4k
 jsaUnhjPyOu1X19du0jRHUHtq97UBiviTn8oTz6dGPn7vJroUnEyt4CjSwWHKFMGwHmq0bWjV41
 wdmSOjKtNfnLMgM+zpDy+vacqXUdBDfQ7xV+wP3dvoSl7bZh6m8P9BpRunYxmRKgaKZti3LhrLZ
 Csa9MqQ+UODSbxLg/VIqUIYm+9MDDfmDtUlHoKAC+Nu62gwZ9TG8oqaCdarq1sayDFaMxnz13IN
 7v8IIfCBWVl2HHIJ18qE31FOjATlfpr+ZkxNlSWJ2OZ3ABY4lWg6SgD0l6gXrX7tLq+D62IzJd7
 nANkcOdD84Iy5wR3dnqnWWrQI5snPFx8h6YuLCV5hrmjJKlO5up3JcjqwtOfCcZUXHfjykvFR+G
 ctvyq02CLOVd2rC3B/0qynUupt2vUNsSObasyOui9+mPx1TMe+4qf49YhHt9k+m+00nlEzmrFOZ
 4hVW27Zehxn4tLQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

'struct lcd_ops' is not modified by core backlight code, so it can be
made const for increased code safety.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/video/backlight/lms501kf03.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/lms501kf03.c b/drivers/video/backlight/lms501kf03.c
index 5c46df8022bf..8aebe0af3391 100644
--- a/drivers/video/backlight/lms501kf03.c
+++ b/drivers/video/backlight/lms501kf03.c
@@ -304,7 +304,7 @@ static int lms501kf03_set_power(struct lcd_device *ld, int power)
 	return lms501kf03_power(lcd, power);
 }
 
-static struct lcd_ops lms501kf03_lcd_ops = {
+static const struct lcd_ops lms501kf03_lcd_ops = {
 	.get_power = lms501kf03_get_power,
 	.set_power = lms501kf03_set_power,
 };

-- 
2.34.1

