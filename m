Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5029D68DF46
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 18:49:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2076D10E57A;
	Tue,  7 Feb 2023 17:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE95710E55B;
 Tue,  7 Feb 2023 17:49:42 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317CEi9w017245; Tue, 7 Feb 2023 17:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3XSFRJCHWXfqJqEOZdspss/LDQaL3aiuHKoET3F1TO0=;
 b=BQp0RHEDWFHexlEyow9P5Jphj9REaVGRlc24JCGHcl3ozoEZcWuLW9YesZiwSGo29qKD
 +AG1DCWfAkwlF21QiHVH6T2fCVAoz5PoHLEZW2VLHOytryrmzUq7e1t4PQW/J3CHiUwu
 CU0ID1t2g3GLsftj3mHh6VlvURZ3iX0XvNejNfODexz7gYc1YI4CgFwed2jItE/nKP3X
 5dLpO0ioI+ExClv9PXtPp0yT1eBymrJIYG+SAGJkvzVBfLz0mDr2aChAQDLh2ZLbO/+E
 uh7pn1J2VfqyPmbihqiVR/t1mEiftEM2VlXaLRKptjMLS5ti2y+DoUs8aCYHkMrmG+P1 fQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkeny1u88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 17:49:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 317HnZH5028952
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 7 Feb 2023 17:49:35 GMT
Received: from [10.110.44.26] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 09:49:34 -0800
Message-ID: <04ab8d1e-d343-2d6c-c211-2cf0ffc713c2@quicinc.com>
Date: Tue, 7 Feb 2023 09:49:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 23/27] drm/msm/dpu: rework dpu_plane_atomic_check()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-24-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230203182132.1307834-24-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2k6tIPl-6pSz3mLcjL1GKns4biGsCUhV
X-Proofpoint-ORIG-GUID: 2k6tIPl-6pSz3mLcjL1GKns4biGsCUhV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_09,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070159
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
> Split pipe-dependent code from dpu_plane_atomic_check() into the
> separate function dpu_plane_atomic_check_pipe(). This is one of

Same comment as prev patch, dpu_plane_atomic_check_pipe() ---> 
dpu_plane_atomic_check_sspp()

> preparational steps to add r_pipe support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 88 ++++++++++++++---------
>   1 file changed, 53 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index f94e132733f3..e69499490d39 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -903,6 +903,51 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
>   	return 0;
>   }
>   
> +static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
> +		struct dpu_sw_pipe *pipe,
> +		struct dpu_hw_sspp_cfg *pipe_cfg,

pipe_cfg --> sspp_cfg

Also, had a question. For function parameters spreading across multiple 
lines do we want to align to one guideline? Is it going to be two tabs 
more than the prev line or aligning it with the opening brace of prev line?

I am seeing a mix in the prev patch of the series and this one.

> +		const struct dpu_format *fmt)
> +{
> +	uint32_t min_src_size;
> +
> +	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
> +
> +	if (DPU_FORMAT_IS_YUV(fmt) &&
> +		(!(pipe->sspp->cap->features & DPU_SSPP_SCALER) ||
> +		 !(pipe->sspp->cap->features & DPU_SSPP_CSC_ANY))) {
> +		DPU_DEBUG_PLANE(pdpu,
> +				"plane doesn't have scaler/csc for yuv\n");
> +		return -EINVAL;
> +	}
> +
> +	/* check src bounds */
> +	if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
> +		   drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
> +		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
> +				DRM_RECT_ARG(&pipe_cfg->src_rect));
> +		return -E2BIG;
> +	}
> +
> +	/* valid yuv image */
> +	if (DPU_FORMAT_IS_YUV(fmt) &&
> +		   (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 0x1 ||
> +		    drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
> +		    drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
> +		DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
> +				DRM_RECT_ARG(&pipe_cfg->src_rect));
> +		return -EINVAL;
> +	}
> +
> +	/* min dst support */
> +	if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
> +		DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
> +				DRM_RECT_ARG(&pipe_cfg->dst_rect));
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>   static int dpu_plane_atomic_check(struct drm_plane *plane,
>   				  struct drm_atomic_state *state)
>   {
> @@ -915,7 +960,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	const struct dpu_format *fmt;
>   	struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
>   	struct drm_rect fb_rect = { 0 };
> -	uint32_t min_src_size, max_linewidth;
> +	uint32_t max_linewidth;
>   	unsigned int rotation;
>   	uint32_t supported_rotations;
>   	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
> @@ -970,46 +1015,19 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   
>   	max_linewidth = pdpu->catalog->caps->max_linewidth;
>   
> -	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> -
> -	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
> -
> -	if (DPU_FORMAT_IS_YUV(fmt) &&
> -		(!(pipe_hw_caps->features & DPU_SSPP_SCALER) ||
> -		 !(pipe_hw_caps->features & DPU_SSPP_CSC_ANY))) {
> -		DPU_DEBUG_PLANE(pdpu,
> -				"plane doesn't have scaler/csc for yuv\n");
> -		return -EINVAL;
> -
> -	/* check src bounds */
> -	} else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
> -		   drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
> -		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
> -				DRM_RECT_ARG(&pipe_cfg->src_rect));
> -		return -E2BIG;
> -
> -	/* valid yuv image */
> -	} else if (DPU_FORMAT_IS_YUV(fmt) &&
> -		   (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 0x1 ||
> -		    drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
> -		    drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
> -		DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
> -				DRM_RECT_ARG(&pipe_cfg->src_rect));
> -		return -EINVAL;
> -
> -	/* min dst support */
> -	} else if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
> -		DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
> -				DRM_RECT_ARG(&pipe_cfg->dst_rect));
> -		return -EINVAL;
> -
>   	/* check decimated source width */
> -	} else if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
> +	if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
>   		DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
>   				DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
>   		return -E2BIG;
>   	}
>   
> +	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> +
> +	ret = dpu_plane_atomic_check_pipe(pdpu, &pstate->pipe, pipe_cfg, fmt);
> +	if (ret)
> +		return ret;
> +
>   	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
>   
>   	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
