Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF56772B02
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F3F10E2D3;
	Mon,  7 Aug 2023 16:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C4110E2CD;
 Mon,  7 Aug 2023 16:34:17 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 377FLI70026617; Mon, 7 Aug 2023 16:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=dl6S2e8Ejt023XPbv1iI7cVSS2l+GoaShhvHi/XlJjQ=;
 b=N5FF/nh3NPoJUehVw1mekHTIN/sMhCNhqiTNaIkg361Qwv7W/OBA97vgPSo0D51feDUw
 rsDhiiLDO3zxTY/31Vc6WYIlQceukJXZm2FY9l3FCzKNiGGp9xk34GC5jcP2GLP9+EmJ
 8Twvp6t5i7VQr6G6DQ+1KRAIL0IhV99kOkBnkLE2CGYkX3FFkbFYarudDbQx8731+zsR
 AIU8tPpemxel/Fle5U8Rvufq7XdvpIiVJyima5YMNys89uhQvKc7yzQ+QubQL6FdRndk
 Ak/wEDqHA1LjGObe5MS2pvRXZhO6GK7f1MyU8j4gxYiNCC6IiQX+hRVdUMdVZLaAqoqK hw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s9bsuv5jx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Aug 2023 16:33:58 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 377GXuuB020164
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 7 Aug 2023 16:33:56 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 7 Aug
 2023 09:33:56 -0700
Message-ID: <6885a107-79da-9001-680a-bbd15286fb7d@quicinc.com>
Date: Mon, 7 Aug 2023 09:33:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v5 02/10] drm: Introduce solid fill DRM plane property
Content-Language: en-US
To: Sebastian Wick <sebastian.wick@redhat.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-2-053dbefa909c@quicinc.com>
 <de8388d2-5625-2737-3997-4fa23baa3693@linaro.org>
 <CA+hFU4xgtJ2HrBMYWsbvL9LA546+v+-s=XQnsSr1vehJ36L-Kw@mail.gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CA+hFU4xgtJ2HrBMYWsbvL9LA546+v+-s=XQnsSr1vehJ36L-Kw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FoGM4ecD8G4olnbTKbQOC9KVlxtAcmFU
