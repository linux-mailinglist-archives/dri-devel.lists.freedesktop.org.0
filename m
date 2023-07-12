Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732287503B2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15E810E4AC;
	Wed, 12 Jul 2023 09:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6160510E42F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:24 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRH-0001dQ-LH; Wed, 12 Jul 2023 11:47:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRG-00Dr6A-76; Wed, 12 Jul 2023 11:47:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRD-004GU9-P9; Wed, 12 Jul 2023 11:47:11 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Danilo Krummrich <dakr@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Deepak R Varma <drv@mailo.com>
Subject: [PATCH RFC v1 35/52] drm/sprd: Use struct drm_crtc::drm_dev instead
 of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:45 +0200
Message-Id: <20230712094702.1770121-36-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=tJflFUTtMOFxAR1FfOU/gLL/+Ib3NvweyphEfHQ6Qt8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZ/qYU5WfirJ4Fn5gN7SpRmfsMZWqw/oCiXr
 Ig1AXksMAGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52fwAKCRCPgPtYfRL+
 TheCCACWS6n/LKb7M9IJTLgA1x1y4BEdS6tgk2QkINSlGoZJ8pLm1LVduVefXIDpJ9DsHXBl3mV
 UCC9L8N9QHLpqGC5N10WH6FBOKtF8hwGB0q5N6HEVEhI/2O0ZzMMNkOEgjh/jvAtid/D/i+D1yA
 acqJnymOw1QV6twoqL3DBJhQRTh6CPQAXGuHgzoRwHbJfg/BSJnbxOWZQCuPfV29vlPL87rFZYs
 7pzlIfcQ3HBBsk1qX47A25YT9W2+LRvsJIx7VnHV72NwhzI/YfUzGR/GxxNUki4xYi7lVKAIs//
 2T/HtfGmjdYeACqFWbmMC8vDnlcyCOKgOnse/v1DOCTbAl/X
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/sprd/sprd_dpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index b96fc6837b0d..37709bf5a655 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -624,7 +624,7 @@ static void sprd_crtc_mode_set_nofb(struct drm_crtc *crtc)
 
 	drm_display_mode_to_videomode(mode, &dpu->ctx.vm);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev,
+	drm_for_each_encoder_mask(encoder, crtc->drm_dev,
 				  crtc->state->encoder_mask) {
 		dsi = encoder_to_dsi(encoder);
 
@@ -651,7 +651,7 @@ static void sprd_crtc_atomic_disable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
 	struct sprd_dpu *dpu = to_sprd_crtc(crtc);
-	struct drm_device *drm = dpu->base.dev;
+	struct drm_device *drm = dpu->base.drm_dev;
 
 	drm_crtc_vblank_off(&dpu->base);
 
@@ -670,7 +670,7 @@ static void sprd_crtc_atomic_flush(struct drm_crtc *crtc,
 
 {
 	struct sprd_dpu *dpu = to_sprd_crtc(crtc);
-	struct drm_device *drm = dpu->base.dev;
+	struct drm_device *drm = dpu->base.drm_dev;
 
 	sprd_dpu_flip(dpu);
 
-- 
2.39.2

