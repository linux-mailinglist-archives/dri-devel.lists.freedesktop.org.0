Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B12A031EC04
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 17:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B1B6EA3A;
	Thu, 18 Feb 2021 16:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4C76EA3A;
 Thu, 18 Feb 2021 16:10:19 +0000 (UTC)
IronPort-SDR: bXdwMT6cf4++Hm+KgOJobO7Ve3Bt6qC3Y4sBM/OmZzFLu14OUXkUDBOXfANGZdEgq5Lc6MYP0z
 /RvlVhtlEXdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="268396553"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="268396553"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 08:10:18 -0800
IronPort-SDR: IxeQOOqDAPE94dTukHPpEnzyyv0XNFLLRW4Ds1OiT/5YHHp7d6xwNrVWhHb+G73dqKrTVNkWNI
 IQwZ+/w+d4wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="439863945"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 18 Feb 2021 08:10:15 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 18 Feb 2021 18:10:15 +0200
Date: Thu, 18 Feb 2021 18:10:15 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/vblank: Do not store a new vblank timestamp in
 drm_vblank_restore()
Message-ID: <YC6RZ5xZu1AQsA4x@intel.com>
References: <20210204020400.29628-1-ville.syrjala@linux.intel.com>
 <20210218160305.16711-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210218160305.16711-1-ville.syrjala@linux.intel.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 18, 2021 at 06:03:05PM +0200, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> drm_vblank_restore() exists because certain power saving states
> can clobber the hardware frame counter. The way it does this is
> by guesstimating how many frames were missed purely based on
> the difference between the last stored timestamp vs. a newly
> sampled timestamp.
> =

> If we should call this function before a full frame has
> elapsed since we sampled the last timestamp we would end up
> with a possibly slightly different timestamp value for the
> same frame. Currently we will happily overwrite the already
> stored timestamp for the frame with the new value. This
> could cause userspace to observe two different timestamps
> for the same frame (and the timestamp could even go
> backwards depending on how much error we introduce when
> correcting the timestamp based on the scanout position).
> =

> To avoid that let's not update the stored timestamp at all,
> and instead we just fix up the last recorded hw vblank counter
> value such that the already stored timestamp/seq number will
> match. Thus the next time a vblank irq happens it will calculate
> the correct diff between the current and stored hw vblank counter
> values.
> =

> Sidenote: Another possible idea that came to mind would be to
> do this correction only if the power really was removed since
> the last time we sampled the hw frame counter. But to do that
> we would need a robust way to detect when it has occurred. Some
> possibilities could involve some kind of hardare power well
> transition counter, or potentially we could store a magic value
> in a scratch register that lives in the same power well. But
> I'm not sure either of those exist, so would need an actual
> investigation to find out. All of that is very hardware specific
> of course, so would have to be done in the driver code.

Forgot to mention that I wasn't able to test this with PSR
since HSW+PSR1 is bork, but I did test it a bit w/o PSR
by artificially adding arbitrary offsets to the reported
hw frame counter value. The behaviour seemed sane enough
at least.

> =

> Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_vblank.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 2bd989688eae..3417e1ac7918 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1478,6 +1478,7 @@ static void drm_vblank_restore(struct drm_device *d=
ev, unsigned int pipe)
>  	u64 diff_ns;
>  	u32 cur_vblank, diff =3D 1;
>  	int count =3D DRM_TIMESTAMP_MAXRETRIES;
> +	u32 max_vblank_count =3D drm_max_vblank_count(dev, pipe);
>  =

>  	if (drm_WARN_ON(dev, pipe >=3D dev->num_crtcs))
>  		return;
> @@ -1504,7 +1505,7 @@ static void drm_vblank_restore(struct drm_device *d=
ev, unsigned int pipe)
>  	drm_dbg_vbl(dev,
>  		    "missed %d vblanks in %lld ns, frame duration=3D%d ns, hw_diff=3D%=
d\n",
>  		    diff, diff_ns, framedur_ns, cur_vblank - vblank->last);
> -	store_vblank(dev, pipe, diff, t_vblank, cur_vblank);
> +	vblank->last =3D (cur_vblank - diff) & max_vblank_count;
>  }
>  =

>  /**
> -- =

> 2.26.2

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
