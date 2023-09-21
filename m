Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB00A7A9012
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 02:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC73510E558;
	Thu, 21 Sep 2023 00:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A8A10E515;
 Thu, 21 Sep 2023 00:10:47 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38KNPmx6028711; Thu, 21 Sep 2023 00:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qneqChtbcPJwHLGFVb5R0IVC9y05pxxQTCA5porCVq4=;
 b=olRyOq8qJO0hAqgugwkkdFv/gp944EqmpoF/PEc2CDTwPlk3++zQ09xW5D60hp4VT5E2
 XtxuPU8tDEWvEtpcInE7KwqpEpRRA9+XxrS+s8SLlPsDnefsW8xzjGp4OOBPC5j5ZvpS
 7kEg9PFf/AbU/EKz0OIQuy+/QxdcmemisSzOgRHPj9IrZQS/u5s7iMnNhTpzyb99RsJC
 glaUhMEIG6YfyVQubXkd8qvd1hQbNk3dnzIEZU+GWF3uzWio6zd+N57QizopB3ycrSxC
 MlHop92f8gj1SEnOaa7BNTxcQntr/XenRZpsvr20qFbNgg0wkTnWaxBytMQkbJgxDvGl QA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t7r8w2f45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Sep 2023 00:10:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38L0Ahb0012680
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Sep 2023 00:10:43 GMT
Received: from [10.71.111.102] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 20 Sep
 2023 17:10:43 -0700
Message-ID: <d5304033-143b-f093-a58b-67a809ac4540@quicinc.com>
Date: Wed, 20 Sep 2023 17:10:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/3] drm/msm/dpu: Fix SC7280 DSC block length
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>
References: <20230921-topic-7280_dpu-v1-0-6912a97183d5@linaro.org>
 <20230921-topic-7280_dpu-v1-3-6912a97183d5@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230921-topic-7280_dpu-v1-3-6912a97183d5@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MfPBCMWuGdqGjSre9CD2k9i64Os-ty7y
X-Proofpoint-ORIG-GUID: MfPBCMWuGdqGjSre9CD2k9i64Os-ty7y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_12,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309200202
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/20/2023 3:46 PM, Konrad Dybcio wrote:
> Commit e550ad0e5c3d ("drm/msm/dpu: fix DSC 1.2 block lengths") changed
> the block length from a wrong value to another wrong value.
> 
> Use the correct one this time.
> 

No that change is correct as well.

After we moved to sub-blk parsing, we have enc and ctl blocks length 
used from the dsc_sblk_* instead:

static const struct dpu_dsc_sub_blks dsc_sblk_0 = {
         .enc = {.name = "enc", .base = 0x100, .len = 0x9c},
         .ctl = {.name = "ctl", .base = 0xF00, .len = 0x10},
};

static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
         .enc = {.name = "enc", .base = 0x200, .len = 0x9c},
         .ctl = {.name = "ctl", .base = 0xF80, .len = 0x10},
};

The main block has only one register now which is the DSC_CMN register.

Hence len = 0x4 is correct for that.

Sorry, but this is right too :)

> Fixes: e550ad0e5c3d ("drm/msm/dpu: fix DSC 1.2 block lengths")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index b6a59d7b94c4..de5e1a57a142 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -163,7 +163,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>   static const struct dpu_dsc_cfg sc7280_dsc[] = {
>   	{
>   		.name = "dce_0_0", .id = DSC_0,
> -		.base = 0x80000, .len = 0x4,
> +		.base = 0x80000, .len = 0x10,
>   		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN) | BIT(DPU_DSC_OUTPUT_CTRL),
>   		.sblk = &dsc_sblk_0,
>   	},
> 
