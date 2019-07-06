Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C81F60E62
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2019 03:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E3C6E568;
	Sat,  6 Jul 2019 01:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF2E6E568
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 01:06:09 +0000 (UTC)
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hjZ9R-0005M0-9c; Sat, 06 Jul 2019 01:06:05 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id AA75D2742B3A; Sat,  6 Jul 2019 02:06:04 +0100 (BST)
Date: Sat, 6 Jul 2019 02:06:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH 1/2] regmap: Add DSI bus support
Message-ID: <20190706010604.GG20625@sirena.org.uk>
References: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
 <20190703214512.41319-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190703214512.41319-1-jeffrey.l.hugo@gmail.com>
X-Cookie: How you look depends on where you go.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1rzhIg/gYP6gF2nEYMswqh8XqxzTA32GFXstzYxorB4=; b=KudHSDPC0DOxrL4bzrXfgXPvI
 blqp4J86MiyWDbwHDjff5nHw7GQdLV+f/elOrwbzEl5WR5T4plWZwxpIJpduZ28kKqHRAfWXDDncL
 CASTS0Q07yXzT51sGF7o0z1geuBnhXP9A32zoH36gLwQ18oBTlUg62pXK22RBr/dsW0ho=;
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, Laurent.pinchart@ideasonboard.com
Content-Type: multipart/mixed; boundary="===============0924062032=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0924062032==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3yNHWXBV/QO9xKNm"
Content-Disposition: inline


--3yNHWXBV/QO9xKNm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 03, 2019 at 02:45:12PM -0700, Jeffrey Hugo wrote:
> Add basic support with a simple implementation that utilizes the generic
> read/write commands to allow device registers to be configured.

This looks good to me but I really don't know anything about DSI,
I'd appreciate some review from other people who do.  I take it
there's some spec thing in DSI that says registers and bytes must
both be 8 bit?

A couple of minor comments, no need to resend just for these:

> +       payload[0] = (char)reg;
> +       payload[1] = (char)val;

Do you need the casts?

> +	ret = mipi_dsi_generic_write(dsi, payload, 2);
> +	return ret < 0 ? ret : 0;

Please just write an if statement, it helps with legibility.

> +struct regmap *__regmap_init_dsi(struct mipi_dsi_device *dsi,
> +				 const struct regmap_config *config,
> +				 struct lock_class_key *lock_key,
> +				 const char *lock_name)
> +{
> +	return __regmap_init(&dsi->dev, &dsi_bus, &dsi->dev, config,
> +			     lock_key, lock_name);
> +}
> +EXPORT_SYMBOL_GPL(__regmap_init_dsi);

Perhaps validate that the config is OK (mainly the register/value
sizes)?  Though I'm not sure it's worth it so perhaps not - up to
you.

--3yNHWXBV/QO9xKNm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0f8/sACgkQJNaLcl1U
h9B+BAf+OQ42/IKead1kROPCuJvRz9xl+9GDQTLlYbT3gv9XzJqILZvnKJdtFtnQ
FIjvDBpN7fxvlXZtGAwrMOa5udFoKi2r1HTWeXW9qO3YYOrm06gt22+EsO/176rb
BGCshVkG6DOZGHT858SLkWlNN6pXuu7//4vJMfGsnKNI3KEc9jGHI3U3KoF3jNyi
pGlJPPGvvJhA9Nr3bdJuCD5eo/zAyjqsFE5NaynitGMU5Gzc9qZZWx7XtqA6qbz+
mPMDlUK9mXLu5/HkFyyTptJAZrbDGGWnpSMBDt4X92plAc07q82hWWlgEdaq2pEW
O8LOCJGyLJrkFlhw41aL4GO7nqMMqg==
=xAto
-----END PGP SIGNATURE-----

--3yNHWXBV/QO9xKNm--

--===============0924062032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0924062032==--
