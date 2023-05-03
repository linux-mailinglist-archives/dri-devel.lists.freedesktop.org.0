Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3416F5C16
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 18:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086A610E0CE;
	Wed,  3 May 2023 16:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317058922E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 16:33:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B39E4BFAE6; Wed,  3 May 2023 18:33:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
 t=1683131611; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Wz6v8uYHo0LpPLKMPt437X8+F6WcxC2BzkAFGOrZAgE=;
 b=kCsPK1lkPscu8mHpVGaYjIMrkL3Y83hjOX6nB9DD7tu1cwu3wWw0muGYyEtIyH/4FGSyI3
 C3Ecep97lekr8IM+q0c4bvhyS+1u1rm3zVwCjgAaCXDc+wIOx7EuO8bzhkvNOZL3kHkLp0
 9kK+LiLno6Ubc9jHuYFT/0HrkmuYiFkcT/hZu8xZ4qY/N0pRA8945fPA2ZcE0YZUb7gR9m
 LGwRG+9WFcEat7g8s3jIohGYOyKlVI6z6JkzOLTq2CaHlhGJzuzn1mv2OlGchR+2wyPuWW
 zqlXv4S4uOS1mBYHIoY+8velaBjdmNKR8TGKTAfN6i8lJeJz13x2pumlrPJTNw==
From: Frieder Schrempf <frieder@fris.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Subject: [PATCH v2 0/2] Init flow fixes for Samsung DSIM and TI SN65DSI84
Date: Wed,  3 May 2023 18:33:05 +0200
Message-Id: <20230503163313.2640898-1-frieder@fris.de>
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

All the changes intend to follow the documentation provided here:
https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation

Changes for v2:
* Drop RFC
* Drop non-working Exynos cleanup patch 3/3

Frieder Schrempf (2):
  drm: bridge: samsung-dsim: Fix i.MX8M enable flow to meet spec
  drm/bridge: ti-sn65dsi83: Fix enable/disable flow to meet spec

 drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++++++++--
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 19 ++++++++++++++++---
 2 files changed, 39 insertions(+), 5 deletions(-)

-- 
2.40.0

