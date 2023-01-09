Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC9F6628CE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 15:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A8010E439;
	Mon,  9 Jan 2023 14:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1806510E20D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 14:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OfJZdZE/V/ZvpMRh36U0jcNUuCeLwAP2JLdu4FaqZsM=; b=JHBNX7/vGX/O5LzLAHWKxyjD85
 zn/TvGUHh0lPLjc34lNvMR3GD6CdgpqSd40ppq7yjeENLS0lF3nUuPwTYBrlL8sD/hT1THDzMohWB
 j2QMfc+tnOwcVccvM373aYiw4mtuDQfhlo2jrn4yH6DT2j2tyOKZJSEoppBwMWF+1RMo4sDrBCgRB
 3Ydz2LG7B38W+m0HPPSrubVVVIY7Dzsgxj6LFAu/FG+lVXDmzLpRpKKYgLh9k2M+Iaz1gsDqLX7IB
 cjPdYetmgMkmLvFVcQhkHPTD1NiP49sSWzDiKFMH6bzQZkUib3Ieo3JJYHYrnAgFE8KAdPHDU8DHB
 7Ndp951A==;
Received: from [41.74.137.107] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEtNa-003TyM-Sh; Mon, 09 Jan 2023 15:44:03 +0100
From: Melissa Wen <mwen@igalia.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [RFC PATCH v2 06/18] drm/drm_color_mgmt: set first lut3d mode as
 default
Date: Mon,  9 Jan 2023 13:38:34 -0100
Message-Id: <20230109143846.1966301-7-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230109143846.1966301-1-mwen@igalia.com>
References: <20230109143846.1966301-1-mwen@igalia.com>
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
Cc: laurent.pinchart+renesas@ideasonboard.com,
 Shashank Sharma <shashank.sharma@amd.com>, alex.hung@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, seanpaul@chromium.org, kernel-dev@igalia.com,
 bhawanpreet.lakha@amd.com, nicholas.kazlauskas@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_color_mgmt.c | 18 ++++++++++++++++--
 include/drm/drm_color_mgmt.h     |  3 ++-
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 06503f693ecd..d6283f049881 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -280,18 +280,32 @@ EXPORT_SYMBOL(drm_crtc_create_lut3d_mode_property);
  * therefore optional.
  */
 void drm_crtc_enable_lut3d(struct drm_crtc *crtc,
-			   uint shaper_lut_size)
+			   uint shaper_lut_size,
+			   bool first_value_as_default)
 {
 	struct drm_device *dev = crtc->dev;
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_property_enum *prop;
+	uint init_value = 0;
 
 	if (!config->lut3d_mode_property)
 		return;
 
 	drm_object_attach_property(&crtc->base,
 				   config->lut3d_property, 0);
+
+	if (first_value_as_default) {
+		prop = list_first_entry_or_null(&config->lut3d_mode_property->enum_list,
+						typeof(*prop), head);
+		init_value = prop ? prop->value : 0;
+	}
+
 	drm_object_attach_property(&crtc->base,
-				   config->lut3d_mode_property, 0);
+				   config->lut3d_mode_property,
+				   init_value);
+
+	if (crtc->state && prop)
+		crtc->state->lut3d_mode = init_value;
 
 	if (!shaper_lut_size)
 		return;
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index db2026dc825e..d13e99e2e877 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -64,7 +64,8 @@ int drm_crtc_create_lut3d_mode_property(struct drm_crtc *crtc,
 					unsigned int num_modes);
 
 void drm_crtc_enable_lut3d(struct drm_crtc *crtc,
-			   uint shaper_lut_size);
+			   uint shaper_lut_size,
+			   bool first_value_as_default);
 
 int drm_mode_crtc_set_gamma_size(struct drm_crtc *crtc,
 				 int gamma_size);
-- 
2.35.1

