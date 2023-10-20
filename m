Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAE57D1178
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 16:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752A210E5C0;
	Fri, 20 Oct 2023 14:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6720C10E0E2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 14:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697811788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hsCibT3VoX1eMQDZA49xovG6VtwqWkZztDnKgBUIi4c=;
 b=Qn7fb4UyJ7TbpfTUrukcB/4Uda7FQZugYb2mmFvmRMGurU9eXAirAzK2TF/gq/ISRTWNji
 aCkUZ/cNlzolXvXrLgVQs6fGHo5GKYlVeNbFVrlRgcuGSB1KKvYW32xY4ftbMAnYiIi4JR
 51T9IJ2Xyz5vJ+PikWCPcE3sIY75q+I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-UBmEykV9O4-IqQrslSqqig-1; Fri, 20 Oct 2023 10:23:00 -0400
X-MC-Unique: UBmEykV9O4-IqQrslSqqig-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-32cef5f8af5so1039938f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 07:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697811779; x=1698416579;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hsCibT3VoX1eMQDZA49xovG6VtwqWkZztDnKgBUIi4c=;
 b=K6hVm4aHA3t+rDIEtvPudMhJ9iJb2mw1YQZCiCm9Qi+y4GwR3b8gdg3OEVkPBOrxYe
 R3vGVhoFez5lp6Z3KMBhZzmBM4Tzsh9nNHBtnj3ESHwcC+g1JmlphUWqADIF65i543F/
 iDRgIL4utyj4lStKV13yhEm7L4ujQWmxPurGUSu4JF3bOzA1Cgf3c0rZszM+rCCP4DHm
 goGUQu0vtFuaxSeD1oo5H+WN4uIlcpG/s68MNy5pxS1Xg7/k8wpxZTnWUdWFd+A1KiJm
 rGBS0nETyCkOe4jHACQVw0v8Cv89cCMdJG1aISZs8u3fcYcjamAgJFdjqFokAGpKmmMT
 idbA==
X-Gm-Message-State: AOJu0YyxYZQ/f6mDUYDKAXTH5M3NQs/pB9BftgRZwuVrBZRUiWq6QSjO
 s3DPgvlf55p2EJkBYruBr9Wkkq7YKD/DbJpXD3pDFxpKMTgdgah79OOTgEtP4tuss5rQs3KlOLy
 Ef2kSKN9X9IT9xqWNbe792f/Hh1nZ
X-Received: by 2002:adf:b307:0:b0:314:3369:df57 with SMTP id
 j7-20020adfb307000000b003143369df57mr5121052wrd.5.1697811778906; 
 Fri, 20 Oct 2023 07:22:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER1RXcXaYi6+oi48vrCb4RzW5NKbjurI9lR/VBIdCp4jziHcAKpTYBmyVrPT1boPbAPs9s5A==
X-Received: by 2002:adf:b307:0:b0:314:3369:df57 with SMTP id
 j7-20020adfb307000000b003143369df57mr5120999wrd.5.1697811778392; 
 Fri, 20 Oct 2023 07:22:58 -0700 (PDT)
Received: from toolbox ([2001:9e8:8993:e400:bc64:300a:e03c:766f])
 by smtp.gmail.com with ESMTPSA id
 k12-20020adff5cc000000b00326f5d0ce0asm1799174wrp.21.2023.10.20.07.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 07:22:58 -0700 (PDT)
Date: Fri, 20 Oct 2023 16:22:56 +0200
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive
 color pipeline is needed
Message-ID: <20231020142256.GA859375@toolbox>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-7-harry.wentland@amd.com>
MIME-Version: 1.0
In-Reply-To: <20231019212133.245155-7-harry.wentland@amd.com>
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 dri-devel@lists.freedesktop.org,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>, Aleix Pol <aleixpol@kde.org>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Hector Martin <marcan@marcan.st>, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for continuing to work on this!

