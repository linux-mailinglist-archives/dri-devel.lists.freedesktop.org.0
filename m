Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 728A8976451
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 10:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A5310EB11;
	Thu, 12 Sep 2024 08:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA35110E209;
 Thu, 12 Sep 2024 08:21:18 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X49PY5WvQz20nnp;
 Thu, 12 Sep 2024 16:21:05 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id B04AB1A0188;
 Thu, 12 Sep 2024 16:21:12 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Sep
 2024 16:21:11 +0800
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
Subject: [PATCH v2 0/5] drm: Use IRQF_NO_AUTOEN flag in request_irq()
Date: Thu, 12 Sep 2024 16:30:15 +0800
Message-ID: <20240912083020.3720233-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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

As commit cbe16f35bee6 ("genirq: Add IRQF_NO_AUTOEN for request_irq/nmi()")
said, reqeust_irq() and then disable_irq() is unsafe. In the small time gap
between request_irq() and disable_irq(), interrupts can still come.

IRQF_NO_AUTOEN flag can be used by drivers to request_irq(). It prevents
the automatic enabling of the requested interrupt in the same
safe way. With that the usage can be simplified and corrected.

Compile-tested only.

Changes in v2:
- Correct the commit subject.
- Add reviewed-by.

Jinjie Ruan (5):
  drm/imx: Use IRQF_NO_AUTOEN flag in request_irq()
  drm/imx/dcss: Use IRQF_NO_AUTOEN flag in request_irq()
  drm/imx/ipuv3: Use IRQF_NO_AUTOEN flag in request_irq()
  drm/tegra: dpaux: Use IRQF_NO_AUTOEN flag in request_irq()
  drm/msm/adreno: Use IRQF_NO_AUTOEN flag in request_irq()

 drivers/gpu/drm/imx/dcss/dcss-crtc.c   | 6 ++----
 drivers/gpu/drm/imx/dcss/dcss-dtg.c    | 4 +---
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c | 6 ++----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c  | 4 +---
 drivers/gpu/drm/tegra/dpaux.c          | 4 +---
 5 files changed, 7 insertions(+), 17 deletions(-)

-- 
2.34.1

