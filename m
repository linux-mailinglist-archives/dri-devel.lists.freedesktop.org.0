Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FE58A43F1
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 18:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1D310EF23;
	Sun, 14 Apr 2024 16:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ioHE2FeA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F6B10E177
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 16:37:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BEA8660B93;
 Sun, 14 Apr 2024 16:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E01C2BD10;
 Sun, 14 Apr 2024 16:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713112655;
 bh=8FxyQDrDkLV87R/73jNam4JGkAqzpFBP89GlA6wO7Q0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ioHE2FeAEDw0+ahb8HY6NFpxgtgIGWxwE4Q+yubionYMMlRQ7gziO6B5UAB0YR4Tg
 GEdu7DB1Gc2dEFWoC2h+9e9nbvTj7ScYg99X9U/adhgg/IKcTHRNCNJUgpHiB+VlzN
 SfKXDOPm8mbjL00oPYsjtxL3j08fBGqWOM2ku+IRYuXQdV3Jud3uOtAvzDwCsLDa7d
 GizBufZzBu93l9nWwwim94wif//j18LikgB17SAFd0HUatnhfjcfP6PjVPCpDkRqeZ
 SVCJ6DwlNIJhY1Qd6ajPLzh+GlZvRMsEaZYKIQtSpGitohakYnZ4oKoTGUMCE76sKw
 wUIhn5ltpn88w==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 18:36:12 +0200
Subject: [PATCH 14/18] backlight: tdo24m: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-video-backlight-lcd-ops-v1-14-9b37fcbf546a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=803; i=krzk@kernel.org;
 h=from:subject:message-id; bh=8FxyQDrDkLV87R/73jNam4JGkAqzpFBP89GlA6wO7Q0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHAX/k2/D+kcnyA6+1reXM/8pHT2wciKmhkg+u
 URCGgbFt9+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwF/wAKCRDBN2bmhouD
 11NnD/wOz2KK3FakG68xnNgo93NOUs2plxArscPwAndKmRQnvAqcaTR/URyeZkEPsjF2U35aVuE
 VYarm9v+evFVFe28+iewTan42SxHBlFJ7uT07CXVN6QOYp7S8pq15aLQOGgxlSZFbR5vGmvGzMh
 A7rASh6O0dKGu4Hgxq71tP7SstOBQQSFChzOchld+R7ZIoqJPpe6i0XAxmRYQ0tLraPySTdbEPa
 q0wSv/ct0GugXecwSW35oKrh8YHbRD/YZgUk8fZfkgcxxxEjbF79ovAeh3Ml71wPHaJK64cs/95
 3vP4IaeiV1bW7Yupi65hKDQaR1Yz5iO4zlW/82Hz8xpfJ5apszt3CeqZajKYJf+5zKVLr0MecRH
 O4BmoH5d8x1EsO0/pbUR5casDmtJke2MTrO4BOaQvHfjMpR4jrYbfs542gKaC7H19Ye5qrxX9VB
 bPms+T0FCnoaOSNdavDN4hfr1WS1ldx5r9tk27dxC+qHow5yQ8I3s77Ob9S+cloVXRrix89jpeK
 lMRTkkro54vQoVQ8+AeJWfc21vIxqNDQyrIoSAawu/AAOCXADNsP12TdgSJwVnDQVbKUhbTby1W
 1/lZITTfqZT2iSScZyrn0W4AQWP7wRh6iMCFuFGQeEZ7hhonN0KDi2YIYviByOQ3qtGmWiRAZCD
 GcLjhVeobVDC2Tw==
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
 drivers/video/backlight/tdo24m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/tdo24m.c b/drivers/video/backlight/tdo24m.c
index fc6fbaf85594..c413b3c68e95 100644
--- a/drivers/video/backlight/tdo24m.c
+++ b/drivers/video/backlight/tdo24m.c
@@ -322,7 +322,7 @@ static int tdo24m_set_mode(struct lcd_device *ld, struct fb_videomode *m)
 	return lcd->adj_mode(lcd, mode);
 }
 
-static struct lcd_ops tdo24m_ops = {
+static const struct lcd_ops tdo24m_ops = {
 	.get_power	= tdo24m_get_power,
 	.set_power	= tdo24m_set_power,
 	.set_mode	= tdo24m_set_mode,

-- 
2.34.1

