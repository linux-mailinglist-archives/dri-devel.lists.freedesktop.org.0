Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3D8798F31
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 21:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B5E10E126;
	Fri,  8 Sep 2023 19:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993B010E123
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 19:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694201445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B7oc3OWJO19JI0oQY5o6YNdGBdMgEHPBj1o4KA2+v00=;
 b=WsUx1qo0KKBykOM48K3pvSGW4wyKjDgddhaV7iDCB2giz4zpfpSHGxZ0YSQhGzk5Ho1gTL
 deJJ1TYJwwmuHfw4B6Fg3Nwja0KkAVpL6zrXH7ngjyuRYMlWs/0FTtEl7FMvX+VnIqigf6
 WJO8+dvbuVD8F3zjK5WNK30R1k18Ca8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-V_lp4p_KNR2jEkwF3qqcVQ-1; Fri, 08 Sep 2023 15:30:44 -0400
X-MC-Unique: V_lp4p_KNR2jEkwF3qqcVQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-993c2d9e496so178391466b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Sep 2023 12:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694201443; x=1694806243;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B7oc3OWJO19JI0oQY5o6YNdGBdMgEHPBj1o4KA2+v00=;
 b=D/kMZShHwvxl4BaV+YMt5s05/udyYPMt7mzAiFQ0+28U9c00IlbesjOokjPik4ck+8
 ARe85RJSttRmRo1TWyFFSWde/ylduYj+OQfdfjM/jHtz99NoH6xpdGO+VPUjaIUHk9A4
 NhTylADphhHaP5Ku+ovn1cNwoa0etkQCgYBWgErqe17IOipO28KXB9K3uMHOFlE1FJtF
 pTja+FVX9hWidwnqpKMaKydrv8T5xQ0KTRHP022IfHirIAD5SNdCFbqMBaOyyahBWqZt
 eTYViO23imhKeThk05GFbS1KNm58/cof6ekstVf+ToBTGZq0NYDvGLByU3Y0o9VsLbLs
 qjMQ==
X-Gm-Message-State: AOJu0YxfsHSd8ezSp9bDmUjn5ZYeXqgBYSrnjw+C1BhEqisBU3jBBpYD
 V/0y8WbOtzJuKcFNVeV+PjA6nf4vZkaK2BDU8QfrK+JwNFDesjFAnxaUe6PRE3BJwrqsz89UR++
 cTqCPOuZmQT9iNyqph3H9Vsb1lr88
X-Received: by 2002:a17:906:748c:b0:9a9:fd03:1a14 with SMTP id
 e12-20020a170906748c00b009a9fd031a14mr1957275ejl.56.1694201443068; 
 Fri, 08 Sep 2023 12:30:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAEiSyZTWqkLmjfCTnlBi/xnDyDr1yaaLvbwAd+yi2pG69WoNpX6UBEMs5buJ/uxWtR84nZA==
X-Received: by 2002:a17:906:748c:b0:9a9:fd03:1a14 with SMTP id
 e12-20020a170906748c00b009a9fd031a14mr1957251ejl.56.1694201442689; 
 Fri, 08 Sep 2023 12:30:42 -0700 (PDT)
Received: from toolbox ([2001:9e8:8987:c700:68ea:5a1c:c7a9:3da4])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a170906044300b00993a9a951fasm1432030eja.11.2023.09.08.12.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 12:30:42 -0700 (PDT)
Date: Fri, 8 Sep 2023 21:30:40 +0200
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Message-ID: <20230908193040.GA978120@toolbox>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
MIME-Version: 1.0
In-Reply-To: <20230908150235.75918-2-harry.wentland@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Joshua Ashton <joshua@froggi.es>,
 Aleix Pol <aleixpol@kde.org>, Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Harry,

Thank you and Simon for this great document. Really happy about it, but
obviously I've got a few notes and questions inline.

