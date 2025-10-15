Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FFFBDE25B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 13:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B5A10E287;
	Wed, 15 Oct 2025 11:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="V4CNEmq3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E63810E28A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 11:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760526045;
 bh=bwQ//ng/Dm6AT462oqQgPqfvE0jqBKkRUm5wYhW0ntI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V4CNEmq3fepJQNxmG8rd4SpKiY89AL1Zhz2iiMG3b5SWwoODukLH2RFCFHjvQrYvB
 6w8AIuzwFPfHm0zDzGBpsYTvD34NP8h76BB1S7pZcFLGFP2w11KmV/WiTlH2xAFV1r
 6HHcwrZQOiUjTF/9aAYKd1E90KuNpIbZPgqIgi7EqSTykVJApSyIWA9Rb/DWZyFOEH
 g6fjcepOoO+asvj7pud/b8SPHSHIpjsSw+LOQKuR0ZVfUUX2j4mc7UYRepBUQpCBfC
 6JJvDVAThi02sAjVr96NtkE8VMtxm5ck1NA22YvEa0PsWrps4BgYr/HmX0yMPPte01
 Oe3EHBZ2wwsFw==
Received: from reinforced.mynet (unknown
 [IPv6:2a01:4b00:be1d:c600:6089:8bab:34a0:d4c5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: daniels)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DF53017E1418;
 Wed, 15 Oct 2025 13:00:44 +0200 (CEST)
From: Daniel Stone <daniels@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: andy.yan@rock-chips.com, hjc@rock-chips.com, heiko@sntech.de,
 cristian.ciocaltea@collabora.com, kernel@collabora.com
Subject: [PATCH 05/13] drm/rockchip: Use temporary variables
Date: Wed, 15 Oct 2025 12:00:34 +0100
Message-ID: <20251015110042.41273-6-daniels@collabora.com>
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

Brevity is good.

Signed-off-by: Daniel Stone <daniels@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 24 ++++++++++++--------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index e2bf2dbd882b..284c8a048034 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1003,6 +1003,8 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 	struct drm_rect *src = &pstate->src;
 	int min_scale = FRAC_16_16(1, 8);
 	int max_scale = FRAC_16_16(8, 1);
+	int src_x, src_w, src_h;
+	int dest_w, dest_h;
 	int format;
 	int ret;
 
@@ -1030,19 +1032,23 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 	if (format < 0)
 		return format;
 
-	if (drm_rect_width(src) >> 16 < 4 || drm_rect_height(src) >> 16 < 4 ||
-	    drm_rect_width(dest) < 4 || drm_rect_width(dest) < 4) {
+	/* Co-ordinates have now been clipped */
+	src_x = src->x1 >> 16;
+	src_w = drm_rect_width(src) >> 16;
+	src_h = drm_rect_height(src) >> 16;
+	dest_w = drm_rect_width(dest);
+	dest_h = drm_rect_height(dest);
+
+	if (src_w < 4 || src_h < 4 || dest_w < 4 || dest_h < 4) {
 		drm_dbg_kms(vop2->drm, "Invalid size: %dx%d->%dx%d, min size is 4x4\n",
-			    drm_rect_width(src) >> 16, drm_rect_height(src) >> 16,
-			    drm_rect_width(dest), drm_rect_height(dest));
+			    src_w, src_h, dest_w, dest_h);
 		return -EINVAL;
 	}
 
-	if (drm_rect_width(src) >> 16 > vop2_data->max_input.width ||
-	    drm_rect_height(src) >> 16 > vop2_data->max_input.height) {
+	if (src_w > vop2_data->max_input.width ||
+	    src_h > vop2_data->max_input.height) {
 		drm_dbg_kms(vop2->drm, "Invalid source: %dx%d. max input: %dx%d\n",
-			    drm_rect_width(src) >> 16,
-			    drm_rect_height(src) >> 16,
+			    src_w, src_h,
 			    vop2_data->max_input.width,
 			    vop2_data->max_input.height);
 		return -EINVAL;
@@ -1052,7 +1058,7 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 	 * Src.x1 can be odd when do clip, but yuv plane start point
 	 * need align with 2 pixel.
 	 */
-	if (fb->format->is_yuv && ((pstate->src.x1 >> 16) % 2)) {
+	if (fb->format->is_yuv && src_x % 2) {
 		drm_dbg_kms(vop2->drm, "Invalid Source: Yuv format not support odd xpos\n");
 		return -EINVAL;
 	}
-- 
2.51.0

