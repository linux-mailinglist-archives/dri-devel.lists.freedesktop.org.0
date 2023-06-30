Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23B5744554
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 01:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F067310E1CA;
	Fri, 30 Jun 2023 23:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8090210E1CA;
 Fri, 30 Jun 2023 23:41:24 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35UNdmDU030607; Fri, 30 Jun 2023 23:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=luijpc0NOOe5IQkoDSmVrN+xLXKRJGam5Wulqetk3FE=;
 b=S05PLl/zOx1S/EseYK4s+arTs8DhXXEAgNQ2qJH5MNsh3KbwjWXRwisagjV1GoFd3i4D
 Y0ev6YNf4QzmKU5M0ylwre2+ZQwk0ZrGqwXn5PEKjDfF580HnwnhnBNbaYVvCpkLMSTT
 Je3Pcc2IN7th0JE9/hXy2fCrCAiuXBBiWu1EqEMC6c6a4XvAsrlGZwZsuZ7JApCjxaaS
 bFq6xKlXoTZCTZVRhtO+Uqmc6sUHp91ZR4/jBY1Nf4k2HK5Ttlmh9nwZRD/3MOwZhiX0
 bHpk7GGcY25pPUGa3NJQl8PVG1jPFOG8amLG5QO8EmsOncoWa/g3TKmmr5YSTn5pg4fW Tg== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rhw9uhjj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 23:41:11 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35UNfAcO017825
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 23:41:10 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 30 Jun
 2023 16:41:10 -0700
Message-ID: <82c36f6f-66c2-5b1c-01de-e6d2a858853c@quicinc.com>
Date: Fri, 30 Jun 2023 16:41:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH RFC v4 4/7] drm/atomic: Loosen FB atomic checks
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-4-f4ec0caa742d@quicinc.com>
 <2a5cdfcc-b220-f19b-7410-73e59b31e4a4@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <2a5cdfcc-b220-f19b-7410-73e59b31e4a4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 7hI9Akdbchxye3Di9S_FtuCdDK-7mv8f
