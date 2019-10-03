Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318EEC9F87
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 15:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F0D899E8;
	Thu,  3 Oct 2019 13:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10FC899E8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 13:34:49 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A28D20700;
 Thu,  3 Oct 2019 13:34:49 +0000 (UTC)
Date: Thu, 3 Oct 2019 15:34:47 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [linux-sunxi] [PATCH 1/3] Revert "drm/sun4i: dsi: Change the
 start delay calculation"
Message-ID: <20191003133447.yh2qcaazn2blphoo@gilmour>
References: <20191001080253.6135-1-icenowy@aosc.io>
 <20191001080253.6135-2-icenowy@aosc.io>
 <CAMty3ZCjrM4MajJLyLwt-31mNnfVWghwatogtwVOvCt4gY0LZA@mail.gmail.com>
 <20191003131916.4bm22krapo5tz6oz@gilmour>
 <E0DBDA94-FA7C-4ED6-AE84-BE1FC5463C0E@aosc.io>
MIME-Version: 1.0
In-Reply-To: <E0DBDA94-FA7C-4ED6-AE84-BE1FC5463C0E@aosc.io>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570109689;
 bh=ApHvRgiWA6cRhXYdkclbMkQdh5sxi8kdnz0cqB74Gvg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MZgD+R+QDCfhRydR0uPmxahHwv3pyjs/0u7P5qUaN9ZrKn1EY1NeQb/rH6Qp1HMaA
 YcYFxynnwZD1MteDBBoz7ouXRHx5raneJ0RAlMFML8nRlR3GaDp4GD6qyiXqRsBbR5
 GQWIUsIluS0VZfxPzYONnrO86rxq51tNC+Pk2opg=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0808140992=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0808140992==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ahbpm7frntnvtdny"
Content-Disposition: inline


--ahbpm7frntnvtdny
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 03, 2019 at 09:21:30PM +0800, Icenowy Zheng wrote:
>
>
> =E4=BA=8E 2019=E5=B9=B410=E6=9C=883=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
9:19:16, Maxime Ripard <mripard@kernel.org> =E5=86=99=E5=88=B0:
> >On Thu, Oct 03, 2019 at 12:38:43PM +0530, Jagan Teki wrote:
> >> On Tue, Oct 1, 2019 at 1:33 PM Icenowy Zheng <icenowy@aosc.io> wrote:
> >> >
> >> > This reverts commit da676c6aa6413d59ab0a80c97bbc273025e640b2.
> >> >
> >> > The original commit adds a start parameter to the calculation of
> >the
> >> > start delay according to some old BSP versions from Allwinner.
> >However,
> >> > there're two ways to add this delay -- add it in DSI controller or
> >add
> >> > it in the TCON. Add it in both controllers won't work.
> >> >
> >> > The code before this commit is picked from new versions of BSP
> >kernel,
> >> > which has a comment for the 1 that says "put start_delay to tcon".
> >By
> >> > checking the sun4i_tcon0_mode_set_cpu() in sun4i_tcon driver, it
> >has
> >> > already added this delay, so we shouldn't repeat to add the delay
> >in DSI
> >> > controller, otherwise the timing won't match.
> >>
> >> Thanks for this change. look like this is proper reason for adding +
> >> 1. also adding bsp code links here might help for future reference.
> >>
> >> Otherwise,
> >>
> >> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> >
> >The commit log was better in this one. I ended up merging this one,
> >with your R-b.
>
> Please note that Jagan's v11 3/7 is still needed.

Right, unfortunately, it doesn't apply anymore.

Jagan, can you send that patch rebased?

Thanks!
Maxime

--ahbpm7frntnvtdny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZX49wAKCRDj7w1vZxhR
xXlJAP9eYpRWg54xgD3SVv2/I+5gd0AAON4A7dZdtgu+5/pTPQD+PCU1uq8t/VDH
usW3Bq24a2WrKYQM+3lOWKH7WkUhnA4=
=hN/o
-----END PGP SIGNATURE-----

--ahbpm7frntnvtdny--

--===============0808140992==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0808140992==--
