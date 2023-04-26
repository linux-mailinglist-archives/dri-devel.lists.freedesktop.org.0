Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC3E6F01F1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 09:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4510910EAD5;
	Thu, 27 Apr 2023 07:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4487F10E250;
 Wed, 26 Apr 2023 16:58:09 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33QFu7vr006791; Wed, 26 Apr 2023 16:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NuVHIJlvadRJATQIOOamYnYQYh+mw+JeL4re01gta2E=;
 b=ngujU34kqVpTQ0/MB12ZE9GgjklzxsHZi+DD1Bx3lrEuR+WmA5iqnOnRlh4iSo69oExp
 4rl9j39vuvdZ+jxouYMhkE+nq4dY3JfuSYPmUVXL/bHQ5daZXfvIWVDxSn7SOj3mCo4d
 tJJu5wYs5s1y+H0+CNNcoFVZWnvhzp9CyIZTAUPo+1+toJLLASnYKvP7F35sQL1eZoxc
 bFM6y1iYEsoOJ6OjuCwT5eXyFKHvuP/fyRT+Uq2ezixGKbY3lIuttNAFPgMQG1GOynOr
 Jos5/uqZ9UYUiEo6RVV7ZZGBmoAi8TKdLimP0Xu5JrufKIdr+CaMnDarBEm6R28zekpn 2Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q72jf8uq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 16:58:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33QGw3E4005429
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 16:58:03 GMT
Received: from [10.110.11.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 26 Apr
 2023 09:58:02 -0700
Message-ID: <e3329117-fe7d-11f8-d371-9f3668070945@quicinc.com>
Date: Wed, 26 Apr 2023 09:58:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dpu: access CSC/CSC10 registers
 directly
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
References: <20230422000839.1921358-1-dmitry.baryshkov@linaro.org>
 <20230422000839.1921358-4-dmitry.baryshkov@linaro.org>
From: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
In-Reply-To: <20230422000839.1921358-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: kQ-s9ryJuLE9pjlJinQMxxXoEA78cHET
X-Proofpoint-ORIG-GUID: kQ-s9ryJuLE9pjlJinQMxxXoEA78cHET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_08,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260149
X-Mailman-Approved-At: Thu, 27 Apr 2023 07:38:49 +0000
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn
 Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/21/2023 5:08 PM, Dmitry Baryshkov wrote:
> Stop using _sspp_subblk_offset() to get offset of the csc_blk. Inline
> this function and use ctx->cap->sblk->csc_blk.base directly.
> 
> As this was the last user, drop _sspp_subblk_offset() too.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 43 +++++----------------
>   1 file changed, 9 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 22c59f2250be..f4698e28e197 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -136,30 +136,6 @@
>   #define TS_CLK			19200000
>   
>   
> -static int _sspp_subblk_offset(struct dpu_hw_sspp *ctx,
> -		int s_id,
> -		u32 *idx)
> -{
> -	int rc = 0;
> -	const struct dpu_sspp_sub_blks *sblk;
> -
> -	if (!ctx || !ctx->cap || !ctx->cap->sblk)
> -		return -EINVAL;
> -
> -	sblk = ctx->cap->sblk;
> -
> -	switch (s_id) {
> -	case DPU_SSPP_CSC:
> -	case DPU_SSPP_CSC_10BIT:
> -		*idx = sblk->csc_blk.base;
> -		break;
> -	default:
> -		rc = -EINVAL;
> -	}
> -
> -	return rc;
> -}
> -
>   static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
>   {
>   	struct dpu_hw_sspp *ctx = pipe->sspp;
> @@ -210,19 +186,16 @@ static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
>   static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
>   		u32 mask, u8 en)
>   {
> -	u32 idx;
> +	const struct dpu_sspp_sub_blks *sblk = ctx->cap->sblk;
>   	u32 opmode;
>   
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_CSC_10BIT, &idx))
> -		return;
> -
> -	opmode = DPU_REG_READ(&ctx->hw, SSPP_VIG_CSC_10_OP_MODE + idx);
> +	opmode = DPU_REG_READ(&ctx->hw, sblk->csc_blk.base + SSPP_VIG_CSC_10_OP_MODE);
>   	if (en)
>   		opmode |= mask;
>   	else
>   		opmode &= ~mask;
>   
> -	DPU_REG_WRITE(&ctx->hw, SSPP_VIG_CSC_10_OP_MODE + idx, opmode);
> +	DPU_REG_WRITE(&ctx->hw, sblk->csc_blk.base + SSPP_VIG_CSC_10_OP_MODE, opmode);
>   }
>   
>   /*
> @@ -530,18 +503,20 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>   static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
>   		const struct dpu_csc_cfg *data)
>   {
> -	u32 idx;
> +	u32 offset;
>   	bool csc10 = false;
>   
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_CSC, &idx) || !data)
> +	if (!ctx || !data)
>   		return;
>   
> +	offset = ctx->cap->sblk->csc_blk.base;
> +
>   	if (test_bit(DPU_SSPP_CSC_10BIT, &ctx->cap->features)) {
> -		idx += CSC_10BIT_OFFSET;
> +		offset += CSC_10BIT_OFFSET;
>   		csc10 = true;
>   	}
>   
> -	dpu_hw_csc_setup(&ctx->hw, idx, data, csc10);
> +	dpu_hw_csc_setup(&ctx->hw, offset, data, csc10);
>   }
>   
>   static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)

Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
