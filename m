Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E98C87503A8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C8F10E457;
	Wed, 12 Jul 2023 09:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3398D10E3E6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:17 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRG-0001VP-3F; Wed, 12 Jul 2023 11:47:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRE-00Dr5h-HU; Wed, 12 Jul 2023 11:47:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRD-004GU3-Hs; Wed, 12 Jul 2023 11:47:11 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 34/52] drm/solomon: Use struct drm_crtc::drm_dev
 instead of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:44 +0200
Message-Id: <20230712094702.1770121-35-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=hCn25jwYWKNeDd864ttlPA87sZRDD1IADO+vKxrzZXM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZ9CVYuN8HyD3198UhoSH4IybTVf0NyLGtEC
 Fj7I2RjWuWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52fQAKCRCPgPtYfRL+
 Tj1OB/4vTOWzdpHrWzpIyzOWvLH4arfHLGWDh1L9NO81RSxfpYSSO9LPvOKmaBalLRVNBnIZhae
 kvWU5FxJVnX4nmMiwk6Y4JjcxIXQ9RuDzDAPzcPeWo25DXyd4gflOwautWjx7JB3euI3koXTc/s
 fLNDfR6RqbxGuoAm0hzGOWVJ9h9bIl/05BXlEoJaSuuNu4sG8sPH0csFlY+f1bsCph5WLphZi+H
 dogehN2elys4SI/jpPSoeD5D8kcNRj28RM98yTsfMEDWYy5ltzEmffx0DzPWeDYg/o7Lno9gV6Y
 bcCg/E3Y0mo2Ndf4UxvZlYsCa5UbGR9pGqVpu3CD3Ao6jHq7
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
 drivers/gpu/drm/solomon/ssd130x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 8cbf5aa66e19..d256ad065f3e 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -640,7 +640,7 @@ static const struct drm_plane_funcs ssd130x_primary_plane_funcs = {
 static enum drm_mode_status ssd130x_crtc_helper_mode_valid(struct drm_crtc *crtc,
 							   const struct drm_display_mode *mode)
 {
-	struct ssd130x_device *ssd130x = drm_to_ssd130x(crtc->dev);
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(crtc->drm_dev);
 
 	if (mode->hdisplay != ssd130x->mode.hdisplay &&
 	    mode->vdisplay != ssd130x->mode.vdisplay)
-- 
2.39.2

