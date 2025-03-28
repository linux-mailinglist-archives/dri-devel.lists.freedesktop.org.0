Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BDFA745E3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 10:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EFE10E3BC;
	Fri, 28 Mar 2025 09:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 74864 seconds by postgrey-1.36 at gabe;
 Fri, 28 Mar 2025 09:00:53 UTC
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7BA10E3BC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 09:00:53 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZPDyP6Hmsz5B1J5;
 Fri, 28 Mar 2025 17:00:45 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
 by mse-fl2.zte.com.cn with SMTP id 52S90OpQ000912;
 Fri, 28 Mar 2025 17:00:24 +0800 (+08)
 (envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null]) by mapi (Zmail) with MAPI id mid32;
 Fri, 28 Mar 2025 17:00:26 +0800 (CST)
Date: Fri, 28 Mar 2025 17:00:26 +0800 (CST)
X-Zmail-TransId: 2afc67e6652affffffffc56-b98be
X-Mailer: Zmail v1.0
Message-ID: <202503281700265542u_5j7eZjBf05CqIqnYKa@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <laurent.pinchart@ideasonboard.com>
Cc: <tomi.valkeinen@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <yang.yang29@zte.com.cn>,
 <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>, <zhang.enpei@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0veGxueDogenlucW1wX2RwOiBVc2UgZGV2X2Vycl9wcm9iZSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 52S90OpQ000912
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67E6653D.003/4ZPDyP6Hmsz5B1J5
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

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Replace the open-code with dev_err_probe() to simplify the code.

Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index a6a4a871f197..28efa4c7ec8e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -2466,10 +2466,8 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)

 	dp->reset = devm_reset_control_get(dp->dev, NULL);
 	if (IS_ERR(dp->reset)) {
-		if (PTR_ERR(dp->reset) != -EPROBE_DEFER)
-			dev_err(dp->dev, "failed to get reset: %ld\n",
-				PTR_ERR(dp->reset));
-		ret = PTR_ERR(dp->reset);
+		ret = dev_err_probe(dp->dev, PTR_ERR(dp->reset),
+				    "failed to get reset\n");
 		goto err_free;
 	}

-- 
2.25.1
