Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B3C8C0F30
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 14:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6B110E110;
	Thu,  9 May 2024 12:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a2+HdN29";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B117B10E110
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 12:07:23 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-41fd5dc0439so2814045e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 05:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715256442; x=1715861242; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wXW0NpQxST0KcyNsoS559akCnXX6lhKBOvqAS2ZY6IQ=;
 b=a2+HdN29+gQy0gK0hwDPKH+VlNREAnikoR8oQSAwVtUks3JFnOjYVXJRnGJDv7GdS6
 2/+OOJd9yXOwUeyyQ1u6c1NeNsNubF8kZPnU1y8Qr2OS/HIfjwZcw0bfsqqEs6DdehL3
 l0HhsEgfIgYqvfwo+NoEVJD4UAzP8OUEiT8AkrDFEjfttcMT7xKkWtIDQjHv+ubID7MM
 f3OVyhqmHAuKrfdnSTv3T8CE1xBHtFtqHdHvtCeVagB0fTaNlrkHFp113WbXspQMzVxW
 cJo1t81a5ELUlDZqeeea8sbzS9PLdQlttLPU6k5ebtE6338lMpFd24wP+RYLcbntJthr
 9G9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715256442; x=1715861242;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wXW0NpQxST0KcyNsoS559akCnXX6lhKBOvqAS2ZY6IQ=;
 b=Xhtj6WYta7IHo3SwFpYNOWjt4FblFVMzIzom+Tux8qf3PilCi8K+6jKqdh5PED5D4a
 buapBld7K0YzciduDPDl0OwDbFaER/hg10YSKogwZJEFEuRXVz709mBI8ZBdTO3LBAFr
 Foq0vdEC7DDvoJskwhUI8ZLKykR4FVYjy15wRgIUD+YLuNM+jf/g1u/OVof/xM+fevN+
 tHvnZGZqqGBHmcgctAUyKGMiRsk501j4CUJfy0uQSi6YssAyowBdZilG183/POpfVTly
 SvyDxGiQxllFaKLdjjTJm4DE6ehMDKhR3h8Y0e4T83SaXcl15MiaowRCP6IZS4Yq1SZS
 SziA==
X-Gm-Message-State: AOJu0Yw+l9KcQJSfUKiFmKcBNi1o6ykuZu2LvOMQumoOfsl9+KUG7SSy
 n8llBFSaXi8qcpXPbXMZDax9zNxS77kHnmSm9nPRXytydOafvPk=
X-Google-Smtp-Source: AGHT+IHiTcqgDtLhCAgVy2xR30nYXqmOfWtS5RaJG90R9viY5LmZtTGSnjgy7WvJDU+f7B9EzWGwWg==
X-Received: by 2002:a05:600c:348c:b0:41c:1434:f571 with SMTP id
 5b1f17b1804b1-41f71ad0a6amr46179165e9.37.1715256441686; 
 Thu, 09 May 2024 05:07:21 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:b44:d8c3:6fa8:c46f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce1912sm24112005e9.11.2024.05.09.05.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 05:07:21 -0700 (PDT)
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
Subject: [PATCH v2 0/7] Add DSI support for RK3128
Date: Thu,  9 May 2024 14:07:08 +0200
Message-ID: <20240509120715.86694-1-knaerzche@gmail.com>
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
this SoC, add support for an additional clock and do some changes in the
SoC's clock driver. Support for the phy was already added when the
Innosilicon D-PHY driver was initially submitted. I tested it with a
800x1280 DSI panel where all 4 lanes that are supported are used.

changes in v2:
  To improve power-efficiency when the DSI controller is not in use, I
  dropped the patch which made hclk_vio_h2p a critical clock and instead
  added support for an AHB clock to the DSI controller driver and updated
  the bindings and the addition to the SoC DT accordingly.

Link to v1:
https://lore.kernel.org/linux-kernel/20240506194343.282119-1-knaerzche@gmail.com/

Please see individual patches for details about the changes.

Alex Bee (7):
  dt-bindings: display: rockchip,dw-mipi-dsi: Document RK3128 DSI
  dt-bindings: clock: rk3128: Add PCLK_MIPIPHY
  clk: rockchip: rk3128: Export PCLK_MIPIPHY
  drm/rockchip: dsi: Support optional AHB clock
  drm/rockchip: dsi: Add support for RK3128
  ARM: dts: rockchip: Add D-PHY for RK3128
  ARM: dts: rockchip: Add DSI for RK3128

 .../rockchip/rockchip,dw-mipi-dsi.yaml        | 25 +++++++++-
 arch/arm/boot/dts/rockchip/rk3128.dtsi        | 50 +++++++++++++++++++
 drivers/clk/rockchip/clk-rk3128.c             |  2 +-
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 45 +++++++++++++++++
 include/dt-bindings/clock/rk3128-cru.h        |  1 +
 5 files changed, 121 insertions(+), 2 deletions(-)

-- 
2.43.2

