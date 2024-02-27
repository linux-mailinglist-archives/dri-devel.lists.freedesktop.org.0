Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B10B869168
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 14:10:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB2510E077;
	Tue, 27 Feb 2024 13:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p7317QAg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7BC10E456
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 13:10:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E7588D4;
 Tue, 27 Feb 2024 14:09:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1709039391;
 bh=v49QjxY4U9/AmYff5q8VBtbEYH5broHyCUF/VUdaeH0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p7317QAglfL4Zadd0nGP1KqIrIgVHHV4FMebEAI/P7Hld+8s81wldN1pU+0ivXoxH
 L5NTb9GyghuvTGduDvyt5b9o9iZiSikch+fS3sfW4L8L8Jv9Izp3clHh94swOfWUmp
 I6Zzk5VJF8M1Pe+3bip3Hd4SzOh+QsvTTT4zFBI8=
Date: Tue, 27 Feb 2024 15:10:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, libcamera-devel@lists.libcamera.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Subject: Re: [RFC] drm/fourcc: Add RPI modifiers
Message-ID: <20240227131006.GB5863@pendragon.ideasonboard.com>
References: <20240226153854.99471-1-jacopo.mondi@ideasonboard.com>
 <CAKMK7uE2CBuGsJUYDT-L8x1Tbjb-PiHUjro8-hDpxLvBWycgLw@mail.gmail.com>
 <473ei7jyjevynhb7roinhdaj2hnmsog6owiognlyp5fpfc63pa@mdn73c5gu46r>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <473ei7jyjevynhb7roinhdaj2hnmsog6owiognlyp5fpfc63pa@mdn73c5gu46r>
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

On Mon, Feb 26, 2024 at 05:24:41PM +0100, Jacopo Mondi wrote:
> On Mon, Feb 26, 2024 at 04:46:24PM +0100, Daniel Vetter wrote:
> > On Mon, 26 Feb 2024 at 16:39, Jacopo Mondi wrote:
> > >
> > > Add modifiers for the Raspberry Pi PiSP compressed formats.
> > >
> > > The compressed formats are documented at:
> > > Documentation/userspace-api/media/v4l/pixfmt-pisp-comp-rggb.rst
> > >
> > > and in the PiSP datasheet:
> > > https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > ---
> > >
> > > Background:
> > > -----------
> > >
> > > The Raspberry Pi PiSP camera subsystem is on its way to upstream through the
> > > Video4Linux2 subsystem:
> > > https://patchwork.linuxtv.org/project/linux-media/list/?series=12310
> > >
> > > The PiSP camera system is composed by a "Front End" and a "Back End".
> > > The FrontEnd part is a MIPI CSI-2 receiver that store frames to memory and
> > > produce statistics, and the BackEnd is a memory-to-memory ISP that converts
> > > images in a format usable by application.
> > >
> > > The "FrontEnd" is capable of encoding RAW Bayer images as received by the
> > > image sensor in a 'compressed' format defined by Raspberry Pi and fully
> > > documented in the PiSP manual:
> > > https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> > >
> > > The compression scheme is documented in the in-review patch series for the BE
> > > support at:
> > > https://patchwork.linuxtv.org/project/linux-media/patch/20240223163012.300763-7-jacopo.mondi@ideasonboard.com/
> > >
> > > The "BackEnd" is capable of consuming images in the compressed format and
> > > optionally user application might want to inspect those images for debugging
> > > purposes.
> > >
> > > Why a DRM modifier
> > > ------------------
> > >
> > > The PiSP support is entirely implemented in libcamera, with the support of an
> > > hw-specific library called 'libpisp'.
> > >
> > > libcamera uses the fourcc codes defined by DRM to define its formats:
> > > https://git.libcamera.org/libcamera/libcamera.git/tree/src/libcamera/formats.yaml
> > >
> > > And to define a new libcamera format for the Raspberry Pi compressed ones we
> > > need to associate the above proposed modifiers with a RAW Bayer format
> > > identifier.
> > >
> > > In example:
> > >
> > >   - RGGB16_PISP_COMP1:
> > >       fourcc: DRM_FORMAT_SRGGB16
> > >       mod: PISP_FORMAT_MOD_COMPRESS_MODE1
> > >   - GRBG16_PISP_COMP1:
> > >       fourcc: DRM_FORMAT_SGRBG16
> > >       mod: PISP_FORMAT_MOD_COMPRESS_MODE1
> > >   - GBRG16_PISP_COMP1:
> > >       fourcc: DRM_FORMAT_SGBRG16
> > >       mod: PISP_FORMAT_MOD_COMPRESS_MODE1
> > >   - BGGR16_PISP_COMP1:
> > >       fourcc: DRM_FORMAT_SBGGR16
> > >       mod: PISP_FORMAT_MOD_COMPRESS_MODE1
> > >   - MONO_PISP_COMP1:
> > >       fourcc: DRM_FORMAT_R16
> > >       mod: PISP_FORMAT_MOD_COMPRESS_MODE1
> > >
> > > See
> > > https://patchwork.libcamera.org/patch/19503/
> > >
> > > Would if be acceptable for DRM to include the above proposed modifiers for the
> > > purpose of defining the above presented libcamera formats ? There will be no
> > > graphic format associated with these modifiers as their purpose it not
> > > displaying images but rather exchange them between the components of the
> > > camera subsystem (and possibly be inspected by specialized test applications).
> >
> > Yeah I think libcamera using drm-fourcc formats and modifiers is
> > absolutely ok, and has my ack in principle. And for these users we're
> > ok with merging modifiers that the kernel doesn't use.
> 
> Great!
> 
> > I think it would be really good to formalize this by adding libcamera
> > to the officially listed users in the "Open Source User Waiver"
> > section in the drm_fourcc.h docs:
> >
> > https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#open-source-user-waiver
> >
> > You might want to convert that into a list, it could get a bit
> > confusing. Then we can get that patch properly acked (by kernel and
> > libcamera folks) to record the community consensus.
> 
> I see your point, but I wonder if libcamera actually need to be part
> of this list; we want in-kernel upstream driver and open-source

