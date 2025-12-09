Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2475CCAFBB9
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 12:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5158B10E51A;
	Tue,  9 Dec 2025 11:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="dkjT+MfY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187E210E519
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 11:15:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765278922; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GPcL+MjKcBMHlrIKVNKofQP1mh/utPQFrrfz9+8DwsC2UJFE+hsbaLmAgaTfS6sqky3NrQ1Stmbg4Q8IQaXfnk5qXgzRFB7RqYOT5f649U6K28GHEot2NL0m9zwqV6Qk+uA2f8SNdIF7tjT+nWfUq1S4omINI6VuOtGfnP/JcuE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765278922;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=wBZjRDp57sjQw7FDNiRJSgPgPYjOshswlUZYljLB89Y=; 
 b=dlOKeZJ3/C615bZ7DhWyEdczJV/ALrjOsZK0ofeoILHEuBCcKc0d4v01aSWF1fTlLUgH8OyiSyqhqgTUHDDL7wXQVUsyYDwWpKdZzrnIVyF4HAU6iqe9iNfrCe1xM2NcQ7EOYBuoHhof/JetJ3N3yeJMd6/NFW32aGuW50i0iB4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765278922; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=wBZjRDp57sjQw7FDNiRJSgPgPYjOshswlUZYljLB89Y=;
 b=dkjT+MfYaywsF2ZQIdvacIxNP9ZrqeP2cQY6kqzkrTCysWeATySEAXYq/EUlRhi4
 ZG+Wb6Xdp4S7vwk9znMV9TwQ4kXFhSohRTGg+ZR6ypB++8p4/PQ0YZlTFOKc3oSjKy7
 b1w+DnYgVWp6K0LrDzaz/opFVFcT76yrnC825FvQ=
Received: by mx.zohomail.com with SMTPS id 1765278921243166.8176139031351;
 Tue, 9 Dec 2025 03:15:21 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 09 Dec 2025 12:14:21 +0100
Subject: [PATCH v3 8/8] drm/rockchip: vop2: Simplify format_mod_supported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-vop2-atomic-fixups-v3-8-07c48f0f1f0d@collabora.com>
References: <20251209-vop2-atomic-fixups-v3-0-07c48f0f1f0d@collabora.com>
In-Reply-To: <20251209-vop2-atomic-fixups-v3-0-07c48f0f1f0d@collabora.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
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

From: Daniel Stone <daniels@collabora.com>

Make it a little less convoluted, and just directly check if the
combination of plane + format + modifier is supported.

Signed-off-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 56 +++++++++++-----------------
 1 file changed, 22 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index ea84aa5c625e..579fe794a0b9 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -367,59 +367,47 @@ static bool is_yuv_output(u32 bus_format)
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
2.52.0

