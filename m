Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 667639B0FE5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 22:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA3110E0F8;
	Fri, 25 Oct 2024 20:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="P/ecnuGo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F2910E0F8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 20:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=/N2iCTYSr8UYoHJzGbHTr136+4N/JHiIfuSACMG1vRI=; b=P/ecnuGodOh9vPd9
 tr8s75qTNFz8XUL8Vkx6ZtQGXyRcn9gzp4IxCXxFxB9LzGxEZwN9yPGqDafkdfDo5DPx4eip21eiJ
 s8bry+A6gn6/8V9JGrUsP1jxV9pv1IlaKZ52s9lYX6dblxMT4FRk/TYMw1H6jQOVilHGDXpcJfNtB
 YFbs014tYyAQ4GH0xw91EZOPEpmiQbF3jChjDtd66X+GO2+xkIL8aYorOPVr4pVk9okDliB6nFcs8
 xmzxnnWTuc8Qo+DpnAAs8IqVXixxWlIZ2oGLV0PwioM2VhIAeywnhXyjjkFmUYe1SJNZZHnF4k/xL
 gu/rBg5q3CCAHVIxmw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1t4R5d-00DbxR-2K;
 Fri, 25 Oct 2024 20:39:21 +0000
From: linux@treblig.org
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm: encoder_slave: Remove unused encoder functions
Date: Fri, 25 Oct 2024 21:39:20 +0100
Message-ID: <20241025203920.244116-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

drm_i2c_encoder_commit(), drm_i2c_encoder_mode_set() and
drm_i2c_encoder_prepare() have been unused since 2016's
commit 7bc61cc5df80 ("drm/arcpgu: Accommodate adv7511 switch to DRM
bridge").

Remove them.
That change makes drm_i2c_encoder_dpms() unused.
Remove it.

Remove the comments about those functions wrapping a couple of
pointers in drm_encoder_slave_funcs.  I can see sil164, ch7006, and nv17
set those fields, and I can see some nouveau code that calls them
directly; so i don't think we can remove the fields.
(Although it's not clear to me if the sil164 or ch7006 code
can ever get called).

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/drm_encoder_slave.c | 26 --------------------------
 include/drm/drm_encoder_slave.h     | 11 ++---------
 2 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/drm_encoder_slave.c b/drivers/gpu/drm/drm_encoder_slave.c
index e464429d32df..0c994a4ef9ae 100644
--- a/drivers/gpu/drm/drm_encoder_slave.c
+++ b/drivers/gpu/drm/drm_encoder_slave.c
@@ -125,12 +125,6 @@ get_slave_funcs(struct drm_encoder *enc)
 	return to_encoder_slave(enc)->slave_funcs;
 }
 
-void drm_i2c_encoder_dpms(struct drm_encoder *encoder, int mode)
-{
-	get_slave_funcs(encoder)->dpms(encoder, mode);
-}
-EXPORT_SYMBOL(drm_i2c_encoder_dpms);
-
 bool drm_i2c_encoder_mode_fixup(struct drm_encoder *encoder,
 		const struct drm_display_mode *mode,
 		struct drm_display_mode *adjusted_mode)
@@ -142,26 +136,6 @@ bool drm_i2c_encoder_mode_fixup(struct drm_encoder *encoder,
 }
 EXPORT_SYMBOL(drm_i2c_encoder_mode_fixup);
 
-void drm_i2c_encoder_prepare(struct drm_encoder *encoder)
-{
-	drm_i2c_encoder_dpms(encoder, DRM_MODE_DPMS_OFF);
-}
-EXPORT_SYMBOL(drm_i2c_encoder_prepare);
-
-void drm_i2c_encoder_commit(struct drm_encoder *encoder)
-{
-	drm_i2c_encoder_dpms(encoder, DRM_MODE_DPMS_ON);
-}
-EXPORT_SYMBOL(drm_i2c_encoder_commit);
-
-void drm_i2c_encoder_mode_set(struct drm_encoder *encoder,
-		struct drm_display_mode *mode,
-		struct drm_display_mode *adjusted_mode)
-{
-	get_slave_funcs(encoder)->mode_set(encoder, mode, adjusted_mode);
-}
-EXPORT_SYMBOL(drm_i2c_encoder_mode_set);
-
 enum drm_connector_status drm_i2c_encoder_detect(struct drm_encoder *encoder,
 	    struct drm_connector *connector)
 {
diff --git a/include/drm/drm_encoder_slave.h b/include/drm/drm_encoder_slave.h
index 49172166a164..3089db10b6fd 100644
--- a/include/drm/drm_encoder_slave.h
+++ b/include/drm/drm_encoder_slave.h
@@ -58,8 +58,7 @@ struct drm_encoder_slave_funcs {
 	void (*destroy)(struct drm_encoder *encoder);
 
 	/**
-	 * @dpms: Analogous to &drm_encoder_helper_funcs @dpms callback. Wrapped
-	 * by drm_i2c_encoder_dpms().
+	 * @dpms: Analogous to &drm_encoder_helper_funcs @dpms callback.
 	 */
 	void (*dpms)(struct drm_encoder *encoder, int mode);
 
@@ -88,7 +87,7 @@ struct drm_encoder_slave_funcs {
 			  struct drm_display_mode *mode);
 	/**
 	 * @mode_set: Analogous to &drm_encoder_helper_funcs @mode_set
-	 * callback. Wrapped by drm_i2c_encoder_mode_set().
+	 * callback.
 	 */
 	void (*mode_set)(struct drm_encoder *encoder,
 			 struct drm_display_mode *mode,
@@ -223,15 +222,9 @@ void drm_i2c_encoder_destroy(struct drm_encoder *encoder);
  * Wrapper fxns which can be plugged in to drm_encoder_helper_funcs:
  */
 
-void drm_i2c_encoder_dpms(struct drm_encoder *encoder, int mode);
 bool drm_i2c_encoder_mode_fixup(struct drm_encoder *encoder,
 		const struct drm_display_mode *mode,
 		struct drm_display_mode *adjusted_mode);
-void drm_i2c_encoder_prepare(struct drm_encoder *encoder);
-void drm_i2c_encoder_commit(struct drm_encoder *encoder);
-void drm_i2c_encoder_mode_set(struct drm_encoder *encoder,
-		struct drm_display_mode *mode,
-		struct drm_display_mode *adjusted_mode);
 enum drm_connector_status drm_i2c_encoder_detect(struct drm_encoder *encoder,
 	    struct drm_connector *connector);
 void drm_i2c_encoder_save(struct drm_encoder *encoder);
-- 
2.47.0

