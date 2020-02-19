Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAAD165986
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 09:45:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7279A6ECF7;
	Thu, 20 Feb 2020 08:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A866EC69
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 18:10:05 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h23so1346992ljc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w8AByD+ELp+U0fkzTE0l2V9pOyhi/BIhszCAehVAQ1E=;
 b=mm4oywX2Nv0gEUy5q5BvavEnr/9cwOu5HwoESNSpYK9r5qLMd3qpGpucotlo0pJcKC
 bHsU5KbAYFVhaQRRgPJx6Cdn6diDXHkl5KsHi062Tp48Sz9XJaH5qpshjYYP9OvgTtPh
 vz+mVfsRNZZ4D86DoWA2h/RUpqhboXlxuYEJpXJfeXPuPmAP8MQzfqBR4fkF91h76dJ7
 XfCOSzF+gF7Ww7kbsxqJU+p+Ahq5oqM79Mym4v2xpMotE4w2iaxTzC1Ecd5UIRlXxAvf
 dZJUhriRCRKhcbEHYvnjaPXRTki6XPCvezD3RMJ6baXq/Im1N432midsBFMY/6muy9JH
 QtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w8AByD+ELp+U0fkzTE0l2V9pOyhi/BIhszCAehVAQ1E=;
 b=NzCmPduk2WgXegn5g0BmHdJHjme6OTfUEDJdtK7vh26N538VFYGRGNJL/b6cuve/CS
 abQshgNHHHCjefWgGQrgx/IsG4LEGm3uwuOKIc+NH2HtsZ6jeW+nzuZA/AmwpooyJm3E
 k22BGaXVnpQONF11cNQv2CVdH9sGooT+AyoS1ag/AfhM6v/b1NlV5lKsccPU8KaeabH8
 pmrt/m185Z+Gu2u6W8MqKN+pNoIw4pza41mM3WMjwB+zVFrXtPureqSjgzlFzwF5ZAtY
 SuVYj8fHxSSoMLp8IQ5DkwNBww7H9jN1HFHoK6YkEgBL4szHSf7JFvhC3XAWGFunreC/
 b3+A==
X-Gm-Message-State: APjAAAUK5H0/4/v19MkOK0lMI504KxX49jFUE6OWKqaxyS0JrfNFcLES
 nqxklkn0y9uq4eLXDTzyw8Yl2EyItau86w==
X-Google-Smtp-Source: APXvYqyoVOZJlYrqDiLelfLZ1O5stc2hez55EF10msHTP4C74OoJ7WA8VlAgqemf1FjjzI2fqSOVRA==
X-Received: by 2002:a2e:8702:: with SMTP id m2mr16967294lji.278.1582135804086; 
 Wed, 19 Feb 2020 10:10:04 -0800 (PST)
Received: from localhost.localdomain ([5.20.204.163])
 by smtp.gmail.com with ESMTPSA id 14sm183942lfz.47.2020.02.19.10.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 10:10:03 -0800 (PST)
From: Andrey Lebedev <andrey.lebedev@gmail.com>
To: mripard@kernel.org, wens@csie.org, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] drm/sun4i: tcon: Support LVDS output on Allwinner A20
Date: Wed, 19 Feb 2020 20:08:58 +0200
Message-Id: <20200219180858.4806-6-andrey.lebedev@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200219180858.4806-1-andrey.lebedev@gmail.com>
References: <20200210195633.GA21832@kedthinkpad>
 <20200219180858.4806-1-andrey.lebedev@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Feb 2020 08:45:37 +0000
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
Cc: Andrey Lebedev <andrey@lebedev.lt>, linux-sunxi@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrey Lebedev <andrey@lebedev.lt>

A20 SoC (found in Cubieboard 2 among others) requires different LVDS set
up procedure than A33. Timing controller (tcon) driver only implements
sun6i-style procedure, that doesn't work on A20 (sun7i).

Signed-off-by: Andrey Lebedev <andrey@lebedev.lt>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 37 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/sun4i/sun4i_tcon.h | 11 +++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index b7234eef3c7b..09ee6e8c6914 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -114,6 +114,30 @@ static void sun4i_tcon_channel_set_status(struct sun4i_tcon *tcon, int channel,
 	}
 }
 
