Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DDE2DB079
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 16:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1880D892B6;
	Tue, 15 Dec 2020 15:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545E6892AA;
 Tue, 15 Dec 2020 15:50:38 +0000 (UTC)
IronPort-SDR: mcLALo+DnsJbDK4JFVF6D61yonQWQprrY+/MtuqPdnxPXm9FXqIsL431eYZ6obL1es+YABS6cn
 M6pCrYJHQIQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="154703391"
X-IronPort-AV: E=Sophos;i="5.78,421,1599548400"; d="scan'208";a="154703391"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 07:50:38 -0800
IronPort-SDR: fzodTFNAaK2GO/0xhGrWFtf0kXzL6fl+snDTp44YGI91IqhZxmLV26W5r7+94W5vDJ3k174RZC
 92wc3VPPm7yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,421,1599548400"; d="scan'208";a="390767237"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 15 Dec 2020 07:50:35 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 15 Dec 2020 17:50:34 +0200
Date: Tue, 15 Dec 2020 17:50:34 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [PATCH v6 1/5] drm: Add function to convert rect in 16.16 fixed
 format to regular format
Message-ID: <X9jbSgoMDsC904/M@intel.com>
References: <20201214174912.174065-1-jose.souza@intel.com>
 <X9jLt5p62uJ38cE7@intel.com>
 <734d417a49858fd11d418a25831e76c8d6b566c1.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <734d417a49858fd11d418a25831e76c8d6b566c1.camel@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Mun,
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 15, 2020 at 03:43:00PM +0000, Souza, Jose wrote:
> On Tue, 2020-12-15 at 16:44 +0200, Ville Syrj=E4l=E4 wrote:
> > On Mon, Dec 14, 2020 at 09:49:08AM -0800, Jos=E9 Roberto de Souza wrote:
> > > Much more clear to read one function call than four lines doing this
> > > conversion.
> > > =

> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> > > Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> > > ---
> > > =A0drivers/gpu/drm/drm_rect.c | 15 +++++++++++++++
> > > =A0include/drm/drm_rect.h     |  2 ++
> > > =A02 files changed, 17 insertions(+)
> > > =

> > > diff --git a/drivers/gpu/drm/drm_rect.c b/drivers/gpu/drm/drm_rect.c
> > > index 0460e874896e..24345704b353 100644
> > > --- a/drivers/gpu/drm/drm_rect.c
> > > +++ b/drivers/gpu/drm/drm_rect.c
> > > @@ -373,3 +373,18 @@ void drm_rect_rotate_inv(struct drm_rect *r,
> > > =A0	}
> > > =A0}
> > > =A0EXPORT_SYMBOL(drm_rect_rotate_inv);
> > > +
> > > +/**
> > > + * drm_rect_convert_16_16_to_regular - Convert a rect in 16.16 fixed=
 point form
> > > + * to regular form.
> > > + * @in: rect in 16.16 fixed point form
> > > + * @out: rect to be stored the converted value
> > > + */
> > > +void drm_rect_convert_16_16_to_regular(struct drm_rect *in, struct d=
rm_rect *out)
> > > +{
> > > +	out->x1 =3D in->x1 >> 16;
> > > +	out->y1 =3D in->y1 >> 16;
> > > +	out->x2 =3D in->x2 >> 16;
> > > +	out->y2 =3D in->y2 >> 16;
> > > +}
> > =

> > That's not the same as what we do in most places. We truncate
> > the width/height, not x2/y2. Doing it on x2/y2 may increase
> > the width/height.
> > =

> > So I suggest something more like:
> > =

> > static inline void drm_rect_fp_to_int(struct drm_rect *r)
> > {
> > 	drm_rect_init(r, r->x1 >> 16, r->y1 >> 16,
> > 		      drm_rect_width(r) >> 16,
> > 		      drm_rect_height(r) >> 16);
> > }
> > =

> > to match the current way of doing things.
> =

> Okay, but most use cases takes drm_plane_state.src and converts and sets =
it in another rect, so will modify it to have two parameters.

Would seem a bit more generic by having the caller make the copy
if needed. But I guess not big deal either way.

At least make it follow the correct argument order as laid out
by memcpy() ;) (+const for the input argument ofc).

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
