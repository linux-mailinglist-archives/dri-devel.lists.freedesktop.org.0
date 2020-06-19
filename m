Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C20AD203032
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277196E58B;
	Mon, 22 Jun 2020 07:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D2C6EC39
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 08:53:09 +0000 (UTC)
Received: from localhost (unknown [192.168.167.209])
 by lucky1.263xmail.com (Postfix) with ESMTP id 6ADA7BFCA3;
 Fri, 19 Jun 2020 16:53:05 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P10491T139788078274304S1592556784649283_; 
 Fri, 19 Jun 2020 16:53:05 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <01c70fabecef316f33fcc8cfd259d260>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: heiko@sntech.de
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From: Sandy Huang <hjc@rock-chips.com>
To: heiko@sntech.de, Sandy Huang <hjc@rock-chips.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/rockchip: vop: fix vop full rgb24 r/b color error
Date: Fri, 19 Jun 2020 16:53:02 +0800
Message-Id: <20200619085302.2263-1-hjc@rock-chips.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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
Cc: huangtao@rock-chips.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 andy.yan@rock-chips.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGB888 format msb is red component and the lsb is blue component,
at vop full platform this is swapped, and this is different from vop
lite and vop next, so add this patch to fix it.

v2:
    move to has_rb_swapped() function.

Signed-off-by: Sandy Huang <hjc@rock-chips.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index c80f7d9fd13f..99bdb5a2a185 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -132,6 +132,7 @@ struct vop_win {
 
 struct rockchip_rgb;
 struct vop {
+	uint32_t version;
 	struct drm_crtc crtc;
 	struct device *dev;
 	struct drm_device *drm_dev;
@@ -248,17 +249,28 @@ static inline void vop_cfg_done(struct vop *vop)
 	VOP_REG_SET(vop, common, cfg_done, 1);
 }
 
-static bool has_rb_swapped(uint32_t format)
+static bool has_rb_swapped(struct vop *vop, uint32_t format)
 {
+	bool rb_swapped;
+
 	switch (format) {
 	case DRM_FORMAT_XBGR8888:
 	case DRM_FORMAT_ABGR8888:
 	case DRM_FORMAT_BGR888:
 	case DRM_FORMAT_BGR565:
-		return true;
+		rb_swapped = true;
 	default:
-		return false;
+		rb_swapped = false;
 	}
+
+	/*
+	 * VOP full need to do rb swap to show rgb888/bgr888 format color correctly
+	 */
+	if ((format == DRM_FORMAT_RGB888 || format == DRM_FORMAT_BGR888) &&
+	    VOP_MAJOR(vop->version) == 3)
+		rb_swapped = !rb_swapped;
+
+	return rb_swapped;
 }
 
 static enum vop_data_format vop_convert_format(uint32_t format)
@@ -988,7 +1000,7 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
 	VOP_WIN_SET(vop, win, dsp_info, dsp_info);
 	VOP_WIN_SET(vop, win, dsp_st, dsp_st);
 
-	rb_swap = has_rb_swapped(fb->format->format);
+	rb_swap = has_rb_swapped(vop, fb->format->format);
 	VOP_WIN_SET(vop, win, rb_swap, rb_swap);
 
 	/*
@@ -2091,6 +2103,7 @@ static int vop_bind(struct device *dev, struct device *master, void *data)
 	vop->dev = dev;
 	vop->data = vop_data;
 	vop->drm_dev = drm_dev;
+	vop->version = vop_data->version;
 	dev_set_drvdata(dev, vop);
 
 	vop_win_init(vop);
-- 
2.17.1



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
