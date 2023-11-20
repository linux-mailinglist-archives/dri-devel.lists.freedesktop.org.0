Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E61507F134E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 13:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F85010E3AB;
	Mon, 20 Nov 2023 12:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F14B10E3B6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 12:30:15 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 04478CC42B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 12:30:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E158FF80E;
 Mon, 20 Nov 2023 12:30:04 +0000 (UTC)
From: Quentin Schulz <foss+kernel@0leil.net>
To: Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Yao <markyao0591@gmail.com>
Subject: [PATCH v2 0/2] drm/rockchip: lvds: improve erroring out when
 drm_of_find_panel_or_bridge fails
Date: Mon, 20 Nov 2023 13:29:47 +0100
Message-ID: <20231120-rk-lvds-defer-msg-v2-0-9c59a5779cf9@theobroma-systems.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit
X-GND-Sasl: foss@0leil.net
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
Cc: linux-rockchip@lists.infradead.org,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Quentin Schulz <foss+kernel@0leil.net>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_of_find_panel_or_bridge may return a different error code than
EPROBE_DEFER so let's not overwrite it.

At the same time, let's demote the DRM_DEV_ERROR message to
dev_err_probe so that the scary message isn't shown (by default)
whenever EPROBE_DEFER is returned to not mislead users.

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
Changes in v2:
- add a patch for not overwriting return code with EPROBE_DEFER
- use dev_err_probe instead of DRM_DEV_DEBUG
- Link to v1: https://lore.kernel.org/r/20231117-rk-lvds-defer-msg-v1-1-1e6894cf9a74@theobroma-systems.com

---
Quentin Schulz (2):
      drm/rockchip: lvds: do not overwrite error code
      drm/rockchip: lvds: do not print scary message when probing defer

 drivers/gpu/drm/rockchip/rockchip_lvds.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
---
base-commit: 98b1cc82c4affc16f5598d4fa14b1858671b2263
change-id: 20231117-rk-lvds-defer-msg-b2944b73d791

Best regards,
-- 
Quentin Schulz <quentin.schulz@theobroma-systems.com>

