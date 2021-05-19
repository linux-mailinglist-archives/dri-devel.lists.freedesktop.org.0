Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7DF388F7B
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 15:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA506EDBE;
	Wed, 19 May 2021 13:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522E16EDB5;
 Wed, 19 May 2021 13:49:42 +0000 (UTC)
IronPort-SDR: wNAyyVg3W8t/hTvwbIIh9P9XW/ZsjzTPwgVmqQolc6TotRt/a7B4UyCMhN96sKE75ih7eJoQIu
 Gy2/pn8fkM5w==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="264894876"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="264894876"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 06:49:40 -0700
IronPort-SDR: UNEGgVbRVYJ05Y31/m10gll8TMclz+JnQzgfeEGArV+giMYQ2QmzIgZGZrbl4ny8GeUwfzcsB0
 I5CpgtNk31JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="405596999"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 19 May 2021 06:49:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 May 2021 16:49:35 +0300
Date: Wed, 19 May 2021 16:49:35 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: New uAPI for color management proposal and feedback request
Message-ID: <YKUXbwkUIwvO/OqK@intel.com>
References: <8c0d7ad8-7ade-bf8a-0414-cc795fbb6aa2@tuxedocomputers.com>
 <YJvSUCCPvWz7y/r7@intel.com> <20210519123405.4d3218a7@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210519123405.4d3218a7@eldfell>
X-Patchwork-Hint: comment
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Werner Sembach <wse@tuxedocomputers.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 12:34:05PM +0300, Pekka Paalanen wrote:
> On Wed, 12 May 2021 16:04:16 +0300
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > On Wed, May 12, 2021 at 02:06:56PM +0200, Werner Sembach wrote:
> > > Hello,
> > > 
> > > In addition to the existing "max bpc", and "Broadcast RGB/output_csc" drm properties I propose 4 new properties:
> > > "preferred pixel encoding", "active color depth", "active color range", and "active pixel encoding"
> > > 
> > > 
> > > Motivation:
> > > 
> > > Current monitors have a variety pixel encodings available: RGB, YCbCr 4:4:4, YCbCr 4:2:2, YCbCr 4:2:0.
> > > 
> > > In addition they might be full or limited RGB range and the monitors accept different bit depths.
> > > 
> > > Currently the kernel driver for AMD and Intel GPUs automatically configure the color settings automatically with little
> > > to no influence of the user. However there are several real world scenarios where the user might disagree with the
> > > default chosen by the drivers and wants to set his or her own preference.
> > > 
> > > Some examples:
> > > 
> > > 1. While RGB and YCbCr 4:4:4 in theory carry the same amount of color information, some screens might look better on one
> > > than the other because of bad internal conversion. The driver currently however has a fixed default that is chosen if
> > > available (RGB for Intel and YCbCr 4:4:4 for AMD). The only way to change this currently is by editing and overloading
> > > the edid reported by the monitor to the kernel.
> > > 
> > > 2. RGB and YCbCr 4:4:4 need a higher port clock then YCbCr 4:2:0. Some hardware might report that it supports the higher
> > > port clock, but because of bad shielding on the PC, the cable, or the monitor the screen cuts out every few seconds when
> > > RGB or YCbCr 4:4:4 encoding is used, while YCbCr 4:2:0 might just work fine without changing hardware. The drivers
> > > currently however always default to the "best available" option even if it might be broken.
> > > 
> > > 3. Some screens natively only supporting 8-bit color, simulate 10-Bit color by rapidly switching between 2 adjacent
> > > colors. They advertise themselves to the kernel as 10-bit monitors but the user might not like the "fake" 10-bit effect
> > > and prefer running at the native 8-bit per color.
> > > 
> > > 4. Some screens are falsely classified as full RGB range wile they actually use limited RGB range. This results in
> > > washed out colors in dark and bright scenes. A user override can be helpful to manually fix this issue when it occurs.
> > > 
> > > There already exist several requests, discussion, and patches regarding the thematic:
> > > 
> > > - https://gitlab.freedesktop.org/drm/amd/-/issues/476
> > > 
> > > - https://gitlab.freedesktop.org/drm/amd/-/issues/1548
> > > 
> > > - https://lkml.org/lkml/2021/5/7/695
> > > 
> > > - https://lkml.org/lkml/2021/5/11/416
> > > 
> 
> ...
> 
> > > Adoption:
> > > 
> > > A KDE dev wants to implement the settings in the KDE settings GUI:
> > > https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_912370
> > > 
> > > Tuxedo Computers (my employer) wants to implement the settings desktop environment agnostic in Tuxedo Control Center. I
> > > will start work on this in parallel to implementing the new kernel code.  
> > 
> > I suspect everyone would be happier to accept new uapi if we had
> > multiple compositors signed up to implement it.
> 
> I think having Weston support for these would be good, but for now it
> won't be much of an UI: just weston.ini to set, and the log to see what
> happened.
> 
> However, knowing what happened is going to be important for color
> calibration auditing:
> https://gitlab.freedesktop.org/wayland/weston/-/issues/467
> 
> Yes, please, very much for read-only properties for the feedback part.
> Properties that both userspace and kernel will write are hard to deal
> with in general.
> 
> Btw. "max bpc" I can kind of guess that conversion from framebuffer
> format to the wire bpc happens automatically and only as the final
> step,

