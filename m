Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D8F86FCD4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 10:12:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE38010FE63;
	Mon,  4 Mar 2024 09:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="feuSlk3q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEBE10FE63
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 09:12:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2CD5D60BA3;
 Mon,  4 Mar 2024 09:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F32C433F1;
 Mon,  4 Mar 2024 09:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709543549;
 bh=zNrkS99ITWg3c+ED++GLYzO4mcPMtSnb85xx8rlt3vU=;
 h=From:To:Cc:Subject:Date:From;
 b=feuSlk3qYygjcy5TMy4getp6B7thKwxRIOLliL+TBbaMBX30PZd3i5zTeW95YGnlP
 ATpj5yV+pP1OiNk+hmQIZa/2C9/qg8A9uAvM+sk6URDSWgAd+0j2Zo8OcHfNrPYIx/
 eW2btmd43qwC1A3sQ9Ym+k5o3cXcAFG9AtE4TezGuQfbs8daT/DZanE6dxIT+yO+hV
 p6a/tAvoImx47R63O7UQfv/UFz2x5tiwKrMvBekaiPd1YIHkqIFue/sEgRpNDKXQiz
 8sicMZ+/cmwjDCwiBZ6Ecar83zeSEE8p+DQiU/LGbp4066fKrpyxJBqc4oqyykMe3c
 yDdZ71kYcXYQg==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/sun4i: hdmi: Fix u64 div on 32bit arch
Date: Mon,  4 Mar 2024 10:12:25 +0100
Message-ID: <20240304091225.366325-1-mripard@kernel.org>
X-Mailer: git-send-email 2.43.2
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

Commit 358e76fd613a ("drm/sun4i: hdmi: Consolidate atomic_check and
mode_valid") changed the clock rate from an unsigned long to an unsigned
long long resulting in a a 64-bit division that might not be supported
on all platforms.

The resulted in compilation being broken at least for m68k, xtensa and
some arm configurations, at least.

Fixes: 358e76fd613a ("drm/sun4i: hdmi: Consolidate atomic_check and mode_valid")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Closes: https://lore.kernel.org/r/CA+G9fYvG9KE15PGNoLu+SBVyShe+u5HBLQ81+kK9Zop6u=ywmw@mail.gmail.com/
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202403011839.KLiXh4wC-lkp@intel.com/
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index b7cf369b1906..987041850df2 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -163,11 +163,11 @@ static enum drm_mode_status
 sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
 				 const struct drm_display_mode *mode,
 				 unsigned long long clock)
 {
 	const struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
-	unsigned long diff = clock / 200; /* +-0.5% allowed by HDMI spec */
+	unsigned long diff = div_u64(clock, 200); /* +-0.5% allowed by HDMI spec */
 	long rounded_rate;
 
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		return MODE_BAD;
 
-- 
2.43.2

