Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8D6CAA3BB
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 11:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65F010E2C8;
	Sat,  6 Dec 2025 10:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.b="n7RwLtDg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exactco.de (exactco.de [176.9.10.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3A110EB70
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 17:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; 
 s=x;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
 :Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Zwc3elfcrN1cbQtiss8FPA3Ap7/mji/PJcXvgIZpJWA=; b=n
 7RwLtDgmiyPu1/bH07DQg1bC/24RpULJXJ2zMFrj4XFXQP9zYFgeuWwv+kRw9bfjT8hGHwUUv0WYO
 qC4fI879gwqdPe2KUtmb3AMsRbt25mCukLd8+1TDKxldmqhUHHqR1TFgqI1DXjEnQRiY/EFa7rn4i
 rPx+ZytBS81eCfziNVzCXVS37/EqW8qElWczuhO5vfA3DahuSNu0YOfVhZZy497vz2l/GEfaCPOCc
 dwZhNiaFsRn8JldsDzdSSVFi4li3Y4ZrcXBL3LBT4HEsjY85vGNh217HRfY/6W6xsRzOZlbST20At
 qMTmKUvW2ISX5J+e+vlYgLbK1K+g3+JEQ==;
Date: Fri, 05 Dec 2025 18:24:05 +0100 (CET)
Message-Id: <20251205.182405.876575799174263183.rene@exactco.de>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH V2] drm/mgag200: Fix big-endian support
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 Dec 2025 10:07:49 +0000
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

Unlike the original, deleted Matrox mga driver, the new mgag200 driver
has the XRGB frame-buffer byte swapped on big-endian "RISC"
systems. Fix by enabling byte swapping "PowerPC" OPMODE for any
__BIG_ENDIAN config.

Fixes: 414c45310625 ("mgag200: initial g200se driver (v2)")
Signed-off-by: René Rebe <rene@exactco.de>
Cc: stable@kernel.org
---
V2: move to atomic_update
Tested on IBM 43p Model 150 (7043-150) running T2/Linux.
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 951d715dea30..d40434ec68ab 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -496,6 +496,20 @@ void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
 
+#ifdef __BIG_ENDIAN
+	/* Big-endian byte-swapping */
+	switch (fb->format->format) {
+	case DRM_FORMAT_RGB565:
+		WREG32(MGAREG_OPMODE, 0x10100);
+		break;
+	case DRM_FORMAT_XRGB8888:
+		WREG32(MGAREG_OPMODE, 0x20200);
+		break;
+	default:
+		break;
+	}
+#endif
+
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
 		mgag200_handle_damage(mdev, shadow_plane_state->data, fb, &damage);
-- 
2.52.0

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe
