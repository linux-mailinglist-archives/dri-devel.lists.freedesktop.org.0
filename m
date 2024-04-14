Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A9B8A43F3
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 18:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C374E1120EA;
	Sun, 14 Apr 2024 16:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r1jXpuZM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B7F1120EA
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 16:37:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1556760B87;
 Sun, 14 Apr 2024 16:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC323C072AA;
 Sun, 14 Apr 2024 16:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713112666;
 bh=I/kH75ChwTKatovUO+cVD/yXMeGrtVUzne0bWF7Bero=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=r1jXpuZM094AG4sLOkIkdIPIfXrPsKTLcgdJoi8qm2StTaYtrKmCpdVsMJvkwlFoM
 o5dFORCCyU2rb5LiXYwmbg9jPOR85fYhc13iZiLX1ifEiH8qIyVWWuQ104KRHb5+tA
 T9X7AXJ6/heUNOaRwWJ76ShoY5sXfGhIMX1ihiLJwBw+mWKbRtGInLR3we6Xmmf/SZ
 QZDTebzTfbLlZT++j5EqvHXlb19dq5gbPSLs6evIV79EeAXgQPPGza2yraquEO83cJ
 QGuvGLKqoyvbBflAV+ob+MncvLq3IxCLpE5CcLGKjeIofur7VYiKkB3B5mepf5IlBR
 kW/CvRKep1H/Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 18:36:14 +0200
Subject: [PATCH 16/18] fbdev: clps711x: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-video-backlight-lcd-ops-v1-16-9b37fcbf546a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=865; i=krzk@kernel.org;
 h=from:subject:message-id; bh=I/kH75ChwTKatovUO+cVD/yXMeGrtVUzne0bWF7Bero=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHAYAnrIYrAOTDHZlnP8WOV568OXufBGJkmSWK
 2M/WqLiZriJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwGAAAKCRDBN2bmhouD
 10odD/0YwUT2uItZP/jSF6IWzto56RNclF1/jdlmG9EV54NNKScB1thR2UzVNcf5UMWYzk/O/4d
 G6VlgyYkdgY98xvr+Xw1KTTNJEbt8CNBLw482bkZPU6jmkQejqZ+KPUFuXKBhLatcKJ0fTBMia7
 quIfrsHCqeWtvpemVHBU7/Xbm/amFPuuf1zKuziB9qBmptbIHvRdMNZccimd2IAxvYEizi7fIOQ
 gV68YHCOWruN2o5E+rq7XdL5VaKbBYdtOhylo+SO5SS2EbsHsNQ9DMEUB6TKV1l1fsCon8ikk38
 aZjhJBx8jZ1TWPTwRvAhTlQVvZSTt7Bw/JmizAAka1Cr70ALEFhLB2xTfzhBVqMt1Oq87Hq0tCq
 LWKms5Dkb1eYpxZWJC4w9eftkw8zS48TdKdIAevB9OAV10r3+UnH5jYkqnN2XgVznS+xeSldXCp
 ceL0E9hYFnYbEVJAKjVyEOhdubkMHvOuRluEDfamywF+5qa9PwbwVWVm8VvZHUn2IZtz/uVzbb6
 GBDG4h0oWOL4k9pCmYY4aCLZUKCx4f2Y3SNtIvrMmEO/O8xUR6HyuK6Dv2hs775l+phDUmKZR1D
 jTuLA9PWvEIEOjPvn3/IO6vRbu4vK8XNxVd7lh5RLXmDuGlAzIqnevAf4IDFuTHYQIBA3oPV73d
 +K/d+3trHJlfvlA==
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
2.34.1

