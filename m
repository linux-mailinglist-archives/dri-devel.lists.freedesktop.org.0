Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A56177D3F9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 22:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2873810E28F;
	Tue, 15 Aug 2023 20:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA8210E29E;
 Tue, 15 Aug 2023 20:17:31 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37FJHDvN029298; Tue, 15 Aug 2023 20:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=fo/8vx9iG79UB/hMaDM5BJQ3mB4rzJH4dTXcccXXiyU=;
 b=W08L/7q6wTUWh57TqPMAidIgKdL/aaeSzwF9pIKFfvk4GJlxhK5LxPoeOJfR7B09ILl/
 4rZGwNqQxmoPG6k6upR8DK/wtxhs8zO4fjVVmps4zhbN7bmOvQojelVGCpi2rQG0djDA
 9TszbEK3uNjzn/+iaSS+f2ZXLlotcWEfjfeyQgyhmDLdC7bN49DPutK+asGIrypW+FvL
 apjTL6zi4Zig5SeFlQ6MY/dd0HKb456ePzsosOFx/ONhTU+usXje7qLJvSePkxkaaL3l
 lW88neDaC0V+/8NUkDOX5nDfnIQEM54zEIb0+xrrcDTeco8EqxtGU61D0igYqyeRkbAt IA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sgex38586-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Aug 2023 20:17:09 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37FKH8kZ010530
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Aug 2023 20:17:08 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 15 Aug
 2023 13:17:08 -0700
Message-ID: <4212982a-e5fc-c7f2-1b4f-96f2e1848a74@quicinc.com>
Date: Tue, 15 Aug 2023 13:17:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/13] drm/msm/dpu: use devres-managed allocation for
 MDP TOP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
 <20230730011920.354575-6-dmitry.baryshkov@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230730011920.354575-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: tRXR8fe8Bsy8UO5u0Yoy_gAcasI_gDYT
X-Proofpoint-GUID: tRXR8fe8Bsy8UO5u0Yoy_gAcasI_gDYT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-15_19,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308150183
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



On 7/29/2023 6:19 PM, Dmitry Baryshkov wrote:
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

Hi Dmitry,

Is it possible to put this #include in a common header? Since it seems 
that this is a common change for a lot of patches in this series.

Thanks,

Jessica Zhang

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
> index 6e0643ea4868..d4f4cb402663 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -820,8 +820,6 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
>   
>   	dpu_kms->catalog = NULL;
>   
> -	if (dpu_kms->hw_mdp)
> -		dpu_hw_mdp_destroy(dpu_kms->hw_mdp);
>   	dpu_kms->hw_mdp = NULL;
>   }
>   
> @@ -1091,7 +1089,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
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
