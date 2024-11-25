Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F31DC9D8626
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 14:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A47210E653;
	Mon, 25 Nov 2024 13:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R71Y1yIO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AD110E653
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 13:17:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 851E1A416D6;
 Mon, 25 Nov 2024 13:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9985C4CED2;
 Mon, 25 Nov 2024 13:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732540638;
 bh=zkCVAh3qF1e/ci4mZJUp08N5YP3IsGiCplj7ECGrh48=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R71Y1yIOo8bWZV9ezmXMuYGPSG4hibePix6y4dy3oB3x+0SMT5AAHV0sj8/byMaEm
 ptpDJDJOVlIoEXeizUGwfbovOXGGcCsl0YZEufAnQ/wGsxw26H9V3yD9T3sng8t3o0
 vhzRsQmu3oW8RriGqpfcEZ27DbBiVCAliPcJzZ8g1fvp91iA3NKd7rZFRgwvjMnLLw
 KujMSguv63bq6ixD/tsmKN+/j781q4X5ygRg0GrDlaLzyPlVjJQ461lbW2p19PdPXd
 HyFqhwXxUFq70n2+oPgtB8QnKmkFEgG0FUbQgr5ccqtkED7e1l0OCYuQg/DU1UUTB6
 BwxxsuJn/nKeg==
Date: Mon, 25 Nov 2024 14:17:15 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/2] drm/bridge: tc358767: Improve DPI output pixel
 clock accuracy
Message-ID: <20241125-nondescript-grouse-of-joy-c22dbf@houat>
References: <20241112020737.335297-1-marex@denx.de>
 <20241112020737.335297-2-marex@denx.de>
 <bqmcs6dtcidr6lr6r74t5vm72kjantanaq26dfipkqtsiqhacd@ngdoaqim42ck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="a2cyxsbbj7t2iazf"
Content-Disposition: inline
In-Reply-To: <bqmcs6dtcidr6lr6r74t5vm72kjantanaq26dfipkqtsiqhacd@ngdoaqim42ck>
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


--a2cyxsbbj7t2iazf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] drm/bridge: tc358767: Improve DPI output pixel
 clock accuracy
MIME-Version: 1.0

On Fri, Nov 22, 2024 at 03:32:57PM +0200, Dmitry Baryshkov wrote:
> On Tue, Nov 12, 2024 at 03:05:37AM +0100, Marek Vasut wrote:
> > The Pixel PLL is not very capable and may come up with wildly inaccurate
> > clock. Since DPI panels are often tolerant to slightly higher pixel clo=
ck
> > without being operated outside of specification, calculate two Pixel PLL
> > from either mode clock or display_timing .pixelclock.max , whichever is
> > higher. Since the Pixel PLL output clock frequency calculation always
> > returns lower frequency than the requested clock frequency, passing in
> > the higher clock frequency should result in output clock frequency which
> > is closer to the expected pixel clock.
> >=20
> > For the Chefree CH101 panel with 13 MHz Xtal input clock, the frequency
> > without this patch is 65 MHz which is out of the panel specification of
> > 68.9..73.4 MHz, while with this patch it is 71.5 MHz which is well with=
in
> > the specification and far more accurate.
>=20
> Granted that most of the panel drivers do not implement get_timings()
> and granted that there are no current users of that interface, I think
> we should move away from it (and maybe even drop it completely from
> drm_panel).

I think we should do the opposite :)

Panels usually have a pretty large operating window, and the current
construct only works because nobody really uses the same panels (or
we're hiding that behind different compatibles) across SoCs or
generation. Or we're working around it.

It's kind of a mess, and it gets messy in encoders too: some will filter
out panel modes, some won't. Some will adjust timings to fit their
clocks, some won't. etc.

Going forward, switching everyone to a timing-like interface and
providing a set of helpers to adjust timings within possible boundaries
to fit a clock rate is doable and should be done imo.

> What about achieving the same via slightly different approach: register
> a non-preferred mode with the clock equal to the max clock allowed. The
> bridge driver can then use the default and the "max" mode to select PLL
> clock.
>=20
> I understand that this suggestion doesn't follow the DPI panel
> specifics, which are closer to the continuous timings rather than fixed
> set of modes, however I really don't think that it's worth keeping the
> interface for the sake of a single driver. Original commit 2938931f3732
> ("drm/panel: Add display timing support") from 2014 mentions using those
> timings for .mode_fixup(), but I couldn't find a trace of the
> corresponding implementation.
>=20
> Another possible option might be to impletent adjusting modes in
> .atomic_check() / .mode_fixup().

It's unused because we don't have an easy API for encoders to use it. We
should fix *that*.

Maxime

--a2cyxsbbj7t2iazf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0R42wAKCRAnX84Zoj2+
dkx0AYCJlldherNwCtDfW5+NA80vunhQXbosepVVlZst9APv8PTjucAp2sT53G1x
7sba6oYBf1gqTEr9svUkMsH/mlfimKOjyBm40u+sVSmD4HZ7Jyu506P/c+7J20+j
7qtM6zMXMA==
=MkNg
-----END PGP SIGNATURE-----

--a2cyxsbbj7t2iazf--
