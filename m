Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D549168C61A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 19:48:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CC510EA13;
	Mon,  6 Feb 2023 18:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226B010EA10;
 Mon,  6 Feb 2023 18:48:16 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 316Cw2IY021098; Mon, 6 Feb 2023 18:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+mN0wS4Qamrv2ha8IcZkJhBTolEwktW9Dhp38rGq00U=;
 b=kGVJ/7EhfQaq+qZccO8fYQSKmU00FBUvZNbXUFhS9mRWM8SNdH2tEvCKka1ZkERW05HJ
 9IceS3t0xTiztSM/7OZEFvvNMkIMJm3IidPNeVRkK5KRYxYd/8UwfUdnN4o4V69H3Kzx
 d4ewp6ma1eMXyPIUOPa3LO8pLqqGw9P9UPkMxF4tl8c0ZVXlzrlZ6kkpvIUlUKu8sUJ8
 2S3rg129wPK+ojWKug+uamhiSh6z1L7bPbQZhXOs/Q/3Gz5kqsiLtNutysQV1IYpbCCV
 wDD5vbamqb5aq16tSTyKngzclU/+JPO9k2j+piYh0EMvDlysYyS7gQukxL6QAdsZHHlT 3A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nhg4rmafe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Feb 2023 18:48:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 316Im9Wc032340
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 6 Feb 2023 18:48:09 GMT
Received: from [10.110.44.26] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 10:48:08 -0800
Message-ID: <d1a524c9-a7d9-3454-5e2d-bcdd2eabd583@quicinc.com>
Date: Mon, 6 Feb 2023 10:48:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 19/27] drm/msm/dpu: make _dpu_plane_calc_clk accept
 mode directly
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-20-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230203182132.1307834-20-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: TWqS220bD_gk4PBdiiW4LP9iS5Q_sCrp
X-Proofpoint-GUID: TWqS220bD_gk4PBdiiW4LP9iS5Q_sCrp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302060163
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
> Rework bandwidth/clock calculation functions to use mode directly rather
> than fetching it through the plane data.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 39 ++++++++++-------------
>   1 file changed, 17 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index ee261a591d45..09a3fde1c910 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -127,20 +127,19 @@ static struct dpu_kms *_dpu_plane_get_kms(struct drm_plane *plane)
>   
>   /**
>    * _dpu_plane_calc_bw - calculate bandwidth required for a plane
> - * @plane: Pointer to drm plane.
> + * @catalog: Points to dpu catalog structure
>    * @fmt: Pointer to source buffer format
> + * @mode: Pointer to drm display mode
>    * @pipe_cfg: Pointer to pipe configuration
>    * Result: Updates calculated bandwidth in the plane state.
>    * BW Equation: src_w * src_h * bpp * fps * (v_total / v_dest)
>    * Prefill BW Equation: line src bytes * line_time
>    */
> -static void _dpu_plane_calc_bw(struct drm_plane *plane,
> +static u64 _dpu_plane_calc_bw(const struct dpu_mdss_cfg *catalog,
>   	const struct dpu_format *fmt,
> +	const struct drm_display_mode *mode,
>   	struct dpu_hw_sspp_cfg *pipe_cfg)
>   {
> -	struct dpu_plane_state *pstate;
> -	struct drm_display_mode *mode;
> -	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>   	int src_width, src_height, dst_height, fps;
>   	u64 plane_prefill_bw;
>   	u64 plane_bw;
> @@ -148,9 +147,6 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
>   	u64 scale_factor;
>   	int vbp, vpw, vfp;
>   
> -	pstate = to_dpu_plane_state(plane->state);
> -	mode = &plane->state->crtc->mode;
> -
>   	src_width = drm_rect_width(&pipe_cfg->src_rect);
>   	src_height = drm_rect_height(&pipe_cfg->src_rect);
>   	dst_height = drm_rect_height(&pipe_cfg->dst_rect);
> @@ -158,7 +154,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
>   	vbp = mode->vtotal - mode->vsync_end;
>   	vpw = mode->vsync_end - mode->vsync_start;
>   	vfp = mode->vsync_start - mode->vdisplay;
> -	hw_latency_lines =  dpu_kms->catalog->perf->min_prefill_lines;
> +	hw_latency_lines =  catalog->perf->min_prefill_lines;
>   	scale_factor = src_height > dst_height ?
>   		mult_frac(src_height, 1, dst_height) : 1;
>   
> @@ -178,37 +174,36 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
>   		do_div(plane_prefill_bw, hw_latency_lines);
>   
>   
> -	pstate->plane_fetch_bw = max(plane_bw, plane_prefill_bw);
> +	return max(plane_bw, plane_prefill_bw);
>   }
>   
>   /**
>    * _dpu_plane_calc_clk - calculate clock required for a plane
> - * @plane: Pointer to drm plane.
> + * @mode: Pointer to drm display mode
>    * @pipe_cfg: Pointer to pipe configuration
>    * Result: Updates calculated clock in the plane state.
>    * Clock equation: dst_w * v_total * fps * (src_h / dst_h)
>    */
> -static void _dpu_plane_calc_clk(struct drm_plane *plane, struct dpu_hw_sspp_cfg *pipe_cfg)
> +static u64 _dpu_plane_calc_clk(const struct drm_display_mode *mode,
> +		struct dpu_hw_sspp_cfg *pipe_cfg)
>   {
> -	struct dpu_plane_state *pstate;
> -	struct drm_display_mode *mode;
>   	int dst_width, src_height, dst_height, fps;
> -
> -	pstate = to_dpu_plane_state(plane->state);
> -	mode = &plane->state->crtc->mode;
> +	u64 plane_clk;
>   
>   	src_height = drm_rect_height(&pipe_cfg->src_rect);
>   	dst_width = drm_rect_width(&pipe_cfg->dst_rect);
>   	dst_height = drm_rect_height(&pipe_cfg->dst_rect);
>   	fps = drm_mode_vrefresh(mode);
>   
> -	pstate->plane_clk =
> +	plane_clk =
>   		dst_width * mode->vtotal * fps;
>   
>   	if (src_height > dst_height) {
> -		pstate->plane_clk *= src_height;
> -		do_div(pstate->plane_clk, dst_height);
> +		plane_clk *= src_height;
> +		do_div(plane_clk, dst_height);
>   	}
> +
> +	return plane_clk;
>   }
>   
>   /**
> @@ -1219,9 +1214,9 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   		_dpu_plane_set_qos_remap(plane, pipe);
>   	}
>   
> -	_dpu_plane_calc_bw(plane, fmt, &pipe_cfg);
> +	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, &pipe_cfg);
>   
> -	_dpu_plane_calc_clk(plane, &pipe_cfg);
> +	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, &pipe_cfg);
>   }
>   
>   static void _dpu_plane_atomic_disable(struct drm_plane *plane)
