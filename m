Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1CCBDE262
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 13:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A284C10E29B;
	Wed, 15 Oct 2025 11:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YG1gPHLT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1AF10E287
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 11:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760526048;
 bh=l3028Br53xAH9GwDSKYwH+0YjHPIevoq+61wo+3N9XU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YG1gPHLTK/cgfiM8j1RtcWKk8DwMNLqyZs6289Ipj9eRximQbRenVTqAWmmX45Rs3
 lhPb1FMtGFDhpLb+MtnQyEJAD/4A4uhi8XgYhRlKkswwz3aYtHuVpzxXfHf6+LDJLS
 X5VY0GmNqgKcecfZmFmRTL3ncYIFly6ZU3i4DIvHne4K82v3GkJ+PDFvgmYS2ov/Bs
 H6azmN+jSx3i8V6e5jHBWG+RiFaXEJCy7p+txgh5/OaQvT97mbJaSmZd8FnfU1qL9O
 oJkrAHgVEhglnYTA8HfgwwoCUumXCF7FA6cMwWJHWUpIbENJ34M5W1SqShWXP3RjfC
 kkQgdq8sERq2A==
Received: from reinforced.mynet (unknown
 [IPv6:2a01:4b00:be1d:c600:6089:8bab:34a0:d4c5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: daniels)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A199717E15C7;
 Wed, 15 Oct 2025 13:00:47 +0200 (CEST)
From: Daniel Stone <daniels@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: andy.yan@rock-chips.com, hjc@rock-chips.com, heiko@sntech.de,
 cristian.ciocaltea@collabora.com
Subject: [PATCH 10/13] drm/rockchip: Enforce AFBC source alignment in
 plane_check
Date: Wed, 15 Oct 2025 12:00:39 +0100
Message-ID: <20251015110042.41273-11-daniels@collabora.com>
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

Planes can only source AFBC framebuffers at multiples of 4px wide.
Instead of clipping when the user asks for an unaligned source
rectangle, reject the configuration in the plane's atomic check.

Signed-off-by: Daniel Stone <daniels@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 65437437e3d5..0abaf3e0eab6 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1068,12 +1068,19 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 	 * This is workaround solution for IC design:
 	 * esmart can't support scale down when src_w % 16 == 1.
 	 */
-	if (!vop2_cluster_window(win) && src_w > dsp_w && (src_w & 1)) {
+	if (!vop2_cluster_window(win) && src_w > dest_w && (src_w & 1)) {
 		drm_dbg_kms(vop2->drm,
 			    "eSmart windows cannot downscale odd-width source regions\n");
 		return -EINVAL;
 	}
 
+	if (drm_is_afbc(fb->modifier) && src_w % 4) {
+		drm_dbg_kms(vop2->drm,
+			    "AFBC source rectangles must be 4-byte aligned; is %d\n",
+			    src_w);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -1234,11 +1241,8 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	WARN_ON(src_w < 4);
 	WARN_ON(src_h < 4);
 
-	if (afbc_en && src_w % 4) {
-		drm_dbg_kms(vop2->drm, "vp%d %s src_w[%d] not 4 pixel aligned\n",
-			    vp->id, win->data->name, src_w);
-		src_w = ALIGN_DOWN(src_w, 4);
-	}
+	if (drm_is_afbc(fb->modifier))
+		WARN_ON(src_w % 4);
 
 	act_info = (src_h - 1) << 16 | ((src_w - 1) & 0xffff);
 	dsp_info = (dsp_h - 1) << 16 | ((dsp_w - 1) & 0xffff);
-- 
2.51.0