Well, there could be dithering and whatnot also involved. So it's
not super well specified atm either.

> but "Broadcast RGB" is more complicated: is the output from the
> abstract pixel pipeline sent as-is and "Broadcast RGB" is just another
> inforframe bit to the monitor, or does "Broadcast RGB" setting actually
> change what happens in the pixel pipeline *and* set infoframe bits?

It does indeed compress the actual pixel data. There was once a patch
porposed to introduce a new enum value that only sets the infoframe and
thus would allow userspace to pass through already limited range data.
Shouldn't be hard to resurrect that if needed.

> 
> My vague recollection is that framebuffer was always assumed to be in
> full range, and then if "Broadcast RGB" was set to limited range, the
> driver would mangle the pixel pipeline to convert from full to limited
> range. This means that it would be impossible to have limited range
> data in a framebuffer, or there might be a double-conversion by
> userspace programming a LUT for limited->full and then the driver
> adding full->limited. I'm also confused how full/limited works when
> framebuffer is in RGB/YCbCr and the monitor wire format is in RGB/YCbCr
> and there may be RGB->YCbCR or YCbCR->RGB conversions going on - or
> maybe even FB YCbCR -> RGB -> DEGAMMA -> CTM -> GAMMA -> YCbCR.
> 
> I wish someone drew a picture of the KMS abstract pixel pipeline with
> all the existing KMS properties in it. :-)

Here's an ugly one for i915:

    (input RGB vs. YCbCr?)
[FB] -> [YCbCr?] -> [YCbCr->RGB conversion     ] -> [plane blending] -> ...
      |             [YCbCr color range/encoding] |
      \ [RGB?] ----------------------------------/

                                           (output RGB limited vs. RGB full vs. YCbCr?)
... -> [DEGAMMA_LUT] -> [CTM] -> [GAMMA_LUT] -> [YCbCr?] -> [RGB->YCbCr conversion      ] -> [to port]
                                              |             [always BT.709/limited range]
                                              \ [RGB?] -> ...

... -> [RGB passthrough             ] -> [to port]
     | [Broadcast RGB=full or       ]
     | [Broadcast RGB=auto + IT mode]
     |
     \ [RGB full->limited conversion] -> [to port]
       [Broadcast RGB=limited or    ]
       [Broadcast RGB=auto + CE mode]

I guess having something like that in the docs would be nice. Not sure
if there's a way to make something that looks decent for html/etc.

-- 
Ville Syrjälä
Intel
