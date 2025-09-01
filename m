Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DBDB3E6EB
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 16:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE1710E46B;
	Mon,  1 Sep 2025 14:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="OBaxxlON";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="kL2qzWvb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2495F10E46B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 14:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1756736564; bh=/wDNaRwpfprI0Oefud3usSdTs01UZW0/hwWpIqErTtc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=OBaxxlONGk/XwkoJQE/DWYd70NLNB9TebFcePR/HtbSpOqDLNvi+gnXoNVurJTiAB
 fCu7Bj+BMnY0jlUvhEi/8pJuTaU4D61p/opscwnsT+6zeG/p7qsOQgxdZKUMMZkkz8
 htZCCgbRVqtDjtbQgB4TZECimPTMzWXXGXqbIzwgRu4GTlEhn8ZjVZOcm0D3kfuikx
 OBQWXa7Ipl0bXJActHA35sz1qSGvtifnGYbfC83uxA0G0rwbdnCyxVza+Ct7awcFXc
 KXE0V58QZ2MXomDA2JB5ElWpJOXdhbOkGAkh9tbgyjzauaNk+pUX3GpkkUY2HyifaB
 BFTZak+Z5ziqw==
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id B3CB9FB02;
 Mon,  1 Sep 2025 16:22:44 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mVMeH8AlDOGO; Mon,  1 Sep 2025 16:22:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1756736561; bh=/wDNaRwpfprI0Oefud3usSdTs01UZW0/hwWpIqErTtc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=kL2qzWvbuM+lNFxGgBcX1O3SQHfUCydbO+JgB38RqUYnBK+fFihem5pB+QOKwqLSe
 JXPK66BVb1XAa/fWWNJIIaPLfgL0AnaB9UgepjCLw++cyJAUWCYg+TFBt+7AAtdi/z
 BHh85ngIZarzZs8Ls811qSeKNe83/r+gBubPCecBvoLCU413zAeFlnM3RrYkK5zS/9
 2yfxChhnGEhu7K9dGF/VcY9B4CnMX4nTKZgf7RDQV48GiCNpprUbwayA0ezMKUk/ur
 OBKV4Hx0dLGtynqyQ3Hh/ORErIdOBCKYSzxDkgCdCBT48c1Du6XXZcWJJnxnyrs2Ny
 eKT759oQh5Fnw==
From: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Date: Mon, 01 Sep 2025 16:22:06 +0200
Subject: [PATCH 1/3] drm/panel: visionox-rm69299: Fix clock frequency for
 SHIFT6mq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250901-shift6mq-panel-v1-1-444b4abbfaea@sigxcpu.org>
References: <20250901-shift6mq-panel-v1-0-444b4abbfaea@sigxcpu.org>
In-Reply-To: <20250901-shift6mq-panel-v1-0-444b4abbfaea@sigxcpu.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=953; i=agx@sigxcpu.org;
 h=from:subject:message-id; bh=/wDNaRwpfprI0Oefud3usSdTs01UZW0/hwWpIqErTtc=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FJQVNXL2hsSksvT
 UhqQWNzbVlnQm90YXdmVFpDb0R6aGM4VC9XMzZCK2ZFU0dTRXArCkp0R0xYUEM4aWVsWWJrOHVZ
 b2lKQWpNRUFBRUlBQjBXSVFSajlzemZsaUtkQ1NocktzTWx2NFpTU3Z6QjR3VUMKYUxXc0h3QUt
 DUkFsdjRaU1N2ekI0eGZqRUFDa0dCcS9PRkZBZ1dUNzRBTGFCSkgzOG1Fc0Z4RVVlYU42bWNrWQ
 o4MHdMTlhSMjRESmkvN0o4MnR0WjI2bEtJcWRKV1lvL3ozZHU3TjlDa056ZHgrd1VqNG1SMzZpR
 1JrZlNLcmxQClM4R3QxaFpCc0xRSVREU09pYllFZlBIU2QrTnBOMjh5dXVDR2I2TUloOGgxa0I3
 SjdkVmx5bTVsN1NWd3RPZSsKa0htRzNWTzFaOXRVaWdMdTFxZlR5SmUrY05vQjhyK1lIa2JYR0F
 sZTJVYS9STFQ2S0I2N0ZRT1M3SlpoYVZGLwp3bXpXaVRmdkVmR1BMTENjWTIzd25HTDhPUzFvdE
 JtdWg3dlRXT1B5cW53M1VvU01uemw2WWpSTmhWaEJNRWtRCkJKaG5kZ0NhUFdCNThPK0xabVRyY
 lFmVmJRd0NNVmhmZkFsY1ZTSDhYZ1FVdkV0Zy80dWg3RTBkcExobmlDNGcKUGJXWWMxTC9lcFpy
 aEdoQ2VHMjREcUpMQ1lGeU1RUThFa0NhR3BOZVVVb2pLbUg1MVVZcFBFdHIxM2hJMWZ5QQp0UWJ
 OczlROXlUa0xxc2REa1FEeW5mdERETjIyZGVsbjBrVHh3OEkvTllydUNBd1BuRzJnNzJGMGpWdm
 4wOVFlCmloSHd2alBlbnR5d3JCN0tWYmRPRHBsSGVVSlV4dVFHWmx0U05nSGlvNkt4NVF2ZUNIW
 GdTa2NKQVVTMVBvVkEKTndRZUdrUTRSMVFoYTVtSDdnUUNUejBnQ2psY3NYQzBieWNpVDJyKzFh
 dm9EcWx5bWloSThrdi9MNjlWL2srawo3dWZxNEJoclJYSFlJYi9XKzcwR1BrLzZFZG40M1djUWh
 WdDJOVkRzOVpqTkhXbTQ2b0xibVBTdjJDY0lFcXJGCmg3ZkhRZz09Cj1GYVdECi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=agx@sigxcpu.org; a=openpgp;
 fpr=0DB3932762F78E592F6522AFBB5A2C77584122D3
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

Make the clock frequency match what the sdm845 downstream kernel
uses. Otherwise the panel stays black.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index 909c280eab1fb408a713d84051a1afbb252c45e8..e65697ce6f51c7d64b786da18cf44b16de5d6919 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -247,7 +247,7 @@ static const struct drm_display_mode visionox_rm69299_1080x2248_60hz = {
 };
 
 static const struct drm_display_mode visionox_rm69299_1080x2160_60hz = {
-	.clock = 158695,
+	.clock = 149360,
 	.hdisplay = 1080,
 	.hsync_start = 1080 + 26,
 	.hsync_end = 1080 + 26 + 2,

-- 
2.51.0

