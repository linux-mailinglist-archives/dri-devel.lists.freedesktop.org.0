Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8F474FB1D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 00:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF1410E107;
	Tue, 11 Jul 2023 22:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E6410E107;
 Tue, 11 Jul 2023 22:42:49 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36BMVA7u029399; Tue, 11 Jul 2023 22:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NomklmFoL8m4gsXH/oW5DoU43onN3TutpZTB+QSUork=;
 b=SFzjehMrhmUBSbmeuWVjkKMr4XuHpw9udMeFi/8rUK49mBTylykH/QTYPiFYbXfHWvLP
 X1KWs07FIm+ESAQOXdcj5IMnZzuuBz6Q27XDxmYUyjUl5fovBTmceTnyMDxgw+CN7Tk3
 MqkTypdn4DLmGsob5lejBSJ3nm+f5G2RoYzANLHXi5pA0xB7qH5EuPygV6rxnBxbHOjt
 p3ZtnK4oJpZngNgkkPYCqGtbn3JGvVk7LtqfoazmRz4iHfRFEEFq/TNSywAYgag7ImGz
 p1+toKjAKQihWJlEM/7wKMk4VIROQxDsOzMT6a5qpaGXVcCHTk856UgoaXCmjnj9EZN6 ow== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rscpc8bpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jul 2023 22:42:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36BMgTHs013662
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jul 2023 22:42:29 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 11 Jul
 2023 15:42:28 -0700
Message-ID: <79eb29b5-f018-d92c-b514-5ae0c954ff46@quicinc.com>
Date: Tue, 11 Jul 2023 15:42:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v4 2/7] drm: Introduce pixel_source DRM plane property
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Pekka Paalanen <ppaalanen@gmail.com>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-2-f4ec0caa742d@quicinc.com>
 <6e3eec49-f798-ff91-8b4d-417d31089296@linaro.org>
 <20230630112708.4d3a08a7@eldfell>
 <eb78b4d6-6da2-1cb5-5fab-01d7bf233111@quicinc.com>
 <e17db728-d91b-a2b3-08a9-1dd1fde9c727@linaro.org>
 <53ca10d5-c1e0-285a-30b9-4e9a2a1b70c9@quicinc.com>
 <916d6b67-0f37-3814-4a15-d4a6fd6891ab@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <916d6b67-0f37-3814-4a15-d4a6fd6891ab@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: k4rWNKbJPspX7Owjve5heOHvWpdXfvhJ