On Fri, Sep 08, 2023 at 11:02:26AM -0400, Harry Wentland wrote:
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Jonas Ådahl <jadahl@redhat.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Alexander Goins <agoins@nvidia.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Michel Dänzer <mdaenzer@redhat.com>
> Cc: Aleix Pol <aleixpol@kde.org>
> Cc: Xaver Hugl <xaver.hugl@gmail.com>
> Cc: Victoria Brekenfeld <victoria@system76.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
> Cc: Christopher Braga <quic_cbraga@quicinc.com>
> ---
>  Documentation/gpu/rfc/color_pipeline.rst | 278 +++++++++++++++++++++++
>  1 file changed, 278 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
> 
> diff --git a/Documentation/gpu/rfc/color_pipeline.rst b/Documentation/gpu/rfc/color_pipeline.rst
> new file mode 100644
> index 000000000000..bfa4a8f12087
> --- /dev/null
> +++ b/Documentation/gpu/rfc/color_pipeline.rst
> @@ -0,0 +1,278 @@
> +========================
> +Linux Color Pipeline API
> +========================
> +
> +What problem are we solving?
> +============================
> +
> +We would like to support pre-, and post-blending complex color transformations
> +in order to allow for HW-supported HDR use-cases, as well as to provide support
> +to color-managed applications, such as video or image editors.
> +
> +While it is possible to support an HDR output on HW supporting the Colorspace
> +and HDR Metadata drm_connector properties that requires the compositor or
> +application to render and compose the content into one final buffer intended for
> +display. Doing so is costly.
> +
> +Most modern display HW offers various 1D LUTs, 3D LUTs, matrices, and other
> +operations to support color transformations. These operations are often
> +implemented in fixed-function HW and therefore much more power efficient than
> +performing similar operations via shaders or CPU.
> +
> +We would like to make use of this HW functionality to support complex color
> +transformations with no, or minimal CPU or shader load.
> +
> +
> +How are other OSes solving this problem?
> +========================================
> +
> +The most widely supported use-cases regard HDR content, whether video or
> +gaming.
> +
> +Most OSes will specify the source content format (color gamut, encoding transfer
> +function, and other metadata, such as max and average light levels) to a driver.
> +Drivers will then program their fixed-function HW accordingly to map from a
> +source content buffer's space to a display's space.
> +
> +When fixed-function HW is not available the compositor will assemble a shader to
> +ask the GPU to perform the transformation from the source content format to the
> +display's format.
> +
> +A compositor's mapping function and a driver's mapping function are usually
> +entirely separate concepts. On OSes where a HW vendor has no insight into
> +closed-source compositor code such a vendor will tune their color management
> +code to visually match the compositor's. On other OSes, where both mapping
> +functions are open to an implementer they will ensure both mappings match.
> +
> +
> +Why is Linux different?
> +=======================
> +
> +Unlike other OSes, where there is one compositor for one or more drivers, on
> +Linux we have a many-to-many relationship. Many compositors; many drivers.
> +In addition each compositor vendor or community has their own view of how
> +color management should be done. This is what makes Linux so beautiful.
> +
> +This means that a HW vendor can now no longer tune their driver to one
> +compositor, as tuning it to one will almost inevitably make it look very
> +different from another compositor's color mapping.
> +
> +We need a better solution.
> +
> +
> +Descriptive API
> +===============
> +
> +An API that describes the source and destination colorspaces is a descriptive
> +API. It describes the input and output color spaces but does not describe
> +how precisely they should be mapped. Such a mapping includes many minute
> +design decision that can greatly affect the look of the final result.
> +
> +It is not feasible to describe such mapping with enough detail to ensure the
> +same result from each implementation. In fact, these mappings are a very active
> +research area.
> +
> +
> +Prescriptive API
> +================
> +
> +A prescriptive API describes not the source and destination colorspaces. It
> +instead prescribes a recipe for how to manipulate pixel values to arrive at the
> +desired outcome.
> +
> +This recipe is generally an order straight-forward operations, with clear
> +mathematical definitions, such as 1D LUTs, 3D LUTs, matrices, or other
> +operations that can be described in a precise manner.
> +
> +
> +The Color Pipeline API
> +======================
> +
> +HW color management pipelines can significantly differ between HW
> +vendors in terms of availability, ordering, and capabilities of HW
> +blocks. This makes a common definition of color management blocks and
> +their ordering nigh impossible. Instead we are defining an API that
> +allows user space to discover the HW capabilities.
> +
> +
> +drm_colorop Object & IOCTLs
> +===========================
> +
> +To support the definition of color pipelines we introduce a new DRM core
> +object, a drm_colorop. Individual drm_colorop objects will be chained
> +via the NEXT property of a drm_colorop to constitute a color pipeline.
> +Each drm_colorop object is unique, i.e., even if multiple color
> +pipelines have the same operation they won't share the same drm_colorop
> +object to describe that operation.
> +
> +Just like other DRM objects the drm_colorop objects are discovered via
> +IOCTLs:
> +
> +DRM_IOCTL_MODE_GETCOLOROPRESOURCES: This IOCTL is used to retrieve the
> +number of all drm_colorop objects.
> +
> +DRM_IOCTL_MODE_GETCOLOROP: This IOCTL is used to read one drm_colorop.
> +It includes the ID for the colorop object, as well as the plane_id of
> +the associated plane. All other values should be registered as
> +properties.
> +
> +Each drm_colorop has three core properties:

