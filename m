Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE6F356C47
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 14:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0966E152;
	Wed,  7 Apr 2021 12:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB1C88DF8
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 10:03:03 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FFfyk2k0DzPnwg;
 Wed,  7 Apr 2021 18:00:14 +0800 (CST)
Received: from localhost.localdomain (10.175.103.91) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 18:02:46 +0800
From: Wei Li <liwei391@huawei.com>
To: <huawei.libin@huawei.com>, Xinliang Liu <xinliang.liu@linaro.org>, "Tian
 Tao" <tiantao6@hisilicon.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Emil Velikov
 <emil.velikov@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 John Stultz <john.stultz@linaro.org>
Subject: [PATCH RESEND -next] drm: kirin: Remove redundant dev_err call in
 ade_hw_ctx_alloc()
Date: Wed, 7 Apr 2021 18:06:10 +0800
Message-ID: <20210407100610.3278802-1-liwei391@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 07 Apr 2021 12:38:30 +0000
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
Cc: Hulk Robot <hulkci@huawei.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wei Li <liwei391@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Li <liwei391@huawei.com>
---
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 6dcf9ec05eec..78a792048c42 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -857,10 +857,8 @@ static void *ade_hw_ctx_alloc(struct platform_device *pdev,
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	ctx->base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(ctx->base)) {
-		DRM_ERROR("failed to remap ade io base\n");
+	if (IS_ERR(ctx->base))
 		return ERR_PTR(-EIO);
-	}
 
 	ctx->reset = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(ctx->reset))

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
