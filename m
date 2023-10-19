Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD49C7CEEDD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 06:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791AD10E468;
	Thu, 19 Oct 2023 04:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2151210E1CD;
 Thu, 19 Oct 2023 04:59:37 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39J488bJ020106; Thu, 19 Oct 2023 04:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Shv/gu2WxqfXj6igQ+HBZiXVP6UaZGRxmsD45tl/jyg=;
 b=Gh/2IQ3ISUEQcSVxmSeYRdFeW91bAiERcXMywKVG+DfIOKZpsi6TorgoAUT7J6xwaZcz
 ojbVzZBi+RuC/X3SR7Z0rovOiE4CKNCvVJnGmX6IdulZewd1ZE9aX61oKN5cijaF2USk
 fAGI8Nb52GIbC2UV2vzCLs9jjO/IccxTy3qZL+43lAoZbd+BWPA2xR0OsCvKQt0gmT7B
 VNY5srQUukllkqSnTJYZepgbKIN5hyzWBEnSRTLXg+qzKkPjo2pRUVHPPNolaQN4RbIz
 hX5nEBa4hHY+fKbNm2LkmsCaxfZ8bzt48ksUzG9v1G8yqlE2ApNZyjwL+5CDZ19Zkt3M HQ== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tt5v8313b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Oct 2023 04:59:14 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39J4xDDQ017397
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Oct 2023 04:59:13 GMT
Received: from [10.110.13.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 18 Oct
 2023 21:59:11 -0700
Message-ID: <95de0504-dc26-4cb8-9339-9aa811cac315@quicinc.com>
Date: Wed, 18 Oct 2023 21:59:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 01/10] drm: Introduce pixel_source DRM plane
 property
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-1-a820efcce852@quicinc.com>
 <93a64016-0dca-4480-a178-9085c312c8e5@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <93a64016-0dca-4480-a178-9085c312c8e5@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xY049vsMtkqvsd2raFIZDHsLPqJhaJXG
X-Proofpoint-ORIG-GUID: xY049vsMtkqvsd2raFIZDHsLPqJhaJXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_02,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=657 lowpriorityscore=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190042
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



