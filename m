Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 876C7614042
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 22:59:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F49D10E19A;
	Mon, 31 Oct 2022 21:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8154410E19A;
 Mon, 31 Oct 2022 21:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1667253539; x=1698789539;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aqLEGr3U3WnfEfbfQlPB2KHmwE3MLBwA9bUK+nByZCc=;
 b=aPFoePfEhmOc1yQgFJem6hXdRGNAZ/l2YLWngYZ/fmC52Qhu46JLRTGJ
 GXaW73M5r+Qo2ahPaW47lNfPKTaMnt1KcwGH28jLzUCb7uVrfxK/jXkY/
 6XMYsfDPx5HDfZlCbpdosLt54DOinASD9wzP0iet5jxl2qQ6bX8wNzBzw 4=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 31 Oct 2022 14:58:58 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 14:58:58 -0700
Received: from [10.71.111.47] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 31 Oct
 2022 14:58:58 -0700
Message-ID: <2ce98d20-097f-be48-5411-feba5e3bfef5@quicinc.com>
Date: Mon, 31 Oct 2022 14:58:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm plane
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
 <eddf4726-3d7e-601a-51ac-03adb2dd822b@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <eddf4726-3d7e-601a-51ac-03adb2dd822b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/29/2022 4:23 AM, Dmitry Baryshkov wrote:
> On 29/10/2022 01:59, Jessica Zhang wrote:
>> Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
>> drm_plane. In addition, add support for setting and getting the values
>> of these properties.
>>
>> COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
>> represents the format of the color fill. Userspace can set enable solid
>> fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
>> the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
>> framebuffer to NULL.
> 
> I suppose that COLOR_FILL should override framebuffer rather than 
> requiring that FB is set to NULL. In other words, if color_filL_format 
> is non-zero, it would make sense to ignore the FB. Then one can use the 
> color_fill_format property to quickly switch between filled plane and 
> FB-backed one.

Hey Dmitry,

I think this is a good idea -- acked.

> 
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/drm_atomic_uapi.c |  8 +++++++
>>   drivers/gpu/drm/drm_blend.c       | 38 +++++++++++++++++++++++++++++++
>>   include/drm/drm_blend.h           |  2 ++
>>   include/drm/drm_plane.h           | 28 +++++++++++++++++++++++
>>   4 files changed, 76 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c 
>> b/drivers/gpu/drm/drm_atomic_uapi.c
>> index 79730fa1dd8e..e1664463fca4 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -544,6 +544,10 @@ static int drm_atomic_plane_set_property(struct 
>> drm_plane *plane,
>>           state->src_w = val;
>>       } else if (property == config->prop_src_h) {
>>           state->src_h = val;
>> +    } else if (property == plane->color_fill_format_property) {
>> +        state->color_fill_format = val;
>> +    } else if (property == plane->color_fill_property) {
>> +        state->color_fill = val;
>>       } else if (property == plane->alpha_property) {
>>           state->alpha = val;
>>       } else if (property == plane->blend_mode_property) {
>> @@ -616,6 +620,10 @@ drm_atomic_plane_get_property(struct drm_plane 
>> *plane,
>>           *val = state->src_w;
>>       } else if (property == config->prop_src_h) {
>>           *val = state->src_h;
>> +    } else if (property == plane->color_fill_format_property) {
>> +        *val = state->color_fill_format;
>> +    } else if (property == plane->color_fill_property) {
>> +        *val = state->color_fill;
>>       } else if (property == plane->alpha_property) {
>>           *val = state->alpha;
>>       } else if (property == plane->blend_mode_property) {
>> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
>> index b4c8cab7158c..b8c2b263fa51 100644
>> --- a/drivers/gpu/drm/drm_blend.c
>> +++ b/drivers/gpu/drm/drm_blend.c
>> @@ -616,3 +616,41 @@ int drm_plane_create_blend_mode_property(struct 
>> drm_plane *plane,
>>       return 0;
>>   }
>>   EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
>> +
>> +int drm_plane_create_color_fill_property(struct drm_plane *plane)
>> +{
>> +    struct drm_property *prop;
>> +
>> +    prop = drm_property_create_range(plane->dev, 0, "color_fill",
>> +                     0, 0xffffffff);
>> +    if (!prop)
>> +        return -ENOMEM;
>> +
>> +    drm_object_attach_property(&plane->base, prop, 0);
>> +    plane->color_fill_property = prop;
>> +
>> +    if (plane->state)
>> +        plane->state->color_fill = 0;
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL(drm_plane_create_color_fill_property);
>> +
>> +int drm_plane_create_color_fill_format_property(struct drm_plane *plane)
>> +{
>> +    struct drm_property *prop;
>> +
>> +    prop = drm_property_create_range(plane->dev, 0, "color_fill_format",
>> +                     0, 0xffffffff);
>> +    if (!prop)
>> +        return -ENOMEM;
>> +
>> +    drm_object_attach_property(&plane->base, prop, 0);
>> +    plane->color_fill_format_property = prop;
>> +
>> +    if (plane->state)
>> +        plane->state->color_fill_format = 0;
> 
> Don't you also need to reset these properties in 
> __drm_atomic_helper_plane_state_reset() ?

Ah, yes I believe so -- acked.

Thanks,

Jessica Zhang

> 
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL(drm_plane_create_color_fill_format_property);
>> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
>> index 88bdfec3bd88..3e96f5e83cce 100644
>> --- a/include/drm/drm_blend.h
>> +++ b/include/drm/drm_blend.h
>> @@ -58,4 +58,6 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
>>                     struct drm_atomic_state *state);
>>   int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>>                        unsigned int supported_modes);
>> +int drm_plane_create_color_fill_property(struct drm_plane *plane);
>> +int drm_plane_create_color_fill_format_property(struct drm_plane 
>> *plane);
>>   #endif
>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>> index 89ea54652e87..dcbfdb0e1f71 100644
>> --- a/include/drm/drm_plane.h
>> +++ b/include/drm/drm_plane.h
>> @@ -116,6 +116,20 @@ struct drm_plane_state {
>>       /** @src_h: height of visible portion of plane (in 16.16) */
>>       uint32_t src_h, src_w;
>> +    /**
>> +     * @color_fill_format:
>> +     * Format of the color fill value.
>> +     */
>> +    uint32_t color_fill_format;
>> +
>> +    /**
>> +     * @color_fill:
>> +     * Fill color of the plane with 0 as black and 0xffffffff as white.
>> +     * Can be set by user by setting the COLOR_FILL property. See
>> +     * drm_plane_create_color_fill_property() for more details.
>> +     */
>> +    uint32_t color_fill;
>> +
>>       /**
>>        * @alpha:
>>        * Opacity of the plane with 0 as completely transparent and 
>> 0xffff as
>> @@ -699,6 +713,20 @@ struct drm_plane {
>>        */
>>       struct drm_plane_state *state;
>> +    /*
>> +     * @color_fill_format_property:
>> +     * Optional color fill format property for this plane. See
>> +     * drm_plane_create_color_fill_format_property().
>> +     */
>> +    struct drm_property *color_fill_format_property;
>> +
>> +    /*
>> +     * @color_fill_property:
>> +     * Optional color fill property for this plane. See
>> +     * drm_plane_create_color_fill_property().
>> +     */
>> +    struct drm_property *color_fill_property;
>> +
>>       /**
>>        * @alpha_property:
>>        * Optional alpha property for this plane. See
> 
> -- 
> With best wishes
> Dmitry
> 
