Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C11FC74DE99
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 21:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FBC10E2CD;
	Mon, 10 Jul 2023 19:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B47210E165;
 Mon, 10 Jul 2023 19:52:28 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36AJLhvL032553; Mon, 10 Jul 2023 19:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : from : subject : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=gjFGz0+qAIfAiEzkSyOdDcBRq0BPkbLjQ/QDgMw2sMo=;
 b=W38riQZWNpBhjivsmldrTrjZ/vac/ksgdQjn/0XJU+ucRC/TkRWUCXH9OLcbQqgpkGQZ
 60E1tZKD4X48AHAMMm7sHXmJncEoKswjB6/ArNsar03a9OqE5LplpCHaR1xTrVAVpbj3
 vcsL6nftN8p+SG7FEKg6fIOzvmMGzLJBn0b/n7E8wgPLd7oAGU89+kgpzcaWrwF6boVi
 tOTarA3iUr3s9vHNB0dVydgirHUeo6mZLBwhaM6ET/3THNxJXvi+FCI8FxWPQF/Ar2Rb
 7nTBK5MyDB4oSEA2HHWOR6HFMCDqukS94+5P1lNrPg/2a2IsNliLWav+eUaUTri3r0QK jA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rrfw29dre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jul 2023 19:52:12 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36AJqBg2018593
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jul 2023 19:52:11 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 10 Jul
 2023 12:52:10 -0700
Message-ID: <eb78b4d6-6da2-1cb5-5fab-01d7bf233111@quicinc.com>
Date: Mon, 10 Jul 2023 12:51:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH RFC v4 2/7] drm: Introduce pixel_source DRM plane property
To: Pekka Paalanen <ppaalanen@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-2-f4ec0caa742d@quicinc.com>
 <6e3eec49-f798-ff91-8b4d-417d31089296@linaro.org>
 <20230630112708.4d3a08a7@eldfell>
Content-Language: en-US
In-Reply-To: <20230630112708.4d3a08a7@eldfell>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: iIh--FRmjm6GgigNJR8aQnQPODVeeMsa
X-Proofpoint-GUID: iIh--FRmjm6GgigNJR8aQnQPODVeeMsa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307100180
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
 sebastian.wick@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/30/2023 1:27 AM, Pekka Paalanen wrote:
> On Fri, 30 Jun 2023 03:42:28 +0300
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
>> On 30/06/2023 03:25, Jessica Zhang wrote:
>>> Add support for pixel_source property to drm_plane and related
>>> documentation.
>>>
>>> This enum property will allow user to specify a pixel source for the
>>> plane. Possible pixel sources will be defined in the
>>> drm_plane_pixel_source enum.
>>>
>>> The current possible pixel sources are DRM_PLANE_PIXEL_SOURCE_FB and
>>> DRM_PLANE_PIXEL_SOURCE_COLOR. The default value is *_SOURCE_FB.
>>
>> I think, this should come before the solid fill property addition. First
>> you tell that there is a possibility to define other pixel sources, then
>> additional sources are defined.
> 
> Hi,
> 
> that would be logical indeed.

Hi Dmitry and Pekka,

Sorry for the delay in response, was out of office last week.

Acked.

