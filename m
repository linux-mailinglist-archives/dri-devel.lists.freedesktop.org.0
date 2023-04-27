Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 591126F12BE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 09:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A24410E36C;
	Fri, 28 Apr 2023 07:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C489C10EB14
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 09:16:54 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
 by mail.gandi.net (Postfix) with ESMTPSA id 4F5721BF20B;
 Thu, 27 Apr 2023 09:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
 t=1682587010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qyG9+gfvXxHgY4xjE51TQp+TEhpzgbUoMouaN8SoApA=;
 b=Q3NOrROXvABtDDchHYtp2kMYBn5EktZ7FWG2pI8mE0i3ZMHsSKepON8uIQCTNEG+VkCZ1R
 eRXBCHVzdEldNX0d5jTA1BZgLw/gHdRlHzuy0/g4A0hgxE0oVHrWt6uHnaAVOIx75fwGv2
 dwK93MwV/HDF1ykZr8095sJa+XI9ddXM1FDlxr+Ty70yeViCGHOoHDspxVb9sI0YkA2CQp
 GFteNZeEhq7M0cdSHI9VDv3rf//uPzooRWwD/3wxCNSEJZNIZ6Kf24GR207BoXlGurDSn+
 RrUyb3DFuosiIpBxX2sz0RV8Lg9EGFqECBqLcOVhBmbmnzv3EmedwHWvEE66LQ==
From: Roman Beranek <me@crly.cz>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Subject: [PATCH v3 0/7]  drm: sun4i: set proper TCON0 DCLK rate in DSI mode
Date: Thu, 27 Apr 2023 11:16:04 +0200
Message-Id: <20230427091611.99044-1-me@crly.cz>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Apr 2023 07:47:34 +0000
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
Cc: linux-kernel@vger.kernel.org, Frank Oltmanns <frank@oltmanns.dev>,
 dri-devel@lists.freedesktop.org, Roman Beranek <me@crly.cz>,
 Ondrej Jirman <megi@xff.cz>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to Allwinner's BSP code, in DSI mode, TCON0 clock needs to be
running at what's effectively the per-lane datarate of the DSI link.
Given that the TCON DCLK divider is fixed to 4 (SUN6I_DSI_TCON_DIV),
DCLK can't be set equal to the dotclock. Therefore labeling TCON DCLK
as sun4i_dotclock or tcon-pixel-clock shall be avoided.

With bpp bits per pixel transmitted over n DSI lanes, the target DCLK
rate for a given pixel clock is obtained as follows:

DCLK rate = 1/4 * bpp / n * pixel clock

Effect of this change can be observed through the rate of Vblank IRQs
which should now match refresh rate implied by set display mode. It
was verified to do so on a A64 board with a 2-lane and a 4-lane panel.

v2:
1. prevent reparent of tcon0 to pll-video0-2x
2. include pll-video0 in setting TCON0 DCLK rate
3. tested the whole thing also on a PinePhone

v3:
1. accept that pll-video0 can't be included in setting TCON0 DCLK rate
2. reset pll-video0 to its default rate in case u-boot changed it

Roman Beranek (7):
  clk: sunxi-ng: a64: export PLL_MIPI
  clk: sunxi-ng: a64: prevent CLK_TCON0 being reparented
  arm64: dts: allwinner: a64: assign PLL_MIPI to CLK_TCON0
  arm64: dts: allwinner: a64: reset pll-video0 rate
  ARM: dts: sunxi: rename tcon's clock output
  drm: sun4i: rename sun4i_dotclock to sun4i_tcon_dclk
  drm: sun4i: calculate proper DCLK rate for DSI

 arch/arm/boot/dts/sun5i.dtsi                  |  2 +-
 arch/arm/boot/dts/sun8i-a23-a33.dtsi          |  2 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi             |  2 +-
 arch/arm/boot/dts/sun8i-v3s.dtsi              |  2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  7 ++-
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c         |  3 +-
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h         |  4 +-
 drivers/gpu/drm/sun4i/Makefile                |  2 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c            | 46 +++++++++++--------
 .../{sun4i_dotclock.c => sun4i_tcon_dclk.c}   |  2 +-
 .../{sun4i_dotclock.h => sun4i_tcon_dclk.h}   |  0
 include/dt-bindings/clock/sun50i-a64-ccu.h    |  1 +
 12 files changed, 44 insertions(+), 29 deletions(-)
 rename drivers/gpu/drm/sun4i/{sun4i_dotclock.c => sun4i_tcon_dclk.c} (99%)
 rename drivers/gpu/drm/sun4i/{sun4i_dotclock.h => sun4i_tcon_dclk.h} (100%)


base-commit: 40aeab044a352b9af106960542257c1b9b652e8a
-- 
2.34.1

