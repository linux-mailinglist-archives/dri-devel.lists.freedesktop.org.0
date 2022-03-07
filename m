Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A74B54D05D2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 19:00:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D839810E0E5;
	Mon,  7 Mar 2022 18:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1021610E025
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 18:00:06 +0000 (UTC)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2384851C;
 Mon,  7 Mar 2022 19:00:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646676004;
 bh=qrw2gGZZSAH8WzuW1hnu0e5cP7sznDYGRbaWMpNFiKU=;
 h=From:To:Cc:Subject:Date:From;
 b=uwvor2gnw+FSjbIUF5QmokCQDXUBK9yjjZA8TyKyHkInbJDMd0+bxuieCznC7MMnl
 Cnc1ZQMLIPQTOFocNcUQ0y0BNbTDXV6Fgh9/wDz6TeJ9vvTv47V5AJQ7o/Xjqop4aj
 Qw9LdZtWWe9IJz3NLzVLlRXZSCWYpHIeOBTtd54M=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/4] drm/bridge: ti-sn65dsi86: Support non-eDP DisplayPort
 connectors
Date: Mon,  7 Mar 2022 17:59:51 +0000
Message-Id: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series is based on top of José Expósito's patch [0] "drm/bridge:
ti-sn65dsi86: switch to devm_drm_of_get_bridge" and Nikita Yushchenko's
patch [1] "drm/bridge_connector: enable HPD by default if supported".

[0] https://lore.kernel.org/all/20220228183955.25508-1-jose.exposito89@gmail.com/
[1] https://lore.kernel.org/all/20211225063151.2110878-1-nikita.yoush@cogentembedded.com/

Kieran Bingham (1):
  drm/bridge: ti-sn65dsi86: Support hotplug detection

Laurent Pinchart (3):
  drm/bridge: ti-sn65dsi86: Implement bridge connector operations
  drm/bridge: ti-sn65dsi86: Make connector creation optional
  drm/bridge: ti-sn65dsi86: Support DisplayPort (non-eDP) mode

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 178 ++++++++++++++++++++++----
 1 file changed, 156 insertions(+), 22 deletions(-)

-- 
2.32.0

