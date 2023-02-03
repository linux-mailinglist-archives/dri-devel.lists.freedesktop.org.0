Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C86A68A3A3
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 21:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6371610E09C;
	Fri,  3 Feb 2023 20:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FA410E09C;
 Fri,  3 Feb 2023 20:37:23 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 313KSUVv014153; Fri, 3 Feb 2023 20:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=EXzsSypqxJa/n4Rx1fAbpoHUyNxL2uEW3SHVBkAUC84=;
 b=RHwANQ1mp5lj5ajCbU5yYqgaratyavU97KFbboHw03+Y33ZXi4VOr/cOdK8t97a38CS6
 yXXk+GH3zrrnzrtVpwXYe70tVOf9cefbEjKZCrawLROeHedBo9/625H/oaBMWNck2UnQ
 fesDcmJ1xcgcFc1FEt5QYn00pj8fnXHsiu+FxY19Ng7EtJcIPECQhrnJBhQ+jKt5Wgod
 dcByS6GXIWjflLInOmq4NBEfllDFXY2cvptP+3Z+PeAIEbmIqyoBi0U5Nq1/wcGcR0CW
 WQGootnlp/w2mEkLqoICXrgFYH8UD+d8JYBqMV+4zDbJnKhkS1j9LICkxRY/cw9JQoJm TA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ngh1kb6m9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Feb 2023 20:37:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 313KbHgo008917
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 3 Feb 2023 20:37:17 GMT
Received: from [10.110.99.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 3 Feb 2023
 12:37:16 -0800
Message-ID: <a39a835b-1560-8f4f-df32-7854f673ec35@quicinc.com>
Date: Fri, 3 Feb 2023 12:37:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 11/27] drm/msm/dpu: move stride programming to
 dpu_hw_sspp_setup_sourceaddress
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-12-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230203182132.1307834-12-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VqmQm9_Sg-XICw67R83-mATRHFBSk6d5
X-Proofpoint-ORIG-GUID: VqmQm9_Sg-XICw67R83-mATRHFBSk6d5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_19,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030184
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



On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
> Move stride programming to dpu_hw_sspp_setup_sourceaddress(), so that
> dpu_hw_sspp_setup_rects() programs only source and destination
> rectangles.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Now with the prev change, this is

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 57 +++++++++++----------
>   1 file changed, 29 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 4c05f4b5e050..fbfb39a7a229 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -451,7 +451,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
>   {
>   	struct dpu_hw_sspp *ctx = pipe->sspp;
>   	struct dpu_hw_blk_reg_map *c;
> -	u32 src_size, src_xy, dst_size, dst_xy, ystride0, ystride1;
> +	u32 src_size, src_xy, dst_size, dst_xy;
>   	u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
>   	u32 idx;
>   
> @@ -482,44 +482,18 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
>   	dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
>   		drm_rect_width(&cfg->dst_rect);
>   
> -	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
> -		ystride0 = (cfg->layout.plane_pitch[0]) |
> -			(cfg->layout.plane_pitch[1] << 16);
> -		ystride1 = (cfg->layout.plane_pitch[2]) |
> -			(cfg->layout.plane_pitch[3] << 16);
> -	} else {
> -		ystride0 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE0 + idx);
> -		ystride1 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE1 + idx);
> -
> -		if (pipe->multirect_index == DPU_SSPP_RECT_0) {
> -			ystride0 = (ystride0 & 0xFFFF0000) |
> -				(cfg->layout.plane_pitch[0] & 0x0000FFFF);
> -			ystride1 = (ystride1 & 0xFFFF0000)|
> -				(cfg->layout.plane_pitch[2] & 0x0000FFFF);
> -		} else {
> -			ystride0 = (ystride0 & 0x0000FFFF) |
> -				((cfg->layout.plane_pitch[0] << 16) &
> -				 0xFFFF0000);
> -			ystride1 = (ystride1 & 0x0000FFFF) |
> -				((cfg->layout.plane_pitch[2] << 16) &
> -				 0xFFFF0000);
> -		}
> -	}
> -
>   	/* rectangle register programming */
>   	DPU_REG_WRITE(c, src_size_off + idx, src_size);
>   	DPU_REG_WRITE(c, src_xy_off + idx, src_xy);
>   	DPU_REG_WRITE(c, out_size_off + idx, dst_size);
>   	DPU_REG_WRITE(c, out_xy_off + idx, dst_xy);
> -
> -	DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE0 + idx, ystride0);
> -	DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE1 + idx, ystride1);
>   }
>   
>   static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>   		struct dpu_hw_sspp_cfg *cfg)
>   {
>   	struct dpu_hw_sspp *ctx = pipe->sspp;
> +	u32 ystride0, ystride1;
>   	int i;
>   	u32 idx;
>   
> @@ -541,6 +515,33 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>   		DPU_REG_WRITE(&ctx->hw, SSPP_SRC3_ADDR + idx,
>   				cfg->layout.plane_addr[2]);
>   	}
> +
> +	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
> +		ystride0 = (cfg->layout.plane_pitch[0]) |
> +			(cfg->layout.plane_pitch[1] << 16);
> +		ystride1 = (cfg->layout.plane_pitch[2]) |
> +			(cfg->layout.plane_pitch[3] << 16);
> +	} else {
> +		ystride0 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx);
> +		ystride1 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx);
> +
> +		if (pipe->multirect_index == DPU_SSPP_RECT_0) {
> +			ystride0 = (ystride0 & 0xFFFF0000) |
> +				(cfg->layout.plane_pitch[0] & 0x0000FFFF);
> +			ystride1 = (ystride1 & 0xFFFF0000)|
> +				(cfg->layout.plane_pitch[2] & 0x0000FFFF);
> +		} else {
> +			ystride0 = (ystride0 & 0x0000FFFF) |
> +				((cfg->layout.plane_pitch[0] << 16) &
> +				 0xFFFF0000);
> +			ystride1 = (ystride1 & 0x0000FFFF) |
> +				((cfg->layout.plane_pitch[2] << 16) &
> +				 0xFFFF0000);
> +		}
> +	}
> +
> +	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx, ystride0);
> +	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx, ystride1);
>   }
>   
>   static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
