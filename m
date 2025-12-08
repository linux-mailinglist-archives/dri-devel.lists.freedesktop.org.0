Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADD8CAD39F
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 14:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3245610E446;
	Mon,  8 Dec 2025 13:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.b="EXtWl3j6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exactco.de (exactco.de [176.9.10.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FAD10E446
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 13:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; 
 s=x;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
 :Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8a/CeZwjwq49K+NNP2Sd67JTF5oqlthgSeIDmPISdkE=; b=E
 XtWl3j6hlg/N804h4N5zFD4HCluJLYWcP7tOBH0fDQWyJ4UbgIjRM6ru2jt4kSi7t/wmOMFkIxxef
 dWzJJ6iaOl7EkTzP9gTnAOYu0Ugrv301K2EUC3+voaFr6yrEqP2lufLd7H5LiY1UgGhsx8eJczarK
 R8LZ56Sn93K3iQ3aX1UQI9636UULGEmxddl0YWvpFdik2g89IPqoQJmjvn+liW5IPJj43KRh3sttl
 d0AQMZHQN/dQvf0ML/rjxdYiTrCLsk4Zkj1oKyZ0ziUAo8cewBdXBCSn9m4r8JI68aqKX/rSlPukr
 llHCNXTzWdnCczLg7UrGWAYmUXWTUedAg==;
Date: Mon, 08 Dec 2025 14:18:27 +0100 (CET)
Message-Id: <20251208.141827.965103015954471168.rene@exactco.de>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH V3] drm/mgag200: Fix big-endian support
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
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

Unlike the original, deleted Matrox mga driver, the new mgag200 driver
has the XRGB frame-buffer byte swapped on big-endian "RISC"
systems. Fix by enabling byte swapping "PowerPC" OPMODE for any
__BIG_ENDIAN config.

Fixes: 414c45310625 ("mgag200: initial g200se driver (v2)")
Signed-off-by: René Rebe <rene@exactco.de>
Cc: stable@kernel.org
---
V3: move to func, mask prev reg content
V2: move to atomic_update
V3 was only compile tested, while V1/2 were tested on IBM 43p w/ T2/Linux.
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 951d715dea30..191037ce1029 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -161,6 +161,29 @@ static void mgag200_set_startadd(struct mga_device *mdev,
 	WREG_ECRT(0x00, crtcext0);
 }
 
+/*
+ * Set the opmode for the hardware swapper for Big-Endian processor
+ * support for the frame buffer aperture and DMAWIN space.
+ */
+static void mgag200_set_datasiz(struct mga_device *mdev, u32 format)
+{
+#if __BIG_ENDIAN
+	u32 opmode = RREG32(MGAREG_OPMODE);
+	opmode &= ~(GENMASK(17, 16) | GENMASK(9, 8) | GENMASK(3, 2));
+
+	/* Big-endian byte-swapping */
+	switch (format) {
+	case DRM_FORMAT_RGB565:
+		opmode |= 0x10100;
+		break;
+	case DRM_FORMAT_XRGB8888:
+		opmode |= 0x20200;
+		break;
+	}
+	WREG32(MGAREG_OPMODE, opmode);
+#endif
+}
+
 void mgag200_init_registers(struct mga_device *mdev)
 {
 	u8 crtc11, misc;
@@ -496,6 +519,7 @@ void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
 
+	mgag200_set_datasiz(mdev, fb->format->format);
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
 		mgag200_handle_damage(mdev, shadow_plane_state->data, fb, &damage);
-- 
2.52.0

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe
