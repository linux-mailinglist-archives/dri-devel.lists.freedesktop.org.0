Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5BA7443E7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 23:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE27510E4F8;
	Fri, 30 Jun 2023 21:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE1910E4F5;
 Fri, 30 Jun 2023 21:27:51 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35UKdV05017277; Fri, 30 Jun 2023 21:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Hm4GD3zfJFX9tmJCUgEYsotdAFKojgWCx9OCq+foOL0=;
 b=QYWaHDwstTaibJVv6g2wMcVRt8725+Uu6FYE+durGOAvHsx8OdcqdJzey7Dgw4CHNxur
 mlM80RXQBEggo8BZaNRNuuAzOdNItl5nhtt8CaQBhqRdLMNiLVD0bFeX1YoHwlayb4rd
 MqktRX7iNkPDO81hu8ixS0p4rmsUH6WW+jzDbS6hmirh8itOuNcBPtPhb+EnVMPIzoTo
 PRe/UUNnW7yD1b+bm5hUAxYEno9IuaGMGAPUtnq2Dl7KQpI5uN1SzXTAZyJSbE95UO21
 3pxx5CPopj/bGk+eQNJ07l1E+esXf8FR4Kc1hCLMIzbcA0mcz94llccTzp7NdDNfQHGi eQ== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rhgpgtr7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 21:27:40 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35ULRdLR020310
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 21:27:39 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 30 Jun
 2023 14:27:39 -0700
Message-ID: <68629132-b77a-bfbc-20f7-92a76cf24953@quicinc.com>
Date: Fri, 30 Jun 2023 14:27:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH RFC v4 2/7] drm: Introduce pixel_source DRM plane property
Content-Language: en-US
To: Sebastian Wick <sebastian.wick@redhat.com>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-2-f4ec0caa742d@quicinc.com>
 <CA+hFU4zQFkbi8BjFdWDBDMPR7cC8UqJg0udu7MJYOFac1J8XsQ@mail.gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CA+hFU4zQFkbi8BjFdWDBDMPR7cC8UqJg0udu7MJYOFac1J8XsQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: i2O8QttX-0GXFTEFVj5NCUA3kLNTSrb7
X-Proofpoint-ORIG-GUID: i2O8QttX-0GXFTEFVj5NCUA3kLNTSrb7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_12,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306300186
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
Cc: freedreno@lists.freedesktop.org, ppaalanen@gmail.com,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean
 Paul <sean@poorly.run>, quic_abhinavk@quicinc.com,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/30/2023 7:43 AM, Sebastian Wick wrote:
