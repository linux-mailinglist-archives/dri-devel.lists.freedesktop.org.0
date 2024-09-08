Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B544C97083A
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 16:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B5810E27E;
	Sun,  8 Sep 2024 14:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="wnDWPrL7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D2510E27D
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 14:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1725807321;
 bh=p1MiGiCWJ1QFiMZG2+xqAuAwYxvAC3COp5/R/uwoMcw=;
 b=wnDWPrL7E5Q/8MDmUWbNIyghdyE1LnEmv5XRZxc6SWSfkiDhcVwXUv6+FIHKDCmzmV+EyVkxN
 Nn4HM+c24M3TddN6yZrXrhqUkpc420aNNvqpp4s8ogJLCW/50hX+Bpnfkrel0jwkOIO95oEwPAp
 PXSL/6vwKP9NKyIxGsLVb8vPbEBd/4B7Sr3CTU26DXvZ+LphL/aDdCC0T9R0UgSk4Hc/Oev/yGD
 DLUj5suRD6bnOVeLVvJtobPGZVXdcfLI65W3V6l/i5gqXgdM4PTJExz6JYnK7GxAejnzdW4Omfy
 G+oB6NYd5lo8NMG9p1oleZIwafkWa+lSIMwNTVHkjNrw==
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Diederik de Haas <didi.debian@cknow.org>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 0/7] rockchip: Enable 4K60Hz mode on RK3228, RK3328,
 RK3399 and RK356x
Date: Sun,  8 Sep 2024 14:54:57 +0000
Message-ID: <20240908145511.3331451-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 66ddbad73c9877b459588e68
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
RK3328, RK3399 and RK356x. Support for 10-bit and/or YUV output modes is
not part of this series.

Patch 1 add hdmiphy rate validation in mode_valid so that HDMI2.0 modes
can be enabled on RK3228 and RK3328.

Patch 2-5 modify phy, current and mpll tables to match what ChromeOS and
vendor kernel use. These patches originate from old ChromeOS and vendor
kernels and have successfully been used in LibreELEC distro for the past
few years.

Patch 6 enables use of HDMI2.0 modes on RK3399 and RK356x.

Patch 7 help fix use of console at 4K resolution on RK3399.

This series may not fully depend on but was tested together with v2 of
the series "drm: bridge: dw_hdmi: Misc enable/disable, CEC and EDID
cleanup" at [1].

Changes in v2:
- Drop patches already merged
- Collect t-b tags
- Rebase on next-20240906
- Hotplug HDMI 2.0 to HDMI 1.4 scrambler issue was fixed in v2 of [1].

I have tested 4K modes on following devices:
- Asus TinkerBoard (RK3288)
- Pine64 Rock64 (RK3328)
- Radxa ROCK Pi 4 (RK3399)
- Radxa ROCK 3A (RK3568)

A copy of this series can also be found at [2].

[1] https://patchwork.freedesktop.org/series/134727/
[2] https://github.com/Kwiboo/linux-rockchip/commits/next-20240906-rk-dw-hdmi-v2/

Douglas Anderson (2):
  drm/rockchip: dw_hdmi: Set cur_ctr to 0 always
  drm/rockchip: dw_hdmi: Use auto-generated tables

Jonas Karlman (3):
  drm/rockchip: dw_hdmi: Filter modes based on hdmiphy_clk
  drm/rockchip: dw_hdmi: Enable 4K@60Hz mode on RK3399 and RK356x
  drm/rockchip: Load crtc devices in preferred order

Nickey Yang (1):
  drm/rockchip: dw_hdmi: Add phy_config for 594Mhz pixel clock

Yakir Yang (1):
  drm/rockchip: dw_hdmi: Adjust cklvl & txlvl for RF/EMI

 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 162 +++++++++-----------
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c |  23 +++
 2 files changed, 98 insertions(+), 87 deletions(-)

-- 
2.46.0

