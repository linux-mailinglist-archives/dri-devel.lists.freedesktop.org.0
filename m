Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A436AD7503
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 17:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD6310E888;
	Thu, 12 Jun 2025 15:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="bn6KTEPY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7256610E88D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 15:01:20 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 175ED25F66;
 Thu, 12 Jun 2025 17:01:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJPnsxm7-FXg; Thu, 12 Jun 2025 17:01:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1749740451; bh=D8o5aKxiqPDfJaP/Wlra9wiusUGgyAqkKg4+LuSvXis=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=bn6KTEPYJhfvaGt2QBHkIbHgJCb0CRBaJ/IOnV4I4/F+ritPtnyNle5ZETilDMpKH
 wlskdq4ZogKkt4ZQUyt5ACHvpcTI8ns3LoPm6eozssU35Mty+H9IrEEcjFrgUVoQXc
 Q0OZlDCF5bT//0HqW3WkfhdCinrYgtsZqm88DDfKzT9Q3p12/NJOoAaK4s8N8yNFLC
 chsw/wkVS/0aA2e3ZwErcEuwCtIBHyLLhpdeKlLMFhUGRvO80txL6l9d91prm4OS+5
 6u3RgLDsXztehL5tc6nx1BgdnbrIKc9//oTT0A57cT3cCZRqPhAYj0U+8dv1MBY78+
 JVwwxiTm0bp7w==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:29:20 +0530
Subject: [PATCH v2 2/2] drm/exynos: exynos7_drm_decon: add vblank check in
 IRQ handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynosdrm-decon-v2-2-d6c1d21c8057@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749740428; l=1467;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=D8o5aKxiqPDfJaP/Wlra9wiusUGgyAqkKg4+LuSvXis=;
 b=e+o8Wo7jtjYn2hZT25bsk7JQTuoWvuRvUzHVhB4xhIPbD24Y+LwjAiDqnP5zIbfSGS0+N8Epw
 4T77CIPXp6GCgnmWlOdaABdsRVXGTKb/4QHtsL0yevgkRsR90EloPvb
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

If there's support for another console device (such as a TTY serial),
the kernel occasionally panics during boot. The panic message and a
relevant snippet of the call stack is as follows:

  Unable to handle kernel NULL pointer dereference at virtual address 000000000000000
  Call trace:
    drm_crtc_handle_vblank+0x10/0x30 (P)
    decon_irq_handler+0x88/0xb4
    [...]

Otherwise, the panics don't happen. This indicates that it's some sort
of race condition.

Add a check to validate if the drm device can handle vblanks before
calling drm_crtc_handle_vblank() to avoid this.

Cc: stable@vger.kernel.org
Fixes: 96976c3d9aff ("drm/exynos: Add DECON driver")
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 43bcbe2e2917df43d7c2d27a9771e892628dd682..c0c0f23169c993ac315fc8d7bcbd09ea6ec9966a 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -636,6 +636,10 @@ static irqreturn_t decon_irq_handler(int irq, void *dev_id)
 	if (!ctx->drm_dev)
 		goto out;
 
+	/* check if crtc and vblank have been initialized properly */
+	if (!drm_dev_has_vblank(ctx->drm_dev))
+		goto out;
+
 	if (!ctx->i80_if) {
 		drm_crtc_handle_vblank(&ctx->crtc->base);
 

-- 
2.49.0

