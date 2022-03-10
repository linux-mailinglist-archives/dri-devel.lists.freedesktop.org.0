Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7794D4CB5
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 16:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC7510E9F7;
	Thu, 10 Mar 2022 15:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E3910E9C7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 15:22:32 +0000 (UTC)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E0AA491;
 Thu, 10 Mar 2022 16:22:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646925751;
 bh=f1cZwxY3Sz3yLsut2yWbhLFFNJnpn/cbPONcZc3vM9M=;
 h=From:To:Cc:Subject:Date:From;
 b=MAz8Uo8ZMfT8UYYCHhyBAylyu4XYtKLCwPeeJzgEli2Nrvg8f0N/4msdI8EVmE0ne
 ogL9DanCVjuvWuUD0Agtolgb3TwMWPFNoU4bg6ie3kCGxb2IAHULCtXSJ/b+gB4dRY
 QRX2aBgfcopymVWqhvLtI8b3B+CdkZ4l7xG1HKDg=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] drm/bridge: ti-sn65dsi86: Support non-eDP DisplayPort
 connectors
Date: Thu, 10 Mar 2022 15:22:24 +0000
Message-Id: <20220310152227.2122960-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement support for non eDP connectors on the TI-SN65DSI86 bridge, and
provide IRQ based hotplug detect to identify when the connector is
present.

no-hpd is extended to be the default behaviour for non DisplayPort
connectors.

This series is based upon Sam Ravnborgs and Rob Clarks series [0] to
support DRM_BRIDGE_STATE_OPS and NO_CONNECTOR support on the SN65DSI86,
however some extra modifications have been made on the top of Sam's
series to fix compile breakage and the NO_CONNECTOR support.

A full branch with these changes is available at [1]

[0] https://lore.kernel.org/all/20220206154405.1243333-1-sam@ravnborg.org/
[1] git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git
    branch: kbingham/drm-misc/next/sn65dsi86/hpd

Kieran Bingham (1):
  drm/bridge: ti-sn65dsi86: Support hotplug detection

Laurent Pinchart (2):
  drm/bridge: ti-sn65dsi86: Support DisplayPort (non-eDP) mode
  drm/bridge: ti-sn65dsi86: Implement bridge connector operations

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 180 +++++++++++++++++++++++---
 1 file changed, 165 insertions(+), 15 deletions(-)

-- 
2.32.0

