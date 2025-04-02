Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78682A78D43
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 13:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C485810E758;
	Wed,  2 Apr 2025 11:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E9910E758
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 11:38:59 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZSNDZ1dp8z51SWn;
 Wed,  2 Apr 2025 19:38:54 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
 by mse-fl2.zte.com.cn with SMTP id 532BcnQq016861;
 Wed, 2 Apr 2025 19:38:50 +0800 (+08)
 (envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid32;
 Wed, 2 Apr 2025 19:38:52 +0800 (CST)
Date: Wed, 2 Apr 2025 19:38:52 +0800 (CST)
X-Zmail-TransId: 2af967ed21cc086-26975
X-Mailer: Zmail v1.0
Message-ID: <20250402193852834atJ7eho66TlnKOIMSvpfr@zte.com.cn>
In-Reply-To: <20250402193656279azy9TKahAE5TQ5-i4XCQT@zte.com.cn>
References: 20250402193656279azy9TKahAE5TQ5-i4XCQT@zte.com.cn
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <thierry.reding@gmail.com>, <laurent.pinchart@ideasonboard.com>
Cc: <mperttunen@nvidia.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <jonathanh@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <michal.simek@amd.com>,
 <linux-arm-kernel@lists.infradead.org>, <yang.yang29@zte.com.cn>,
 <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>, <zhang.enpei@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHQgMi8yXSBncHU6IGRybTogeGxueDogenlucW1wX2RwOiBVc2UgZGV2X2Vycl9wcm9iZSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 532BcnQq016861
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67ED21CE.000/4ZSNDZ1dp8z51SWn
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
