Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A51164DE015
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 18:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B5610E069;
	Fri, 18 Mar 2022 17:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA28710E069;
 Fri, 18 Mar 2022 17:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647625217; x=1679161217;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EWn5lMaLcdvcFqiDrUg5Hh9VvvtL+Sc7kBiXfIysrsE=;
 b=kbGdWp9miY+KptRe7Z6Qz3YaE5fS2zNQTbVyqOtjTRSjtr9ZTMJpYP4A
 Lqc0E1/Y2iheri3zMf5PVbKRmFgoe5sQ/lTyUJ7Fp4Sv02+ukF58jB09D
 oMTDxYxLRUqRGvw+SaSA/GJljyKlUeiBbMu3wrWMWZk9SYADOHNfUa/A3
 J+pK9JQ9TgD1QK4Abnn6OuQRopiRY7Jstue+HCRGO0pkd1ee9XvH0qjd2
 7b+1bj+/rWNGAjPI/PFrA+n91UyqCJX1iBkPTRmsD+JZ9RYUqaDR7WrO1
 Kamugd8cr+f+1VPB/NyMFpXNwe9O/f55lRVMuIFgSYEZ5MUaar4KE9xoh Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="282000021"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="282000021"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 10:39:49 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="558561195"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 10:39:47 -0700
Date: Fri, 18 Mar 2022 19:39:43 +0200
From: Imre Deak <imre.deak@intel.com>
To: "Chery, Nanley G" <nanley.g.chery@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 15/19] drm/i915/dg2: Add DG2 unified
 compression
Message-ID: <20220318173943.GA2622954@ideak-desk.fi.intel.com>
References: <20220201104132.3050-1-ramalingam.c@intel.com>
 <20220201104132.3050-16-ramalingam.c@intel.com>
 <CAJDL4uKokNLKhx1Yd_gnxyqto+bcg+=efLZFLVxqp-D7aQW0oQ@mail.gmail.com>
 <326a4099-f7d9-8adf-f371-d8ab0532256e@gmail.com>
 <fd88996f283648f8b4eca3f3844d6e8d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd88996f283648f8b4eca3f3844d6e8d@intel.com>
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
Cc: Nanley Chery <nanleychery@gmail.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 05:15:15PM +0000, Chery, Nanley G wrote:
> > >> [...]
> > >> --- a/include/uapi/drm/drm_fourcc.h
> > >> +++ b/include/uapi/drm/drm_fourcc.h
> > >> @@ -583,6 +583,28 @@ extern "C" {
> > >>    */
> > >>   #define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 9)
> > >>
> > >> +/*
> > >> + * Intel color control surfaces (CCS) for DG2 render compression.
> > >> + *
> > >> + * DG2 uses a new compression format for render compression. The general
> > >> + * layout is the same as I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
> > >> + * but a new hashing/compression algorithm is used, so a fresh modifier must
> > >> + * be associated with buffers of this type. Render compression uses 128 byte
> > >> + * compression blocks.
> > >
> > > I think I've seen a way to configure the compression block size on TGL
> > > at least. I can't find the spec text for that at the moment though...
> > > Could we omit these mentions?
> > 
> > Not sure why general possibility of changing compression block size is relevant?
> > All hw features can be changed but this defines how this modifier is being
> > implemented.
> 
> I was concerned about compatibility between the different modes, but I've
> looked into the restrictions here and don't see any problems with this.
> 
> > Say you take I915_FORMAT_MOD_4_TILED_DG2_RC_CCS framebuffer including
> > control surface and copy it out, then come back and restore framebuffer with
> > same information. It is expected to be valid?
>
> > /Juha-Pekka
> > 
> > >> + */
> > >> +#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS fourcc_mod_code(INTEL, 10)
> > >> +
> > >
> > > How about something like:
> > >
> > > The main surface is Tile 4 and at plane index 0. The CCS plane is
> > > hidden from userspace. The main surface pitch is required to be a
> > > multiple of four Tile 4 widths. The CCS is configured with the render
> > > compression format associated with the main surface format.
> 
> Actually, let's omit the last sentence. CCS has always been affected
> by the main surface format, so I don't think there's a need to mention it
> specifically for the DG2 modifier.
>
> We do need to mention the 4-tile-wide pitch requirement though.

Agreed, the DG2 layout of planes and the tile format used - both
different wrt. the GEN12_RC_CCS format - should be described here.

> -Nanley
>  
> > > ....I think the CCS is technically accessible via the blitter engine,
> > > so the part about the plane being "hidden" may need some tweaking.

Maybe outside of the GEM object? Capturing all the above would you be ok
with the following?:

Intel color control surfaces (CCS) for DG2 render compression.

The main surface is Tile 4 and at plane index 0. The CCS data is stored
outside of the GEM object in a reserved memory area dedicated for the
storage of the CCS data from all GEM objects. The main surface pitch is
required to be a multiple of four Tile 4 widths. 


Intel color control surfaces (CCS) for DG2 media compression.

The main surface is Tile 4 and at plane index 0. For semi-planar formats
like NV12, the UV plane is Tile 4 at plane index 1. The CCS data both for
the main and semi-planar UV planes are stored outside of the GEM object
in a reserved memory area dedicated for the storage of the CCS data from
all GEM objects. The main surface pitch is required to be a multiple of
four Tile 4 widths. 

> > > -Nanley
> > >
> > >> +/*
> > >> + * Intel color control surfaces (CCS) for DG2 media compression.
> > >> + *
> > >> + * DG2 uses a new compression format for media compression. The
> > >> +general
> > >> + * layout is the same as I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
> > >> + * but a new hashing/compression algorithm is used, so a fresh
> > >> +modifier must
> > >> + * be associated with buffers of this type. Media compression uses
> > >> +256 byte
> > >> + * compression blocks.
> > >> + */
> > >> +#define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS
> > fourcc_mod_code(INTEL,
> > >> +11)
> > >> +
> > >>   /*
> > >>    * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
> > >>    *
> > >> --
> > >> 2.20.1
> > >>
> 
