Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C328A43EB
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 18:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F631120E8;
	Sun, 14 Apr 2024 16:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dXrIiOsz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3E41120EB
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 16:37:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2235E60B2C;
 Sun, 14 Apr 2024 16:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4791C2BD10;
 Sun, 14 Apr 2024 16:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713112645;
 bh=72zXnNjUdpDz3J1EN0eijgGIcKOy+AlM1twfomkwYnw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=dXrIiOsz9ay3mhzrL0bubMJEsvHQSskCxSc06c5ZTEni37BPqr2c6mYd774iU0tOr
 GxPAoVYiCBZXnBAe/yPcIj3QKuXGvQ6W0IV0nDaVYiFtBkpffVet8oJjbAQ2iGCvFV
 5QFTpzVQIIpXYUs5OFkxbyYnr0JAPMRQUilCyJ2f9+97p4jJ10TCftHRwIJlw6GXSI
 lgk2GX3naud+nGW1UCxWEhGwLW+EAPXN1WU/obGv7XXEjPGL0mrTAWxUVGevztGKcJ
 12Mm8uoJKucU/1zoRqILuvpEtOsVrHPJBl7A0iO4oN5hCNt/trYabB2ABE5wPkwDTn
 aW8/fu4stLASA==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 18:36:10 +0200
Subject: [PATCH 12/18] backlight: otm3225a: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-video-backlight-lcd-ops-v1-12-9b37fcbf546a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=758; i=krzk@kernel.org;
 h=from:subject:message-id; bh=72zXnNjUdpDz3J1EN0eijgGIcKOy+AlM1twfomkwYnw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHAX9J08tTKsH8bkcCNd4a2dRxuCvVsUpu+71P
 I+QwkzyLVqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwF/QAKCRDBN2bmhouD
 18qjD/9DlmbHY7O5ZDXMXqLVupRiQYh+N52BSEI7d9Kys+JjEz9pSzZ7R13XxnW2RNYglgnf3Bx
 mi+WTXOhSmpdotNq7WI2fXu1TsnvZC28i+Ufd+Uklk0yfsrJQKrnaD/vhiD21H1kBRH8/1b7NVv
 XL+0lXf7IiMjsAcTwNdmhPviyhQi3euKNkJ6uuKl7GICNQAuf31JVxcYjkJslyENDjHa7NdVk2J
 mnTwn0761xjqNvJz1pmZhXfmt9ViYzSYkkWY8HKZJQk0FaybDhqLZbMyjiTy/rM+AQCsCYuz9D7
 gJPVODPPA+McpdaXqA1rD2Rs3q2OZ05kP4sS3HqOKPHDDmk0Boim2Y2aQZ3ZDz3W1ngm727yXXU
 oBkRpSUfQXu5TQMxcMLxrnpbRfTHqwiHgrVKfCpVlBFyIZ0nPrnmhcAfluZDRKXzIXDPx4l39tb
 v/lUuYX6+PDlzE9GYfzkvukCBwwNo0O5/UfU4cs48YRSurmiRasycBAn08y/eoWCkzSkHkq81PW
 aNlvFMvEffamhCP/UY9zw74gcl9JVdLsVMA+rjzUbaV+YYTzxWmm1UuoCRwC/B5MpZ8S7rcYASz
 pwzKWcsafIrf7fZt+7FpBfV+6MsIWe4yofB39Bk75+9sd+BO0JQLsQyHPUCjtZu6e9RXvbd4IQn
 5qUMsk9hRj/Sekg==
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
 drivers/video/backlight/otm3225a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/otm3225a.c b/drivers/video/backlight/otm3225a.c
index 4568020abf3c..efe52fa08b07 100644
--- a/drivers/video/backlight/otm3225a.c
+++ b/drivers/video/backlight/otm3225a.c
@@ -205,7 +205,7 @@ static int otm3225a_get_power(struct lcd_device *ld)
 	return dd->power;
 }
 
-static struct lcd_ops otm3225a_ops = {
+static const struct lcd_ops otm3225a_ops = {
 	.set_power = otm3225a_set_power,
 	.get_power = otm3225a_get_power,
 };

-- 
2.34.1

