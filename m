Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 375A43803F3
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 09:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EA46EE11;
	Fri, 14 May 2021 07:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985E96EE11
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 07:03:18 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FhKCV5NX9zQnJk;
 Fri, 14 May 2021 14:59:50 +0800 (CST)
Received: from DESKTOP-EFRLNPK.china.huawei.com (10.174.176.189) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Fri, 14 May 2021 15:03:07 +0800
From: Qiheng Lin <linqiheng@huawei.com>
To: <linqiheng@huawei.com>, Phong LE <ple@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>, Robert Foss
 <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH -next] drm: bridge: fix wrong pointer passed to PTR_ERR()
Date: Fri, 14 May 2021 15:03:06 +0800
Message-ID: <20210514070306.606-1-linqiheng@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.189]
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
Cc: Hulk Robot <hulkci@huawei.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PTR_ERR should access the value just tested by IS_ERR, otherwise
the wrong error code will be returned.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index d8a60691fd32..6980c9801d0d 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -943,7 +943,7 @@ static int it66121_probe(struct i2c_client *client,
 	ctx->regmap = devm_regmap_init_i2c(client, &it66121_regmap_config);
 	if (IS_ERR(ctx->regmap)) {
 		ite66121_power_off(ctx);
-		return PTR_ERR(ctx);
+		return PTR_ERR(ctx->regmap);
 	}
 
 	regmap_read(ctx->regmap, IT66121_VENDOR_ID0_REG, &vendor_ids[0]);

