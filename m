Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBEBCAAD70
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 21:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F216B10E2FB;
	Sat,  6 Dec 2025 20:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="V8c8JVch";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7342D10E2F9
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 20:45:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765053946; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bD5fcC8ts8h5ZfA5QkIjEJ/ChgPMTTwuY8euU3wHhgQzmxWgJRUXyca9KpJ/xKjpeHEdonL7T72utxsc9SE5oY53ShCD9IoanfEzF48BXVERH5bnLUAPxe5+sSQxDzLYLRzRdn2nEeycWZORJBDB/+o6zbZmo+Hh32e52m1DOHM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765053946;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=p8rzuw22G5hQ+PO+mu50soCKPQPRHc3OuYqSu+o6ifI=; 
 b=NgalSxS3pnR66klEJJjZgdrSIU5Fe4lzj4nfVNpCSthkotUS35SlQDXIPXyq2omXPt1DVoO9j7+i6+2PAo7UoUM3v1L6uT6IhfbeNlkmf9cyCjVJDX1L1nb0Rm0vFIxT/LcYyiYyJ8aazBreKDkJQGvcg9jGhQZWa+a6nskS0wU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765053946; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=p8rzuw22G5hQ+PO+mu50soCKPQPRHc3OuYqSu+o6ifI=;
 b=V8c8JVchdq4FF8QQWXkF5WbinnsMUXxbxqBuYuzqzTZ53V1qDwii6UI8i/nIs38R
 tQ440YkyxyJfAUb5tbZLhJFbK3M46N4Qqxh2hhd45vOSBd2ATBzdL7Ra/rGYNsBYYBP
 RR9une20Lr/kxlh7x84KuP9VqFuw3Ui19TaT82IQ=
Received: by mx.zohomail.com with SMTPS id 1765053945136258.821617888442;
 Sat, 6 Dec 2025 12:45:45 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 06 Dec 2025 21:45:12 +0100
Subject: [PATCH v2 2/8] drm/rockchip: vop2: Switch impossible pos
 conditional to WARN_ON
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-vop2-atomic-fixups-v2-2-7fb45bbfbebd@collabora.com>
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

We already clip the plane to the display bounds in atomic_check, and
ensure that it is sufficiently sized. Instead of trying to catch this
and adjust for it in atomic_update, just assert that atomic_check has
done its job.

Signed-off-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 29 +++++++++-------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 20b49209ddcd..81b3eba07095 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1214,28 +1214,17 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	src_w = drm_rect_width(src) >> 16;
 	src_h = drm_rect_height(src) >> 16;
 	dsp_w = drm_rect_width(dest);
-
-	if (dest->x1 + dsp_w > adjusted_mode->hdisplay) {
-		drm_dbg_kms(vop2->drm,
-			    "vp%d %s dest->x1[%d] + dsp_w[%d] exceed mode hdisplay[%d]\n",
-			    vp->id, win->data->name, dest->x1, dsp_w, adjusted_mode->hdisplay);
-		dsp_w = adjusted_mode->hdisplay - dest->x1;
-		if (dsp_w < 4)
-			dsp_w = 4;
-		src_w = dsp_w * src_w / drm_rect_width(dest);
-	}
-
 	dsp_h = drm_rect_height(dest);
 
-	if (dest->y1 + dsp_h > adjusted_mode->vdisplay) {
-		drm_dbg_kms(vop2->drm,
-			    "vp%d %s dest->y1[%d] + dsp_h[%d] exceed mode vdisplay[%d]\n",
-			    vp->id, win->data->name, dest->y1, dsp_h, adjusted_mode->vdisplay);
-		dsp_h = adjusted_mode->vdisplay - dest->y1;
-		if (dsp_h < 4)
-			dsp_h = 4;
-		src_h = dsp_h * src_h / drm_rect_height(dest);
-	}
+	/* drm_atomic_helper_check_plane_state calls drm_rect_clip_scaled for
+	 * us, which keeps our planes bounded within the CRTC active area
+	 */
+	WARN_ON(dest->x1 + dsp_w > adjusted_mode->hdisplay);
+	WARN_ON(dest->y1 + dsp_h > adjusted_mode->vdisplay);
+	WARN_ON(dsp_w < 4);
+	WARN_ON(dsp_h < 4);
+	WARN_ON(src_w < 4);
+	WARN_ON(src_h < 4);
 
 	/*
 	 * This is workaround solution for IC design:

-- 
2.52.0

