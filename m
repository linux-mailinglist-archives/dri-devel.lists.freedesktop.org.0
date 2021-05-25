Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0094E38FFB1
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 13:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A8189FEC;
	Tue, 25 May 2021 11:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2973892D2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 11:02:59 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210525110257epoutp040c5e5ffcb9cdeaf93cc94d41809e3ff9~CSlycjgN70278102781epoutp04o
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 11:02:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210525110257epoutp040c5e5ffcb9cdeaf93cc94d41809e3ff9~CSlycjgN70278102781epoutp04o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1621940577;
 bh=uSg1CDFZG0Ih/55JLOQENx9RtxS7Ygd7/SvZbZ2lUaY=;
 h=From:To:Cc:Subject:Date:References:From;
 b=JesAbl5JOrxQkb8TtYzDuk/W1STYhRszcbK/l2dBY4p5rJbhdZ/FJMVc3hg53Cte3
 7AHApKJ5bM+yxtL4+UqndQzrJ1uCPVY1sNiMqSacVTEBR5QCdGJ5Kv66LkgTlVv1AG
 NqnuZhKJU3Wvu9Qslqyh8CYSG3Sx49fV+w4QxhZ0=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210525110257epcas1p15bbda9100163835cf9f21c0a8909d22c~CSlyIRznO2225122251epcas1p1N;
 Tue, 25 May 2021 11:02:57 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.157]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4FqB4t0YSzz4x9Pw; Tue, 25 May
 2021 11:02:54 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 EF.5C.09824.D59DCA06; Tue, 25 May 2021 20:02:53 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210525110253epcas1p2f9c7a1bda22b655fe5b52570dcf71fb0~CSluuL7_Q1614516145epcas1p2F;
 Tue, 25 May 2021 11:02:53 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210525110253epsmtrp1ffce6eaced545e894a6f52e5e6052dea~CSlutcE5K0546605466epsmtrp1L;
 Tue, 25 May 2021 11:02:53 +0000 (GMT)
X-AuditID: b6c32a37-061ff70000002660-7d-60acd95d1282
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 0F.6C.08637.D59DCA06; Tue, 25 May 2021 20:02:53 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210525110253epsmtip1c537a09fd80a7070853bc2b3298e7190~CSlufLAY62903529035epsmtip15;
 Tue, 25 May 2021 11:02:53 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: use pm_runtime_resume_and_get()
