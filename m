Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4876A5AA18E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 23:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE9F10E333;
	Thu,  1 Sep 2022 21:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFBD10E333;
 Thu,  1 Sep 2022 21:37:40 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 281JHWi4018918;
 Thu, 1 Sep 2022 21:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LevqhUuWD1J9uonqMLIeQZ8iSl9I2MiO8O8i/ay53F4=;
 b=almQ0uCgm1HwMhoJ04p3iDgav/C3FglkrTOQyQxmTlPUwU40zgoWu77Ex/ibDFXjODq/
 m154WQvtqKIzdU+4YDI4rtqvAHjt6d64hKSDZ/vhQrXR3O4WghCPFBQlXdExsmzZzfoh
 qhiNhji/GuV/rcI2/A0DViUcb4xfUHGkkv4uOIrj3irZzLxIJW2iMV0x3XXwxvnIYJ+E
 IiLe6hLgANbPOF3fMjyoABtPjXf8/+o4ca28pzZnTsQZU9XosjGJ4uM3ZCHnvHMtVhrH
 Pri9p4hXvKcvroBPXRuC8Z3JTe5tmNG8aiO7lZihfK+ouCG7eosZY+oIok8DEPNldDrR sA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jabgcw6st-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 21:37:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 281LbYOp009925
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Sep 2022 21:37:34 GMT
Received: from [10.111.173.210] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 1 Sep 2022
 14:37:32 -0700
Message-ID: <9627ff41-6bd8-e380-0e8e-438aecdb824f@quicinc.com>
Date: Thu, 1 Sep 2022 14:37:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 2/4] drm/msm/dpu: move resource allocation to the
 _probe function
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
 <20220620213054.1872954-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220620213054.1872954-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: rTBI604HoyFyxizXuxdSl7Ms1-zoxLIG
X-Proofpoint-GUID: rTBI604HoyFyxizXuxdSl7Ms1-zoxLIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_12,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010094
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/20/2022 2:30 PM, Dmitry Baryshkov wrote:
> To let the probe function bail early if any of the resources is
> unavailable, move resource allocattion from kms_init directly to the
  allocation
> probe callback. While we are at it, replace irq_of_parse_and_map() with
> platform_get_irq().
Any specific reason to replace this?
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

With those two addressed,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 62 +++++++++++++------------
>   1 file changed, 32 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ae13a3a5d8a5..756be04d804b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1206,31 +1206,13 @@ static int dpu_kms_init(struct drm_device *ddev)
>   	struct device *dev = ddev->dev;
>   	struct platform_device *pdev = to_platform_device(dev);
>   	struct dpu_kms *dpu_kms;
> -	int irq;
>   	struct dev_pm_opp *opp;
>   	int ret = 0;
>   	unsigned long max_freq = ULONG_MAX;
>   
> -	dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
> +	dpu_kms = to_dpu_kms(priv->kms);
>   	if (!dpu_kms)
> -		return -ENOMEM;
> -
> -	ret = devm_pm_opp_set_clkname(dev, "core");
> -	if (ret)
> -		return ret;
> -	/* OPP table is optional */
> -	ret = devm_pm_opp_of_add_table(dev);
> -	if (ret && ret != -ENODEV) {
> -		dev_err(dev, "invalid OPP table in device tree\n");
> -		return ret;
> -	}
> -
> -	ret = devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
> -	if (ret < 0) {
> -		DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
> -		return ret;
> -	}
> -	dpu_kms->num_clocks = ret;
> +		return -EINVAL;
>   
>   	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
>   	if (!IS_ERR(opp))
> @@ -1249,21 +1231,41 @@ static int dpu_kms_init(struct drm_device *ddev)
>   	pm_runtime_enable(&pdev->dev);
>   	dpu_kms->rpm_enabled = true;
>   
> -	priv->kms = &dpu_kms->base;
> -
> -	irq = irq_of_parse_and_map(dpu_kms->pdev->dev.of_node, 0);
> -	if (!irq) {
> -		DPU_ERROR("failed to get irq\n");
> -		return -EINVAL;
> -	}
> -	dpu_kms->base.irq = irq;
> -
>   	return 0;
>   }
>   
>   static int dpu_dev_probe(struct platform_device *pdev)
>   {
> -	return msm_drv_probe(&pdev->dev, dpu_kms_init, NULL);
> +	struct device *dev = &pdev->dev;
> +	struct dpu_kms *dpu_kms;
> +	int irq;
> +	int ret = 0;
> +
> +	dpu_kms = devm_kzalloc(dev, sizeof(*dpu_kms), GFP_KERNEL);
> +	if (!dpu_kms)
> +		return -ENOMEM;
> +
> +	ret = devm_pm_opp_set_clkname(dev, "core");
> +	if (ret)
> +		return ret;
> +	/* OPP table is optional */
> +	ret = devm_pm_opp_of_add_table(dev);
> +	if (ret && ret != -ENODEV)
> +		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
> +
> +	ret = devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to parse clocks\n");
> +
> +	dpu_kms->num_clocks = ret;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return dev_err_probe(dev, irq, "failed to get irq\n");
> +
> +	dpu_kms->base.irq = irq;
> +
> +	return msm_drv_probe(&pdev->dev, dpu_kms_init, &dpu_kms->base);
>   }
>   
>   static int dpu_dev_remove(struct platform_device *pdev)
