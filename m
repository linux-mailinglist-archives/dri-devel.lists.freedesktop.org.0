Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988BE86ACBF
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 12:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FFC10E44F;
	Wed, 28 Feb 2024 11:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uxxkfH85";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDAC10E489
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 11:13:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D1342B3;
 Wed, 28 Feb 2024 12:13:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1709118811;
 bh=X265+GLtL8FxrQoXnFB6YbmIlSfVxB3qsx1cSvWW4Z8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uxxkfH85qfd9DDEovXOzW3B4+RU2z2ZIbZevqBh+UCguYTM5P5plSGbzGAwNchOSP
 PX8cMS1mBT8EWzQV0//ukT4PwuouGES2ZvVSF5PVcB/U2GTCBgr478usmLsRuwT2q4
 sahIo1pqo0QlW71vXK9u6PO0Fkve39Xix/nzvqWU=
Date: Wed, 28 Feb 2024 13:13:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Naushir Patuck <naush@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 libcamera-devel@lists.libcamera.org
Subject: Re: [RFC] drm/fourcc: Add RPI modifiers
Message-ID: <20240228111345.GK3419@pendragon.ideasonboard.com>
References: <20240226153854.99471-1-jacopo.mondi@ideasonboard.com>
 <CAKMK7uE2CBuGsJUYDT-L8x1Tbjb-PiHUjro8-hDpxLvBWycgLw@mail.gmail.com>
 <20240227130827.GA5863@pendragon.ideasonboard.com>
 <dard25t5lkuvfmwnofoqc5wzgtozdymvcwonpc3y2qvw7zh55k@wkxaefnsibta>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dard25t5lkuvfmwnofoqc5wzgtozdymvcwonpc3y2qvw7zh55k@wkxaefnsibta>
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

On Wed, Feb 28, 2024 at 11:41:57AM +0100, Jacopo Mondi wrote:
> On Tue, Feb 27, 2024 at 03:08:27PM +0200, Laurent Pinchart wrote:
> > On Mon, Feb 26, 2024 at 04:46:24PM +0100, Daniel Vetter wrote:
> > > On Mon, 26 Feb 2024 at 16:39, Jacopo Mondi wrote:
> > > >
> > > > Add modifiers for the Raspberry Pi PiSP compressed formats.
> > > >
> > > > The compressed formats are documented at:
> > > > Documentation/userspace-api/media/v4l/pixfmt-pisp-comp-rggb.rst
> > > >
> > > > and in the PiSP datasheet:
> > > > https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > ---
> > > >
> > > > Background:
> > > > -----------
> > > >
> > > > The Raspberry Pi PiSP camera subsystem is on its way to upstream through the
> > > > Video4Linux2 subsystem:
> > > > https://patchwork.linuxtv.org/project/linux-media/list/?series=12310
> > > >
> > > > The PiSP camera system is composed by a "Front End" and a "Back End".
> > > > The FrontEnd part is a MIPI CSI-2 receiver that store frames to memory and
> > > > produce statistics, and the BackEnd is a memory-to-memory ISP that converts
> > > > images in a format usable by application.
> > > >
> > > > The "FrontEnd" is capable of encoding RAW Bayer images as received by the
> > > > image sensor in a 'compressed' format defined by Raspberry Pi and fully
> > > > documented in the PiSP manual:
> > > > https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> > > >
> > > > The compression scheme is documented in the in-review patch series for the BE
> > > > support at:
> > > > https://patchwork.linuxtv.org/project/linux-media/patch/20240223163012.300763-7-jacopo.mondi@ideasonboard.com/
> > > >
> > > > The "BackEnd" is capable of consuming images in the compressed format and
> > > > optionally user application might want to inspect those images for debugging
> > > > purposes.
> > > >
> > > > Why a DRM modifier
> > > > ------------------
> > > >
> > > > The PiSP support is entirely implemented in libcamera, with the support of an
> > > > hw-specific library called 'libpisp'.
> > > >
> > > > libcamera uses the fourcc codes defined by DRM to define its formats:
> > > > https://git.libcamera.org/libcamera/libcamera.git/tree/src/libcamera/formats.yaml
> > > >
> > > > And to define a new libcamera format for the Raspberry Pi compressed ones we
> > > > need to associate the above proposed modifiers with a RAW Bayer format
> > > > identifier.
> > > >
> > > > In example:
> > > >
> > > >   - RGGB16_PISP_COMP1:
> > > >       fourcc: DRM_FORMAT_SRGGB16
> >
> > An "interesting" issue here is that these formats currently live in
> > libcamera only, we haven't merged them in DRM "yet". This may be a
> > prerequisite ?
> >
> 
> Ah right! I didn't notice!
> 
> I think there are two issues at play here, one to be clarified by the
> DRM maintainers, the other more technically involved with the
> definition of the Bayer formats themselves.
> 
> - Does DRM want RAW Bayer formats to be listed here, as these are not
>   typically 'graphic' formats. What's the DRM maintainers opinion here ?

