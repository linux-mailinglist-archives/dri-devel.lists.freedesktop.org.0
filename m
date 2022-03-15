Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFED4D96A4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 09:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B7C10E7BB;
	Tue, 15 Mar 2022 08:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1D710E7BA
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 08:46:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8993E2190B;
 Tue, 15 Mar 2022 08:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647333962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yvPN6roiO4z3frFQDCW98CaeGK9o4a+xs3+m3hDjxmQ=;
 b=oF5TPl0+p0Bh2Qht15jdn+wLYmUXKoocS4z2/okf5Dsh5MtXijxWI/k4Zq2ZLOGln9C9Eb
 /uoYxIS1BMhO9jrcx8s+z+/IMEIcHChqbNKDyC9VdiJ5PjWfyBeNdz0k36yA140jebQxEs
 fgVXkj+4JFvnsmF6W9o4ZAu3h/NdzOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647333962;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yvPN6roiO4z3frFQDCW98CaeGK9o4a+xs3+m3hDjxmQ=;
 b=ZATfUsn/fcUJwwBuHjfRIASpeEdXBZDqdrOkvEViWxhpuD5owFQ3M2XUChyQ/1OsiIvMT0
 sjt3VZfMT8KN20BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2988813B4E;
 Tue, 15 Mar 2022 08:46:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YjDtCEpSMGK8bAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Mar 2022 08:46:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, lyude@redhat.com, airlied@redhat.com,
 sam@ravnborg.org, thierry.reding@gmail.com, jernej.skrabec@gmail.com,
 andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se
Subject: [PATCH] drm: Don't make DRM_PANEL_BRIDGE dependent on DRM_KMS_HELPERS
Date: Tue, 15 Mar 2022 09:45:59 +0100
Message-Id: <20220315084559.23510-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
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
Cc: kernel test robot <lkp@intel.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Kernel Functional Testing <lkft@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
---
 drivers/gpu/drm/bridge/Kconfig | 3 +--
 drivers/gpu/drm/panel/Kconfig  | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c86f5be4dfe0..007e5a282f67 100644
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
@@ -30,7 +29,7 @@ config DRM_CDNS_DSI
 config DRM_CHIPONE_ICN6211
 	tristate "Chipone ICN6211 MIPI-DSI/RGB Converter bridge"
 	depends on OF
-	depends on DRM_KMS_HELPER
+	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL_BRIDGE
 	help
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index bb2e47229c68..ddf5f38e8731 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -107,6 +107,7 @@ config DRM_PANEL_EDP
 	select VIDEOMODE_HELPERS
 	select DRM_DP_AUX_BUS
 	select DRM_DP_HELPER
+	select DRM_KMS_HELPER
 	help
 	  DRM panel driver for dumb eDP panels that need at most a regulator and
 	  a GPIO to be powered up. Optionally a backlight can be attached so
-- 
2.35.1

