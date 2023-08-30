Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3615778D67E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 16:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653AC10E52E;
	Wed, 30 Aug 2023 14:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8703410E52E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 14:24:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.02,213,1688396400"; d="scan'208";a="174486518"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 30 Aug 2023 23:24:06 +0900
Received: from localhost.localdomain (unknown [10.226.92.150])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 92A3F42170EA;
 Wed, 30 Aug 2023 23:24:00 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/8] ADV7511 driver enhancements
Date: Wed, 30 Aug 2023 15:23:50 +0100
Message-Id: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-renesas-soc@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Biju Das <biju.das.jz@bp.renesas.com>, Adam Ford <aford173@gmail.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series aims to improve ADV7511 driver by adding
feature bits and data instead of comparing enum adv7511_type for
various hardware differences between ADV7511, ADV7533 and ADV7535.

This patch series tested with[1] on RZ/G2L SMARC EVK which embeds
ADV7535.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=762260

v1->v2:
 * Added Rb tag from Adam and Laurent.
 * Added tested by tag from Adam and Fabio.
 * Updated commit description with reason *why* the change is needed.
 * Dropped the local info variable and instead started using
   adv7511->info->type in probe().
 * Replaced max_mode_clock->max_mode_clock_khz in struct adv7511_chip_info
 * Replaced variable type for max_mode_clock_khz from
   unsigned int->unsigned long.
 * Replaced max_lane_freq->max_lane_freq_khz in struct adv7511_chip_info.
 * Replaced max_lane_freq_khz variable type from
   unsigned long->unsigned int.
 * Added trailing commas for num_supplies in adv753{3,5}_chip_info.
 * Added patch#5 for adding the reg_cec_offset variable to struct
   adv7511_chip_info.
 * Replaced has_dsi variable type from unsigned->bool.
 * Restored check using type for low_refresh_rate and
   regmap_register_patch().
 * Replaced link_config variable type from unsigned->bool.
 * Restored enum adv7511_type as there are users.
 * Replaced hpd_override_enable variable type from unsigned->bool.

Biju Das (8):
  drm: adv7511: Add struct adv7511_chip_info and use
    i2c_get_match_data()
  drm: adv7511: Add max_mode_clock_khz variable to struct
    adv7511_chip_info
  drm: adv7511: Add max_lane_freq_khz variable to struct
    adv7511_chip_info
  drm: adv7511: Add supply_names and num_supplies variables to struct
    adv7511_chip_info
  drm: adv7511: Add reg_cec_offset variable to struct adv7511_chip_info
  drm: adv7511: Add has_dsi variable to struct adv7511_chip_info
  drm: adv7511: Add link_config variable to struct adv7511_chip_info
  drm: adv7511: Add hpd_override_enable variable to struct
    adv7511_chip_info

 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  16 ++-
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c |  14 +--
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 104 +++++++++++--------
 drivers/gpu/drm/bridge/adv7511/adv7533.c     |   7 +-
 4 files changed, 81 insertions(+), 60 deletions(-)

-- 
2.25.1

