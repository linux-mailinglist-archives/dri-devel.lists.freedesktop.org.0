Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3485ADE4F3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 09:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156C210E7A5;
	Wed, 18 Jun 2025 07:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="H//lwHnr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="P5G7mtx1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AAA10E79C;
 Wed, 18 Jun 2025 07:54:00 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1750233234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hRSi6LPnJlewbz9+M2YF21yD0hWG5s8j8Ev4VekeCS4=;
 b=H//lwHnrCxwgr5Qyne1dSebZ0C/TyDzHnxgNkRFUbl7V9Foo1dPQAUyndYYFRSCve24JFX
 +U9gITtVlgE+7icVecD1ruTrs8B1ggford7mBnDhhcfkXaKQiOenSTkKfdHtKErvXHr2XB
 w+45928VjRAOcQlJZdr2j+y20Pm2ghWlXG84ccC/DWt+8bQnmtnMSX9IFOoYsK0lVnfxi+
 uJFCp42Jf5r3Qo9P9YIiNofXWn736P+O17Rcmzy7GVZD8tPg7ZvVVgnKsUxm9bqTHw8XKs
 wHH6f/WEy/TK+k7+qfG6YVagctnRjA7zvJ9rVAMlmv/yAxA1v1Tps/lDHa1xlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1750233234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hRSi6LPnJlewbz9+M2YF21yD0hWG5s8j8Ev4VekeCS4=;
 b=P5G7mtx1ZaQLqKuTMGNxDi36WMAI+1JfQ/MuzORfSpbSJ49TWx3v/9mFK4n2WTbB6gO3fC
 Zm2GV+ALFLNk5bDQ==
Date: Wed, 18 Jun 2025 09:52:22 +0200
Subject: [PATCH 3/3] drm/msm: Don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250618-restricted-pointers-drm-v1-3-781e0d88cd92@linutronix.de>
References: <20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de>
In-Reply-To: <20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750233231; l=3885;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=+2X4ysqtRsTHUcY7E66k0quE5SROmLVa6c2NEYuHLu8=;
 b=MeeQzXgwzNU70goRi3hW4b0ZRIX5paYKudW6CbBEdnXyP3jia+DNmdrTI96uSVghsbe/qLu+G
 rR+U5ckgaEMAZhybeZ7KstPqWrBTAGqWMDI8Grel1fif13GmYkJa2OT
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
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

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping locks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 4 ++--
 drivers/gpu/drm/msm/msm_mdss.c              | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..9aa635f9462df6e496635e3316217f0245e03157 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -565,7 +565,7 @@ static void _dpu_crtc_complete_flip(struct drm_crtc *crtc)
 
 	spin_lock_irqsave(&dev->event_lock, flags);
 	if (dpu_crtc->event) {
-		DRM_DEBUG_VBL("%s: send event: %pK\n", dpu_crtc->name,
+		DRM_DEBUG_VBL("%s: send event: %p\n", dpu_crtc->name,
 			      dpu_crtc->event);
 		trace_dpu_crtc_complete_flip(DRMID(crtc));
 		drm_crtc_send_vblank_event(crtc, dpu_crtc->event);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 829ca272873e45b122c04bea7da22dc569732e10..08cb1014299bcc9ce146b564721a6058df824cf0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -31,14 +31,14 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 	u32 base;
 
 	if (!ctx) {
-		DRM_ERROR("invalid ctx %pK\n", ctx);
+		DRM_ERROR("invalid ctx %p\n", ctx);
 		return;
 	}
 
 	base = ctx->cap->sblk->pcc.base;
 
 	if (!base) {
-		DRM_ERROR("invalid ctx %pK pcc base 0x%x\n", ctx, base);
+		DRM_ERROR("invalid ctx %p pcc base 0x%x\n", ctx, base);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1fd82b6747e9058ce11dc2620729921492d5ebdd..4290ef3004985376ebd13afd1f014265cf887490 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1345,7 +1345,7 @@ static int dpu_kms_mmap_mdp5(struct dpu_kms *dpu_kms)
 		dpu_kms->mmio = NULL;
 		return ret;
 	}
-	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
+	DRM_DEBUG("mapped dpu address space @%p\n", dpu_kms->mmio);
 
 	dpu_kms->vbif[VBIF_RT] = msm_ioremap_mdss(mdss_dev,
 						  dpu_kms->pdev,
@@ -1380,7 +1380,7 @@ static int dpu_kms_mmap_dpu(struct dpu_kms *dpu_kms)
 		dpu_kms->mmio = NULL;
 		return ret;
 	}
-	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
+	DRM_DEBUG("mapped dpu address space @%p\n", dpu_kms->mmio);
 
 	dpu_kms->vbif[VBIF_RT] = msm_ioremap(pdev, "vbif");
 	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 709979fcfab6062c0f316f7655823e888638bfea..c5e6e98e0ced3adae9086b220fc9d5d026ac3fd1 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -456,7 +456,7 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 	if (IS_ERR(msm_mdss->mmio))
 		return ERR_CAST(msm_mdss->mmio);
 
-	dev_dbg(&pdev->dev, "mapped mdss address space @%pK\n", msm_mdss->mmio);
+	dev_dbg(&pdev->dev, "mapped mdss address space @%p\n", msm_mdss->mmio);
 
 	ret = msm_mdss_parse_data_bus_icc_path(&pdev->dev, msm_mdss);
 	if (ret)

-- 
2.49.0

