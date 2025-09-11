Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 032F0B53332
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715AA10EB28;
	Thu, 11 Sep 2025 13:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ic2OTjbo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7C710EB21
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757596062;
 bh=jR1WGEKQE1BaGY/t9nQLyfhraZY7AUy9F82FlOe0clM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ic2OTjboOTJBbnFi5ifBaXLoBiIOcbjMe3OOkH09ZstJbZAadJtr05rORKgKMi1bC
 9KMIh1sVSomxoHPjNIk+vsiQ4A30f8xinqu0OdKfi10JhPRokli91gz9ZkT7EACWhq
 jlQ3hZbtBRpSqWTzvgEdc3rlyIC7cgqVWmPIv++GBp5FAFoGza7Z0BubW3C89kK3Hs
 9+pp8h5pBMxOml/bgMNm8p0i4uxebCt89evx8nYCyBOzMiftKixif3aauWRhWftg8F
 LynxRVRR8JrDfFeBtGJXmXxGdQ4C76cs/RHdXSrrLo3513j7FaRguKxWYsLXLIRYHy
 zVxL3TXiK2JJg==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f05:840b:7800:3261:5c97:2de4:16d3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0191517E1091;
 Thu, 11 Sep 2025 15:07:41 +0200 (CEST)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: wse@tuxedocomputers.com, andri@yngvason.is, sebastian.wick@redhat.com,
 mripard@kernel.org, daniel.stone@collabora.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch,
 harry.wentland@amd.com, christian.koenig@amd.com,
 derek.foreman@collabora.com
Subject: [PATCH 4/8] drm: Add enum conversion from/to HDMI_COLORSPACE to
 DRM_COLOR_FORMAT
Date: Thu, 11 Sep 2025 16:07:35 +0300
Message-ID: <20250911130739.4936-5-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250911130739.4936-1-marius.vlad@collabora.com>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
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

This would please the compiler to have a enum transformation from one to
another even though the values are the same. It should also make things
obvious that we use different enums.

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 .../gpu/drm/display/drm_hdmi_state_helper.c    |  4 +++-
 drivers/gpu/drm/drm_connector.c                | 18 ++++++++++++++++++
 include/drm/drm_connector.h                    |  3 +++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index f9aa922d25d3..dc2f32651cb9 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -653,9 +653,11 @@ hdmi_compute_config(const struct drm_connector *connector,
 				       conn_state->max_bpc,
 				       8, connector->max_bpc);
 	int ret;
+	enum hdmi_colorspace hdmi_colorspace =
+		color_format_to_hdmi_colorspace(conn_state->color_format);
 
 	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
-				      HDMI_COLORSPACE_RGB);
+				      hdmi_colorspace);
 	if (ret) {
 		if (connector->ycbcr_420_allowed) {
 			ret = hdmi_compute_format_bpc(connector, conn_state,
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 96e95047248e..c77d770c18c7 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1384,6 +1384,24 @@ drm_color_format_enum_to_color_format(enum drm_color_format_enum fmt_enum)
 	}
 }
 
+enum hdmi_colorspace
+color_format_to_hdmi_colorspace(enum drm_color_format fmt)
+{
+	switch (fmt) {
+	default:
+	case DRM_COLOR_FORMAT_AUTO:
+		return HDMI_COLORSPACE_AUTO;
+	case DRM_COLOR_FORMAT_RGB444:
+		return HDMI_COLORSPACE_RGB;
+	case DRM_COLOR_FORMAT_YCBCR444:
+		return HDMI_COLORSPACE_YUV444;
+	case DRM_COLOR_FORMAT_YCBCR422:
+		return HDMI_COLORSPACE_YUV422;
+	case DRM_COLOR_FORMAT_YCBCR420:
+		return HDMI_COLORSPACE_YUV420;
+	}
+}
+
 /**
  * drm_get_color_format_name - return a string for color format
  * @colorspace: color format to compute name of
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 24d760e2fa8f..844d7a495bed 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2586,6 +2586,9 @@ drm_color_format_to_color_format_enum(enum drm_color_format fmt);
 u32
 drm_color_format_enum_to_color_format(enum drm_color_format_enum fmt_enum);
 
+enum hdmi_colorspace
+color_format_to_hdmi_colorspace(enum drm_color_format fmt);
+
 /**
  * drm_for_each_connector_iter - connector_list iterator macro
  * @connector: &struct drm_connector pointer used as cursor
-- 
2.47.2

