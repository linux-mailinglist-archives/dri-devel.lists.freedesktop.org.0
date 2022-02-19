Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771224BC35B
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 01:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB7910E1CE;
	Sat, 19 Feb 2022 00:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D64710E180
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 00:29:05 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 192A783902;
 Sat, 19 Feb 2022 01:29:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645230543;
 bh=MEYx8NY8P5fbW0bUFkyX5qs+C3SXQwdNmKOh7qYXUoQ=;
 h=From:To:Cc:Subject:Date:From;
 b=m4dqotkjbTe3yVyzbrBdh6EeenYAJTPv7ACxwvWuZ5pMKu/y8xEGrWN2r67w5PyEx
 jQiuddcnRD9QRGBxP+mlvGyzeHZJPqkGce585uRalKWQ+9qLE2z/GtYD+4noiWi16d
 p6KFPzWejkCD88lePsus0xlsKkOSgUwXBpFhw9M620jjlrPVuO2jdBRu/3eO4SrVCX
 q9mLSq9KjTA0chRZb7g4aP/HyAi3PbQx+vWRH1o6P/ycKum941Ol59v04vuPpmJlqB
 86twnuCPifKifp2L2sKMtQyptQ0unPk4Zw9dLHkKebaAsR/yK6JQW8E4VPeQYbKBOk
 4Nm1eDFufSrcw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH 0/7] drm/bridge: Add support for selecting DSI host HS
 clock from DSI bridge
Date: Sat, 19 Feb 2022 01:28:37 +0100
Message-Id: <20220219002844.362157-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series attempts to address a problem of missing support for DSI
bridge-to-bridge or panel-to-bridge clock frequency negotiation. The problem
has two variants.

First, a DSI->to->x bridge derives its own internal clock from DSI HS clock,
but the DSI HS clock cannot be set to arbitrary values. TS358767 is one such
bridge in case it operates without Xtal. In that case, the TC358767 driver
must be able to negotiate the specific suitable DSI HS clock frequency for
the chip.

Second, both DSI->to->x bridges and DSI hosts currently calculate, or rather
guess and hope they both guess the same number as their neighbor, the DSI HS
clock frequency from form of PLL=(width * height * bpp / lanes / 2). This is
dangerous, since the PLL capabilities on both ends of the DSI bus might differ
and the DSI host could easily end up generating wildly different clock than
what the DSI bridge/panel expects to receive.

This series attempts to address these negotiation problems by extending the
existing .atomic_get_input_bus_fmts callback into .atomic_get_input_bus_cfgs
callback in struct drm_bridge_funcs {}. The extended version returns not only
a list of a list of bus formats supported by a bridge, but the entire list of
struct drm_bus_cfg, which currently contains format and bus flags, but can be
extended with other members, like desired clock frequency, as required.

This series demonstrates such extension by adding the support for negotiating
the DSI clock and by implementing such support in DW DSI Host and TC358767 DSI
bridge.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>

TC358767 part depends on:
https://patchwork.freedesktop.org/series/100372

Marek Vasut (7):
  drm/bridge: Pass struct drm_bus_cfg to select_bus_fmt_recursive()
  drm/bridge: Add new atomic_get_input_bus_cfgs callback
  drm/bridge: Extend struct drm_bus_cfg with clock field
  drm/bridge: dw-mipi-dsi: Move PLL setup into atomic_enable
  drm/bridge: dw-mipi-dsi: Pass bridge state into
    dw_mipi_dsi_get_lane_mbps()
  drm/bridge: dw-mipi-dsi: Prefer DSI bus clock settings from
    bridge_state
  drm/bridge: tc358767: Add support for PLL clock derivation from DSI HS
    clock

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 22 +++--
 drivers/gpu/drm/bridge/tc358767.c             | 97 +++++++++++++++----
 drivers/gpu/drm/drm_bridge.c                  | 78 +++++++++++----
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |  1 +
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c         | 17 ++--
 include/drm/bridge/dw_mipi_dsi.h              |  2 +
 include/drm/drm_atomic.h                      |  5 +
 include/drm/drm_bridge.h                      | 42 ++++++++
 8 files changed, 214 insertions(+), 50 deletions(-)

-- 
2.34.1

