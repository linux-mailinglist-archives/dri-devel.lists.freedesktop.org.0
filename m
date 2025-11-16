Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AB4C616B0
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 15:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EACC10E2BD;
	Sun, 16 Nov 2025 14:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=szczodrzynski.pl header.i=@szczodrzynski.pl header.b="bMtB0Qg/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s2.avantea.pl (s2.avantea.pl [46.242.128.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387D910E161
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 14:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ALqrvYx16IgQIglbpOnwhVRORNfwDsxM2tJC2QOGjhQ=; b=bMtB0Qg/1+SsHyMo3tyeEyYGtI
 nf4o+cbragiw/zKK0FphHMOpRJLSRcqI8fBYHJrhQIx8uUQpO9ygpW0MiJgNsapUrni94RTM2friZ
 eKZPqZTyySpbVNSdH4crYAkVFEpggWtlSfyH8hFwb7TAEldSnP0qGWNgG8IkROR7yyvmG7AzJdVUU
 xnOafJHM++YT5PkOVfrAKnOHqJqooeuXUNpEH2wMxliQy/KiaAqHdjz7JkAyZAdx0dKawY/b2/Q79
 To9wceIfxw19SgOKhIAKB8UXnGeo6HI4uDxpOUwCSPN+c6C3uSRKzgxHOvLQNE3VQecsGzGZPqhvA
 hp9vdaCQ==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
 by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <kuba@szczodrzynski.pl>)
 id 1vKcfw-0000000FW4E-1LDX; Sun, 16 Nov 2025 14:20:16 +0100
From: =?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
To: Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, parthiban@linumiz.com, paulk@sys-base.io
Subject: [PATCH v2 0/6] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
Date: Sun, 16 Nov 2025 14:18:47 +0100
Message-Id: <20251116131853.440863-1-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl
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

Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
MIPI DSI D-PHY" which is required when using single-link LVDS0. The same
PD0..PD9 pins are used for either DSI or LVDS.

Other than having to use the combo D-PHY, LVDS output is configured in
the same way as on older chips.

This series enables the sun6i MIPI D-PHY to also work in LVDS mode. It
is then configured by the LCD TCON, which allows connecting a
single-link LVDS display panel.

Changes in v2:
- Applied code formatting changes from review comments
- Changed "dphy" to "combo-phy"
- Made the LVDS setup/teardown functions abort early in case of error
  (adding a proper return value would require changes in several levels
   of caller functions; perhaps could be done in a separate patch)
- Added the PHY properties to DT bindings
- Renamed lvds0_pins to lcd_lvds0_pins
- Rebased on top of drm/misc/kernel/for-linux-next

Kuba Szczodrzyński (6):
  phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS in combo D-PHY
  drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
  drm/sun4i: Enable LVDS output on sun20i D1s/T113
  dt-bindings: display: sun4i: Add D1s/T113 combo D-PHY bindings
  riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON LCD0
  riscv: dts: allwinner: d1s-t113: Add LVDS0 pins

 .../display/allwinner,sun4i-a10-tcon.yaml     |  6 ++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 11 +++
 drivers/gpu/drm/sun4i/sun4i_tcon.c            | 50 +++++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.h            |  6 ++
 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   | 70 ++++++++++++++++++-
 5 files changed, 141 insertions(+), 2 deletions(-)

-- 
2.25.1

