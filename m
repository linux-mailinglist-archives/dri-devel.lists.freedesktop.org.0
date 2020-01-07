Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C82713299A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 16:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6086E0CF;
	Tue,  7 Jan 2020 15:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A596E0CF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 15:06:28 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 83D012087F;
 Tue,  7 Jan 2020 15:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578409588;
 bh=+y+aWqsEqk2+D9Baxc1ravTEaKC6Hg6OrUKouQASJFI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aGcPyhZnC7+FqmaURKzkdbH8gwRkbCGrcv15/QY0sFaTSSpSdUJzt3yF0mMK/Qg3E
 EwdVYzY5dcdj451Mrzm/4tIYZK4MZvAqdm2+nCKxgG7wJSry8pui+CAxbpdkd4mW2v
 T28gft04vtvzuNXQCXdxGba1rPmhNJy7/DbrV5YY=
Date: Tue, 7 Jan 2020 16:06:25 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH] drm/sun4i: tcon: Set RGB DCLK min. divider based on
 hardware model
Message-ID: <20200107150625.sj6x4u67diac3v5p@gilmour>
References: <20200107070113.28951-1-wens@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200107070113.28951-1-wens@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1989923344=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1989923344==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xezwhxxbc3anpsth"
Content-Disposition: inline


--xezwhxxbc3anpsth
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 07, 2020 at 03:01:13PM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>
> In commit 0b8e7bbde5e7 ("drm/sun4i: tcon: Set min division of TCON0_DCLK
> to 1.") it was assumed that all TCON variants support a minimum divider
> of 1 if only DCLK was used.
>
> However, the oldest generation of hardware only supports minimum divider
> of 4 if only DCLK is used. If a divider of 1 was used on this old
> hardware, some scrolling artifact would appear. A divider of 2 seemed
> OK, but a divider of 3 had artifacts as well.
>
> Set the minimum divider when outputing to parallel RGB based on the
> hardware model, with a minimum of 4 for the oldest (A10/A10s/A13/A20)
> hardware, and a minimum of 1 for the rest. A value is not set for the
> TCON variants lacking channel 0.
>
> This fixes the scrolling artifacts seen on my A13 tablet.
>
> Fixes: 0b8e7bbde5e7 ("drm/sun4i: tcon: Set min division of TCON0_DCLK to 1.")
> Cc: <stable@vger.kernel.org> # 5.4.x
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks

Maxime

--xezwhxxbc3anpsth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXhSecQAKCRDj7w1vZxhR
xQFaAP9wLF9udsuevqjGAE3LAn6TCRsCdWejtoRRsX5mYATyzgEA6SE+BSoFd/Ct
dU/RYO3cR8I6jmK7T2SuD3yh1MdfgAE=
=Ruky
-----END PGP SIGNATURE-----

--xezwhxxbc3anpsth--

--===============1989923344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1989923344==--
