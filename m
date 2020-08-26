Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 247DA253E5E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8863E6EB4B;
	Thu, 27 Aug 2020 06:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23736EA05
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 08:15:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id C2951292457
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] drm/bridge: ps8640: Make sure all needed is powered to
 get the EDID
Date: Wed, 26 Aug 2020 10:15:21 +0200
Message-Id: <20200826081526.674866-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:36 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, drinkcat@chromium.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first patch was initially part of the series [1] but for some reason
was not picked when the series were merged, so I included in this series
because it is needed to make the others to work properly.

The same happened for the second patch, was part of series [1] but not
merged.

The third patch and next are part of the original series and are to rework
the power handling to get the EDID. Basically, we need to make sure all the
needed is powered to be able to get the EDID. Before, we saw that getting
the EDID failed as explained in the third patch.

[1] https://lkml.org/lkml/2020/6/15/1208

Changes in v2:
- Included the patch `drm/bridge_connector: Set default status connected for eDP connectors`
- Included the patch `drm/bridge: ps8640: Get the EDID from eDP control`
- Use drm_bridge_chain_pre_enable/post_disable() helpers (Sam Ravnborg)

Enric Balletbo i Serra (5):
  drm/bridge_connector: Set default status connected for eDP connectors
  drm/bridge: ps8640: Get the EDID from eDP control
  drm/bridge: ps8640: Return an error for incorrect attach flags
  drm/bridge: ps8640: Print an error if VDO control fails
  drm/bridge: ps8640: Rework power state handling

 drivers/gpu/drm/bridge/parade-ps8640.c | 89 ++++++++++++++++++++++----
 drivers/gpu/drm/drm_bridge_connector.c |  1 +
 2 files changed, 79 insertions(+), 11 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
