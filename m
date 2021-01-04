Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5BC2E968E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 15:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55ABE89F38;
	Mon,  4 Jan 2021 14:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF98C89F31;
 Mon,  4 Jan 2021 14:02:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD9FD221E5;
 Mon,  4 Jan 2021 14:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609768952;
 bh=7O9rySo7gpkGBGcZjW56xW7eV0Uk+H7xThUa0qWLzDU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C/zOmdXAq85M8tJ2IiEaNABfCT1npR2zl/t5YsxWwDsZXhuRU5H6qiPpRyZVo62aC
 9c6OnbAEp9cNsFq5HoJNyWd2t3jeJmgZincgUCdna0+TwYfZ8VAYqJjw1M39u8CRNO
 IRrxBMe7IAybeNtnDDhwyvX+kmZ5wWxU0FOSfdHJ05vb6n541syUtZ1k5MF9a1dRCI
 nnRTjlzY+wgmCl111uSOVDUbEGaHldeYtRBWRkGhH17HcUtOmWJmhNeW7+37GvQtMq
 VK7o4Wju5LjFBm5QAXXytwh1rN/19RNjNe1wgUz9INVwKUx0HsZ0/eb6VP27LO6gi9
 kWS6/ZtqOhQdA==
Date: Mon, 4 Jan 2021 14:02:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 09/31] spi: spi-qcom-qspi: fix potential mem leak in
 spi_geni_probe()
Message-ID: <20210104140205.GD5645@sirena.org.uk>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <20210101165507.19486-10-tiny.windzz@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210101165507.19486-10-tiny.windzz@gmail.com>
X-Cookie: Stupidity is its own reward.
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
Cc: nm@ti.com, ulf.hansson@linaro.org, gustavoars@kernel.org,
 jirislaby@kernel.org, airlied@linux.ie, linux-mmc@vger.kernel.org,
 stanimir.varbanov@linaro.org, tanmay@codeaurora.org,
 bjorn.andersson@linaro.org, natechancellor@gmail.com, thierry.reding@gmail.com,
 tongtiangen@huawei.com, groeck@chromium.org, marijn.suijten@somainline.org,
 digetx@gmail.com, steven.price@arm.com, mka@chromium.org,
 chandanu@codeaurora.org, emil.velikov@collabora.com,
 linux-samsung-soc@vger.kernel.org, jonathan@marek.ca, harigovi@codeaurora.org,
 adrian.hunter@intel.com, vireshk@kernel.org, linux-pm@vger.kernel.org,
 kyungmin.park@samsung.com, krzk@kernel.org, jonathanh@nvidia.com,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 alyssa.rosenzweig@collabora.com, linux-serial@vger.kernel.org,
 airlied@redhat.com, smasetty@codeaurora.org, linux-imx@nxp.com,
 freedreno@lists.freedesktop.org, kernel@pengutronix.de, tzimmermann@suse.de,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linux-spi@vger.kernel.org, linux-media@vger.kernel.org,
 abhinavk@codeaurora.org, akhilpo@codeaurora.org, khsieh@codeaurora.org,
 lima@lists.freedesktop.org, rikard.falkeborn@gmail.com,
 kalyan_t@codeaurora.org, linux-tegra@vger.kernel.org, varar@codeaurora.org,
 mchehab@kernel.org, sean@poorly.run, linux-arm-kernel@lists.infradead.org,
 dianders@chromium.org, akashast@codeaurora.org, rnayak@codeaurora.org,
 parashar@codeaurora.org, tomeu.vizoso@collabora.com, sboyd@kernel.org,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, rjw@rjwysocki.net,
 agross@kernel.org, linux-kernel@vger.kernel.org, miaoqinglang@huawei.com,
 hoegsberg@google.com, yuq825@gmail.com, ddavenport@chromium.org,
 masneyb@onstation.org, shawnguo@kernel.org, georgi.djakov@linaro.org,
 lukasz.luba@arm.com
Content-Type: multipart/mixed; boundary="===============1494482259=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1494482259==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GyRA7555PLgSTuth"
Content-Disposition: inline


--GyRA7555PLgSTuth
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 01, 2021 at 04:54:45PM +0000, Yangtao Li wrote:
> Use devm_pm_opp_* API to simplify code, and we don't need
> to make opp_table glabal.

Acked-by: Mark brown <broonie@kernel.org>

--GyRA7555PLgSTuth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/zH9wACgkQJNaLcl1U
h9ABnAf8D9GWSbGll0wLN+abwwbCA4u4yPNtTRXQHQDVYsk5D7ApQVQwwIhyNvq5
js2y6K5nPeBr9r1BRF2z7H+VRvaMWLvlUK+4stYm+8W9f3DYNW64t9fwEBhJTxns
L6uYyziisTQS9dyaG2PfoGu20FbRtlUOlmovkH+4U5m4DEyBcceV5W6VbLpmqL+b
Sy4al8lmxI/g+yt+JaoidpG5zUVEMqYkfQYzafcANsoBz3D6Sb16huLkFohCwCMS
83MEnCvIs9aybc9Jae6D05gp1B92htOwfFKQPnNkLI6OEYKMwfwsEZYqM8bnUasx
Krd7vSYzjQKkG0P2IjKXw2LDZUytIA==
=Y1aS
-----END PGP SIGNATURE-----

--GyRA7555PLgSTuth--

--===============1494482259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1494482259==--
