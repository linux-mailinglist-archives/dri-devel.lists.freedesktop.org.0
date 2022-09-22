Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 022695E67F7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 18:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD1110EC5F;
	Thu, 22 Sep 2022 16:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF22F10EB1A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 13:17:39 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MYG124Yj8zMpRQ;
 Thu, 22 Sep 2022 21:12:54 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 21:17:37 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 22 Sep
 2022 21:17:36 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <heiko@sntech.de>, <hjc@rock-chips.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-rockchip@lists.infradead.org>
Subject: [PATCH -next 1/2] drm/rockchip: vop: fix PM usage counter unbalance
 in vop ops
Date: Thu, 22 Sep 2022 21:21:06 +0800
Message-ID: <20220922132107.105419-2-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
In-Reply-To: <20220922132107.105419-1-zhangqilong3@huawei.com>
References: <20220922132107.105419-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 22 Sep 2022 16:00:00 +0000
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

pm_runtime_get_sync will increment pm usage counter even it failed.
Forgetting to putting operation will result in reference leak here.
We fix it by replacing it with the newest pm_runtime_resume_and_get
to keep usage counter balanced.

Fixes:5e570373c015b ("drm/rockchip: vop: Enable pm domain before vop_initial")
Fixes:604be85547ce4 ("drm/rockchip: Add VOP2 driver")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index c356de5dd220..fa1f4ee6d195 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -602,7 +602,7 @@ static int vop_enable(struct drm_crtc *crtc, struct drm_crtc_state *old_state)
 	struct vop *vop = to_vop(crtc);
 	int ret, i;
 
-	ret = pm_runtime_get_sync(vop->dev);
+	ret = pm_runtime_resume_and_get(vop->dev);
 	if (ret < 0) {
 		DRM_DEV_ERROR(vop->dev, "failed to get pm runtime: %d\n", ret);
 		return ret;
@@ -1983,7 +1983,7 @@ static int vop_initial(struct vop *vop)
 		return PTR_ERR(vop->dclk);
 	}
 
-	ret = pm_runtime_get_sync(vop->dev);
+	ret = pm_runtime_resume_and_get(vop->dev);
 	if (ret < 0) {
 		DRM_DEV_ERROR(vop->dev, "failed to get pm runtime: %d\n", ret);
 		return ret;
-- 
2.25.1

