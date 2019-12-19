Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9DE1292CC
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F836E1D8;
	Mon, 23 Dec 2019 08:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 909 seconds by postgrey-1.36 at gabe;
 Thu, 19 Dec 2019 11:15:45 UTC
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1DC89718
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 11:15:45 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 03CD71D9F40D5B438C79;
 Thu, 19 Dec 2019 19:00:33 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Thu, 19 Dec 2019 19:00:26 +0800
From: Chen Zhou <chenzhou10@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH next] drm: of: fix build error without CONFIG_OF
Date: Thu, 19 Dec 2019 18:57:17 +0800
Message-ID: <20191219105717.175829-1-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: chenzhou10@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Without CONFIG_OF, drm_of_lvds_get_dual_link_pixel_order should be
static inline, otherwise building fails:

drivers/gpu/drm/vc4/vc4_dsi.o: In function `drm_of_lvds_get_dual_link_pixel_order':
vc4_dsi.c:(.text+0xa30): multiple definition of `drm_of_lvds_get_dual_link_pixel_order'
drivers/gpu/drm/vc4/vc4_dpi.o:vc4_dpi.c:(.text+0x460): first defined here
make[4]: *** [drivers/gpu/drm/vc4/vc4.o] Error 1
make[3]: *** [drivers/gpu/drm/vc4] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [drivers/gpu/drm] Error 2
make[1]: *** [drivers/gpu] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [drivers] Error 2

Fixes: 6529007522de (drm: of: Add drm_of_lvds_get_dual_link_pixel_order)
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
---
 include/drm/drm_of.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 8ec7ca6..3398be9 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -92,7 +92,7 @@ static inline int drm_of_find_panel_or_bridge(const struct device_node *np,
 	return -EINVAL;
 }
 
-int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
+static inline int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 					  const struct device_node *port2)
 {
 	return -EINVAL;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
