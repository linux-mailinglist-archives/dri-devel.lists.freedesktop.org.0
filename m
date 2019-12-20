Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D530212739A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 03:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2948A6EBC2;
	Fri, 20 Dec 2019 02:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 925 seconds by postgrey-1.36 at gabe;
 Fri, 20 Dec 2019 02:45:46 UTC
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE9B6EBC2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 02:45:45 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 509A5CCE8BDE5E122AD5;
 Fri, 20 Dec 2019 10:30:19 +0800 (CST)
Received: from localhost (10.45.92.44) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Fri, 20 Dec 2019
 10:30:10 +0800
From: Zhihui Chen <chenzhihui4@huawei.com>
To: <chenzhihui244@msn.com>, <xinliang.liu@linaro.org>,
 <zourongrong@gmail.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/hisilicon/hibmc: fix 'xset dpms force off' fail
Date: Fri, 20 Dec 2019 10:30:04 +0800
Message-ID: <20191220023004.2658-1-chenzhihui4@huawei.com>
X-Mailer: git-send-email 2.24.1.windows.2
MIME-Version: 1.0
X-Originating-IP: [10.45.92.44]
X-CFilter-Loop: Reflected
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
Cc: puck.chen@hisilicon.com, kong.kongxinwei@hisilicon.com, baowenyi@huawei.com,
 Zhihui Chen <chenzhihui4@huawei.com>, allan.wang@siliconmotion.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

both crtc_state->adjusted_mode.hdisplay and
crtc_state->adjusted_mode.vdisplay are 0 when switch dpms off,
return -EINVAL cause switch dpms off fail.

Signed-off-by: Zhihui Chen <chenzhihui4@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index 6527a97f68a3..722e369f30d4 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -80,6 +80,9 @@ static int hibmc_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
+	if (!crtc_state->enable)
+		return 0;
+
 	if (state->crtc_x + state->crtc_w >
 	    crtc_state->adjusted_mode.hdisplay ||
 	    state->crtc_y + state->crtc_h >
-- 
2.20.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
