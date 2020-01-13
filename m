Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C09139660
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 17:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C785589E15;
	Mon, 13 Jan 2020 16:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DD489E15
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 16:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1578933047;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=nhYfKTC/H5k1KKxSjXYCx13IWmpS8pNB1PW5albJ9eA=;
 b=rCHoUwsBGxIWaXCteC8PpcGms+xZReC2E01E0VYMpHe8MxuV26vX2tW8RemHKi2Z4D
 Jkv+Q01mm3abZfQnLaqiLzBCCJO4zP0DV0j6tdo4MON16Bz5mzMlcd2spF3O3PWk6oSD
 Z5jo26Zv+wSc3QmsnyhLGrMKY0HBs1ESSXwm+WKqkWMhTsC5PfQ+SjC8KhOeuKukSkmY
 3GLze9KbyrowKyzyKxY4zmZMAGgd3HMolgEDasDgGTNsJ969x47cesbv7jZlKHw0xCck
 fb+K1DFsq8t19K1mBFLZvEFmzgFZkMlZ2+a0wfg42mRzMlfOIPcrzXRutqbrI3g6RSnW
 az2A==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zH4phNhJA0AIphrNzqA=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.1.4 AUTH)
 with ESMTPSA id h048a6w0DGUkQLs
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 13 Jan 2020 17:30:46 +0100 (CET)
Date: Mon, 13 Jan 2020 17:30:39 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2] drm/modes: Apply video parameters with only reflect
 option
Message-ID: <20200113163039.GA50384@gerhold.net>
References: <20191216171017.173326-1-stephan@gerhold.net>
 <20191216172725.GZ1208@intel.com>
 <20191216180811.GB173588@gerhold.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191216180811.GB173588@gerhold.net>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Mon, Dec 16, 2019 at 07:08:12PM +0100, Stephan Gerhold wrote:
> On Mon, Dec 16, 2019 at 07:27:25PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Mon, Dec 16, 2019 at 06:10:17PM +0100, Stephan Gerhold wrote:
> > > At the moment, video mode parameters like video=3D540x960,reflect_x,
> > > (without rotation set) are not taken into account when applying the
> > > mode in drm_client_modeset.c.
> > =

> > A rotation value without exactly one rotation angle is illegal.
> > IMO the code should not generate a value like that in the first
> > place.
> > =


What do you think about Ville's comment?
Should we change the command line parser to generate ROTATE_0 when no
rotate option is specified? This would also require updating a few of
the test cases.

You added the code for parsing the rotation/reflection options,
so I thought I'd ask before I start working on this.

Thanks,
Stephan

> =

> You're right. I was thinking about this when creating this patch.
> But then I was not sure if "mode->rotation_reflection" is supposed to be
> a valid rotation value.The zero value is currently used to check
> if any rotation/reflection was specified at all:
> =

> [...]
> > > diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/d=
rm_client_modeset.c
> > > index 895b73f23079..cfebce4f19a5 100644
> > > --- a/drivers/gpu/drm/drm_client_modeset.c
> > > +++ b/drivers/gpu/drm/drm_client_modeset.c
> > > @@ -859,19 +859,23 @@ bool drm_client_rotation(struct drm_mode_set *m=
odeset, unsigned int *rotation)
> > >  	 */
> > >  	cmdline =3D &connector->cmdline_mode;
> > >  	if (cmdline->specified && cmdline->rotation_reflection) {
> =

> I can try to make your suggested change in the cmdline parsing code,
> but since this sounds like a larger change I would appreciate
> some other opinions first.
> =

> Thanks,
> Stephan
> =

> > > =

> > > -		unsigned int cmdline_rest, panel_rest;
> > > -		unsigned int cmdline_rot, panel_rot;
> > > -		unsigned int sum_rot, sum_rest;
> > > +		if (cmdline->rotation_reflection & DRM_MODE_ROTATE_MASK) {
> > > +			unsigned int cmdline_rest, panel_rest;
> > > +			unsigned int cmdline_rot, panel_rot;
> > > +			unsigned int sum_rot, sum_rest;
> > >  =

> > > -		panel_rot =3D ilog2(*rotation & DRM_MODE_ROTATE_MASK);
> > > -		cmdline_rot =3D ilog2(cmdline->rotation_reflection & DRM_MODE_ROTA=
TE_MASK);
> > > -		sum_rot =3D (panel_rot + cmdline_rot) % 4;
> > > +			panel_rot =3D ilog2(*rotation & DRM_MODE_ROTATE_MASK);
> > > +			cmdline_rot =3D ilog2(cmdline->rotation_reflection & DRM_MODE_ROT=
ATE_MASK);
> > > +			sum_rot =3D (panel_rot + cmdline_rot) % 4;
> > >  =

> > > -		panel_rest =3D *rotation & ~DRM_MODE_ROTATE_MASK;
> > > -		cmdline_rest =3D cmdline->rotation_reflection & ~DRM_MODE_ROTATE_M=
ASK;
> > > -		sum_rest =3D panel_rest ^ cmdline_rest;
> > > +			panel_rest =3D *rotation & ~DRM_MODE_ROTATE_MASK;
> > > +			cmdline_rest =3D cmdline->rotation_reflection & ~DRM_MODE_ROTATE_=
MASK;
> > > +			sum_rest =3D panel_rest ^ cmdline_rest;
> > >  =

> > > -		*rotation =3D (1 << sum_rot) | sum_rest;
> > > +			*rotation =3D (1 << sum_rot) | sum_rest;
> > > +		} else {
> > > +			*rotation ^=3D cmdline->rotation_reflection;
> > > +		}
> > >  	}
> > >  =

> > >  	/*
> > > @@ -879,7 +883,8 @@ bool drm_client_rotation(struct drm_mode_set *mod=
eset, unsigned int *rotation)
> > >  	 * depending on the hardware this may require the framebuffer
> > >  	 * to be in a specific tiling format.
> > >  	 */
> > > -	if ((*rotation & DRM_MODE_ROTATE_MASK) !=3D DRM_MODE_ROTATE_180 ||
> > > +	if (((*rotation & DRM_MODE_ROTATE_MASK) !=3D DRM_MODE_ROTATE_0 &&
> > > +	     (*rotation & DRM_MODE_ROTATE_MASK) !=3D DRM_MODE_ROTATE_180) ||
> > >  	    !plane->rotation_property)
> > >  		return false;
> > >  =

> > > -- =

> > > 2.24.1
> > > =

> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > =

> > -- =

> > Ville Syrj=E4l=E4
> > Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
