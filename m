Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D775B118502
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 11:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5AC6E88C;
	Tue, 10 Dec 2019 10:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 394 seconds by postgrey-1.36 at gabe;
 Tue, 10 Dec 2019 10:27:23 UTC
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D566E88C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 10:27:23 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D77912053B;
 Tue, 10 Dec 2019 10:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575973249;
 bh=PNLaBO+jTR6kU8TaNn6OF/VLsp5g0Rz8IDml0necoa4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=z7RbL05CNZF8o3FTRcv+wnoEPMYnn+UNrL93sEWUxTHCg1b3quzsUpuSQtdlPqvk/
 07p5+doRaBETVtFZrMwNfILrTxzM53GFyzlYVB6z+Qm0wwQmZlmHUBqFrgE5EMmRER
 s740FMR7m+lj/XN/TE2DAUT7e8CV9EDiwPI9ofJ4=
Date: Tue, 10 Dec 2019 11:20:46 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH] drm/modes: Support video parameters with only reflect
 option
Message-ID: <20191210102046.fu5s4hzwcdfnv5zz@gilmour.lan>
References: <20191209183254.211428-1-stephan@gerhold.net>
MIME-Version: 1.0
In-Reply-To: <20191209183254.211428-1-stephan@gerhold.net>
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
Content-Type: multipart/mixed; boundary="===============1456752075=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1456752075==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5iaubmaqofyoscp4"
Content-Disposition: inline


--5iaubmaqofyoscp4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Dec 09, 2019 at 07:32:54PM +0100, Stephan Gerhold wrote:
> At the moment, video mode parameters like video=540x960,reflect_x,
> (without rotation set) are silently ignored.
>
> One of the reasons for this is that the calculation that
> combines the panel_orientation with cmdline->rotation_reflection
> does not handle the case when cmdline->rotation_reflection does
> not have any rotation set.
> (i.e. cmdline->rotation_reflection & DRM_MODE_ROTATE_MASK == 0)
>
> Example:
>   *rotation = DRM_MODE_ROTATE_0 (no panel_orientation)
>   cmdline->rotation_reflection = DRM_MODE_REFLECT_X (video=MODE,reflect_x)
>
> The current code does:
>   panel_rot = ilog2(*rotation & DRM_MODE_ROTATE_MASK);
>   cmdline_rot = ilog2(cmdline->rotation_reflection & DRM_MODE_ROTATE_MASK);
>   sum_rot = (panel_rot + cmdline_rot) % 4;
>
> and therefore:
>   panel_rot = ilog2(DRM_MODE_ROTATE_0) = ilog2(1) = 0
>   cmdline_rot = ilog2(0) = -1
>   sum_rot = (0 + -1) % 4 = -1 % 4 = 3
>    ...
>   *rotation = DRM_MODE_ROTATE_270 | DRM_MODE_REFLECT_X
>
> So we incorrectly generate DRM_MODE_ROTATE_270 in this case.
> To prevent cmdline_rot from becoming -1, we need to treat
> the rotation as DRM_MODE_ROTATE_0.
>
> On the other hand, there is no need to go through that calculation
> at all if no rotation is set in rotation_reflection.
> A simple XOR is enough to combine the reflections.
>
> Finally, also allow DRM_MODE_ROTATE_0 in the if statement below.
> DRM_MODE_ROTATE_0 means "no rotation" and should therefore not
> require any special handling (e.g. specific tiling format).
>
> This makes video parameters with only reflect option work correctly.
>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Thanks for that commit message.

Can you also add a selftest to make sure we don't get a regression in
the future?

Thanks!
Maxime

--5iaubmaqofyoscp4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXe9xfgAKCRDj7w1vZxhR
xQ7RAP41WPp0IuSuUVs6kiKUQ1BN78eXklvJBJ82u6YRWGrgVwEAmiDlsLmmi3r/
rprGGJvle7qGAkwgoS7lf+v9TjCjGwk=
=nyxV
-----END PGP SIGNATURE-----

--5iaubmaqofyoscp4--

--===============1456752075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1456752075==--
