Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A788AFB8F2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 18:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D013D10E4E3;
	Mon,  7 Jul 2025 16:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="txXEzBC7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D8C10E4E8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 16:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
 bh=95qtSTC/qWsTSLa9j9zg9DGEk7v1YtKph8l3ru7WuWw=; b=txXEzBC79RXkkWjmf9rB61w86m
 ebHNPB/2+iYG3yJd4uB84pjPf2+cuyBKBPdQj1+dgULhRtnOxwSvHr5Z/HwNurXhqi45rTBq7QOim
 C9ftmPi2bPIZrH77L9Bke67wO8cUh5VqCRLb9mxdoDbtVW4GfP3agGdSCXtUnfkEAmZmhgMi4ZZOH
 4eGG0Pv7Tj5nG8d5fvOE+q2+QGEXzGS87fFcJiPg3pmU2B6Nlsrj3YFy0Qrhj5yBKyBscQ/rbE2Q8
 /Al6Mz4lHbM5bQ0ebDvAq5tL7sizhnKjU8YO56T+momMV3C8cy8Vd0IU3Tih3nnhIPb0oahDE/pgn
 ivYB38OA==;
Received: from i53875bf5.versanet.de ([83.135.91.245]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uYp1o-0004yl-T3; Mon, 07 Jul 2025 18:49:16 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, andy.yan@rock-chips.com, andyshrk@163.com,
 nicolas.frattaroli@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 00/13] Support DSI output on rk3576 and roc-rk3576-pc board
Date: Mon,  7 Jul 2025 18:48:53 +0200
Message-ID: <20250707164906.1445288-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
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

This enables all the necesary bits and bindings to get display output
on the dm-m10r800-v3s addon module for the Firefly roc-rk3576-pc board.

A bit of cleanup of the ili9881c, because the driver was still trying
to send dcs commands when the underlying DSI driver might have already
switched to video-mode, which caused me quite a bit of headache until
I realized this being the culprit for my garbled display output :-) .

Only the last patch has a dependency on Nicolas' pwm series [0]
everything else, is directly usable.


[0] https://lore.kernel.org/lkml/20250602-rk3576-pwm-v2-0-a6434b0ce60c@collabora.com/

Guochun Huang (1):
  drm/rockchip: dsi2: add support rk3576

Heiko Stuebner (12):
  drm/panel: ilitek-ili9881c: turn off power-supply when init fails
  drm/panel: ilitek-ili9881c: move display_on/_off dcs calls to
    (un-)prepare
  drm/panel: ilitek-ili9881c: convert (un-)prepare to
    mipi_dsi_multi_context
  dt-bindings: vendor-prefixes: Add prefix for Shenzhen Bestar
    Electronic
  dt-bindings: display: ili9881c: Add Bestar BSD1218-A101KL68 LCD panel
  drm/panel: ilitek-ili9881c: Add Bestar BSD1218-A101KL68 support
  dt-bindings: soc: rockchip: add rk3576 mipi dcphy syscon
  dt-bindings: display: rockchip: Add rk3576 to RK3588 DW DSI2
    controller schema
  arm64: dts: rockchip: add mipi-dcphy to rk3576
  arm64: dts: rockchip: add the dsi controller to rk3576
  arm64: dts: rockchip: add vcc3v3-lcd-s0 regulator to roc-rk3576-pc
  arm64: dts: rockchip: add dm-m10r800-v3s overlay for roc-rk3576-pc

 .../display/panel/ilitek,ili9881c.yaml        |   1 +
 .../rockchip/rockchip,rk3588-mipi-dsi2.yaml   |   1 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   5 +
 .../rk3576-roc-pc-dm-m10r800-v3s.dtso         | 134 ++++++++
 .../arm64/boot/dts/rockchip/rk3576-roc-pc.dts |  16 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      |  50 +++
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 301 ++++++++++++++----
 .../gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c  |  21 ++
 10 files changed, 475 insertions(+), 57 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-roc-pc-dm-m10r800-v3s.dtso

-- 
2.47.2

