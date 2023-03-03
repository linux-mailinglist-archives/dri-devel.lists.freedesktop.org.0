Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE79F6A96F9
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 13:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D3F10E5CA;
	Fri,  3 Mar 2023 12:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A0E10E5CA
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 12:06:32 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id bw19so1988572wrb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 04:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o4CVRkT00wDN2Fa83DiSDIePRGANN40JJ2ghpdtVgiE=;
 b=BIap55OlfFhERihj3vwiNDmo4umMdp82nwwLz8QsFoCnVYscUzxcBKiKGiS7wOBtNS
 Dr2iyyZz9h1GPzd1Fu/wTlnr/O1p0gQqlNIHun82LTkTmOkqrucXkQmt4aP3vGR4WJnH
 NHs5Q83GG+21uJKTP5vHgEbIlShJa2W9pmBUO9o736WWz/bH08e+I3EJipvToi4ZJXv6
 ojd1zvXUAsUHoS/YwMZNYvy2oL2WbHujiYOFsxYROk24t7qf9e6peOhLl3JuJYGeq5DS
 47EMnayvN+edKGykqK+br1n9AUn2SkblOs+x1701MCj84+FVpkm5tKUvZPyOo7PSjaNX
 00VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o4CVRkT00wDN2Fa83DiSDIePRGANN40JJ2ghpdtVgiE=;
 b=qPpltwyaaeCMFpBeD24RuAEqVoDEBfTRv3Vwebokh6PKpzzhfYVJCWYekNkos8T+LX
 Ahp/SsUeVF572fnwEL8Sx7v8KXDXuCuZxXvcxV/2ay1PqlO0b1crFmqv6I3EQSwiYVCU
 Z3p2sa8gN4ne0yZbqvTNLsGHGJfHak+/jGvyUHOY4iQhKedbXAN9jcYaq8AjZ+LstLrF
 +x9jyhnTUAr+5h4HpTjESnesM79vdDDtrOAjRApm6E1k10pIAuRLU9rBT96q7B2ro0rV
 tgB5wlC84QDvNN+0CM3njSP8Pbej/0Etv+hakqlLf0p9jsc3eZnn6v1Py3Lkkeg6j2U6
 jL2A==
X-Gm-Message-State: AO0yUKWVHOw4/LIVc0Rp9FHXPUaFjBoHO5Urt7Gv4z3/pfRV5vZBHRrQ
 eNwSHx6MfJBwGISXL46hHtw=
X-Google-Smtp-Source: AK7set9vuTqZGxAGpdazzvzEOD3vfnTS3TDJdUdtJ0rfP/eI2tCbGtxxFPZiAd+Zc4NqumSjWhajBg==
X-Received: by 2002:adf:fdcf:0:b0:2c7:17dd:ed6a with SMTP id
 i15-20020adffdcf000000b002c717dded6amr1085313wrs.33.1677845190360; 
 Fri, 03 Mar 2023 04:06:30 -0800 (PST)
Received: from toolbox.. ([87.200.95.144]) by smtp.gmail.com with ESMTPSA id
 n18-20020adfe352000000b002c567881dbcsm2030068wrj.48.2023.03.03.04.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 04:06:30 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/meson: fix 1px pink line on GXM when scaling video overlay
Date: Fri,  3 Mar 2023 12:06:26 +0000
Message-Id: <20230303120626.3281-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Playing media with a resolution smaller than the crtc size requires the
video overlay to be scaled for output and GXM boards display a 1px pink
line on the bottom of the scaled overlay. Comparing registers with the
downstream vendor driver revealed some differences:

- The vendor driver sets BIT(17) | BIT(13) for VPP_DOLBY_CTRL
- The vendor driver sets VPP_DUMMY_DATA

Setting those values prevents the 1px pink line from being seen.

Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
Suggested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/gpu/drm/meson/meson_registers.h | 2 +-
 drivers/gpu/drm/meson/meson_vpp.c       | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/meson/meson_registers.h
index 0f3cafab8860..e4af333fd839 100644
--- a/drivers/gpu/drm/meson/meson_registers.h
+++ b/drivers/gpu/drm/meson/meson_registers.h
@@ -534,7 +534,7 @@
 #define VPP_PEAKING_VGAIN 0x1d92
 #define VPP_PEAKING_NLP_1 0x1d93
 #define VPP_DOLBY_CTRL 0x1d93
-#define VPP_PPS_DUMMY_DATA_MODE (1 << 17)
+#define VPP_PPS_DUMMY_DATA_MODE (1 << 17 | 1 << 13)
 #define VPP_PEAKING_NLP_2 0x1d94
 #define VPP_PEAKING_NLP_3 0x1d95
 #define VPP_PEAKING_NLP_4 0x1d96
diff --git a/drivers/gpu/drm/meson/meson_vpp.c b/drivers/gpu/drm/meson/meson_vpp.c
index 154837688ab0..5df1957c8e41 100644
--- a/drivers/gpu/drm/meson/meson_vpp.c
+++ b/drivers/gpu/drm/meson/meson_vpp.c
@@ -100,6 +100,8 @@ void meson_vpp_init(struct meson_drm *priv)
 			       priv->io_base + _REG(VPP_DOLBY_CTRL));
 		writel_relaxed(0x1020080,
 				priv->io_base + _REG(VPP_DUMMY_DATA1));
+		writel_relaxed(0x42020,
+				priv->io_base + _REG(VPP_DUMMY_DATA));
 	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
 		writel_relaxed(0xf, priv->io_base + _REG(DOLBY_PATH_CTRL));
 
-- 
2.34.1

