Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAD0383B4C
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 19:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6E56EA17;
	Mon, 17 May 2021 17:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2496 seconds by postgrey-1.36 at gabe;
 Mon, 17 May 2021 17:30:24 UTC
Received: from h1954565.stratoserver.net (sebastianwick.net [85.214.192.246])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3F1546EA17;
 Mon, 17 May 2021 17:30:23 +0000 (UTC)
Received: by h1954565.stratoserver.net (Postfix, from userid 117)
 id EE4AB163EF0; Mon, 17 May 2021 19:30:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 h1954565.stratoserver.net
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=ALL_TRUSTED,FUZZY_AMBIEN
 autolearn=no autolearn_force=no version=3.4.2
Received: from mail.sebastianwick.net (localhost [IPv6:::1])
 by h1954565.stratoserver.net (Postfix) with ESMTP id 95E05163EEA;
 Mon, 17 May 2021 19:30:16 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 17 May 2021 19:30:16 +0200
From: Sebastian Wick <sebastian@sebastianwick.net>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v2 1/6] drm/doc: Color Management and HDR10 RFC
In-Reply-To: <20210514210720.157892-2-harry.wentland@amd.com>
References: <20210514210720.157892-1-harry.wentland@amd.com>
 <20210514210720.157892-2-harry.wentland@amd.com>
Message-ID: <2753cbe2126c05f7c2beccf13fcfacef@sebastianwick.net>
X-Sender: sebastian@sebastianwick.net
User-Agent: Roundcube Webmail/1.3.4
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, mcasas@google.com,
 Shashank.Sharma@amd.com, dri-devel@lists.freedesktop.org, Shirish.S@amd.com,
 hersenxs.wu@amd.com, amd-gfx@lists.freedesktop.org,
 laurentiu.palcu@oss.nxp.com, Bhawanpreet.Lakha@amd.com,
 Nicholas.Kazlauskas@amd.com, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-05-14 23:07, Harry Wentland wrote:
