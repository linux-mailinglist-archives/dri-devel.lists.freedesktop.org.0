Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2167468EA8B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 10:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2A310E716;
	Wed,  8 Feb 2023 09:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9524210E716
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 09:08:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pPgRC-0004ed-RW; Wed, 08 Feb 2023 10:08:22 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1pPgR6-003TfI-Pz; Wed, 08 Feb 2023 10:08:18 +0100
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1pPgR7-00GG7j-7a; Wed, 08 Feb 2023 10:08:17 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/4] drm/rockchip: dw_hdmi: Add 4k@30 support
Date: Wed,  8 Feb 2023 10:08:12 +0100
Message-Id: <20230208090816.3810589-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Dan Johansen <strit@manjaro.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 FUKAUMI Naoki <naoki@radxa.com>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some more small changes to this series, see changelog.

Sascha

Changes since v4:
- Use struct vop_reg to store resolutions
- Only check for valid clock rates when clock != NULL

Changes since v3
- Add patch to limit VOP resolutions to hardware capabilitie

Changes since v2:
- Use correct register values for mpll_cfg
- Add patch to discard modes we cannot achieve

Changes since v1:
- Allow non standard clock rates only on Synopsys phy as suggested by
  Robin Murphy

Sascha Hauer (4):
  drm/rockchip: vop: limit maximium resolution to hardware capabilities
  drm/rockchip: dw_hdmi: relax mode_valid hook
  drm/rockchip: dw_hdmi: Add support for 4k@30 resolution
  drm/rockchip: dw_hdmi: discard modes with unachievable pixelclocks

 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c  | 41 ++++++++++++++++----
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c  | 15 +++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h  |  6 +++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  5 ---
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c  | 18 +++++++++
 5 files changed, 73 insertions(+), 12 deletions(-)

-- 
2.30.2

