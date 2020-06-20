Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CF820304A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99FB6E22C;
	Mon, 22 Jun 2020 07:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24A2892B0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 15:58:17 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id gl26so13516113ejb.11
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 08:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=URfmF5zJlOcOhtFLjxyic0QyuCH3AQC3KnEdMwqUPZ0=;
 b=aRRZnSLCo8mhBuXJUHE+8cMgPXIWw4czxpU/mgGuaOBBYdCnqoQ3wLrG7/+2XxRyQQ
 kGxzAemV1pF2eJ2eWCRHjJJplwjeTI9QTCjmAq2y9EClfnWnqMr5jZaK1Q4QVlt2HUZK
 0K5YaK3/ZiENJlUg9jHch9mmLFYmDa/RV3IFLz+KXM6zlcLFPa3uElrJyVRCfReE+BE7
 y5Iam7JDs0Vn9w+C1t/Quau0USaKxYJ2l+12AH1u6ZLX86OBbRh5XXMHf2OgPp4Uh8cv
 z8u9O7YCIk0XHrzHU9x0mcHmrGvlQY1FqqbcEpSp9Q3B+SYW4dEKb3yWcf6+C5jvhYuF
 y4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=URfmF5zJlOcOhtFLjxyic0QyuCH3AQC3KnEdMwqUPZ0=;
 b=HMGGC3AgM4Zi7wv1RoRdYBfjlaOgp6085fouCXRktdrX/kikyixkXrGsxphDV6Mo3N
 kcrNRP1FKtoo/p7fPjB47VgCmFyaY+HNWlKEPjWFMgiWUTZIQnmiRXeTKJsn/VJrVatg
 iXF+Tz3xHdjeantjIRUxDgIoS/oOVXcGGiEeM5ymN+LxxPUyM5jz22nBTr8ctmkBKa6I
 f2Jj8zG/lNrmo1WkUUzKkfIC3RdGZPp3twQ/sfwg7wIwvRARWTu0dtYK8Wl++YpjWczb
 u/0//3PE3KWOSA3i5/fyCMBkLlWOGNt5UUeOLq4gKiJi05Smb8eVVpHl6ueyfJDMJvWT
 g0sQ==
X-Gm-Message-State: AOAM531dmTgJoptwTL0ZaYj31eZjGeQVmmJzd7oH6nX/E9D99YnR841C
 vYFZ0RQ4N3CxdCoyd8/pnXo=
X-Google-Smtp-Source: ABdhPJy99Zp7FW/lLQW54XKAHKHdIN3zBL7LCt43g0W5sKxHR8WoM342wP5Z9toUDOBG31W2t+Jp2w==
X-Received: by 2002:a17:906:2e4b:: with SMTP id
 r11mr3004840eji.227.1592668696360; 
 Sat, 20 Jun 2020 08:58:16 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1371df700428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371d:f700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id gj10sm7545001ejb.61.2020.06.20.08.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 08:58:15 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jmasson@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH RESEND v1] drm/meson: viu: fix setting the OSD burst length in
 VIU_OSD1_FIFO_CTRL_STAT
Date: Sat, 20 Jun 2020 17:57:52 +0200
Message-Id: <20200620155752.21065-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The burst length is configured in VIU_OSD1_FIFO_CTRL_STAT[31] and
VIU_OSD1_FIFO_CTRL_STAT[11:10]. The public S905D3 datasheet describes
this as:
- 0x0 = up to 24 per burst
- 0x1 = up to 32 per burst
- 0x2 = up to 48 per burst
- 0x3 = up to 64 per burst
- 0x4 = up to 96 per burst
- 0x5 = up to 128 per burst

The lower two bits map to VIU_OSD1_FIFO_CTRL_STAT[11:10] while the upper
bit maps to VIU_OSD1_FIFO_CTRL_STAT[31].

Replace meson_viu_osd_burst_length_reg() with pre-defined macros which
set these values. meson_viu_osd_burst_length_reg() always returned 0
(for the two used values: 32 and 64 at least) and thus incorrectly set
the burst size to 24.

Fixes: 147ae1cbaa1842 ("drm: meson: viu: use proper macros instead of magic constants")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
re-send of v1 [0] with no changes as I still noticed that this is
sitting in my tree and I wasn't asked to change anything in v1.


[0] https://patchwork.kernel.org/patch/11510045/


 drivers/gpu/drm/meson/meson_registers.h |  6 ++++++
 drivers/gpu/drm/meson/meson_viu.c       | 11 ++---------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/meson/meson_registers.h
index 8ea00546cd4e..049c4bfe2a3a 100644
--- a/drivers/gpu/drm/meson/meson_registers.h
+++ b/drivers/gpu/drm/meson/meson_registers.h
@@ -261,6 +261,12 @@
 #define VIU_OSD_FIFO_DEPTH_VAL(val)      ((val & 0x7f) << 12)
 #define VIU_OSD_WORDS_PER_BURST(words)   (((words & 0x4) >> 1) << 22)
 #define VIU_OSD_FIFO_LIMITS(size)        ((size & 0xf) << 24)
+#define VIU_OSD_BURST_LENGTH_24          (0x0 << 31 | 0x0 << 10)
+#define VIU_OSD_BURST_LENGTH_32          (0x0 << 31 | 0x1 << 10)
+#define VIU_OSD_BURST_LENGTH_48          (0x0 << 31 | 0x2 << 10)
+#define VIU_OSD_BURST_LENGTH_64          (0x0 << 31 | 0x3 << 10)
+#define VIU_OSD_BURST_LENGTH_96          (0x1 << 31 | 0x0 << 10)
+#define VIU_OSD_BURST_LENGTH_128         (0x1 << 31 | 0x1 << 10)
 
 #define VD1_IF0_GEN_REG 0x1a50
 #define VD1_IF0_CANVAS0 0x1a51
diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
index 304f8ff1339c..aede0c67a57f 100644
--- a/drivers/gpu/drm/meson/meson_viu.c
+++ b/drivers/gpu/drm/meson/meson_viu.c
@@ -411,13 +411,6 @@ void meson_viu_gxm_disable_osd1_afbc(struct meson_drm *priv)
 			    priv->io_base + _REG(VIU_MISC_CTRL1));
 }
 
-static inline uint32_t meson_viu_osd_burst_length_reg(uint32_t length)
-{
-	uint32_t val = (((length & 0x80) % 24) / 12);
-
-	return (((val & 0x3) << 10) | (((val & 0x4) >> 2) << 31));
-}
-
 void meson_viu_init(struct meson_drm *priv)
 {
 	uint32_t reg;
@@ -444,9 +437,9 @@ void meson_viu_init(struct meson_drm *priv)
 		VIU_OSD_FIFO_LIMITS(2);      /* fifo_lim: 2*16=32 */
 
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
-		reg |= meson_viu_osd_burst_length_reg(32);
+		reg |= VIU_OSD_BURST_LENGTH_32;
 	else
-		reg |= meson_viu_osd_burst_length_reg(64);
+		reg |= VIU_OSD_BURST_LENGTH_64;
 
 	writel_relaxed(reg, priv->io_base + _REG(VIU_OSD1_FIFO_CTRL_STAT));
 	writel_relaxed(reg, priv->io_base + _REG(VIU_OSD2_FIFO_CTRL_STAT));
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
