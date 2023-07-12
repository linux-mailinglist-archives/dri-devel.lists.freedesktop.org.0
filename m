Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 289427503A2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF65910E445;
	Wed, 12 Jul 2023 09:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE4210E3F0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:20 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRI-0001gj-Lk; Wed, 12 Jul 2023 11:47:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRH-00Dr71-BQ; Wed, 12 Jul 2023 11:47:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRF-004GUi-HX; Wed, 12 Jul 2023 11:47:13 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 45/52] drm/vboxvideo: Use struct drm_crtc::drm_dev
 instead of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:55 +0200
Message-Id: <20230712094702.1770121-46-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=oNX51D/tn4JKsw/QFMVi3f79y9A41V8ovPmpp4wwpvU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnaKOtLu5TJ/UiuasdhlxMBsqqs+3Vy0J5e8H
 s5yxmFBUGmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52igAKCRCPgPtYfRL+
 Tr6ZB/0RGAvi14Zbl3uwVDHIq4mUeu88WXG5NvTTpmU8X84S3FcRWiSO4prVBjE/pVmyXqsjVSS
 OkFis2uTZVXqLEKYb7dVlm9GoDDjen78DP5jfzJTShbUWlMNphcvt04IzPd+MC4JBoegMsPzZ/B
 DXCRHyzfpFLRz3TjfJ5GinHe6LAXNpR51lgMfHiZXqGECUqPJyLJvI5FWFMFOQgBqrfsMqkFObI
 lBbymSYCcKf5hFdJ5LK/osHjfhBTXANgZjvKRDMfudw/NUREphyMmd7Qou/YCT7Un1zITHpL1M6
 WQeB3K/OjY+ohVVC7+d/aQgZLtq+itpWBs1q/2lcDONElaVL
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
 drivers/gpu/drm/vboxvideo/vbox_mode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 341edd982cb3..0d415e554898 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -41,7 +41,7 @@ static void vbox_do_modeset(struct drm_crtc *crtc)
 	u16 flags;
 	s32 x_offset, y_offset;
 
-	vbox = to_vbox_dev(crtc->dev);
+	vbox = to_vbox_dev(crtc->drm_dev);
 	width = vbox_crtc->width ? vbox_crtc->width : 640;
 	height = vbox_crtc->height ? vbox_crtc->height : 480;
 	bpp = fb ? fb->format->cpp[0] * 8 : 32;
@@ -82,7 +82,7 @@ static void vbox_do_modeset(struct drm_crtc *crtc)
 static int vbox_set_view(struct drm_crtc *crtc)
 {
 	struct vbox_crtc *vbox_crtc = to_vbox_crtc(crtc);
-	struct vbox_private *vbox = to_vbox_dev(crtc->dev);
+	struct vbox_private *vbox = to_vbox_dev(crtc->drm_dev);
 	struct vbva_infoview *p;
 
 	/*
@@ -179,7 +179,7 @@ static void vbox_crtc_set_base_and_mode(struct drm_crtc *crtc,
 					int x, int y)
 {
 	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(fb->obj[0]);
-	struct vbox_private *vbox = to_vbox_dev(crtc->dev);
+	struct vbox_private *vbox = to_vbox_dev(crtc->drm_dev);
 	struct vbox_crtc *vbox_crtc = to_vbox_crtc(crtc);
 	bool needs_modeset = drm_atomic_crtc_needs_modeset(crtc->state);
 
-- 
2.39.2

