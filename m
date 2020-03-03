Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF5F177E8F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 19:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D496A89E7B;
	Tue,  3 Mar 2020 18:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4228D89E7B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 18:42:23 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Mar 2020 10:42:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; d="scan'208";a="229027787"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 03 Mar 2020 10:42:19 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 03 Mar 2020 20:42:18 +0200
Date: Tue, 3 Mar 2020 20:42:18 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] drm/fourcc: Add bayer formats and modifiers
Message-ID: <20200303184218.GB13686@intel.com>
References: <20200228163135.524882-1-niklas.soderlund@ragnatech.se>
 <20200303102627.2b726d83@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303102627.2b726d83@eldfell.localdomain>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 libcamera-devel@lists.libcamera.org, dri-devel@lists.freedesktop.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 03, 2020 at 10:26:27AM +0200, Pekka Paalanen wrote:
> On Fri, 28 Feb 2020 17:31:35 +0100
> Niklas S=F6derlund <niklas.soderlund@ragnatech.se> wrote:
> =

> > Bayer formats are used with cameras and contain green, red and blue
> > components, with alternating lines of red and green, and blue and green
> > pixels in different orders. For each block of 2x2 pixels there is one
> > pixel with a red filter, two with a green filter, and one with a blue
> > filter. The filters can be arranged in different patterns.
> > =

> > Add DRM fourcc formats to describe the most common Bayer formats. Also
> > add a modifiers to describe the custom packing layouts used by the Intel
> > IPU3 and in the MIPI (Mobile Industry Processor Interface) CSI-2
> > specification.
> > =

> > Signed-off-by: Niklas S=F6derlund <niklas.soderlund@ragnatech.se>
> > ---
> >  include/uapi/drm/drm_fourcc.h | 95 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> =

> Hi,
> =

> here are some by-stander comments.
> =

> > =

> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourc=
c.h
> > index 8bc0b31597d80737..561d5a08ffd16b69 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -286,6 +286,62 @@ extern "C" {
> >  #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsa=
mpled Cr (1) and Cb (2) planes */
> >  =

> >  =

> > +/*
> > + * Bayer formats
> > + *
> > + * Bayer formats contain green, red and blue components, with alternat=
ing lines
> > + * of red and green, and blue and green pixels in different orders. Fo=
r each
> > + * block of 2x2 pixels there is one pixel with a red filter, two with =
a green
> > + * filter, and one with a blue filter. The filters can be arranged in =
different
> > + * patterns.
> > + *
> > + * For example, RGGB:
> > + *	row0: RGRGRGRG...
> > + *	row1: GBGBGBGB...

Whare is row2?

> > + *	row3: RGRGRGRG...
> > + *	row4: GBGBGBGB...
> > + *	...
> > + *
> > + * Vendors have different methods to pack the sampling formats to incr=
ease data
> > + * density. For this reason the fourcc only describes pixel sample siz=
e and the
> > + * filter pattern for each block of 2x2 pixels. A modifier is needed to
> > + * describe the memory layout.
> > + *
> > + * In addition to vendor modifiers for memory layout DRM_FORMAT_MOD_LI=
NEAR may
> > + * be used to describe a layout where all samples are placed consecuti=
vely in
> > + * memory. If the sample does not fit inside a single byte, the sample=
 storage
> > + * is extended to the minimum number of (little endian) bytes that can=
 hold the
> > + * sample and any unused most-significant bits are defined as padding.
> =

> "Minimum number of (little endian) bytes" is probably not quite right,
> because you could end up with a 3-byte word for e.g. 18-bit samples,
> and for those I don't think endianess is even a defined concept.

In my book little-endian =3D=3D "little end comes first". Nothing in that
definition that says the number of bytes per unit has to a power of two.

I guess maybe another way to put it would be to say "each sample is
stored as lsb aligned little endian value in minimum number of bytes
required". But some visual representation could help more I guess.
We try do that for the normal formats.

Though I don't really know what "samples are placed consecutively in
memory" is trying to say here. Eg. for the row0-row4 example above
would we store this as RGRGRG...GBGBGB... or something more like
RGGBRGGBRGGB..., or something else?


Side note:
Since people seem a bit confused by our use of "little endian" in
general I was thinking we should maybe update all the definitions to
be even more explicit. Something alogned the lines of:
"pixel [31:30 A][29:20 R][19:10 G][9:0   B]
 byte  [    3    ][    2    ][   1   ][ 0 ]"

Though the mismathed proportions make it rather ugly.

Maybe we should even show the bit numbers for each component along
with everything else:
"component [1  A  0][9  R  4..3  R  0][9  G  6..5  G  0][9 B 8..7 B 0]
 pixel     [31 A 30][29 R 24..23 R 20][19 G 16..15 G 10][9 B 8..7 B 0]
 byte      [       3        ][       2        ][      1       ][  0  ]"

Could stretch the bytes to uniform size I guess. But still not entirely
readable :(

Anyways, ideas for an actually good way to docuement formats welcome...

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
