Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E20E06F4DEF
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 01:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3908410E12B;
	Tue,  2 May 2023 23:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2B110E12B;
 Tue,  2 May 2023 23:57:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 342NOcIR022759; Tue, 2 May 2023 23:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=jn5OgvEJ5HAW71lDr+sHxFkQ05aiFO3Izp/UKVdiNv8=;
 b=PsKocM/jCTl+B5T6IuuuHf1Xr7KC/ZOya3umSH92NuA5wQDrM1ibEmyc4gLYTUXwbvvK
 C1DYy0e58vrNQ4sv0S/p1hXuYwNO3QQ1mCc5ifbCjRghOcANlsmJAQIEn01PPGzUBn52
 CQAFFqxDvRFwdJUr67ytg/6x46A5+nHUA0MghZFymbQjRNk0wxIhJhKr+95sdeufb1px
 u2LF6FckhN0eQBaCFZUpXJXCO+k0tT0JpEOhU89/hs1Gff2Iy+jc4n4PEtkNBnrdstrQ
 DvO6jx8Vsb/1lM6Wx3Kk/h+dXx9CWyFdDb7Gutrb0U2GJK1zkkyt32blTVo4XcVtgUY4 7A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qawcba5h6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 23:57:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 342Nv7eJ018108
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 2 May 2023 23:57:07 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 2 May 2023
 16:57:06 -0700
Message-ID: <d4558099-541e-cc55-860a-fe21af3a8ca6@quicinc.com>
Date: Tue, 2 May 2023 16:57:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 6/7] drm/msm/dpu: call dpu_rm_get_intf() from
 dpu_encoder_get_intf()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
 <20230430235732.3341119-7-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230430235732.3341119-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: HRrkNuV6kOli5vS1NiK2OlobbIeHE-d3
X-Proofpoint-ORIG-GUID: HRrkNuV6kOli5vS1NiK2OlobbIeHE-d3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_13,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020201
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



On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
> There is little sense to get intf index just to call dpu_rm_get_intf()
> on it. Move dpu_rm_get_intf() call to dpu_encoder_get_intf() function.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 ++++++++------------
>   1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 507ff3f88c67..b35e92c658ad 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1259,22 +1259,23 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
>   	mutex_unlock(&dpu_enc->enc_lock);
>   }
>   
> -static enum dpu_intf dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
> +static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
> +		struct dpu_rm *dpu_rm,
>   		enum dpu_intf_type type, u32 controller_id)
>   {
>   	int i = 0;
>   
>   	if (type == INTF_WB)
> -		return INTF_MAX;
> +		return NULL;
>   
>   	for (i = 0; i < catalog->intf_count; i++) {
>   		if (catalog->intf[i].type == type
>   		    && catalog->intf[i].controller_id == controller_id) {
> -			return catalog->intf[i].id;
> +			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
>   		}

Why has the for loop been retained in this function but not for 
writeback? is there any difference? Doesnt looks like there needs to be.

>   	}
>   
> -	return INTF_MAX;
> +	return NULL;
>   }
>   
>   void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
> @@ -2244,7 +2245,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   		 * h_tile_instance_ids[2] = {1, 0}; DSI1 = left, DSI0 = right
>   		 */
>   		u32 controller_id = disp_info->h_tile_instance[i];
> -		enum dpu_intf intf_idx;
>   
>   		if (disp_info->num_of_h_tiles > 1) {
>   			if (i == 0)
> @@ -2258,12 +2258,9 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   		DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
>   				i, controller_id, phys_params.split_role);
>   
> -		intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
> -							    disp_info->intf_type,
> -							    controller_id);
> -
> -		if (intf_idx >= INTF_0 && intf_idx < INTF_MAX)
> -			phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, intf_idx);
> +		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
> +							   disp_info->intf_type,
> +							   controller_id);
>   
>   		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
>   			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
> @@ -2287,7 +2284,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   			DPU_ERROR_ENC(dpu_enc, "failed to add phys encs\n");
>   			break;
>   		}
> -
unnecessary change?
>   	}
>   
>   	mutex_unlock(&dpu_enc->enc_lock);
