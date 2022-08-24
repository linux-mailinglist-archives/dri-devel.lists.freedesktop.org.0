Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7E359FAB4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 15:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFFE10E19E;
	Wed, 24 Aug 2022 13:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C62610E19E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 13:00:52 +0000 (UTC)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8885D2B3;
 Wed, 24 Aug 2022 15:00:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661346051;
 bh=59Xff2YFnThO6eo60JL/kHbSiyR81mzMA4LGd48D2k4=;
 h=From:To:Cc:Subject:Date:From;
 b=Q8vhgLC/tyNaBwZIkY50eqlLMxwMOHVeQ3H5427HmnN7WQNFXdI6BaMk/avEXWsgj
 31BjXzUZqv0vdiTSvEgRXeZDIe7DpO55uVC/maCU7QFne69pD4IGxWmkqcTK5/Dbxi
 9FBD2fpDUvd8UCc9cwKZl4zD2DhUE7TqlTpodqJU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 0/4] drm/bridge: ti-sn65dsi86: Basic DP support
Date: Wed, 24 Aug 2022 16:00:30 +0300
Message-Id: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is possibly v5 of the series. I couldn't find v4, but the change
logs suggested changes to v3, so I presumed there's v4. However, it
might be v4 was never sent.

In any case, this series introduces basic DP support for sn65dsi86. So
far the driver has only supported eDP.

With basic I mean that there's no support for real HPD, although we do
implement detect callback. Link training is only done at
atomic-enable-time, which is not really correct for DP.

However, this series does give us a working display on a DP monitor. Due
to physical restrictions I'm not able to actually test plug/unplug,
changing monitors, and things like that, so the only "officially"
supported scenario is a DP monitor that's always plugged in, although I
think changing monitors should work.

 Tomi

Laurent Pinchart (2):
  drm/bridge: ti-sn65dsi86: Support DisplayPort (non-eDP) mode
  drm/bridge: ti-sn65dsi86: Implement bridge connector operations

Tomi Valkeinen (2):
  drm/bridge: ti-sn65dsi86: check AUX errors better
  drm/bridge: ti-sn65dsi86: Reject modes with too large blanking

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 77 +++++++++++++++++++++++++--
 1 file changed, 74 insertions(+), 3 deletions(-)

-- 
2.34.1

