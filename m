Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D924F8B01E5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210F1113852;
	Wed, 24 Apr 2024 06:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IwpYGWaq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3722A113852
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:35:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E0D11CE13A0;
 Wed, 24 Apr 2024 06:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C7BC4AF0B;
 Wed, 24 Apr 2024 06:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713940524;
 bh=QqHhVK9SzqekY23QUK0NGbTMVW5eCZeUTtEhIWfnh+0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=IwpYGWaqENG2rdgG783mxgPVv7SZfywBXin0ml73pYYZsMJ77gnOIsm5xXVpNwXaJ
 sDJIuNXPJT4/ynSQ/pmS+o0r6hwgSZXaRmYaYjPmNJWmMGAqC57aMumyZWAC7CYXdo
 3tZnv2GtBUG9ihVR72ztg7qcLwFxd7S64ZjPojSZl/Odk2Wml1s1gF7osuNrE29JpF
 qtgooBIaJNWEEGLCS+YX3dLrkHlcpV+QSlBLJjOLTI3K2f6uoGbTmZ8/iNgv1UbvTI
 R2a1zcVnwoo9o3Yrf6Un7x1vssvilnHuc7q1eHfB7JEkVX6V+q/uutiUHx9CR6qqJf
 JSESdhhCOq8tw==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 24 Apr 2024 08:33:35 +0200
Subject: [PATCH v2 09/19] backlight: lms283gf05: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-video-backlight-lcd-ops-v2-9-1aaa82b07bc6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=810; i=krzk@kernel.org;
 h=from:subject:message-id; bh=QqHhVK9SzqekY23QUK0NGbTMVW5eCZeUTtEhIWfnh+0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmKKfl2/5VGOxtE9L3jJEz+f24++Vzpjt/lPLHA
 pz0vnjtU3WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZiin5QAKCRDBN2bmhouD
 13gvD/9k585xOL0n6ZBs8N0MRHIClNoe8dC8Bcgcd1qpAbkQ8P8Lh3FW0m1qfieLQa0QNyeIwSe
 Rvfrxz39h1TkNm1k+R5dlLSEDDHkU0vb4sFLrQdgQ3r1dB4sOEDo4VXV1ht/IfpH6MCJNVJT6NF
 wUyo2o4nz0pmmYLhdxmTiqBaKLElxxeLIARh8RHaBSy36YWvESTPHNBYaGzjCfoBs5GA4NBATyi
 1My39dx8syZ2zTVViT3SG90JBOoviYkWAuXa/5yQs8d2JTqQHYixeEtKIBDpczwxlEN6tVAgXJ+
 ZF+PIX9cxO2zKm+Tbmd80s1l++zhRYmeAF2O6FT5gWp3h6aOP5kxa8r8FZCzfOuljRrBkDRdq9u
 kiA5cbSFBnjrWWbZqlstWGQEn7KO/p8uNm5n7rHHFyr4SuCo4nJmH/K9qqtW8wNS6oMKboPlITa
 aNALiq8KaTlvKJiA4NBJ/m0BYPNYP/y21a53Yn+d8A5fy7IBKHX+AcHN68K3G5Sn+LSwfYeHEp5
 +MSWpsUNuCbwvHssC/IsZOL90et6xH0u/07iYn3AYtERhllLFP5raywcO4fFHl6IAKy9qZqBCCW
 wIE/3gILn+FdQyyhGpirhigLu+PdapHVD8RMuLxfEykpaYU6EfqyOMEMyasldZTBbC/iiU8zui8
 /qqpxBvin0yKgmA==
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
 drivers/video/backlight/lms283gf05.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/lms283gf05.c b/drivers/video/backlight/lms283gf05.c
index 36856962ed83..a65490e83d3d 100644
--- a/drivers/video/backlight/lms283gf05.c
+++ b/drivers/video/backlight/lms283gf05.c
@@ -139,7 +139,7 @@ static int lms283gf05_power_set(struct lcd_device *ld, int power)
 	return 0;
 }
 
-static struct lcd_ops lms_ops = {
+static const struct lcd_ops lms_ops = {
 	.set_power	= lms283gf05_power_set,
 	.get_power	= NULL,
 };

-- 
2.43.0