Date: Tue, 25 May 2021 20:12:22 +0900
Message-Id: <20210525111222.241131-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFKsWRmVeSWpSXmKPExsWy7bCmvm7szTUJBhdO2lj0njvJZHHl63s2
 i0n3J7BYzDi/j8mBxWP7twesHve7jzN59G1ZxejxeZNcAEtUtk1GamJKapFCal5yfkpmXrqt
 kndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0EolhbLEnFKgUEBicbGSvp1NUX5pSapC
 Rn5xia1SakFKToFlgV5xYm5xaV66XnJ+rpWhgYGRKVBhQnbGikPz2Qva/CuWvDjC2sD4xKmL
 kZNDQsBEYtfHI+xdjFwcQgI7GCUeNz5kgnA+MUr8XPSNEaRKSOAbo8SiTQEwHcsaHkB17GWU
 WPD3CDOE84VR4v/vO0wgVWwCqhITV9xnA7FFBNwkmg7PZAWxmQVMJWY9/8ECYgsL2EhcetwA
 1MzBwQJU3zepEMTkFbCSODwhFmKXvMTMS9/ZQWxeAUGJkzOfsEBMkZdo3jqbGaJmE7vEoT5d
 CNtFYk3XJai4sMSr41vYIWwpiZf9bWA3Swg0M0pMnHGaCcLpYJS4+/g6C0SVscT+pZOZQI5g
 FtCUWL9LHyKsKLHz91xGiMV8Eu++9rCClEgI8Ep0tAlBlChJHLt4gxHClpC4sGQiG4TtIbFx
 /0F2SBjGSmx4vZ99AqP8LCTvzELyziyExQsYmVcxiqUWFOempxYbFhgjx+kmRnCi0zLfwTjt
 7Qe9Q4xMHIyHGCU4mJVEeP/2rUwQ4k1JrKxKLcqPLyrNSS0+xGgKDN6JzFKiyfnAVJtXEm9o
 amRsbGxhYmhmamioJM6b7lydICSQnliSmp2aWpBaBNPHxMEp1cB0U5yvYN6Fa1/e1L+dd3uT
 T/pjPXYJyVMMUsWck8wk1i2T1Q6NCvj88r+anni4FqtCz+bXErcnnLxY2Hnq/DL7s6cn/vvV
 v1Fnm4dES8o2Q/Gpla479i78vFSV5fL7OQaH7OTrXa9/Cw52vsA7rXVu+YKc6F16J3/73uN2
 36myoCX7xH6uyiWh/eyzVMysTq05E6ndVf3t0sboqWybHdS35fab9KwSDJL4eEZhUsTNdJel
 QlN27Hvx80qY4EMPpbzyrjW2k7N1pnVPiT6ul2Tsx3/nwIKoI5bbU7/21Ci+qSouWK23M9dq
 zTaJtvOeUQntPLGz16zO7vpbb/vimc+ChpWJ7I4Km7inn9foe7BPiaU4I9FQi7moOBEAmXwv
 HP0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOLMWRmVeSWpSXmKPExsWy7bCSnG7szTUJBr/7BS16z51ksrjy9T2b
 xaT7E1gsZpzfx+TA4rH92wNWj/vdx5k8+rasYvT4vEkugCWKyyYlNSezLLVI3y6BK2PFofns
 BW3+FUteHGFtYHzi1MXIySEhYCKxrOEBexcjF4eQwG5GiSPTGxi7GDmAEhISW7ZyQJjCEocP
 F0OUfGKUONe5lBGkl01AVWLiivtsILaIgIdE87fj7CA2s4C5xJbJs5lBbGEBG4lLjxuYQeaw
 ANX3TSoEMXkFrCQOT4iFuEBeYual72CdvAKCEidnPmGBmCIv0bx1NvMERr5ZSFKzkKQWMDKt
 YpRMLSjOTc8tNiwwzEst1ytOzC0uzUvXS87P3cQIDjstzR2M21d90DvEyMTBeIhRgoNZSYT3
 b9/KBCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8F7pOxgsJpCeWpGanphakFsFkmTg4pRqYks4e
 P73dcXnR7PY7P41DjVh5L6j5qxixb875qr939UfDpxIub0u+eswomnrm8sQ8b3fBidus1929
 datgm/1h14fuv5bF/vusycE/5z2P5xkJxQ6fCKXGn1fL/X1uabDvCln5V4xr96La/o3KTTOF
 z9jUv7di3BFt5+a5v2va/Y5QyXeMtabJi1dlmIte4wiaMztxcklA4F/W0s+1z05mGtuGzvMV
 1//tUCu1Iohhx9apU/hZf3JVP3pxvD02pHaDEkOUjMSDu4Vpwv/sd2yNy13tzOjPezTpe/sh
 5iV8xs8N68Rz42fY1t7ftdbp3z8Tn9Kdgtv+6JqLXlUNcnbfPsvAvDhJ8DRj/BPJ3A1KLMUZ
 iYZazEXFiQD9OzL9qgIAAA==
X-CMS-MailID: 20210525110253epcas1p2f9c7a1bda22b655fe5b52570dcf71fb0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210525110253epcas1p2f9c7a1bda22b655fe5b52570dcf71fb0
References: <CGME20210525110253epcas1p2f9c7a1bda22b655fe5b52570dcf71fb0@epcas1p2.samsung.com>
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
Cc: airlied@linux.ie
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync()
to deal with usage counter. pm_runtime_get_sync() increases the
usage counter even when it failed, which makes callers to forget
to decrease the usage counter and resulted in reference leak.

