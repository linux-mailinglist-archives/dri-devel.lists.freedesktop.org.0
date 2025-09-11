Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC21B53331
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E799E10EB21;
	Thu, 11 Sep 2025 13:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nh/+PhE/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FC710EB21
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757596061;
 bh=XAVHFU0dy5ZIPqsFgH8qgD9tV+FcKbXvxkREMGiNl78=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nh/+PhE/ani/CkF1EY3xb/rA4Q+kQMIhTr5Xomg6QpaV5yez1GIdzROfBM2EoiMIh
 Ym6aVtoilPBcI1P80rS5geWRejfbLvYJSEuuAj3VwCDZRfXU2p/tAFe+Ik6zjMgO/G
 5Fen/pL2exbFibrMLoNp81OgssJyTsRfrFAd6CHaIePXTcB6VPu+XX0zNGkZ0tKH0o
 f1bWLSdTMwmyHV7O2MUbFDZoPj/kv5UnQNZIdBuaS4DTS9yuLqNfpqznj09YAdKS8G
 Yd7xmpsf6kpd30uK6SciZVhghiHaKn1cNy9NMhrrTIWrFL+sGVFzwuL/gO3tFyKHWR
 oZ1L8rkz6TK2g==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f05:840b:7800:3261:5c97:2de4:16d3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0360A17E0FFA;
 Thu, 11 Sep 2025 15:07:40 +0200 (CEST)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: wse@tuxedocomputers.com, andri@yngvason.is, sebastian.wick@redhat.com,
 mripard@kernel.org, daniel.stone@collabora.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch,
 harry.wentland@amd.com, christian.koenig@amd.com,
 derek.foreman@collabora.com
Subject: [PATCH 2/8] hdmi: Add HDMI_COLORSPACE_AUTO enum option
Date: Thu, 11 Sep 2025 16:07:33 +0300
Message-ID: <20250911130739.4936-3-marius.vlad@collabora.com>
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

Patch does not introduce any functional change but would help out when
introducing DRM_COLOR_FORMAT enum in a sub-sequent patch.

Auto will implictly fallthrough to RGB as that should be further
driver-defined.

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 3 +++
 drivers/gpu/drm/drm_connector.c                 | 1 +
 drivers/video/hdmi.c                            | 4 ++--
 include/linux/hdmi.h                            | 2 +-
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a561f124be99..f9aa922d25d3 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -417,6 +417,9 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 	}
 
 	switch (format) {
+	case HDMI_COLORSPACE_AUTO:
+		drm_dbg_kms(dev, "AUTO format. Fallback to RGB.\n");
+		fallthrough;
 	case HDMI_COLORSPACE_RGB:
 		drm_dbg_kms(dev, "RGB Format, checking the constraints.\n");
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 272d6254ea47..24edba01f2f0 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1424,6 +1424,7 @@ static const char * const output_format_str[] = {
 	[HDMI_COLORSPACE_YUV420]	= "YUV 4:2:0",
 	[HDMI_COLORSPACE_YUV422]	= "YUV 4:2:2",
 	[HDMI_COLORSPACE_YUV444]	= "YUV 4:4:4",
+	[HDMI_COLORSPACE_AUTO]		= "AUTO",
 };
 
 /*
diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
index 45b42f14a750..74fe925c69a2 100644
--- a/drivers/video/hdmi.c
+++ b/drivers/video/hdmi.c
@@ -1031,8 +1031,8 @@ static const char *hdmi_colorspace_get_name(enum hdmi_colorspace colorspace)
 		return "YCbCr 4:4:4";
 	case HDMI_COLORSPACE_YUV420:
 		return "YCbCr 4:2:0";
-	case HDMI_COLORSPACE_RESERVED4:
-		return "Reserved (4)";
+	case HDMI_COLORSPACE_AUTO:
+		return "Auto";
 	case HDMI_COLORSPACE_RESERVED5:
 		return "Reserved (5)";
 	case HDMI_COLORSPACE_RESERVED6:
diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
index 96bda41d9148..045402033763 100644
--- a/include/linux/hdmi.h
+++ b/include/linux/hdmi.h
@@ -82,7 +82,7 @@ enum hdmi_colorspace {
 	HDMI_COLORSPACE_YUV422,
 	HDMI_COLORSPACE_YUV444,
 	HDMI_COLORSPACE_YUV420,
-	HDMI_COLORSPACE_RESERVED4,
+	HDMI_COLORSPACE_AUTO,
 	HDMI_COLORSPACE_RESERVED5,
 	HDMI_COLORSPACE_RESERVED6,
 	HDMI_COLORSPACE_IDO_DEFINED,
-- 
2.47.2

