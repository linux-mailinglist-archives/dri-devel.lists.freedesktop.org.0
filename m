Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 083FE1A159A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 21:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7D36E8E3;
	Tue,  7 Apr 2020 19:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF006E8E3;
 Tue,  7 Apr 2020 19:10:54 +0000 (UTC)
IronPort-SDR: C8NysLQ+MvlL1N+I2jEJWsymWQX3rRZWF+bDi89d2uVuI722XvPBdtI/LUap8Kc0rF8m3ch95o
 xI/VtqL7bBpw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2020 12:10:53 -0700
IronPort-SDR: D3O1PvDsZC5EGJpJFjd4pipL2TpzjK+T0rYnl/rXTG6cLE8R1KzdG1wJ21z7pBQYa+fHQ8kIiL
 gAk2vs+aobWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,356,1580803200"; d="scan'208";a="240050259"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 07 Apr 2020 12:10:51 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 07 Apr 2020 22:10:50 +0300
Date: Tue, 7 Apr 2020 22:10:50 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 10/17] drm: Shrink mode->private_flags
Message-ID: <20200407191050.GP6112@intel.com>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
 <20200403204008.14864-11-ville.syrjala@linux.intel.com>
 <20200407185205.GJ6356@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200407185205.GJ6356@ravnborg.org>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 07, 2020 at 08:52:05PM +0200, Sam Ravnborg wrote:
> On Fri, Apr 03, 2020 at 11:40:01PM +0300, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > gma500 needs 4 bits (to store a pixel multiplier) in the
> > mode->private_flags, i915 currently has three bits defined.
> > No one else uses this. Reduce the size to u8.
> > =

> > Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> I see no point in this patch.
> I saw your comemnt about pahole. But you could move that patch
> after you nuke private_flags and you end up with the same result.
> This just confuse if one dive into the commit history

I thought I had actual numbers in the pahole patch, which would have
been invalidated by moving this. But looks like I didn't even have those
numers there (must have been in the previous cover letter). So yeah,
I guess I'll just squash this with the removal patch.

> =

> 	Sam
> =

> > ---
> >  include/drm/drm_modes.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> > index 917527eb8067..95c23f86ae0c 100644
> > --- a/include/drm/drm_modes.h
> > +++ b/include/drm/drm_modes.h
> > @@ -378,7 +378,7 @@ struct drm_display_mode {
> >  	 * by atomic drivers since they can store any additional data by
> >  	 * subclassing state structures.
> >  	 */
> > -	int private_flags;
> > +	u8 private_flags;
> >  =

> >  	/**
> >  	 * @picture_aspect_ratio:
> > -- =

> > 2.24.1
> > =

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