pm_runtime_resume_and_get() function decreases the usage counter
when it failed internally so it can avoid the reference leak.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  7 +++++-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  7 +++++-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       |  7 +++++-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      |  8 +++++-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 25 +++++++++++++++----
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  9 ++++++-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       |  7 +++++-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   |  7 +++++-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    | 10 +++++---
 drivers/gpu/drm/exynos/exynos_hdmi.c          |  8 +++++-
 drivers/gpu/drm/exynos/exynos_mixer.c         |  7 +++++-
 11 files changed, 84 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index b9a4b7670a89..63dd85af13f2 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -513,8 +513,13 @@ static void decon_swreset(struct decon_context *ctx)
 static void decon_atomic_enable(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
+	int ret;
 
-	pm_runtime_get_sync(ctx->dev);
+	ret = pm_runtime_resume_and_get(ctx->dev);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev, "failed to enable DECON device.\n");
+		return;
+	}
 
 	exynos_drm_pipe_clk_enable(crtc, true);
 
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 431c5d32f9a4..b61edc54e66f 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -531,11 +531,16 @@ static void decon_init(struct decon_context *ctx)
 static void decon_atomic_enable(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
+	int ret;
 
 	if (!ctx->suspended)
 		return;
 
-	pm_runtime_get_sync(ctx->dev);
+	ret = pm_runtime_resume_and_get(ctx->dev);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev, "failed to enable DECON device.\n");
+		return;
+	}
 
 	decon_init(ctx);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 44e402b7cdfb..5bb1388a8b18 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1383,7 +1383,12 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
 	if (dsi->state & DSIM_STATE_ENABLED)
 		return;
 
