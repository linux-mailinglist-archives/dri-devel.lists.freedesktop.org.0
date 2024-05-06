Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1A88BD592
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 21:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB2210EEA5;
	Mon,  6 May 2024 19:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NFU8BLbD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFB210EEA5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 19:43:59 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a59c04839caso435560466b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 12:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715024638; x=1715629438; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V4nG5Ru4AQ6B28lW7pREyT/j4oSGmxSZ0QdDsskHOqY=;
 b=NFU8BLbDWVsCJouDKYrtCdH4R79czdn1i6bxGOLv84tlD87Ur2UNjoC6rMCCnRHiGY
 X0PvstHqW7GSHlyzF76tneEtglYQ7SYFbBrjHQLUHu7CC/UBr8CrIWB2HbAnnSLnGGpf
 h9/Po2tosfcnCcFmTap4G8X73Mwftz5de/UXkElYyL8hkAzVcgKXumMjEG2/9vwu35+U
 abJZATeCUJ/aRzUvBA0yWalG98GBCxX0avQNVLtWsklQyzrcsYOR/kYdThM2Am59xtiJ
 1BxV0JzxGzvke4i0Rl9tuxl000jSuFP+JJzrcxlVYBoZQu/keDg5j6m7t3ANLNapKa7p
 5ZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715024638; x=1715629438;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V4nG5Ru4AQ6B28lW7pREyT/j4oSGmxSZ0QdDsskHOqY=;
 b=kLVYYdCdKinL0Y2e8Jc+bDFAlqGlSWDK6VS+b7qphuUqfskkBFCqyX+wmG8RR1qR0n
 NQRvPR2votUgkVOp9zvNC8sMRSKHkQeGNpNnyEGnwRUXe1ivyYJTBH3j7CWmSQzsX1E0
 sIkC436idwGQkWKndsUwFWVSoSxJ5La+tUuiMLlc7PzK9kLExVlcTAkzMjVV1G3Lfy73
 6aeDs2rxPUJ/IlWRleYaXqFEq2+grOmD8wENAHyUsobEDfjv97+bJqZ762OdOV4udAsL
 1t/bIpjFdon52pbvukUEOZx44TW8GgZ4d32jegEYyqUyLZRBrNnGISxKECXxSixiqWal
 PQhg==
X-Gm-Message-State: AOJu0YyAFQHNIdC3lVT7JeAFmDfreed1AuXMHl6Zsrus8t9jYXiomZ/G
 vHETVcYxmQ2KnwxvczpACQTawG8PIqlwLfH36ZPdxGzU7OZP3r8=
X-Google-Smtp-Source: AGHT+IG5wO/BC2YkyOc0seTpxcAbP5RUVkEbXlDffmS6YgXfw+RgMayivTNE82/BCMH/QU9lmivYAQ==
X-Received: by 2002:a17:907:94ca:b0:a59:cb29:3fb2 with SMTP id
 dn10-20020a17090794ca00b00a59cb293fb2mr3186521ejc.57.1715024637718; 
 Mon, 06 May 2024 12:43:57 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:1c62:e77:6753:5729])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a1709067f8d00b00a59d146f034sm1367321ejr.132.2024.05.06.12.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 12:43:57 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Alex Bee <knaerzche@gmail.com>
Subject: [PATCH 0/7] Add DSI support for RK3128
Date: Mon,  6 May 2024 21:43:35 +0200
Message-ID: <20240506194343.282119-1-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.2
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

This series aims to add support for the DesignWare MIPI DSI controller and
the Innoslicon DPHY found in RK3128 SoCs. The code additions are rather
tiny: It only need some code in the Rockchip dw-mipi-dsi glue layer for
this SoC and some changes in the clock driver. Support for the DPHY has
already been added when the driver was initially submitted. I tested it
with a 800x1280 DSI panel where all 4 lanes that are supported are used.

Alex Bee (7):
  dt-bindings: display: rockchip,dw-mipi-dsi: Document RK3128 DSI
  dt-bindings: clock: rk3128: Add PCLK_MIPIPHY
  clk: rockchip: rk3128: Export PCLK_MIPIPHY
  clk: rockchip: rk3128: Add hclk_vio_h2p to critical clocks
  drm/rockchip: dsi: Add support for RK3128
  ARM: dts: rockchip: Add DPHY for RK3128
  ARM: dts: rockchip: Add DSI for RK3128

 .../rockchip/rockchip,dw-mipi-dsi.yaml        |  2 +
 arch/arm/boot/dts/rockchip/rk3128.dtsi        | 49 +++++++++++++++++++
 drivers/clk/rockchip/clk-rk3128.c             |  3 +-
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 20 ++++++++
 include/dt-bindings/clock/rk3128-cru.h        |  1 +
 5 files changed, 74 insertions(+), 1 deletion(-)

-- 
2.43.2

