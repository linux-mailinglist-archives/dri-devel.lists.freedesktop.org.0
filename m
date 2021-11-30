Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D86B463A24
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 16:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317556E5A2;
	Tue, 30 Nov 2021 15:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C782F6E5A2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:33:12 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id m25so20515293qtq.13
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 07:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2jjuO7lqRWAk5WWMHz1mqRfu620NmNOV/UK4jf26AgI=;
 b=JNPVw6euUkUx4vXB4j01jMDG+EDhJkeYUMFmXSbfZPYKY0F7K+uj2TEfGn0rR+WKaD
 dYUzYY74aM9R+X2XJSk6ogTThgd7O2czL27IEmzr3U72RvR91eowMiZc+w9+lxqk4m3y
 mBSHJXtGoBvm9lWLEMWD9NDApB4IcSmCyCl+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2jjuO7lqRWAk5WWMHz1mqRfu620NmNOV/UK4jf26AgI=;
 b=5A7Uq3LRV4kakq5O2clvmkXABVkzUDlDWWftSgUZdvTvWZL8tEKaE7577CaxgYWLcZ
 8qdKJiItghU7wj0qvfh8DbzQJOL8iY3OgeBhdwAI32EviS35SRiqj/6F6xMb/5AbV+3u
 jMFyg+mUNnK+YFcf4jbm9xra2U11D+7pwGol1zROawqxz69iTBKDWZwnjOCB6W1tTi9P
 fnJ5VU6+Vdv1fwbziopiCy8FS6ahg87qxKgdFisB8NZgBhC3kedfQ2wP5/R94Km73o77
 42p713ySlk7vsICgum/KPZXkoLodUK9PmZ70b16oTPEFjJivrDuFXGxhkotxm9PhKBcR
 EBuw==
X-Gm-Message-State: AOAM531oISPV+SHsT40/45rCRCt70do/Zix2xE/WOWJNTthKRok6CWgp
 YbqhJ7pk6Iadue6xVuIubVmvQg==
X-Google-Smtp-Source: ABdhPJxJen6JwxhPTLHSpP1SDt/RKEliLjYRZ5u2Daa2sVHKIWX+pQv78p8EQ6CKT7srQ204DM1W4A==
X-Received: by 2002:ac8:7d11:: with SMTP id g17mr19725qtb.460.1638286391920;
 Tue, 30 Nov 2021 07:33:11 -0800 (PST)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:6142:2970:fb63:b9a0])
 by smtp.gmail.com with ESMTPSA id i6sm10713753qkn.26.2021.11.30.07.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 07:33:11 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
To: 
Subject: [PATCH] drm/mediatek: Implement get_scanout_position for DSI
Date: Tue, 30 Nov 2021 10:33:03 -0500
Message-Id: <20211130153308.2560979-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
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
Cc: robdclark@chromium.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 quic_jesszhan@quicinc.com, linux-arm-kernel@lists.infradead.org,
 Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

[Why]
vblank timestamp needs GPU high precision timestamp query to avoid using
the current monotonic/gettimeofday timestamp as best estimate.

[How]
Implement driver get_vblank_timestamp call which calls
get_scanout_position which loops over the CRTC comps to find a
component with get_scanout_position implemented.
Implement get_scanout_position for DSI component.

Tested on: Jacuzzi (MT8183)
Fixes: igt@kms_flip expected frametime standard deviation to be lower
than 0.05%

Suggested-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Signed-off-byL Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 ++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 48 ++++++++++++------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 18 +++++++
 drivers/gpu/drm/mediatek/mtk_dsi.c          | 55 +++++++++++++++++++++
 5 files changed, 112 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 86c3068894b11..6c0f1acb2cc22 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -44,6 +44,10 @@ void mtk_dpi_stop(struct device *dev);
 
 void mtk_dsi_ddp_start(struct device *dev);
 void mtk_dsi_ddp_stop(struct device *dev);