> Use the new DRM RFC doc section to capture the RFC previously only
> described in the cover letter at
> https://patchwork.freedesktop.org/series/89506/
> 
> Update the RFC based on feedback received:
>  * don't use color_encoding property to define color space
>  * expand on reason for SDR luminance definition
>  * define input/output transfer functions for luminance space 
> transforms,
>    rather than defining the luminance space of an input directly
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  Documentation/gpu/rfc/hdr-wide-gamut.rst | 416 +++++++++++++++++++++++
>  Documentation/gpu/rfc/index.rst          |   4 +
>  2 files changed, 420 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/hdr-wide-gamut.rst
> 
> diff --git a/Documentation/gpu/rfc/hdr-wide-gamut.rst
> b/Documentation/gpu/rfc/hdr-wide-gamut.rst
> new file mode 100644
> index 000000000000..132898668eac
> --- /dev/null
> +++ b/Documentation/gpu/rfc/hdr-wide-gamut.rst
> @@ -0,0 +1,416 @@
> +==============================
> +HDR & Wide Color Gamut Support
> +==============================
> +
> +.. role:: wy-text-strike
> +
> +ToDo
> +====
> +
> +* :wy-text-strike:`Reformat as RST kerneldoc` - done
> +* :wy-text-strike:`Don't use color_encoding for color_space 
> definitions` - done
> +* :wy-text-strike:`Update SDR luminance description and reasoning` - 
> done
> +* :wy-text-strike:`Clarify 3D LUT required for some color space
> transformations` - done
> +* :wy-text-strike:`Highlight need for named color space and EOTF
> definitions` - done
> +* :wy-text-strike:`Define transfer function API` - done
> +* :wy-text-strike:`Draft upstream plan` - done
> +* Reference to wayland and/or Chrome plans
> +* Sketch view of HW pipeline for couple of HW implementations
> +
> +
> +Upstream Plan
> +=============
> +
> +* Reach consensus on DRM/KMS API
> +* Implement support in amdgpu
> +* Implement IGT tests
> +* Add API support to Weston, ChromiumOS, or other canonical
> open-source project interested in HDR
> +* Merge user-space
> +* Merge kernel patches
> +
> +
> +Introduction
> +============
> +
> +We are looking to enable HDR support for a couple of single-plane and
> +multi-plane scenarios. To do this effectively we recommend new 
> interfaces
> +to drm_plane. Below I'll give a bit of background on HDR and why we
> +propose these interfaces.
> +
> +
> +Overview and background
> +=======================
> +
> +Defining a pixel's luminance
> +----------------------------
> +
> +The luminance space of pixels in a framebuffer/plane presented to the
> +display is not well defined in the DRM/KMS APIs. It is usually assumed 
> to
> +be in a 2.2 or 2.4 gamma space and has no mapping to an absolute 
> luminance
> +value; it is interpreted in relative terms.
> +
> +Luminance can be measured and described in absolute terms as candela
> +per meter squared, or cd/m2, or nits. Even though a pixel value can be
> +mapped to luminance in a linear fashion to do so without losing a lot 
> of
> +detail requires 16-bpc color depth. The reason for this is that human
> +perception can distinguish roughly between a 0.5-1% luminance delta. A
> +linear representation is suboptimal, wasting precision in the 
> highlights
> +and losing precision in the shadows.
> +
> +A gamma curve is a decent approximation to a human's perception of
> +luminance, but the PQ (perceptual quantizer) function [1] improves on
> +it. It also defines the luminance values in absolute terms, with the
> +highest value being 10,000 nits and the lowest 0.0005 nits.
> +
> +Using a content that's defined in PQ space we can approximate the real
> +world in a much better way.
> +
> +Here are some examples of real-life objects and their approximate
> +luminance values:
> +
> +.. flat-table::
> +   :header-rows: 1
> +
> +   * - Object
> +     - Luminance in nits
> +
> +   *  - Fluorescent light
> +      - 10,000
> +
> +   *  - Highlights
> +      - 1,000 - sunlight
> +
> +   *  - White Objects
> +      - 250 - 1,000
> +
> +   *  - Typical Objects
> +      - 1 - 250
> +
> +   *  - Shadows
> +      - 0.01 - 1
> +
> +   *  - Ultra Blacks
> +      - 0 - 0.0005
> +
> +Transfer functions
> +------------------
> +
> +Traditionally we used the terms gamma and de-gamma to describe the
> +encoding of a pixel's luminance value and the operation to transfer 
> from
> +a linear luminance space to the non-linear space used to encode the
> +pixels. Since some newer encodings don't use a gamma curve I suggest
> +we refer to non-linear encodings using the terms EOTF, and OETF[2], or
> +simply as transfer function in general.
> +
> +The EOTF (Electro-Optical Transfer Function) describes how to transfer
> +from an electrical signal to an optical signal. This was traditionally
> +done by the de-gamma function.
> +
> +The OETF (Opto Electronic Transfer Function) describes how to transfer
> +from an optical signal to an electronic signal. This was traditionally
> +done by the gamma function.
> +
> +More generally we can name the transfer function describing the 
> transform
> +between scanout and blending space as the **input transfer function**, 
> and
> +the transfer function describing the transform from blending space to 
> the
> +output space as **output transfer function**.
> +
> +
> +Mastering Luminances
> +--------------------
> +
> +Even though we are able to describe the absolute luminance of a pixel
> +using the PQ 2084 EOTF we are presented with physical limitations of 
> the
> +display technologies on the market today. Here are a few examples of
> +luminance ranges of displays.
> +
> +.. flat-table::
> +   :header-rows: 1
> +
> +   * - Display
> +     - Luminance range in nits
> +
> +   *  - Typical PC display
> +      - 0.3 - 200
> +
> +   *  - Excellent LCD HDTV
> +      - 0.3 - 400
> +
> +   *  - HDR LCD w/ local dimming
> +      - 0.05 - 1,500
> +
> +Since no display can currently show the full 0.0005 to 10,000 nits
> +luminance range of PQ the display will need to tone-map the HDR 
> content,
> +i.e to fit the content within a display's capabilities. To assist
> +with tone-mapping HDR content is usually accompanied by a metadata
> +that describes (among other things) the minimum and maximum mastering
> +luminance, i.e. the maximum and minimum luminance of the display that
> +was used to master the HDR content.
> +
> +The HDR metadata is currently defined on the drm_connector via the
> +hdr_output_metadata blob property.
> +
> +It might be useful to define per-plane hdr metadata, as different 
> planes
> +might have been mastered differently.