We talked a bit about how forwards compatibility will look like. When a
driver introduces a new property that user space doesn't understand yet,
for user space to make use of the pipeline, the property either has to
have a bypass property, or some other kind of standard/core property
that promises that this property is purely informational and the
existance doesn't change the result of the color pipeline. Something
like "INFORMATIONAL" or "INFO" (better suggestions welcome!).

If a property doesn't fall into the two categories, the new pipeline
would be unusable for user space. So, if this new property is added on
an existing piece of hardware, it should be done on an entirely new
pipeline to avoid user space regressions.

I believe these compatibility considerations are very important to
document.

> +
> +TYPE: The type of transformation, such as
> +* enumerated curve
> +* custom (uniform) 1D LUT
> +* 3x3 matrix
> +* 3x4 matrix
> +* 3D LUT
> +* etc.
> +
> +Depending on the type of transformation other properties will describe
> +more details.
> +
> +BYPASS: A boolean property that can be used to easily put a block into
> +bypass mode. While setting other properties might fail atomic check,
> +setting the BYPASS property to true should never fail. This allows DRM
> +clients to fallback to other methods of color management if an atomic
> +check for KMS color operations fails.

This says BYPASS is a prop but in the example below the type property is
a mutable enum with Bypass being an enum variant.

Any reason why you chose to make the type property mutable instead of a
separate BYPASS property? Personally I like the simplicity of immutable
properties and would favor a BYPASS property.

> +
> +NEXT: The ID of the next drm_colorop in a color pipeline, or 0 if this
> +drm_colorop is the last in the chain.
> +
> +An example of a drm_colorop object might look like one of these::
> +
> +    Color operation 42
> +    ├─ "type": enum {Bypass, 1D curve} = 1D curve
> +    ├─ "1d_curve_type": enum {LUT, sRGB, PQ, BT.709, HLG, …} = LUT
> +    ├─ "lut_size": immutable range = 4096
> +    ├─ "lut_data": blob
> +    └─ "next": immutable color operation ID = 43
> +
> +    Color operation 42
> +    ├─ "type": enum {Bypass, 3D LUT} = 3D LUT
> +    ├─ "lut_size": immutable range = 33
> +    ├─ "lut_data": blob
> +    └─ "next": immutable color operation ID = 43
> +
> +    Color operation 42
> +    ├─ "type": enum {Bypass, Matrix} = Matrix
> +    ├─ "matrix_data": blob
> +    └─ "next": immutable color operation ID = 43
> +
> +
> +COLOR_PIPELINE Plane Property
> +=============================
> +
> +Because we don't have existing KMS color properties in the pre-blending
> +portion of display pipelines (i.e. on drm_planes) we are introducing
> +color pipelines here first. Eventually we'll want to use the same
> +concept for the post-blending portion, i.e. drm_crtcs.
> +
> +Color Pipelines are created by a driver and advertised via a new
> +COLOR_PIPELINE enum property on each plane. Values of the property
> +always include '0', which is the default and means all color processing
> +is disabled. Additional values will be the object IDs of the first

Regarding the requirement to never fail atomic checks which set a
colorop to bypass: I think for user space it would be sufficient if
setting the entire pipeline to bypass would not fail the atomic check.

I'm also wondering if there is/will be hardware out there which always
does some kind of transformation which cannot be turned off. How would
they implement the '0' pipeline?

> +drm_colorop in a pipeline. A driver can create and advertise none, one,
> +or more possible color pipelines. A DRM client will select a color
> +pipeline by setting the COLOR PIPELINE to the respective value.
> +
> +In the case where drivers have custom support for pre-blending color
> +processing those drivers shall reject atomic commits that are trying to
> +set both the custom color properties, as well as the COLOR_PIPELINE
> +property.

