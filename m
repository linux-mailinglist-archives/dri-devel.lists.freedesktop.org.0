Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C81AAEA658
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 21:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF8010E8F6;
	Thu, 26 Jun 2025 19:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="MG8glo+f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9766810E8F6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 19:21:10 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 7C5AB25EA5;
 Thu, 26 Jun 2025 21:21:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpXY8ydbfAis; Thu, 26 Jun 2025 21:21:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1750965666; bh=KbVD8W1QVZAFqfq85+oBgINP5cpWpTrtB33hPtktZ+Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=MG8glo+fruRM+8D2BU0fMp0cvDbaYgtOlshEO7nse3GJghFUYkSKj4Ql7t0om0X9j
 UrekMns4NSUP1mcIZTQXP3iSL8DQZZ+uUNOsxmH6xnPinqovDbTxX6zjzBb8kh4urL
 5NDJ5EQOSVqcDZmCh0mcXhIy+x+DVgRwb/8BiINWK/BKhT6mAuAYMy5TIHEF0UxEKI
 hR5FSu+F3XwBjPR7gst4RHrbIqpEDJeC6uGdsyVS0465s9bzoxvsjv99Q/ByGrz6gH
 R/mBRuOrF/NI4/AXfwhJs9GYnCuYpWQySdZd1Ot4Zo3HB9SZJwB0YCojuaGOMXm/Y2
 WkeugJ3uib13w==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 00:50:29 +0530
Subject: [PATCH v3 2/3] drm/exynos: exynos7_drm_decon: fix call of
 decon_commit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynosdrm-decon-v3-2-5b456f88cfea@disroot.org>
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
In-Reply-To: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 stable@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750965633; l=1313;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=KbVD8W1QVZAFqfq85+oBgINP5cpWpTrtB33hPtktZ+Q=;
 b=l6zKg3a8pR9r1QKiRsjmvmVHGHaF1tZJjt8lK5gh/2h/KiirJyc9jqoyg3mzVMn7Vci4KJW5R
 MMkXTr3ADETC4zz5BREvnEqVAErWJijHMYQhLXViseVxR+jLvxzVTRo
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
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

decon_commit() has a condition guard at the beginning:

	if (ctx->suspended)
		return;

But, when it is being called from decon_atomic_enable(), ctx->suspended
is still set to true, which prevents its execution. decon_commit() is
vital for setting up display timing values, without which the display
pipeline fails to function properly. Call the function after
ctx->suspended is set to false as a fix.

Cc: stable@vger.kernel.org
Fixes: 96976c3d9aff ("drm/exynos: Add DECON driver")
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index f91daefa9d2bc5e314c279822047e60ee0d7ca99..43bcbe2e2917df43d7c2d27a9771e892628dd682 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -583,9 +583,9 @@ static void decon_atomic_enable(struct exynos_drm_crtc *crtc)
 	if (test_and_clear_bit(0, &ctx->irq_flags))
 		decon_enable_vblank(ctx->crtc);
 
-	decon_commit(ctx->crtc);
-
 	ctx->suspended = false;
+
+	decon_commit(ctx->crtc);
 }
 
 static void decon_atomic_disable(struct exynos_drm_crtc *crtc)

-- 
2.49.0