There really is not reason to have the HDR metadata anywhere but the
connector. If you drive the display in PQ mode and you just map content
into the PQ space you won't do any color or gamut mapping which is the
only reason why you'd want access to the HDR metadata.

User space can generate suitable connector metadata from the clients
metadata.

> +
> +
> +SDR Luminance
> +-------------
> +
> +Traditional SDR content's maximum white luminance is not well defined.
> +Some like to define it at 80 nits, others at 200 nits. It also depends
> +to a large extent on the environmental viewing conditions. In practice
> +this means that we need to define the maximum SDR white luminance, 
> either
> +in nits, or as a ratio.
> +
> +One Windows API defines it as a ratio against 80 nits:
> +https://docs.microsoft.com/en-us/windows-hardware/drivers/ddi/dispmprt/ns-dispmprt-_dxgkarg_settargetadjustedcolorimetry2
> +
> +Another Windows API defines it as a nits value:
> +https://docs.microsoft.com/en-us/windows-hardware/drivers/ddi/dispmprt/ns-dispmprt-_dxgkarg_settargetadjustedcolorimetry2
> +
> +The Wayland color management proposal uses Apple's definition of EDR 
> as a
> +ratio of the HDR range vs SDR range:
> +https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/color/unstable/color-management/color.rst#id8

If you're interested: the concept expanded to black levels
https://gitlab.freedesktop.org/swick/wayland-protocols/-/merge_requests/15

