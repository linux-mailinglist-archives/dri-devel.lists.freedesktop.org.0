Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F954AA75B
	for <lists+dri-devel@lfdr.de>; Sat,  5 Feb 2022 08:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EACA10E7D1;
	Sat,  5 Feb 2022 07:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr
 [80.12.242.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB4010E7D1
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Feb 2022 07:40:53 +0000 (UTC)
Received: from pop-os.home ([90.126.236.122]) by smtp.orange.fr with ESMTPA
 id GFggn1Io9IQAdGFggnd94L; Sat, 05 Feb 2022 08:40:51 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 05 Feb 2022 08:40:51 +0100
X-ME-IP: 90.126.236.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: [PATCH] backlight: pwm_bl: Avoid open coded arithmetic in memory
 allocation
Date: Sat,  5 Feb 2022 08:40:48 +0100
Message-Id: <bd3d74acfa58d59f6f5f81fc5a9fb409edb8d747.1644046817.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kmalloc_array()/kcalloc() should be used to avoid potential overflow when
a multiplication is needed to compute the size of the requested memory.

So turn a kzalloc()+explicit size computation into an equivalent kcalloc().

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/video/backlight/pwm_bl.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 8d8959a70e44..c0523a0269ee 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -263,9 +263,8 @@ static int pwm_backlight_parse_dt(struct device *dev,
 
 	/* read brightness levels from DT property */
 	if (num_levels > 0) {
-		size_t size = sizeof(*data->levels) * num_levels;
-
-		data->levels = devm_kzalloc(dev, size, GFP_KERNEL);
+		data->levels = devm_kcalloc(dev, num_levels,
+					    sizeof(*data->levels), GFP_KERNEL);
 		if (!data->levels)
 			return -ENOMEM;
 
@@ -320,8 +319,8 @@ static int pwm_backlight_parse_dt(struct device *dev,
 			 * Create a new table of brightness levels with all the
 			 * interpolated steps.
 			 */
-			size = sizeof(*table) * num_levels;
-			table = devm_kzalloc(dev, size, GFP_KERNEL);
+			table = devm_kcalloc(dev, num_levels, sizeof(*table),
+					     GFP_KERNEL);
 			if (!table)
 				return -ENOMEM;
 			/*
-- 
2.32.0

