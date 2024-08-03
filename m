Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093C1946841
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2024 08:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB67B10E060;
	Sat,  3 Aug 2024 06:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5F610E059
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Aug 2024 06:50:07 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WbXrR2JvgzcdRj;
 Sat,  3 Aug 2024 14:30:31 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
 by mail.maildlp.com (Postfix) with ESMTPS id EADEB1800A4;
 Sat,  3 Aug 2024 14:30:33 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 3 Aug 2024 14:30:32 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <inki.dae@samsung.com>, <sw0312.kim@samsung.com>,
 <kyungmin.park@samsung.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <krzk@kernel.org>, <alim.akhtar@samsung.com>, <xinliang.liu@linaro.org>,
 <tiantao6@hisilicon.com>, <kong.kongxinwei@hisilicon.com>,
 <sumit.semwal@linaro.org>, <yongqin.liu@linaro.org>, <jstultz@google.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <anitha.chrisanthus@intel.com>,
 <edmund.j.dea@intel.com>, <cuigaosheng1@huawei.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-samsung-soc@vger.kernel.org>
Subject: [PATCH -next 3/3] drm/kmb: Add missing clk_disable_unprepare in
 kmb_dsi_clk_enable
Date: Sat, 3 Aug 2024 14:30:30 +0800
Message-ID: <20240803063030.316390-4-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240803063030.316390-1-cuigaosheng1@huawei.com>
References: <20240803063030.316390-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200011.china.huawei.com (7.221.188.251)
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

Add the missing clk_disable_unprepare() before return in
kmb_dsi_clk_enable().

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index cf7cf0b07541..02141ac593c6 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -1494,12 +1494,15 @@ static int kmb_dsi_clk_enable(struct kmb_dsi *kmb_dsi)
 	ret = clk_prepare_enable(kmb_dsi->clk_mipi_ecfg);
 	if (ret) {
 		dev_err(dev, "Failed to enable MIPI_ECFG clock: %d\n", ret);
+		clk_disable_unprepare(kmb_dsi->clk_mipi);
 		return ret;
 	}
 
 	ret = clk_prepare_enable(kmb_dsi->clk_mipi_cfg);
 	if (ret) {
 		dev_err(dev, "Failed to enable MIPI_CFG clock: %d\n", ret);
+		clk_disable_unprepare(kmb_dsi->clk_mipi);
+		clk_disable_unprepare(kmb_dsi->clk_mipi_ecfg);
 		return ret;
 	}
 
-- 
2.25.1