> +
> +If a display's maximum HDR white level is correctly reported it is 
> trivial
> +to convert between all of the above representations of SDR white 
> level. If
> +it is not, defining SDR luminance as a nits value, or a ratio vs a 
> fixed
> +nits value is preferred, assuming we are blending in linear space.
> +
> +It is our experience that many HDR displays do not report maximum 
> white
> +level correctly
> +
> +
> +Let There Be Color
> +------------------
> +
> +So far we've only talked about luminance, ignoring colors altogether. 
> Just
> +like in the luminance space, traditionally the color space of display
> +outputs has not been well defined. Similar to how an EOTF defines a
> +mapping of pixel data to an absolute luminance value, the color space
> +maps color information for each pixel onto the CIE 1931 chromaticity
> +space. This can be thought of as a mapping to an absolute, real-life,
> +color value.
> +
> +A color space is defined by its primaries and white point. The 
> primaries
> +and white point are expressed as coordinates in the CIE 1931 color
> +space. Think of the red primary as the reddest red that can be 
> displayed
> +within the color space. Same for green and blue.
> +
> +Examples of color spaces are:
> +
> +.. flat-table::
> +   :header-rows: 1
> +
> +   * - Color Space
> +     - Description
> +
> +   *  - BT 601
> +      - similar to BT 709
> +
> +   *  - BT 709
> +      - used by sRGB content; ~53% of BT 2020
> +
> +   *  - DCI-P3
> +      - used by most HDR displays; ~72% of BT 2020
> +
> +   *  - BT 2020
> +      - standard for most HDR content
> +
> +
> +
> +Color Primaries and White Point
> +-------------------------------
> +
> +Just like displays can currently not represent the entire 0.0005 -
> +10,000 nits HDR range of the PQ 2084 EOTF, they are currently not 
> capable
> +of representing the entire BT.2020 color Gamut. For this reason video
> +content will often specify the color primaries and white point used to
> +master the video, in order to allow displays to be able to map the 
> image
> +as best as possible onto the display's gamut.
> +
> +
> +Displays and Tonemapping
> +------------------------
> +
> +External displays are able to do their own tone and color mapping, 
> based
> +on the mastering luminance, color primaries, and white space defined 
> in
> +the HDR metadata.
> +
> +Some internal panels might not include the complex HW to do tone and 
> color
> +mapping on their own and will require the display driver to perform
> +appropriate mapping.
> +
> +
> +How are we solving the problem?
> +===============================
> +
> +Input and Output Transfer functions
> +-----------------------------------
> +
> +We define an input transfer function on drm_plane to describe the
> +transform from framebuffer to blending space.
> +
> +We define an output transfer function on drm_crtc to describe the
> +transform from blending space to display space.
> +
> +The transfer function can be a pre-defined function, such as PQ EOTF, 
> or
> +a custom LUT. A driver will be able to specify support for specific
> +transfer functions, including custom ones.
> +
> +Defining the transfer function in this way allows us to support in on 
> HW
> +that uses ROMs to support these transforms, as well as on HW that use
> +LUT definitions that are complex and don't map easily onto a standard 
> LUT
> +definition.
> +
> +We will not define per-plane LUTs in this patchset as the scope of our
> +current work only deals with pre-defined transfer functions. This API 
> has
> +the flexibility to add custom 1D or 3D LUTs at a later date.
> +
> +In order to support the existing 1D de-gamma and gamma LUTs on the 
> drm_crtc
> +we will include a "custom 1D" enum value to indicate that the custom 
> gamma and
> +de-gamma 1D LUTs should be used.
> +
> +Possible transfer functions:
> +
> +.. flat-table::
> +   :header-rows: 1
> +
> +   * - Transfer Function
> +     - Description
> +
> +   *  - Gamma 2.2
> +      - a simple 2.2 gamma function
> +
> +   *  - sRGB
> +      - 2.4 gamma with small initial linear section
> +
> +   *  - PQ 2084
> +      - SMPTE ST 2084; used for HDR video and allows for up to 10,000
> nit support
> +
> +   *  - Linear
> +      - Linear relationship between pixel value and luminance value
> +
> +   *  - Custom 1D
> +      - Custom 1D de-gamma and gamma LUTs; one LUT per color
> +
> +   *  - Custom 3D
> +      - Custom 3D LUT (to be defined)

If there actually is hardware which would benefit from the named TF then
this isn't a bad idea. However, it should be made clear where in the
pipeline this is (i.e. that it replaces the 1d lut) and each entry
should have a reference to the exact formula used.

This would not be useful for a generic wayland compositor so you might
want to get the opinion of the Kodi devs.

> +
> +
> +Describing SDR Luminance
> +------------------------------
> +
> +Since many displays do no correctly advertise the HDR white level we
> +propose to define the SDR white level in nits.
> +
> +We define a new drm_plane property to specify the white level of an 
> SDR
> +plane.

Basically the same situation as with named TFs. If this includes some
proprietary tone mapping stuff it should definitely not be generic KMS
API and if hardware between vendors have just slightly different
formulas it shouldn't be either.

> +
> +
> +Defining the color space
> +------------------------
> +
> +We propose to add a new color space property to drm_plane to define a
> +plane's color space.
> +
> +While some color space conversions can be performed with a simple 
> color
> +transformation matrix (CTM) others require a 3D LUT.

Every well-known color space can be converted to other well-known color
spaces with a CTM so this property is just a worse CTM (am I missing
something?).

