Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D1E7F5341
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 23:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0019510E316;
	Wed, 22 Nov 2023 22:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B52610E316
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 22:18:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 87566CE2600;
 Wed, 22 Nov 2023 22:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6237DC433B6;
 Wed, 22 Nov 2023 22:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700691524;
 bh=LxBGHdJ2v9bdua30Gg+KKEVoYaWNReAP/fHM99MgfLg=;
 h=From:To:Cc:Subject:Date:From;
 b=ZoJh6dBQME/k9NdDqkjJ5mDfVWRFJQhjrrCElROlyU1JHn/mAUQLFKfiCq2kfvfc/
 9q1MHs7St+bQVxjHJMruozUyeIb7BIN2GtTtLetF6d55QUScqXGo/tXY+/Ob0JsyIi
 4Q1Vp+3mUeIt2OZdnIOYyiGbH1f+VhHF7LqQxyNhkOlU10X8W3lFK6MoPmkjmvpDWR
 A/qmfrWGLZ4MMbMTZrlJj/Ucx/szFxhKP1YiJPjIHlcPuvQUYHxLTo0y6QeAOo6K8T
 cXcff1M3qSfsQrP9/Tw4785yc2oru+lW1H0Ho9jauIvK/X/IrDL1F++WlwD79Sr9q/
 Ti9tuiIdPxSDg==
From: Arnd Bergmann <arnd@kernel.org>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH] drm/rockchip: rk3066_hdmi: include drm/drm_atomic.h
Date: Wed, 22 Nov 2023 23:18:29 +0100
Message-Id: <20231122221838.3164349-1-arnd@kernel.org>
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
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-rockchip@lists.infradead.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Without this header, the newly added code fails to build:

drivers/gpu/drm/rockchip/rk3066_hdmi.c: In function 'rk3066_hdmi_encoder_enable':
drivers/gpu/drm/rockchip/rk3066_hdmi.c:397:22: error: implicit declaration of function 'drm_atomic_get_new_connector_state'; did you mean 'drm_atomic_helper_connector_reset'? [-Werror=implicit-function-declaration]
  397 |         conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                      drm_atomic_helper_connector_reset
drivers/gpu/drm/rockchip/rk3066_hdmi.c:397:20: error: assignment to 'struct drm_connector_state *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
  397 |         conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
      |                    ^
drivers/gpu/drm/rockchip/rk3066_hdmi.c:401:22: error: implicit declaration of function 'drm_atomic_get_new_crtc_state'; did you mean 'drm_atomic_helper_swap_state'? [-Werror=implicit-function-declaration]
  401 |         crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                      drm_atomic_helper_swap_state
drivers/gpu/drm/rockchip/rk3066_hdmi.c:401:20: error: assignment to 'struct drm_crtc_state *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
  401 |         crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
      |                    ^

Fixes: ae3436a5e7c2 ("drm/rockchip: rk3066_hdmi: Switch encoder hooks to atomic")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 0e7aae341960..7d561c5a650f 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -4,6 +4,7 @@
  *    Zheng Yang <zhengyang@rock-chips.com>
  */
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
-- 
2.39.2

