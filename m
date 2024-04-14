Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C25F8A43DE
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 18:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438BE1120E1;
	Sun, 14 Apr 2024 16:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MeMMU6FS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573801120E0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 16:37:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CBE3960B90;
 Sun, 14 Apr 2024 16:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CC6C072AA;
 Sun, 14 Apr 2024 16:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713112619;
 bh=HN87+bnoUJAL7IlBvGeQL/RoDv/OEH0jaRmwzfxf1dE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=MeMMU6FSWb5n9hNOQtljIiPMUHxLdVnXIpHcQ4mQCb31wxCOn9vrYkInsVSxQE0mb
 gl038qVp8k8ni2CNLHitrFBhVHBp+LtvMIxuNb3g9AjojaFfQ+PxAAqntAfCOxe4Yd
 eIj6ZOcImHweaGNDvMiQjdk1P6Sfaa7nRLBCR77KPQjKBZNeeE7E1ca9PKcotu6ukc
 92vMmGiFwnoyV06M76Srj6SWlIJxVj7udTRTCoWxJdjNJ13i1qJ02PiAGWXbFENwMu
 Y75c8lsxHLp1uZx42iuFm58w4RROfcX0sryFUTdOkoi0MPIblE/xZd5qpuAqJ+ouBj
 2SLbOp4UINhvA==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 18:36:05 +0200
Subject: [PATCH 07/18] backlight: jornada720_lcd: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-video-backlight-lcd-ops-v1-7-9b37fcbf546a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=854; i=krzk@kernel.org;
 h=from:subject:message-id; bh=HN87+bnoUJAL7IlBvGeQL/RoDv/OEH0jaRmwzfxf1dE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHAX4+63bobZ341icw3RoZcjAGHReGX0i9wIJi
 qxC8XxXwnWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwF+AAKCRDBN2bmhouD
 1zvbD/9P5ixNHRF0z3le1iebM0IUN0QqF+OrzIxIRFZoqMeu2/JoSwNGddITeLUBxA5QZRhHi/p
 3pFJ6EbfJSae0rkUBvdNSER6Neaps4CeZP9av8utY5eHUO3G91ZdWokBHQXZ55Xhln83bOcxrSn
 dS2cvlRKH7spY4rdjwlGmGtIKZ6nlFGlKMZDExhqTkUkeAtv1xjp2aNUZ/NZTFcCJAzgzit1qdW
 nQAv2uio+RomHmQ9Hv/0AAL6QJb3K4CocFzc8n2RsJykmxUpwNUG4tGg/42faBH3b5HhvuRqdMj
 EB0oQsozQvsDD0LE6MoLg3/C1slaRuQqnMoavQtwEnfmBmpcDY5vEGcuoKii3erxv6snscGS0sN
 nR6lC9ea5D2GtetOkaa3+Ab8W6jWMS+Xb+VXG7PoGk+ZJhisqFiif6ndt1VbYSx1xDYP9RsPW8P
 QK0tMYmHdcMxARGDIaPERSTRN8Nc+oI4syOqUilqP/+fneEl21+SL36hcNIz1THLP+sJU68b9Mp
 TfQN8SU5d7zfRG2VVfjfbGSMFDmMloHeWXOAWMgVwaddilpFBA1ErnAFX5OgWrTQJ5WiWZfFuuK
 R/QRB6NucER1+0LB/Jdhq1oipAvXjFy9RrBS1+ZIvqllxNaASIDvDiB46KsUkLXTWaVexkOmOEw
 +vwRwZY7f9hRXZA==
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
2.34.1