> On Fri, Jun 30, 2023 at 2:26 AM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>> Add support for pixel_source property to drm_plane and related
>> documentation.
>>
>> This enum property will allow user to specify a pixel source for the
>> plane. Possible pixel sources will be defined in the
>> drm_plane_pixel_source enum.
>>
>> The current possible pixel sources are DRM_PLANE_PIXEL_SOURCE_FB and
>> DRM_PLANE_PIXEL_SOURCE_COLOR. The default value is *_SOURCE_FB.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>>   drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
>>   drivers/gpu/drm/drm_blend.c               | 81 +++++++++++++++++++++++++++++++
>>   include/drm/drm_blend.h                   |  2 +
>>   include/drm/drm_plane.h                   | 21 ++++++++
>>   5 files changed, 109 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
>> index fe14be2bd2b2..86fb876efbe6 100644
>> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
>> @@ -252,6 +252,7 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
>>
>>          plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>>          plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
>> +       plane_state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;
>>
>>          if (plane_state->solid_fill_blob) {
>>                  drm_property_blob_put(plane_state->solid_fill_blob);
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>> index a28b4ee79444..6e59c21af66b 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -596,6 +596,8 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>>                  drm_property_blob_put(solid_fill);
>>
>>                  return ret;
>> +       } else if (property == plane->pixel_source_property) {
>> +               state->pixel_source = val;
>>          } else if (property == plane->alpha_property) {
>>                  state->alpha = val;
>>          } else if (property == plane->blend_mode_property) {
>> @@ -671,6 +673,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>>          } else if (property == plane->solid_fill_property) {
>>                  *val = state->solid_fill_blob ?
>>                          state->solid_fill_blob->base.id : 0;
>> +       } else if (property == plane->pixel_source_property) {
>> +               *val = state->pixel_source;
>>          } else if (property == plane->alpha_property) {
>>                  *val = state->alpha;
>>          } else if (property == plane->blend_mode_property) {
>> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
>> index 38c3c5d6453a..8c100a957ee2 100644
>> --- a/drivers/gpu/drm/drm_blend.c
>> +++ b/drivers/gpu/drm/drm_blend.c
>> @@ -189,6 +189,18 @@
>>    *     solid_fill is set up with drm_plane_create_solid_fill_property(). It
>>    *     contains pixel data that drivers can use to fill a plane.
>>    *
>> + * pixel_source:
>> + *     pixel_source is set up with drm_plane_create_pixel_source_property().
>> + *     It is used to toggle the source of pixel data for the plane.
>> + *
>> + *     Possible values:
>> + *
>> + *     "FB":
>> + *             Framebuffer source
>> + *
>> + *     "COLOR":
>> + *             solid_fill source
>> + *
>>    * Note that all the property extensions described here apply either to the
>>    * plane or the CRTC (e.g. for the background color, which currently is not
>>    * exposed and assumed to be black).
>> @@ -648,3 +660,72 @@ int drm_plane_create_solid_fill_property(struct drm_plane *plane)
>>          return 0;
>>   }
>>   EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
>> +
>> +/**
>> + * drm_plane_create_pixel_source_property - create a new pixel source property
>> + * @plane: drm plane
>> + * @supported_sources: bitmask of supported pixel_sources for the driver (NOT
>> + *                     including DRM_PLANE_PIXEL_SOURCE_FB, as it will be supported
>> + *                     by default).
>> + *
>> + * This creates a new property describing the current source of pixel data for the
>> + * plane.
>> + *
>> + * The property is exposed to userspace as an enumeration property called
>> + * "pixel_source" and has the following enumeration values:
>> + *
>> + * "FB":
>> + *     Framebuffer pixel source
>> + *
>> + * "COLOR":
>> + *     Solid fill color pixel source
> 
> Can we add a "NONE" value?
> 
> I know it has been discussed earlier if we *need*  this and I don't
> think we do. I just think it would be better API design to disable
> planes this way than having to know that a framebuffer pixel source
> with a NULL framebuffer disables the plane. Obviously also keep the
> old behavior for backwards compatibility.

Hi Sebastian,

Sounds good.

So if pixel_source == NONE disables the planes, would that mean cases 
where pixel_source == COLOR && solid_fill_blob == NULL, the atomic 
commit should throw an error?

Thanks,

Jessica Zhang

> 
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
>> +                                          unsigned int supported_sources)
>> +{
>> +       struct drm_device *dev = plane->dev;
>> +       struct drm_property *prop;
>> +       const struct drm_prop_enum_list enum_list[] = {
>> +               { DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
>> +               { DRM_PLANE_PIXEL_SOURCE_COLOR, "COLOR" },
>> +       };
>> +       unsigned int valid_source_mask = BIT(DRM_PLANE_PIXEL_SOURCE_FB) |
>> +                                      BIT(DRM_PLANE_PIXEL_SOURCE_COLOR);
>> +       int i;
>> +
>> +       /* FB is supported by default */
>> +       supported_sources |= BIT(DRM_PLANE_PIXEL_SOURCE_FB);
>> +
>> +       if (WARN_ON(supported_sources & ~valid_source_mask))
>> +               return -EINVAL;
>> +
>> +       prop = drm_property_create(dev, DRM_MODE_PROP_ENUM, "pixel_source",
>> +                       hweight32(supported_sources));
>> +
>> +       if (!prop)
>> +               return -ENOMEM;
>> +
>> +       for (i = 0; i < ARRAY_SIZE(enum_list); i++) {
>> +               int ret;
>> +
>> +               if (!(BIT(enum_list[i].type) & supported_sources))
>> +                       continue;
>> +
>> +               ret = drm_property_add_enum(prop, enum_list[i].type, enum_list[i].name);
>> +
>> +               if (ret) {
>> +                       drm_property_destroy(dev, prop);
>> +
>> +                       return ret;
>> +               }
>> +       }
>> +
>> +       drm_object_attach_property(&plane->base, prop, DRM_PLANE_PIXEL_SOURCE_FB);
>> +       plane->pixel_source_property = prop;
>> +
>> +       return 0;
>> +}
>> +EXPORT_SYMBOL(drm_plane_create_pixel_source_property);
>> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
>> index 0338a860b9c8..31af7cfa5b1b 100644
>> --- a/include/drm/drm_blend.h
>> +++ b/include/drm/drm_blend.h
>> @@ -59,4 +59,6 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
>>   int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>>                                           unsigned int supported_modes);
>>   int drm_plane_create_solid_fill_property(struct drm_plane *plane);
>> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
>> +                                          unsigned int supported_sources);
>>   #endif
>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>> index f6ab313cb83e..73fb6cf8a5d9 100644
>> --- a/include/drm/drm_plane.h
>> +++ b/include/drm/drm_plane.h
>> @@ -59,6 +59,12 @@ struct drm_solid_fill {
>>          uint32_t b;
>>   };
>>
>> +enum drm_plane_pixel_source {
>> +       DRM_PLANE_PIXEL_SOURCE_FB,
>> +       DRM_PLANE_PIXEL_SOURCE_COLOR,
>> +       DRM_PLANE_PIXEL_SOURCE_MAX
>> +};
>> +
>>   /**
>>    * struct drm_plane_state - mutable plane state
>>    *
>> @@ -152,6 +158,14 @@ struct drm_plane_state {
>>           */
>>          struct drm_solid_fill solid_fill;
>>
>> +       /*
>> +        * @pixel_source:
>> +        *
>> +        * Source of pixel information for the plane. See
>> +        * drm_plane_create_pixel_source_property() for more details.
>> +        */
>> +       enum drm_plane_pixel_source pixel_source;
>> +
>>          /**
>>           * @alpha:
>>           * Opacity of the plane with 0 as completely transparent and 0xffff as
>> @@ -742,6 +756,13 @@ struct drm_plane {
>>           */
>>          struct drm_property *solid_fill_property;
>>
>> +       /*
>> +        * @pixel_source_property:
>> +        * Optional pixel_source property for this plane. See
>> +        * drm_plane_create_pixel_source_property().
>> +        */
>> +       struct drm_property *pixel_source_property;
>> +
>>          /**
>>           * @alpha_property:
>>           * Optional alpha property for this plane. See
>>
>> --
>> 2.41.0
>>
> 
