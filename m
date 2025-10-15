Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C02A8BDE24E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 13:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA83410E289;
	Wed, 15 Oct 2025 11:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UIHunL+X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E891810E0A1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 11:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760526043;
 bh=GA1Ke0u5/RyfDT7+0LoKkF6FwQAa4p9BzvZyqkuIc34=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UIHunL+Xx92QPkZSw/4dle9XmwcFogc4Ig2gBO0WL81tnHHg/g4QN2ifH4hMPKe6E
 jK43T7PZBhvjz3QR2UTJ05SLL/l6ZhQkgEz+/k4X//nwxr+4+K4crOjCt/H3ONDA0r
 zwt3TSP8WnC4AR+v+E2aJ0uXSqTvQ0qbR3iWGGJlN9KtCm0MFHP1cb43JlCktlmwBf
 Su83TlNjNKbkT2L6U3OPZH0uRJU2zGjdkiWZxpghvKeB5R5tHyeLU4UX2EQF+6D59e
 uKzcZPiReqYmQVU7e4Y17QZ4CJxSOAGzXtI9XD+3vEx7g2/eY7Ip7Lry1/44V0lT7z
 ShFVinfgmhvJQ==
Received: from reinforced.mynet (unknown
 [IPv6:2a01:4b00:be1d:c600:6089:8bab:34a0:d4c5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: daniels)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4BDAD17E0C54;
 Wed, 15 Oct 2025 13:00:43 +0200 (CEST)
From: Daniel Stone <daniels@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: andy.yan@rock-chips.com, hjc@rock-chips.com, heiko@sntech.de,
 cristian.ciocaltea@collabora.com, kernel@collabora.com
Subject: [PATCH 01/13] drm/rockchip: Demote normal drm_err to debug
Date: Wed, 15 Oct 2025 12:00:30 +0100
Message-ID: <20251015110042.41273-2-daniels@collabora.com>
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

A plane check failing is a normal and expected condition, as userspace
isn't aware of the specific constraints and will try any and every
combination until one succeeds. Push this down to a debug message, so
users can see it if they want to, but make sure we don't spam the log
during normal operation.

Fixes: 604be85547ce4 ("drm/rockchip: Add VOP2 driver")
Signed-off-by: Daniel Stone <daniels@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 4556cf7a3364..4ba5444fde4f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1032,20 +1032,20 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 
 	if (drm_rect_width(src) >> 16 < 4 || drm_rect_height(src) >> 16 < 4 ||
 	    drm_rect_width(dest) < 4 || drm_rect_width(dest) < 4) {
-		drm_err(vop2->drm, "Invalid size: %dx%d->%dx%d, min size is 4x4\n",
-			drm_rect_width(src) >> 16, drm_rect_height(src) >> 16,
-			drm_rect_width(dest), drm_rect_height(dest));
+		drm_dbg_kms(vop2->drm, "Invalid size: %dx%d->%dx%d, min size is 4x4\n",
+			    drm_rect_width(src) >> 16, drm_rect_height(src) >> 16,
+			    drm_rect_width(dest), drm_rect_height(dest));
 		pstate->visible = false;
 		return 0;
 	}
 
 	if (drm_rect_width(src) >> 16 > vop2_data->max_input.width ||
 	    drm_rect_height(src) >> 16 > vop2_data->max_input.height) {
-		drm_err(vop2->drm, "Invalid source: %dx%d. max input: %dx%d\n",
-			drm_rect_width(src) >> 16,
-			drm_rect_height(src) >> 16,
-			vop2_data->max_input.width,
-			vop2_data->max_input.height);
+		drm_dbg_kms(vop2->drm, "Invalid source: %dx%d. max input: %dx%d\n",
+			    drm_rect_width(src) >> 16,
+			    drm_rect_height(src) >> 16,
+			    vop2_data->max_input.width,
+			    vop2_data->max_input.height);
 		return -EINVAL;
 	}
 
@@ -1054,7 +1054,7 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 	 * need align with 2 pixel.
 	 */
 	if (fb->format->is_yuv && ((pstate->src.x1 >> 16) % 2)) {
-		drm_err(vop2->drm, "Invalid Source: Yuv format not support odd xpos\n");
+		drm_dbg_kms(vop2->drm, "Invalid Source: Yuv format not support odd xpos\n");
 		return -EINVAL;
 	}
 
-- 
2.51.0

