Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E67739124C
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C89A6EC28;
	Wed, 26 May 2021 08:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3316EC28
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:28:00 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210526082758epoutp038f05cb7336f7bdb880a4f7bc431406ff~CkHv9sdYH0472104721epoutp03b
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:27:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210526082758epoutp038f05cb7336f7bdb880a4f7bc431406ff~CkHv9sdYH0472104721epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1622017678;
 bh=RktK4PAHzSb5HI9eRj2vF9pU4SSaz/E4FtE/NrGactY=;
 h=From:To:Cc:Subject:Date:References:From;
 b=oeI80M4gHQ5yGQ+ZPqWKGGgjk8HADol94CArXObgjZ8CMfC8EvBU3L6NqxZAjCH+v
 UXB5susYdUlr8W5BZgcCqmxmN5W/Y2Cj/f3RS2KIRuOp5fsmGB+c9ErE85lAbje8PA
 Jg00Gwx8mcnLeD+SHUxUBFz9+knCl223w7Db42Bg=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20210526082757epcas1p46b3d2f9508b729535548a8c1ba80c59c~CkHvtJBx_0977609776epcas1p4c;
 Wed, 26 May 2021 08:27:57 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.152]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4FqkbZ5yb8z4x9QQ; Wed, 26 May
 2021 08:27:54 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 5C.98.09824.5760EA06; Wed, 26 May 2021 17:27:33 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210526082732epcas1p189154b27b71df8bd063b5ac1ceb0b3d7~CkHYeaOkj1215112151epcas1p12;
 Wed, 26 May 2021 08:27:32 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210526082732epsmtrp1ad4cde2bbf4dba4daf92833d3d54db10~CkHYdq2pf2708127081epsmtrp1M;
 Wed, 26 May 2021 08:27:32 +0000 (GMT)
X-AuditID: b6c32a37-04bff70000002660-10-60ae06752e97
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 B3.40.08163.4760EA06; Wed, 26 May 2021 17:27:32 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210526082732epsmtip26a2deb9ac9fb7e1ef7909c4d98af6eb0~CkHYOquV40967409674epsmtip2q;
 Wed, 26 May 2021 08:27:32 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2] drm/exynos: use pm_runtime_resume_and_get()
