Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81083CBE366
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 15:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D305310E065;
	Mon, 15 Dec 2025 14:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="AhgZgkRM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AAC10E065
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 14:12:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765807894; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=P04G21Yi4J5KwA1r0rsmtaqXn7iCetRyaLCG+kHUhN/Jj8ozKvUHGIHDtLAKPlu5sF2JqiVgChtONtELHJUdNHtn3pM2k7o2r8/gZ7eXJyxxP2O/IF/8XbhsEP1bK1jVLYbeODanA2XNWv8j1i5dU1lamYhfqEVpoCvX9wKsYpM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765807894;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=r3vBDPiRwM/pFVmzlF7hTqqQx7+trjW5u24oYfBFoQo=; 
 b=H8Bgy7c1YZG7u8kFE30rTI9vj8bO0b9UVJVSWDKqiOeehxDUpbCfMX6eYJPwiiViGeS8mlGIKZBWR4RaFYbI+EM4oXqzkcF/jacQ2T7/1ULg11b3iWWXXFgcN6DR4ULK3z+JIN+xKKCzMT3buV/7y7taf8Rj3iP7dF+UzLkNpbA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765807894; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=r3vBDPiRwM/pFVmzlF7hTqqQx7+trjW5u24oYfBFoQo=;
 b=AhgZgkRMYY11fJouSY6tgowdzal2IXzfQBRuhv58oZqt4JozGSw0skNTibIrhG6j
 D9v86VkjIJPZxE/E0zk9xKmhAWqBdMj3Qy3zH3Hbf9EoAG7xQrrR7/xCqXa6IV6XY6m
 YDQMq/1JDqa3DmJFyowYNAJ+pvITu9+pAmVRgS8c=
Received: by mx.zohomail.com with SMTPS id 176580788851118.171113445808487;
 Mon, 15 Dec 2025 06:11:28 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 15 Dec 2025 15:09:22 +0100
Subject: [PATCH v5 6/8] drm/rockchip: vop2: Enforce AFBC transform stride
 align in plane_check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-vop2-atomic-fixups-v5-6-83463c075a8d@collabora.com>
References: <20251215-vop2-atomic-fixups-v5-0-83463c075a8d@collabora.com>
In-Reply-To: <20251215-vop2-atomic-fixups-v5-0-83463c075a8d@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: David Laight <david.laight.linux@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Stone <daniels@collabora.com>, kernel@collabora.com, 
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
index 0eab3370f088..7591a34ba912 100644
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
+			    "AFBC buffers must be 64-pixel aligned for horizontal rotation or mirroring\n");
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