X-Proofpoint-GUID: 7hI9Akdbchxye3Di9S_FtuCdDK-7mv8f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_13,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306300207
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
Cc: sebastian.wick@redhat.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/29/2023 5:48 PM, Dmitry Baryshkov wrote:
> On 30/06/2023 03:25, Jessica Zhang wrote:
>> Loosen the requirements for atomic and legacy commit so that, in cases
>> where solid fill planes is enabled but no FB is set, the commit can
>> still go through.
>>
>> This includes adding framebuffer NULL checks in other areas to account
>> for FB being NULL when solid fill is enabled.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/drm_atomic.c        | 14 +++++++-------
>>   drivers/gpu/drm/drm_atomic_helper.c | 34 
>> ++++++++++++++++++++--------------
>>   drivers/gpu/drm/drm_plane.c         |  8 ++++----
>>   include/drm/drm_atomic_helper.h     |  4 ++--
>>   include/drm/drm_plane.h             | 28 ++++++++++++++++++++++++++++
>>   5 files changed, 61 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
>> index 404b984d2d9f..ec9681c25366 100644
>> --- a/drivers/gpu/drm/drm_atomic.c
>> +++ b/drivers/gpu/drm/drm_atomic.c
>> @@ -668,14 +668,14 @@ static int drm_atomic_plane_check(const struct 
>> drm_plane_state *old_plane_state,
>>       const struct drm_framebuffer *fb = new_plane_state->fb;
>>       int ret;
>> -    /* either *both* CRTC and FB must be set, or neither */
>> -    if (crtc && !fb) {
>> -        drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no FB\n",
>> +    /* either *both* CRTC and pixel source must be set, or neither */
>> +    if (crtc && !drm_plane_has_visible_data(new_plane_state)) {
>> +        drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no 
>> visible data\n",
>>                      plane->base.id, plane->name);
>>           return -EINVAL;
>> -    } else if (fb && !crtc) {
>> -        drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] FB set but no CRTC\n",
>> -                   plane->base.id, plane->name);
>> +    } else if (drm_plane_has_visible_data(new_plane_state) && !crtc) {
>> +        drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] Source %d has 
>> visible data but no CRTC\n",
>> +                   plane->base.id, plane->name, 
>> new_plane_state->pixel_source);
>>           return -EINVAL;
>>       }
>> @@ -706,7 +706,7 @@ static int drm_atomic_plane_check(const struct 
>> drm_plane_state *old_plane_state,
>>       }
>> -    if (fb) {
>> +    if (new_plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && 
>> fb) {
>>           ret = drm_atomic_check_fb(new_plane_state);
>>           if (ret)
>>               return ret;
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c 
>> b/drivers/gpu/drm/drm_atomic_helper.c
>> index 41b8066f61ff..d05ec9ef2b3e 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -864,7 +864,7 @@ int drm_atomic_helper_check_plane_state(struct 
>> drm_plane_state *plane_state,
>>       *src = drm_plane_state_src(plane_state);
>>       *dst = drm_plane_state_dest(plane_state);
>> -    if (!fb) {
>> +    if (!drm_plane_has_visible_data(plane_state)) {
>>           plane_state->visible = false;
>>           return 0;
>>       }
>> @@ -881,25 +881,31 @@ int drm_atomic_helper_check_plane_state(struct 
>> drm_plane_state *plane_state,
>>           return -EINVAL;
>>       }
>> -    drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
>> +    if (plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb) {
>> +        drm_rect_rotate(src, fb->width << 16, fb->height << 16, 
>> rotation);
>> -    /* Check scaling */
>> -    hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
>> -    vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
>> -    if (hscale < 0 || vscale < 0) {
>> -        drm_dbg_kms(plane_state->plane->dev,
>> -                "Invalid scaling of plane\n");
>> -        drm_rect_debug_print("src: ", &plane_state->src, true);
>> -        drm_rect_debug_print("dst: ", &plane_state->dst, false);
>> -        return -ERANGE;
>> +        /* Check scaling */
>> +        hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
>> +        vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
>> +
>> +        if (hscale < 0 || vscale < 0) {
>> +            drm_dbg_kms(plane_state->plane->dev,
>> +                    "Invalid scaling of plane\n");
>> +            drm_rect_debug_print("src: ", &plane_state->src, true);
>> +            drm_rect_debug_print("dst: ", &plane_state->dst, false);
>> +            return -ERANGE;
>> +        }
>>       }
>>       if (crtc_state->enable)
>>           drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip.y2);
>> -    plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
>> -
>> -    drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, 
>> rotation);
>> +    if (plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb) {
>> +        plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
>> +        drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, 
>> rotation);
>> +    } else if (drm_plane_solid_fill_enabled(plane_state)) {
>> +        plane_state->visible = true;
>> +    }
>>       if (!plane_state->visible)
>>           /*
>> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
>> index 24e7998d1731..5f19a27ba182 100644
>> --- a/drivers/gpu/drm/drm_plane.c
>> +++ b/drivers/gpu/drm/drm_plane.c
>> @@ -861,8 +861,8 @@ static int __setplane_internal(struct drm_plane 
>> *plane,
>>       WARN_ON(drm_drv_uses_atomic_modeset(plane->dev));
>> -    /* No fb means shut it down */
>> -    if (!fb) {
>> +    /* No visible data means shut it down */
>> +    if (!drm_plane_has_visible_data(plane->state)) {
>>           plane->old_fb = plane->fb;
>>           ret = plane->funcs->disable_plane(plane, ctx);
>>           if (!ret) {
>> @@ -913,8 +913,8 @@ static int __setplane_atomic(struct drm_plane *plane,
>>       WARN_ON(!drm_drv_uses_atomic_modeset(plane->dev));
>> -    /* No fb means shut it down */
>> -    if (!fb)
>> +    /* No visible data means shut it down */
>> +    if (!drm_plane_has_visible_data(plane->state))
>>           return plane->funcs->disable_plane(plane, ctx);
>>       /*
>> diff --git a/include/drm/drm_atomic_helper.h 
>> b/include/drm/drm_atomic_helper.h
>> index 536a0b0091c3..6d97f38ac1f6 100644
>> --- a/include/drm/drm_atomic_helper.h
>> +++ b/include/drm/drm_atomic_helper.h
>> @@ -256,8 +256,8 @@ drm_atomic_plane_disabling(struct drm_plane_state 
>> *old_plane_state,
>>        * Anything else should be considered a bug in the atomic core, 
>> so we
>>        * gently warn about it.
>>        */
>> -    WARN_ON((new_plane_state->crtc == NULL && new_plane_state->fb != 
>> NULL) ||
>> -        (new_plane_state->crtc != NULL && new_plane_state->fb == NULL));
>> +    WARN_ON((new_plane_state->crtc == NULL && 
>> drm_plane_has_visible_data(new_plane_state)) ||
>> +        (new_plane_state->crtc != NULL && 
>> !drm_plane_has_visible_data(new_plane_state)));
>>       return old_plane_state->crtc && !new_plane_state->crtc;
>>   }
>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>> index 73fb6cf8a5d9..f893f7a56912 100644
>> --- a/include/drm/drm_plane.h
>> +++ b/include/drm/drm_plane.h
>> @@ -998,6 +998,34 @@ static inline struct drm_plane 
>> *drm_plane_find(struct drm_device *dev,
>>   #define drm_for_each_plane(plane, dev) \
>>       list_for_each_entry(plane, &(dev)->mode_config.plane_list, head)
>> +/**
>> + * drm_plane_solid_fill_enabled - Check if solid fill is enabled on 
>> plane
>> + * @state: plane state
>> + *
>> + * Returns:
>> + * Whether the plane has been assigned a solid_fill_blob
>> + */
>> +static inline bool drm_plane_solid_fill_enabled(struct 
>> drm_plane_state *state)
>> +{
>> +    if (!state)
>> +        return false;
>> +    return state->pixel_source == DRM_PLANE_PIXEL_SOURCE_COLOR && 
>> state->solid_fill_blob;
>> +}
>> +
>> +static inline bool drm_plane_has_visible_data(const struct 
>> drm_plane_state *state)
>> +{
>> +    switch (state->pixel_source) {
>> +    case DRM_PLANE_PIXEL_SOURCE_COLOR:
>> +        return state->solid_fill_blob != NULL;
>> +
>> +    default:
> 
> I'd say, there should a WARN_ON for the default case and then 
> fallthrough to the FB case.

Hi Dmitry,

Sounds good.

Thanks,

Jessica Zhang

> 
>> +        return state->fb != NULL;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +
>>   bool drm_any_plane_has_format(struct drm_device *dev,
>>                     u32 format, u64 modifier);
>>
> 
> -- 
> With best wishes
> Dmitry
> 
