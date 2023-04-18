Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A56A76E5F04
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 12:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB4D10E135;
	Tue, 18 Apr 2023 10:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 460 seconds by postgrey-1.36 at gabe;
 Tue, 18 Apr 2023 10:38:50 UTC
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D950C10E135
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 10:38:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5DF00C02F8; Tue, 18 Apr 2023 12:30:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
 t=1681813861; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=7rqfhs3lrBiS0Wr56mg5vWQczZCmYWMaWRtwjvTDXLU=;
 b=Rzqu+xZRmSjK7mxneuXkIcsQIqc7QMlQJAJLtz5ao9e890mi95HohRfDILQ0z/pX5uI7bB
 +lCg28lC3wlBp1nVfNeAhQ1133mpofYtVchwe76+/NAGQLRIJHdhl8ScQNxSpUBthBmC5d
 hrV8+ddNvFbPKqgrl5O7v5WPGK9gkQ3qz+N/bGCHFbWkohUaJ4GOUsP/lADOCI1XUcERD9
 jWt7ffo+dK+W0us0Bu1NcSwmg0lp5D6xXXLKy2xgSS/anxxtehZSCnrjrBztwRU9LPxWWd
 hee6AA4/SXEc8ps/ayR/rVDi+MK+f9z0zozmVzmb0EQCcIvlLY/5zl6m3VyZmw==
From: Frieder Schrempf <frieder@fris.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Subject: [RFC PATCH 0/3] Init flow fixes for Samsung DSIM and TI SN65DSI84
Date: Tue, 18 Apr 2023 12:29:36 +0200
Message-Id: <20230418102947.876621-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This patchset contains a proposal to fix the initialization flow for
the display pipeline used on our i.MX8MM Kontron boards:

  i.MX8MM LCDIF -> i.MX8MM DSIM -> TI SN65DSI84 -> 7" LVDS Panel

Without these changes the display works most of the time, but fails
to come up occassionally when booting or doing on/off cycling tests
with:

  echo 0 > /sys/devices/platform/soc@0/32c00000.bus/32e00000.lcdif/graphics/fb0/blank
  echo 1 > /sys/devices/platform/soc@0/32c00000.bus/32e00000.lcdif/graphics/fb0/blank

I also added a bit of a speculative patch 3/3 for cleaning up the
Exynos init flow, which is the main reason this is sent as RFC as
I have no idea if this is correct/working at all.

Frieder Schrempf (3):
  drm: bridge: samsung-dsim: Fix i.MX8M enable flow to meet spec
  drm/bridge: ti-sn65dsi83: Fix enable/disable flow to meet spec
  drm: bridge: samsung-dsim: Remove init quirk for Exynos

 drivers/gpu/drm/bridge/samsung-dsim.c | 34 +++++++++++++++------------
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 19 ++++++++++++---
 2 files changed, 35 insertions(+), 18 deletions(-)

-- 
2.40.0

