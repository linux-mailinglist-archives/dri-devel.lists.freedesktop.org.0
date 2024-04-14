Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1FF8A43F8
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 18:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A0B1120F7;
	Sun, 14 Apr 2024 16:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CUlqEheB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D0E1120EB
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 16:37:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7799260B98;
 Sun, 14 Apr 2024 16:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429F3C2BD10;
 Sun, 14 Apr 2024 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713112672;
 bh=pXU6zSARGVDugu8KFvOh/l5OML46BikLSb/4YHqGjAA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CUlqEheBDuFp/3X8XdJLYUSu+kuT7GqkJO7KgFYaZAL+b93nqY11dSL3q1qPzbOjk
 26+fGWV75wo2zwytdGcB4Qy/CrSVxuFE0XsNCa5v+o9slldMj35EeSKhmWrjLOe2L5
 88Wmsxq7Y/71/uj0Y6IGFF6gDdoSqbzoanMMWGgeSt/rhTct/pZe33KJib6HU4gzRz
 tFOF93W838Pubf9YLRLoa2tJ36VVxe8ngG8j5Uw/i3OdLqrmKD+C3Ap/4R+5W09OKS
 BQzH273iba9xq2++WTabNaeNgBG2IrKBZf2EMvMMG7RnkbG7XScsDSBFNYjEFluzMb
 pIL1636ygPHPA==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 18:36:15 +0200
Subject: [PATCH 17/18] fbdev: imx: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-video-backlight-lcd-ops-v1-17-9b37fcbf546a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=829; i=krzk@kernel.org;
 h=from:subject:message-id; bh=pXU6zSARGVDugu8KFvOh/l5OML46BikLSb/4YHqGjAA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHAYB/NvPvWOPJzkmhvH02TGCUdXNwXQJNIBfx
 KPbcEVlT0WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwGAQAKCRDBN2bmhouD
 18apD/47c2Ifg0paDFmM9BvBDW+RwXsN+MCo8yNwr9ziNbmoCZOlXwVdWZwzhdX0zqOWsOq9gyo
 WgqB782wrilmuqSIKOFnodemx5UVNjmtrH2Ena6GLIrz3m3a8v/LIXznSBMVY2Cb07B+jfnEca+
 iHHY7T7rvq+UVbNIEz63PrUmbXaAP77kKSnsTaPcSaaTkPbXTWyghkjlW/lZDy4E1gTq8CwWzOo
 mJRaDlhPFsCS/kKmzdbRwTAvuLxJmXxTsdmbuqDWTthlELxWMmIj75rFTSsqNhxUHi+DntTsEMI
 sBuYYYq2kEhWb7uvSgAmZEyhjcNaT5GoejvA9QxOW4VsmIrrsflQq0tJGAL6bXfjvJHs63Dnf5q
 +QVxaAEEbKABcHzuN2BcNovy22DJgdwhjmine/bxI15c787VOiiuMFfW1oCkekZuFZlIJcu1wDK
 a6BUzont5N/1xPTffBh0GO3wP23bRIn13XR+sKiF+DQ0L7a1U4L7myxMWczmF8ZCH+7dj410uUw
 XcvGzdhA8cDjts7EZEpljxft+Yx7ZUdcYvG0ZGuukFW6MnTgfp1fKTfugweoFqshUIaZaOSAQZr
 cw+fqgFKWTDLRPaNcql0aKxLtPGv5fElVwhfAJuD7VPoKRBnfdIsH7hlzdzZZD/d1vGz8BOfPBk
 GD/v21lf5gh4qng==
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
 drivers/video/fbdev/imxfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index a4dbc72f93c3..4ebfe9b9df60 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -857,7 +857,7 @@ static int imxfb_lcd_set_power(struct lcd_device *lcddev, int power)
 	return 0;
 }
 
-static struct lcd_ops imxfb_lcd_ops = {
+static const struct lcd_ops imxfb_lcd_ops = {
 	.check_fb	= imxfb_lcd_check_fb,
 	.get_contrast	= imxfb_lcd_get_contrast,
 	.set_contrast	= imxfb_lcd_set_contrast,

-- 
2.34.1

