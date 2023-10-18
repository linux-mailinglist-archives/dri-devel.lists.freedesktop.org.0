Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E23B77CD86A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 11:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87D110E3C3;
	Wed, 18 Oct 2023 09:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8D74110E3C3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 09:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=D8orW
 aZoftxAaMcKBCJtMoDO5cmw6kme9A0KiSp4QR8=; b=Pw7npVl3Cx/3BmSj4FnHH
 yFO5ZUEcDQwzS3Upd3LpKCVEXKxtR1PpwWvWTlFuatK+fOMlnkyGSmT+Fm7QGhke
 sU1cytA3jMulrAfPXY8WX4jC90usXZLtjqutMWToFWZmCGqRJWPIAxKirSiAtUDF
 3OqrB8FWx6NK1Z/jf4JKfw=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g0-1 (Coremail) with SMTP id _____wD3fzp3qC9lkJuJAw--.52842S2;
 Wed, 18 Oct 2023 17:42:19 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, jonas@kwiboo.se
Subject: [PATCH v3 1/4] drm/rockchip: fix vop format bpp calculation
Date: Wed, 18 Oct 2023 17:42:10 +0800
Message-Id: <20231018094210.2475771-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018094122.2475668-1-andyshrk@163.com>
References: <20231018094122.2475668-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3fzp3qC9lkJuJAw--.52842S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW3tF13uFW7AF1DZFyrJFb_yoW8Zry7pF
 WUAr90gr45KFWjgFn7JaykZFWakwnxCay2grW7G3s8KF13KFyDAw1akrWUAr98GFyxur1a
 yFsxKrWUCa12k3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jSWlkUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiEB8NXl8YL0Q5UgAAsb
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

We can't rely on cpp for bpp calculation as the cpp of
some formats(DRM_FORMAT_YUV420_8BIT/10BIT, etc) is zero.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 57c05c6b246c..93b27b03d479 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -282,6 +282,20 @@ static void vop2_win_disable(struct vop2_win *win)
 		vop2_win_write(win, VOP2_WIN_CLUSTER_ENABLE, 0);
 }
 
+static u32 vop2_get_bpp(const struct drm_format_info *format)
+{
+	switch (format->format) {
+	case DRM_FORMAT_YUV420_8BIT:
+		return 12;
+	case DRM_FORMAT_YUV420_10BIT:
+		return 15;
+	case DRM_FORMAT_VUY101010:
+		return 30;
+	default:
+		return drm_format_info_bpp(format, 0);
+	}
+}
+
 static enum vop2_data_format vop2_convert_format(u32 format)
 {
 	switch (format) {
@@ -482,7 +496,7 @@ static u32 vop2_afbc_transform_offset(struct drm_plane_state *pstate,
 {
 	struct drm_rect *src = &pstate->src;
 	struct drm_framebuffer *fb = pstate->fb;
-	u32 bpp = fb->format->cpp[0] * 8;
+	u32 bpp = vop2_get_bpp(fb->format);
 	u32 vir_width = (fb->pitches[0] << 3) / bpp;
 	u32 width = drm_rect_width(src) >> 16;
 	u32 height = drm_rect_height(src) >> 16;
@@ -1080,7 +1094,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	struct drm_display_mode *adjusted_mode = &crtc->state->adjusted_mode;
 	struct vop2 *vop2 = win->vop2;
 	struct drm_framebuffer *fb = pstate->fb;
-	u32 bpp = fb->format->cpp[0] * 8;
+	u32 bpp = vop2_get_bpp(fb->format);
 	u32 actual_w, actual_h, dsp_w, dsp_h;
 	u32 act_info, dsp_info;
 	u32 format;
-- 
2.34.1

