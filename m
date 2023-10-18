Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221737CD86C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 11:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D4F10E3C7;
	Wed, 18 Oct 2023 09:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7C94910E3C7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 09:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=gWcp7
 Ck1o8pAhe9Dgb62+cMiM53lM5GE6Vwy41G9ck0=; b=lkWgbNwNkcRyvMsLABzPu
 vFMO5SSBjgtH/f6mh/9tgO3mfQhP49dYM60y3GyE/BddEhiBGM9AOIv703I5M67a
 s3zmBCIcSpgWpJ0YGFaqzSJxMQ/z9XNQPZDCq6kZ9IKcldq+2QHeoKmYnqULoLp+
 SJk4xOvR1wVUMMXln1xmKQ=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g2-3 (Coremail) with SMTP id _____wAHbw+QqC9lM2uTAw--.3018S2; 
 Wed, 18 Oct 2023 17:42:43 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, jonas@kwiboo.se
Subject: [PATCH v3 2/4] drm/rockchip: remove the unsupported format of vop2
 cluster window
Date: Wed, 18 Oct 2023 17:42:39 +0800
Message-Id: <20231018094239.2475851-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018094122.2475668-1-andyshrk@163.com>
References: <20231018094122.2475668-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAHbw+QqC9lM2uTAw--.3018S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFy3XFy7KF1fXrWxuFyDWrg_yoW5Cr4xpr
 W3ZrZrZrW0kF10qFWDJryFyF4fC3ZFkayIvwsakwn7uFyjkFyDW3ZFkFy8Ar93KryxCrWI
 yF43JrW5Zr48trJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jS-e5UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiOxUNXmC5n72JFwAAsY
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
Cc: Andy Yan <andy.yan@rock-chips.com>, s.hauer@pengutronix.de,
 sjoerd.simons@collabora.com, hjc@rock-chips.com,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andy Yan <andy.yan@rock-chips.com>

The cluster windows on vop2 doesn't support linear yuv
format(NV12/16/24), it only support afbc based yuv
format(DRM_FORMAT_YUV420_8BIT/10BIT), which will be
added in next patch.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v3:
- make it a split patch

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 24 +-------------------
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c |  3 ---
 2 files changed, 1 insertion(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 93b27b03d479..8289ddc95bee 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -342,10 +342,6 @@ static enum vop2_afbc_format vop2_convert_afbc_format(u32 format)
 	case DRM_FORMAT_RGB565:
 	case DRM_FORMAT_BGR565:
 		return VOP2_AFBC_FMT_RGB565;
-	case DRM_FORMAT_NV12:
-		return VOP2_AFBC_FMT_YUV420;
-	case DRM_FORMAT_NV16:
-		return VOP2_AFBC_FMT_YUV422;
 	default:
 		return VOP2_AFBC_FMT_INVALID;
 	}
@@ -366,25 +362,9 @@ static bool vop2_win_rb_swap(u32 format)
 	}
 }
 
-static bool vop2_afbc_rb_swap(u32 format)
-{
-	switch (format) {
-	case DRM_FORMAT_NV24:
-		return true;
-	default:
-		return false;
-	}
-}
-
 static bool vop2_afbc_uv_swap(u32 format)
 {
-	switch (format) {
-	case DRM_FORMAT_NV12:
-	case DRM_FORMAT_NV16:
-		return true;
-	default:
-		return false;
-	}
+	return false;
 }
 
 static bool vop2_win_uv_swap(u32 format)
@@ -1232,7 +1212,6 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 			drm_err(vop2->drm, "vp%d %s stride[%d] not 64 pixel aligned\n",
 				vp->id, win->data->name, stride);
 
-		rb_swap = vop2_afbc_rb_swap(fb->format->format);
 		uv_swap = vop2_afbc_uv_swap(fb->format->format);
 		/*
 		 * This is a workaround for crazy IC design, Cluster
@@ -1249,7 +1228,6 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		if (vop2_cluster_window(win))
 			vop2_win_write(win, VOP2_WIN_AFBC_ENABLE, 1);
 		vop2_win_write(win, VOP2_WIN_AFBC_FORMAT, afbc_format);
-		vop2_win_write(win, VOP2_WIN_AFBC_RB_SWAP, rb_swap);
 		vop2_win_write(win, VOP2_WIN_AFBC_UV_SWAP, uv_swap);
 		vop2_win_write(win, VOP2_WIN_AFBC_AUTO_GATING_EN, 0);
 		vop2_win_write(win, VOP2_WIN_AFBC_BLOCK_SPLIT_EN, 0);
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 62b573f282a7..b5e59dd34325 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -24,9 +24,6 @@ static const uint32_t formats_win_full_10bit[] = {
 	DRM_FORMAT_BGR888,
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_BGR565,
-	DRM_FORMAT_NV12,
-	DRM_FORMAT_NV16,
-	DRM_FORMAT_NV24,
 };
 
 static const uint32_t formats_win_full_10bit_yuyv[] = {
-- 
2.34.1

