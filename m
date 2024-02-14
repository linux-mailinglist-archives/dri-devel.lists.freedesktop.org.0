Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DE5855218
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 19:30:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D7E10E173;
	Wed, 14 Feb 2024 18:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="PZrV3WMV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DA910E090;
 Wed, 14 Feb 2024 18:30:34 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41EIOta0027586; Wed, 14 Feb 2024 18:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=2deMRAtXjOx3KxStLyno63r2bNhoEH669ShXSH+f1Uc=; b=PZ
 rV3WMVYfMvPEAPKTHBWJQQ3FrBh0JNZ/H0Np0d7lL9EMrX2Wofn5iWyOJLZRkZWu
 az8QfVehHZdyhfAjp94/jdBZT6xkoLbx2KxLMeMzEKlnfdiyN3qvSshMAXQrNZrl
 yATZ7eyyBQVE/AUDfNm2A+hqjqyNp1XFbnIL57qBagSmj111L4gU25Ia2ZPqdxva
 R8d21iky0JDIuEQVi4LS6O8hP0NJ5tRybaJZyuhPvv1VHphzSqKIz3Yqn6p6SS1I
 JO9xvmqP7RpIvYCGe3pSzCBsrdHuOxcIJwp2UEnCuj6RUySvRzs6BzWCFx8TUmaY
 0fcEo5c1vVMSywK6qeFw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w92fxg1vc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 18:30:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41EIUStg010863
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 18:30:28 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 14 Feb
 2024 10:30:27 -0800
Message-ID: <e3a15487-1697-579a-f8fb-9d681f1af272@quicinc.com>
Date: Wed, 14 Feb 2024 10:30:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 01/12] drm/atomic-helper: split not-scaling part of
 drm_atomic_helper_check_plane_state
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
 <20230914050706.1058620-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230914050706.1058620-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Wo99eYzPPBHobiGD5cmXAkWT0EL2VO0o
