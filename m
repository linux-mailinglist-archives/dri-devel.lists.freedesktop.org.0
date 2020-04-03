Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8665619D36B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 11:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BA66EB48;
	Fri,  3 Apr 2020 09:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D9C6EB48
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 09:22:40 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 94E113AD564
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 09:14:10 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5CA974000D;
 Fri,  3 Apr 2020 09:13:45 +0000 (UTC)
Date: Fri, 3 Apr 2020 11:13:44 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 2/3] drm: Add support for the LogiCVC display controller
Message-ID: <20200403091344.GA720146@aptenodytes>
References: <20191203150606.317062-1-paul.kocialkowski@bootlin.com>
 <20191203150606.317062-3-paul.kocialkowski@bootlin.com>
 <20200104192026.GA21210@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20200104192026.GA21210@ravnborg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============1121052428=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1121052428==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Sat 04 Jan 20, 20:20, Sam Ravnborg wrote:
> Good looking driver. Well structured in a number of relevant files.
> A few comments in the following.
> Some parts I fail to follow - due to my lack of DRM knowledge.
> So all in all - only trivial comments.

Thanks for the review and the friendly feedback!

> With these fixed you can add:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

I'll take most of your suggestions in for the next version and there's just=
 one
point where I disagree:

> > +struct logicvc_drm {
> > +	const struct logicvc_drm_caps *caps;
> > +	struct logicvc_drm_config config;
> > +	struct drm_device *drm;
> Modern drm drivers are expected to embed drm_device.
> See example in drm_drv.c

Well, I see lots of modern drivers that use drm_dev_alloc, including vc4 th=
at
I took as a reference.=20

My understanding is that embedding the struct is a recommendation but
drm_dev_alloc is still quite valid and that the choice is left open.
Quoting drm_drv.c:

 * It is recommended that drivers embed &struct drm_device into their own d=
evice
 * structure.
 *
 * Drivers that do not want to allocate their own device struct
 * embedding &struct drm_device can call drm_dev_alloc() instead.

In my case, I like the fact that drm_dev_alloc correctly wraps drm_dev_init
and drmm_add_final_kfree (and I'd rather not add & all around unless I'm
obliged to ;)

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl6G/kgACgkQ3cLmz3+f
v9G3sAgAgKq1ecptnIYD6N1lYm1B5XbgAqGTpKFC1sy6w6tNYtI8NkV15ikcY/Tj
j6XpWwEhri+sOme76KBKqfDOiDpDOAYAOKKOP4dV+x9WqlOqkFmuu/5sqkQNVB+E
kS/DqxfIHWBWGcWJT3hJWRMBm99/8V2IigSWX6oiIZc+EyHy/dwbIns63A6MVF/c
uhoZqBuOuakAZhV+r8KRNPJlOKLLjP4qEUFv5Ka5mh3+80Wy0Bz1f/H8n/bvllM6
kUNHIix5hsKEVKWEwC/L4Pv1t0QYEsuWcHDW5pf2i9s05AWLgrl8vIublkUH0i4W
D7/T/7LMAuS+MMAJGUFxf5/UJQ6+1g==
=s+Sz
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--

--===============1121052428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1121052428==--
