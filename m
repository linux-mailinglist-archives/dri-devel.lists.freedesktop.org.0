Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF9A8B01FC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA91B11385A;
	Wed, 24 Apr 2024 06:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kIQPaSra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48EF11385A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:36:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1479461890;
 Wed, 24 Apr 2024 06:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF753C2BD11;
 Wed, 24 Apr 2024 06:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713940581;
 bh=pWTvPRblCBNixub9cvr1im1fK9AjWZstRNm/LOmLlSI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=kIQPaSraYPpkNqJDLVq/3V71x9Avn1Y9IoOIrwoekLAQpP3c7BCJokvWe689hhPjt
 COYj7mpX7bT2DrmY/MaiEftznTdE0IQb+PwDAStni00s/0oDChvHoMRXH2N35tbEjH
 +vTXzQnQSBs2hXQ6cHZgWzu5yaTyoXS+0TqUqRBZEDosFajGodg3dtGv1DJ/3+Qel5
 /LIuo0OYzuuWJptpSDZ4bZDGTQ3LZZYGCyPkd/AkigBZbs4WFyVaCw6LDXSsfNF/jS
 oWEMEt0qIocGFIf6H0jpwz9yUzCPMnhvf8p2dWRQjGn/f5J9vgX95q7ojmjO5KOY/N
 xMfRn+sgRCEWQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 24 Apr 2024 08:33:44 +0200
Subject: [PATCH v2 18/19] fbdev: omap: lcd_ams_delta: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-video-backlight-lcd-ops-v2-18-1aaa82b07bc6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=990; i=krzk@kernel.org;
 h=from:subject:message-id; bh=pWTvPRblCBNixub9cvr1im1fK9AjWZstRNm/LOmLlSI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmKKftmm3FnyH0c8ZapIjiaRSDuKNvLbICJ53Tu
 +qqRZuB/++JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZiin7QAKCRDBN2bmhouD
 1439D/4pVsJu1f3Xvi8hmVDQuIos/Maf1iCjIvbsiizAkfBoWwXCLqk1SASLj07n928Xg4D9SpQ
 WBE0WMVTqLfw4u19v+WqNunGMsUkIExGU+AAQZBGEKmVg5VxCLiAdSTnc07Ys8GdLD7S4UuymFb
 ijeT4ucSJ59hfRJgHHpIhdphNIV4CEYK7dd+hbpEhBYMF7w0ThaQqAxS+X1RMCw2nA1N1+/LyeL
 H4wKncClZmWa7dZoQMlN/wWeaP4m9rmdRmsSSdOuJhKthMlvQLM4kKIAsub0hbqFgsKR9BaoK1v
 wfTpyIGN4Ukejfgonf7bl+zV4brZKhGdmtZZMH5Avae76ZltNz7zAp4+ZGFNmbZQT36+gKyudNE
 YOxajN/1/XbXexKojbn/jxmt2vsqQOD5zf8MXOdPV7iXCJTOGGuc/Jt/a89ynfghenxeYUh1gTS
 1gRRzUrIVHGa93CVsI0JO9gSK9KwfWtCik2o2Fx3Iwp+A+erxOenVBDzQrSJgtDKTx2orjlm4OF
 OUFSay5KqPG34pStikdgKaP7JhV/lSSHIfMt62G6rjRFemrh8qdQPKkG+AY/BfMEdwV/jrdgAcP
 SLeU4QzlBmsVYZr1fFY/0Zmut4OB2Y9yEM9LaGkb27v2oIw8ro3o0JDOFfSm/1BkV5S/nzMfBCA
 FpjLE4ux8x06WZA==
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
 drivers/video/fbdev/omap/lcd_ams_delta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/omap/lcd_ams_delta.c b/drivers/video/fbdev/omap/lcd_ams_delta.c
index 6f860c814d2c..97e2b71b64d7 100644
--- a/drivers/video/fbdev/omap/lcd_ams_delta.c
+++ b/drivers/video/fbdev/omap/lcd_ams_delta.c
@@ -76,7 +76,7 @@ static int ams_delta_lcd_get_contrast(struct lcd_device *dev)
 	return ams_delta_lcd & AMS_DELTA_MAX_CONTRAST;
 }
 
-static struct lcd_ops ams_delta_lcd_ops = {
+static const struct lcd_ops ams_delta_lcd_ops = {
 	.get_power = ams_delta_lcd_get_power,
 	.set_power = ams_delta_lcd_set_power,
 	.get_contrast = ams_delta_lcd_get_contrast,

-- 
2.43.0

