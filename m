Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1257503A5
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BBF10E465;
	Wed, 12 Jul 2023 09:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4226A10E3E6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:20 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRH-0001eT-Ek; Wed, 12 Jul 2023 11:47:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRG-00Dr6K-FC; Wed, 12 Jul 2023 11:47:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRF-004GUf-BJ; Wed, 12 Jul 2023 11:47:13 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 44/52] drm/udl: Use struct drm_crtc::drm_dev instead of
 struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:54 +0200
Message-Id: <20230712094702.1770121-45-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1338;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=MaLwZXgZpqfKtSM0hkiqvK6/AtrlTZv/Dt/NAM7S7w0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnaJYgoEQiBOTXFgDZ8f5qSklqgvI3uBJMcwO
 bzQXzlBihmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52iQAKCRCPgPtYfRL+
 Tlb6B/0bGicE2JX7XkY9jRrLBbFD8OP2xExO08GiwFJEJkDJVtZ52i8CLz5FREA3GuJ2iwiUa1f
 3ZKnZ/qxOREEsm42UhVPB8i33eC955cvDHA/x7XrIF8rICndF7BjBFZnU6dcsDp0znX1n3icFQs
 vmWy+G2YGJxNx7nxMPR/mi60aauvNFJFNxJ9gQxx3jEQJPSs0YBkm5mJGRANf15GkCcAv5Jhk25
 x0anQDgeIZt3RdfWDPbugIuj0uHSvFN7iUzxiEMYZ2dLtM2fbJRowN5oHajF6Ypw0L4guJLCIXM
 CoMJo4epIBax1HPrYJTbJrUPonuPa896lvOXM9WIh5o9h0PF
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
Cc: kernel@pengutronix.de, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/udl/udl_modeset.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index aa02fd2789c3..e8625fccad10 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -322,7 +322,7 @@ static int udl_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic
 
 static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct drm_display_mode *mode = &crtc_state->mode;
 	struct urb *urb;
@@ -356,7 +356,7 @@ static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atom
 
 static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct urb *urb;
 	char *buf;
 	int idx;
-- 
2.39.2

