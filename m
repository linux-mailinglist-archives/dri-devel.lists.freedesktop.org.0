Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5B3B3FAA5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944D510E62D;
	Tue,  2 Sep 2025 09:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eOuLLFvN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8633910E62E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:36:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E244760207;
 Tue,  2 Sep 2025 09:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48756C4CEED;
 Tue,  2 Sep 2025 09:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805776;
 bh=tcbH998wXh7Mzr9YRMoZa++9HEb+fCNq7r2ifSLiqpM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=eOuLLFvNkYero4NKCCuFuvEH4ukPX1qw3+P7Y/pV+jXIuj1gP1N71jCUEeBu/qmcZ
 0AvBM3Fa0yBowkdoHaDaPzOpzSTtMR3XkgVkOJty/i4tcUSVWcfUbuHFCene0JuWV6
 3fWH8m4MpVTnXa1nbm93MI4VmQVuGR/ycKjkrpnMcXOdsD1tqqyPnGTWUjBYr1G3Il
 S3WwMhKJ4ZnKLT5YNrGekAYr+DJLYX8jYrubVzWNcWmsLmwNdT9BlHs/hK1MN9L7Ej
 YInBGCb/v49jUbYyhVm68sXpn/4PnfP5BTgPbElk90lKrkAjsuuodZ6SidbTTNMh9h
 akCBKZlEpcqTw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:18 +0200
Subject: [PATCH v2 19/37] drm/ingenic: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-19-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2090; i=mripard@kernel.org;
 h=from:subject:message-id; bh=tcbH998wXh7Mzr9YRMoZa++9HEb+fCNq7r2ifSLiqpM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdoW0H/i87K4/2yIpPa66V9UnP2w8cLCnd0nDa0d7/
 RthEvpCHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiIVyMDSdFP1x4Gnuhdc+d
 kwbcP1fuKLKZOHvbrakqGWJ+eyO2Zbxjv371vJWV+73QQ/V8Qk+54xgbZnQdTFd+x3/PpHnVYlG
 TQLc6x9+qtVYvt/J+rLbM2nxM9PkHk/v/pzw+eGFHdn+pkZMZAA==
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

The ingenic atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Paul Cercueil <paul@crapouillou.net>
Cc: linux-mips@vger.kernel.org
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 3 +--
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 9db1ceaed5188a4ef0897280dc72108eb3815b5f..05faed933e5619c796f2a4fa1906e0eaa029ac68 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -469,12 +469,11 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 		return 0;
 
 	if (priv->soc_info->plane_f0_not_working && plane == &priv->f0)
 		return -EINVAL;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	priv_state = ingenic_drm_get_priv_state(priv, state);
 	if (IS_ERR(priv_state))
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 2574a4b4d40a2c27cb212114117829d9f6ab3ddb..32638a713241abbd4eaed09f0aaec2b790650cc9 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -578,11 +578,11 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 	struct ingenic_ipu_private_state *ipu_state;
 
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	ipu_state = ingenic_ipu_get_priv_state(ipu, state);
 	if (IS_ERR(ipu_state))

-- 
2.50.1