On Thu, Oct 19, 2023 at 05:21:22PM -0400, Harry Wentland wrote:
> v2:
>  - Update colorop visualizations to match reality (Sebastian, Alex Hung)
>  - Updated wording (Pekka)
>  - Change BYPASS wording to make it non-mandatory (Sebastian)
>  - Drop cover-letter-like paragraph from COLOR_PIPELINE Plane Property
>    section (Pekka)
>  - Use PQ EOTF instead of its inverse in Pipeline Programming example (Melissa)
>  - Add "Driver Implementer's Guide" section (Pekka)
>  - Add "Driver Forward/Backward Compatibility" section (Sebastian, Pekka)
> 
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
> Cc: Sima <daniel@ffwll.ch>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
> Cc: Christopher Braga <quic_cbraga@quicinc.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> Cc: Hector Martin <marcan@marcan.st>
> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
> Cc: Sasha McIntosh <sashamcintosh@google.com>
> ---
>  Documentation/gpu/rfc/color_pipeline.rst | 347 +++++++++++++++++++++++
>  1 file changed, 347 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
> 
> diff --git a/Documentation/gpu/rfc/color_pipeline.rst b/Documentation/gpu/rfc/color_pipeline.rst
> new file mode 100644
> index 000000000000..af5f2ea29116
> --- /dev/null
> +++ b/Documentation/gpu/rfc/color_pipeline.rst
> @@ -0,0 +1,347 @@
> +========================
> +Linux Color Pipeline API
> +========================
> +
> +What problem are we solving?
> +============================
> +
> +We would like to support pre-, and post-blending complex color
> +transformations in display controller hardware in order to allow for
> +HW-supported HDR use-cases, as well as to provide support to
> +color-managed applications, such as video or image editors.
> +
> +It is possible to support an HDR output on HW supporting the Colorspace
> +and HDR Metadata drm_connector properties, but that requires the
> +compositor or application to render and compose the content into one
> +final buffer intended for display. Doing so is costly.
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
> +This results in mapping algorithm lock-in, meaning that no-one alone can
> +experiment with or introduce new mapping algorithms and achieve
> +consistent results regardless of which implementation path is taken.
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
> +compositor, as tuning it to one could make it look fairly different from
> +another compositor's color mapping.
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
> +This recipe is generally an ordered list of straight-forward operations,
> +with clear mathematical definitions, such as 1D LUTs, 3D LUTs, matrices,
> +or other operations that can be described in a precise manner.
> +
> +
> +The Color Pipeline API
> +======================
> +
> +HW color management pipelines can significantly differ between HW
> +vendors in terms of availability, ordering, and capabilities of HW
> +blocks. This makes a common definition of color management blocks and
> +their ordering nigh impossible. Instead we are defining an API that
> +allows user space to discover the HW capabilities in a generic manner,
> +agnostic of specific drivers and hardware.
> +
> +
> +drm_colorop Object & IOCTLs
> +===========================
> +
> +To support the definition of color pipelines we define the DRM core
> +object type drm_colorop. Individual drm_colorop objects will be chained
> +via the NEXT property of a drm_colorop to constitute a color pipeline.
> +Each drm_colorop object is unique, i.e., even if multiple color
> +pipelines have the same operation they won't share the same drm_colorop
> +object to describe that operation.
> +
> +Note that drivers are not expected to map drm_colorop objects statically
> +to specific HW blocks. The mapping of drm_colorop objects is entirely a
> +driver-internal detail and can be as dynamic or static as a driver needs
> +it to be. See more in the Driver Implementation Guide section below.
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
> +setting the BYPASS property to true should never fail. The BYPASS

It hurts me to say as someone who is going to deal with this in user
space but I think we should drop the requirement to never fail setting a
pipeline to bypass mode with !ALLOW_MODESET.

On IRC there was a discussion with Sima where he explained that atomic
checks always check from current state (C) to a new state (B). This
doesn't imply B->C will succeed as well. So to make the guarantee
possible we'd have to change all drivers to be able to check from
arbitrary state A to arbitrary state B and then check both C->B and
B->C (or let user space do it).

Let's leave this can of worms for another time and then solve it not
just for the color pipeline but for any state.

> +property is not mandatory for a colorop, as long as the entire pipeline
> +can get bypassed by setting the COLOR_PIPELINE on a plane to '0'.
> +
> +NEXT: The ID of the next drm_colorop in a color pipeline, or 0 if this
> +drm_colorop is the last in the chain.
> +
> +An example of a drm_colorop object might look like one of these::
> +
> +    /* 1D enumerated curve */
> +    Color operation 42
> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 1D enumerated curve
> +    ├─ "BYPASS": bool {true, false}
> +    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, sRGB inverse EOTF, PQ EOTF, PQ inverse EOTF, …}
> +    └─ "NEXT": immutable color operation ID = 43
> +
> +    /* custom 4k entry 1D LUT */
> +    Color operation 52
> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 1D LUT
> +    ├─ "BYPASS": bool {true, false}
> +    ├─ "LUT_1D_SIZE": immutable range = 4096
> +    ├─ "LUT_1D": blob
> +    └─ "NEXT": immutable color operation ID = 0
> +
> +    /* 17^3 3D LUT */
> +    Color operation 72
> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 3D LUT
> +    ├─ "BYPASS": bool {true, false}
> +    ├─ "LUT_3D_SIZE": immutable range = 17
> +    ├─ "LUT_3D": blob
> +    └─ "NEXT": immutable color operation ID = 73
> +
> +
> +COLOR_PIPELINE Plane Property
> +=============================
> +
> +Color Pipelines are created by a driver and advertised via a new
> +COLOR_PIPELINE enum property on each plane. Values of the property
> +always include '0', which is the default and means all color processing
> +is disabled. Additional values will be the object IDs of the first
> +drm_colorop in a pipeline. A driver can create and advertise none, one,
> +or more possible color pipelines. A DRM client will select a color
> +pipeline by setting the COLOR PIPELINE to the respective value.
> +
> +In the case where drivers have custom support for pre-blending color
> +processing those drivers shall reject atomic commits that are trying to
> +use both the custom color properties, as well as the COLOR_PIPELINE
> +property.

