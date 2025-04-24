Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB4EA9AF05
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 15:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3427B10E7FC;
	Thu, 24 Apr 2025 13:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Zino6yh8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AEF10E80F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 13:31:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6907A16A;
 Thu, 24 Apr 2025 15:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1745501491;
 bh=j4HHkfoeVCtpyCSshAP7OJNjKGOINaxa5T0UF2MD/18=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zino6yh8UGFEfRlTFn6KaNVqTd+UJD7sHFp3YyMH7NIRD1iyTT/g6/ePsV/iDsD3x
 c7JKc6GU0lfzHeavWgF7oILZ00flWuceQ5wrngwNmC+x8u2exyPUR16zUjjqUMYOzS
 WSK+5a4a9snxp4Amvq3kQgel/Xu4+KAhZMLJ7iOU=
Date: Thu, 24 Apr 2025 16:31:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Robert Mader <robert.mader@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Christopher Obbard <chris.obbard@collabora.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] drm: drm_fourcc: add 10/12bit software decoder YCbCr
 formats
Message-ID: <20250424133130.GD18085@pendragon.ideasonboard.com>
References: <20250407191314.500601-1-robert.mader@collabora.com>
 <dde3c5c3-4e23-4962-a165-38fa6b004ef1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dde3c5c3-4e23-4962-a165-38fa6b004ef1@collabora.com>
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

On Thu, Apr 24, 2025 at 02:53:18PM +0200, Robert Mader wrote:
> Chris, Javier, Laurent - sorry for the noise, but given you reviewed 
> changes in the respective files before, maybe you can help me moving 
> this forward? I'd be very happy for any feedback to get this landed, 
> thanks! :)

I don't have spare bandwidth at the moment, sorry :-( One comment below
though.

Tomi, can you check if there's any overlap with the formats you're
adding for the Xilinx FPGA drivers ?

> On 07.04.25 21:13, Robert Mader wrote:
> > This adds FOURCCs for 10/12bit YCbCr formats used by software decoders
> > like ffmpeg, dav1d and libvpx. The intended use-case is buffer sharing
> > between SW-decoders and GPUs by allocating buffers with udmabuf or
> > dma-heaps, avoiding unnecessary copies or format conversions.
> >
> > Unlike formats typically used by hardware decoders these formats
> > use a LSB alignment. In order to allow fast implementations in GL
> > and Vulkan the padding must contain only zeros, so the float
> > representation can calculated by simple multiplicating with 2^6=64
> > or 2^4=16.

This needs to be documented somewhere.

> >
> > WIP MRs for Mesa, Vulkan and Gstreamer can be found at:
> >   - https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34303
> >   - https://github.com/rmader/Vulkan-Docs/commits/ycbcr-16bit-lsb-formats/
> >   - https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8540
> >
> > The values where inspired by the corresponding VA_FOURCC_I010, however
> > suggestions are very welcome.
> >
> > Signed-off-by: Robert Mader <robert.mader@collabora.com>
> > ---
> >   drivers/gpu/drm/drm_fourcc.c  | 18 ++++++++++++++++++
> >   include/uapi/drm/drm_fourcc.h | 20 ++++++++++++++++++++
> >   2 files changed, 38 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> > index 3a94ca211f9c..917f77703645 100644
> > --- a/drivers/gpu/drm/drm_fourcc.c
> > +++ b/drivers/gpu/drm/drm_fourcc.c
> > @@ -346,6 +346,24 @@ const struct drm_format_info *__drm_format_info(u32 format)
> >   		{ .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
> >   		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
> >   		  .hsub = 2, .vsub = 2, .is_yuv = true},
> > +		{ .format = DRM_FORMAT_I010,            .depth = 0,  .num_planes = 3,
> > +		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
> > +		  .hsub = 2, .vsub = 2, .is_yuv = true},
> > +		{ .format = DRM_FORMAT_I210,            .depth = 0,  .num_planes = 3,
> > +		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
> > +		  .hsub = 2, .vsub = 1, .is_yuv = true},
> > +		{ .format = DRM_FORMAT_I410,            .depth = 0,  .num_planes = 3,
> > +		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
> > +		  .hsub = 1, .vsub = 1, .is_yuv = true},
> > +		{ .format = DRM_FORMAT_I012,            .depth = 0,  .num_planes = 3,
> > +		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
> > +		  .hsub = 2, .vsub = 2, .is_yuv = true},
> > +		{ .format = DRM_FORMAT_I212,            .depth = 0,  .num_planes = 3,
> > +		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
> > +		  .hsub = 2, .vsub = 1, .is_yuv = true},
> > +		{ .format = DRM_FORMAT_I412,            .depth = 0,  .num_planes = 3,
> > +		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
> > +		  .hsub = 1, .vsub = 1, .is_yuv = true},
> >   	};
> >   
> >   	unsigned int i;
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > index e41a3cec6a9e..f22c80031595 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -397,6 +397,26 @@ extern "C" {
> >   #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
> >   #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
> >   
> > +/*
> > + * 3 plane YCbCr LSB aligned
> > + * index 0 = Y plane, [15:0] x:Y [6:10] little endian
> > + * index 1 = Cr plane, [15:0] x:Cr [6:10] little endian
> > + * index 2 = Cb plane, [15:0] x:Cb [6:10] little endian
> > + */
> > +#define DRM_FORMAT_I010	fourcc_code('I', '0', '1', '0') /* 2x2 subsampled Cb (1) and Cr (2) planes 10 bits per channel */
> > +#define DRM_FORMAT_I210	fourcc_code('I', '2', '1', '0') /* 2x1 subsampled Cb (1) and Cr (2) planes 10 bits per channel */
> > +#define DRM_FORMAT_I410	fourcc_code('I', '4', '1', '0') /* non-subsampled Cb (1) and Cr (2) planes 10 bits per channel */
> > +
> > +/*
> > + * 3 plane YCbCr LSB aligned
> > + * index 0 = Y plane, [15:0] x:Y [4:12] little endian
> > + * index 1 = Cr plane, [15:0] x:Cr [4:12] little endian
> > + * index 2 = Cb plane, [15:0] x:Cb [4:12] little endian
> > + */
> > +#define DRM_FORMAT_I012	fourcc_code('I', '0', '1', '2') /* 2x2 subsampled Cb (1) and Cr (2) planes 12 bits per channel */
> > +#define DRM_FORMAT_I212	fourcc_code('I', '2', '1', '2') /* 2x1 subsampled Cb (1) and Cr (2) planes 12 bits per channel */
> > +#define DRM_FORMAT_I412	fourcc_code('I', '4', '1', '2') /* non-subsampled Cb (1) and Cr (2) planes 12 bits per channel */
> > +
> >   
> >   /*
> >    * Format Modifiers:

-- 
Regards,

Laurent Pinchart