+static void sun4i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
+				      const struct drm_encoder *encoder)
+{
+	regmap_write(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+		     SUN4I_TCON0_LVDS_ANA0_CK_EN |
+		     SUN4I_TCON0_LVDS_ANA0_REG_V |
+		     SUN4I_TCON0_LVDS_ANA0_REG_C |
+		     SUN4I_TCON0_LVDS_ANA0_EN_MB |
+		     SUN4I_TCON0_LVDS_ANA0_PD |
+		     SUN4I_TCON0_LVDS_ANA0_DCHS);
+
+	udelay(2); /* delay at least 1200 ns */
+	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA1_REG,
+			   SUN4I_TCON0_LVDS_ANA1_INIT,
+			   SUN4I_TCON0_LVDS_ANA1_INIT);
+	udelay(1); /* delay at least 120 ns */
+	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA1_REG,
+			   SUN4I_TCON0_LVDS_ANA1_UPDATE,
+			   SUN4I_TCON0_LVDS_ANA1_UPDATE);
+	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+			   SUN4I_TCON0_LVDS_ANA0_EN_MB,
+			   SUN4I_TCON0_LVDS_ANA0_EN_MB);
+}
+
 static void sun6i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
 				      const struct drm_encoder *encoder)
 {
@@ -1455,7 +1479,18 @@ static const struct sun4i_tcon_quirks sun6i_a31s_quirks = {
 	.dclk_min_div		= 1,
 };
 
+static const struct sun4i_tcon_quirks sun7i_a20_tcon0_quirks = {
+	.supports_lvds		= true,
+	.has_channel_0		= true,
+	.has_channel_1		= true,
+	.dclk_min_div		= 4,
+	/* Same display pipeline structure as A10 */
+	.set_mux		= sun4i_a10_tcon_set_mux,
+	.setup_lvds_phy		= sun4i_tcon_setup_lvds_phy,
+};
+
 static const struct sun4i_tcon_quirks sun7i_a20_quirks = {
+	.supports_lvds		= false,
 	.has_channel_0		= true,
 	.has_channel_1		= true,
 	.dclk_min_div		= 4,
@@ -1508,7 +1543,7 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun5i-a13-tcon", .data = &sun5i_a13_quirks },
 	{ .compatible = "allwinner,sun6i-a31-tcon", .data = &sun6i_a31_quirks },
 	{ .compatible = "allwinner,sun6i-a31s-tcon", .data = &sun6i_a31s_quirks },
-	{ .compatible = "allwinner,sun7i-a20-tcon0", .data = &sun7i_a20_quirks },
+	{ .compatible = "allwinner,sun7i-a20-tcon0", .data = &sun7i_a20_tcon0_quirks },
 	{ .compatible = "allwinner,sun7i-a20-tcon1", .data = &sun7i_a20_quirks },
 	{ .compatible = "allwinner,sun7i-a20-tcon", .data = &sun7i_a20_quirks },
 	{ .compatible = "allwinner,sun8i-a23-tcon", .data = &sun8i_a33_quirks },
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index 2974e59ef9f2..cfbf4e6c1679 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -193,6 +193,13 @@
 #define SUN4I_TCON_MUX_CTRL_REG			0x200
 
 #define SUN4I_TCON0_LVDS_ANA0_REG		0x220
+#define SUN4I_TCON0_LVDS_ANA0_DCHS			BIT(16)
+#define SUN4I_TCON0_LVDS_ANA0_PD			(BIT(20) | BIT(21))
+#define SUN4I_TCON0_LVDS_ANA0_EN_MB			BIT(22)
+#define SUN4I_TCON0_LVDS_ANA0_REG_C			(BIT(24) | BIT(25))
+#define SUN4I_TCON0_LVDS_ANA0_REG_V			(BIT(26) | BIT(27))
+#define SUN4I_TCON0_LVDS_ANA0_CK_EN			(BIT(29) | BIT(28))
+
 #define SUN6I_TCON0_LVDS_ANA0_EN_MB			BIT(31)
 #define SUN6I_TCON0_LVDS_ANA0_EN_LDO			BIT(30)
 #define SUN6I_TCON0_LVDS_ANA0_EN_DRVC			BIT(24)
@@ -201,6 +208,10 @@
 #define SUN6I_TCON0_LVDS_ANA0_V(x)			(((x) & 3) << 8)
 #define SUN6I_TCON0_LVDS_ANA0_PD(x)			(((x) & 3) << 4)
 
+#define SUN4I_TCON0_LVDS_ANA1_REG		0x224
+#define SUN4I_TCON0_LVDS_ANA1_INIT			(0x1f << 26 | 0x1f << 10)
+#define SUN4I_TCON0_LVDS_ANA1_UPDATE			(0x1f << 16 | 0x1f << 00)
+
 #define SUN4I_TCON1_FILL_CTL_REG		0x300
 #define SUN4I_TCON1_FILL_BEG0_REG		0x304
 #define SUN4I_TCON1_FILL_END0_REG		0x308
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
