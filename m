Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000008B01DF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35F511384E;
	Wed, 24 Apr 2024 06:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CCayOCb9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A8511384E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:35:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 698AECE13A0;
 Wed, 24 Apr 2024 06:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C3BC113CE;
 Wed, 24 Apr 2024 06:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713940512;
 bh=TF3caa3ZqGW3NOgH68uTY4reTmb6e8Mj1fQjLmrYPFk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CCayOCb9PaArobK20b5rt2Apv3uGztGWPWg7AGtnOiYsaPJ44MPBZUGAvea4q2aj9
 El2R2kIOgohiK3WGUGJxBookhaU7W7uIqaAhrLAfc2X69AQi0tXDstcyHNy7+6LDTq
 LMiUk96lUECfWxGKDBreCGWP34bBOk4EEsfgOXCX4c2hVTrFR23cw4C4wrPpNkftke
 ZqHlPBm8mGkdfMoamHgw7Nj32lJiNxLKPKkhv35yzqYApF9opngl9YvH+N+ryj+4GP
 V9VjLY8NKr6Lf2h1mwOj0MrpMp1jmKoGeVnU94JIUl+wQlH+Dvdomb3IslDkjdyEKQ
 R7JnBo9b/gwMA==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 24 Apr 2024 08:33:33 +0200
Subject: [PATCH v2 07/19] backlight: jornada720_lcd: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-video-backlight-lcd-ops-v2-7-1aaa82b07bc6@kernel.org>
References: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
In-Reply-To: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=913; i=krzk@kernel.org;
 h=from:subject:message-id; bh=TF3caa3ZqGW3NOgH68uTY4reTmb6e8Mj1fQjLmrYPFk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmKKfj8UNY1aT9ESBvK1M93qQMu+fYxYjOr7aSL
 3soc8KBncCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZiin4wAKCRDBN2bmhouD
 1+B6D/46M9kvA0YB/oh5w0eEzslAekOrDicFVVYkd5oN4eY32nh3e6ZLWNrXU3OQE8mKNxtbwrr
 B/jfvQBcUG51Cq5ZqPSnP7jH5WrJqtI6wOyYcbBrf5MEaKDra9Tgzd8S4W6MLQFiJxFnYiSRSoS
 p4n1rw6QCZlE94mT+TmbcxnMcY56g7u7wIuo3JuyTQV7uE085BxiST/AGsgzaPECNh1BS5i07Mw
 iC+0jNRv/yuGq1ngxpGudmBygCQahTp62C13OXqQuuAMsQUt0gGVT2yy53YV/FKzvUUshSNfMN3
 W6cZ7FmNBfNmQW6IgmonfwTCXs5FI1ZiCZvVdX+nxobwByAZNmVjuRgfgcwin9IkRRKr+NRAuYr
 ZeCpPXhJrafLq52cBlaB/nW6+mfzj0ZZ/vqXln+JME+zNc9PszI8jfvyCS0pi0Xc0O1pbLAtcsG
 NtQfOeLHyRM+k8NNTAADHjUj6GX4lWSDwzLJxIzUEjn30PGDO92zl1yJD1jRT/wpbc5396hsCbn
 bY+kCuVhRtB/tuNjuE+2m62Rx10fi8QlKsILeunGAW8gup8ZR2Xf/dDkDY57CTN6lqK8VJV2Gnl
 Tcc16z9wKL/LltQsbkI2CdjRe1lrEqFaPq87RBvHcaPg5OXld+gXMrbGGgG0ZOV5ukg3aivpgxj
 j6X7VZuCGqonl8Q==
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

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/video/backlight/jornada720_lcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/jornada720_lcd.c b/drivers/video/backlight/jornada720_lcd.c
index 6796a7c2db25..5c64fa61e810 100644
--- a/drivers/video/backlight/jornada720_lcd.c
+++ b/drivers/video/backlight/jornada720_lcd.c
@@ -81,7 +81,7 @@ static int jornada_lcd_set_power(struct lcd_device *ld, int power)
 	return 0;
 }
 
-static struct lcd_ops jornada_lcd_props = {
+static const struct lcd_ops jornada_lcd_props = {
 	.get_contrast = jornada_lcd_get_contrast,
 	.set_contrast = jornada_lcd_set_contrast,
 	.get_power = jornada_lcd_get_power,

-- 
2.43.0

