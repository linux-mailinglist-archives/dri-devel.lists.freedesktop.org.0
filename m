Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B9B7503B5
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA6D10E4AE;
	Wed, 12 Jul 2023 09:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95F910E3E6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:21 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRH-0001bN-LP; Wed, 12 Jul 2023 11:47:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRF-00Dr60-QK; Wed, 12 Jul 2023 11:47:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRE-004GUF-4s; Wed, 12 Jul 2023 11:47:12 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH RFC v1 37/52] drm/stm: Use struct drm_crtc::drm_dev instead of
 struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:47 +0200
Message-Id: <20230712094702.1770121-38-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2646;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=/IxcW2l34WOoLU35MOtcq9p89hyZz5PK8UiVz0jKNbg=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnaBwkoryNWu0Imzm98w+EZi3Gt4BkGCadImw
 hu36lIvVqOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52gQAKCRCPgPtYfRL+
 Tq7GCACTlOaAMoLlEbLHPEOgq0ddyAbNCiKJ3Z2xgoSL3ArYO1wSguUa7UfS+Vrytj51UCsvfp6
 m3KWe/dSTqwNcKzqCF92GSfZqK/I9J4nAPL10JPzZ1JpGiIuSIUEC2UALoeMgLGD+eJR9EpDOTd
 ARCtAB/09oYpZrMbdmxrmkKT1yMZlpSp1fs8oytMoK19VpFWFczx58vuWpmr+8KST6a+6RwZIp1
 Vsdk1eJi8vTRVJcDEmEBe33OEQMkUTQF4dnUotuejce/8qKdzpkn8ZzJ6sNLIBh/AjjfnJhb7AR
 A49ZQ/6obOqukz6g/p24+k4ritOHWaXkJr4sQBJ6NjbX/1p5
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/stm/ltdc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index b8be4c1db423..d7bf7b63d8df 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -484,7 +484,7 @@ static const u32 ltdc_ycbcr2rgb_coeffs[DRM_COLOR_ENCODING_MAX][DRM_COLOR_RANGE_M
 
 static inline struct ltdc_device *crtc_to_ltdc(struct drm_crtc *crtc)
 {
-	return (struct ltdc_device *)crtc->dev->dev_private;
+	return (struct ltdc_device *) crtc->drm_dev->dev_private;
 }
 
 static inline struct ltdc_device *plane_to_ltdc(struct drm_plane *plane)
@@ -775,7 +775,7 @@ static void ltdc_crtc_atomic_enable(struct drm_crtc *crtc,
 				    struct drm_atomic_state *state)
 {
 	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm_dev;
 
 	DRM_DEBUG_DRIVER("\n");
 
@@ -798,7 +798,7 @@ static void ltdc_crtc_atomic_disable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
 	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm_dev;
 	int layer_index = 0;
 
 	DRM_DEBUG_DRIVER("\n");
@@ -891,7 +891,7 @@ static bool ltdc_crtc_mode_fixup(struct drm_crtc *crtc,
 static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
 	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm_dev;
 	struct drm_connector_list_iter iter;
 	struct drm_connector *connector = NULL;
 	struct drm_encoder *encoder = NULL, *en_iter;
@@ -1034,7 +1034,7 @@ static void ltdc_crtc_atomic_flush(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
 	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm_dev;
 	struct drm_pending_vblank_event *event = crtc->state->event;
 
 	DRM_DEBUG_ATOMIC("\n");
@@ -1063,7 +1063,7 @@ static bool ltdc_crtc_get_scanout_position(struct drm_crtc *crtc,
 					   ktime_t *stime, ktime_t *etime,
 					   const struct drm_display_mode *mode)
 {
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm_dev;
 	struct ltdc_device *ldev = ddev->dev_private;
 	int line, vactive_start, vactive_end, vtotal;
 
-- 
2.39.2

