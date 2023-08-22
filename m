Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DF1784473
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 16:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFD110E384;
	Tue, 22 Aug 2023 14:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6356B10E380
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 14:35:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A466063513;
 Tue, 22 Aug 2023 14:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2466C433C8;
 Tue, 22 Aug 2023 14:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692714958;
 bh=le831erP2b4h/R+WeU1ellkn4/Bp6Wll7cO9bPqLnXM=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=JjvqcWLFaFAoFLcNk6IPTR5mCO+oGSvCthsf5eaSr7ZVcAaZJjWVAwjlK4PNZt9YU
 xfSPGFcZ86DiDOaYODOPyQrPUD+oYX4q5mgfCbXRO4q8dSsu+WOOD08fOBu1ohsx35
 aou3yrBfxFw/E+BskpBHy45TrioqwTYUvF11homWtzsM3l60olmljwSHLbsIQXe5CL
 rly/DlPHUKUykX5Y2yQl5smDW3fvH3MAvcJcKdzADA721wTsM1sI8FnjTktZrcUHIX
 dyGgmnBSeTxmc3E565/Sxj5tO8Vc3rjblGvcKTGfMx9UwUBoskG+YWuTphqP3czQ98
 dRRTJGYJKLdWQ==
Date: Tue, 22 Aug 2023 16:35:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Emma Anholt <emma@anholt.net>, 
 Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RFC 00/13] drm/connector: Create HDMI Connector
 infrastructure
Message-ID: <sh3f7nuks7cww43ajz2iwrgzkxbqpk7752iu4pj4vtwaiv76x4@itnf6f2mnbgn>
References: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
 <ZOTDKHxn2bOg+Xmg@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s4lnbs6jvqvssmma"
Content-Disposition: inline
In-Reply-To: <ZOTDKHxn2bOg+Xmg@phenom.ffwll.local>
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


--s4lnbs6jvqvssmma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 22, 2023 at 04:16:08PM +0200, Daniel Vetter wrote:
> On Mon, Aug 14, 2023 at 03:56:12PM +0200, Maxime Ripard wrote:
> > Here's a series that creates a subclass of drm_connector specifically
> > targeted at HDMI controllers.
> >=20
> > The idea behind this series came from a recent discussion on IRC during
> > which we discussed infoframes generation of i915 vs everything else.=20
> >=20
> > Infoframes generation code still requires some decent boilerplate, with
> > each driver doing some variation of it.
> >=20
> > In parallel, while working on vc4, we ended up converting a lot of i915
> > logic (mostly around format / bpc selection, and scrambler setup) to
> > apply on top of a driver that relies only on helpers.
> >=20
> > While currently sitting in the vc4 driver, none of that logic actually
> > relies on any driver or hardware-specific behaviour.
> >=20
> > The only missing piec to make it shareable are a bunch of extra
> > variables stored in a state (current bpc, format, RGB range selection,
> > etc.).
> >=20
> > Thus, I decided to create some generic subclass of drm_connector to
> > address HDMI connectors, with a bunch of helpers that will take care of
> > all the "HDMI Spec" related code. Scrambler setup is missing at the
> > moment but can easily be plugged in.
> >=20
> > Last week, Hans Verkuil also expressed interest in retrieving the
> > infoframes generated from userspace to create an infoframe-decode tool.
> > This series thus leverages the infoframe generation code to expose it
> > through debugfs.
> >=20
> > This entire series is only build-tested at the moment. Let me know what
> > you think,
>
> I think the idea overall makes sense, we we probably need it to roll out
> actual hdmi support to all the hdmi drivers we have. But there's the
> eternal issue of "C sucks at multiple inheritance".
>=20
> Which means if you have a driver that subclasses drm_connector already for
> it's driver needs it defacto cannot, or only under some serious pains, use
> this.

That's what vc4 is doing, and it went fine I think? it was mostly a
matter of subclassing drm_hdmi_connector instead of drm_connector, and
adjusting the various pointers and accessors here and there.

It does create a fairly big diffstat, but nothing too painful.

> Which is kinda why in practice we tend to not subclass, but stuff
> subclass fields into a name sub-structure. So essentially struct
> drm_connector.hdmi and struct drm_connector_state.hdmi instead of
> drm_hdmi_connector and drm_hdmi_connector_state. The helper functions to
> set it all up would all still be the same roughly. It's less typesafe but
> I think the gain in practical use (like you could make i915 use the
> helpers probably, which with this approach here is practically
> impossible).

Ack.

> The only other nit is that we probably want to put some of the hdmi
> properties into struct drm_mode_config because there's no reason to have
> per-connector valid values.

What property would you want to move?

> Also, it might be really good if you can find a co-conspirator who also
> wants to use this in their driver, then with some i915 extracting we'd
> have three, which should ensure the helper api is solid.

I can convert sunxi (old) HDMI driver if needed. I'm not sure how
helpful it would be since it doesn't support bpc > 8, but it could be a
nice showcase still for "simple" HDMI controllers.

Maxime

--s4lnbs6jvqvssmma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZOTHywAKCRDj7w1vZxhR
xQyZAQCy1klQDVl1VrpljAbWWce0q3jdUvFd36DTtxArJSMz2AEAreIIVONHXkfa
KYsAmvsZKcNViqWYVqDGSepMLP0vHAo=
=yR/w
-----END PGP SIGNATURE-----

--s4lnbs6jvqvssmma--
