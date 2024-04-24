Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A038B01F6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F3511386C;
	Wed, 24 Apr 2024 06:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BofvR8jm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58EA113862
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:36:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3F39E619A0;
 Wed, 24 Apr 2024 06:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22BEC32781;
 Wed, 24 Apr 2024 06:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713940569;
 bh=QXNbru9NGCM4zVjapmJStHbmabBPmDui2fkd9b5Wp+s=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=BofvR8jmd7tGAhSPhM5vQMq26iwVvH5F3HW8ePprhNk19eXYDtHX6lZG/SWQDMYWg
 XzZdv9MNMRMqOdIgNXyHaUzcKFEK/3eNOa2A/2qbs2TSRZ+TB9C3Ljy4ZeBe8bK3p5
 MsGdvitCvClvDspseWz0bP0QjeTIkZNChzEXby5Pm6J1iYJwxxArKigy2Yb0/gmz1J
 c3HI+AYLldLP0JD3XdxsNqbdZQ5HQmJLvcfGD1u6ALrV3urXjIIKvqSQHyQyvgKmKL
 0y1TiqExvzM3jvCXFdAqB018mbkFvdQCXYYUGanZZKesrObijH7jX8Ugnb8MIG2t8b
 CYH3Fe3fziadA==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 24 Apr 2024 08:33:42 +0200
Subject: [PATCH v2 16/19] fbdev: clps711x: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-video-backlight-lcd-ops-v2-16-1aaa82b07bc6@kernel.org>
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
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=917; i=krzk@kernel.org;
 h=from:subject:message-id; bh=QXNbru9NGCM4zVjapmJStHbmabBPmDui2fkd9b5Wp+s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmKKfrWj28tn3LWcrTWjpauc+CvW3QK/dCOFObz
 J+UNlWsn6iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZiin6wAKCRDBN2bmhouD
 1+mlD/9fb+7DnzYZGRX01UeoybWGZDF3nW2aZbNa/mxgyWvYxm2HUqUy6zj3+qcMguiOVh+mbnQ
 xZd1j0wOjnPh4DM2W1QiGwefia+jAQb8f+QYYzMLxLsaDYguizYmc6TpxD8xKdEfptig/ZCzznF
 p4jM81f4pLxrPvzonNCTfd8r77oKD+Tny77r99ccMpikICEumGkVdAA2x/kfnDDetDapyLWI7R4
 UnfBgk0IYvrOqEdIElmoAuQc2SBDxB2tD6//eQX3DbvKHiOosQPTtHJnCC9f9vffXQhkSXVwAMn
 wfQPHg3tbyiJtyAU1hlqv0O28v348tNwpbNuh6Tl4ziXWh10Fb5vIeSYfXKvlrIZeWGlT1zMP5m
 yca87NFkNv1xlip8NZdgbPCT6WdkLzaR9O84m6I53t87gUlI4WFv/96xiE6S9tJeohMvn1qdEm4
 ZgTisIG90u9f3z+qmFZYutXfS5rNdqmuYacwV5SxQ6Mw7nJaB+4BEwUWVz+VdMA0DGRwWyuTJj4
 Mxtww40VTQ9dDBJPDxGeBqD5W2GmSX3P9eO9lvoVDziI7jDH8HWHB2Qo4ju7VjADL9bDb6jMBID
 fosGm3DXO8XIC3PbvwPlWpnxriTNg3kfkEov7Lt7G+sB4SpElYFI3pUYdedgWhWloeK7Gy1axfI
 NFvp7r+k8E0izTQ==
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---

Depends on the first patch in the series.
---
 drivers/video/fbdev/clps711x-fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/clps711x-fb.c b/drivers/video/fbdev/clps711x-fb.c
index dcfd1fbbc7e1..6171a98a48fd 100644
--- a/drivers/video/fbdev/clps711x-fb.c
+++ b/drivers/video/fbdev/clps711x-fb.c
@@ -197,7 +197,7 @@ static int clps711x_lcd_set_power(struct lcd_device *lcddev, int blank)
 	return 0;
 }
 
-static struct lcd_ops clps711x_lcd_ops = {
+static const struct lcd_ops clps711x_lcd_ops = {
 	.check_fb	= clps711x_lcd_check_fb,
 	.get_power	= clps711x_lcd_get_power,
 	.set_power	= clps711x_lcd_set_power,

-- 
2.43.0

