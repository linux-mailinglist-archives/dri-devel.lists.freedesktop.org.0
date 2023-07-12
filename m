Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B11775038A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B067310E3F4;
	Wed, 12 Jul 2023 09:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBF810E3DE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:12 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRB-0001Gs-Ae; Wed, 12 Jul 2023 11:47:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRA-00Dr3n-7r; Wed, 12 Jul 2023 11:47:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR9-004GSd-7p; Wed, 12 Jul 2023 11:47:07 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 12/52] drm/gud: Use struct drm_crtc::drm_dev instead of
 struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:22 +0200
Message-Id: <20230712094702.1770121-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1918;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=EqP9Y9MHocBa4R+I/ey1cXyjOQiT/GQhZeZPAZRYZrU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZkN6e5se0hFB7dbTpq4uTsECz36naVZ7rP6
 uXkZSnQroiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52ZAAKCRCPgPtYfRL+
 TofjB/0bEKuCp3vzqle/xypd3sM77GFz2Q3Hr4O24Z8dWx86tAKIa1VnOEXqP1qtYpvXuXh3fkA
 VuB5harNDryylz3F0HytWG9N5YNof714yviY+FdL01Q/TUsh2W4IDboLHEkLsxGMjAGSPGvBb36
 hUbYaK1eDJ1tBIU8n78mloeDbFGz4fDlm9ggWJnkuEAbeowd3tPAj5voMgdp0J1usJJ0F5dzsYT
 kCs12JI/LQo/YsJ2SeefCK9diot4uRPD+VF6AAhrDuWdydB7pthWjENWszKM6HqNY6k2P/ua5W3
 rz2wmMWaeOetxNfSJOmfPd4sz3TktXUZsXD63l5YEzF3Kmas
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
 drivers/gpu/drm/gud/gud_pipe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index dc16a92625d4..98b27a736e86 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -444,7 +444,7 @@ int gud_pipe_check(struct drm_simple_display_pipe *pipe,
 		   struct drm_plane_state *new_plane_state,
 		   struct drm_crtc_state *new_crtc_state)
 {
-	struct gud_device *gdrm = to_gud_device(pipe->crtc.dev);
+	struct gud_device *gdrm = to_gud_device(pipe->crtc.drm_dev);
 	struct drm_plane_state *old_plane_state = pipe->plane.state;
 	const struct drm_display_mode *mode = &new_crtc_state->mode;
 	struct drm_atomic_state *state = new_plane_state->state;
@@ -489,7 +489,7 @@ int gud_pipe_check(struct drm_simple_display_pipe *pipe,
 	if (!connector_state) {
 		struct drm_connector_list_iter conn_iter;
 
-		drm_connector_list_iter_begin(pipe->crtc.dev, &conn_iter);
+		drm_connector_list_iter_begin(pipe->crtc.drm_dev, &conn_iter);
 		drm_for_each_connector_iter(connector, &conn_iter) {
 			if (connector->state->crtc) {
 				connector_state = connector->state;
@@ -559,7 +559,7 @@ int gud_pipe_check(struct drm_simple_display_pipe *pipe,
 void gud_pipe_update(struct drm_simple_display_pipe *pipe,
 		     struct drm_plane_state *old_state)
 {
-	struct drm_device *drm = pipe->crtc.dev;
+	struct drm_device *drm = pipe->crtc.drm_dev;
 	struct gud_device *gdrm = to_gud_device(drm);
 	struct drm_plane_state *state = pipe->plane.state;
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
-- 
2.39.2

