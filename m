Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E46CE909937
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 19:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47EF10E14C;
	Sat, 15 Jun 2024 17:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="c9KWSE3b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [167.172.40.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B49E10E161
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 17:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1718471684;
 bh=dLn2LLOIv7jBQg/04IBwQjzhef+lWuqMlW02SALqD2s=;
 b=c9KWSE3b6zjtg9AMGRqPRIxyriqxrz19PRvgJ4bkRgROyT8tTNA87ZLNgk14AAw1R5HeXP3xA
 q8IjmMJ1POkCRZ9D1uJh9PgwtycjdUwDuRdXY3X0+pmEoSgvQ643vUNMQRq2eGnVgK9ADp40A1E
 j0sG6bP0rpt5jlJ9gBbNeQC3hEdQ8rwXu43F733RJ92jdaFIIPClmVXos+s1ifz4MPRz2zRD22c
 DEpMv8Hpp/pw/q8Rd1AcDbUaV8potgaFyflHHD5RXizSmALVHULPkXJv54vIAAzglQ/CIrCCGwa
 iuwQrTKBjTZG8ATfVfIgB/Nr8/T/HYmP+kJbiRDjHkfA==
From: Jonas Karlman <jonas@kwiboo.se>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Jonas
 Karlman <jonas@kwiboo.se>
Subject: [PATCH 00/13] rockchip: Enable 4K@60Hz mode on RK3228, RK3328,
 RK3399 and RK356x
Date: Sat, 15 Jun 2024 17:03:51 +0000
Message-ID: <20240615170417.3134517-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 167.172.40.54
X-ForwardEmail-ID: 666dc99724e0254b39803fcf
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

This prepares and enable use of HDMI2.0 modes, e.g. 4K@60Hz, on RK3228,
RK3328, RK3399 and RK356x.

Patch 1-3 fixes some issues to help support use of high-resolution modes.

Patch 4 fixes reading of EDID on RK3328 when using a forced mode.

Patch 5-7 adds hdmiphy rate validation in mode_valid so that HDMI2.0
modes can be enabled on RK3228 and RK3328.

Patch 8-11 modify phy, current and mpll tables to match what ChromeOS
and vendor kernel use. These patches originate from old ChromeOS and
vendor kernels and have successfully been used in LibreELEC distro for
the past few years.

Patch 12 enables use of HDMI2.0 modes on RK3399 and RK356x.

Patch 13 help fix use of console at 4K resolution on RK3399.

This series may not fully depend on but was only tested together with
the series "drm: bridge: dw_hdmi: Misc enable/disable, CEC and EDID
cleanup" at [1].

I have tested 4K modes on following devices:
- Asus TinkerBoard (RK3288)
- Pine64 Rock64 (RK3328)
- Radxa ROCK Pi 4 (RK3399)
- Radxa ROCK 3A (RK3568)

A copy of this series can also be found at [2].

[1] https://patchwork.freedesktop.org/series/134727/
[2] https://github.com/Kwiboo/linux-rockchip/commits/next-20240531-rk-dw-hdmi-v1/

Alex Bee (1):
  drm/rockchip: vop: Allow 4096px width scaling

Douglas Anderson (2):
  drm/rockchip: dw_hdmi: Set cur_ctr to 0 always
  drm/rockchip: dw_hdmi: Use auto-generated tables

Jonas Karlman (8):
  arm64: dts: rockchip: Increase VOP clk rate on RK3328
  clk: rockchip: Set parent rate for DCLK_VOP clock on RK3228
  drm/rockchip: dw_hdmi: Fix reading EDID when using a forced mode
  drm/rockchip: dw_hdmi: Allow High TMDS Bit Rates
  drm/rockchip: dw_hdmi: Add max_tmds_clock validation
  drm/rockchip: dw_hdmi: Filter modes based on hdmiphy_clk
  drm/rockchip: dw_hdmi: Enable 4K@60Hz mode on RK3399 and RK356x
  drm/rockchip: Load crtc devices in preferred order

Nickey Yang (1):
  drm/rockchip: dw_hdmi: Add phy_config for 594Mhz pixel clock

Yakir Yang (1):
  drm/rockchip: dw_hdmi: Adjust cklvl & txlvl for RF/EMI

 arch/arm64/boot/dts/rockchip/rk3328.dtsi    |   4 +-
 drivers/clk/rockchip/clk-rk3228.c           |   2 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 173 ++++++++++----------
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c |  23 +++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c |   4 +-
 5 files changed, 116 insertions(+), 90 deletions(-)

-- 
2.45.2

