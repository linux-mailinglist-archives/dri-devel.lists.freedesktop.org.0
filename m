Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424DBB34119
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 15:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C02E10E486;
	Mon, 25 Aug 2025 13:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AhAn3qoC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0A710E489;
 Mon, 25 Aug 2025 13:43:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A04EC5C5DA4;
 Mon, 25 Aug 2025 13:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4ADCC19422;
 Mon, 25 Aug 2025 13:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756129432;
 bh=hPkYpjjK8bCQC44rJu7lNiZBmDfOgndbqW2Fo7+BgNM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=AhAn3qoCdMtapd99k6ZoD/oXwVQ/kVyCCjCNABKOLJDzEYivbssTrbEL20Yg9+z5I
 9WXC5nFWahFh6YvQgVh+sKuV0oM3Qr/hzYC4Nc4mfVl3u8oL3HZ9hDoN8474D1DQcV
 YiSWLE3qkiweBRkyqIDkxPK3SiyixEy1kajlXYSqWrEcyzTACuoD8MuyggEzXQLdzc
 S/ZDdU2UbEIhCOmo9m3rQLI7aQvZVyU9QFW+/HMWvPMCObx+COmxWoadKGulPdpTwl
 QKdwYBvoIpXGPt3WnGpEwCouwanvYlcQb9HJH576f6Hf/+XkR9L+APfPjzKOvZ5KRL
 ikiiQ4gsIPLNg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:11 +0200
Subject: [PATCH 06/39] drm/atomic: Convert
 __drm_atomic_get_current_plane_state() to modern accessor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-6-f08ccd9f85c9@kernel.org>
References: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
In-Reply-To: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Paul Cercueil <paul@crapouillou.net>, Liviu Dudau <liviu.dudau@arm.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Manikandan Muralidharan <manikandan.m@microchip.com>, 
 Dharma Balasubiramani <dharma.b@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Paul Kocialkowski <paulk@sys-base.io>, 
 Sui Jingfeng <suijingfeng@loongson.cn>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Hans de Goede <hansg@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3722; i=mripard@kernel.org;
 h=from:subject:message-id; bh=hPkYpjjK8bCQC44rJu7lNiZBmDfOgndbqW2Fo7+BgNM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMkpSrAr3/f7E/kv2DcfpZdVWT/lTlsbe81id8jg0u
 e/Qs/7NHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiM5QZ611f1X7gcxPX3uYQ
 XHPUV2zfrq/vWozDthaenHBrXyjrYhe3r9udF00o1JItb7gccFJUjbFOuc/qlQCviningbv855g
 tBZOXG4ha7NLtuudw4VdZ/kZ7oYvqod89mEKfvnp/d/Ln5H8A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The __drm_atomic_get_current_plane_state() function tries to get and
return the existing plane state, and if it doesn't exist returns the one
stored in the drm_plane->state field.

Using the current nomenclature, it tries to get the existing plane state
with an ad-hoc implementation of drm_atomic_get_existing_plane_state(),
and falls back to either the old or new plane state, depending on
whether it is called before or after drm_atomic_helper_swap_state().

The existing plane state itself is deprecated, because it also changes
when swapping states from the new state to the old state.

Fortunately for us, we can simplify things. Indeed,
__drm_atomic_get_current_plane_state() is only used in two macros:
intel_atomic_crtc_state_for_each_plane_state and
drm_atomic_crtc_state_for_each_plane_state().

The intel variant is only used through the intel_wm_compute() function
that is only ever called in intel_crtc_atomic_check().

The generic variant is more widely used, and can be found in the malidp,
msm, tegra and vc4 drivers. All of these call sites though are during
atomic_check(), so we end up in the same situation than Intel's.

Thus, we only ever use the existing state as the new state, and
plane->state is always going to be the old state. Any plane isn't
guaranteed to be part of the state though, so we can't rely on
drm_atomic_get_old_plane_state() and we still need to use plane->state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 798d33b50ef7497ce938ce3dbabee32487dda2d6..82e74d9444c4fa7f02ee0e472c8c68f7bc44cc6a 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -789,15 +789,15 @@ drm_atomic_get_new_connector_state(const struct drm_atomic_state *state,
 /**
  * __drm_atomic_get_current_plane_state - get current plane state
  * @state: global atomic state object
  * @plane: plane to grab
  *
- * This function returns the plane state for the given plane, either from
- * @state, or if the plane isn't part of the atomic state update, from @plane.
- * This is useful in atomic check callbacks, when drivers need to peek at, but
- * not change, state of other planes, since it avoids threading an error code
- * back up the call chain.
+ * This function returns the plane state for the given plane, either the
+ * new plane state from @state, or if the plane isn't part of the atomic
+ * state update, from @plane. This is useful in atomic check callbacks,
+ * when drivers need to peek at, but not change, state of other planes,
+ * since it avoids threading an error code back up the call chain.
  *
  * WARNING:
  *
  * Note that this function is in general unsafe since it doesn't check for the
  * required locking for access state structures. Drivers must ensure that it is
@@ -814,13 +814,19 @@ drm_atomic_get_new_connector_state(const struct drm_atomic_state *state,
  */
 static inline const struct drm_plane_state *
 __drm_atomic_get_current_plane_state(const struct drm_atomic_state *state,
 				     struct drm_plane *plane)
 {
-	if (state->planes[drm_plane_index(plane)].state)
-		return state->planes[drm_plane_index(plane)].state;
+	struct drm_plane_state *plane_state;
 
+	plane_state = drm_atomic_get_new_plane_state(state, plane);
+	if (plane_state)
+		return plane_state;
+
+	/*
+	 * If the plane isn't part of the state, fallback to the currently active one.
+	 */
 	return plane->state;
 }
 
 int __must_check
 drm_atomic_add_encoder_bridges(struct drm_atomic_state *state,

-- 
2.50.1

