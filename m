Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA97E2CB6AA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5966EA12;
	Wed,  2 Dec 2020 08:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606CB6E526
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 12:47:14 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ClhgM5frgzkjvg;
 Tue,  1 Dec 2020 20:46:39 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Tue, 1 Dec 2020 20:47:01 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?=
 <heiko@sntech.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH 1/3] drm/rockchip: cdn-dp: fix reference leak when
 pm_runtime_get_sync fails
Date: Tue, 1 Dec 2020 20:54:57 +0800
Message-ID: <20201201125459.142178-2-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201201125459.142178-1-miaoqinglang@huawei.com>
References: <20201201125459.142178-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
Cc: linux-rockchip@lists.infradead.org, Qinglang Miao <miaoqinglang@huawei.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PM reference count is not expected to be incremented on
return in cdn_dp_clk_enable.

However, pm_runtime_get_sync will increment the PM reference
count even failed. Forgetting to putting operation will result
in a reference leak here.

Replace it with pm_runtime_resume_and_get to keep usage
counter balanced.

Fixes: efe0220fc2d2 ("drm/rockchip: cdn-dp: Fix error handling")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index a4a45daf9..9b4406191 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -98,7 +98,7 @@ static int cdn_dp_clk_enable(struct cdn_dp_device *dp)
 		goto err_core_clk;
 	}
 
-	ret = pm_runtime_get_sync(dp->dev);
+	ret = pm_runtime_resume_and_get(dp->dev);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dp->dev, "cannot get pm runtime %d\n", ret);
 		goto err_pm_runtime_get;
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
