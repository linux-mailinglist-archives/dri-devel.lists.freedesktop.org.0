Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0E0976452
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 10:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFBC10EB01;
	Thu, 12 Sep 2024 08:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A20C10EB01;
 Thu, 12 Sep 2024 08:21:20 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4X49NR4G6zz16PZH;
 Thu, 12 Sep 2024 16:20:07 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 596311800A0;
 Thu, 12 Sep 2024 16:21:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Sep
 2024 16:21:14 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <laurentiu.palcu@oss.nxp.com>, <l.stach@pengutronix.de>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <festevam@gmail.com>, <p.zabel@pengutronix.de>, <robdclark@gmail.com>,
 <sean@poorly.run>, <konradybcio@kernel.org>, <quic_abhinavk@quicinc.com>,
 <dmitry.baryshkov@linaro.org>, <marijn.suijten@somainline.org>,
 <thierry.reding@gmail.com>, <mperttunen@nvidia.com>, <jonathanh@nvidia.com>,
 <agx@sigxcpu.org>, <gregkh@linuxfoundation.org>, <jordan@cosmicpenguin.net>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2 3/5] drm/imx/ipuv3: Use IRQF_NO_AUTOEN flag in request_irq()
Date: Thu, 12 Sep 2024 16:30:18 +0800
Message-ID: <20240912083020.3720233-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912083020.3720233-1-ruanjinjie@huawei.com>
References: <20240912083020.3720233-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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

disable_irq() after request_irq() still has a time gap in which
interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
disable IRQ auto-enable when request IRQ.

Fixes: 47b1be5c0f4e ("staging: imx/drm: request irq only after adding the crtc")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Add Reviewed-by.
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
index ef29c9a61a46..99db53e167bd 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
@@ -410,14 +410,12 @@ static int ipu_drm_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	ipu_crtc->irq = ipu_plane_irq(ipu_crtc->plane[0]);
-	ret = devm_request_irq(ipu_crtc->dev, ipu_crtc->irq, ipu_irq_handler, 0,
-			"imx_drm", ipu_crtc);
+	ret = devm_request_irq(ipu_crtc->dev, ipu_crtc->irq, ipu_irq_handler,
+			       IRQF_NO_AUTOEN, "imx_drm", ipu_crtc);
 	if (ret < 0) {
 		dev_err(ipu_crtc->dev, "irq request failed with %d.\n", ret);
 		return ret;
 	}
-	/* Only enable IRQ when we actually need it to trigger work. */
-	disable_irq(ipu_crtc->irq);
 
 	return 0;
 }
-- 
2.34.1

