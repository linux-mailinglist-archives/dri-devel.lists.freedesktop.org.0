Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 735FB8C10D4
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 16:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8250410EA2E;
	Thu,  9 May 2024 14:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K4M3laul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BA910EA2E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 14:06:58 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-41b79450f78so5856915e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 07:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715263616; x=1715868416; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ygKOaLULm9Ty8/azGUq2u8NIEd5rcobuUSoqUbVVSBY=;
 b=K4M3laulfyrZkwzCXYZRVosY5yPkAFaiIQpqJobyrhuIaOgF+cxI9azSGgRmy/8k/L
 CZhOQCHpWMbWsN3FwdBg/UarsfMNREeKWqR4WcL/21YRbj1hNaYjLXxfhX5BI2E4KN69
 K8Tcod54hCAIpRjMQdojH6BIUregy775wTZNm57M+1PHIFZPNZ5/LMJRUb2G9Z2ZrRN+
 IV11MBjbYmCAmSufEFTb5TrxUcoTii6ilTZi7cJyclzXwAooJVwTK0vHlx4ivRs+z7pP
 39jqc+a0We0EodRUqNMsZaR919r2D1ELTtSIgWRmAy++Gt162vdwCnBTsgbdD2GqdvSM
 EwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715263616; x=1715868416;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ygKOaLULm9Ty8/azGUq2u8NIEd5rcobuUSoqUbVVSBY=;
 b=NbMeJTyrSb3MZFS8hfi8po8g0fqVOOCSaNLKARxXJS+CiKq+eBb+vE3GTid/YlwWtK
 A9J5zP4rO6grqzeqAsGoRutszhAmB7YiuV704F/1Uydko2HmXg6yGVyBHFlI4XJmiB4o
 xQPlweBP5IWaMFoZeNUVTjGvlrgpUf+gI4zhW2yG9T8xKay0Ag71yAOw9iywgdpj1yIO
 g8xX8jF8XlhBsT3WjuA2aDNk9+rEWPyK81euZ8YQmmsTxhIk5HtB9AuPxdL0zeMZbOLI
 TylMXy+54El08OKTtKTS5/bNyL1brlH8o1PflasCNTAYY+zVS1NUtpTQq07UYHZfYVze
 oqxQ==
X-Gm-Message-State: AOJu0YyhchzjP3BL+f80bSDl1/hAsPXXq8aAd0KeU8yzdGJxTrJd9bk0
 WWUhfHVHY/t0f+qOfxIDuMI2aB5VLv5CXnNN0xHcdn3dNZ0FD7k=
X-Google-Smtp-Source: AGHT+IHVkPjBZZWpO88u2YrMojjQRZm2+OXl2pDCRbpsX72BfqrrTJABv2eO9OkV1+awudthPDrRNQ==
X-Received: by 2002:a05:600c:4f0c:b0:41a:8b39:8040 with SMTP id
 5b1f17b1804b1-41f71ec26d4mr53830265e9.20.1715263616318; 
 Thu, 09 May 2024 07:06:56 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:b44:d8c3:6fa8:c46f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baad058sm1793311f8f.66.2024.05.09.07.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 07:06:55 -0700 (PDT)
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
Subject: [PATCH v3 0/7] Add DSI support for RK3128
Date: Thu,  9 May 2024 16:06:46 +0200
Message-ID: <20240509140653.168591-1-knaerzche@gmail.com>
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
the Innoslicon D-PHY found in RK3128 SoCs. The code additions are rather
tiny: It only need some code in the Rockchip dw-mipi-dsi glue layer for
this SoC and do some changes in the SoC's clock driver. Support for the phy
was already added when the Innosilicon D-PHY driver was initially
submitted. I tested it with a 800x1280 DSI panel where all 4 lanes that are
supported are used.

changes in v2:
  To improve power-efficiency when the DSI controller is not in use, I
  dropped the patch which made hclk_vio_h2p a critical clock and instead
  added support for an AHB clock to the DSI controller driver and updated
  the bindings and the addition to the SoC DT accordingly.

Link to v1:
https://lore.kernel.org/linux-kernel/20240506194343.282119-1-knaerzche@gmail.com/

changes in v3:
 Dropped the changes for the additional AHB clock for the DSI controller,
 as it's not part of the IP block. (Heiko)

Link to v2:
https://lore.kernel.org/linux-kernel/20240509120715.86694-1-knaerzche@gmail.com/

Please see individual patches for details about the changes.

Alex Bee (7):
  dt-bindings: display: rockchip,dw-mipi-dsi: Document RK3128 DSI
  dt-bindings: clock: rk3128: Add PCLK_MIPIPHY
  clk: rockchip: rk3128: Export PCLK_MIPIPHY
  clk: rockchip: rk3128: Add hclk_vio_h2p to critical clocks
  drm/rockchip: dsi: Add support for RK3128
  ARM: dts: rockchip: Add D-PHY for RK3128
  ARM: dts: rockchip: Add DSI for RK3128

 .../rockchip/rockchip,dw-mipi-dsi.yaml        |  2 +
 arch/arm/boot/dts/rockchip/rk3128.dtsi        | 50 +++++++++++++++++++
 drivers/clk/rockchip/clk-rk3128.c             |  3 +-
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 20 ++++++++
 include/dt-bindings/clock/rk3128-cru.h        |  1 +
 5 files changed, 75 insertions(+), 1 deletion(-)

-- 
2.43.2

