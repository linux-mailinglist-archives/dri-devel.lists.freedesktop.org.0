Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4086ABAC9D
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 23:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D169E10E0F7;
	Sat, 17 May 2025 21:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=froggi.es header.i=misyl@froggi.es header.b="hEOLal4y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 904 seconds by postgrey-1.36 at gabe;
 Sat, 17 May 2025 17:53:00 UTC
Received: from sender4-op-o10.zoho.com (sender4-op-o10.zoho.com
 [136.143.188.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01E810E053;
 Sat, 17 May 2025 17:53:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1747503466; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Nffj33e2YL/ILQZ6iPnLPHW3UV/iGjVUFzIQe6lF5W0NyX7vHDVmDet9/ScN8GEdZ77GFjz3PXrnUbB+kPpFK4U8Y9rgLvNW8s1xMaJFZqAijNo9jo0OWiSoY8tJda3IVbqx5hzOtmn1EuTOAX22DTKr2xDolg50ipBSQcKKxGE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747503466;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ezkHkwC9s2Z5d6+xKnDQMCu1S8rNkHLf2BEhK46Pwz4=; 
 b=PAHtiedLZA19uRxcuZzlYuY7TvocziaIzhUxqrVbwnNQ+UrHILZZwwk+5Glumu0DIC8/C2h+BsF3srduhaSuAJc0rW6zVkJD1YcVaEkOo2/OqU8ET9kp6ScCs+kLC5h79YguCZ11eANvLk+tl2qj7XFj31HLw+HpyWVyKAbfl7Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=froggi.es;
 spf=pass  smtp.mailfrom=misyl@froggi.es;
 dmarc=pass header.from=<misyl@froggi.es>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747503466; 
 s=mail; d=froggi.es; i=misyl@froggi.es;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ezkHkwC9s2Z5d6+xKnDQMCu1S8rNkHLf2BEhK46Pwz4=;
 b=hEOLal4yOQqptZ8nbj5icqqzcpfs8yV3uUTQ+665tCVRHo7XojnKBwgNRJMnUYDL
 /irSOgIGlldfnrwDPTKVS2A3r9BWaphNVisWB/Mect8I11xcix8AeHlWm2JfJjVqNu2
 68ccCjdvhABIRgDKNRgNuiuAmfLBWfVjObiy2GKA=
Received: by mx.zohomail.com with SMTPS id 1747503462353236.58079519107616;
 Sat, 17 May 2025 10:37:42 -0700 (PDT)
Message-ID: <c562cd90-fdc4-409d-830c-855f88dbf5d5@froggi.es>
Date: Sat, 17 May 2025 18:36:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 40/43] drm/colorop: Add 3D LUT support to color pipeline
To: Xaver Hugl <xaver.hugl@gmail.com>, Alex Hung <alex.hung@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-41-alex.hung@amd.com>
 <CAFZQkGwrP39REsvZwQ_Uaq+cHR_pH2EPuv_POXRO7Hxj9u4Xsw@mail.gmail.com>
Content-Language: en-US
From: Autumn Ashton <misyl@froggi.es>
In-Reply-To: <CAFZQkGwrP39REsvZwQ_Uaq+cHR_pH2EPuv_POXRO7Hxj9u4Xsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Mailman-Approved-At: Sat, 17 May 2025 21:33:59 +0000
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


On 5/17/25 2:22 AM, Xaver Hugl wrote:
> Am Do., 27. März 2025 um 00:58 Uhr schrieb Alex Hung <alex.hung@amd.com>:
>> It is to be used to enable HDR by allowing userpace to create and pass
>> 3D LUTs to kernel and hardware.
>>
>> new drm_colorop_type: DRM_COLOROP_3D_LUT.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> ---
>> v8:
>>   - Fix typo in subject (Simon Ser)
>>   - Update documentation for DRM_COLOROP_3D_LUT (Simon Ser)
>>   - Delete empty lines (Simon Ser)
>>
>> v7:
>>   - Simplify 3D LUT by removing lut_3d_modes and related functions (Simon Ser)
>>
>>   drivers/gpu/drm/drm_atomic.c      |  6 +++
>>   drivers/gpu/drm/drm_atomic_uapi.c |  6 +++
>>   drivers/gpu/drm/drm_colorop.c     | 72 +++++++++++++++++++++++++++++++
>>   include/drm/drm_colorop.h         | 21 +++++++++
>>   include/uapi/drm/drm_mode.h       | 33 ++++++++++++++
>>   5 files changed, 138 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
>> index 0efb0ead204a..ef47a06344f3 100644
>> --- a/drivers/gpu/drm/drm_atomic.c
>> +++ b/drivers/gpu/drm/drm_atomic.c
>> @@ -806,6 +806,12 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
>>          case DRM_COLOROP_MULTIPLIER:
>>                  drm_printf(p, "\tmultiplier=%llu\n", state->multiplier);
>>                  break;
>> +       case DRM_COLOROP_3D_LUT:
>> +               drm_printf(p, "\tsize=%d\n", colorop->lut_size);
>> +               drm_printf(p, "\tinterpolation=%s\n",
>> +                          drm_get_colorop_lut3d_interpolation_name(colorop->lut3d_interpolation));
>> +               drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
>> +               break;
>>          default:
>>                  break;
>>          }
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>> index 947c18e8bf9b..d5d464b4d0f6 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -719,6 +719,10 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
>>          case DRM_COLOROP_CTM_3X4:
>>                  size = sizeof(struct drm_color_ctm_3x4);
>>                  break;
>> +       case DRM_COLOROP_3D_LUT:
>> +               size = colorop->lut_size * colorop->lut_size * colorop->lut_size *
>> +                      sizeof(struct drm_color_lut);
>> +               break;
>>          default:
>>                  /* should never get here */
>>                  return -EINVAL;
>> @@ -771,6 +775,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
>>                  *val = state->multiplier;
>>          } else if (property == colorop->lut_size_property) {
>>                  *val = colorop->lut_size;
>> +       } else if (property == colorop->lut3d_interpolation_property) {
>> +               *val = colorop->lut3d_interpolation;
>>          } else if (property == colorop->data_property) {
>>                  *val = (state->data) ? state->data->base.id : 0;
>>          } else {
>> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
>> index e03706e7179b..224c6be237d2 100644
>> --- a/drivers/gpu/drm/drm_colorop.c
>> +++ b/drivers/gpu/drm/drm_colorop.c
>> @@ -67,6 +67,7 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
>>          { DRM_COLOROP_1D_LUT, "1D LUT" },
>>          { DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
>>          { DRM_COLOROP_MULTIPLIER, "Multiplier"},
>> +       { DRM_COLOROP_3D_LUT, "3D LUT"},
>>   };
>>
>>   static const char * const colorop_curve_1d_type_names[] = {
>> @@ -82,6 +83,11 @@ static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] =
>>          { DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR, "Linear" },
>>   };
>>
>> +
>> +static const struct drm_prop_enum_list drm_colorop_lut3d_interpolation_list[] = {
>> +       { DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL, "Tetrahedral" },
>> +};
>> +
>>   /* Init Helpers */
>>
>>   static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
>> @@ -349,6 +355,51 @@ int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
>>   }
>>   EXPORT_SYMBOL(drm_colorop_mult_init);
>>
>> +int drm_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
>> +                          struct drm_plane *plane,
>> +                          uint32_t lut_size,
>> +                          enum drm_colorop_lut3d_interpolation_type interpolation,
>> +                          bool allow_bypass)
>> +{
>> +       struct drm_property *prop;
>> +       int ret;
>> +
>> +       ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_3D_LUT, allow_bypass);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* LUT size */
>> +       prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE  | DRM_MODE_PROP_ATOMIC,
>> +                                        "SIZE", 0, UINT_MAX);
>> +       if (!prop)
>> +               return -ENOMEM;
>> +
>> +       colorop->lut_size_property = prop;
>> +       drm_object_attach_property(&colorop->base, colorop->lut_size_property, lut_size);
>> +       colorop->lut_size = lut_size;
>> +
>> +       /* interpolation */
>> +       prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE, "LUT3D_INTERPOLATION",
> Do we ever expect this to be something with multiple options that
> userspace could select? I think it would be good to keep our options
> open and make this property not immutable (properties that are
> sometimes but not always immutable are more annoying to deal with in
> userspace).


I don't think so, AFAIK on AMD there is only tetrahedral.

Other vendors might have that as configurable, but I imagine that's why 
this is immutable in this instance.


Whether or not the interpolation mode is tetrahedral or linear would 
probably affect whether I would use the HW block.

Small (eg. 9x9x9 or 17x17x17) 3D LUTs interpolated as linear cannot 
apply identity 3D LUTs as identity.

This is why we do manual tetrahedral sampling in Gamescope in our shader 
path too...


- Autumn ✨


>
> Same applies to 1D LUTs as well.

