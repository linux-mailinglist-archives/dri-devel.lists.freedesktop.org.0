Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DBB7503BD
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DA210E4B9;
	Wed, 12 Jul 2023 09:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FB210E431
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:30 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRF-0001Qq-3v; Wed, 12 Jul 2023 11:47:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRD-00Dr5M-M0; Wed, 12 Jul 2023 11:47:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRC-004GTn-Ot; Wed, 12 Jul 2023 11:47:10 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 30/52] drm/qxl: Use struct drm_crtc::drm_dev instead of
 struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:40 +0200
Message-Id: <20230712094702.1770121-31-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=933;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ZTo3pP8bpMhUgL5nKPWC7N4shBvlErur4qyGJM66ZP8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZ5flC5wphyPxNkqKeFyz05jokqexWUsN+77
 gmAMBGjID2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52eQAKCRCPgPtYfRL+
 TuAwB/9OQfeBdi07Khcwn86p12vCG589f/HbOkDbrsdlSBj/lTxt3sshtoZTdZ8V2Gw4CyDLjkh
 GahRWvvyqbPnNFCvh7fDQUovamOQrVbj2RPIuPZYj2gUNk0QhIX35OWoPZ1PNuhZlRqTmh61E1G
 3XD3mBTfZkUN+JVXBvmYO/p1r9X2cfuzhcA3oeyIylEy+/cBF50bzfaey7zgLk21nOBxrG2XXCs
 u8HkJ//zw7obMhQCWmOzvxBl9/gH9xundZ32nw4oUHSs4no+89RswlKBxFKXIw2bOB3ty2TtcNJ
 h0I1h3+i70yjhZKudztCKC6APcwe/0krHGxw5SldokHzEinK
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
Cc: spice-devel@lists.freedesktop.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/qxl/qxl_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 6492a70e3c39..1b83e5d4a0d4 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -315,7 +315,7 @@ static void qxl_send_monitors_config(struct qxl_device *qdev)
 static void qxl_crtc_update_monitors_config(struct drm_crtc *crtc,
 					    const char *reason)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct qxl_device *qdev = to_qxl(dev);
 	struct qxl_crtc *qcrtc = to_qxl_crtc(crtc);
 	struct qxl_head head;
-- 
2.39.2

