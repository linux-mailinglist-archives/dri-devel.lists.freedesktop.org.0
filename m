Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB029A41F6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 17:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BB610E93C;
	Fri, 18 Oct 2024 15:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C4DnIe2D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D7D10E943
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 15:08:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6C3A1A4442C;
 Fri, 18 Oct 2024 15:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43ECDC4CEC3;
 Fri, 18 Oct 2024 15:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729264136;
 bh=latyxkadioFYo8ef1ZgGf1RqY2UASR0JhFNU12tkpec=;
 h=From:To:Cc:Subject:Date:From;
 b=C4DnIe2DzJVIt7yxvdCcvRJ8TX2cwMtXPLpRvalEy5uc4PHdNmq4I0nXgVfutkJZg
 7RIGXcv9d1jRThiGiIpyvyD7SZDosUOJ3OCjSVOC7yFpNemmrQ8zzOxfV466nXqx3/
 0vjTIn8LNtcFka+u3VUUVuNTknhdlQcdArm8v5ceYNjCW/Sw78QoI51VBe4mMGBn6Q
 G4suXjg5164IcWmV6KDSqfyKIsEC1nLoBjGYbwWHc7z5VXF6L+KZHHPUrjUJVK3zMM
 3yef58A3BPvdFlzwZwYZnSnWsjdvPqDS/n5sZ7ARQz8m6Fz2DIop7EGaZrffpZRejv
 gecmkvYdIp9Ig==
From: Arnd Bergmann <arnd@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Jani Nikula <jani.nikula@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Imre Deak <imre.deak@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge-connector: select DRM_DISPLAY_HELPER from
 DRM_BRIDGE_CONNECTOR
Date: Fri, 18 Oct 2024 15:08:45 +0000
Message-Id: <20241018150850.3418359-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

The imx display drivers use the new bridge connector helpers but don't
explicitly select CONFIG_DRM_DISPLAY_HELPER, leading to a link failure
in rare configurations:

ld.lld-20: error: undefined symbol: drm_bridge_connector_init
>>> referenced by imx-ldb.c
>>>               drivers/gpu/drm/imx/ipuv3/imx-ldb.o:(imx_ldb_bind) in archive vmlinux.a
>>> referenced by parallel-display.c
>>>               drivers/gpu/drm/imx/ipuv3/parallel-display.o:(imx_pd_bind) in archive vmlinux.a

Move DRM_BRIDGE_CONNECTOR out of the DRM_DISPLAY_HELPER block and
instead select that symbol indirectly.

Fixes: f94b9707a1c9 ("drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge_connector")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/display/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 0f07cf1483ff..beb05d9bab50 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -11,14 +11,15 @@ config DRM_DISPLAY_HELPER
 	help
 	  DRM helpers for display adapters.
 
-if DRM_DISPLAY_HELPER
-
 config DRM_BRIDGE_CONNECTOR
 	bool
 	select DRM_DISPLAY_HDMI_STATE_HELPER
+	select DRM_DISPLAY_HELPER
 	help
 	  DRM connector implementation terminating DRM bridge chains.
 
+if DRM_DISPLAY_HELPER
+
 config DRM_DISPLAY_DP_AUX_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
 	select DRM_DISPLAY_DP_HELPER
-- 
2.39.5

