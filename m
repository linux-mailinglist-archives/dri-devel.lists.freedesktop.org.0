Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F00214309E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 18:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E516EA32;
	Mon, 20 Jan 2020 17:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477206EA1B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 17:06:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 9F2C02912D9
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/5] drm/rockchip: Fix unbind/bind
Date: Mon, 20 Jan 2020 14:05:57 -0300
Message-Id: <20200120170602.3832-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 20 Jan 2020 17:09:27 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is an attempt to fix the unbind/bind crash
(due to an use-after-free bug) found on rockchip-drm driver.

The problem lies in the way the driver uses the component API.
Currently, rockchip_drm_unbind calls component_unbind_all before
drm_mode_config_cleanup, the former releasing the memory
where the DRM objects are embedded.

The series goal is basically to fix all the components,
making proper use of the respective .destroy hooks,
making sure there are no use-after-free or double-free issues.

The first patch is likely the most controversial, which is required
because component_bind_all will call component_unbind without
calling drm_mode_config_cleanup, if any component fails to bind.
As mentioned above, this is problematic in the DRM framework.

Thanks!
Ezequiel

Ezequiel Garcia (5):
  component: Add an API to cleanup before unbind
  drm/rockchip: Fix the device unbind order
  drm/rockchip: vop: Fix CRTC unbind
  drm/rockchip: lvds: Fix component unbind
  drm/rockchip: rk3066_hdmi: Cleanup component unbind

 drivers/base/component.c                    |  9 +++-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c      |  8 +--
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 20 +++++---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 56 ++++++++-------------
 drivers/gpu/drm/rockchip/rockchip_lvds.c    | 20 ++++----
 include/linux/component.h                   | 10 +++-
 6 files changed, 60 insertions(+), 63 deletions(-)

-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
