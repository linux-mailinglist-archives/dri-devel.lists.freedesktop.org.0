Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C82ED8C10CD
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 16:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC2710E9AE;
	Thu,  9 May 2024 14:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VrUYsT2V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE0610E9AE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 14:04:51 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-34d8f6cfe5bso625236f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 07:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715263489; x=1715868289; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ygKOaLULm9Ty8/azGUq2u8NIEd5rcobuUSoqUbVVSBY=;
 b=VrUYsT2VnKzJqfRmKW1G9duWWQ/bunRioZmXGi878aCGHLgpoDn3D4Nskk3mGb1V60
 zCbFFkhGMVLQDux8cZ59SgOgfyUy5hbitP9vDXIskZuuD3bAxmKI4d+5kSO4pVJP45qM
 Z4848HW1sICiy3brPhYxZYtzoW71LYI7b/g6kUWpl1DAo0LHOL2h9WMehI16BAQaB4zp
 TCnXew7APUpn/gNZ+kr6EJ+UCmiQJZYr4yHjZND5OgclALJnQbSCTNcc4u9zd+CWD3+J
 JM6/TrZase4egLhQYO6IzwBtYR7fwWJHp1hMlAfg1f/ekxxJ179MpWymYsCGMEyyCU2d
 bCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715263489; x=1715868289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ygKOaLULm9Ty8/azGUq2u8NIEd5rcobuUSoqUbVVSBY=;
 b=G52bXD1+l9PbCZcNzBNgpzjNLia1KoJxc1wTmoxKWJ4C6KQDHa8UF0DGSqU/3vg86n
 ltkXo2PIIHa25xrmc5XqJ21Nn0cUF8EcvU+gQfXy0DPhDMZFU8Aeof/ZaGsq69JGeNZ1
 uDmY0lUvmr7xUb0Z1ll9UlID2RsO7fFj2uirHtzuzGx4FTOKkMPZUyFZbMYvTX9pCYWH
 8t0Yq/64+FnOevjctCiWdketpkm7GT5SEfK3BewgEMh+lnDpMbibto9u9PthuqXvWaOd
 m7wwS59F3gzd+LIJZ60sgCImtc5MKppdhE/KdTlzlatytpOv0H5AHL9mgUC99pjI6L6y
 IA0g==
X-Gm-Message-State: AOJu0Yw5qoXGspSP7pYgsPTmI9HzdrSO0a8n7d6m9xlsIvtffDSyexfb
 kAmOFwNKMNSu86MDs+y2kFNextf629wU7fXUaqRYgkvBKjUEFh4=
X-Google-Smtp-Source: AGHT+IGJQUoq4KBpZVLF1jIA/JtqfJbPLkQQBLMgSeQVY1xajdJgFURlR2LWCEqpPMRCfEMg1QA8dQ==
X-Received: by 2002:a5d:6e55:0:b0:34a:3f3d:bb14 with SMTP id
 ffacd0b85a97d-34fca242709mr3566295f8f.27.1715263489393; 
 Thu, 09 May 2024 07:04:49 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:b44:d8c3:6fa8:c46f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b896a29sm1788467f8f.43.2024.05.09.07.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 07:04:48 -0700 (PDT)
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
Date: Thu,  9 May 2024 16:04:32 +0200
Message-ID: <20240509140438.168429-2-knaerzche@gmail.com>
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