X-Proofpoint-ORIG-GUID: Wo99eYzPPBHobiGD5cmXAkWT0EL2VO0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_10,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140143
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/13/2023 10:06 PM, Dmitry Baryshkov wrote:
> The helper drm_atomic_helper_check_plane_state() runs several checks on
> plane src and dst rectangles, including the check whether required
> scaling fits into the required margins. The msm driver would benefit
> from having a function that does all these checks except the scaling
> one. Split them into a new helper called
> drm_atomic_helper_check_plane_noscale().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/drm_atomic_helper.c | 110 ++++++++++++++++++++++------
>   include/drm/drm_atomic_helper.h     |   7 ++
>   2 files changed, 96 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 292e38eb6218..2d7dd66181c9 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -825,11 +825,9 @@ drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
>   EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
>   
>   /**
> - * drm_atomic_helper_check_plane_state() - Check plane state for validity
> + * drm_atomic_helper_check_plane_noscale() - Check plane state for validity
>    * @plane_state: plane state to check
>    * @crtc_state: CRTC state to check
> - * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
> - * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
>    * @can_position: is it legal to position the plane such that it
>    *                doesn't cover the entire CRTC?  This will generally
>    *                only be false for primary planes.
> @@ -845,19 +843,16 @@ EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
>    * RETURNS:
>    * Zero if update appears valid, error code on failure
>    */
> -int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
> -					const struct drm_crtc_state *crtc_state,
> -					int min_scale,
> -					int max_scale,
> -					bool can_position,
> -					bool can_update_disabled)
> +int drm_atomic_helper_check_plane_noscale(struct drm_plane_state *plane_state,
> +					  const struct drm_crtc_state *crtc_state,
> +					  bool can_position,
> +					  bool can_update_disabled)
>   {
>   	struct drm_framebuffer *fb = plane_state->fb;
>   	struct drm_rect *src = &plane_state->src;
>   	struct drm_rect *dst = &plane_state->dst;
>   	unsigned int rotation = plane_state->rotation;
>   	struct drm_rect clip = {};
> -	int hscale, vscale;
>   
>   	WARN_ON(plane_state->crtc && plane_state->crtc != crtc_state->crtc);
>   
> @@ -883,17 +878,6 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>   
>   	drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
>   

Do we need to do the rotation even for noscale before validation?

> -	/* Check scaling */
> -	hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
> -	vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
> -	if (hscale < 0 || vscale < 0) {
> -		drm_dbg_kms(plane_state->plane->dev,
> -			    "Invalid scaling of plane\n");
> -		drm_rect_debug_print("src: ", &plane_state->src, true);
> -		drm_rect_debug_print("dst: ", &plane_state->dst, false);
> -		return -ERANGE;
> -	}
> -
>   	if (crtc_state->enable)
>   		drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip.y2);
>   
> @@ -921,6 +905,90 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>   
>   	return 0;
>   }
> +EXPORT_SYMBOL(drm_atomic_helper_check_plane_noscale);
> +
> +/**
> + * drm_atomic_helper_check_plane_scale() - Check whether plane can be scaled
> + * @plane_state: plane state to check
> + * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
> + * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
> + *
> + * Checks that a desired plane scale fits into the min_scale..max_scale
> + * boundaries.
> + * Drivers that provide their own plane handling rather than helper-provided
> + * implementations may still wish to call this function to avoid duplication of
> + * error checking code.
> + *
> + * RETURNS:
> + * Zero if update appears valid, error code on failure
> + */
> +int drm_atomic_helper_check_plane_scale(struct drm_plane_state *plane_state,
> +					int min_scale,
> +					int max_scale)
> +{
> +	struct drm_framebuffer *fb = plane_state->fb;
> +	struct drm_rect src;
> +	struct drm_rect dst;
> +	int hscale, vscale;
> +
> +	if (!plane_state->visible)
> +		return 0;
> +
> +	src = drm_plane_state_src(plane_state);
> +	dst = drm_plane_state_dest(plane_state);
> +
> +	drm_rect_rotate(&src, fb->width << 16, fb->height << 16, plane_state->rotation);
> +

Does this need to be accompanied by a drm_rect_rotate_inv()?

> +	hscale = drm_rect_calc_hscale(&src, &dst, min_scale, max_scale);
> +	vscale = drm_rect_calc_vscale(&src, &dst, min_scale, max_scale);
> +	if (hscale < 0 || vscale < 0) {
> +		drm_dbg_kms(plane_state->plane->dev,
> +			    "Invalid scaling of plane\n");
> +		drm_rect_debug_print("src: ", &plane_state->src, true);
> +		drm_rect_debug_print("dst: ", &plane_state->dst, false);
> +		return -ERANGE;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_check_plane_scale);
> +
> +/**
> + * drm_atomic_helper_check_plane_state() - Check plane state for validity
> + * @plane_state: plane state to check
> + * @crtc_state: CRTC state to check
> + * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
> + * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
> + * @can_position: is it legal to position the plane such that it
> + *                doesn't cover the entire CRTC?  This will generally
> + *                only be false for primary planes.
> + * @can_update_disabled: can the plane be updated while the CRTC
> + *                       is disabled?
> + *
> + * Checks that a desired plane update is valid, and updates various
> + * bits of derived state (clipped coordinates etc.). Drivers that provide
> + * their own plane handling rather than helper-provided implementations may
> + * still wish to call this function to avoid duplication of error checking
> + * code.
> + *
> + * RETURNS:
> + * Zero if update appears valid, error code on failure
> + */
> +int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
> +					const struct drm_crtc_state *crtc_state,
> +					int min_scale,
> +					int max_scale,
> +					bool can_position,
> +					bool can_update_disabled)
> +{
> +	int ret;
> +
> +	ret = drm_atomic_helper_check_plane_noscale(plane_state, crtc_state, can_position, can_update_disabled);
> +	if (ret < 0)
> +		return ret;
> +
> +	return drm_atomic_helper_check_plane_scale(plane_state, min_scale, max_scale);
> +}
>   EXPORT_SYMBOL(drm_atomic_helper_check_plane_state);
>   
>   /**
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 536a0b0091c3..32ac55aea94e 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -52,6 +52,13 @@ int drm_atomic_helper_check_modeset(struct drm_device *dev,
>   int
>   drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
>   					 struct drm_connector_state *conn_state);
> +int drm_atomic_helper_check_plane_noscale(struct drm_plane_state *plane_state,
> +					  const struct drm_crtc_state *crtc_state,
> +					  bool can_position,
> +					  bool can_update_disabled);
> +int drm_atomic_helper_check_plane_scale(struct drm_plane_state *plane_state,
> +					int min_scale,
> +					int max_scale);
>   int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>   					const struct drm_crtc_state *crtc_state,
>   					int min_scale,
