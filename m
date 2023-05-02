Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 063C46F4DDB
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 01:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D9B10E127;
	Tue,  2 May 2023 23:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5498410E127;
 Tue,  2 May 2023 23:51:33 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 342NPFpp028464; Tue, 2 May 2023 23:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=dw5gjE1acDoWzUznVaPjlkIW5v6lOmgtVkeosP33xoQ=;
 b=RFDc+NXFcfgRbMVYww4A3AlEEM8YXarLmpPdT8ULfx8MxI/ihelAEKrQ8/4LiEdsKLVe
 DeyvpUUpxaHkbArHDWF5lz1GnIVIwgZ9XtO+lHTM2qta3Wk5/J8yZS80ui+P+VTybzeu
 o1B0X5mCoY7C7qYjqhoTQBkcHlxxmMUGrSyk2txgJsIkKQgDlHPrzYdIXc1+ylJTtmsJ
 5mXRPbxq9CyDIjGLVGKeJA2CrpeuaxRMqqYyij3tpox2C/6IRDTiTELvushMXgwJ7QaO
 bZ+2U4gIiONkg5XEYRb38s8t3EojRqrP+h2KW30g/m51WDv8HDBJlM/iuXKEtSh0g052 Hw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qbae906wn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 23:51:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 342NpR43006116
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 2 May 2023 23:51:27 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 2 May 2023
 16:51:26 -0700
Message-ID: <6ad0c581-1955-3013-0ef3-6340240d0c1b@quicinc.com>
Date: Tue, 2 May 2023 16:51:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 5/7] drm/msm/dpu: inline dpu_encoder_get_wb()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
 <20230430235732.3341119-6-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230430235732.3341119-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: K46OTxr2PNaVfR6clVanVQCa4zNPKVVb
X-Proofpoint-ORIG-GUID: K46OTxr2PNaVfR6clVanVQCa4zNPKVVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_13,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
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
> The function dpu_encoder_get_wb() returns controller_id if the
> corresponding WB is present in the catalog. We can inline this function
> and rely on dpu_rm_get_wb() returning NULL for indices for which the
> WB is not present on the device.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 ++-------------------
>   1 file changed, 2 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 4c85cbb030e4..507ff3f88c67 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1277,22 +1277,6 @@ static enum dpu_intf dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
>   	return INTF_MAX;
>   }
>   
> -static enum dpu_wb dpu_encoder_get_wb(const struct dpu_mdss_cfg *catalog,
> -		enum dpu_intf_type type, u32 controller_id)
> -{
> -	int i = 0;
> -
> -	if (type != INTF_WB)
> -		return WB_MAX;
> -
> -	for (i = 0; i < catalog->wb_count; i++) {
> -		if (catalog->wb[i].id == controller_id)
> -			return catalog->wb[i].id;
> -	}
> -
> -	return WB_MAX;
> -}
> -
>   void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>   		struct dpu_encoder_phys *phy_enc)
>   {
> @@ -2261,7 +2245,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   		 */
>   		u32 controller_id = disp_info->h_tile_instance[i];
>   		enum dpu_intf intf_idx;
> -		enum dpu_wb wb_idx;
>   
>   		if (disp_info->num_of_h_tiles > 1) {
>   			if (i == 0)
> @@ -2279,14 +2262,11 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   							    disp_info->intf_type,
>   							    controller_id);
>   
> -		wb_idx = dpu_encoder_get_wb(dpu_kms->catalog,
> -				disp_info->intf_type, controller_id);
> -
>   		if (intf_idx >= INTF_0 && intf_idx < INTF_MAX)
>   			phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, intf_idx);
>   
> -		if (wb_idx >= WB_0 && wb_idx < WB_MAX)
> -			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, wb_idx);
> +		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
> +			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);


 From what I see, with 
https://patchwork.freedesktop.org/patch/534776/?series=117146&rev=1 we 
are dropping those checks from the RM too, so we are going to rely 
totally on entering the values correctly in catalog from now on?

>   
>   		if (!phys_params.hw_intf && !phys_params.hw_wb) {
>   			DPU_ERROR_ENC(dpu_enc, "no intf or wb block assigned at idx: %d\n", i);
