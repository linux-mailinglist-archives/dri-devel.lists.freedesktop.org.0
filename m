Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37C98B292E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 21:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6998A11A852;
	Thu, 25 Apr 2024 19:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E2B11A851
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 19:55:15 +0000 (UTC)
Received: from i53875b01.versanet.de ([83.135.91.1] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1s05BX-0005vK-6p; Thu, 25 Apr 2024 21:55:11 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@theobroma-systems.com, hjc@rock-chips.com,
 andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/rockchip: vop2: two fixes from working on DSI
 enablement
Date: Thu, 25 Apr 2024 21:55:04 +0200
Message-Id: <20240425195506.2935955-1-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While working on enabling DSI support on rk3588 I stumbled across the issue
of the display staying black while both the vop2 and dsi drivers were
claiming to be running just fine.

After a bit of checking I found that I got DSI output on VP3 when HDMI
on VP0 was at least associated in the DTS, but not without.

Andy's patch [0] helped and is definitly necessary, but did not fix the
problem completely. The missing thing was that VP3 is rk3588-specific
(rk3568 only has 3 video-ports, not 4 like rk3588) and the layers of
VP3 never got configured.

Patch2 fixes this.


[0] https://lore.kernel.org/dri-devel/20240422101905.32703-2-andyshrk@163.com/

Heiko Stuebner (2):
  drm/rockchip: vop2: fix rk3588 dp+dsi maxclk verification
  drm/rockchip: vop2: configure layers for vp3 on rk3588

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 16 ++++++++++++++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  1 +
 2 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.39.2