> 
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>    drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>>>    drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
>>>    drivers/gpu/drm/drm_blend.c               | 81 +++++++++++++++++++++++++++++++
>>>    include/drm/drm_blend.h                   |  2 +
>>>    include/drm/drm_plane.h                   | 21 ++++++++
>>>    5 files changed, 109 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
>>> index fe14be2bd2b2..86fb876efbe6 100644
>>> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
>>> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
>>> @@ -252,6 +252,7 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
>>>    
>>>    	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>>>    	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
>>> +	plane_state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;
>>>    
>>>    	if (plane_state->solid_fill_blob) {
>>>    		drm_property_blob_put(plane_state->solid_fill_blob);
>>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>>> index a28b4ee79444..6e59c21af66b 100644
>>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>>> @@ -596,6 +596,8 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>>>    		drm_property_blob_put(solid_fill);
>>>    
>>>    		return ret;
>>> +	} else if (property == plane->pixel_source_property) {
>>> +		state->pixel_source = val;
>>>    	} else if (property == plane->alpha_property) {
>>>    		state->alpha = val;
>>>    	} else if (property == plane->blend_mode_property) {
>>
>> I think, it was pointed out in the discussion that drm_mode_setplane()
>> (a pre-atomic IOCTL to turn the plane on and off) should also reset
>> pixel_source to FB.

I don't remember drm_mode_setplane() being mentioned in the pixel_source 
discussion... can you share where it was mentioned?

I'd prefer to avoid having driver change the pixel_source directly as it 
could cause some unexpected side effects. In general, I would like 
userspace to assign the value of pixel_source without driver doing 
anything "under the hood".

>>
>>> @@ -671,6 +673,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>>>    	} else if (property == plane->solid_fill_property) {
>>>    		*val = state->solid_fill_blob ?
>>>    			state->solid_fill_blob->base.id : 0;
>>> +	} else if (property == plane->pixel_source_property) {
>>> +		*val = state->pixel_source;
>>>    	} else if (property == plane->alpha_property) {
>>>    		*val = state->alpha;
>>>    	} else if (property == plane->blend_mode_property) {
>>> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
>>> index 38c3c5d6453a..8c100a957ee2 100644
>>> --- a/drivers/gpu/drm/drm_blend.c
>>> +++ b/drivers/gpu/drm/drm_blend.c
>>> @@ -189,6 +189,18 @@
>>>     *	solid_fill is set up with drm_plane_create_solid_fill_property(). It
>>>     *	contains pixel data that drivers can use to fill a plane.
>>>     *
>>> + * pixel_source:
>>> + *	pixel_source is set up with drm_plane_create_pixel_source_property().
>>> + *	It is used to toggle the source of pixel data for the plane.
> 
> Other sources than the selected one are ignored?

Yep, the plane will only display the data from the set pixel_source.

So if pixel_source == FB and solid_fill_blob is non-NULL, 
solid_fill_blob will be ignored and the plane will display the FB that 
is set.

Will add a note about this in the comment docs.

> 
>>> + *
>>> + *	Possible values:
> 
> Wouldn't hurt to explicitly mention here that this is an enum.

Acked.

> 
>>> + *
>>> + *	"FB":
>>> + *		Framebuffer source
>>> + *
>>> + *	"COLOR":
>>> + *		solid_fill source
> 
> I think these two should be more explicit. Framebuffer source is the
> usual source from the property "FB_ID". Solid fill source comes from
> the property "solid_fill".

Acked.

> 
> Why "COLOR" and not, say, "SOLID_FILL"?

Ah, that would make more sense :)

I'll change this to "SOLID_FILL".

