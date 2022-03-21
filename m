Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3744E2931
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 15:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0250C10E480;
	Mon, 21 Mar 2022 14:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7D310E47F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 14:02:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6643861291;
 Mon, 21 Mar 2022 14:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC08C340E8;
 Mon, 21 Mar 2022 14:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1647871319;
 bh=1xDrE3o8l2iuNQei3iR6/FZfOOxhe6xPKBab17hrugo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vcRlPr/ny3SMGeZyl460pxz1ZaUkwMYgyTst4om8pY7wwT3IYsyluUmKxG9FURhIx
 uOqO60bBvY9QcqcIBLL3Lzvf3C2YfHBt1P2dC5rDsJz3UiDIPmrECN0aM6mQ/HX5/f
 WpYRatSYuJktWN737KVwzCoI3A2gtdAI0omzH0Ks=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.16 20/37] drm: Dont make DRM_PANEL_BRIDGE dependent on
 DRM_KMS_HELPERS
Date: Mon, 21 Mar 2022 14:53:02 +0100
Message-Id: <20220321133221.881441290@linuxfoundation.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321133221.290173884@linuxfoundation.org>
References: <20220321133221.290173884@linuxfoundation.org>
User-Agent: quilt/0.66
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
Cc: dri-devel@lists.freedesktop.org, Sasha Levin <sashal@kernel.org>,
 kernel test robot <lkp@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, Brian Masney <bmasney@redhat.com>,
 stable@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit 3c3384050d68570f9de0fec9e58824decfefba7a ]

Fix a number of undefined references to drm_kms_helper.ko in
drm_dp_helper.ko:

  arm-suse-linux-gnueabi-ld: drivers/gpu/drm/dp/drm_dp_mst_topology.o: in function `drm_dp_mst_duplicate_state':
  drm_dp_mst_topology.c:(.text+0x2df0): undefined reference to `__drm_atomic_helper_private_obj_duplicate_state'
  arm-suse-linux-gnueabi-ld: drivers/gpu/drm/dp/drm_dp_mst_topology.o: in function `drm_dp_delayed_destroy_work':
  drm_dp_mst_topology.c:(.text+0x370c): undefined reference to `drm_kms_helper_hotplug_event'
  arm-suse-linux-gnueabi-ld: drivers/gpu/drm/dp/drm_dp_mst_topology.o: in function `drm_dp_mst_up_req_work':
  drm_dp_mst_topology.c:(.text+0x7938): undefined reference to `drm_kms_helper_hotplug_event'
  arm-suse-linux-gnueabi-ld: drivers/gpu/drm/dp/drm_dp_mst_topology.o: in function `drm_dp_mst_link_probe_work':
  drm_dp_mst_topology.c:(.text+0x82e0): undefined reference to `drm_kms_helper_hotplug_event'

This happens if panel-edp.ko has been configured with

  DRM_PANEL_EDP=y
  DRM_DP_HELPER=y
  DRM_KMS_HELPER=m

which builds DP helpers into the kernel and KMS helpers sa a module.
Making DRM_PANEL_EDP select DRM_KMS_HELPER resolves this problem.

To avoid a resulting cyclic dependency with DRM_PANEL_BRIDGE, don't
make the latter depend on DRM_KMS_HELPER and fix the one DRM bridge
drivers that doesn't already select DRM_KMS_HELPER. As KMS helpers
cannot be selected directly by the user, config symbols should avoid
depending on it anyway.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 3755d35ee1d2 ("drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP")
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: Brian Masney <bmasney@redhat.com>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux Kernel Functional Testing <lkft@linaro.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Link: https://patchwork.freedesktop.org/patch/478296/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/Kconfig | 2 +-
 drivers/gpu/drm/panel/Kconfig  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 431b6e12a81f..68ec45abc1fb 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -8,7 +8,6 @@ config DRM_BRIDGE
 config DRM_PANEL_BRIDGE
 	def_bool y
 	depends on DRM_BRIDGE
-	depends on DRM_KMS_HELPER
 	select DRM_PANEL
 	help
 	  DRM bridge wrapper of DRM panels
@@ -30,6 +29,7 @@ config DRM_CDNS_DSI
 config DRM_CHIPONE_ICN6211
 	tristate "Chipone ICN6211 MIPI-DSI/RGB Converter bridge"
 	depends on OF
+	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL_BRIDGE
 	help
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 0d3798354e6a..42011d884202 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -96,6 +96,7 @@ config DRM_PANEL_EDP
 	select VIDEOMODE_HELPERS
 	select DRM_DP_AUX_BUS
 	select DRM_DP_HELPER
+	select DRM_KMS_HELPER
 	help
 	  DRM panel driver for dumb eDP panels that need at most a regulator and
 	  a GPIO to be powered up. Optionally a backlight can be attached so
-- 
2.34.1



