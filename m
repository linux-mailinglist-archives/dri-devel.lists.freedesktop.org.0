Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5EC75039A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A63B10E44B;
	Wed, 12 Jul 2023 09:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF3610E3F5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:17 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRF-0001UY-R8; Wed, 12 Jul 2023 11:47:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRE-00Dr5b-C0; Wed, 12 Jul 2023 11:47:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRC-004GTh-Eg; Wed, 12 Jul 2023 11:47:10 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 28/52] drm/panel-ili9341: Use struct drm_crtc::drm_dev
 instead of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:38 +0200
Message-Id: <20230712094702.1770121-29-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=K8IrThbMZR5BtBGnJE/FVq7qMKrsAZfL8oTC26P/EdA=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZ2zO1LiRL15jxPF4GMUJLlHsWRp8W76Q/Kx
 Op07I6gUvSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52dgAKCRCPgPtYfRL+
 TnGhCACsa5e9NqOI7bGYOdnUhk/2E9YSnax89FP186C7jOiZSpGpW8uN39QMqg9yYJuQ6y8HHMK
 qw/Lh0uO4E1S5IfxfEQ34lgQ9wFqMkXpO/pP+/9NriQx0W+waES3qA8q9YEvuV2ESTen0TvmnWJ
 B0SQt+m5t92aLuE9dYETenNTKZ/EfPABf1k2E2pq4w6zl38+uRC99ObZwM66mFfHoVR5fFpV/1I
 rCBwIc/ZBVYQWzhccQkBPzUIKz4cC4a7UWxcRmDZjsrH0zcIgipKEpKawlJA8BCe0BAjzg4NdVn
 jNx+2g3qsLXQ6tRDOB0Nkek6P7iOmqB+xl5Ie2VaygOcLefQ
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
Cc: Sam Ravnborg <sam@ravnborg.org>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index 3fdf884b3257..66ef305f5ef8 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -489,12 +489,12 @@ static void ili9341_dbi_enable(struct drm_simple_display_pipe *pipe,
 			       struct drm_crtc_state *crtc_state,
 			       struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm_dev);
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	u8 addr_mode;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm_dev, &idx))
 		return;
 
 	ret = mipi_dbi_poweron_conditional_reset(dbidev);
-- 
2.39.2