Date: Wed, 26 May 2021 17:37:03 +0900
Message-Id: <20210526083703.323886-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGKsWRmVeSWpSXmKPExsWy7bCmrm4p27oEg8XPJCx6z51ksrjy9T2b
 xaT7E1gsZpzfx2TxqvkRmwOrx+I9L5k8tn97wOpxv/s4k0ffllWMHp83yQWwRmXbZKQmpqQW
 KaTmJeenZOal2yp5B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl5gAtV1IoS8wpBQoFJBYX
 K+nb2RTll5akKmTkF5fYKqUWpOQUWBboFSfmFpfmpesl5+daGRoYGJkCFSZkZ3TObmMv6A+o
 +PHlFnsD4xXnLkZODgkBE4lP69eydzFycQgJ7GCU2LBoOROE84lR4kHTeijnM6PE00tvWLoY
 OcBaTp2KhojvYpS40zqFEWSUkMAXRomDD2RBbDYBVYmJK+6zgdgiAm4STYdnsoLYzAJREm+W
 zgOLCwvYS5z7vpMdxGYBql+8cx1YDa+AlcSPb69YIM6Tl5h56Ts7RFxQ4uTMJywQc+QlmrfO
 ZgY5QkJgH7vE7NYNrBANLhL3/m9gh7CFJV4d3wJlS0m87G9jh2hoZpSYOOM0E4TTwShx9/F1
 qHXGEvuXTmYCeZNZQFNi/S59iLCixM7fcxkhNvNJvPvawwoJCV6JjjYhiBIliWMXbzBC2BIS
 F5ZMZIOwPST2fFvHBgmgWInOBVeYJjDKz0Lyzywk/8xCWLyAkXkVo1hqQXFuemqxYYExcqxu
 YgQnQC3zHYzT3n7QO8TIxMF4iFGCg1lJhPdg89oEId6UxMqq1KL8+KLSnNTiQ4ymwBCeyCwl
 mpwPTMF5JfGGpkbGxsYWJoZmpoaGSuK86c7VCUIC6YklqdmpqQWpRTB9TBycUg1Ml8/f6rd9
 9DlA/njUfq0CiSPLap905jE3mp26LnRCwbb9YYcdy6b/GzdFqws2Kv1+uE87nXW19avGSyUL
 pxwRUJLdYPpENCAgcIb0OqOqy2by9nYMEa8SHZc+yVh+KqfWOVDW6XG037HA4NUn+q9ueMKd
 fjZTprg7MkZv82UpV9/nX2tuLti1fm6shUrLXp27Tw/s5J2e9l2PS31b14O8WjXFoyvD1opo
 KEpGchzQYv/Hf9tW/+f2t5M/Znd7J/MIWLY1X95+4cX3vTVaErnp5S0nTEVOfSqPV9/9fE3w
 vHNz/55Q1dU5aH+jIqnIaXOxGcvcVxONZ37TuxDV+1ng8cyoveeT9jwzEG/Jm3BOiaU4I9FQ
 i7moOBEASTbgswkEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrELMWRmVeSWpSXmKPExsWy7bCSvG4J27oEg/ZZ6ha9504yWVz5+p7N
 YtL9CSwWM87vY7J41fyIzYHVY/Gel0we2789YPW4332cyaNvyypGj8+b5AJYo7hsUlJzMstS
 i/TtErgyOme3sRf0B1T8+HKLvYHxinMXIweHhICJxKlT0V2MXBxCAjsYJdbP7GKFiEtIbNnK
 AWEKSxw+XAxR8olR4tSW9SxdjJwcbAKqEhNX3GcDsUUEPCSavx1nB7GZBWIkXr1fCxYXFrCX
 OPd9J1icBah+8c51rCA2r4CVxI9vr8DmSAjIS8y89J0dIi4ocXLmExaIOfISzVtnM09g5JuF
 JDULSWoBI9MqRsnUguLc9NxiwwKjvNRyveLE3OLSvHS95PzcTYzgYNTS2sG4Z9UHvUOMTByM
 hxglOJiVRHgPNq9NEOJNSaysSi3Kjy8qzUktPsQozcGiJM57oetkvJBAemJJanZqakFqEUyW
 iYNTqoGphW17eK1cxbvK93yblYzFCyS3/bU+rNu3Kzfl5s4X3gu+H2W6XCd++NaX8ozfHC/v
 6R3+9JpfcKmc9r9Sz4ryV58bZ0d+Pjdr5afy9KelbhfuFUzfUDBP5kawsk71huD11QXnj+TM
 LftrOz9047M/xefzT0/m39V2M/2FcH1k4U7+/nxdh317nh4JZ/yTeH2f+vFl20qLJiv5/WoS
 9Sm8L92dqfPA/sWO+oNTTix9mpnCsv300cLGf883T1tZPPW3yb3MyxLN9+Rd3gvlhlYInXSd
 XOm4919OQm+TFb/NXCO7vpdcv2OOWD877PUvxDGiIeb6jCxjibLF9w492JmSOmu1hAhr7L0T
 O97JG4iJKrEUZyQaajEXFScCAP5eXIa1AgAA
X-CMS-MailID: 20210526082732epcas1p189154b27b71df8bd063b5ac1ceb0b3d7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210526082732epcas1p189154b27b71df8bd063b5ac1ceb0b3d7
References: <CGME20210526082732epcas1p189154b27b71df8bd063b5ac1ceb0b3d7@epcas1p1.samsung.com>
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
Cc: airlied@linux.ie, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync()
to deal with usage counter. pm_runtime_get_sync() increases the
usage counter even when it failed, which makes callers to forget
to decrease the usage counter and resulted in reference leak.

pm_runtime_resume_and_get() function decreases the usage counter
when it failed internally so it can avoid the reference leak.

Changelog v1:
- Fix an build error reported by kernel test robot of Intel.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
Reported-by: kernel test robot <lkp@intel.com>
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
index b01f36e76eaf..90d7bf906885 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -1118,7 +1118,12 @@ static int gsc_commit(struct exynos_drm_ipp *ipp,
 	struct gsc_context *ctx = container_of(ipp, struct gsc_context, ipp);
 	int ret;
 
-	pm_runtime_get_sync(ctx->dev);
+	ret = pm_runtime_resume_and_get(ctx->dev);
+	if (ret < 0) {
+		dev_err(ctx->dev, "failed to enable GScaler device.\n");
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

