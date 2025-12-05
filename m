Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B76CA700F
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 10:52:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E710410EA9C;
	Fri,  5 Dec 2025 09:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dDozfNOw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2840D10EA96
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 09:52:33 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 992781776;
 Fri,  5 Dec 2025 10:50:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764928215;
 bh=tk41aXJM1hAnommQL/yZ5bKIvn8A1Y3535egq0jrEXs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=dDozfNOw0kPmG5KSLNrZMNRxUH1xcCssnfVhWxGCOvmEgCkuPW6O+l6+/X7XySbjb
 g0Mauy1M5GGEPC1Z5vzpfIbZLyrKS7/fCfaNoSsdPhWXIYilfCMZQBLeTdPwQUDSix
 O8D0SNfXvZjTKBPh48X2Ch5gvtKOy3Yx6uvYcxK0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 05 Dec 2025 11:51:51 +0200
Subject: [PATCH 4/4] drm/tidss: Fix enable/disable order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-drm-seq-fix-v1-4-fda68fa1b3de@ideasonboard.com>
References: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
In-Reply-To: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Linus Walleij <linusw@kernel.org>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Vicente Bergas <vicencb@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2817;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=tk41aXJM1hAnommQL/yZ5bKIvn8A1Y3535egq0jrEXs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpMqtWv5wZpSaeF7nzdL79PpuSJS+G7FkUG1S7F
 CjPbI7L85yJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaTKrVgAKCRD6PaqMvJYe
 9dFZD/43MtWBz4xkH5Go8fDRvOeAMN3nMetCypyzpaYU8SDCxiHW3R4cvCQCBz5ptVjtBmY2soo
 j6TbcKyMormmah0v5qlbSm5cdRC6ewqdO40MrJD25s1iMMI4striFD/Rbz+h/cBoVMthXCKFKcU
 SYgA8Vm0hdvQRTgXN1H6X1zUGaJ3wWeO/bodZnATIJO2FMxmcczJ7LX+xnCbmSrl11Wss7jOJoY
 17pQPD0R8dgMmIO3KOKDrtodE6a9M1mLPqdN0Go6WvpD68UGiaUZ2ogyA5lAd54XGP3Y0fskIu+
 l07xPUfRTajLrS7P2AHHwjModBlLAZF+2QaI4JyxJq9laAFPJLJLOOXjsBHHYYB3T3Lk3dAo9G+
 y5D653lz2jZ2qyxfezh9QHATtYAOIz+H7Sf8PDF2NIMd2jjMOKdsdBduxMt1uSpIoHyjK4bXRb5
 uwgvIp+c0bGaNgVTVUgnVLAhkHIhNodsWXuWt2YupEvCp1nH8oDjCdCW2iCsAuEy+8JAKE+TKsa
 mqPoEzWuMu0NB0LGR08Av5ZE/ajflmmSUcJG7BW5nc2vWZBTvm19zf5L+5sBjbz/wo+417eu+oG
 kpE6f0Sz2HrYLdCAsRystA9O0ko0oMc3myR9YWc5VzfTltcxkaZSlYYxz7BAeSJkNUUvMUmLiWt
 1I1wsU3rnpVQTrg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

TI's OLDI and DSI encoders need to be set up before the crtc is enabled,
but the DRM helpers will enable the crtc first. This causes various
issues on TI platforms, like visual artifacts or crtc sync lost
warnings.

Thus drm_atomic_helper_commit_modeset_enables() and
drm_atomic_helper_commit_modeset_disables() cannot be used, as they
enable the crtc before bridges' pre-enable, and disable the crtc after
bridges' post-disable.

Open code the drm_atomic_helper_commit_modeset_enables() and
drm_atomic_helper_commit_modeset_disables(), and first call the bridges'
pre-enables, then crtc enable, then bridges' post-enable (and vice versa
for disable).

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: stable@vger.kernel.org # v6.17+
---
 drivers/gpu/drm/tidss/tidss_kms.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 86eb5d97410b..8bb93194e5ac 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -26,9 +26,33 @@ static void tidss_atomic_commit_tail(struct drm_atomic_state *old_state)
 
 	tidss_runtime_get(tidss);
 
-	drm_atomic_helper_commit_modeset_disables(ddev, old_state);
-	drm_atomic_helper_commit_planes(ddev, old_state, DRM_PLANE_COMMIT_ACTIVE_ONLY);
-	drm_atomic_helper_commit_modeset_enables(ddev, old_state);
+	/*
+	 * TI's OLDI and DSI encoders need to be set up before the crtc is
+	 * enabled. Thus drm_atomic_helper_commit_modeset_enables() and
+	 * drm_atomic_helper_commit_modeset_disables() cannot be used here, as
+	 * they enable the crtc before bridges' pre-enable, and disable the crtc
+	 * after bridges' post-disable.
+	 *
+	 * Open code the functions here and first call the bridges' pre-enables,
+	 * then crtc enable, then bridges' post-enable (and vice versa for
+	 * disable).
+	 */
+
+	drm_atomic_helper_commit_encoder_bridge_disable(ddev, old_state);
+	drm_atomic_helper_commit_crtc_disable(ddev, old_state);
+	drm_atomic_helper_commit_encoder_bridge_post_disable(ddev, old_state);
+
+	drm_atomic_helper_update_legacy_modeset_state(ddev, old_state);
+	drm_atomic_helper_calc_timestamping_constants(old_state);
+	drm_atomic_helper_commit_crtc_set_mode(ddev, old_state);
+
+	drm_atomic_helper_commit_planes(ddev, old_state,
+					DRM_PLANE_COMMIT_ACTIVE_ONLY);
+
+	drm_atomic_helper_commit_encoder_bridge_pre_enable(ddev, old_state);
+	drm_atomic_helper_commit_crtc_enable(ddev, old_state);
+	drm_atomic_helper_commit_encoder_bridge_enable(ddev, old_state);
+	drm_atomic_helper_commit_writebacks(ddev, old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
 	drm_atomic_helper_wait_for_flip_done(ddev, old_state);

-- 
2.43.0