On 9/24/2023 3:06 AM, Dmitry Baryshkov wrote:
> On 29/08/2023 03:05, Jessica Zhang wrote:
>> Add support for pixel_source property to drm_plane and related
>> documentation. In addition, force pixel_source to
>> DRM_PLANE_PIXEL_SOURCE_FB in DRM_IOCTL_MODE_SETPLANE as to not break
>> legacy userspace.
>>
>> This enum property will allow user to specify a pixel source for the
>> plane. Possible pixel sources will be defined in the
>> drm_plane_pixel_source enum.
>>
>> Currently, the only pixel sources are DRM_PLANE_PIXEL_SOURCE_FB (the
>> default value) and DRM_PLANE_PIXEL_SOURCE_NONE.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Minor question below
> 
>> ---
>>   drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>>   drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
>>   drivers/gpu/drm/drm_blend.c               | 90 
>> +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/drm_plane.c               | 19 +++++--
>>   include/drm/drm_blend.h                   |  2 +
>>   include/drm/drm_plane.h                   | 21 ++++++++
>>   6 files changed, 133 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c 
>> b/drivers/gpu/drm/drm_atomic_state_helper.c
>> index 784e63d70a42..01638c51ce0a 100644
>> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
>> @@ -252,6 +252,7 @@ void __drm_atomic_helper_plane_state_reset(struct 
>> drm_plane_state *plane_state,
>>       plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>>       plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
>> +    plane_state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;
>>       if (plane->color_encoding_property) {
>>           if (!drm_object_property_get_default_value(&plane->base,
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c 
>> b/drivers/gpu/drm/drm_atomic_uapi.c
>> index d867e7f9f2cd..454f980e16c9 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -544,6 +544,8 @@ static int drm_atomic_plane_set_property(struct 
>> drm_plane *plane,
>>           state->src_w = val;
>>       } else if (property == config->prop_src_h) {
>>           state->src_h = val;
>> +    } else if (property == plane->pixel_source_property) {
>> +        state->pixel_source = val;
>>       } else if (property == plane->alpha_property) {
>>           state->alpha = val;
>>       } else if (property == plane->blend_mode_property) {
>> @@ -616,6 +618,8 @@ drm_atomic_plane_get_property(struct drm_plane 
>> *plane,
>>           *val = state->src_w;
>>       } else if (property == config->prop_src_h) {
>>           *val = state->src_h;
>> +    } else if (property == plane->pixel_source_property) {
>> +        *val = state->pixel_source;
>>       } else if (property == plane->alpha_property) {
>>           *val = state->alpha;
>>       } else if (property == plane->blend_mode_property) {
>> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
>> index 6e74de833466..c3c57bae06b7 100644
>> --- a/drivers/gpu/drm/drm_blend.c
>> +++ b/drivers/gpu/drm/drm_blend.c
>> @@ -185,6 +185,21 @@
>>    *         plane does not expose the "alpha" property, then this is
>>    *         assumed to be 1.0
>>    *
>> + * pixel_source:
>> + *    pixel_source is set up with 
>> drm_plane_create_pixel_source_property().
>> + *    It is used to toggle the active source of pixel data for the 
>> plane.
>> + *    The plane will only display data from the set pixel_source -- any
>> + *    data from other sources will be ignored.
>> + *
>> + *    Possible values:
>> + *
>> + *    "NONE":
>> + *        No active pixel source.
>> + *        Committing with a NONE pixel source will disable the plane.
>> + *
>> + *    "FB":
>> + *        Framebuffer source set by the "FB_ID" property.
>> + *
>>    * Note that all the property extensions described here apply either 
>> to the
>>    * plane or the CRTC (e.g. for the background color, which currently 
>> is not
>>    * exposed and assumed to be black).
>> @@ -615,3 +630,78 @@ int drm_plane_create_blend_mode_property(struct 
>> drm_plane *plane,
>>       return 0;
>>   }
>>   EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
>> +
>> +static const struct drm_prop_enum_list drm_pixel_source_enum_list[] = {
>> +    { DRM_PLANE_PIXEL_SOURCE_NONE, "NONE" },
>> +    { DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
>> +};
>> +
>> +/**
>> + * drm_plane_create_pixel_source_property - create a new pixel source 
>> property
>> + * @plane: DRM plane
>> + * @extra_sources: Bitmask of additional supported pixel_sources for 
>> the driver.
>> + *           DRM_PLANE_PIXEL_SOURCE_FB and 
>> DRM_PLANE_PIXEL_SOURCE_NONE will
>> + *           always be enabled as supported sources.
>> + *
>> + * This creates a new property describing the current source of pixel 
>> data for the
>> + * plane. The pixel_source will be initialized as 
>> DRM_PLANE_PIXEL_SOURCE_FB by default.
>> + *
>> + * Drivers can set a custom default source by overriding the 
>> pixel_source value in
>> + * drm_plane_funcs.reset()
>> + *
>> + * The property is exposed to userspace as an enumeration property 
>> called
>> + * "pixel_source" and has the following enumeration values:
>> + *
>> + * "NONE":
>> + *     No active pixel source
>> + *
>> + * "FB":
>> + *    Framebuffer pixel source
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
>> +                       unsigned long extra_sources)
>> +{
>> +    struct drm_device *dev = plane->dev;
>> +    struct drm_property *prop;
>> +    static const unsigned int valid_source_mask = 
>> BIT(DRM_PLANE_PIXEL_SOURCE_FB) |
>> +                              BIT(DRM_PLANE_PIXEL_SOURCE_NONE);
> 
> Nit: if valid_source_mask and supported_sources are moved towards the 
> top, it might look better. It doesn't warrant sending v7 just to fix 
> this issue though.

Hi Dmitry,

Acked, I can move these to the top of the function.

> 
>> +    int i;
>> +
>> +    /* FB is supported by default */
>> +    unsigned long supported_sources = extra_sources |
>> +                      BIT(DRM_PLANE_PIXEL_SOURCE_FB) |
>> +                      BIT(DRM_PLANE_PIXEL_SOURCE_NONE);
> 
> As you are going to extend planes to support non-FB sources, would it be 
> logical to stop declaring FB as a default one as well? I think DIM layer 
> planes will only support solid fill source.

I think there was some discussion about this in v4 -- I chose to have FB 
supported by default so we could set FB as the default pixel source in 
the plane state reset(). Otherwise we'd have to track the default pixel 
source for each plane.

Thanks,

Jessica Zhang

> 
>> +
>> +    if (WARN_ON(supported_sources & ~valid_source_mask))
>> +        return -EINVAL;
>> +
>> +    prop = drm_property_create(dev, DRM_MODE_PROP_ENUM | 
>> DRM_MODE_PROP_ATOMIC, "pixel_source",
>> +            hweight32(supported_sources));
>> +
>> +    if (!prop)
>> +        return -ENOMEM;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(drm_pixel_source_enum_list); i++) {
>> +        int ret;
>> +
>> +        if (!test_bit(drm_pixel_source_enum_list[i].type, 
>> &supported_sources))
>> +            continue;
>> +
>> +        ret = drm_property_add_enum(prop, 
>> drm_pixel_source_enum_list[i].type,
>> +                drm_pixel_source_enum_list[i].name);
>> +        if (ret) {
>> +            drm_property_destroy(dev, prop);
>> +
>> +            return ret;
>> +        }
>> +    }
>> +
>> +    drm_object_attach_property(&plane->base, prop, 
>> DRM_PLANE_PIXEL_SOURCE_FB);
>> +    plane->pixel_source_property = prop;
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL(drm_plane_create_pixel_source_property);
>> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
>> index 24e7998d1731..559d101162ba 100644
>> --- a/drivers/gpu/drm/drm_plane.c
>> +++ b/drivers/gpu/drm/drm_plane.c
>> @@ -839,6 +839,14 @@ bool drm_any_plane_has_format(struct drm_device 
>> *dev,
>>   }
>>   EXPORT_SYMBOL(drm_any_plane_has_format);
>> +static bool drm_plane_needs_disable(struct drm_plane_state *state, 
>> struct drm_framebuffer *fb)
>> +{
>> +    if (state->pixel_source == DRM_PLANE_PIXEL_SOURCE_NONE)
>> +        return true;
>> +
>> +    return state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb == 
>> NULL;
>> +}
>> +
>>   /*
>>    * __setplane_internal - setplane handler for internal callers
>>    *
>> @@ -861,8 +869,8 @@ static int __setplane_internal(struct drm_plane 
>> *plane,
>>       WARN_ON(drm_drv_uses_atomic_modeset(plane->dev));
>> -    /* No fb means shut it down */
>> -    if (!fb) {
>> +    /* No visible data means shut it down */
>> +    if (drm_plane_needs_disable(plane->state, fb)) {
>>           plane->old_fb = plane->fb;
>>           ret = plane->funcs->disable_plane(plane, ctx);
>>           if (!ret) {
>> @@ -913,8 +921,8 @@ static int __setplane_atomic(struct drm_plane *plane,
>>       WARN_ON(!drm_drv_uses_atomic_modeset(plane->dev));
>> -    /* No fb means shut it down */
>> -    if (!fb)
>> +    /* No visible data means shut it down */
>> +    if (drm_plane_needs_disable(plane->state, fb))
>>           return plane->funcs->disable_plane(plane, ctx);
>>       /*
>> @@ -987,6 +995,9 @@ int drm_mode_setplane(struct drm_device *dev, void 
>> *data,
>>           return -ENOENT;
>>       }
>> +    if (plane->state)
>> +        plane->state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;
>> +
>>       if (plane_req->fb_id) {
>>           fb = drm_framebuffer_lookup(dev, file_priv, plane_req->fb_id);
>>           if (!fb) {
>> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
>> index 88bdfec3bd88..122bbfbaae33 100644
>> --- a/include/drm/drm_blend.h
>> +++ b/include/drm/drm_blend.h
>> @@ -58,4 +58,6 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
>>                     struct drm_atomic_state *state);
>>   int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>>                        unsigned int supported_modes);
>> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
>> +                       unsigned long extra_sources);
>>   #endif
>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>> index 51291983ea44..89508b4dea4a 100644
>> --- a/include/drm/drm_plane.h
>> +++ b/include/drm/drm_plane.h
>> @@ -40,6 +40,12 @@ enum drm_scaling_filter {
>>       DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
>>   };
>> +enum drm_plane_pixel_source {
>> +    DRM_PLANE_PIXEL_SOURCE_NONE,
>> +    DRM_PLANE_PIXEL_SOURCE_FB,
>> +    DRM_PLANE_PIXEL_SOURCE_MAX
>> +};
>> +
>>   /**
>>    * struct drm_plane_state - mutable plane state
>>    *
>> @@ -116,6 +122,14 @@ struct drm_plane_state {
>>       /** @src_h: height of visible portion of plane (in 16.16) */
>>       uint32_t src_h, src_w;
>> +    /**
>> +     * @pixel_source:
>> +     *
>> +     * Source of pixel information for the plane. See
>> +     * drm_plane_create_pixel_source_property() for more details.
>> +     */
>> +    enum drm_plane_pixel_source pixel_source;
>> +
>>       /**
>>        * @alpha:
>>        * Opacity of the plane with 0 as completely transparent and 
>> 0xffff as
>> @@ -699,6 +713,13 @@ struct drm_plane {
>>        */
>>       struct drm_plane_state *state;
>> +    /*
>> +     * @pixel_source_property:
>> +     * Optional pixel_source property for this plane. See
>> +     * drm_plane_create_pixel_source_property().
>> +     */
>> +    struct drm_property *pixel_source_property;
>> +
>>       /**
>>        * @alpha_property:
>>        * Optional alpha property for this plane. See
>>
> 
> -- 
> With best wishes
> Dmitry
> 
