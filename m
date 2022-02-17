Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 072494B94EF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 01:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CA910E686;
	Thu, 17 Feb 2022 00:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C397010E672
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 00:25:54 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 077FD8382C;
 Thu, 17 Feb 2022 01:25:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645057552;
 bh=r82sdkTAS7+KVccI4kEFc6e4lu+lAA4Tzy4Wb2rryQ0=;
 h=From:To:Cc:Subject:Date:From;
 b=pOXslPP9WTnDqvJUpA+j0CCB9MCZyXUZ4fTaOwbk1ZWEHtYeRNZNA+tuJOcCaX3ML
 U1gSHcoemfpJRAEBrbvUGZoxkFkSWQskkntEwal37zZvMzT/zf0Wdwayz/V0kd7l6W
 qwCz6d3xZr/T3o/TFyyRrytJDViiRYsEnIT65DEnArnlAuHqLuRFz7+C2K3HtXSVq5
 0wxWXClcZcvVn6q/+0R88HlcYWjtdyQMd8AX2HMV+E8JT9dgElDl0T9yvVw9Xkkw4y
 zj3CSjDEwikSAtTxBUCVI2uOMuQmlfq+ktL3f6lgVeq8XfUnQbAWGAN/+BlfFh/fOp
 wYgbUoadHiKTQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 00/12] drm: bridge: icn6211: Fix hard-coded panel settings
 and add I2C support
Date: Thu, 17 Feb 2022 01:25:18 +0100
Message-Id: <20220217002530.396563-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Robert Foss <robert.foss@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series fixes multiple problems with the ICN6211 driver and adds
support for configuration of the chip via I2C bus.

First, in the current state, the ICN6211 driver hard-codes DPI timing
and clock settings specific to some unknown panel. The settings provided
by panel driver are ignored. Using any other panel than the one for which
this driver is currently hard-coded can lead to permanent damage of the
panel (per display supplier warning, and it sure did in my case. The
damage looks like multiple rows of dead pixels at the bottom of the
panel, and this is not going away even after long power off time).

Much of this series thus fixes incorrect register layout, DPI timing
programming, clock generation by adding actual PLL configuration code.
This series also adds lane count decoding instead of using hard-coded
value, and fills in a couple of registers with likely correct default
values.

Second, this series adds support for I2C configuration of the ICN6211.
The device can be configured either via DSI command mode or via I2C,
the register layout is the same in both cases.

Since the datasheet for this device is very hard to come by, a lot of
information has been salvaged from [1] and [2].

[1] https://github.com/rockchip-linux/kernel/blob/develop-4.19/drivers/gpu/drm/bridge/icn6211.c
[2] https://github.com/tdjastrzebski/ICN6211-Configurator

Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org

Marek Vasut (12):
  drm: bridge: icn6211: Fix register layout
  drm: bridge: icn6211: Fix HFP_HSW_HBP_HI and HFP_MIN handling
  drm: bridge: icn6211: Add HS/VS/DE polarity handling
  drm: bridge: icn6211: Add DSI lane count DT property parsing
  drm: bridge: icn6211: Add generic DSI-to-DPI PLL configuration
  drm: bridge: icn6211: Use DSI burst mode without EoT and with LP
    command mode
  drm: bridge: icn6211: Disable DPI color swap
  drm: bridge: icn6211: Set SYS_CTRL_1 to value used in examples
  drm: bridge: icn6211: Implement atomic_get_input_bus_fmts
  drm: bridge: icn6211: Add I2C configuration support
  drm: bridge: icn6211: Rename ICN6211_DSI to chipone_writeb
  drm: bridge: icn6211: Read and validate chip IDs before configuration

 drivers/gpu/drm/bridge/chipone-icn6211.c | 510 ++++++++++++++++++++---
 1 file changed, 458 insertions(+), 52 deletions(-)

-- 
2.34.1

