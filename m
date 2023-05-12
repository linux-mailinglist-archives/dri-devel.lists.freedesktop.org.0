Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 390DC70120D
	for <lists+dri-devel@lfdr.de>; Sat, 13 May 2023 00:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8B410E301;
	Fri, 12 May 2023 22:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B10F10E301;
 Fri, 12 May 2023 22:12:52 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CJV4Vw007070; Fri, 12 May 2023 22:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=VVizRQKcWCpCClkAkR9NZqD5wtkGxP5QdY/8A9RhRXs=;
 b=g6+4H9ormg0GgMALNIla/sd8EmNq2O8ON1QKwH0D4/Fu9r/DpnFm+rRzSWRN0PRIgveW
 2TGYC3fT0nXSXNgufU2K3+FuVfrqI/tM+jHTZG0hO+xkMhwSXWyPDxjBkVS67W/9TIAi
 lQaBoOPASN85z3meAeSgtVn4Ym15KhMu/qflyTdZUgAgE0ZV82lK84CmtnpaeI8YpEyM
 mQxua0MHJ0118GLMkyiDdUWfDNp32J5DwzMcAe/y3Gxm/icWLOjHtq3tePekw9smJpI7
 zjUS7l1nLyuHGC8CJP7yHVT9Ie2qMWIsTHlMLs6itOdHP0876HlJ/JFAdqln49IDisl1 HA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qhayt2nbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 22:12:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34CMCjk3007642
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 22:12:45 GMT
Received: from [10.110.82.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 12 May
 2023 15:12:45 -0700
Message-ID: <ea7af397-1840-f15b-6f56-2d0559b8be4d@quicinc.com>
Date: Fri, 12 May 2023 15:12:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH v2 02/13] drm/msm/dpu: take plane rotation into
 account for wide planes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230321011821.635977-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Z_81LZdljGe2nvR291JA4PzZVSqmg8AP
X-Proofpoint-GUID: Z_81LZdljGe2nvR291JA4PzZVSqmg8AP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=886
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305120186
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



On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
> Take into account the plane rotation and flipping when calculating src
> positions for the wide plane parts.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Do we need to have a fixes tag for this? This means we dont consider 
rotation while calculating src position today which is a bug?

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 27 ++++++++++++++---------
>   1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 2e63eb0a2f3f..d43e04fc4578 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -887,16 +887,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   		return -EINVAL;
>   	}
>   
> -	pipe_cfg->src_rect = new_plane_state->src;
> -
> -	/* state->src is 16.16, src_rect is not */
> -	pipe_cfg->src_rect.x1 >>= 16;
> -	pipe_cfg->src_rect.x2 >>= 16;
> -	pipe_cfg->src_rect.y1 >>= 16;
> -	pipe_cfg->src_rect.y2 >>= 16;
> -
> -	pipe_cfg->dst_rect = new_plane_state->dst;
> -
>   	fb_rect.x2 = new_plane_state->fb->width;
>   	fb_rect.y2 = new_plane_state->fb->height;
>   
> @@ -912,6 +902,15 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   
>   	max_linewidth = pdpu->catalog->caps->max_linewidth;
>   
> +	/* state->src is 16.16, src_rect is not */
> +	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> +
> +	pipe_cfg->dst_rect = new_plane_state->dst;
> +
> +	drm_rect_rotate(&pipe_cfg->src_rect,
> +			new_plane_state->fb->width, new_plane_state->fb->height,
> +			new_plane_state->rotation);
> +
>   	if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
>   		/*
>   		 * In parallel multirect case only the half of the usual width
> @@ -959,6 +958,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
>   	}
>   
> +	drm_rect_rotate_inv(&pipe_cfg->src_rect,
> +			    new_plane_state->fb->width, new_plane_state->fb->height,
> +			    new_plane_state->rotation);
> +	if (r_pipe->sspp)

Dont you need to check for if (r_pipe_cfg) here and not if 
(r_pipe->sspp) because parameter you are passing is the r_pipe_cfg to 
drm_rect_rotate_inv().

So we rotated the pipe_cfg once, then rotated_inv it to restore the 
rectangle to its original state, but r_pipe_cfg's rectangle was never 
rotated as it was not allocated before this function so it will remain 
in inverse rotated state now right?


> +		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> +				    new_plane_state->fb->width, new_plane_state->fb->height,
> +				    new_plane_state->rotation);
> +
>   	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
>   	if (ret)
>   		return ret;
