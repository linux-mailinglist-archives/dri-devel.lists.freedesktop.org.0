Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9355F750386
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C52310E3E4;
	Wed, 12 Jul 2023 09:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2353910E3E3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:12 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRA-0001Gh-Hz; Wed, 12 Jul 2023 11:47:08 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR9-00Dr3d-LB; Wed, 12 Jul 2023 11:47:07 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR8-004GSM-D6; Wed, 12 Jul 2023 11:47:06 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 07/52] drm/ast: Use struct drm_crtc::drm_dev instead of
 struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:17 +0200
Message-Id: <20230712094702.1770121-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5393;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=CvNwCKfKNj9KgIcgEu807xqB5JrzeoZeESyd9/d+w8w=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZeWW8P22v+8K0QPrExv8Ni+X4kIu4ySyNN8
 QCEWgnnqniJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52XgAKCRCPgPtYfRL+
 TkQEB/4ikgEeHimUo6+HMdUuwuBLsuzpxHx99MhLItVVwCFl9mliY68NTpuqSefkagLW9qMJUAA
 j9iMAQtBgIz/UJPG5TychksTdDMmdTFC5v5gRamtC0wbpj1AMrN42I1udLMKg7I6Iq8X+AvNdnM
 aLHxxfbAaS3gI/dZRMOst1nneywoo30edsUFXjVsxZovjxQGf7QwY8NxN+lu4YrigC/0kExcEvZ
 /69ktOdeJcLHJKQ6hSqf5Y4l7b9+xjZAzK0tjpzaOJ2zfa5vtft/VKmJ2Ws3S+eidEU6+neMNGv
 XP0FmWMmODKCb27bShbU6AiJESrnhpq32O77bcdmBq5/FmQs
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
 drivers/gpu/drm/ast/ast_dp.c   |  2 +-
 drivers/gpu/drm/ast/ast_mode.c | 26 +++++++++++++-------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 6dc1a09504e1..3438fcbbe1c2 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -187,7 +187,7 @@ void ast_dp_set_on_off(struct drm_device *dev, bool on)
 
 void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode)
 {
-	struct ast_device *ast = to_ast_device(crtc->dev);
+	struct ast_device *ast = to_ast_device(crtc->drm_dev);
 
 	u32 ulRefreshRateIndex;
 	u8 ModeIdx;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index b3c670af6ef2..f685c2e5bb7f 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1007,7 +1007,7 @@ static int ast_cursor_plane_init(struct ast_device *ast)
 
 static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
-	struct ast_device *ast = to_ast_device(crtc->dev);
+	struct ast_device *ast = to_ast_device(crtc->drm_dev);
 	u8 ch = AST_DPMS_VSYNC_OFF | AST_DPMS_HSYNC_OFF;
 	struct ast_crtc_state *ast_state;
 	const struct drm_format_info *format;
@@ -1021,12 +1021,12 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT,  0x01, 0xdf, 0);
 		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0xfc, 0);
 		if (ast->tx_chip_types & AST_TX_DP501_BIT)
-			ast_set_dp501_video_output(crtc->dev, 1);
+			ast_set_dp501_video_output(crtc->drm_dev, 1);
 
 		if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
-			ast_dp_power_on_off(crtc->dev, AST_DP_POWER_ON);
+			ast_dp_power_on_off(crtc->drm_dev, AST_DP_POWER_ON);
 			ast_wait_for_vretrace(ast);
-			ast_dp_set_on_off(crtc->dev, 1);
+			ast_dp_set_on_off(crtc->drm_dev, 1);
 		}
 
 		ast_state = to_ast_crtc_state(crtc->state);
@@ -1048,11 +1048,11 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 	case DRM_MODE_DPMS_OFF:
 		ch = mode;
 		if (ast->tx_chip_types & AST_TX_DP501_BIT)
-			ast_set_dp501_video_output(crtc->dev, 0);
+			ast_set_dp501_video_output(crtc->drm_dev, 0);
 
 		if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
-			ast_dp_set_on_off(crtc->dev, 0);
-			ast_dp_power_on_off(crtc->dev, AST_DP_POWER_OFF);
+			ast_dp_set_on_off(crtc->drm_dev, 0);
+			ast_dp_power_on_off(crtc->drm_dev, AST_DP_POWER_OFF);
 		}
 
 		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT,  0x01, 0xdf, 0x20);
@@ -1064,7 +1064,7 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 static enum drm_mode_status
 ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *mode)
 {
-	struct ast_device *ast = to_ast_device(crtc->dev);
+	struct ast_device *ast = to_ast_device(crtc->drm_dev);
 	enum drm_mode_status status;
 	uint32_t jtemp;
 
@@ -1138,7 +1138,7 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
 	struct ast_crtc_state *old_ast_crtc_state = to_ast_crtc_state(old_crtc_state);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct ast_crtc_state *ast_state;
 	const struct drm_format_info *format;
 	bool succ;
@@ -1188,7 +1188,7 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct ast_device *ast = to_ast_device(dev);
 	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
 	struct ast_vbios_mode_info *vbios_mode_info = &ast_crtc_state->vbios_mode_info;
@@ -1213,7 +1213,7 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 
 static void ast_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct ast_device *ast = to_ast_device(dev);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
@@ -1235,7 +1235,7 @@ static void ast_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atom
 static void ast_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct ast_device *ast = to_ast_device(dev);
 
 	ast_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
@@ -1285,7 +1285,7 @@ static struct drm_crtc_state *
 ast_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
 {
 	struct ast_crtc_state *new_ast_state, *ast_state;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 
 	if (drm_WARN_ON(dev, !crtc->state))
 		return NULL;
-- 
2.39.2

