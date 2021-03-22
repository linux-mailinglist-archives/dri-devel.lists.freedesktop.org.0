Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4A13436F8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 04:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D50088668;
	Mon, 22 Mar 2021 03:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE3589FA5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 03:02:18 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 040F38CE;
 Mon, 22 Mar 2021 04:02:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616382136;
 bh=sSGYcH7y4MbX4Fa4G8Vpnka+hU9wx5QdipnZiG/buo4=;
 h=From:To:Cc:Subject:Date:From;
 b=ipDYXbyY7qJFH8xqLzIn3hKx6WrExSwFMpjx6vlPCbpiXpmXHQRzgf2kFG9yKWk/N
 9FG7tnDFL5ICKLlX+ctOUM9jy2iocr3K6Wxvm1X5+/H/BbkxdIrttbvyDOfCIOV4l9
 ySDlIC+3CuUZpT6hdoKiL4CBEkqeT4669inJHPjk=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 00/11] drm/bridge: ti-sn65dsi86: Support DisplayPort mode
Date: Mon, 22 Mar 2021 05:01:17 +0200
Message-Id: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Despite the SN65DSI86 being a DSI to eDP bridge, it can also operate in
DisplayPort mode. This patch series adds support for this feature to the
ti-sn65dsi86 driver.

The series starts with miscellaneous fixes and improvements in patch
01/11 to 04/11. Patch 05/11 then moves to the panel-bridge helper, and
is followed by patches 06/11 and 07/11 that refactor the code to prepare
for the next steps.

As my goal is to use the sn65dsi86 with the R-Car DU driver, which
requires DRM_BRIDGE_ATTACH_NO_CONNECTOR support, the series continues
with support for this feature. In patch 08/11 the bridge connector
operations are added, and in 09/11 the connector creation is made
optional.

Patch 10/11 then implements supports for DisplayPort mode, enabled
automatically when the next component in the pipeline isn't a panel.
Finally, patch 11/11 adds hotplug detection support, which isn't very
useful for eDP, but is needed for DisplayPort.

This series is an RFC as I haven't been able to test it fully yet. The
platform I'm working on is missing support for three other components in
the display pipeline (I'm on it), which are required in order to run
tests. I would however like to receive feedback on the approach already,
in case problems would need to be solved.

Laurent Pinchart (11):
  dt-bindings: drm/bridge: ti-sn65dsi8: Make enable GPIO optional
  drm/bridge: ti-sn65dsi86: Make enable GPIO optional
  drm/bridge: ti-sn65dsi86: Unregister AUX adapter in remove()
  drm/bridge: ti-sn65dsi86: Use bitmask to store valid rates
  drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge
  drm/bridge: ti-sn65dsi86: Group code in sections
  drm/bridge: ti-sn65dsi86: Split connector creation to a function
  drm/bridge: ti-sn65dsi86: Implement bridge connector operations
  drm/bridge: ti-sn65dsi86: Make connector creation optional
  drm/bridge: ti-sn65dsi86: Support DisplayPort (non-eDP) mode
  drm/bridge: ti-sn65dsi86: Support hotplug detection

 .../bindings/display/bridge/ti,sn65dsi86.yaml |   1 -
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 266 ++++++++++++------
 2 files changed, 183 insertions(+), 84 deletions(-)

-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
