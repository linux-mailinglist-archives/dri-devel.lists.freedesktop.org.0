Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1D7BDE26E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 13:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B7110E297;
	Wed, 15 Oct 2025 11:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ROX6Mr6u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDAD10E28A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 11:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760526046;
 bh=/qNnbpvfxH+x7P73cmYuRdFXqd+kIrZzd1+wV3INGR4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ROX6Mr6uDcCCADo1qQWdhdc6p7d9DncgitJEGjAdBEHxGFWxAwvEyfd3ypucMwyfk
 a2RpoDRde6K+f+qfQLiOI9zSE68ue9iIxJYJexRuU7mbcPUC7CLZTgoQb8rvGN+YdT
 SSE53M1OZ9jVyyss6Ft6M1f9+gpCVN3/oO+mZBP1FP0IE94XV5ys8ijzDDQD5CpwNQ
 +N1H3r3hV5qJ4ly5JLTRO2XGXccqYzts5M+VND9xf1I2pgHNUqIMMDi/oopWJTAu9U
 uVqrAodFp+lrZn/RwDqwyEjmOd7LgLWIvrbMZ8PtmfcFAuN6NwDBizBFdecV63VFG5
 wqhjDRjYzIIsg==
Received: from reinforced.mynet (unknown
 [IPv6:2a01:4b00:be1d:c600:6089:8bab:34a0:d4c5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: daniels)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 19D5217E1576;
 Wed, 15 Oct 2025 13:00:46 +0200 (CEST)
From: Daniel Stone <daniels@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: andy.yan@rock-chips.com, hjc@rock-chips.com, heiko@sntech.de,
 cristian.ciocaltea@collabora.com, kernel@collabora.com
Subject: [PATCH 08/13] drm/rockchip: Fix eSmart test condition
Date: Wed, 15 Oct 2025 12:00:37 +0100
Message-ID: <20251015110042.41273-9-daniels@collabora.com>
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

If we want to find out if a window is eSmart or not, test for not being
a cluster window, rather than AFBDC presence.

No functional effect as only cluster windows support AFBC decode.

Signed-off-by: Daniel Stone <daniels@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 812a46032396..f8039dc0e829 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1227,12 +1227,10 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	 * This is workaround solution for IC design:
 	 * esmart can't support scale down when src_w % 16 == 1.
 	 */
-	if (!(win->data->feature & WIN_FEATURE_AFBDC)) {
-		if (src_w > dsp_w && (src_w & 0xf) == 1) {
-			drm_dbg_kms(vop2->drm, "vp%d %s act_w[%d] MODE 16 == 1\n",
-				    vp->id, win->data->name, src_w);
-			src_w -= 1;
-		}
+	if (!vop2_cluster_window(win) && src_w > dsp_w && (src_w & 1)) {
+		drm_dbg_kms(vop2->drm, "vp%d %s act_w[%d] MODE 16 == 1\n",
+			    vp->id, win->data->name, src_w);
+		src_w -= 1;
 	}
 
 	if (afbc_en && src_w % 4) {
-- 
2.51.0

