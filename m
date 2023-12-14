Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D489B813671
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 17:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F8B10E1AA;
	Thu, 14 Dec 2023 16:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFED810E1AA
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 16:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702571998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zCZ2sYMYoakAhH7rbcWBFxYoyyTbLnD1Gd9pCzeJjaM=;
 b=I0PKMzBnS5dx1pBpHD2TZc1/IBw9QQh1pbU16KhLE7ATBIbxmnVeWdVmNlzuzGjXs/FgxU
 W5jSfTWViEA+BM/Rmx7iTFaEKGmQzg2q/FVz4WkxtldfjSJ8TTC6cuTPAzR2zjvu6JeTi3
 ++WsMhs7JaBxQeTFD0b2VkkywrYr50E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-AsrnAyi_OCagecAFAHCVZw-1; Thu, 14 Dec 2023 11:39:55 -0500
X-MC-Unique: AsrnAyi_OCagecAFAHCVZw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 317218870EC;
 Thu, 14 Dec 2023 16:39:54 +0000 (UTC)
Received: from hydra.bos2.lab (unknown [10.39.192.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC2E61121306;
 Thu, 14 Dec 2023 16:39:52 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 daniel@ffwll.ch, javierm@redhat.com
Subject: [PATCH] drm/mgag200: Fix gamma lut not initialized for G200ER, G200EV,
 G200SE
Date: Thu, 14 Dec 2023 17:38:06 +0100
Message-ID: <20231214163849.359691-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
Cc: Roger Sewell <roger.sewell@cantab.net>,
 Jocelyn Falempe <jfalempe@redhat.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When mgag200 switched from simple KMS to regular atomic helpers,
the initialization of the gamma settings was lost.
This leads to a black screen, if the bios/uefi doesn't use the same
pixel color depth.
This has been fixed with commit ad81e23426a6 ("drm/mgag200: Fix gamma
lut not initialized.") for most G200, but G200ER, G200EV, G200SE use
their own version of crtc_helper_atomic_enable() and need to be fixed
too.

Fixes: 1baf9127c482 ("drm/mgag200: Replace simple-KMS with regular atomic helpers")
Cc: <stable@vger.kernel.org> #v6.1+
Reported-by: Roger Sewell <roger.sewell@cantab.net>
Suggested-by: Roger Sewell <roger.sewell@cantab.net>
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h    |  4 ++++
 drivers/gpu/drm/mgag200/mgag200_g200er.c |  2 ++
 drivers/gpu/drm/mgag200/mgag200_g200ev.c |  2 ++
 drivers/gpu/drm/mgag200/mgag200_g200se.c |  2 ++
 drivers/gpu/drm/mgag200/mgag200_mode.c   | 26 ++++++++++++++----------
 5 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 57c7edcab602..ed90a92b5fcd 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -392,6 +392,10 @@ void mgag200_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 	.destroy = drm_plane_cleanup, \
 	DRM_GEM_SHADOW_PLANE_FUNCS
 
+void mgag200_crtc_set_gamma(struct mga_device *mdev,
+			    const struct drm_format_info *format,
+			    struct drm_property_blob *gamma_lut);
+
 enum drm_mode_status mgag200_crtc_helper_mode_valid(struct drm_crtc *crtc,
 						    const struct drm_display_mode *mode);
 int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *new_state);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index bce267e0f7de..38815cb94c61 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -202,6 +202,8 @@ static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	mgag200_g200er_reset_tagfifo(mdev);
 
+	mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut);
+
 	mgag200_enable_display(mdev);
 
 	if (funcs->enable_vidrst)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index ac957f42abe1..e698a3a499bf 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -203,6 +203,8 @@ static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	mgag200_g200ev_set_hiprilvl(mdev);
 
+	mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut);
+
 	mgag200_enable_display(mdev);
 
 	if (funcs->enable_vidrst)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index bd6e573c9a1a..7e4ea0046a6b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -334,6 +334,8 @@ static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	mgag200_g200se_set_hiprilvl(mdev, adjusted_mode, format);
 
+	mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut);
+
 	mgag200_enable_display(mdev);
 
 	if (funcs->enable_vidrst)
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index af3ce5a6a636..d2a04b317232 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -65,9 +65,9 @@ static void mgag200_crtc_set_gamma_linear(struct mga_device *mdev,
 	}
 }
 
-static void mgag200_crtc_set_gamma(struct mga_device *mdev,
-				   const struct drm_format_info *format,
-				   struct drm_color_lut *lut)
+static void mgag200_crtc_set_gamma_table(struct mga_device *mdev,
+					 const struct drm_format_info *format,
+					 struct drm_color_lut *lut)
 {
 	int i;
 
@@ -103,6 +103,16 @@ static void mgag200_crtc_set_gamma(struct mga_device *mdev,
 	}
 }
 
+void mgag200_crtc_set_gamma(struct mga_device *mdev,
+			    const struct drm_format_info *format,
+			    struct drm_property_blob *gamma_lut)
+{
+	if (gamma_lut)
+		mgag200_crtc_set_gamma_table(mdev, format, gamma_lut->data);
+	else
+		mgag200_crtc_set_gamma_linear(mdev, format);
+}
+
 static inline void mga_wait_vsync(struct mga_device *mdev)
 {
 	unsigned long timeout = jiffies + HZ/10;
@@ -616,10 +626,7 @@ void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_s
 	if (crtc_state->enable && crtc_state->color_mgmt_changed) {
 		const struct drm_format_info *format = mgag200_crtc_state->format;
 
-		if (crtc_state->gamma_lut)
-			mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut->data);
-		else
-			mgag200_crtc_set_gamma_linear(mdev, format);
+		mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut);
 	}
 }
 
@@ -642,10 +649,7 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
 	if (funcs->pixpllc_atomic_update)
 		funcs->pixpllc_atomic_update(crtc, old_state);
 
-	if (crtc_state->gamma_lut)
-		mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut->data);
-	else
-		mgag200_crtc_set_gamma_linear(mdev, format);
+	mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut);
 
 	mgag200_enable_display(mdev);
 

base-commit: 6c9dbee84cd005bed5f9d07b3a2797ae6414b435
-- 
2.43.0

