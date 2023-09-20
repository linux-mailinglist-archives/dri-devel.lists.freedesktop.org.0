Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 295007A8FEC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 01:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C89510E519;
	Wed, 20 Sep 2023 23:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B8610E550;
 Wed, 20 Sep 2023 23:41:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38KMkDIW019187; Wed, 20 Sep 2023 23:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8KAHJyb7ukMJL9JrE9n3VvcVa5V7tnW/DWUd0mk62fY=;
 b=HbjQATyCTC/6PLpQbAbTPJyU4Bt2xzoFAIuicO2LiX9htYKQ4ZFqhCwTX41d3yoUBX4O
 Y++bZz6kRwDQw1wzY4L1DrgKsMYPuZJwJTyuxxYHHqF/wY16QI1R4j+aVEnIcxEa6w2v
 1VdXRD377BcPbz15VMC0IZcIWoOooLLGNaHcvxJhaY+xZg7PWl2tPdn6+TxmGEWEpkky
 GK4wwdSwQDK8hya8HvNWLxO3BIK7DEnX9QC3aI9bcs6RZNeu3tYyh9FFhGj+Z7/OO4FD
 IThn2+zNKEh2riDJQvTYSAW8KHLVNN5LolV8y7asnlBE9FnpocFrgXUDoaUDLqxuUrvC Dg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t7rhuthv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Sep 2023 23:41:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38KNffS5026075
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Sep 2023 23:41:41 GMT
Received: from [10.71.111.102] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 20 Sep
 2023 16:41:39 -0700
Message-ID: <3b23270c-ec89-2177-8252-6ccaf58d37ac@quicinc.com>
Date: Wed, 20 Sep 2023 16:41:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] drm/msm/dpu: Fix SC7280 PP length
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>
References: <20230921-topic-7280_dpu-v1-0-6912a97183d5@linaro.org>
 <20230921-topic-7280_dpu-v1-1-6912a97183d5@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230921-topic-7280_dpu-v1-1-6912a97183d5@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 5aMlcQT71gL4U0CQLsyPDlhyxVdm4f83
X-Proofpoint-GUID: 5aMlcQT71gL4U0CQLsyPDlhyxVdm4f83
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_12,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 adultscore=0 mlxlogscore=858 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309200199
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
> Commit 194347df5844 ("drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2
> macros") unrolled a macro incorrectly. Fix that.
> 

No, its correct from what i can tell.

Before inlining it was using PP_BLK_DITHER macro and not PP_BLK.

PP_BLK_DITHER has a len of 0 and not 0xd4.

Hence I cannot see whats wrong here.

> Fixes: 194347df5844 ("drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2 macros")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 3b5061c4402a..dc3198335164 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -126,7 +126,7 @@ static const struct dpu_dspp_cfg sc7280_dspp[] = {
>   static const struct dpu_pingpong_cfg sc7280_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
> -		.base = 0x69000, .len = 0,
> +		.base = 0x69000, .len = 0xd4,
>   		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = 0,
> @@ -134,7 +134,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>   		.intr_rdptr = -1,
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
> -		.base = 0x6a000, .len = 0,
> +		.base = 0x6a000, .len = 0xd4,
>   		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = 0,
> @@ -142,7 +142,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>   		.intr_rdptr = -1,
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
> -		.base = 0x6b000, .len = 0,
> +		.base = 0x6b000, .len = 0xd4,
>   		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = 0,
> @@ -150,7 +150,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>   		.intr_rdptr = -1,
>   	}, {
>   		.name = "pingpong_3", .id = PINGPONG_3,
> -		.base = 0x6c000, .len = 0,
> +		.base = 0x6c000, .len = 0xd4,
>   		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = 0,
> 
