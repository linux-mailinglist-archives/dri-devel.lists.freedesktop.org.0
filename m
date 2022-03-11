Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD114D5E85
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 10:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236CD10E099;
	Fri, 11 Mar 2022 09:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0713110E812
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 09:34:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id 2CCEC1F46496
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646991274;
 bh=Jse5jslyQwK8jYrGmsf8TVyXCyfWaI4dN1Xg9g/UKcA=;
 h=From:To:Cc:Subject:Date:From;
 b=IpFgOc0TudE0KJyzh7uv590XVGZF6klHXcFh6GrFFLQyRGb/YAofcmFwQ+BjhVEbw
 TbmFtww7jSInDHtYABfZbAIXJLwkAwwf2fc3I+jAAnV23uItwiZMmAqtoQr1JZzTFr
 oqaGb/Uch5ozrOKkk4nfOT8lvzrsJCisO4KM5bh8XJMB3HVVkYuIrHD9kFMMdT28mX
 MR6UWePzBT8als4P/ngrk66/on8Q1Kak/rTTMMd7nbUDHz0UCS3qhPs9CkH0kmEH5G
 ImflviUi5gPK+n31hBNaCBNIRnjrv1PCLbMHWE8IDk/RitGJperU5lHrWHTJgeLbvr
 ya8JKpVqTlGRQ==
From: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2 RESEND] Mitigate race condition problems when unbinding
 DRM driver
Date: Fri, 11 Mar 2022 10:34:04 +0100
Message-Id: <20220311093406.4068019-1-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.25.1
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
Cc: narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, andrzej.hajda@intel.com,
 kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

I'm sending these patches to try to improve the current situation for a
particular corner case (DRM driver unbinding).

I could reproduce a specific race condition during the unbinding of the
mediatek-drm driver that caused an invalid memory address. The race
condition is triggered by a userspace event (gnome-shell requesting a
DRM GET_CONNECTOR ioctl) while the encoders and drivers are in the
process of being disabled.

While I tried to mitigate this by making a small change in the
parade-ps8640 driver (for the bridge I'm testing on) and by making a
couple of functions in drm_bridge.c more robust, this is only a symptom
of a larger problem that might not be getting enough attention,
understandably, because this is an unusual corner case.

The scenario looks like this:

<userspace>: unbind mediatek-drm   --------------------+
              |                                        |
           <kernel>                                    |
              |                                        |
             ...                                       |
              |                                       ...
        mtk_dsi_unbind                                 |
              |                                        |
              `- drm_encoder_cleanup                   v
              |   |                                 gnome-shell
             ...  `- drm_bridge_detach *<------ ioctl (GET_CONNECTOR)
                                                   |
                                                <kernel>
                                                   |
                                                  ...
                                                   |
                                                   |
                                      ps8640_bridge_get_edid
                                         |
                                          `drm_bridge_chain_post_disable

which causes drm_bridge_chain_post_disable() to walk the bridge chain
after the bridge has already been detached and removed from the list. I
guess a more radical and subsystem-wide solution would be to not allow
or to block certain ioctl calls once the driver has started to unbind,
but I'd like to hear your opinion on this.

This was tested on an Acer Chromebook R13 (Elm, MT8173) running Debian
Sid, the command that triggers the race condition is

echo mediatek-drm.12.auto > /sys/bus/platform/drivers/mediatek-drm/unbind

Cheers,
Ricardo

Ricardo Cañuelo (2):
  drm/bridge: parade-ps8640: avoid race condition on driver unbinding
  drm/bridge: Add extra checks in pre_enable and post_enable

 drivers/gpu/drm/bridge/parade-ps8640.c | 6 +++---
 drivers/gpu/drm/drm_bridge.c           | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

--
2.25.1
