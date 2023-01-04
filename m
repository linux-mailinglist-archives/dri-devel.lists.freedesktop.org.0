Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C4F65CB69
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 02:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CBE10E425;
	Wed,  4 Jan 2023 01:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8A210E424;
 Wed,  4 Jan 2023 01:27:47 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3040V1Jk029156; Wed, 4 Jan 2023 01:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=R1pWESGy4WCNoqdFCeMsZw6mTir945ml5kResXfWkkU=;
 b=ldf2Q6d5ydq6zRM8sAuoY6GfzEU3ULtGUX3Ywl1LOj+sW3KcqLrph3pK/YLGwcw4Yj4O
 UEXRM+1cv6JCdwWVGPrF7a6eTSMD0ug/XcP6e9YoKMyEccdkKjLwpNSZ146g5K95TfqB
 C+Kt5OoI6gcG6ibdQN2FNXBlHWdNX4zEmr5vEKh+rVvPWdtiuMBG5pBNHlX5dldqhNvH
 XR1c4Pj9kjgK/pLNbrSD3Ito36fa4QsT7ugChKvY9AMQVhmEK5XdwKnlI2B07AaiPVbM
 DowKcd8+GcqMEMRfO2+2WW8PZN9puPZe6v5PD0mo01Qn49z2T7Jm7x5mgEKSNKWJMWpo OQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mvsvm0hf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Jan 2023 01:27:21 +0000
Received: from nasanex01b.na.qualcomm.com (corens_vlan604_snip.qualcomm.com
 [10.53.140.1])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3041RLri026533
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 4 Jan 2023 01:27:21 GMT
Received: from [10.110.122.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 3 Jan 2023
 17:27:19 -0800
Message-ID: <0cd96618-9b07-07dd-bc73-90d85f3d1f7f@quicinc.com>
Date: Tue, 3 Jan 2023 17:27:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 2/3] drm: Adjust atomic checks for solid fill color
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20221222221441.6980-1-quic_jesszhan@quicinc.com>
 <20221222221441.6980-3-quic_jesszhan@quicinc.com>
 <62913cff-8311-cb8c-a746-8e8e3b78d936@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <62913cff-8311-cb8c-a746-8e8e3b78d936@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: PWzj_wv2kMaRjqFD7mQxMxk7YgMPyLY7