By 'not setting the COLOR_PIPELINE property' you mean any value other
than '0' I guess? Should be fine to a proper user space.

> +
> +An example of a COLOR_PIPELINE property on a plane might look like this::
> +
> +    Plane 10
> +    ├─ "type": immutable enum {Overlay, Primary, Cursor} = Primary
> +    ├─ …
> +    └─ "color_pipeline": enum {0, 42, 52} = 0
> +
> +
> +Color Pipeline Discovery
> +========================
> +
> +A DRM client wanting color management on a drm_plane will:
> +
> +1. Read all drm_colorop objects
> +2. Get the COLOR_PIPELINE property of the plane
> +3. iterate all COLOR_PIPELINE enum values
> +4. for each enum value walk the color pipeline (via the NEXT pointers)
> +   and see if the available color operations are suitable for the
> +   desired color management operations
> +
> +An example of chained properties to define an AMD pre-blending color
> +pipeline might look like this::
> +
> +    Plane 10
> +    ├─ "type": immutable enum {Overlay, Primary, Cursor} = Primary
> +    └─ "color_pipeline": enum {0, 42} = 0
> +    Color operation 42 (input CSC)
> +    ├─ "type": enum {Bypass, Matrix} = Matrix
> +    ├─ "matrix_data": blob
> +    └─ "next": immutable color operation ID = 43
> +    Color operation 43
> +    ├─ "type": enum {Scaling} = Scaling
> +    └─ "next": immutable color operation ID = 44
> +    Color operation 44 (DeGamma)
> +    ├─ "type": enum {Bypass, 1D curve} = 1D curve
> +    ├─ "1d_curve_type": enum {sRGB, PQ, …} = sRGB
> +    └─ "next": immutable color operation ID = 45
> +    Color operation 45 (gamut remap)
> +    ├─ "type": enum {Bypass, Matrix} = Matrix
> +    ├─ "matrix_data": blob
> +    └─ "next": immutable color operation ID = 46
> +    Color operation 46 (shaper LUT RAM)
> +    ├─ "type": enum {Bypass, 1D curve} = 1D curve
> +    ├─ "1d_curve_type": enum {LUT} = LUT
> +    ├─ "lut_size": immutable range = 4096
> +    ├─ "lut_data": blob
> +    └─ "next": immutable color operation ID = 47
> +    Color operation 47 (3D LUT RAM)
> +    ├─ "type": enum {Bypass, 3D LUT} = 3D LUT
> +    ├─ "lut_size": immutable range = 17
> +    ├─ "lut_data": blob
> +    └─ "next": immutable color operation ID = 48
> +    Color operation 48 (blend gamma)
> +    ├─ "type": enum {Bypass, 1D curve} = 1D curve
> +    ├─ "1d_curve_type": enum {LUT, sRGB, PQ, …} = LUT
> +    ├─ "lut_size": immutable range = 4096
> +    ├─ "lut_data": blob
> +    └─ "next": immutable color operation ID = 0
> +
> +
> +Color Pipeline Programming
> +==========================
> +
> +Once a DRM client has found a suitable pipeline it will:
> +
> +1. Set the COLOR_PIPELINE enum value to the one pointing at the first
> +   drm_colorop object of the desired pipeline
> +2. Set the properties for all drm_colorop objects in the pipeline to the
> +   desired values, setting BYPASS to true for unused drm_colorop blocks,
> +   and false for enabled drm_colorop blocks
> +3. Perform atomic_check/commit as desired
> +
> +To configure the pipeline for an HDR10 PQ plane and blending in linear
> +space, a compositor might perform an atomic commit with the following
> +property values::
> +
> +    Plane 10
> +    └─ "color_pipeline" = 42
> +    Color operation 42 (input CSC)
> +    └─ "bypass" = true
> +    Color operation 44 (DeGamma)
> +    └─ "bypass" = true
> +    Color operation 45 (gamut remap)
> +    └─ "bypasse" = true
> +    Color operation 46 (shaper LUT RAM)
> +    └─ "bypass" = true
> +    Color operation 47 (3D LUT RAM)
> +    └─ "lut_data" = Gamut mapping + tone mapping + night mode
> +    Color operation 48 (blend gamma)
> +    └─ "1d_curve_type" = PQ inverse EOTF
> +
> +
> +References
> +==========
> +
> +1. https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr/
> \ No newline at end of file
> -- 
> 2.42.0
> 

