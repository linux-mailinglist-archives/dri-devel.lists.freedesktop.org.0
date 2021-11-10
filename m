Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBF444C060
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 12:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59416EB2B;
	Wed, 10 Nov 2021 11:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDC26EB2B;
 Wed, 10 Nov 2021 11:55:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="256345449"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="256345449"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 03:55:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="582689846"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by FMSMGA003.fm.intel.com with SMTP; 10 Nov 2021 03:55:09 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Nov 2021 13:55:06 +0200
Date: Wed, 10 Nov 2021 13:55:06 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [RFC v2 02/22] drm: Add Enhanced Gamma and color lut range
 attributes
Message-ID: <YYuzGhHZiMQ79h8l@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-3-uma.shankar@intel.com>
 <d67a9761-91b4-3432-dd55-f85bb0657b68@amd.com>
 <20211104103827.2cf48bb7@eldfell>
 <5780b3b6-5b12-df66-03be-5f1918d28989@amd.com>
 <20211108115427.5c3f162e@eldfell>
 <8f189780-707d-0dda-778f-1a42b74ff4ae@amd.com>
 <YYrv6Mlp0K+9pZ+A@intel.com> <20211110104924.08c3b744@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211110104924.08c3b744@eldfell>
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
Cc: Shashank.Sharma@amd.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, sebastian@sebastianwick.net,
 Uma Shankar <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 10:49:24AM +0200, Pekka Paalanen wrote:
> On Wed, 10 Nov 2021 00:02:16 +0200
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > On Tue, Nov 09, 2021 at 03:47:58PM -0500, Harry Wentland wrote:
> > > On 2021-11-08 04:54, Pekka Paalanen wrote:  
> > > > On Thu, 4 Nov 2021 12:27:56 -0400
> > > > Harry Wentland <harry.wentland@amd.com> wrote:
> > > >   
> > > >> On 2021-11-04 04:38, Pekka Paalanen wrote:  
> > > >>> On Wed, 3 Nov 2021 11:08:13 -0400
> > > >>> Harry Wentland <harry.wentland@amd.com> wrote:
> > > >>>     
> > > >>>> On 2021-09-06 17:38, Uma Shankar wrote:    
> > > >>>>> Existing LUT precision structure is having only 16 bit
> > > >>>>> precision. This is not enough for upcoming enhanced hardwares
> > > >>>>> and advance usecases like HDR processing. Hence added a new
> > > >>>>> structure with 32 bit precision values.
> > > >>>>>
> > > >>>>> This also defines a new structure to define color lut ranges,
> > > >>>>> along with related macro definitions and enums. This will help
> > > >>>>> describe multi segmented lut ranges in the hardware.
> > > >>>>>
> > > >>>>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > > >>>>> ---
> > > >>>>>  include/uapi/drm/drm_mode.h | 58 +++++++++++++++++++++++++++++++++++++
> > > >>>>>  1 file changed, 58 insertions(+)
> 
> ...
> 
> > > >> If the framebuffer is not in FP16 the question then becomes how
> > > >> the integer pixel values relate to LUT addressing.  
> > > > 
> > > > Traditionally, and in any API I've seen (GL, Vulkan), a usual mapping
> > > > is to match minimum unsigned integer value to 0.0, and unsigned maximum
> > > > integer value to 1.0. This is how things work on the cable too, right?
> > > > (Also taking full vs. limited range video signal into account. And
> > > > conversion to cable-YUV if that happens.)
> > > > 
> > > > If you want integer format FB values to map to something else, then you
> > > > have to tag the FB with that range information, somehow. New UAPI.
> > > >   
> > > 
> > > On the cable we send integer values, not floating point. AMD HW uses
> > > floating point internally, though, and the PWL API defines floating
> > > point entries, so on some level we need to be clear what the floating
> > > point entries mean. Either we document that to be [0.0, 1.0] or we
> > > have some UAPI to define it. I'm leaning toward the latter but have
> > > to think about it some more.  
> > 
> > As for Intel hw if you have an integer pixel value of 0xff... (with
> > however many bits you have with a specific pixel format) it will get
> > extended to 0.fff... (to whatever precision the pipe has internally).
> > So if we go by that a fixed point 1.0 value in the proposed
> > drm_color_lut_range would be considered just outside the gamut. And
> > pretty sure fp16 input of 1.0 should also result in a 0.fff... internal
> > value as well [1]. I think that definition pretty much matches how GL
> > UNORM<->float conversion works as well.
> 
> Does it work that way in GL though?
> 
> I've always thought that with GL_UNSIGNED_BYTE, 0xff maps to 1.0, not
> 255.0/256.0.
> 
> Taking a random spec: OpenGL ES 2.0.25
> 
> Section 2.1.2 Data Conversions says:
> 
> 	Normalized unsigned integers represent numbers in the range
> 	[0, 1]. The conversion from a normalized unsigned integer c to
> 	the corresponding floating-point f is defined as
> 	f = c / (2^b - 1)
> 
> Note how the divisor has -1.

That seems to match what I said, or at least tried to say (~0 <-> 1.0 in
float). drm_color_lut_range being fixed point would follow the ~0 side of
that. Or at least that interpretation would very easily map to our hw.

-- 
Ville Syrjälä
Intel
