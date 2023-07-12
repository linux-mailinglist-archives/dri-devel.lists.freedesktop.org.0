Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B645675038B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CDA10E421;
	Wed, 12 Jul 2023 09:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A62D10E3E3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRC-0001KA-68; Wed, 12 Jul 2023 11:47:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRB-00Dr4A-4g; Wed, 12 Jul 2023 11:47:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR9-004GSk-Jk; Wed, 12 Jul 2023 11:47:07 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Deepak Rawat <drawat.floss@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 14/52] drm/hyperv: Use struct drm_crtc::drm_dev instead
 of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:24 +0200
Message-Id: <20230712094702.1770121-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=n8D+hPGzMB31qzrMtXEXnlycC/L6O3Uvu5GK7hbM7rg=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZmvUGPKMQFSQvIPB30cnD0O27FA8vgcDi5S
 0SiXU8HsqeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52ZgAKCRCPgPtYfRL+
 TqF3B/45mRREbuWXUJPAOEf7EeMZ02stpwOrHtX0N2YzYl/CTYryWnVL/iix9mKvleYhL/fh64y
 FlCGLvO9O6DqfrgOBZbhwbKovNN78f5HoQit1/GfYm6uRQkLFwYSdcbvAujMWepL9NDP0sgdU1K
 2SSZ56xuePn5jKxf56vkR+yXnfoIU2d3zcXqMh529lkt/ad8J6vi4mlfRozMKjdNfPZgnhxf3+Y
 k/3HgH9ejeZYqiK0ZlDq++OZI4HY+NdMkG9GGGs6RL/B9DGilFMpKGw8by6OJY2MS4SCz8otuYi
 5JvLHWojMBt76KdubV+fm4aP+QVbWD42MjPyN6wlryEySIKm
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
Cc: linux-hyperv@vger.kernel.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index 6c6b57298797..07ccc3cdc515 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -102,7 +102,7 @@ static void hyperv_pipe_enable(struct drm_simple_display_pipe *pipe,
 			       struct drm_crtc_state *crtc_state,
 			       struct drm_plane_state *plane_state)
 {
-	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
+	struct hyperv_drm_device *hv = to_hv(pipe->crtc.drm_dev);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 
 	hyperv_hide_hw_ptr(hv->hdev);
@@ -117,7 +117,7 @@ static int hyperv_pipe_check(struct drm_simple_display_pipe *pipe,
 			     struct drm_plane_state *plane_state,
 			     struct drm_crtc_state *crtc_state)
 {
-	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
+	struct hyperv_drm_device *hv = to_hv(pipe->crtc.drm_dev);
 	struct drm_framebuffer *fb = plane_state->fb;
 
 	if (fb->format->format != DRM_FORMAT_XRGB8888)
@@ -135,7 +135,7 @@ static int hyperv_pipe_check(struct drm_simple_display_pipe *pipe,
 static void hyperv_pipe_update(struct drm_simple_display_pipe *pipe,
 			       struct drm_plane_state *old_state)
 {
-	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
+	struct hyperv_drm_device *hv = to_hv(pipe->crtc.drm_dev);
 	struct drm_plane_state *state = pipe->plane.state;
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_rect rect;
-- 
2.39.2

