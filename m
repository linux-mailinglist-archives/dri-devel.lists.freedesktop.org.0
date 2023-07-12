Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D726575039E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB6A10E449;
	Wed, 12 Jul 2023 09:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F3610E3EC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:15 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRD-0001Nn-Oq; Wed, 12 Jul 2023 11:47:11 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRC-00Dr4v-OR; Wed, 12 Jul 2023 11:47:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRB-004GTM-Ef; Wed, 12 Jul 2023 11:47:09 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 23/52] drm/mgag200: Use struct drm_crtc::drm_dev
 instead of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:33 +0200
Message-Id: <20230712094702.1770121-24-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9818;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=V78xsTC6F3ZDzF/rybLbHVA9xN43/Vb+81HDtJIBrXc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZxsSIchz1I91sVzCDYvJFEjDk29YPUBcyRY
 DyNPnRtwsuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52cQAKCRCPgPtYfRL+
 TkTKB/0fvjfZlXuCZ6neRSEgnfGEGyKsz8ZxKK6d7U0Tx9ZgtiQyP2ZwgoYiIfWTeBs7imLnppI
 4JTxAcgSSXM3XIidPXk0Tldi+uYXSvYtTipUMkx27ztuqvty0YiBZdjWeR7GO3IX0gy13sB8+vH
 XznPJ0eRwHsDTNHdW5tlSqjlLq0M12bEvpFc/BAyW6RuK3aKNyJa2byBiLWQ4/QHSnHDpiOejSi
 hlQSFPZzFAsVtZgaHN/4e76pyBuk37nNO2fuTUpn50YydxXCpmapDq+2LjqU8Vb71MNmGacldU0
 JUAaFxzXGQpU7BNxZK/NjByB23g8MgeSqlBC3UmjSf/qHbft
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/mgag200/mgag200_g200.c   |  4 ++--
 drivers/gpu/drm/mgag200/mgag200_g200eh.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c |  4 ++--
 drivers/gpu/drm/mgag200/mgag200_g200ev.c |  4 ++--
 drivers/gpu/drm/mgag200/mgag200_g200se.c |  6 +++---
 drivers/gpu/drm/mgag200/mgag200_g200wb.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c   | 10 +++++-----
 7 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index bf5d7fe525a3..93cf3d3d0b6b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -69,7 +69,7 @@ static int mgag200_g200_pixpllc_atomic_check(struct drm_crtc *crtc, struct drm_a
 	static const int feed_div_min = 7;
 	static const int feed_div_max = 127;
 
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct mgag200_g200_device *g200 = to_mgag200_g200_device(dev);
 	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
 	struct mgag200_crtc_state *new_mgag200_crtc_state = to_mgag200_crtc_state(new_crtc_state);
@@ -139,7 +139,7 @@ static int mgag200_g200_pixpllc_atomic_check(struct drm_crtc *crtc, struct drm_a
 static void mgag200_g200_pixpllc_atomic_update(struct drm_crtc *crtc,
 					       struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index fad62453a91d..409f0c5a7d7a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -92,7 +92,7 @@ static int mgag200_g200eh_pixpllc_atomic_check(struct drm_crtc *crtc,
 void mgag200_g200eh_pixpllc_atomic_update(struct drm_crtc *crtc,
 					  struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index bce267e0f7de..c452debaada6 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -120,7 +120,7 @@ static int mgag200_g200er_pixpllc_atomic_check(struct drm_crtc *crtc,
 static void mgag200_g200er_pixpllc_atomic_update(struct drm_crtc *crtc,
 						 struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
@@ -183,7 +183,7 @@ static const struct drm_plane_funcs mgag200_g200er_primary_plane_funcs = {
 static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 						     struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct mga_device *mdev = to_mga_device(dev);
 	const struct mgag200_device_funcs *funcs = mdev->funcs;
 	struct drm_crtc_state *crtc_state = crtc->state;
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index ac957f42abe1..dca055633f91 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -99,7 +99,7 @@ static int mgag200_g200ev_pixpllc_atomic_check(struct drm_crtc *crtc,
 static void mgag200_g200ev_pixpllc_atomic_update(struct drm_crtc *crtc,
 						 struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
@@ -184,7 +184,7 @@ static const struct drm_plane_funcs mgag200_g200ev_primary_plane_funcs = {
 static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 						     struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct mga_device *mdev = to_mga_device(dev);
 	const struct mgag200_device_funcs *funcs = mdev->funcs;
 	struct drm_crtc_state *crtc_state = crtc->state;
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index bd6e573c9a1a..9db8c6547ea2 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -170,7 +170,7 @@ static int mgag200_g200se_00_pixpllc_atomic_check(struct drm_crtc *crtc,
 static void mgag200_g200se_00_pixpllc_atomic_update(struct drm_crtc *crtc,
 						    struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
@@ -271,7 +271,7 @@ static int mgag200_g200se_04_pixpllc_atomic_check(struct drm_crtc *crtc,
 static void mgag200_g200se_04_pixpllc_atomic_update(struct drm_crtc *crtc,
 						    struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
@@ -315,7 +315,7 @@ static const struct drm_plane_funcs mgag200_g200se_primary_plane_funcs = {
 static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 						     struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct mga_device *mdev = to_mga_device(dev);
 	const struct mgag200_device_funcs *funcs = mdev->funcs;
 	struct drm_crtc_state *crtc_state = crtc->state;
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index 9baa727ac6f9..9046abf70394 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -91,7 +91,7 @@ static int mgag200_g200wb_pixpllc_atomic_check(struct drm_crtc *crtc,
 void mgag200_g200wb_pixpllc_atomic_update(struct drm_crtc *crtc,
 					  struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index af3ce5a6a636..aeed98549d9d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -545,7 +545,7 @@ void mgag200_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 enum drm_mode_status mgag200_crtc_helper_mode_valid(struct drm_crtc *crtc,
 						    const struct drm_display_mode *mode)
 {
-	struct mga_device *mdev = to_mga_device(crtc->dev);
+	struct mga_device *mdev = to_mga_device(crtc->drm_dev);
 	const struct mgag200_device_info *info = mdev->info;
 
 	/*
@@ -574,7 +574,7 @@ enum drm_mode_status mgag200_crtc_helper_mode_valid(struct drm_crtc *crtc,
 
 int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *new_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct mga_device *mdev = to_mga_device(dev);
 	const struct mgag200_device_funcs *funcs = mdev->funcs;
 	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
@@ -610,7 +610,7 @@ void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_s
 {
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct mga_device *mdev = to_mga_device(dev);
 
 	if (crtc_state->enable && crtc_state->color_mgmt_changed) {
@@ -625,7 +625,7 @@ void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_s
 
 void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct mga_device *mdev = to_mga_device(dev);
 	const struct mgag200_device_funcs *funcs = mdev->funcs;
 	struct drm_crtc_state *crtc_state = crtc->state;
@@ -655,7 +655,7 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
 
 void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
 {
-	struct mga_device *mdev = to_mga_device(crtc->dev);
+	struct mga_device *mdev = to_mga_device(crtc->drm_dev);
 	const struct mgag200_device_funcs *funcs = mdev->funcs;
 
 	if (funcs->disable_vidrst)
-- 
2.39.2

