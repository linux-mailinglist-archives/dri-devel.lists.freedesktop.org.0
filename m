Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1AC91C4EA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 19:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A34910ECD5;
	Fri, 28 Jun 2024 17:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="INcBLqV6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB7010ECD5;
 Fri, 28 Jun 2024 17:31:57 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SCPgqK027707;
 Fri, 28 Jun 2024 17:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vQsq95T5PXFOUm6FcZhW0EyM
 ZkZbXS/vatzrf4JXue0=; b=INcBLqV6ORUKFdKOzReLHI6cmVx+RAk/e9okIE8y
 jZuDRzdsfNjC5QqR2/iwhbJ6TURsV/uNgWzJ9kluFgO/lzblnjucy2+NP2H3sV4p
 Aqaqkidf429Jp8tNF3a4h2IY4cmpQbFA5fiIiX8xuhkXn+BDlr/1G6JWiO+12W7w
 s7+QTZNHVypbj1+WCYXwUfTu2qvXAdUkSlE9cWKY9bXdc6nOS7iIdpY/iPukZ6fB
 uOLtsT70hVbWV/m7soAQUPk1bjMo9II06m9GXkZi9gbZxkNefQo+jICzkN4IOlfP
 FIe+2ddUtUbWQ+Lef2pHqRhzxrtmrL2lxjyl8ufNxQwkEg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 401pm32dm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2024 17:31:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45SHVowd011573
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2024 17:31:50 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Jun 2024 10:31:50 -0700
Date: Fri, 28 Jun 2024 10:31:49 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 1/5] drm/msm/adreno: Implement SMEM-based speed bin
Message-ID: <20240628102726231-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240625-topic-smem_speedbin-v4-0-f6f8493ab814@linaro.org>
 <20240625-topic-smem_speedbin-v4-1-f6f8493ab814@linaro.org>
 <20240628101549127-0700.eberman@hu-eberman-lv.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240628101549127-0700.eberman@hu-eberman-lv.qualcomm.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: GfTz67h86_1W1SU4GSH6-oKas-Rjse-E
X-Proofpoint-GUID: GfTz67h86_1W1SU4GSH6-oKas-Rjse-E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_12,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280130
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

