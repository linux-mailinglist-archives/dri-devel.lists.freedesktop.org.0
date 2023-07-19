Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6AC758A0F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 02:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2520B10E3E6;
	Wed, 19 Jul 2023 00:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B7910E3E6;
 Wed, 19 Jul 2023 00:26:46 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36J0JMdb003183; Wed, 19 Jul 2023 00:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Mxyi0HIz9yq8P4IvPcNaqV6V72p9VWJxpn7Bfar0FZE=;
 b=dBzHOlvJKJx04JdLpXcDYOtxZ0/wZCH1pmnhLi+7/N1vCB1V6+XAoDdblv0mqKpcFRuP
 NW2oqZK9Je8mYjhMezqhgfXQgGtd8WoRmrcFESKYOo42e71K9dLMDHLqE8rocATgoryL
 WosC5drMfBPK9BJKi4Ew8N1KMhUxD88G+4rvF43sSk1vSpp7V8zo61BUDdkm0CBaxD5j
 OE7pwm/pkD4/cLTngR2TTW4Q7SDcj4DD3zIvakqSYaQ5cZHJ7ubTQW8kvtgDD3e57qLB
 mRRKyzdb6HoQpKM9+3Vzl+mFNBVd331019oxs4nQkQ9Y4ikfWv7BUe14cqnXGPoWm3oH Sw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rwn90a5nk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jul 2023 00:26:39 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36J0Q3YD025795
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jul 2023 00:26:03 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 18 Jul
 2023 17:26:02 -0700
Message-ID: <58641e88-3917-0a8e-dd6d-38af76842a08@quicinc.com>
Date: Tue, 18 Jul 2023 17:26:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/13] drm/msm/dpu: use devres-managed allocation for
 interrupts data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
 <20230707231251.3849701-4-dmitry.baryshkov@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230707231251.3849701-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: CclvzBO5Y7BMtIA2U7SsUCgiNhzPPr7d
X-Proofpoint-ORIG-GUID: CclvzBO5Y7BMtIA2U7SsUCgiNhzPPr7d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-18_18,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 adultscore=0 mlxlogscore=838
 lowpriorityscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307190002
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
> Use devm_kzalloc to create interrupts data structure. This allows us to
> remove corresponding kfree and drop dpu_hw_intr_destroy() function.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 14 ++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 11 ++++-------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |  4 +---
>   3 files changed, 11 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 5e2d68ebb113..945f34736206 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -6,6 +6,8 @@
>   #include <linux/debugfs.h>
>   #include <linux/slab.h>
>   
> +#include <drm/drm_managed.h>
> +
>   #include "dpu_core_irq.h"
>   #include "dpu_kms.h"
>   #include "dpu_hw_interrupts.h"
> @@ -441,8 +443,9 @@ static void __intr_offset(const struct dpu_mdss_cfg *m,
>   	hw->blk_addr = addr + m->mdp[0].base;
>   }
>   
> -struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
> -		const struct dpu_mdss_cfg *m)
> +struct dpu_hw_intr *dpu_hw_intr_init(struct drm_device *dev,
> +				     void __iomem *addr,
> +				     const struct dpu_mdss_cfg *m)
>   {
>   	struct dpu_hw_intr *intr;
>   	int nirq = MDP_INTR_MAX * 32;
> @@ -450,7 +453,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
>   	if (!addr || !m)
>   		return ERR_PTR(-EINVAL);
>   
> -	intr = kzalloc(struct_size(intr, irq_tbl, nirq), GFP_KERNEL);
> +	intr = drmm_kzalloc(dev, struct_size(intr, irq_tbl, nirq), GFP_KERNEL);
>   	if (!intr)
>   		return ERR_PTR(-ENOMEM);
>   
> @@ -465,11 +468,6 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
>   	return intr;
>   }
>   
> -void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
> -{
> -	kfree(intr);
> -}
> -
>   int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>   		void (*irq_cb)(void *arg, int irq_idx),
>   		void *irq_arg)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index 1f2dabc54c22..b0d7bb073203 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -70,15 +70,12 @@ struct dpu_hw_intr {
>   
>   /**
>    * dpu_hw_intr_init(): Initializes the interrupts hw object
> + * @dev:  Corresponding device for devres management
>    * @addr: mapped register io address of MDP
>    * @m:    pointer to MDSS catalog data
>    */
> -struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
> -		const struct dpu_mdss_cfg *m);
> +struct dpu_hw_intr *dpu_hw_intr_init(struct drm_device *dev,
> +				     void __iomem *addr,
> +				     const struct dpu_mdss_cfg *m);
>   
> -/**
> - * dpu_hw_intr_destroy(): Cleanup interrutps hw object
> - * @intr: pointer to interrupts hw object
> - */
> -void dpu_hw_intr_destroy(struct dpu_hw_intr *intr);
>   #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 85b8c9cc99ef..ef232dc838c7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -807,8 +807,6 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
>   {
>   	int i;
>   
> -	if (dpu_kms->hw_intr)
> -		dpu_hw_intr_destroy(dpu_kms->hw_intr);
>   	dpu_kms->hw_intr = NULL;
>   
>   	/* safe to call these more than once during shutdown */
> @@ -1095,7 +1093,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   		goto err_pm_put;
>   	}
>   
> -	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
> +	dpu_kms->hw_intr = dpu_hw_intr_init(dev, dpu_kms->mmio, dpu_kms->catalog);
>   	if (IS_ERR(dpu_kms->hw_intr)) {
>   		rc = PTR_ERR(dpu_kms->hw_intr);
>   		DPU_ERROR("hw_intr init failed: %d\n", rc);
> -- 
> 2.39.2
> 