For the kernel side we'll use V4L2, so the DRM modifier won't have an
in-kernel user.

On the userspace side, yes, there will be an open-source user with
libcamera.

> userspace components. We allow binary 3A modules to be loaded by the
> library, but I'm not sure they will ever need to modify the DRM 4cc list.
> 
> Anyway, with other libcamera people ack, I can certainly do so!
> 
> > For the rpi modifiers themselves: They need to be properly documented,
> > least to exclude a screw-up like with the rpi modifiers we already
> > have, which unfortunately encode the buffer height (instead of just
> > the rounding algorithim to align the height to the right tile size) in
> > the modifiers, which breaks assumptions everywhere. For details see
> > https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/4529#note_2262057
> 
> I see. The formats are fully documented in the above linked datasheet,
> and I've provided (with the help of RPi engineers, as I don't
> understand the compression algorithm part :) a shorter description as
> part of the V4L2 patch series that upstreams the BE driver
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/20240223163012.300763-7-jacopo.mondi@ideasonboard.com/
> 
> The only indication about the buffer's layout I see is
> 
>   Each scanline is padded to a multiple of 8 pixels wide, and each block of 8
>   horizontally-contiguous pixels is coded using 8 bytes.
> 
> While the rest of the text describes the compression algorithm which
> (afaiu) doesn't affect the buffer geometry.
> 
> Would you be ok with me replicating the above description (or maybe
> just reference the V4L2 documentation ?)
> 
> > > ---
> > >  include/uapi/drm/drm_fourcc.h | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > > index 00db00083175..09b182a959ad 100644
> > > --- a/include/uapi/drm/drm_fourcc.h
> > > +++ b/include/uapi/drm/drm_fourcc.h
> > > @@ -425,6 +425,7 @@ extern "C" {
> > >  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
> > >  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
> > >  #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> > > +#define DRM_FORMAT_MOD_VENDOR_RPI 0x0b
> > >
> > >  /* add more to the end as needed */
> > >
> > > @@ -1568,6 +1569,10 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
> > >  #define AMD_FMT_MOD_CLEAR(field) \
> > >         (~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
> > >
> > > +/* RPI (Raspberry Pi) modifiers */
> > > +#define PISP_FORMAT_MOD_COMPRESS_MODE1 fourcc_mod_code(RPI, 1)
> > > +#define PISP_FORMAT_MOD_COMPRESS_MODE2 fourcc_mod_code(RPI, 2)
> > > +
> > >  #if defined(__cplusplus)
> > >  }
> > >  #endif

-- 
Regards,

Laurent Pinchart
