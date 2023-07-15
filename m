Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AD17545DB
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 02:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6279F10E392;
	Sat, 15 Jul 2023 00:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3718810E392;
 Sat, 15 Jul 2023 00:55:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36F0tcoY015699; Sat, 15 Jul 2023 00:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Y5K2x89Knm0EIBxquog860okc5aOnykb7ma56/x02W4=;
 b=CN8pbUAk+Q7H4KdBbXyDZFAxGDf743ARTtBmydAxIAwRp6FxGWCUiy3z6lySh6umtMtO
 /NKslinxwYLciUfFFGe+MxA9LG5ZNRaEnpinlNW2Jpx8J8BttYDl/iFH737nXHboa4hO
 9UGrA/LAnlf8epsb43kSeNvpxy9YaIh/y3YHpf9fk3uboBZBQTh9wS1Kqpsnggw155HO
 n8E+dAy3dcU+T6WCdiPRvt33WSmTtxvs9Mhr3Sb7+HLMOLtJEDO/fSSlgvUH7em9Tk4G
 bAPFRs+ya63cWLgGjJkFdlp7Bdn2kDjvDb7jvwyFp47+mkiVabNzrXzRtE0sE56tdS0x +Q== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtptr34md-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Jul 2023 00:55:38 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36F0tbEA029686
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Jul 2023 00:55:37 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 14 Jul
 2023 17:55:37 -0700
Message-ID: <e43d9c1a-1e8f-d030-1e5a-975a238da394@quicinc.com>
Date: Fri, 14 Jul 2023 17:55:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 05/13] drm/msm/dpu: use devres-managed allocation for
 MDP TOP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
 <20230707231251.3849701-6-dmitry.baryshkov@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230707231251.3849701-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: unJMWeSoOcnpV6ttUXK_U9NYHGr8vqyi
X-Proofpoint-GUID: unJMWeSoOcnpV6ttUXK_U9NYHGr8vqyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_12,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=989
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307150007
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/7/2023 4:12 PM, Dmitry Baryshkov wrote:
> Use devm_kzalloc to create MDP TOP structure. This allows us to remove
> corresponding kfree and drop dpu_hw_mdp_destroy() function.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 17 +++++++----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h |  8 +++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    |  5 ++---
>   3 files changed, 14 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index cff48763ce25..481b373d9ccb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -2,6 +2,8 @@
>   /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>    */
>   
> +#include <drm/drm_managed.h>
> +
>   #include "dpu_hwio.h"
>   #include "dpu_hw_catalog.h"
>   #include "dpu_hw_top.h"
> @@ -268,16 +270,17 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>   		ops->intf_audio_select = dpu_hw_intf_audio_select;
>   }
>   
> -struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
> -		void __iomem *addr,
> -		const struct dpu_mdss_cfg *m)
> +struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
> +				      const struct dpu_mdp_cfg *cfg,
> +				      void __iomem *addr,
> +				      const struct dpu_mdss_cfg *m)
>   {
>   	struct dpu_hw_mdp *mdp;
>   
>   	if (!addr)
>   		return ERR_PTR(-EINVAL);
>   
> -	mdp = kzalloc(sizeof(*mdp), GFP_KERNEL);
> +	mdp = drmm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
>   	if (!mdp)
>   		return ERR_PTR(-ENOMEM);
>   
> @@ -292,9 +295,3 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
>   
>   	return mdp;
>   }
> -
> -void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp)
> -{
> -	kfree(mdp);
> -}
> -
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> index 8b1463d2b2f0..6f3dc98087df 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> @@ -145,13 +145,15 @@ struct dpu_hw_mdp {
>   
>   /**
>    * dpu_hw_mdptop_init - initializes the top driver for the passed config
> + * @dev:  Corresponding device for devres management
>    * @cfg:  MDP TOP configuration from catalog
>    * @addr: Mapped register io address of MDP
>    * @m:    Pointer to mdss catalog data
>    */
> -struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
> -		void __iomem *addr,
> -		const struct dpu_mdss_cfg *m);
> +struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
> +				      const struct dpu_mdp_cfg *cfg,
> +				      void __iomem *addr,
> +				      const struct dpu_mdss_cfg *m);
>   
>   void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp);
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index f7723f89cbbc..48c3f8b6b88f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -822,8 +822,6 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
>   
>   	dpu_kms->catalog = NULL;
>   
> -	if (dpu_kms->hw_mdp)
> -		dpu_hw_mdp_destroy(dpu_kms->hw_mdp);

Hi Dmitry,

This section is causing a merge conflict for me. Seems that your working 
branch is missing a section of code [1]:

```
...

if (dpu_kms->vbif[VBIF_NRT])
		devm_iounmap(&dpu_kms->pdev->dev, dpu_kms->vbif[VBIF_NRT]);
	dpu_kms->vbif[VBIF_NRT] = NULL;

	if (dpu_kms->vbif[VBIF_RT])
		devm_iounmap(&dpu_kms->pdev->dev, dpu_kms->vbif[VBIF_RT]);
	dpu_kms->vbif[VBIF_RT] = NULL;
...

```

Unfortunately, I'm unable to find which series removed it. Can you list 
the relevant series as a dependency?

Thanks,

Jessica Zhang

[1] 
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c#L812

>   	dpu_kms->hw_mdp = NULL;
>   }
>   
> @@ -1051,7 +1049,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   
>   	dpu_kms->rm_init = true;
>   
> -	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dpu_kms->catalog->mdp,
> +	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dev,
> +					     dpu_kms->catalog->mdp,
>   					     dpu_kms->mmio,
>   					     dpu_kms->catalog);
>   	if (IS_ERR(dpu_kms->hw_mdp)) {
> -- 
> 2.39.2
> 