+bool mtk_dsi_get_scanout_position(struct device *dev, bool in_vblank_irq,
+				  int *vpos, int *hpos, ktime_t *stime,
+				  ktime_t *etime,
+				  const struct drm_display_mode *mode);
 
 int mtk_gamma_clk_enable(struct device *dev);
 void mtk_gamma_clk_disable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 798cce90351b6..5e4e8aa005d7c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -674,25 +674,45 @@ static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 		}
 	mtk_drm_crtc_update_config(mtk_crtc, !!mtk_crtc->event);
 }
+static bool mtk_drm_crtc_get_scanout_position(
+	struct drm_crtc *crtc, bool in_vblank_irq, int *vpos, int *hpos,
+	ktime_t *stime, ktime_t *etime, const struct drm_display_mode *mode)
+{
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	int i;
+
+	if (!mtk_crtc->enabled)
+		return false;
+
+	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
+		struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[i];
+		if (mtk_ddp_comp_get_scanout_position(comp, in_vblank_irq, vpos,
+						      hpos, stime, etime, mode))
+			return true;
+	}
+	return false;
+}
 
 static const struct drm_crtc_funcs mtk_crtc_funcs = {
-	.set_config		= drm_atomic_helper_set_config,
-	.page_flip		= drm_atomic_helper_page_flip,
-	.destroy		= mtk_drm_crtc_destroy,
-	.reset			= mtk_drm_crtc_reset,
-	.atomic_duplicate_state	= mtk_drm_crtc_duplicate_state,
-	.atomic_destroy_state	= mtk_drm_crtc_destroy_state,
-	.enable_vblank		= mtk_drm_crtc_enable_vblank,
-	.disable_vblank		= mtk_drm_crtc_disable_vblank,
+	.set_config = drm_atomic_helper_set_config,
+	.page_flip = drm_atomic_helper_page_flip,
+	.destroy = mtk_drm_crtc_destroy,
+	.reset = mtk_drm_crtc_reset,
+	.atomic_duplicate_state = mtk_drm_crtc_duplicate_state,
+	.atomic_destroy_state = mtk_drm_crtc_destroy_state,
+	.enable_vblank = mtk_drm_crtc_enable_vblank,
+	.disable_vblank = mtk_drm_crtc_disable_vblank,
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
 };
 
 static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