X-Proofpoint-ORIG-GUID: PWzj_wv2kMaRjqFD7mQxMxk7YgMPyLY7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_08,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301040010
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
Cc: sebastian.wick@redhat.com, ppaalanen@gmail.com,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/22/2022 7:08 PM, Dmitry Baryshkov wrote:
> On 23/12/2022 00:14, Jessica Zhang wrote:
>> Loosen the requirements for atomic and legacy commit so that, in cases
>> where solid fill planes is enabled (and FB_ID is NULL), the commit can
>> still go through.
>>
>> In addition, add framebuffer NULL checks in other areas to account for
>> FB being NULL when solid fill is enabled.
>>
>> Changes in V2:
>> - Changed to checks for if solid_fill_blob is set (Dmitry)
>> - Abstracted (plane_state && !solid_fill_blob) checks to helper method
>>    (Dmitry)
>> - Fixed indentation issue (Dmitry)
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/drm_atomic.c        | 69 ++++++++++++++++-------------
>>   drivers/gpu/drm/drm_atomic_helper.c | 34 ++++++++------
>>   drivers/gpu/drm/drm_plane.c         |  8 ++--
>>   include/drm/drm_atomic_helper.h     |  6 ++-
>>   include/drm/drm_plane.h             | 12 +++++
>>   5 files changed, 78 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
>> index f197f59f6d99..b92d75bda7fd 100644
>> --- a/drivers/gpu/drm/drm_atomic.c
>> +++ b/drivers/gpu/drm/drm_atomic.c
>> @@ -601,8 +601,10 @@ static int drm_atomic_plane_check(const struct 
>> drm_plane_state *old_plane_state,
>>       uint32_t num_clips;
>>       int ret;
>> -    /* either *both* CRTC and FB must be set, or neither */
>> -    if (crtc && !fb) {
>> +    /* When solid_fill is disabled,
>> +     * either *both* CRTC and FB must be set, or neither
>> +     */
> 
> The cause and effect logic seems to be broken here. I'd expect something 
> like: "When CRTC is set, at least one of fb and solid_fill should be set."
> 
> Also it might be worth defining
> bool drm_plane_has_visible_data(struct drm_plane_state *state)
> {
>     return state->fb || drm_plane_solid_fill_enabled(state);
> }
> 
> Then you can use this function here and below, where you check both fb 
> and solid_fill property.

Hi Dmitry,

Sounds good, that makes more sense.

> 
>> +    if (crtc && !fb && !new_plane_state->solid_fill_blob) {
>>           drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no 
>> FB\n",
>>                      plane->base.id, plane->name);
>>           return -EINVAL;
>> @@ -626,14 +628,17 @@ static int drm_atomic_plane_check(const struct 
>> drm_plane_state *old_plane_state,
>>       }
>>       /* Check whether this plane supports the fb pixel format. */
>> -    ret = drm_plane_check_pixel_format(plane, fb->format->format,
>> -                       fb->modifier);
>> -    if (ret) {
>> -        drm_dbg_atomic(plane->dev,
>> -                   "[PLANE:%d:%s] invalid pixel format %p4cc, 
>> modifier 0x%llx\n",
>> -                   plane->base.id, plane->name,
>> -                   &fb->format->format, fb->modifier);
>> -        return ret;
>> +    if (fb) {
>> +        ret = drm_plane_check_pixel_format(plane, fb->format->format,
>> +                           fb->modifier);
>> +
>> +        if (ret) {
>> +            drm_dbg_atomic(plane->dev,
>> +                       "[PLANE:%d:%s] invalid pixel format %p4cc, 
>> modifier 0x%llx\n",
>> +                       plane->base.id, plane->name,
>> +                       &fb->format->format, fb->modifier);
>> +            return ret;
>> +        }
> 
> I'd suggest merging twof if(fb) blocks and extracting them to a separate 
> functions.

Noted.

> 
>>       }
>>       /* Give drivers some help against integer overflows */
>> @@ -649,28 +654,30 @@ static int drm_atomic_plane_check(const struct 
>> drm_plane_state *old_plane_state,
>>           return -ERANGE;
>>       }
>> -    fb_width = fb->width << 16;
>> -    fb_height = fb->height << 16;
>> +    if (fb) {
>> +        fb_width = fb->width << 16;
>> +        fb_height = fb->height << 16;
>> -    /* Make sure source coordinates are inside the fb. */
>> -    if (new_plane_state->src_w > fb_width ||
>> -        new_plane_state->src_x > fb_width - new_plane_state->src_w ||
>> -        new_plane_state->src_h > fb_height ||
>> -        new_plane_state->src_y > fb_height - new_plane_state->src_h) {
>> -        drm_dbg_atomic(plane->dev,
>> -                   "[PLANE:%d:%s] invalid source coordinates "
>> -                   "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
>> -                   plane->base.id, plane->name,
>> -                   new_plane_state->src_w >> 16,
>> -                   ((new_plane_state->src_w & 0xffff) * 15625) >> 10,
>> -                   new_plane_state->src_h >> 16,
>> -                   ((new_plane_state->src_h & 0xffff) * 15625) >> 10,
>> -                   new_plane_state->src_x >> 16,
>> -                   ((new_plane_state->src_x & 0xffff) * 15625) >> 10,
>> -                   new_plane_state->src_y >> 16,
>> -                   ((new_plane_state->src_y & 0xffff) * 15625) >> 10,
>> -                   fb->width, fb->height);
>> -        return -ENOSPC;
>> +        /* Make sure source coordinates are inside the fb. */
>> +        if (new_plane_state->src_w > fb_width ||
>> +            new_plane_state->src_x > fb_width - 
>> new_plane_state->src_w ||
>> +            new_plane_state->src_h > fb_height ||
>> +            new_plane_state->src_y > fb_height - 
>> new_plane_state->src_h) {
>> +            drm_dbg_atomic(plane->dev,
>> +                       "[PLANE:%d:%s] invalid source coordinates "
>> +                       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
>> +                       plane->base.id, plane->name,
>> +                       new_plane_state->src_w >> 16,
>> +                       ((new_plane_state->src_w & 0xffff) * 15625) >> 
>> 10,
>> +                       new_plane_state->src_h >> 16,
>> +                       ((new_plane_state->src_h & 0xffff) * 15625) >> 
>> 10,
>> +                       new_plane_state->src_x >> 16,
>> +                       ((new_plane_state->src_x & 0xffff) * 15625) >> 
>> 10,
>> +                       new_plane_state->src_y >> 16,
>> +                       ((new_plane_state->src_y & 0xffff) * 15625) >> 
>> 10,
>> +                       fb->width, fb->height);
>> +            return -ENOSPC;
>> +        }
>>       }
>>       clips = __drm_plane_get_damage_clips(new_plane_state);
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c 
>> b/drivers/gpu/drm/drm_atomic_helper.c
>> index 1a586b3c454b..b53897f882c1 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -864,7 +864,7 @@ int drm_atomic_helper_check_plane_state(struct 
>> drm_plane_state *plane_state,
>>       *src = drm_plane_state_src(plane_state);
>>       *dst = drm_plane_state_dest(plane_state);
>> -    if (!fb) {
>> +    if (!fb && !drm_plane_solid_fill_enabled(plane_state)) {
>>           plane_state->visible = false;
>>           return 0;
>>       }
>> @@ -881,25 +881,31 @@ int drm_atomic_helper_check_plane_state(struct 
>> drm_plane_state *plane_state,
>>           return -EINVAL;
>>       }
>> -    drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
>> +    if (fb) {
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
>> +    if (drm_plane_solid_fill_enabled(plane_state)) {
>> +        plane_state->visible = true;
>> +    } else if (fb) {
>> +        plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
>> +        drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, 
>> rotation);
>> +    }
> 
> I'd invert the order here:
> 
> if (fb)
>     ....
> else if (drm_plane_solid_fill_enabled(...)
>     ....
> 

Noted.

>>       if (!plane_state->visible)
>>           /*
>> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
>> index 33357629a7f5..bdce2acbef6a 100644
>> --- a/drivers/gpu/drm/drm_plane.c
>> +++ b/drivers/gpu/drm/drm_plane.c
>> @@ -856,8 +856,8 @@ static int __setplane_internal(struct drm_plane 
>> *plane,
>>       WARN_ON(drm_drv_uses_atomic_modeset(plane->dev));
>> -    /* No fb means shut it down */
>> -    if (!fb) {
>> +    /* No fb and no color fill means shut it down */
>> +    if (!fb && !drm_plane_solid_fill_enabled(plane->state)) {
>>           plane->old_fb = plane->fb;
>>           ret = plane->funcs->disable_plane(plane, ctx);
>>           if (!ret) {
>> @@ -908,8 +908,8 @@ static int __setplane_atomic(struct drm_plane *plane,
>>       WARN_ON(!drm_drv_uses_atomic_modeset(plane->dev));
>> -    /* No fb means shut it down */
>> -    if (!fb)
>> +    /* No fb and no color fill means shut it down */
>> +    if (!fb && !drm_plane_solid_fill_enabled(plane->state))
>>           return plane->funcs->disable_plane(plane, ctx);
>>       /*
>> diff --git a/include/drm/drm_atomic_helper.h 
>> b/include/drm/drm_atomic_helper.h
>> index 33f982cd1a27..16a2a8edcc68 100644
>> --- a/include/drm/drm_atomic_helper.h
>> +++ b/include/drm/drm_atomic_helper.h
>> @@ -230,8 +230,10 @@ drm_atomic_plane_disabling(struct drm_plane_state 
>> *old_plane_state,
>>        * Anything else should be considered a bug in the atomic core, 
>> so we
>>        * gently warn about it.
>>        */
>> -    WARN_ON((new_plane_state->crtc == NULL && new_plane_state->fb != 
>> NULL) ||
>> -        (new_plane_state->crtc != NULL && new_plane_state->fb == NULL));
>> +    WARN_ON(!new_plane_state->solid_fill_blob &&
>> +        ((new_plane_state->crtc == NULL && new_plane_state->fb != 
>> NULL) ||
>> +                (new_plane_state->crtc != NULL &&
>> +                 new_plane_state->fb == NULL)));
> 
> Not quite. This means that if solid_fill_blob is set, then it doesn't 
> matter whether crtc or fb is NULL.

Good point -- will change the conditional to something similar to the 
one in drm_atomic_plane_check()

> 
> Also please fix the indentation of your changes. Original code was 
> logical, your indent is not.

Ah, I see what you mean. Should have aligned the parentheses instead of 
indenting more.

Thanks,

Jessica Zhang

> 
>>       return old_plane_state->crtc && !new_plane_state->crtc;
>>   }
>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>> index be5ab5f7b477..a9e6a09a75f7 100644
>> --- a/include/drm/drm_plane.h
>> +++ b/include/drm/drm_plane.h
>> @@ -977,6 +977,18 @@ static inline struct drm_plane 
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
>> +    return state && state->solid_fill_blob;
>> +}
>> +
>>   bool drm_any_plane_has_format(struct drm_device *dev,
>>                     u32 format, u64 modifier);
> 
> -- 
> With best wishes
> Dmitry
> 
