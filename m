Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F6DAAECEE
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B3510E8B4;
	Wed,  7 May 2025 20:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ch8iU5/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54BA10E8AF
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:44 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-731e277a6b0so189146a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649364; x=1747254164; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dceCEKVUOKGa77JloXxMoEjB3aM9WeA8fBzF7lUwBv4=;
 b=Ch8iU5/l7KYYZCC/VLsWhcTBdjT4IV4gx07li7FoAG+4oOdxJ9Pq0eQ0pq/wGxctq3
 iISnlhBX8X+XMuLKdI5GlUiZEDdV6xxu31wGekXozMZCRIN9ktjCexrwsGt/cThq5bE7
 6C2TkESKD/fphCtBTqppNnbF40nxBdiasLDinxdfp3KHuSQ3JSrQslZusa7KZvDHDtYL
 +H+ojsycAMayZcq9G1Kc6uNoDutGbvvqO/RfecPza3BXaUkipg1ksR8Bx47fZohBQnTo
 4YA4C8s/tp9Xe6X9dOWX9h9zDZhOuyWkTDKs+L2LyynLB656/2KulBOt7BmZqG8F9mS1
 ibsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649364; x=1747254164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dceCEKVUOKGa77JloXxMoEjB3aM9WeA8fBzF7lUwBv4=;
 b=pbOO8VEvzRRuinpi9S9Fpy6nZcdPcBCjzy+ZId1DsyxMh/xzd65GS5cavk71FhREMN
 1wVkl0HD4KyVOaCTmsGQUDMEp+Xc4aAUyCEBXon44ZZFz3T1TqUeGbbIRZz/jo5qlRGF
 m0o9voAHjwO8nvpBJDCIBkTT+5/0Wapj/gALM4ckLDze4T1hDyRliA5xqAlX923MSY5K
 FGjVQ6ozekMeSTjCCH5vnE8ZiC8LwYmtyWqj5uYDHi45SwKA9cY5ybcnHp/t3T9lhkLR
 wWrgMafJ+h4c/UuHqG3/MagWuLBf53Fgm3/vBJckcQq4RFj2OaviKgtxhVMyQEvtWLs6
 FubA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeGyd59MASS9fkkQcH4rEQA3pj98V7PWWE+jCV0tZt3vFCKVj2Sq+XoKMwIp56dNuFZ3pfJ4MDAFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxiuzR8rW8kSJl7MosFVWMgq73mYhrVtkQsa0AqxHexUmzUkRj
 9eFAtRahd8LaJ3njBGhRbIFaCYY3T3lDulhpxnJv1SxEv5iyPVX+
X-Gm-Gg: ASbGncu8816e9vcIG65PgJlguSMGcNW7o+CHK5DlHqbXccbqJM6794gyjV+MyYh0G1A
 GB8uyD9MWKgDtH85r0MOkmqIPACVEZt9j6wMq+CZsR5/+lFrs3NhSgL9g7/3ufeYIxOQt03MOPR
 NGjBiD8rWK/Zc+cQJa9aa4WxuViLzQRvhrQ12/ht+6uyG3JLKghd03s6tR8Gk6UuLe5LXdhg9rr
 33VIWEy3QmfAWPkkw5x0kJWuD4TBdSYidbzEzUplARDYhoa+/IPXl8eV4RL686zLRQciERiVsYw
 /+QO25SsouFQSQtntcngEM+hcANGtWz3DVvimEQha6Y9yRdWCh31tdBA/SWd
X-Google-Smtp-Source: AGHT+IHzDb7Qz5DZFiGSa6Z3lnHv+87ODFBjRHAjTiD7jtWVu9q1Y73F4kwu/+T85cIKLmYaJUt5FA==
X-Received: by 2002:a05:6830:25d4:b0:727:2f79:ce33 with SMTP id
 46e09a7af769-7321c949800mr404858a34.28.1746649364088; 
 Wed, 07 May 2025 13:22:44 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:43 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: [PATCH V9 22/24] arm64: dts: allwinner: h616: add LCD and LVDS pins
Date: Wed,  7 May 2025 15:19:41 -0500
Message-ID: <20250507201943.330111-23-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The Allwinner H616 (and its H618, H700 and T507 package variants with
the same die) have 28 video output pins for RGB/SPI and LVDS display.
These are in GPIO Bank D and are multiplexed.

In RGB mode, pins PD0-PD23 are for 24-bit RGB pixel output, pins
PD24-PD27 are for clock, DE, HSYNC and VSYNC.

In LVDS mode, pins PD0-PD9 are for LVDS0 and LVDS1, and can be
configured by the H616 display engine for either one high-resolution
(dual link) or two low resolution displays.

Add device tree nodes for the LCD, LVDS0, and LVDS1 pins.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 129ce78ae5f3..3d8b412afb88 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -325,6 +325,32 @@ ir_rx_pin: ir-rx-pin {
 				function = "ir_rx";
 			};
 
+			/omit-if-no-ref/
+			lcd0_rgb888_pins: lcd0-rgb888-pins {
+				pins = "PD0", "PD1", "PD2", "PD3",
+				       "PD4", "PD5", "PD6", "PD7",
+				       "PD8", "PD9", "PD10", "PD11",
+				       "PD12", "PD13", "PD14", "PD15",
+				       "PD16", "PD17", "PD18", "PD19",
+				       "PD20", "PD21", "PD22", "PD23",
+				       "PD24", "PD25", "PD26", "PD27";
+				function = "lcd0";
+			};
+
+			/omit-if-no-ref/
+			lvds0_pins: lvds0-pins {
+				pins = "PD0", "PD1", "PD2", "PD3", "PD4",
+				       "PD5", "PD6", "PD7", "PD8", "PD9";
+				function = "lvds0";
+			};
+
+			/omit-if-no-ref/
+			lvds1_pins: lvds1-pins {
+				pins = "PD10", "PD11", "PD12", "PD13", "PD14",
+				       "PD15", "PD16", "PD17", "PD18", "PD19";
+				function = "lvds1";
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0", "PF1", "PF2", "PF3",
 				       "PF4", "PF5";
-- 
2.43.0

