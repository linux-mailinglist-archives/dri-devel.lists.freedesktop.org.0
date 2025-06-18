Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7C3ADEB4D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 14:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292F910E0B0;
	Wed, 18 Jun 2025 12:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="emchsm24";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5057110E115
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 12:06:46 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250618120644euoutp01ce5e71ae0b7ba80823a8502f53f447b8~KIaaZhnht0953109531euoutp01-
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 12:06:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250618120644euoutp01ce5e71ae0b7ba80823a8502f53f447b8~KIaaZhnht0953109531euoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1750248404;
 bh=yQbhjxMIcIlV1dZtVoeXZ7q10XHOAKpTxTLfeQOo+Qc=;
 h=From:To:Cc:Subject:Date:References:From;
 b=emchsm24EvFl+Az3l0FTyqM0bpxcXb4XnIRfwpHIxQYrhKxQraB6OzPqY0uOg5fRC
 qGGwMaAdyC4VVPE8FvePk3vNBuQRc4jE0NnWmEpsQpIQXU37BT6cqyQ9zQdWcRiUmp
 gPUXJwm/y5sYbY+dO74PhCvl/u2rteaOjnK1iGbs=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250618120644eucas1p2b084977540772f3623f3f9e834604668~KIaZ2DC0k1376113761eucas1p2z;
 Wed, 18 Jun 2025 12:06:44 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250618120643eusmtip1fb0873e8da0a3c3ece182a135dbfd763~KIaZPP5Zf1185511855eusmtip1y;
 Wed, 18 Jun 2025 12:06:43 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Aradhya Bhatia
 <aradhya.bhatia@linux.dev>, Inki Dae <inki.dae@samsung.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>
Subject: [PATCH] drm/exynos: fimd: Guard display clock control with runtime
 PM calls
Date: Wed, 18 Jun 2025 14:06:26 +0200
Message-Id: <20250618120626.217023-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250618120644eucas1p2b084977540772f3623f3f9e834604668
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250618120644eucas1p2b084977540772f3623f3f9e834604668
X-EPHeader: CA
X-CMS-RootMailID: 20250618120644eucas1p2b084977540772f3623f3f9e834604668
References: <CGME20250618120644eucas1p2b084977540772f3623f3f9e834604668@eucas1p2.samsung.com>
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

Commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
and post-disable") changed the call sequence to the CRTC enable/disable
and bridge pre_enable/post_disable methods, so those bridge methods are
now called when CRTC is not yet enabled.

This causes a lockup observed on Samsung Peach-Pit/Pi Chromebooks. The
source of this lockup is a call to fimd_dp_clock_enable() function, when
FIMD device is not yet runtime resumed. It worked before the mentioned
commit only because the CRTC implemented by the FIMD driver was always
enabled what guaranteed the FIMD device to be runtime resumed.

This patch adds runtime PM guards to the fimd_dp_clock_enable() function
to enable its proper operation also when the CRTC implemented by FIMD is
not yet enabled.

Fixes: 196e059a8a6a ("drm/exynos: convert clock_enable crtc callback to pipeline clock")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index c394cc702d7d..205c238cc73a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -187,6 +187,7 @@ struct fimd_context {
 	u32				i80ifcon;
 	bool				i80_if;
 	bool				suspended;
+	bool				dp_clk_enabled;
 	wait_queue_head_t		wait_vsync_queue;
 	atomic_t			wait_vsync_event;
 	atomic_t			win_updated;
@@ -1047,7 +1048,18 @@ static void fimd_dp_clock_enable(struct exynos_drm_clk *clk, bool enable)
 	struct fimd_context *ctx = container_of(clk, struct fimd_context,
 						dp_clk);
 	u32 val = enable ? DP_MIE_CLK_DP_ENABLE : DP_MIE_CLK_DISABLE;
+
+	if (enable == ctx->dp_clk_enabled)
+		return;
+
+	if (enable)
+		pm_runtime_resume_and_get(ctx->dev);
+
+	ctx->dp_clk_enabled = enable;
 	writel(val, ctx->regs + DP_MIE_CLKCON);
+
+	if (!enable)
+		pm_runtime_put(ctx->dev);
 }
 
 static const struct exynos_drm_crtc_ops fimd_crtc_ops = {
-- 
2.34.1

