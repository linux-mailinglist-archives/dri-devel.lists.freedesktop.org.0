Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E4F8A43DC
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 18:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1533D1120DC;
	Sun, 14 Apr 2024 16:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EK5HXlNs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A981120DC
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 16:36:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C1436CE09CD;
 Sun, 14 Apr 2024 16:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445A3C2BD10;
 Sun, 14 Apr 2024 16:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713112610;
 bh=hnKa56uMP1uBuqcYlrLCoROyDjHVEOMKzsZF5kAUvag=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=EK5HXlNsWOmG45NXxmpqfEyacm9qOKTm+qh4cjvBjAjuwL56zzZB953sTj0xGM+mr
 wK1+i83da3/zSyqHOF36apUEV9dcctQ34H5lgvXYZ57u86M2CiTBZJcHXs++xAY1mK
 bVrMpvgp1i/QrcqycvCYDxxa84P+9+gghc4ncfC9E3bInYoJqXjJcbkMGWIxl2TOmH
 4pwDaTtI5FmlbauYgmrL8wT7c8bX3ZfWcggNwC9XL+P7rh+0oeNCghaTWCz3GqcR4f
 DE22/rgK7p57sdJEdHG2kVBCEsyCUcGqTPgjcbKRrFUGfPeKpgOxXZ9V/K6aoWNchS
 ++g69M6gW+g/g==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 18:36:03 +0200
Subject: [PATCH 05/18] backlight: ili922x: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-video-backlight-lcd-ops-v1-5-9b37fcbf546a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=749; i=krzk@kernel.org;
 h=from:subject:message-id; bh=hnKa56uMP1uBuqcYlrLCoROyDjHVEOMKzsZF5kAUvag=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHAX3qsL8Hzg65pI/n33WGw1cOHusS9qLWrvz2
 9ysY0cPEgaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwF9wAKCRDBN2bmhouD
 153UD/46OO0GE9u+PnAEwY2y//MxFK/BvQjDKIdN5VeJAxZsJBdtVmM7ek4ABnR9x/8q76Xk2fc
 CEj8VRjGDVJlljjwgajs9mNYJf7ny7+/RR+HDlcdCJu8QsoFIPcci1SR6QOgDXd2Mjg2AVlEfMM
 36fuYootU1898/VrCemeiu/BG1eNfk5OHCpQMDaXLSIdkYb576YfHrKcBsrKfDuJirG/gbuXO0P
 aucq6fITr+Cro/vn7Yluir5g0rE75cNzpZgzaefkADukmZTR/XqcrD57cIsOvjchneaxGmuzDxr
 pKgIr4j2KFBXovrz6aoII9pjENXjr1LJ5OAhAkWZw4aeNhme0euPqJbf9X6E0JjSpdSpl4e3+ku
 PMk12pFjqyC2fNwude2R47V/YqXx8l+a2Ie7QmUDWNZTP5kl5S8H8BNZsgb4MlHBW7cr7ccRDen
 DFCxXQDetnr1lF8vZDZc/oeRfcmBijltAlpPccnyMnyTeGNy+CJJ0fKn78dArOUai5QqUuAwKMF
 MmTi92oynvX5UTLwvBMb4GIuTkWGvTZpxS24k8N8V6+PB9Xl+ACz1ZuiXR9OHp8QGRDYfDQlrmU
 v9PIeNQTPxUUpYkJK6rPfHLk893dCLP06sDEx+ROtOzZpG05SML31DQBFAcJ8UI51ClNVr/d9yT
 p3dT5FwBG/kXSPQ==
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
 drivers/video/backlight/ili922x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
index c8e0e655dc86..7683e209ad6b 100644
--- a/drivers/video/backlight/ili922x.c
+++ b/drivers/video/backlight/ili922x.c
@@ -472,7 +472,7 @@ static int ili922x_get_power(struct lcd_device *ld)
 	return ili->power;
 }
 
-static struct lcd_ops ili922x_ops = {
+static const struct lcd_ops ili922x_ops = {
 	.get_power = ili922x_get_power,
 	.set_power = ili922x_set_power,
 };

-- 
2.34.1

