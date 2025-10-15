Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EC2BDE277
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 13:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C098410E780;
	Wed, 15 Oct 2025 11:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dHoOForb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92E310E323
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 11:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760526050;
 bh=QlTZkXzpafJjt6c0OXEhFSe+UktsdFqlCszwG0tijBg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dHoOForb2/7UtzCcmSiwyr7oFnjskbHLHDmABhJvKVKmoG4Yhp1+UdP5BX5Vz+23z
 7rgxfGBkLnvj+pp/zS3h6MnbDoxoXMlhY249bSsUcdeZWPsQim0+MQNS+uTbMeYcBc
 //dnhXHI0C5mK8QMS5YRbQDtyExUcwdSCBTMqYoC4B1RXqX6Hz9edkyA/YqDzdaWnx
 4jmwNvxf7qzw+z+ct6PVtHPZ18BOTrWe6BuUGu2b35xGAoyCLU6ODnAZlJtwPpPXC4
 DaprkZRCPUciUEQCIZR/uARYgHNCpOk0a970CMTa7jHvFAo3f5KPXVV7rel67Yhe8W
 EW/3m9eCsLTDw==
Received: from reinforced.mynet (unknown
 [IPv6:2a01:4b00:be1d:c600:6089:8bab:34a0:d4c5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: daniels)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 04B9F17E3656;
 Wed, 15 Oct 2025 13:00:49 +0200 (CEST)
From: Daniel Stone <daniels@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: andy.yan@rock-chips.com, hjc@rock-chips.com, heiko@sntech.de,
 cristian.ciocaltea@collabora.com
Subject: [PATCH 13/13] drm/rockchip: Simplify format_mod_supported
Date: Wed, 15 Oct 2025 12:00:42 +0100
Message-ID: <20251015110042.41273-14-daniels@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015110042.41273-1-daniels@collabora.com>
References: <20251015110042.41273-1-daniels@collabora.com>
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

Make it a little less convoluted, and just directly check if the
combination of plane + format + modifier is supported.

Signed-off-by: Daniel Stone <daniels@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 56 ++++++++------------
 1 file changed, 22 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index e2a18c303357..fb3e10172942 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -366,59 +366,47 @@ static bool is_yuv_output(u32 bus_format)
 	}
 }
 
-static bool rockchip_afbc(struct drm_plane *plane, u64 modifier)
-{
-	int i;
-
-	if (modifier == DRM_FORMAT_MOD_LINEAR)
-		return false;
-
-	for (i = 0 ; i < plane->modifier_count; i++)
-		if (plane->modifiers[i] == modifier)
-			return true;
-
-	return false;
-}
-
 static bool rockchip_vop2_mod_supported(struct drm_plane *plane, u32 format,
 					u64 modifier)
 {
 	struct vop2_win *win = to_vop2_win(plane);
 	struct vop2 *vop2 = win->vop2;
+	int i;
 
+	/* No support for implicit modifiers */
 	if (modifier == DRM_FORMAT_MOD_INVALID)
 		return false;
 
-	if (vop2->version == VOP_VERSION_RK3568) {
-		if (vop2_cluster_window(win)) {
-			if (modifier == DRM_FORMAT_MOD_LINEAR) {
-				drm_dbg_kms(vop2->drm,
-					    "Cluster window only supports format with afbc\n");
-				return false;
-			}
-		}
+	/* The cluster window on 3568 is AFBC-only */
+	if (vop2->version == VOP_VERSION_RK3568 && vop2_cluster_window(win) &&
+	    !drm_is_afbc(modifier)) {
+		drm_dbg_kms(vop2->drm,
+			    "Cluster window only supports format with afbc\n");
+		return false;
 	}
 
-	if (format == DRM_FORMAT_XRGB2101010 || format == DRM_FORMAT_XBGR2101010) {
-		if (vop2->version == VOP_VERSION_RK3588) {
-			if (!rockchip_afbc(plane, modifier)) {
-				drm_dbg_kms(vop2->drm, "Only support 32 bpp format with afbc\n");
-				return false;
-			}
-		}
+	/* 10bpc formats on 3588 are AFBC-only */
+	if (vop2->version == VOP_VERSION_RK3588 && !drm_is_afbc(modifier) &&
+	    (format == DRM_FORMAT_XRGB2101010 || format == DRM_FORMAT_XBGR2101010)) {
+		drm_dbg_kms(vop2->drm, "Only support 10bpc format with afbc\n");
+		return false;
 	}
 
+	/* Linear is otherwise supported everywhere */
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		return true;
 
-	if (!rockchip_afbc(plane, modifier)) {
-		drm_dbg_kms(vop2->drm, "Unsupported format modifier 0x%llx\n",
-			    modifier);
-
+	/* Not all format+modifier combinations are allowable */
+	if (vop2_convert_afbc_format(format) == VOP2_AFBC_FMT_INVALID)
 		return false;
+
+	/* Different windows have different format/modifier support */
+	for (i = 0; i < plane->modifier_count; i++) {
+		if (plane->modifiers[i] == modifier)
+			return true;
 	}
 
-	return vop2_convert_afbc_format(format) >= 0;
+	return false;
 }
 
 /*
-- 
2.51.0

