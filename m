Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C34AAF0459
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 22:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B83510E64B;
	Tue,  1 Jul 2025 20:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68BC10E64B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 20:12:22 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id E0E731F0003D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 20:12:16 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id 39E1CAC9689; Tue,  1 Jul 2025 20:12:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
 autolearn_force=no version=4.0.0
Received: from localhost.localdomain (unknown [192.168.1.64])
 by laika.paulk.fr (Postfix) with ESMTP id 5A449AC967D;
 Tue,  1 Jul 2025 20:11:30 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>,
 Icenowy Zheng <icenowy@aosc.xyz>, Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 0/5] sunxi: Various minor V3s clock/pinctrl fixes
Date: Tue,  1 Jul 2025 22:11:19 +0200
Message-ID: <20250701201124.812882-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
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

This is a mixed-bag of minor fixes for V3s clocks and pinctrl.

The last patch is a weak attempt at accomodating using both the display
engine and tcon along with the camera subsystem. The main issue is that
the tcon and de need to have the same clock parent, which may not be
the case depending on the pixel rate. Bringing the de block to the same
clock rate as the csi block helps in some cases.

Paul Kocialkowski (5):
  pinctrl: sunxi: v3s: Fix wrong comment about UART2 pinmux
  clk: sunxi-ng: v3s: Fix CSI SCLK clock name
  clk: sunxi-ng: v3s: Fix CSI1 MCLK clock name
  clk: sunxi-ng: v3s: Fix TCON clock parents
  drm/sun4i: Run the mixer clock at 297 MHz on V3s

 .../bindings/media/allwinner,sun6i-a31-csi.yaml    |  2 +-
 .../bindings/media/allwinner,sun6i-a31-isp.yaml    |  2 +-
 .../media/allwinner,sun6i-a31-mipi-csi2.yaml       |  2 +-
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi         |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c               | 14 +++++++-------
 drivers/gpu/drm/sun4i/sun8i_mixer.c                | 12 ++++++------
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c          |  2 +-
 include/dt-bindings/clock/sun8i-v3s-ccu.h          |  2 +-
 8 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.49.0

