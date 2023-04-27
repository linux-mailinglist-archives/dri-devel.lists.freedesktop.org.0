Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D739C6F0762
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 16:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB8F10E2A0;
	Thu, 27 Apr 2023 14:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DD810E368
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 14:29:44 +0000 (UTC)
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 6502D20B47;
 Thu, 27 Apr 2023 16:29:39 +0200 (CEST)
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/9] drm/bridge: tc358768: various fixes on PLL calculation
 and DSI timings
Date: Thu, 27 Apr 2023 16:29:25 +0200
Message-Id: <20230427142934.55435-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
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
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This series includes multiple fixes on the tc358768 parallel RGB to DSI driver.

With the following changes I am able to have a stable display output using a TI
SN65DSI83 (DSI-LVDS bridge) and a 1280 x 800 LVDS display panel and the
register values are coherent with Toshiba documentation and configuration
spreadsheet, I was not able to test any other display sink.

= DSI Video Mode =

The driver uses the MIPI_DSI_MODE_LPM flag not correctly, because of that no HS
Video is sent at all when this flag is set by the DSI slave.

= DSI Timing Parameters =

Multiple DSI timing parameters are not correct and this was leading to black or
not stable images on some display output. The new formulas were verified with
the datasheet and a configuration spread sheet from Toshiba.

I did split the change in multiple commits, I can squash all of them together
if this is considered better for any reason, including bisect-ability.

= PLL computation =

Two issues on the PLL computation, one is a required fix to have the bridge
working when the parallel RGB input width is not 24, the second one is just
following a prescription from the Toshiba documentation. In my test it was not
making any difference.

Francesco Dolcini (9):
  drm/bridge: tc358768: always enable HS video mode
  drm/bridge: tc358768: fix PLL parameters computation
  drm/bridge: tc358768: fix PLL target frequency
  drm/bridge: tc358768: fix TCLK_ZEROCNT computation
  drm/bridge: tc358768: fix TCLK_TRAILCNT computation
  drm/bridge: tc358768: fix THS_ZEROCNT computation
  drm/bridge: tc358768: fix TXTAGOCNT computation
  drm/bridge: tc358768: fix THS_TRAILCNT computation
  drm/bridge: tc358768: remove unused variable

 drivers/gpu/drm/bridge/tc358768.c | 53 +++++++++++++++++--------------
 1 file changed, 30 insertions(+), 23 deletions(-)

-- 
2.25.1

