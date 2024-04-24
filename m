Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C988B01E0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F89113850;
	Wed, 24 Apr 2024 06:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o+zYdMiu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719CB113850
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:35:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 17461CE1398;
 Wed, 24 Apr 2024 06:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0647FC2BD11;
 Wed, 24 Apr 2024 06:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713940518;
 bh=CEfgA0oELJOz8zvb6Nr80IYQhRv6FJqaM9RUu8IYCmw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=o+zYdMiuoHmlUXAozP7JvGxs1/BBHVb6A/1Wqw7vQZQr5LIj8PWYVIB3QV1WaVQU4
 G1P3W/QguqF0Nqz0M6BlN6LN2Ts+Y0FHyTawMGHFhU7CNIhHehyi9OvPeA9oFE45nU
 qwIDKE8LAekD2TQExNA4cenh5Y8IVlJmE/2LqMGn3hWr9DIxAW7l5FZyNsLqPVgXQ1
 XpbPvdo0j4q0mHQhkJ98lz0bYl1gGM+X8qFUDHRE5QQK+6IfWtGJ3+RK6YA1AvCcC2
 uXmz7twI5Wb+CfTs1FhNxLta5pKlTQ5MUHdNavwXpYqjRivpVLKnSNzASpi0mDCbuJ
 IKlufIurvZqqw==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 24 Apr 2024 08:33:34 +0200
Subject: [PATCH v2 08/19] backlight: l4f00242t03: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-video-backlight-lcd-ops-v2-8-1aaa82b07bc6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=846; i=krzk@kernel.org;
 h=from:subject:message-id; bh=CEfgA0oELJOz8zvb6Nr80IYQhRv6FJqaM9RUu8IYCmw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmKKfk5EmRUP/OMskgfwTpVvJdKVOsnvbUPDtRI
 gZNsfKqLmCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZiin5AAKCRDBN2bmhouD
 1x9bD/41s1qi8ODzYh2QLVdEnCbY2bsumCATwNpDO2xtfAhQTtdQl4k1xitz39bhv9G00h5bkj6
 OQt+X7a03rrHVo1LcNMrsqPpftc885Vs1IrHBzJIAupROnC9L4CwMZ0IwrJmp/rsQ6keHApZCRi
 9NI5oQkbPbEowGTwqAy7zNSDymk7t3iF+hZHQJk7duCVgP6vyS3VzJB9oC9dxRT7H0iMvzi2/JE
 rxN14hl+n4lkb41Pk2YhnQew/nb3Pk3nQq0BfNZ7mCfJaQbn0yRTtX5ZXNkb0fdKsMCe3iCSErg
 F2379PJnhLpON4xKsVHS9JniHNhMx7obJaYSTfloXkPaDbXJT3+ExR479bS6zQIgsbrK0k6VcWa
 qk+ipGyyLnBoyugAwDnxKpJVbgWziUmo+VJafRgYdooCBWfB/veCOd8UdM1XhYEHCkaHl830UOk
 a6yLQlFyH407/Rb1ILfMHY3bpvrQ6dPZ8WOmpPFl129WkiB3nDL3Woc4K8oGS/w0QIVvACJtXiF
 IPxxBghC1k0l0mQ5vDqbKlvLJy3osYAXuAm5vVzHs+4icHP4p0QAfzvpG2S+BhX65J5piIEdQa1
 iEUKjU8JnzW7sMQQLN+iy4fpbTR7CclU8WsDqleSaoC49s/irrdQKbJjbmg+z3N1xHNSGasWPE3
 d57ifB/epA4UnIQ==
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
 drivers/video/backlight/l4f00242t03.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/l4f00242t03.c b/drivers/video/backlight/l4f00242t03.c
index bd5137ee203b..dd0874f8c7ff 100644
--- a/drivers/video/backlight/l4f00242t03.c
+++ b/drivers/video/backlight/l4f00242t03.c
@@ -158,7 +158,7 @@ static int l4f00242t03_lcd_power_set(struct lcd_device *ld, int power)
 	return 0;
 }
 
-static struct lcd_ops l4f_ops = {
+static const struct lcd_ops l4f_ops = {
 	.set_power	= l4f00242t03_lcd_power_set,
 	.get_power	= l4f00242t03_lcd_power_get,
 };

-- 
2.43.0

