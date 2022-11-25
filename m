Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9261C638399
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 06:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9FA10E295;
	Fri, 25 Nov 2022 05:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9E910E009;
 Fri, 25 Nov 2022 05:45:31 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AP5Ja6p015245; Fri, 25 Nov 2022 05:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OHoP7nR4YoC1qhRGDdPjoPvEv7PB1v3pP9D8BsXyQh4=;
 b=fdKqR0eVdxW+PCmtbwwZ3xm6kASZDIjVmG8RQFyvEIfLsBqn96CGD8ko30lCA6wwhXVH
 /Gad0lOjDgbbKHRC8BZYK8Nda/82pZzX+v9GKHVRIgOWHXvbiBGW0a8rgqmDqTOw59zS
 ESTJandldY4kK7LROnrCGeSMuk0LqD/GXMxZsEHaYmsooGdh2/3i2q1G2YA/Lz8a5Dsd
 8fHN0pGQZd3TV+B3Ck5YhYKVwwF2zsIvGSGdK0UtaflW2Wds8Tbkh1X+XzcugGiWlDoC
 L9hxA76Atss5IrTvWLiH7MePEJOWvSfIo1QfvB+BpEEJofTU5HvDfbW3Q7nUUtwqDDI6 Lw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m1gxepju4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Nov 2022 05:45:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AP5jO9o011192
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Nov 2022 05:45:24 GMT
Received: from [10.216.38.33] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 24 Nov
 2022 21:45:21 -0800
Message-ID: <dc44d8f1-c782-452b-5928-57538250dade@quicinc.com>
Date: Thu, 24 Nov 2022 21:45:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/mdp5: fix reading hw revision on db410c platform
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20221125000213.252115-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221125000213.252115-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 9jEJLg3hPrEVQtakL0CjtQIaVxaJfRYB
X-Proofpoint-ORIG-GUID: 9jEJLg3hPrEVQtakL0CjtQIaVxaJfRYB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-25_02,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250046
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



On 11/24/2022 4:02 PM, Dmitry Baryshkov wrote:
> Since the commit commit c6122688f265 ("drm/msm/mdp5: stop overriding
> drvdata") reading the MDP5 hw revision on db410c will crash the board
> as the MDSS_GDSC is not enabled. Revert a part of the offending commit
> (moving rpm enablement) and set priv->kms earlier. This make it possible
> to use pm_runtime_get_sync() during read_mdp_hw_revision(), which will
> power up both the MDP5 and MDSS devices.
> 

This is the exact concern I had even when c6122688f265 was pushed.

https://patchwork.freedesktop.org/patch/508334/#comment_917689

Was the response given that time not correct then?

https://patchwork.freedesktop.org/patch/508334/#comment_917713
> Fixes: c6122688f265 ("drm/msm/mdp5: stop overriding drvdata")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 17 ++++++++---------
>   1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index b46f983f2b46..29ae5c9613f3 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -519,10 +519,9 @@ static void read_mdp_hw_revision(struct mdp5_kms *mdp5_kms,
>   	struct device *dev = &mdp5_kms->pdev->dev;
>   	u32 version;
>   
> -	/* Manually enable the MDP5, as pm runtime isn't usable yet. */
> -	mdp5_enable(mdp5_kms);
> +	pm_runtime_get_sync(dev);
>   	version = mdp5_read(mdp5_kms, REG_MDP5_HW_VERSION);
> -	mdp5_disable(mdp5_kms);
> +	pm_runtime_put_sync(dev);
>   
>   	*major = FIELD(version, MDP5_HW_VERSION_MAJOR);
>   	*minor = FIELD(version, MDP5_HW_VERSION_MINOR);
> @@ -839,6 +838,12 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
>   	 */
>   	clk_set_rate(mdp5_kms->core_clk, 200000000);
>   
> +	/* set uninit-ed kms */
> +	priv->kms = &mdp5_kms->base.base;
> +
> +	pm_runtime_enable(&pdev->dev);
> +	mdp5_kms->rpm_enabled = true;
> +
>   	read_mdp_hw_revision(mdp5_kms, &major, &minor);
>   
>   	mdp5_kms->cfg = mdp5_cfg_init(mdp5_kms, major, minor);
> @@ -887,12 +892,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
>   	if (ret)
>   		goto fail;
>   
> -	/* set uninit-ed kms */
> -	priv->kms = &mdp5_kms->base.base;
> -
> -	pm_runtime_enable(&pdev->dev);
> -	mdp5_kms->rpm_enabled = true;
> -
>   	return 0;
>   fail:
>   	if (mdp5_kms)
