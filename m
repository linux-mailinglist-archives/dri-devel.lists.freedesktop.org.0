Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F32A78D3F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 13:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCB910E757;
	Wed,  2 Apr 2025 11:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (unknown [63.216.63.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D520810E757
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 11:38:14 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZSNCZ1ljTz8R040;
 Wed,  2 Apr 2025 19:38:02 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
 by mse-fl2.zte.com.cn with SMTP id 532BbtVE016283;
 Wed, 2 Apr 2025 19:37:55 +0800 (+08)
 (envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null]) by mapi (Zmail) with MAPI id mid32;
 Wed, 2 Apr 2025 19:37:58 +0800 (CST)
Date: Wed, 2 Apr 2025 19:37:58 +0800 (CST)
X-Zmail-TransId: 2afb67ed2196483-1bd7d
X-Mailer: Zmail v1.0
Message-ID: <20250402193758365XauggSF2EWBYY-e_jgNch@zte.com.cn>
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
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHQgMS8yXSBncHU6IGRybTogdGVncmE6IGRwYXV4OiBVc2UgZGV2X2Vycl9wcm9iZSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 532BbtVE016283
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67ED219A.003/4ZSNCZ1ljTz8R040
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
 drivers/gpu/drm/tegra/dpaux.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 2cd8dcb959c0..e5297ac5c0fc 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -501,14 +501,9 @@ static int tegra_dpaux_probe(struct platform_device *pdev)

 	dpaux->vdd = devm_regulator_get_optional(&pdev->dev, "vdd");
 	if (IS_ERR(dpaux->vdd)) {
-		if (PTR_ERR(dpaux->vdd) != -ENODEV) {
-			if (PTR_ERR(dpaux->vdd) != -EPROBE_DEFER)
-				dev_err(&pdev->dev,
-					"failed to get VDD supply: %ld\n",
-					PTR_ERR(dpaux->vdd));
-
-			return PTR_ERR(dpaux->vdd);
-		}
+		if (PTR_ERR(dpaux->vdd) != -ENODEV)
+			return dev_err_probe(&pdev->dev, PTR_ERR(dpaux->vdd),
+					     "failed to get VDD supply\n");

 		dpaux->vdd = NULL;
 	}
-- 
2.25.1
