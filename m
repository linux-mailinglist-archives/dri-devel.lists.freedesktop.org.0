Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0491AD7501
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 17:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4C310E887;
	Thu, 12 Jun 2025 15:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="jI3AIceG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D3A10E887
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 15:00:45 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 7830325BDA;
 Thu, 12 Jun 2025 17:00:44 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMeiQ2439zKd; Thu, 12 Jun 2025 17:00:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1749740443; bh=KbVD8W1QVZAFqfq85+oBgINP5cpWpTrtB33hPtktZ+Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=jI3AIceGSQxra2yoTfTIA90AEBneXw4SWE6pC0dq8CDmGvDnLSQQyPZlovnj3eAnL
 QJ8f1iIm/HEkB9EhB2v1Oz1uw9fEHQTzqd/F1uiXndB0FOp2+jfOiDqM/gsf+0K1Lp
 WZZCUHNZifvvoQMnj1cO4gf4R5bI7G/zDhc3CWLg7Rh/HxLlvdrdtM8iXP2P1nlon/
 6siEdYIR3d8jHJp/XrgVaVQLUkvXBhMAfosUtse/HtLtZX+e/MN43odHAmGfUfY7UQ
 aGhI0gCJ97dKLk5fi2JWihqjvCLw3IcQwFmBugV3Ii/G7ZsPgjfFk7nPKeOET8FxoD
 YYz5M9ZYZgJxw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:29:19 +0530
Subject: [PATCH v2 1/2] drm/exynos: exynos7_drm_decon: fix call of
 decon_commit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynosdrm-decon-v2-1-d6c1d21c8057@disroot.org>
References: <20250612-exynosdrm-decon-v2-0-d6c1d21c8057@disroot.org>
In-Reply-To: <20250612-exynosdrm-decon-v2-0-d6c1d21c8057@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 stable@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749740428; l=1313;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=KbVD8W1QVZAFqfq85+oBgINP5cpWpTrtB33hPtktZ+Q=;
 b=3RvGk19WcfpcLnwZ3sIxU4O4s2l4UIkGy0HYA+2T/gW8t0neQhz8mhwCSXco4kguluClsWlGi
 LeoLEAjC/YgAuHmhHqrrnwVmDRmxZ4uSB9sY5rn+V+EZ6WT89QbRA/z
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

