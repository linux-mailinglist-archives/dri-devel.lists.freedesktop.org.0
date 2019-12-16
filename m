Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DAA121419
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 19:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B8A6E859;
	Mon, 16 Dec 2019 18:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66996E859
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 18:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576519693;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=XCikyp4VezyyxNWDJKpyShwztCEMh0HWrjRy3JevmDE=;
 b=og22PhcPEREzpb2x+U+kYjkTXogT7ycoZbq3rOyRsVtGmUg5qymKG1HqapJY2kn2pN
 rRURjmfe/kxfh834LnEQYaKcUeoipjpzDnsNDoWm/EYzmZ1r6FKEedWasRZ4GB+P5ufT
 lGXi2XV6pAuDaqlenyOuX/dhGQBU4XVah3QCkSDaVCpdTd1YxL49JThpWB+0mvKBgZTt
 y/gVIZY1YTINMHjYvVWjLAMYw945EcwZY0bJRVmnaoEg1WGx0dYhzQhcBnlFz6V7p72W
 Fq/TXJz3EBJdotUQCPyeqXJkLFS4/lh5qY6+3NEFb61Wxy0YnIKNGY4OwMiZH4uBClDJ
 bxkw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266EZF6ORJDdfbYtbb1Kg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.0.7 AUTH)
 with ESMTPSA id N0b206vBGI8CP7A
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 16 Dec 2019 19:08:12 +0100 (CET)
Date: Mon, 16 Dec 2019 19:08:11 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2] drm/modes: Apply video parameters with only reflect
 option
Message-ID: <20191216180811.GB173588@gerhold.net>
References: <20191216171017.173326-1-stephan@gerhold.net>
 <20191216172725.GZ1208@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191216172725.GZ1208@intel.com>
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

On Mon, Dec 16, 2019 at 07:27:25PM +0200, Ville Syrj=E4l=E4 wrote:
> On Mon, Dec 16, 2019 at 06:10:17PM +0100, Stephan Gerhold wrote:
> > At the moment, video mode parameters like video=3D540x960,reflect_x,
> > (without rotation set) are not taken into account when applying the
> > mode in drm_client_modeset.c.
> =

> A rotation value without exactly one rotation angle is illegal.
> IMO the code should not generate a value like that in the first
> place.
> =


You're right. I was thinking about this when creating this patch.
But then I was not sure if "mode->rotation_reflection" is supposed to be
a valid rotation value.The zero value is currently used to check
if any rotation/reflection was specified at all:

[...]
> > diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm=
_client_modeset.c
> > index 895b73f23079..cfebce4f19a5 100644
> > --- a/drivers/gpu/drm/drm_client_modeset.c
> > +++ b/drivers/gpu/drm/drm_client_modeset.c
> > @@ -859,19 +859,23 @@ bool drm_client_rotation(struct drm_mode_set *mod=
eset, unsigned int *rotation)
> >  	 */
> >  	cmdline =3D &connector->cmdline_mode;
> >  	if (cmdline->specified && cmdline->rotation_reflection) {

I can try to make your suggested change in the cmdline parsing code,
but since this sounds like a larger change I would appreciate
some other opinions first.

Thanks,
Stephan

> > =

> > -		unsigned int cmdline_rest, panel_rest;
> > -		unsigned int cmdline_rot, panel_rot;
> > -		unsigned int sum_rot, sum_rest;
> > +		if (cmdline->rotation_reflection & DRM_MODE_ROTATE_MASK) {
> > +			unsigned int cmdline_rest, panel_rest;
> > +			unsigned int cmdline_rot, panel_rot;
> > +			unsigned int sum_rot, sum_rest;
> >  =

> > -		panel_rot =3D ilog2(*rotation & DRM_MODE_ROTATE_MASK);
> > -		cmdline_rot =3D ilog2(cmdline->rotation_reflection & DRM_MODE_ROTATE=
_MASK);
> > -		sum_rot =3D (panel_rot + cmdline_rot) % 4;
> > +			panel_rot =3D ilog2(*rotation & DRM_MODE_ROTATE_MASK);
> > +			cmdline_rot =3D ilog2(cmdline->rotation_reflection & DRM_MODE_ROTAT=
E_MASK);
> > +			sum_rot =3D (panel_rot + cmdline_rot) % 4;
> >  =

> > -		panel_rest =3D *rotation & ~DRM_MODE_ROTATE_MASK;
> > -		cmdline_rest =3D cmdline->rotation_reflection & ~DRM_MODE_ROTATE_MAS=
K;
> > -		sum_rest =3D panel_rest ^ cmdline_rest;
> > +			panel_rest =3D *rotation & ~DRM_MODE_ROTATE_MASK;
> > +			cmdline_rest =3D cmdline->rotation_reflection & ~DRM_MODE_ROTATE_MA=
SK;
> > +			sum_rest =3D panel_rest ^ cmdline_rest;
> >  =

> > -		*rotation =3D (1 << sum_rot) | sum_rest;
> > +			*rotation =3D (1 << sum_rot) | sum_rest;
> > +		} else {
> > +			*rotation ^=3D cmdline->rotation_reflection;
> > +		}
> >  	}
> >  =

> >  	/*
> > @@ -879,7 +883,8 @@ bool drm_client_rotation(struct drm_mode_set *modes=
et, unsigned int *rotation)
> >  	 * depending on the hardware this may require the framebuffer
> >  	 * to be in a specific tiling format.
> >  	 */
> > -	if ((*rotation & DRM_MODE_ROTATE_MASK) !=3D DRM_MODE_ROTATE_180 ||
> > +	if (((*rotation & DRM_MODE_ROTATE_MASK) !=3D DRM_MODE_ROTATE_0 &&
> > +	     (*rotation & DRM_MODE_ROTATE_MASK) !=3D DRM_MODE_ROTATE_180) ||
> >  	    !plane->rotation_property)
> >  		return false;
> >  =

> > -- =

> > 2.24.1
> > =

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =

> -- =

> Ville Syrj=E4l=E4
> Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