X-Proofpoint-GUID: k4rWNKbJPspX7Owjve5heOHvWpdXfvhJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_12,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307110207
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
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 wayland-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/11/2023 3:19 PM, Dmitry Baryshkov wrote:
> On 12/07/2023 01:07, Jessica Zhang wrote:
>>
>>
>> On 7/10/2023 1:11 PM, Dmitry Baryshkov wrote:
>>> On 10/07/2023 22:51, Jessica Zhang wrote:
>>>>
>>>>
>>>> On 6/30/2023 1:27 AM, Pekka Paalanen wrote:
>>>>> On Fri, 30 Jun 2023 03:42:28 +0300
>>>>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>>>>>
>>>>>> On 30/06/2023 03:25, Jessica Zhang wrote:
>>>>>>> Add support for pixel_source property to drm_plane and related
>>>>>>> documentation.
>>>>>>>
>>>>>>> This enum property will allow user to specify a pixel source for the
>>>>>>> plane. Possible pixel sources will be defined in the
>>>>>>> drm_plane_pixel_source enum.
>>>>>>>
>>>>>>> The current possible pixel sources are DRM_PLANE_PIXEL_SOURCE_FB and
>>>>>>> DRM_PLANE_PIXEL_SOURCE_COLOR. The default value is *_SOURCE_FB.
>>>>>>
>>>>>> I think, this should come before the solid fill property addition. 
>>>>>> First
>>>>>> you tell that there is a possibility to define other pixel 
>>>>>> sources, then
>>>>>> additional sources are defined.
>>>>>
>>>>> Hi,
>>>>>
>>>>> that would be logical indeed.
>>>>
>>>> Hi Dmitry and Pekka,
>>>>
>>>> Sorry for the delay in response, was out of office last week.
>>>>
>>>> Acked.
>>>>
>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>>>>>>>    drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
>>>>>>>    drivers/gpu/drm/drm_blend.c               | 81 
>>>>>>> +++++++++++++++++++++++++++++++
>>>>>>>    include/drm/drm_blend.h                  |  2 +
>>>>>>>    include/drm/drm_plane.h                  | 21 ++++++++
>>>>>>>    5 files changed, 109 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c 
>>>>>>> b/drivers/gpu/drm/drm_atomic_state_helper.c
>>>>>>> index fe14be2bd2b2..86fb876efbe6 100644
>>>>>>> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
>>>>>>> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
>>>>>>> @@ -252,6 +252,7 @@ void 
>>>>>>> __drm_atomic_helper_plane_state_reset(struct drm_plane_state 
>>>>>>> *plane_state,
>>>>>>>        plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>>>>>>>        plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
>>>>>>> +    plane_state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;
>>>>>>>        if (plane_state->solid_fill_blob) {
>>>>>>>            drm_property_blob_put(plane_state->solid_fill_blob);
>>>>>>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c 
>>>>>>> b/drivers/gpu/drm/drm_atomic_uapi.c
>>>>>>> index a28b4ee79444..6e59c21af66b 100644
>>>>>>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>>>>>>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>>>>>>> @@ -596,6 +596,8 @@ static int 
>>>>>>> drm_atomic_plane_set_property(struct drm_plane *plane,
>>>>>>>            drm_property_blob_put(solid_fill);
>>>>>>>            return ret;
>>>>>>> +    } else if (property == plane->pixel_source_property) {
>>>>>>> +        state->pixel_source = val;
>>>>>>>        } else if (property == plane->alpha_property) {
>>>>>>>            state->alpha = val;
>>>>>>>        } else if (property == plane->blend_mode_property) {
>>>>>>
>>>>>> I think, it was pointed out in the discussion that 
>>>>>> drm_mode_setplane()
>>>>>> (a pre-atomic IOCTL to turn the plane on and off) should also reset
>>>>>> pixel_source to FB.
>>>>
>>>> I don't remember drm_mode_setplane() being mentioned in the 
>>>> pixel_source discussion... can you share where it was mentioned?
>>>
>>> https://lore.kernel.org/dri-devel/20230627105849.004050b3@eldfell/
>>>
>>> Let me quote it here:
>>> "Legacy non-atomic UAPI wrappers can do whatever they want, and program
>>> any (new) properties they want in order to implement the legacy
>>> expectations, so that does not seem to be a problem."
>>>
>>>
>>>>
>>>> I'd prefer to avoid having driver change the pixel_source directly 
>>>> as it could cause some unexpected side effects. In general, I would 
>>>> like userspace to assign the value of pixel_source without driver 
>>>> doing anything "under the hood".
>>>
>>> s/driver/drm core/
>>>
>>> We have to remain compatible with old userspace, especially with the 
>>> non-atomic one. If the userspace calls 
>>> ioctl(DRM_IOCTL_MODE_SETPLANE), we have to display the specified FB, 
>>> no matter what was the value of PIXEL_SOURCE before this ioctl.
>>
>>
>> Got it, thanks the clarification -- I see your point.
>>
>> I'm already setting plane_state->pixel_source to FB in 
>> __drm_atomic_helper_plane_reset() and it seems to me that all drivers 
>> are calling that within their respective plane_funcs->reset().
>>
>> Since (as far as I know) reset() is being called for both the atomic 
>> and non-atomic paths, shouldn't that be enough to default pixel_source 
>> to FB for old userspace?
> 
> No, this will not clean up the state between userspace apps. Currently 
> the rule is simple: call DRM_IOCTL_MODE_SETPLANE, get the image from FB 
> displayed. We should keep it so.
> 

Ok, so you are considering a use-case where we bootup with a userspace 
(which is aware of pixel_source), that one uses the pixel_source to 
switch the property to solid_color and then we kill this userspace and 
bootup one which is unaware of this property and uses 
DRM_IOCTL_MODE_SETPLANE, then we should default back to FB.

>>>>
>>>>>>
>>>>>>> @@ -671,6 +673,8 @@ drm_atomic_plane_get_property(struct 
>>>>>>> drm_plane *plane,
>>>>>>>        } else if (property == plane->solid_fill_property) {
>>>>>>>            *val =state->solid_fill_blob ?
>>>>>>>                state->solid_fill_blob->base.id : 0;
>>>>>>> +    } else if (property == plane->pixel_source_property) {
>>>>>>> +        *val = state->pixel_source;
>>>>>>>        } else if (property == plane->alpha_property) {
>>>>>>>            *val =state->alpha;
>>>>>>>        } else if (property == plane->blend_mode_property) {
>>>>>>> diff --git a/drivers/gpu/drm/drm_blend.c 
>>>>>>> b/drivers/gpu/drm/drm_blend.c
>>>>>>> index 38c3c5d6453a..8c100a957ee2 100644
>>>>>>> --- a/drivers/gpu/drm/drm_blend.c
>>>>>>> +++ b/drivers/gpu/drm/drm_blend.c
>>>>>>> @@ -189,6 +189,18 @@
>>>>>>>     *    solid_fill is set up with 
>>>>>>> drm_plane_create_solid_fill_property(). It
>>>>>>>     *    contains pixel data that drivers can use to fill a plane.
>>>>>>>     *
>>>>>>> + * pixel_source:
>>>>>>> + *    pixel_source is set up with 
>>>>>>> drm_plane_create_pixel_source_property().
>>>>>>> + *    It is used to toggle the source of pixel data for the plane.
>>>>>
>>>>> Other sources than the selected one are ignored?
>>>>
>>>> Yep, the plane will only display the data from the set pixel_source.
>>>>
>>>> So if pixel_source == FB and solid_fill_blob is non-NULL, 
>>>> solid_fill_blob will be ignored and the plane will display the FB 
>>>> that is set.
>>>
>>> correct.
>>>
>>>>
>>>> Will add a note about this in the comment docs.
>>>>
>>>>>
>>>>>>> + *
>>>>>>> + *    Possible values:
>>>>>
>>>>> Wouldn't hurt to explicitly mention here that this is an enum.
>>>>
>>>> Acked.
>>>>
>>>>>
>>>>>>> + *
>>>>>>> + *    "FB":
>>>>>>> + *        Framebuffer source
>>>>>>> + *
>>>>>>> + *    "COLOR":
>>>>>>> + *        solid_fill source
>>>>>
>>>>> I think these two should be more explicit. Framebuffer source is the
>>>>> usual source from the property "FB_ID". Solid fill source comes from
>>>>> the property "solid_fill".
>>>>
>>>> Acked.
>>>>
>>>>>
>>>>> Why "COLOR" and not, say, "SOLID_FILL"?
>>>>
>>>> Ah, that would make more sense :)
>>>>
>>>> I'll change this to "SOLID_FILL".
>>>>
>>>>>
>>>>>>> + *
>>>>>>>     * Note that all the property extensions described here apply 
>>>>>>> either to the
>>>>>>>     * plane or the CRTC (e.g. for the background color, which 
>>>>>>> currently is not
>>>>>>>     * exposed and assumed to be black).
>>>>>>> @@ -648,3 +660,72 @@ int 
>>>>>>> drm_plane_create_solid_fill_property(struct drm_plane *plane)
>>>>>>>        return 0;
>>>>>>>    }
>>>>>>>    EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * drm_plane_create_pixel_source_property - create a new pixel 
>>>>>>> source property
>>>>>>> + * @plane: drm plane
>>>>>>> + * @supported_sources: bitmask of supported pixel_sources for 
>>>>>>> the driver (NOT
>>>>>>> + *                     including DRM_PLANE_PIXEL_SOURCE_FB, as 
>>>>>>> it will be supported
>>>>>>> + *                     by default).
>>>>>>
>>>>>> I'd say this is too strong. I'd suggest either renaming this to
>>>>>> extra_sources (mentioning that FB is enabled for all the planes) or
>>>>>> allowing any source bitmask (mentioning that FB should be enabled 
>>>>>> by the
>>>>>> caller, unless there is a good reason not to do so).
>>>>>
>>>>> Right. I don't see any problem with having planes of type OVERLAY that
>>>>> support only solid_fill and no FB. Planes of type PRIMARY and CURSOR I
>>>>> would expect to always support at least FB.
>>>>>
>>>>> Atomic userspace is prepared to have an OVERLAY plane fail for any
>>>>> arbitrary reason. Legacy userspace probably should not ever see a 
>>>>> plane
>>>>> that does not support FB.
>>>>
>>>> Got it... If we allow the possibility of FB sources not being 
>>>> supported, then should the default pixel_source per plane be decided 
>>>> by the driver too?
>>>>
>>>> I'd forced FB support so that I could set pixel_source to FB in 
>>>> __drm_atomic_helper_plane_state_reset(). If we allow more 
>>>> flexibility in the default pixel_source value, I guess we can also 
>>>> store a default_pixel_source value in the plane_state.
>>>
>>> I'd say, the FB is a sane default. It the driver has other needs, it 
>>> can override the value in drm_plane_funcs::reset().
>>>
>>>>
>>>
>>> [skipped the rest]
>>>
>>> -- 
>>> With best wishes
>>> Dmitry
>>>
> 
