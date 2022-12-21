Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B18F6534C9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 18:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1D010E471;
	Wed, 21 Dec 2022 17:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9F310E46C;
 Wed, 21 Dec 2022 17:14:49 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BLFoDYx000705; Wed, 21 Dec 2022 17:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=4avUJ6eT6timfJ1oT1Ic5+SQBnl6DCVHXqurbLuTIjU=;
 b=enR0vUNM6d411SUapf5V/w9eIOvvGN1vGnlpRxWg2F/fUaBU+WtBKCQQ98+tN+VH/Run
 XjzZucGSNp/8leHl10CUlVLdLIpSxJ2OOdomkZa5y1ArfDyvauaxtCS9XwVEUVfM00bD
 la4iGiiyNeiyDGAg+d/eNvYwywyeWYNweMxYSpP1cRqzOdhTeetvzNf8pvCc8trRmCj+
 rhmuDGiK3mPp1bBaZt1Ob1yTpeNdTzMIXuALIFmvGjEbt5dzDXTe+N3Du9EPuH2g8rn9
 lNBUBOHfJSO8UmjOOi1qz/3AO89Ea4J0Q7EKPkCsZl8I9EzZu5fZ3NUffXAo0d1VphBu 6w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mk39tchgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 17:14:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BLHEeMV029060
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 17:14:40 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 21 Dec 2022 09:14:35 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 3/5] drm/msm/a6xx: Vote for cx gdsc from gpu driver
Date: Wed, 21 Dec 2022 22:44:01 +0530
Message-ID: <20221221224338.v4.3.I7f545d8494dcdbe6e96a15fbe8aaf5bb0c003d50@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1671642843-5244-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1671642843-5244-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 2HDALvqm5Je2bXabPzwHXwjqmaDuvPUM
X-Proofpoint-GUID: 2HDALvqm5Je2bXabPzwHXwjqmaDuvPUM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_09,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210144
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
Cc: linux-kernel@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Douglas
 Anderson <dianders@chromium.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a device has multiple power domains, dev->power_domain is left
empty during probe. That didn't cause any issue so far because we are
freeloading on smmu driver's vote on cx gdsc. Instead of that, create
a device_link between cx genpd device and gmu device to keep a vote from
gpu driver.

Before this patch:
localhost ~ # cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
gx_gdsc		on		0
    /devices/genpd:1:3d6a000.gmu		active		0
cx_gdsc		on		0
    /devices/platform/soc@0/3da0000.iommu	active		0

After this patch:
localhost ~ # cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
gx_gdsc		on		0
    /devices/genpd:1:3d6a000.gmu		active		0
cx_gdsc		on		0
    /devices/platform/soc@0/3da0000.iommu	active		0
    /devices/genpd:0:3d6a000.gmu		active		0

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

(no changes since v1)

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 31 +++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 6484b97c5344..1580d0090f35 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1479,6 +1479,12 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 
 	pm_runtime_force_suspend(gmu->dev);
 
+	/*
+	 * Since cxpd is a virt device, the devlink with gmu-dev will be removed
+	 * automatically when we do detach
+	 */
+	dev_pm_domain_detach(gmu->cxpd, false);
+
 	if (!IS_ERR_OR_NULL(gmu->gxpd)) {
 		pm_runtime_disable(gmu->gxpd);
 		dev_pm_domain_detach(gmu->gxpd, false);
@@ -1605,8 +1611,10 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 	if (adreno_is_a650_family(adreno_gpu)) {
 		gmu->rscc = a6xx_gmu_get_mmio(pdev, "rscc");
-		if (IS_ERR(gmu->rscc))
+		if (IS_ERR(gmu->rscc)) {
+			ret = -ENODEV;
 			goto err_mmio;
+		}
 	} else {
 		gmu->rscc = gmu->mmio + 0x23000;
 	}
@@ -1615,8 +1623,22 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->hfi_irq = a6xx_gmu_get_irq(gmu, pdev, "hfi", a6xx_hfi_irq);
 	gmu->gmu_irq = a6xx_gmu_get_irq(gmu, pdev, "gmu", a6xx_gmu_irq);
 
-	if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0)
+	if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0) {
+		ret = -ENODEV;
+		goto err_mmio;
+	}
+
+	gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
+	if (IS_ERR(gmu->cxpd)) {
+		ret = PTR_ERR(gmu->cxpd);
 		goto err_mmio;
+	}
+
+	if (!device_link_add(gmu->dev, gmu->cxpd,
+					DL_FLAG_PM_RUNTIME)) {
+		ret = -ENODEV;
+		goto detach_cxpd;
+	}
 
 	/*
 	 * Get a link to the GX power domain to reset the GPU in case of GMU
@@ -1634,6 +1656,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 	return 0;
 
+detach_cxpd:
+	dev_pm_domain_detach(gmu->cxpd, false);
+
 err_mmio:
 	iounmap(gmu->mmio);
 	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
@@ -1641,8 +1666,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	free_irq(gmu->gmu_irq, gmu);
 	free_irq(gmu->hfi_irq, gmu);
 
-	ret = -ENODEV;
-
 err_memory:
 	a6xx_gmu_memory_free(gmu);
 err_put_device:
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index e034935b3986..5a42dd4dd31f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -56,6 +56,7 @@ struct a6xx_gmu {
 	int gmu_irq;
 
 	struct device *gxpd;
+	struct device *cxpd;
 
 	int idle_level;
 
-- 
2.7.4

