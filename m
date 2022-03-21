Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23C04E2919
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 15:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C5010E470;
	Mon, 21 Mar 2022 14:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB6410E470
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 14:00:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1CB5D612EC;
 Mon, 21 Mar 2022 14:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5F9C340F2;
 Mon, 21 Mar 2022 14:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1647871223;
 bh=l/4aaPMy5P3KEVoiyumRgPHI+RSe1kw9SKejYd4DT4E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nMqWhC+RzVVyr5AFfcq9GQlpRpmN2Q10jRoxiP6ihfv7KJ6Q6kT0NpGi1u3fBBGNJ
 fTb0IAk7TMxRuF9v5OI2LvIQZ/6AiDF6KEcCPOVggjiVCRu3avJh+ytSva/smU3TV9
 z1ly1ovtY/h1S0D/H7DMKtlK0OAmfVPWwQUjbhX0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.15 18/32] drm: Dont make DRM_PANEL_BRIDGE dependent on
 DRM_KMS_HELPERS
Date: Mon, 21 Mar 2022 14:52:54 +0100
Message-Id: <20220321133221.091073183@linuxfoundation.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321133220.559554263@linuxfoundation.org>
References: <20220321133220.559554263@linuxfoundation.org>
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
index f63fd0f90360..af1402d83d51 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -84,6 +84,7 @@ config DRM_PANEL_SIMPLE
 	select VIDEOMODE_HELPERS
 	select DRM_DP_AUX_BUS
 	select DRM_DP_HELPER
+	select DRM_KMS_HELPER
 	help
 	  DRM panel driver for dumb panels that need at most a regulator and
 	  a GPIO to be powered up. Optionally a backlight can be attached so
-- 
2.34.1