I think we all agree that we need a CAP even for the pre-blending
pipeline anyway because of COLOR_ENCODING etc. So this probably should
be more general and should say that with this CAP to expose the color
pipeline any other pre-blending color processing properties need to be
removed and all driver-internal pre-blending color processing must be
disabled.

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
> +    ├─ "TYPE" (immutable) = Primary
> +    └─ "COLOR_PIPELINE": enum {0, 44} = 0
> +
> +    Color operation 44
> +    ├─ "TYPE" (immutable) = 1D enumerated curve
> +    ├─ "BYPASS": bool
> +    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, PQ EOTF} = sRGB EOTF
> +    └─ "NEXT" (immutable) = 45
> +
> +    Color operation 45
> +    ├─ "TYPE" (immutable) = 3x4 Matrix
> +    ├─ "BYPASS": bool
> +    ├─ "MATRIX_3_4": blob
> +    └─ "NEXT" (immutable) = 46
> +
> +    Color operation 46
> +    ├─ "TYPE" (immutable) = 1D enumerated curve
> +    ├─ "BYPASS": bool
> +    ├─ "CURVE_1D_TYPE": enum {sRGB Inverse EOTF, PQ Inverse EOTF} = sRGB EOTF
> +    └─ "NEXT" (immutable) = 47
> +
> +    Color operation 47
> +    ├─ "TYPE" (immutable) = 1D LUT
> +    ├─ "LUT_1D_SIZE": immutable range = 4096
> +    ├─ "LUT_1D_DATA": blob
> +    └─ "NEXT" (immutable) = 48
> +
> +    Color operation 48
> +    ├─ "TYPE" (immutable) = 3D LUT
> +    ├─ "LUT_3D_SIZE" (immutable) = 17
> +    ├─ "LUT_3D_DATA": blob
> +    └─ "NEXT" (immutable) = 49
> +
> +    Color operation 49
> +    ├─ "TYPE" (immutable) = 1D enumerated curve
> +    ├─ "BYPASS": bool
> +    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, PQ EOTF} = sRGB EOTF
> +    └─ "NEXT" (immutable) = 0
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
> +    └─ "COLOR_PIPELINE" = 42
> +
> +    Color operation 42 (input CSC)
> +    └─ "BYPASS" = true
> +
> +    Color operation 44 (DeGamma)
> +    └─ "BYPASS" = true
> +
> +    Color operation 45 (gamut remap)
> +    └─ "BYPASS" = true
> +
> +    Color operation 46 (shaper LUT RAM)
> +    └─ "BYPASS" = true
> +
> +    Color operation 47 (3D LUT RAM)
> +    └─ "LUT_3D_DATA" = Gamut mapping + tone mapping + night mode
> +
> +    Color operation 48 (blend gamma)
> +    └─ "CURVE_1D_TYPE" = PQ EOTF
> +
> +
> +Driver Implementer's Guide
> +==========================
> +
> +What does this all mean for driver implementations? As noted above the
> +colorops can map to HW directly but don't need to do so. Here are some
> +suggestions on how to think about creating your color pipelines:
> +
> +- Try to expose pipelines that use already defined colorops, even if
> +  your hardware pipeline is split differently. This allows existing
> +  userspace to immediately take advantage of the hardware.
> +
> +- Additionally, try to expose your actual hardware blocks as colorops.
> +  Define new colorop types where you believe it can offer significant
> +  benefits if userspace learns to program them.
> +
> +- Avoid defining new colorops for compound operations with very narrow
> +  scope. If you have a hardware block for a special operation that
> +  cannot be split further, you can expose that as a new colorop type.
> +  However, try to not define colorops for "use cases", especially if
> +  they require you to combine multiple hardware blocks.
> +
> +- Design new colorops as prescriptive, not descriptive; by the
> +  mathematical formula, not by the assumed input and output.
> +
> +A defined colorop type must be deterministic. Its operation can depend
> +only on its properties and input and nothing else, allowed error
> +tolerance notwithstanding.

Maybe add that the exact behavior or formula of the element must be
documented entirely.

> +
> +
> +Driver Forward/Backward Compatibility
> +=====================================
> +
> +As this is uAPI drivers can't regress color pipelines that have been
> +introduced for a given HW generation. New HW generations are free to
> +abandon color pipelines advertised for previous generations.
> +Nevertheless, it can be beneficial to carry support for existing color
> +pipelines forward as those will likely already have support in DRM
> +clients.
> +
> +Introducing new colorops to a pipeline is fine, as long as they can be
> +disabled or are purely informational. DRM clients implementing support
> +for the pipeline can always skip unknown properties as long as they can
> +be confident that doing so will not cause unexpected results.
> +
> +If a new colorop doesn't fall into one of the above categories
> +(bypassable or informational) the modified pipeline would be unusable
> +for user space. In this case a new pipeline should be defined.

How can user space detect an informational element? Should we just add a
BYPASS property to informational elements, make it read only and set to
true maybe? Or something more descriptive?

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