On Fri, Jun 28, 2024 at 10:24:52AM -0700, Elliot Berman wrote:
> On Tue, Jun 25, 2024 at 08:28:06PM +0200, Konrad Dybcio wrote:
> > On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
> > abstracted through SMEM, instead of being directly available in a fuse.
> > 
> > Add support for SMEM-based speed binning, which includes getting
> > "feature code" and "product code" from said source and parsing them
> > to form something that lets us match OPPs against.
> > 
> > Due to the product code being ignored in the context of Adreno on
> > production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
> > 
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  8 +++---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c |  2 ++
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 41 +++++++++++++++++++++++++++---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  7 ++++-
> >  4 files changed, 50 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index c98cdb1e9326..8ace096bb68c 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -2124,13 +2124,15 @@ static u32 fuse_to_supp_hw(const struct adreno_info *info, u32 fuse)
> >  	return UINT_MAX;
> >  }
> >  
> > -static int a6xx_set_supported_hw(struct device *dev, const struct adreno_info *info)
> > +static int a6xx_set_supported_hw(struct adreno_gpu *adreno_gpu,
> > +				 struct device *dev,
> > +				 const struct adreno_info *info)
> >  {
> >  	u32 supp_hw;
> >  	u32 speedbin;
> >  	int ret;
> >  
> > -	ret = adreno_read_speedbin(dev, &speedbin);
> > +	ret = adreno_read_speedbin(adreno_gpu, dev, &speedbin);
> >  	/*
> >  	 * -ENOENT means that the platform doesn't support speedbin which is
> >  	 * fine
> > @@ -2290,7 +2292,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
> >  
> >  	a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
> >  
> > -	ret = a6xx_set_supported_hw(&pdev->dev, config->info);
> > +	ret = a6xx_set_supported_hw(adreno_gpu, &pdev->dev, config->info);
> >  	if (ret) {
> >  		a6xx_llc_slices_destroy(a6xx_gpu);
> >  		kfree(a6xx_gpu);
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > index 1e789ff6945e..e514346088f9 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -6,6 +6,8 @@
> >   * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
> >   */
> >  
> > +#include <linux/soc/qcom/socinfo.h>
> > +
> >  #include "adreno_gpu.h"
> >  
> >  bool hang_debug = false;
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index 1c6626747b98..6ffd02f38499 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -21,6 +21,9 @@
> >  #include "msm_gem.h"
> >  #include "msm_mmu.h"
> >  
> > +#include <linux/soc/qcom/smem.h>
> > +#include <linux/soc/qcom/socinfo.h>
> > +
> >  static u64 address_space_size = 0;
> >  MODULE_PARM_DESC(address_space_size, "Override for size of processes private GPU address space");
> >  module_param(address_space_size, ullong, 0600);
> > @@ -1061,9 +1064,39 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
> >  			   adreno_ocmem->hdl);
> >  }
> >  
> > -int adreno_read_speedbin(struct device *dev, u32 *speedbin)
> > +int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
> > +			 struct device *dev, u32 *fuse)
> >  {
> > -	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
> > +	u32 fcode;
> > +	int ret;
> > +
> > +	/*
> > +	 * Try reading the speedbin via a nvmem cell first
> > +	 * -ENOENT means "no nvmem-cells" and essentially means "old DT" or
> > +	 * "nvmem fuse is irrelevant", simply assume it's fine.
> > +	 */
> > +	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", fuse);
> > +	if (!ret)
> > +		return 0;
> > +	else if (ret != -ENOENT)
> > +		return dev_err_probe(dev, ret, "Couldn't read the speed bin fuse value\n");
> > +
> > +#ifdef CONFIG_QCOM_SMEM
> > +	/*
> > +	 * Only check the feature code - the product code only matters for
> > +	 * proto SoCs unavailable outside Qualcomm labs, as far as GPU bin
> > +	 * matching is concerned.
> > +	 *
> > +	 * Ignore EOPNOTSUPP, as not all SoCs expose this info through SMEM.
> > +	 */
> > +	ret = qcom_smem_get_feature_code(&fcode);
> > +	if (!ret)
> > +		*fuse = ADRENO_SKU_ID(fcode);
> > +	else if (ret != -EOPNOTSUPP)
> > +		return dev_err_probe(dev, ret, "Couldn't get feature code from SMEM\n");
> 
> Probably want to update a6xx_set_supported_hw() error handling to ignore
> -EOPNOTSUPP or do:
> 
> 	else /* ret == -EOPNOTSUPP */
> 		return -ENOENT;
> 
> 
> 
> > +#endif
> > +
> > +	return 0;
> 
> I noticed that if SMEM isn't enabled and nvmem returns -ENOENT, we still
> return 0. That could lead to uninitialized access of speedbin in both
> users of adreno_read_speedbin(). Maybe:
> 
> 	return ret;
> 

Ah, I see patch 4 in the series now, but I wonder if we can do something
better so that this patch works without relying on later patch in
series?

> >  }
> >  
> >  int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> > @@ -1102,9 +1135,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> >  			devm_pm_opp_set_clkname(dev, "core");
> >  	}
> >  
> > -	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
> > +	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
> >  		speedbin = 0xffff;
> > -	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
> > +	adreno_gpu->speedbin = speedbin;
> >  
> >  	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
> >  			ADRENO_CHIPID_ARGS(config->chip_id));
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > index cff8ce541d2c..563c08b44624 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -79,6 +79,10 @@ struct adreno_reglist {
> >  
> >  struct adreno_speedbin {
> >  	uint16_t fuse;
> > +/* As of SM8650, PCODE on production SoCs is meaningless wrt the GPU bin */
> > +#define ADRENO_SKU_ID_FCODE		GENMASK(15, 0)
> > +#define ADRENO_SKU_ID(fcode)	(fcode)
> > +
> >  	uint16_t speedbin;
> >  };
> >  
> > @@ -545,7 +549,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
> >  			 struct adreno_smmu_fault_info *info, const char *block,
> >  			 u32 scratch[4]);
> >  
> > -int adreno_read_speedbin(struct device *dev, u32 *speedbin);
> > +int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
> > +			 struct device *dev, u32 *speedbin);
> >  
> >  /*
> >   * For a5xx and a6xx targets load the zap shader that is used to pull the GPU
> > 
> > -- 
> > 2.45.2
> > 
> > 
> 