To give some context, the "historical mistake" I keep referring to
regarding V4L2 is the decision to combine the bit depth of raw formats
with the colour filter array (a.k.a. Bayer) pattern into a fourcc. I
think we should have defined raw pixel formats that only encode a bit
depth, and conveyed the CFA pattern out-of-band. This is especially the
case for media bus codes (formats on the buses between hardware
devices). The reasoning here is that most devices only care about the
bit depth and not the CFA pattern. Adding a new CFA pattern (for
instance for RGB+Ir) for a camera sensor would currently require adding
a new media bus code (easy), using it in the sensor driver (obvious),
and patching *every* CSI-2 receiver driver to pass it through. Userspace
would similarly need to grow support for the new format, even for
userspace code that only cares about capturing the raw data without
processing the colour components. Having raw pixel formats that don't
convey the CFA pattern would simplify all this (and it's something I'm
considering adding to the media bus codes).
part is lots of churn

> - The RAW Bayer pattern ordering: we have realized that the idea of
>   defining RAW Bayer formats by encoding the components ordering in
>   V4L2 was, in retrospective, a bad idea. The reason is that any
>   change in the Bayer order along the capture pipeline (usually due to
>   flip) requires reconfiguration of the formats along the whole
>   pipeline, requiring a start/stop of the capture operations.

That's also a reason, yes.

>   For this reason, we have multiple times discussed the idea of only
>   conveying the bit depth in the format definition and to communicate
>   the components ordering with other out-of-band mechanism, that will
>   likely be used to negotiate between the image sensor and the CSI-2
>   receiver.
> 
>   With DRM the ideal would be something like
> 
>         DRM_FORMAT_RAW8 | FORMAT_MODIFIER_SBGGR
>         DRM_FORMAT_RAW8 | FORMAT_MODIFIER_SGBRG
>         ...
> 
>         DRM_FORMAT_RAW10 | FORMAT_MODIFIER_SBGGR
>         DRM_FORMAT_RAW10 | FORMAT_MODIFIER_SGBRG
>         ...

When I said out-of-band, I meant really out of band from a format point
of view, so neither in the 4CC nor in the modifiers.