> 
>>> + *
>>>     * Note that all the property extensions described here apply either to the
>>>     * plane or the CRTC (e.g. for the background color, which currently is not
>>>     * exposed and assumed to be black).
>>> @@ -648,3 +660,72 @@ int drm_plane_create_solid_fill_property(struct drm_plane *plane)
>>>    	return 0;
>>>    }
>>>    EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
>>> +
>>> +/**
>>> + * drm_plane_create_pixel_source_property - create a new pixel source property
>>> + * @plane: drm plane
>>> + * @supported_sources: bitmask of supported pixel_sources for the driver (NOT
>>> + *                     including DRM_PLANE_PIXEL_SOURCE_FB, as it will be supported
>>> + *                     by default).
>>
>> I'd say this is too strong. I'd suggest either renaming this to
>> extra_sources (mentioning that FB is enabled for all the planes) or
>> allowing any source bitmask (mentioning that FB should be enabled by the
>> caller, unless there is a good reason not to do so).
> 
> Right. I don't see any problem with having planes of type OVERLAY that
> support only solid_fill and no FB. Planes of type PRIMARY and CURSOR I
> would expect to always support at least FB.
> 
> Atomic userspace is prepared to have an OVERLAY plane fail for any
> arbitrary reason. Legacy userspace probably should not ever see a plane
> that does not support FB.

Got it... If we allow the possibility of FB sources not being supported, 
then should the default pixel_source per plane be decided by the driver too?

I'd forced FB support so that I could set pixel_source to FB in 
__drm_atomic_helper_plane_state_reset(). If we allow more flexibility in 
the default pixel_source value, I guess we can also store a 
default_pixel_source value in the plane_state.

> 
>>> + *
>>> + * This creates a new property describing the current source of pixel data for the
>>> + * plane.
>>> + *
>>> + * The property is exposed to userspace as an enumeration property called
>>> + * "pixel_source" and has the following enumeration values:
>>> + *
>>> + * "FB":
>>> + *	Framebuffer pixel source
>>> + *
>>> + * "COLOR":
>>> + *	Solid fill color pixel source
>>> + *
>>> + * Returns:
>>> + * Zero on success, negative errno on failure.
>>> + */
>>> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
>>> +					   unsigned int supported_sources)
>>> +{
>>> +	struct drm_device *dev = plane->dev;
>>> +	struct drm_property *prop;
>>> +	const struct drm_prop_enum_list enum_list[] = {
>>> +		{ DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
>>> +		{ DRM_PLANE_PIXEL_SOURCE_COLOR, "COLOR" },
>>> +	};
>>> +	unsigned int valid_source_mask = BIT(DRM_PLANE_PIXEL_SOURCE_FB) |
>>> +				       BIT(DRM_PLANE_PIXEL_SOURCE_COLOR);
>>
>>
>> static const?

Acked.

>>
>>> +	int i;
>>> +
>>> +	/* FB is supported by default */
>>> +	supported_sources |= BIT(DRM_PLANE_PIXEL_SOURCE_FB);
>>> +
>>> +	if (WARN_ON(supported_sources & ~valid_source_mask))
>>> +		return -EINVAL;
>>> +
>>> +	prop = drm_property_create(dev, DRM_MODE_PROP_ENUM, "pixel_source",
> 
> Shouldn't this be an atomic prop?

Acked.

> 
> 
>>> +			hweight32(supported_sources));
>>> +
>>> +	if (!prop)
>>> +		return -ENOMEM;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(enum_list); i++) {
>>> +		int ret;
>>> +
>>> +		if (!(BIT(enum_list[i].type) & supported_sources))
>>
>> test_bit?

Acked.

>>
>>> +			continue;
>>> +
>>> +		ret = drm_property_add_enum(prop, enum_list[i].type, enum_list[i].name);
>>> +
>>
>> No need for an empty line in such cases. Please drop it.

Acked.

>>
>>> +		if (ret) {
>>> +			drm_property_destroy(dev, prop);
>>> +
>>> +			return ret;
>>> +		}
>>> +	}
>>> +
>>> +	drm_object_attach_property(&plane->base, prop, DRM_PLANE_PIXEL_SOURCE_FB);
>>> +	plane->pixel_source_property = prop;
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL(drm_plane_create_pixel_source_property);
>>> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
>>> index 0338a860b9c8..31af7cfa5b1b 100644
>>> --- a/include/drm/drm_blend.h
>>> +++ b/include/drm/drm_blend.h
>>> @@ -59,4 +59,6 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
>>>    int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>>>    					 unsigned int supported_modes);
>>>    int drm_plane_create_solid_fill_property(struct drm_plane *plane);
>>> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
>>> +					   unsigned int supported_sources);
>>>    #endif
>>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>>> index f6ab313cb83e..73fb6cf8a5d9 100644
>>> --- a/include/drm/drm_plane.h
>>> +++ b/include/drm/drm_plane.h
>>> @@ -59,6 +59,12 @@ struct drm_solid_fill {
>>>    	uint32_t b;
>>>    };
>>>    
>>> +enum drm_plane_pixel_source {
>>> +	DRM_PLANE_PIXEL_SOURCE_FB,
>>> +	DRM_PLANE_PIXEL_SOURCE_COLOR,
>>> +	DRM_PLANE_PIXEL_SOURCE_MAX
>>> +};
> 
> Just to be very clear that I'm not confusing you with my comment about
> UAPI headers in the previous patch, this enum is already in a good
> place. It does not belong in a UAPI header, because userspace
> recognises enum values by the name string.

Got it.

Thanks,

Jessica Zhang

> 
> 
> Thanks,
> pq
> 
>>> +
>>>    /**
>>>     * struct drm_plane_state - mutable plane state
>>>     *
>>> @@ -152,6 +158,14 @@ struct drm_plane_state {
>>>    	 */
>>>    	struct drm_solid_fill solid_fill;
>>>    
>>> +	/*
>>> +	 * @pixel_source:
>>> +	 *
>>> +	 * Source of pixel information for the plane. See
>>> +	 * drm_plane_create_pixel_source_property() for more details.
>>> +	 */
>>> +	enum drm_plane_pixel_source pixel_source;
>>> +
>>>    	/**
>>>    	 * @alpha:
>>>    	 * Opacity of the plane with 0 as completely transparent and 0xffff as
>>> @@ -742,6 +756,13 @@ struct drm_plane {
>>>    	 */
>>>    	struct drm_property *solid_fill_property;
>>>    
>>> +	/*
>>> +	 * @pixel_source_property:
>>> +	 * Optional pixel_source property for this plane. See
>>> +	 * drm_plane_create_pixel_source_property().
>>> +	 */
>>> +	struct drm_property *pixel_source_property;
>>> +
>>>    	/**
>>>    	 * @alpha_property:
>>>    	 * Optional alpha property for this plane. See
>>>    
>>
> 
