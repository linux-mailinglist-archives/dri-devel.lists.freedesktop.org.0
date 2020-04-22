Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B19011B55C9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 09:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491C56E255;
	Thu, 23 Apr 2020 07:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062DC6E33D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 07:19:51 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 1D23384CEA046174019C;
 Wed, 22 Apr 2020 15:19:43 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Wed, 22 Apr 2020
 15:19:34 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <b.zolnierkie@samsung.com>, <afd@ti.com>, <tomi.valkeinen@ti.com>,
 <linux-omap@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] omapfb/dss: fix comparison to bool warning
Date: Wed, 22 Apr 2020 15:19:03 +0800
Message-ID: <20200422071903.637-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 23 Apr 2020 07:36:39 +0000
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
Cc: Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:

drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c:461:15-32: WARNING:
Comparison to bool
drivers/video/fbdev/omap2/omapfb/dss/dispc.c:891:5-35: WARNING:
Comparison of 0/1 to bool variable

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 2 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
index 4a16798b2ecd..3bb951eb29c7 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -888,7 +888,7 @@ static void dispc_ovl_set_color_mode(enum omap_plane plane,
 static void dispc_ovl_configure_burst_type(enum omap_plane plane,
 		enum omap_dss_rotation_type rotation_type)
 {
-	if (dss_has_feature(FEAT_BURST_2D) == 0)
+	if (!dss_has_feature(FEAT_BURST_2D))
 		return;
 
 	if (rotation_type == OMAP_DSS_ROT_TILER)
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
index 7060ae56c062..ef659c89ba58 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
@@ -455,11 +455,9 @@ static void hdmi_disconnect(struct omap_dss_device *dssdev,
 static int hdmi_read_edid(struct omap_dss_device *dssdev,
 		u8 *edid, int len)
 {
-	bool need_enable;
+	bool need_enable = !hdmi.core_enabled;
 	int r;
 
-	need_enable = hdmi.core_enabled == false;
-
 	if (need_enable) {
 		r = hdmi_core_enable(dssdev);
 		if (r)
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
