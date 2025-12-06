Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F27F4CAAD7C
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 21:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE0510E2FE;
	Sat,  6 Dec 2025 20:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Efv5fWXr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90DD10E2FE
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 20:46:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765053960; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=k3yrkZtaXRbcXbcZvyexEEorflSIzmNAN081YqA6nGlsBbjKAM4Mdc8bghTDNd1aOia1kD5zS/T3w8xGpWJjTPGCIjCZLq7ilALxY/CJp8fpIu1Xw1ymVB7/9qIQ1kMp0OS8TpQpFxFRPAMV/SfZSCCw2fDRo39RtXAPUJvs5Og=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765053960;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ENE3v57EU2IVCcCEZVGBw5ReXzA8phnW9WgvWoxQgCM=; 
 b=IRJG3gSglEa7Sw4LbMczphsNR+2e5jPIZdKchcrfTLMUa1P0eVwVEYCmTjYy1woWGdbmZ2fpN0PB8m+WYHVzqQe7Zc1/CnfHjTZtsqYMOc2Q7OGI8e2UCk06ciwN7pexRsOZBipzjR+wBaaLvZMkQ2tOiREs89ugzBHl1S/F0+g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765053960; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=ENE3v57EU2IVCcCEZVGBw5ReXzA8phnW9WgvWoxQgCM=;
 b=Efv5fWXroodZA3SlIlNSFxJHtu/pz5HSWz6fbzfKfZjdIGI7vDvTVzE4ynmbHRtk
 VZXHBviFAP+QEQ7f8D4ac77vHy6V9DlZGqdZtU3TCv8CHMe2dUF3NgmmFU+fD/Z9sre
 RTRnTJCtfGYgd5iQhe9dk7c8bZM9VIh710opuVwQ=
Received: by mx.zohomail.com with SMTPS id 1765053958679133.395463320163;
 Sat, 6 Dec 2025 12:45:58 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 06 Dec 2025 21:45:16 +0100
Subject: [PATCH v2 6/8] drm/rockchip: vop2: Enforce AFBC transform stride
 align in plane_check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-vop2-atomic-fixups-v2-6-7fb45bbfbebd@collabora.com>
References: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
In-Reply-To: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
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

Make sure we can't break the hardware by requesting an unsupported
configuration.

Signed-off-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index e23213337104..2a308cc31632 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1083,6 +1083,15 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
+	if (drm_is_afbc(fb->modifier) &&
+	    pstate->rotation &
+		(DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270) &&
+	    (fb->pitches[0] << 3) / vop2_get_bpp(fb->format) % 64) {
+		drm_dbg_kms(vop2->drm,
+			    "AFBC buffers must be 64-byte aligned for horizontal rotation or mirroring\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -1290,9 +1299,6 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		 * with WIN_VIR_STRIDE.
 		 */
 		stride = (fb->pitches[0] << 3) / bpp;
-		if ((stride & 0x3f) && (xmirror || rotate_90 || rotate_270))
-			drm_dbg_kms(vop2->drm, "vp%d %s stride[%d] not 64 pixel aligned\n",
-				    vp->id, win->data->name, stride);
 
 		 /* It's for head stride, each head size is 16 byte */
 		stride = ALIGN(stride, block_w) / block_w * 16;

-- 
2.52.0