-	pm_runtime_get_sync(dsi->dev);
+	ret = pm_runtime_resume_and_get(dsi->dev);
+	if (ret < 0) {
+		dev_err(dsi->dev, "failed to enable DSI device.\n");
+		return;
+	}
+
 	dsi->state |= DSIM_STATE_ENABLED;
 
 	if (dsi->panel) {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 29ab8be8604c..a3c718148c45 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1085,8 +1085,14 @@ static int fimc_commit(struct exynos_drm_ipp *ipp,
 {
 	struct fimc_context *ctx =
 			container_of(ipp, struct fimc_context, ipp);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(ctx->dev);
+	if (ret < 0) {
+		dev_err(ctx->dev, "failed to enable FIMC device.\n");
+		return ret;
+	}
 
-	pm_runtime_get_sync(ctx->dev);
 	ctx->task = task;
 
 	fimc_src_set_fmt(ctx, task->src.buf.fourcc, task->src.buf.modifier);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 49a2e0c53918..5955bd90accb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -343,13 +343,18 @@ static void fimd_enable_shadow_channel_path(struct fimd_context *ctx,
 	writel(val, ctx->regs + SHADOWCON);
 }
 
-static void fimd_clear_channels(struct exynos_drm_crtc *crtc)
+static int fimd_clear_channels(struct exynos_drm_crtc *crtc)
 {
 	struct fimd_context *ctx = crtc->ctx;
 	unsigned int win, ch_enabled = 0;
+	int ret;
 
 	/* Hardware is in unknown state, so ensure it gets enabled properly */
-	pm_runtime_get_sync(ctx->dev);
+	ret = pm_runtime_resume_and_get(ctx->dev);
+	if (ret < 0) {
+		dev_err(ctx->dev, "failed to enable FIMD device.\n");
+		return ret;
+	}
 
 	clk_prepare_enable(ctx->bus_clk);
 	clk_prepare_enable(ctx->lcd_clk);
@@ -384,6 +389,8 @@ static void fimd_clear_channels(struct exynos_drm_crtc *crtc)
 	clk_disable_unprepare(ctx->bus_clk);
 
 	pm_runtime_put(ctx->dev);
+
+	return 0;
 }
 
 
@@ -905,7 +912,10 @@ static void fimd_atomic_enable(struct exynos_drm_crtc *crtc)
 
 	ctx->suspended = false;
 
-	pm_runtime_get_sync(ctx->dev);
+	if (pm_runtime_resume_and_get(ctx->dev) < 0) {
+		dev_warn(ctx->dev, "failed to enable FIMD device.\n");
+		return;
+	}
 
 	/* if vblank was enabled status, enable it again. */
 	if (test_and_clear_bit(0, &ctx->irq_flags))
@@ -1089,8 +1099,13 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 	if (ctx->encoder)
 		exynos_dpi_bind(drm_dev, ctx->encoder);
 
-	if (is_drm_iommu_supported(drm_dev))
-		fimd_clear_channels(ctx->crtc);
+	if (is_drm_iommu_supported(drm_dev)) {
+		int ret;
+
+		ret = fimd_clear_channels(ctx->crtc);
+		if (ret < 0)
+			return ret;
+	}
 
 	return exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 1e0c5a7f206e..cab4d2c370a7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -892,7 +892,14 @@ static void g2d_runqueue_worker(struct work_struct *work)
 		g2d->runqueue_node = g2d_get_runqueue_node(g2d);
 
 		if (g2d->runqueue_node) {
-			pm_runtime_get_sync(g2d->dev);
+			int ret;
+
+			ret = pm_runtime_resume_and_get(g2d->dev);
+			if (ret < 0) {
+				dev_err(g2d->dev, "failed to enable G2D device.\n");
+				return;
+			}
+
 			g2d_dma_start(g2d, g2d->runqueue_node);
 		}
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index b01f36e76eaf..e4cd413f1c26 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -1118,7 +1118,12 @@ static int gsc_commit(struct exynos_drm_ipp *ipp,
 	struct gsc_context *ctx = container_of(ipp, struct gsc_context, ipp);
 	int ret;
 
-	pm_runtime_get_sync(ctx->dev);
+	ret = pm_runtime_resume_and_get(ctx->dev);
+	if (ret < 0) {
+		dev_err("failed to enable GScaler device.\n");
+		return ret;
+	}
+
 	ctx->task = task;
 
 	ret = gsc_reset(ctx);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index 2d94afba031e..ee61be4cf152 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -219,8 +219,13 @@ static int rotator_commit(struct exynos_drm_ipp *ipp,
 {
 	struct rot_context *rot =
 			container_of(ipp, struct rot_context, ipp);
+	int ret;
 
-	pm_runtime_get_sync(rot->dev);
+	ret = pm_runtime_resume_and_get(rot->dev);
+	if (ret < 0) {
+		dev_err(rot->dev, "failed to enable ROTATOR device.\n");
+		return ret;
+	}
 	rot->task = task;
 
 	rotator_src_set_fmt(rot, task->src.buf.fourcc);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
index ce1857138f89..f9ae5b038d59 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
@@ -362,15 +362,17 @@ static int scaler_commit(struct exynos_drm_ipp *ipp,
 	struct drm_exynos_ipp_task_rect *src_pos = &task->src.rect;
 	struct drm_exynos_ipp_task_rect *dst_pos = &task->dst.rect;
 	const struct scaler_format *src_fmt, *dst_fmt;
+	int ret = 0;
 
 	src_fmt = scaler_get_format(task->src.buf.fourcc);
 	dst_fmt = scaler_get_format(task->dst.buf.fourcc);
 
-	pm_runtime_get_sync(scaler->dev);
-	if (scaler_reset(scaler)) {
-		pm_runtime_put(scaler->dev);
+	ret = pm_runtime_resume_and_get(scaler->dev);
+	if (ret < 0)
+		return ret;
+
+	if (scaler_reset(scaler))
 		return -EIO;
-	}
 
 	scaler->task = task;
 
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 39fa5d3b01ef..f893731d6021 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1483,10 +1483,16 @@ static void hdmi_set_refclk(struct hdmi_context *hdata, bool on)
 /* Should be called with hdata->mutex mutex held. */
 static void hdmiphy_enable(struct hdmi_context *hdata)
 {
+	int ret;
+
 	if (hdata->powered)
 		return;
 
-	pm_runtime_get_sync(hdata->dev);
+	ret = pm_runtime_resume_and_get(hdata->dev);
+	if (ret < 0) {
+		dev_err(hdata->dev, "failed to enable HDMIPHY device.\n");
+		return;
+	}
 
 	if (regulator_bulk_enable(ARRAY_SIZE(supply), hdata->regul_bulk))
 		DRM_DEV_DEBUG_KMS(hdata->dev,
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index af192e5a16ef..41c54f1f60bc 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -992,11 +992,16 @@ static void mixer_atomic_flush(struct exynos_drm_crtc *crtc)
 static void mixer_atomic_enable(struct exynos_drm_crtc *crtc)
 {
 	struct mixer_context *ctx = crtc->ctx;
+	int ret;
 
 	if (test_bit(MXR_BIT_POWERED, &ctx->flags))
 		return;
 
-	pm_runtime_get_sync(ctx->dev);
+	ret = pm_runtime_resume_and_get(ctx->dev);
+	if (ret < 0) {
+		dev_err(ctx->dev, "failed to enable MIXER device.\n");
+		return;
+	}
 
 	exynos_drm_pipe_clk_enable(crtc, true);
 
-- 
2.25.1

