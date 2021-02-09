Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 919C63152F8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 16:41:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83216EB6E;
	Tue,  9 Feb 2021 15:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3D66EB6B;
 Tue,  9 Feb 2021 15:40:59 +0000 (UTC)
IronPort-SDR: e1VQHsphkaq9n7WaTCYTsMYD5fWMAdiXpqnD3NBBZ26YxyJ0BgrPZM77DedHPZ/mByVdiemK7a
 wJhEeDZktfsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="178389567"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; d="scan'208";a="178389567"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 07:40:58 -0800
IronPort-SDR: a1JBpr0wiA+fMOaAOukbxzhgKKsN++I9MUUuxIMXnReyirJuAc7LSw9JvnJnO0VAi9orI4H/XC
 21WRva5CdBDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; d="scan'208";a="375000200"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 09 Feb 2021 07:40:55 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 09 Feb 2021 17:40:54 +0200
Date: Tue, 9 Feb 2021 17:40:54 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/vblank: Avoid storing a timestamp for the same frame
 twice
Message-ID: <YCKtBiWR1yEww9YM@intel.com>
References: <20210204020400.29628-1-ville.syrjala@linux.intel.com>
 <YCJe+dVzmREc25Jw@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCJe+dVzmREc25Jw@phenom.ffwll.local>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 11:07:53AM +0100, Daniel Vetter wrote:
> On Thu, Feb 04, 2021 at 04:04:00AM +0200, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > drm_vblank_restore() exists because certain power saving states
> > can clobber the hardware frame counter. The way it does this is
> > by guesstimating how many frames were missed purely based on
> > the difference between the last stored timestamp vs. a newly
> > sampled timestamp.
> > =

> > If we should call this function before a full frame has
> > elapsed since we sampled the last timestamp we would end up
> > with a possibly slightly different timestamp value for the
> > same frame. Currently we will happily overwrite the already
> > stored timestamp for the frame with the new value. This
> > could cause userspace to observe two different timestamps
> > for the same frame (and the timestamp could even go
> > backwards depending on how much error we introduce when
> > correcting the timestamp based on the scanout position).
> > =

> > To avoid that let's not update the stored timestamp unless we're
> > also incrementing the sequence counter. We do still want to update
> > vblank->last with the freshly sampled hw frame counter value so
> > that subsequent vblank irqs/queries can actually use the hw frame
> > counter to determine how many frames have elapsed.
> > =

> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Ok, top-posting because lol I got confused. I mixed up the guesstimation
> work we do for when we don't have a vblank counter with the precise vblank
> timestamp stuff.
> =

> I think it'd still be good to maybe lock down/document a bit better the
> requirements for drm_crtc_vblank_restore, but I convinced myself now that
> your patch looks correct.
> =

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Ta.

Though I wonder if we should just do something like this instead:
-       store_vblank(dev, pipe, diff, t_vblank, cur_vblank);
+       vblank->last =3D (cur_vblank - diff) & max_vblank_count;

to make it entirely obvious that this exists only to fix up
the stored hw counter value?

Would also avoid the problem the original patch tries to fix
because we'd simply never store a new timestamp here.

> =

> > ---
> >  drivers/gpu/drm/drm_vblank.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > =

> > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> > index 893165eeddf3..e127a7db2088 100644
> > --- a/drivers/gpu/drm/drm_vblank.c
> > +++ b/drivers/gpu/drm/drm_vblank.c
> > @@ -176,6 +176,17 @@ static void store_vblank(struct drm_device *dev, u=
nsigned int pipe,
> >  =

> >  	vblank->last =3D last;
> >  =

> > +	/*
> > +	 * drm_vblank_restore() wants to always update
> > +	 * vblank->last since we can't trust the frame counter
> > +	 * across power saving states. But we don't want to alter
> > +	 * the stored timestamp for the same frame number since
> > +	 * that would cause userspace to potentially observe two
> > +	 * different timestamps for the same frame.
> > +	 */
> > +	if (vblank_count_inc =3D=3D 0)
> > +		return;
> > +
> >  	write_seqlock(&vblank->seqlock);
> >  	vblank->time =3D t_vblank;
> >  	atomic64_add(vblank_count_inc, &vblank->count);
> > -- =

> > 2.26.2
> > =

> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
