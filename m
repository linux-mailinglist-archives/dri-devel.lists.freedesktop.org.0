Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF53CBE34E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 15:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B582810E4FE;
	Mon, 15 Dec 2025 14:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="TTqeECkr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED9C10E519
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 14:11:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765807863; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=io7FQifRbKmJQQH0DFt9jSrJo7us5yIlLwEUJ0yxcWwmpokwUf/DdMZqqfOa+UGgD2hLvwq+L2fESw0aBzNQABkG95azgPm2zKSbQV59Cf535Dqf+IW5OOc5t9fpzYVcLIBTc3NPocDqsU4SmMaCioeq1OaxnqNcQ7HEEY7F6tg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765807863;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7n42KK6gudYMqBGWZXjr2PpxZcrxS+YRaFD+RvftefE=; 
 b=i10xTk8pXue1IwEELQfQ3zVI6eolZWGQik6flq0mJi5IGgWH8yP9+dLEuwEiKzZdEd/5nPJIUJEZjd/6Nfmh4EARMbTR0/BzpDVmqB6eXoJZWhArhvyxcSr1OQMLUANURMO2WBI2nvrX9JGe0acOHWmRthrPCQVLJx8mqiI2d94=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765807863; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=7n42KK6gudYMqBGWZXjr2PpxZcrxS+YRaFD+RvftefE=;
 b=TTqeECkryqVhcTU7cEUW168Ju1P39T8lq6PtWqS5k6n9N6X/SpKSicOHq8A/brX0
 wQymF81dRYOm8IUgHvu4nsmMFe1xUYNHr8dGTgrX7Dg+4Tip4tnkg9zrEqyRNfPI7Ep
 nZWZ6JlQIGo+cLaCtuRCqsVzsXWaV3hXHCAy9o+M=
Received: by mx.zohomail.com with SMTPS id 1765807859406709.1268892387307;
 Mon, 15 Dec 2025 06:10:59 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 15 Dec 2025 15:09:20 +0100
Subject: [PATCH v5 4/8] drm/rockchip: vop2: Enforce scaling workaround in
 plane_check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-vop2-atomic-fixups-v5-4-83463c075a8d@collabora.com>
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

It seems only cluster windows are capable of applying downscaling when
the source region has an odd width. Instead of applying a workaround
inside atomic_update, fail the plane check if this is requested.

Signed-off-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index fbcc655cb583..ded8b9952c6d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -998,6 +998,7 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 	struct drm_crtc *crtc = pstate->crtc;
 	struct drm_crtc_state *cstate;
 	struct vop2_video_port *vp;
+	struct vop2_win *win = to_vop2_win(plane);
 	struct vop2 *vop2;
 	const struct vop2_data *vop2_data;
 	struct drm_rect *dest = &pstate->dst;
@@ -1065,6 +1066,16 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
+	/*
+	 * This is workaround solution for IC design:
+	 * esmart can't support scale down when src_w % 16 == 1.
+	 */
+	if (!vop2_cluster_window(win) && src_w > dest_w && (src_w & 1)) {
+		drm_dbg_kms(vop2->drm,
+			    "Esmart windows cannot downscale odd-width source regions\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -1225,16 +1236,6 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	    WARN_ON(src_w < 4) || WARN_ON(src_h < 4))
 		return;
 
-	/*
-	 * This is workaround solution for IC design:
-	 * esmart can't support scale down when src_w % 16 == 1.
-	 */
-	if (!vop2_cluster_window(win) && src_w > dsp_w && (src_w & 1)) {
-		drm_dbg_kms(vop2->drm, "vp%d %s act_w[%d] MODE 16 == 1\n",
-			    vp->id, win->data->name, src_w);
-		src_w -= 1;
-	}
-
 	if (afbc_en && src_w % 4) {
 		drm_dbg_kms(vop2->drm, "vp%d %s src_w[%d] not 4 pixel aligned\n",
 			    vp->id, win->data->name, src_w);

-- 
2.52.0

