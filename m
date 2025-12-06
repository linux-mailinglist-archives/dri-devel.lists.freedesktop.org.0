Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4297ECAAD76
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 21:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F73110E2FC;
	Sat,  6 Dec 2025 20:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Bp916Y2L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4588910E2FE
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 20:46:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765053950; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SkL4KxKm+YI7wvX3aiDPUHWHM+8knSDvWuRjCA8UTMK9wvJSjSHGui5g9qZ2V+371rO7j8rbmQyYzttTiDpZUg9zAycSFj1LQ9LZTvPVOaY+rWeLeZ4L9Rlu4qcevVf4V9fggtXlpiE7rKac11N1svGTzn+4NoJQ05FhDos/EnU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765053950;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Yix2VtVAthNOkhvZWCl2bJyUJbLX6oYb/22YOA7QIzE=; 
 b=fp60g4Urhrql8vq7ZX7p726eIv57UCX11/qkm0O2cRfFrnFWVCn8/YilWgtVj1SJWD2jZCl+H3qokhGtwFzKGoodafxSDzfFjZFpHOkadOy8xzSmXEL2Db/YU82vCoWxy1ZE4P973IvKTN38WabAyONrhm8HegnEUZQjlINdwg8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765053950; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=Yix2VtVAthNOkhvZWCl2bJyUJbLX6oYb/22YOA7QIzE=;
 b=Bp916Y2LODD2d1wnzNSKfaRFVyuzMTdNir66+wSirTi3v+1Pe+AUFfTp1juo6xkG
 Ij/7TKr0HR2xx6VIqrZlPx/Wpr79Q5Pw4SlFhs1BG8WQC8/kzgZqsr8IldWbtWk9FW8
 8QFYkwh/Zwu30hzf2fFi9tUtD8JExifYo/9BvJko=
Received: by mx.zohomail.com with SMTPS id 1765053948520766.6119631195057;
 Sat, 6 Dec 2025 12:45:48 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 06 Dec 2025 21:45:13 +0100
Subject: [PATCH v2 3/8] drm/rockchip: vop2: Fix Esmart test condition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-vop2-atomic-fixups-v2-3-7fb45bbfbebd@collabora.com>
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

If we want to find out if a window is Esmart or not, test for not being
a cluster window, rather than AFBDC presence.

No functional effect as only cluster windows support AFBC decode.

Signed-off-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 81b3eba07095..9d715d7659af 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1230,12 +1230,10 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
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
2.52.0