X-Proofpoint-ORIG-GUID: FoGM4ecD8G4olnbTKbQOC9KVlxtAcmFU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_17,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308070153
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 ppaalanen@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/4/2023 6:40 AM, Sebastian Wick wrote:
> On Mon, Jul 31, 2023 at 6:01 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 28/07/2023 20:02, Jessica Zhang wrote:
>>> Document and add support for solid_fill property to drm_plane. In
>>> addition, add support for setting and getting the values for solid_fill.
>>>
>>> To enable solid fill planes, userspace must assign a property blob to
>>> the "solid_fill" plane property containing the following information:
>>>
>>> struct drm_mode_solid_fill {
>>>        u32 version;
>>>        u32 r, g, b;
>>> };
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>    drivers/gpu/drm/drm_atomic_state_helper.c |  9 +++++
>>>    drivers/gpu/drm/drm_atomic_uapi.c         | 55 +++++++++++++++++++++++++++++++
>>>    drivers/gpu/drm/drm_blend.c               | 30 +++++++++++++++++
>>>    include/drm/drm_blend.h                   |  1 +
>>>    include/drm/drm_plane.h                   | 35 ++++++++++++++++++++
>>>    include/uapi/drm/drm_mode.h               | 24 ++++++++++++++
>>>    6 files changed, 154 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
>>> index 01638c51ce0a..86fb876efbe6 100644
>>> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
>>> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
>>> @@ -254,6 +254,11 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
>>>        plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
>>>        plane_state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;
>>>
>>> +     if (plane_state->solid_fill_blob) {
>>> +             drm_property_blob_put(plane_state->solid_fill_blob);
>>> +             plane_state->solid_fill_blob = NULL;
>>> +     }
>>> +
>>>        if (plane->color_encoding_property) {
>>>                if (!drm_object_property_get_default_value(&plane->base,
>>>                                                           plane->color_encoding_property,
>>> @@ -336,6 +341,9 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
>>>        if (state->fb)
>>>                drm_framebuffer_get(state->fb);
>>>
>>> +     if (state->solid_fill_blob)
>>> +             drm_property_blob_get(state->solid_fill_blob);
>>> +
>>>        state->fence = NULL;
>>>        state->commit = NULL;
>>>        state->fb_damage_clips = NULL;
>>> @@ -385,6 +393,7 @@ void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state)
>>>                drm_crtc_commit_put(state->commit);
>>>
>>>        drm_property_blob_put(state->fb_damage_clips);
>>> +     drm_property_blob_put(state->solid_fill_blob);
>>>    }
>>>    EXPORT_SYMBOL(__drm_atomic_helper_plane_destroy_state);
>>>
>>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>>> index 454f980e16c9..039686c78c2a 100644
>>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>>> @@ -316,6 +316,51 @@ drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
>>>    }
>>>    EXPORT_SYMBOL(drm_atomic_set_crtc_for_connector);
>>>
>>> +static int drm_atomic_set_solid_fill_prop(struct drm_plane_state *state,
>>> +             struct drm_property_blob *blob)
>>> +{
>>> +     int blob_version;
>>> +
>>> +     if (blob == state->solid_fill_blob)
>>> +             return 0;
>>> +
>>> +     if (blob) {
>>> +             struct drm_mode_solid_fill *user_info = (struct drm_mode_solid_fill *)blob->data;
>>> +
>>> +             if (blob->length != sizeof(struct drm_mode_solid_fill)) {
>>> +                     drm_dbg_atomic(state->plane->dev,
>>> +                                    "[PLANE:%d:%s] bad solid fill blob length: %zu\n",
>>> +                                    state->plane->base.id, state->plane->name,
>>> +                                    blob->length);
>>> +                     return -EINVAL;
>>> +             }
>>> +
>>> +             blob_version = user_info->version;
>>
>> I remember that we had versioning for quite some time. However it stroke
>> me while reviewing that we do not a way to negotiate supported
>> SOLID_FILL versions. However as we now have support for different
>> pixel_source properties, maybe we can drop version completely. If at
>> some point a driver needs to support different kind of SOLID_FILL
>> property (consider v2), we can add new pixel source to the enum.
> 
> Agreed. Let's drop the versioning.

Acked.

Thanks,

Jessica Zhang

> 
>>
>>> +
>>> +             /* Add more versions if necessary */
>>> +             if (blob_version == 1) {
>>> +                     state->solid_fill.r = user_info->r;
>>> +                     state->solid_fill.g = user_info->g;
>>> +                     state->solid_fill.b = user_info->b;
>>> +             } else {
>>> +                     drm_dbg_atomic(state->plane->dev,
>>> +                                    "[PLANE:%d:%s] unsupported solid fill version (version=%d)\n",
>>> +                                    state->plane->base.id, state->plane->name,
>>> +                                    blob_version);
>>> +                     return -EINVAL;
>>> +             }
>>> +     }
>>> +
>>> +     drm_property_blob_put(state->solid_fill_blob);
>>> +
>>> +     if (blob)
>>> +             state->solid_fill_blob = drm_property_blob_get(blob);
>>> +     else
>>> +             state->solid_fill_blob = NULL;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>>    static void set_out_fence_for_crtc(struct drm_atomic_state *state,
>>>                                   struct drm_crtc *crtc, s32 __user *fence_ptr)
>>>    {
>>> @@ -546,6 +591,13 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>>>                state->src_h = val;
>>>        } else if (property == plane->pixel_source_property) {
>>>                state->pixel_source = val;
>>> +     } else if (property == plane->solid_fill_property) {
>>> +             struct drm_property_blob *solid_fill = drm_property_lookup_blob(dev, val);
>>> +
>>> +             ret = drm_atomic_set_solid_fill_prop(state, solid_fill);
>>> +             drm_property_blob_put(solid_fill);
>>> +
>>> +             return ret;
>>
>> Bonus point: dropping version from SOLID_FILL would allow us to use
>> drm_atomic_replace_property_blob_from_id() here.
>>
>>>        } else if (property == plane->alpha_property) {
>>>                state->alpha = val;
>>>        } else if (property == plane->blend_mode_property) {
>>> @@ -620,6 +672,9 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>>>                *val = state->src_h;
>>>        } else if (property == plane->pixel_source_property) {
>>>                *val = state->pixel_source;
>>> +     } else if (property == plane->solid_fill_property) {
>>> +             *val = state->solid_fill_blob ?
>>> +                     state->solid_fill_blob->base.id : 0;
>>>        } else if (property == plane->alpha_property) {
>>>                *val = state->alpha;
>>>        } else if (property == plane->blend_mode_property) {
>>> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
>>> index c500310a3d09..c632dfcd8a9b 100644
>>> --- a/drivers/gpu/drm/drm_blend.c
>>> +++ b/drivers/gpu/drm/drm_blend.c
>>> @@ -200,6 +200,10 @@
>>>     *  "FB":
>>>     *          Framebuffer source set by the "FB_ID" property.
>>>     *
>>> + * solid_fill:
>>> + *   solid_fill is set up with drm_plane_create_solid_fill_property(). It
>>> + *   contains pixel data that drivers can use to fill a plane.
>>> + *
>>>     * Note that all the property extensions described here apply either to the
>>>     * plane or the CRTC (e.g. for the background color, which currently is not
>>>     * exposed and assumed to be black).
>>> @@ -700,3 +704,29 @@ int drm_plane_create_pixel_source_property(struct drm_plane *plane,
>>>        return 0;
>>>    }
>>>    EXPORT_SYMBOL(drm_plane_create_pixel_source_property);
>>> +
>>> +/**
>>> + * drm_plane_create_solid_fill_property - create a new solid_fill property
>>> + * @plane: drm plane
>>> + *
>>> + * This creates a new property blob that holds pixel data for solid fill planes.
>>> + * The property is exposed to userspace as a property blob called "solid_fill".
>>> + *
>>> + * For information on what the blob contains, see `drm_mode_solid_fill`.
>>> + */
>>> +int drm_plane_create_solid_fill_property(struct drm_plane *plane)
>>> +{
>>> +     struct drm_property *prop;
>>> +
>>> +     prop = drm_property_create(plane->dev,
>>> +                     DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_BLOB,
>>> +                     "solid_fill", 0);
>>> +     if (!prop)
>>> +             return -ENOMEM;
>>> +
>>> +     drm_object_attach_property(&plane->base, prop, 0);
>>> +     plane->solid_fill_property = prop;
>>> +
>>> +     return 0;
>>> +}
>>> +EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
>>> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
>>> index 122bbfbaae33..e7158fbee389 100644
>>> --- a/include/drm/drm_blend.h
>>> +++ b/include/drm/drm_blend.h
>>> @@ -60,4 +60,5 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>>>                                         unsigned int supported_modes);
>>>    int drm_plane_create_pixel_source_property(struct drm_plane *plane,
>>>                                           unsigned long extra_sources);
>>> +int drm_plane_create_solid_fill_property(struct drm_plane *plane);
>>>    #endif
>>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>>> index 89508b4dea4a..abf1458fa099 100644
>>> --- a/include/drm/drm_plane.h
>>> +++ b/include/drm/drm_plane.h
>>> @@ -46,6 +46,17 @@ enum drm_plane_pixel_source {
>>>        DRM_PLANE_PIXEL_SOURCE_MAX
>>>    };
>>>
>>> +/**
>>> + * struct solid_fill_property - RGB values for solid fill plane
>>> + *
>>> + * Note: This is the V1 for this feature
>>> + */
>>> +struct drm_solid_fill {
>>> +     uint32_t r;
>>> +     uint32_t g;
>>> +     uint32_t b;
>>> +};
>>> +
>>>    /**
>>>     * struct drm_plane_state - mutable plane state
>>>     *
>>> @@ -130,6 +141,23 @@ struct drm_plane_state {
>>>         */
>>>        enum drm_plane_pixel_source pixel_source;
>>>
>>> +     /**
>>> +      * @solid_fill_blob:
>>> +      *
>>> +      * Blob containing relevant information for a solid fill plane
>>> +      * including pixel format and data. See
>>> +      * drm_plane_create_solid_fill_property() for more details.
>>> +      */
>>> +     struct drm_property_blob *solid_fill_blob;
>>> +
>>> +     /**
>>> +      * @solid_fill:
>>> +      *
>>> +      * Pixel data for solid fill planes. See
>>> +      * drm_plane_create_solid_fill_property() for more details.
>>> +      */
>>> +     struct drm_solid_fill solid_fill;
>>> +
>>>        /**
>>>         * @alpha:
>>>         * Opacity of the plane with 0 as completely transparent and 0xffff as
>>> @@ -720,6 +748,13 @@ struct drm_plane {
>>>         */
>>>        struct drm_property *pixel_source_property;
>>>
>>> +     /**
>>> +      * @solid_fill_property:
>>> +      * Optional solid_fill property for this plane. See
>>> +      * drm_plane_create_solid_fill_property().
>>> +      */
>>> +     struct drm_property *solid_fill_property;
>>> +
>>>        /**
>>>         * @alpha_property:
>>>         * Optional alpha property for this plane. See
>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>>> index 43691058d28f..53c8efa5ad7f 100644
>>> --- a/include/uapi/drm/drm_mode.h
>>> +++ b/include/uapi/drm/drm_mode.h
>>> @@ -259,6 +259,30 @@ struct drm_mode_modeinfo {
>>>        char name[DRM_DISPLAY_MODE_LEN];
>>>    };
>>>
>>> +/**
>>> + * struct drm_mode_solid_fill - User info for solid fill planes
>>> + *
>>> + * This is the userspace API solid fill information structure.
>>> + *
>>> + * Userspace can enable solid fill planes by assigning the plane "solid_fill"
>>> + * property to a blob containing a single drm_mode_solid_fill struct populated with an RGB323232
>>> + * color and setting the pixel source to "SOLID_FILL".
>>> + *
>>> + * For information on the plane property, see drm_plane_create_solid_fill_property()
>>> + *
>>> + * @version: Version of the blob. Currently, there is only support for version == 1
>>> + * @r: Red color value of single pixel
>>> + * @g: Green color value of single pixel
>>> + * @b: Blue color value of single pixel
>>> + */
>>> +struct drm_mode_solid_fill {
>>> +     __u32 version;
>>> +     __u32 r;
>>> +     __u32 g;
>>> +     __u32 b;
>>> +};
>>> +
>>> +
>>>    struct drm_mode_card_res {
>>>        __u64 fb_id_ptr;
>>>        __u64 crtc_id_ptr;
>>>
>>
>> --
>> With best wishes
>> Dmitry
>>
> 