-	.mode_fixup	= mtk_drm_crtc_mode_fixup,
-	.mode_set_nofb	= mtk_drm_crtc_mode_set_nofb,
-	.atomic_begin	= mtk_drm_crtc_atomic_begin,
-	.atomic_flush	= mtk_drm_crtc_atomic_flush,
-	.atomic_enable	= mtk_drm_crtc_atomic_enable,
-	.atomic_disable	= mtk_drm_crtc_atomic_disable,
+	.mode_fixup = mtk_drm_crtc_mode_fixup,
+	.mode_set_nofb = mtk_drm_crtc_mode_set_nofb,
+	.atomic_begin = mtk_drm_crtc_atomic_begin,
+	.atomic_flush = mtk_drm_crtc_atomic_flush,
+	.atomic_enable = mtk_drm_crtc_atomic_enable,
+	.atomic_disable = mtk_drm_crtc_atomic_disable,
+	.get_scanout_position = mtk_drm_crtc_get_scanout_position,
 };
 
 static int mtk_drm_crtc_init(struct drm_device *drm,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 5860533ee9532..1c5ac4ccdcd30 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -252,6 +252,7 @@ static const struct mtk_ddp_comp_funcs ddp_dpi = {
 static const struct mtk_ddp_comp_funcs ddp_dsi = {
 	.start = mtk_dsi_ddp_start,
 	.stop = mtk_dsi_ddp_stop,
+	.get_scanout_position = mtk_dsi_get_scanout_position,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_gamma = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 1b582262b682b..f1e6cee8175f7 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -16,6 +16,7 @@ struct drm_crtc;
 struct drm_device;
 struct mtk_plane_state;
 struct drm_crtc_state;
+struct drm_display_mode;
 
 enum mtk_ddp_comp_type {
 	MTK_DISP_OVL,
@@ -65,6 +66,10 @@ struct mtk_ddp_comp_funcs {
 	void (*bgclr_in_off)(struct device *dev);
 	void (*ctm_set)(struct device *dev,
 			struct drm_crtc_state *state);
+	bool (*get_scanout_position)(struct device *dev, bool in_vblank_irq,
+				     int *vpos, int *hpos, ktime_t *stime,
+				     ktime_t *etime,
+				     const struct drm_display_mode *mode);
 };
 
 struct mtk_ddp_comp {
@@ -184,6 +189,19 @@ static inline void mtk_ddp_ctm_set(struct mtk_ddp_comp *comp,
 		comp->funcs->ctm_set(comp->dev, state);
 }
 
+static inline bool mtk_ddp_comp_get_scanout_position(
+	struct mtk_ddp_comp *comp, bool in_vblank_irq, int *vpos, int *hpos,
+	ktime_t *stime, ktime_t *etime, const struct drm_display_mode *mode)
+{
+	if (comp->funcs && comp->funcs->get_scanout_position) {
+		return comp->funcs->get_scanout_position(comp->dev,
+							 in_vblank_irq, vpos,
+							 hpos, stime, etime,
+							 mode);
+	}
+	return false;
+}
+
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
 unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 0ad7157660afa..1c2b95bcc3e9c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2015 MediaTek Inc.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/iopoll.h>
@@ -147,6 +148,9 @@
 
 #define MMSYS_SW_RST_DSI_B BIT(25)
 
+#define DSI_INPUT_DEBUG 0x1D4
+#define INP_LINE_CNT GENMASK(29, 16)
+
 #define NS_TO_CYCLE(n, c)    ((n) / (c) + (((n) % (c)) ? 1 : 0))
 
 #define MTK_DSI_HOST_IS_READ(type) \
@@ -1208,6 +1212,57 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	return ret;
 }
 
+bool mtk_dsi_get_scanout_position(struct device *dev, bool in_vblank_irq,
+				  int *vpos, int *hpos, ktime_t *stime,
+				  ktime_t *etime,
+				  const struct drm_display_mode *mode)
+{
+	struct mtk_dsi *dsi = dev_get_drvdata(dev);
+	int line_count = 0;
+
+	int vsw = mode->crtc_vsync_end - mode->crtc_vsync_start;
+	int vbp = mode->crtc_vtotal - mode->crtc_vsync_end;
+
+	int vactive_start = vsw + vbp + 1;
+	int vactive_end = vactive_start + mode->crtc_vdisplay;
+	int vfp_end = mode->crtc_vtotal;
+
+	/*
+	 * Target location for timestamp taken immediately before
+	 * scanout position query.
+	 */
+	if (stime)
+		*stime = ktime_get();
+
+	line_count =
+		FIELD_GET(INP_LINE_CNT, readl(dsi->regs + DSI_INPUT_DEBUG));
+
+	/*
+	 * Target location for timestamp taken immediately after
+	 * scanout position query.
+	 */
+	if (etime)
+		*etime = ktime_get();
+
+	/*
+	 * Returns vpos as a positive number while in active scanout area.
+	 * Returns vpos as a negative number inside vblank, counting the number
+	 * of scanlines to go until end of vblank, e.g., -1 means "one scanline
+	 * until start of active scanout / end of vblank."
+	 */
+	if (line_count < vactive_start)
+		line_count -= vactive_start;
+	else if (line_count > vactive_end)
+		line_count = line_count - vfp_end - vactive_start;
+	else
+		line_count -= vactive_start;
+
+	*vpos = line_count;
+	*hpos = 0; /* keep 0, this is informational */
+
+	return true;
+}
+
 static int mtk_dsi_remove(struct platform_device *pdev)
 {
 	struct mtk_dsi *dsi = platform_get_drvdata(pdev);
-- 
2.34.0.rc2.393.gf8c9666880-goog