>  This however prevents to use additional modifiers to convey, in
>  example, packaging (ie MIPI CSI-2) or compressions (like done here
>  for PISP_COMP1) as, as far as I understand it, multiple modifiers
>  cannot be applied to a format.
> 
>  However, as I understand the argument of not repeating the V4L2
>  mistakes here, the DRM formats are aimed to be used mostly to
>  represent the formats of images as they get stored in application
>  buffers (at least from a libcamera perspective). The drawback of
>  having to reconfigure the capture pipeline due to a flip does not
>  really apply here, actually, knowing the components ordering in the
>  final image is very relevant for applications to know how to
>  interpret the image data.
> 
>  TL;DR I'm not too concerned about having to propagate the components
>  ordering along the pipeline, as the DRM formats are used only to
>  describe the image data as presented to the applications and not
>  along the pipeline as it happens for the V4L2 formats.
> 
> Opinions anyone ?
> 
> > > >       mod: PISP_FORMAT_MOD_COMPRESS_MODE1
> > > >   - GRBG16_PISP_COMP1:
> > > >       fourcc: DRM_FORMAT_SGRBG16
> > > >       mod: PISP_FORMAT_MOD_COMPRESS_MODE1
> > > >   - GBRG16_PISP_COMP1:
> > > >       fourcc: DRM_FORMAT_SGBRG16
> > > >       mod: PISP_FORMAT_MOD_COMPRESS_MODE1
> > > >   - BGGR16_PISP_COMP1:
> > > >       fourcc: DRM_FORMAT_SBGGR16
> > > >       mod: PISP_FORMAT_MOD_COMPRESS_MODE1
> > > >   - MONO_PISP_COMP1:
> > > >       fourcc: DRM_FORMAT_R16
> > > >       mod: PISP_FORMAT_MOD_COMPRESS_MODE1
> > > >
> > > > See
> > > > https://patchwork.libcamera.org/patch/19503/
> > > >
> > > > Would if be acceptable for DRM to include the above proposed modifiers for the
> > > > purpose of defining the above presented libcamera formats ? There will be no
> > > > graphic format associated with these modifiers as their purpose it not
> > > > displaying images but rather exchange them between the components of the
> > > > camera subsystem (and possibly be inspected by specialized test applications).
> > >
> > > Yeah I think libcamera using drm-fourcc formats and modifiers is
> > > absolutely ok, and has my ack in principle. And for these users we're
> > > ok with merging modifiers that the kernel doesn't use.
> > >
> > > I think it would be really good to formalize this by adding libcamera
> > > to the officially listed users in the "Open Source User Waiver"
> > > section in the drm_fourcc.h docs:
> > >
> > > https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#open-source-user-waiver
> >
> > The waiver states "the usual requirement for an upstream in-kernel or
> > open source userspace user does not apply". Strictly speaking, there is
> > an open-source userspace user with libcamera. It's only on the kernel
> > side that the new modifier my not get used.
> >
> > This being said, I'm fine clarifying the documentation, clarity is
> > always good.
> >
> > > You might want to convert that into a list, it could get a bit
> > > confusing. Then we can get that patch properly acked (by kernel and
> > > libcamera folks) to record the community consensus.
> > >
> > > For the rpi modifiers themselves: They need to be properly documented,
> > > least to exclude a screw-up like with the rpi modifiers we already
> > > have, which unfortunately encode the buffer height (instead of just
> > > the rounding algorithim to align the height to the right tile size) in
> > > the modifiers, which breaks assumptions everywhere. For details see
> > > https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/4529#note_2262057
> > >
> > > > ---
> > > >  include/uapi/drm/drm_fourcc.h | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > > > index 00db00083175..09b182a959ad 100644
> > > > --- a/include/uapi/drm/drm_fourcc.h
> > > > +++ b/include/uapi/drm/drm_fourcc.h
> > > > @@ -425,6 +425,7 @@ extern "C" {
> > > >  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
> > > >  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
> > > >  #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> > > > +#define DRM_FORMAT_MOD_VENDOR_RPI 0x0b
> > > >
> > > >  /* add more to the end as needed */
> > > >
> > > > @@ -1568,6 +1569,10 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
> > > >  #define AMD_FMT_MOD_CLEAR(field) \
> > > >         (~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
> > > >
> > > > +/* RPI (Raspberry Pi) modifiers */
> > > > +#define PISP_FORMAT_MOD_COMPRESS_MODE1 fourcc_mod_code(RPI, 1)
> > > > +#define PISP_FORMAT_MOD_COMPRESS_MODE2 fourcc_mod_code(RPI, 2)
> > > > +
> > > >  #if defined(__cplusplus)
> > > >  }
> > > >  #endif

-- 
Regards,

Laurent Pinchart