On the other hand if the hardware *has* a 3D LUT we absolutely want to
be able to use it from user space!

> +
> +
> +Defining mastering color space and luminance
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +ToDo
> +
> +
> +
> +Pixel Formats
> +~~~~~~~~~~~~~
> +
> +The pixel formats, such as ARGB8888, ARGB2101010, P010, or FP16 are
> +unrelated to color space and EOTF definitions. HDR pixels can be 
> formatted
> +in different ways but in order to not lose precision HDR content 
> requires
> +at least 10 bpc precision. For this reason ARGB2101010, P010, and FP16 
> are
> +the obvious candidates for HDR. ARGB2101010 and P010 have the 
> advantage
> +of requiring only half the bandwidth as FP16, while FP16 has the 
> advantage
> +of enough precision to operate in a linear space, i.e. without EOTF.
> +
> +
> +
> +Use Cases
> +=========
> +
> +RGB10 HDR plane - composited HDR video & desktop
> +------------------------------------------------
> +
> +A single, composited plane of HDR content. The use-case is a video 
> player
> +on a desktop with the compositor owning the composition of SDR and HDR
> +content. The content shall be PQ BT.2020 formatted. The 
> drm_connector's
> +hdr_output_metadata shall be set.
> +
> +
> +P010 HDR video plane + RGB8 SDR desktop plane
> +---------------------------------------------
> +A normal 8bpc desktop plane, with a P010 HDR video plane underlayed. 
> The
> +HDR plane shall be PQ BT.2020 formatted. The desktop plane shall 
> specify
> +an SDR boost value. The drm_connector's hdr_output_metadata shall be 
> set.
> +
> +
> +One XRGB8888 SDR Plane - HDR output
> +-----------------------------------
> +
> +In order to support a smooth transition we recommend an OS that 
> supports
> +HDR output to provide the hdr_output_metadata on the drm_connector to
> +configure the output for HDR, even when the content is only SDR. This 
> will
> +allow for a smooth transition between SDR-only and HDR content. In 
> this
> +use-case the SDR max luminance value should be provided on the 
> drm_plane.
> +
> +In DCN we will de-PQ or de-Gamma all input in order to blend in linear
> +space. For SDR content we will also apply any desired boost before
> +blending. After blending we will then re-apply the PQ EOTF and do RGB
> +to YCbCr conversion if needed.
> +
> +FP16 HDR linear planes
> +----------------------
> +
> +ToDo
> +
> +
> +User Space
> +==========
> +
> +Wayland
> +-------
> +
> +ToDo
> +
> +
> +ChromeOS Ozone
> +--------------
> +
> +ToDo
> +
> +
> +HW support
> +==========
> +
> +ToDo, describe pipeline on a couple different HW platforms
> +
> +
> +References
> +==========
> +
> +* [1]
> https://en.wikipedia.org/wiki/High-dynamic-range_video#Perceptual_Quantizer
> +* [2] https://en.wikipedia.org/wiki/Transfer_functions_in_imaging
> +
> +
> +Further Reading
> +===============
> +
> +*
> https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/color/unstable/color-management/color.rst
> +* http://downloads.bbc.co.uk/rd/pubs/whp/whp-pdf-files/WHP309.pdf
> +* 
> https://app.spectracal.com/Documents/White%20Papers/HDR_Demystified.pdf
> +
> +
> diff --git a/Documentation/gpu/rfc/index.rst 
> b/Documentation/gpu/rfc/index.rst
> index a8621f7dab8b..5c8eaf8bf587 100644
> --- a/Documentation/gpu/rfc/index.rst
> +++ b/Documentation/gpu/rfc/index.rst
> @@ -15,3 +15,7 @@ host such documentation:
> 
>  * Once the code has landed move all the documentation to the right 
> places in
>    the main core, helper or driver sections.
> +
> +  .. toctree::
> +
> +  hdr-wide-gamut.rst
> \ No newline at end of file
