Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC73B337E60
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 20:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC476EBB5;
	Thu, 11 Mar 2021 19:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C6F6EBAC;
 Thu, 11 Mar 2021 19:45:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C547664F7C;
 Thu, 11 Mar 2021 19:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615491941;
 bh=Gy7PSWDQSFUvNkcrjH47onXm/Q4ayMlS0UVLkNOcjQs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KE77RvIgbkO2LsXUxAFU9OiAM1Iarbu4zWMiwP1EX3iCFc+By8eXmjG2l1N85Bjta
 Fc+ZvLSCva5VqFGJ9Zo782D1CAu5XCgbm6+Sth8OH5ow8EhmtXu1tmcZl6v7Q6IWRK
 J+dYzx4/HpF9K9fLhFWl6sJi+k2qPCmF+ai6eJQEz8wRkwIG4Ug6JP/Jh9w2hkyqBt
 SI5XxrpRczYf1RpfkeeO8MMMfmfW4IzaFW4TlE22TjsyBQw2ui1lMCMVxsZDCcW4lH
 4/eWNDNPHMHtSm6OIB9vSAZzTyax5fSys4hnswmTyIaLlc4O/SYpAWEm6h0c4/KWwU
 zTbTGmpixF79Q==
Date: Thu, 11 Mar 2021 19:44:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 07/14] spi: spi-geni-qcom: Convert to use
 resource-managed OPP API
Message-ID: <20210311194428.GK4962@sirena.org.uk>
References: <20210311192105.14998-1-digetx@gmail.com>
 <20210311192105.14998-8-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210311192105.14998-8-digetx@gmail.com>
X-Cookie: I'm rated PG-34!!
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Nishanth Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Yangtao Li <tiny.windzz@gmail.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-spi@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Viresh Kumar <vireshk@kernel.org>, Steven Price <steven.price@arm.com>,
 Andy Gross <agross@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-serial@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sean Paul <sean@poorly.run>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, freedreno@lists.freedesktop.org,
 Lukasz Luba <lukasz.luba@arm.com>
Content-Type: multipart/mixed; boundary="===============0419377897=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0419377897==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VSVNCtZB1QZ8vhj+"
Content-Disposition: inline


--VSVNCtZB1QZ8vhj+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 11, 2021 at 10:20:58PM +0300, Dmitry Osipenko wrote:

> Acked-by: Mark brown <broonie@kernel.org>

Typo there.

--VSVNCtZB1QZ8vhj+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBKcxsACgkQJNaLcl1U
h9CCwQf/YgdbtNf9PavLnlj2DLbt3ouIlpPHcKOE/TTUk8rz11Ty425gmd0BkWuF
nQ84jHEogkMEY875FCkOf0usr+fdLbt3pjCZEOmG5sbuC45Tlh8VCEZXARUy3MKs
pcoTuTgcdl1MkTr9oa4bmFSqyOp/7wU8upJNylFHJcO0VRTJK4gMbjUWfExGaY5v
zKIHi8XCL6nueEkUnHiaVUVS/vfc+fpO/nwkJ+oAz5FVcp+Gn3bwIDqk9rGOVLMl
g5TPTkwPB55F1V90oGmmHLIwI1QbVrKQl3PbZOD/L00IuZ80DGQEik76SvlLDdf3
GuFkyj3iTTz/L9skiJSOJLKYVVZIBw==
=Yrbl
-----END PGP SIGNATURE-----

--VSVNCtZB1QZ8vhj+--

--===============0419377897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0419377897==--
