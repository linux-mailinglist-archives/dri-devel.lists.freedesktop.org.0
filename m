Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6DE647C6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 16:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4955A890D7;
	Wed, 10 Jul 2019 14:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8B8890D7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 14:05:12 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 6C62BE000B;
 Wed, 10 Jul 2019 14:05:04 +0000 (UTC)
Date: Wed, 10 Jul 2019 16:05:04 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] drm/modes: Skip invalid cmdline mode
Message-ID: <20190710140504.t5lsk36gnn5cdn6b@flea>
References: <20190709145151.23086-1-digetx@gmail.com>
 <20190710101229.54ufuhmh22dfxclr@flea>
 <4ad69d15-07f8-9753-72d6-a51402c94c20@gmail.com>
 <20190710125552.qvmnh6qs63ikiu2k@flea>
 <f530844d-70f2-c3cc-d5f6-b435f1dbdfd2@gmail.com>
 <20190710130615.gvi2jwgr2cds66xr@flea>
 <75719cad-c65c-7ebc-3ea8-98134f86ddc3@gmail.com>
 <4a13f12f-05a7-473e-4e4e-7a7e32d09720@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4a13f12f-05a7-473e-4e4e-7a7e32d09720@gmail.com>
User-Agent: NeoMutt/20180716
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1502266439=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1502266439==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bariuncpprpjv42x"
Content-Disposition: inline


--bariuncpprpjv42x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 10, 2019 at 04:29:19PM +0300, Dmitry Osipenko wrote:
> This works:
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index 56d36779d213..e5a2f9c8f404 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -182,6 +182,8 @@ drm_connector_pick_cmdline_mode(struct drm_connector *connector)
>         mode = drm_mode_create_from_cmdline_mode(connector->dev, cmdline_mode);
>         if (mode)
>                 list_add(&mode->head, &connector->modes);
> +       else
> +               cmdline_mode->specified = false;

Hmmm, it's not clear to me why that wouldn't be the case.

If we come back to the beginning of that function, we retrieve the
cmdline_mode buffer from the connector pointer, that will probably
have been parsed a first time using drm_mode_create_from_cmdline_mode
in drm_helper_probe_add_cmdline_mode.

Now, I'm guessing that the issue is that in
drm_mode_parse_command_line_for_connector, if we have a named mode, we
just copy the mode over and set mode->specified.

And we then move over to do other checks, and that's probably what
fails and returns, but our drm_cmdline_mode will have been modified.

I'm not entirely sure how to deal with that though.

I guess we could allocate a drm_cmdline_mode structure on the stack,
fill that, and if successful copy over its content to the one in
drm_connector. That would allow us to only change the content on
success, which is what I would expect from such a function?

How does that sound?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--bariuncpprpjv42x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXSXwjwAKCRDj7w1vZxhR
xbW+AP9G0wdD7eMxSNjs35WcStnrObO54j7WGEY71hdPnh7yDgD+Ky5utQLhxr2w
LBn3jxYg3tyjfdWY04f+p6Cj0pBLhQI=
=wZot
-----END PGP SIGNATURE-----

--bariuncpprpjv42x--

--===============1502266439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1502266439==--
