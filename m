Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8954B15D363
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7BD6E528;
	Fri, 14 Feb 2020 08:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB4C6E3EB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 20:19:48 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id z26so5157134lfg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 12:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U3x8LznwfIOHEzFKzlxdqFwRCUCKp/X5F3uTKb+5kO8=;
 b=r2+YQvtLkH+6NOSpbgQnCewgfpF7LBPvBzm4isPF4njR+V4ekkCMBOvimCgWdEJffi
 wJYESGzRKbWgVhV3UPYtOVHHXDkgoPceXxjjS1FRH/+Ujwr1yeMyy0oRJqL1PQ/igMUW
 AKUcQ+IwYPU8uxwfVNZiu4VRR2EMTdxfOZyBtkBjBNkoq1UzSuuVJGnqD5bO0Um+RV+a
 smuEe1miOcWDkOBreXV214HcTvoSQpkKpmHDzC2FTLTl0oM7Yccp0qJ9/O/RHK0HHXj1
 dho2ybH4FqndggvgmNC9UBwRuoAyIMtDKa7MvhWofmUuda84bN1hqJJNKxJQqvbfkQ8Q
 G3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U3x8LznwfIOHEzFKzlxdqFwRCUCKp/X5F3uTKb+5kO8=;
 b=uXxzW8nKW8avGmEDjRRlINBp+YFbcqkhjmGT+MVHSZgsEUyvbqY07fhNPxED8r7KE6
 kKjcb9r8+Q9ebHuOSI0H2FRFYeuiJnrVy6MkwNIoOI8UDPSLnGe0GiAWROv6rfeE2ESY
 DxbpIyLg9oUBYlKHHTwjhsCIXVq8qndPR4zrLt3gyzLwRlqrszJr1rUSEaKZEAxo+qeO
 3A/88AfMe1epNdFFURZRElIrEuqzNcHpUTZgGMq2FILf/Lc+PUl63IMo2tRYoaLbvF/H
 eRFM6BmUQQpn9ZlnjTu6A3L5sVSoaZouvaBCsmSaJmYpZMGHK13tdrLBYbx+VeXbppAZ
 YgBA==
X-Gm-Message-State: APjAAAVRsig7jX/SEtDCgAfxN4dFAILA3OdvCZySaaPHfLswADk9y+46
 7znJ+HpR0WNyzW4oO2VVjWo=
X-Google-Smtp-Source: APXvYqwaV3CvaxrlgCrOBOI9930fkISOFChEKsVF5+xwRyqJo9wJcYQPvXTiNMesnavqYkViTuhz5A==
X-Received: by 2002:a19:ee1a:: with SMTP id g26mr10058246lfb.147.1581625187334; 
 Thu, 13 Feb 2020 12:19:47 -0800 (PST)
Received: from localhost.localdomain ([5.20.204.163])
 by smtp.gmail.com with ESMTPSA id s22sm2209470ljm.41.2020.02.13.12.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 12:19:46 -0800 (PST)
From: Andrey Lebedev <andrey.lebedev@gmail.com>
To: mripard@kernel.org, wens@csie.org, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] drm/sun4i: tcon: Support LVDS output on Allwinner A20
Date: Thu, 13 Feb 2020 22:18:55 +0200
Message-Id: <20200213201854.810-2-andrey.lebedev@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200210195633.GA21832@kedthinkpad>
References: <20200210195633.GA21832@kedthinkpad>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Feb 2020 08:07:58 +0000
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
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.h | 11 +++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index cc6b05ca2c69..800a9bd86112 100644
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
@@ -1456,11 +1480,13 @@ static const struct sun4i_tcon_quirks sun6i_a31s_quirks = {
 };
 
 static const struct sun4i_tcon_quirks sun7i_a20_quirks = {
+	.supports_lvds		= true,
 	.has_channel_0		= true,
 	.has_channel_1		= true,
 	.dclk_min_div		= 4,
 	/* Same display pipeline structure as A10 */
 	.set_mux		= sun4i_a10_tcon_set_mux,
+	.setup_lvds_phy		= sun4i_tcon_setup_lvds_phy,
 };
 
 static const struct sun4i_tcon_quirks sun8i_a33_quirks = {
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
