Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DB593225D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 11:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0108610E5EA;
	Tue, 16 Jul 2024 09:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rz5yZsSo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B530A10E5EA
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 09:01:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1464B60DBA;
 Tue, 16 Jul 2024 09:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB90C116B1;
 Tue, 16 Jul 2024 09:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721120517;
 bh=F+YCwjkZVjwBDog1E0Et4wkpCHfn1C21IDFsj19zXTk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rz5yZsSoArlI9m1+qMvcglX5SQPx/xJTXRnaTPZdv/CaooEQAQzHSbs1GXKmodHbw
 oNFtkKra3xpS+ut7E3XczBBXn8ue6bWvee+UVBjOrEyhUl79bMg/ZOQvcPGOoVGCvE
 /OQGwjtWPJSXJBy+rQrLQRfkBoRM6Xv7hvtV9RFIGJXxJ0Icb0O+210KPt8GsapRZ3
 wWkR52uv+Q5OqNBPxWnfLqDnnTyl4ufOMSsK94DEm9ZrMdIJWU4DVX4P/LuPj6fbO4
 f/a1/kLWMEUXQOdJQny6sPmTjEg9wGl3mfas4c8qb12XGa6I365kg9ArzM1mxPhiEV
 /dT1nl4jWQYbw==
Date: Tue, 16 Jul 2024 11:01:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch, 
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/7] drm/probe-helper: Optionally report single connected
 output per CRTC
Message-ID: <20240716-dexterous-pristine-leech-8ca3f2@houat>
References: <20240715093936.793552-1-tzimmermann@suse.de>
 <20240715093936.793552-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="fz3jbrb52wv4362i"
Content-Disposition: inline
In-Reply-To: <20240715093936.793552-3-tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fz3jbrb52wv4362i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 15, 2024 at 11:38:58AM GMT, Thomas Zimmermann wrote:
> For CRTCs with multiple outputs (i.e., encoders plus connectors),
> only report at most a single connected output to userspace. Make
> this configurable via CONFIG_DRM_REPORT_SINGLE_CONNECTED_CRTC_OUTPUT.
>=20
> Having multiple connected outputs on the same CRTC complicates
> display-mode and format selection, so most userspace does not
> support this. This is mostly not a problem in practice, as modern
> display hardware provides a separate CRTC for each output.

Do they?

At least the RaspberryPi has multiple connectors on a single CRTC, and
for multiple CRTCs.

My understanding is that it's definitely expected, and any decent
user-space should expect it.

Did you have any bug with this?

And if it was the case, we wouldn't support cloning at all. I couldn't
really find how cloning works exactly, but my understanding was that
it's the difference between drm_encoder.possible_crtcs and
possible_clones: possible_crtcs lists the CRTCs it can be connected to,
and possible_clones the other encoders that can run with in parallel.

> On old hardware or hardware with BMCs, a single CRTC often drives
> multiple displays. Only reporting one of them as connected makes
> the hardware compatible with common userspace.
>=20
> Add the field prioritized_connectors to struct drm_connector. The
> bitmask signals which other connectors have priority. Also provide
> the helper drm_probe_helper_prioritize_connectors() that sets
> default priorities for a given set of connectors. Calling the
> helper should be enough to set up the functionality for most drivers.
>=20
> With the prioritization bits in place, update connector-status
> detection to test against prioritized conenctors. So when the probe
> helpers detect a connector as connected, test against the prioritized
> connectors. If any is also connected, set the connector status to
> disconnected.
>=20
> Please note that this functionality is a workaround for limitations
> in userspace. If your compositor supports multiple outputs per CRTC,
> CONFIG_DRM_REPORT_SINGLE_CONNECTED_CRTC_OUTPUT should be disabled.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

The whole "is it actually needed" discussion aside, I'm not sure it's a
good idea to use a config option for that. Chances are distros will
either enable it or disable it depending on what they/their customers
workload will typically look like, and it won't make the kernel or
compositor's job any easier.

Could we use a client capability for that maybe?

Maxime

--fz3jbrb52wv4362i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZpY2/gAKCRAnX84Zoj2+
dttnAYCXfBROdzWOzt9Bcx1leUzovURsQnD7kt8zF44Cx6qCl9vZCGbobT+65tkb
ijLqXhIBfArQVCHIHrN4C0NbBOsfM8LmA0Pg+fngycY47GkgN829dR8Ua6J6buJx
BF6WpAf8Sg==
=gBYd
-----END PGP SIGNATURE-----

--fz3jbrb52wv4362i--
