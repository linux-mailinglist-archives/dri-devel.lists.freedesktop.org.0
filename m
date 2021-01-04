Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF862E967A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 14:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465A489C6B;
	Mon,  4 Jan 2021 13:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22CC89B49;
 Mon,  4 Jan 2021 13:59:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F00220770;
 Mon,  4 Jan 2021 13:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609768747;
 bh=oAmb65NYH72MQStk3VaVbGlppJznbNt2cArcbsPTQcY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UHS8gGbh9dNUQe4WMvhK/m2XPS+6hdEkfpYdNdSAq5F5FoNaAgW4OBMLdogt4PlMZ
 0owqku0gRhayi6vNM2OwKxXh4BRxz3nZVLwlaZ+spR/7Kaz/eO91UxFD+Gjdm88bKM
 jhbtaXUe9H+xEf8aYkQk7np+nTDd+QSWF0mLzWEYykQxJrDUsjg8rSmePf4X6QdP4d
 DbPFJjV5rqsmmZx+7sd/m9xkeoRVwB+XCzQh7n76FixJZI2Y7qJwkzv34hDPfZoD2r
 c6JjG0u9Y4MIozR8Hz2zQTzUpbqGcFS6iPKmT+CL8SNTyBz3rbYmmqLY5MWtxtru3X
 cQiqUfTF80NuQ==
Date: Mon, 4 Jan 2021 13:58:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 08/31] spi: spi-qcom-qspi: fix potential mem leak in
 spi_geni_probe()
Message-ID: <20210104135840.GC5645@sirena.org.uk>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <20210101165507.19486-9-tiny.windzz@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210101165507.19486-9-tiny.windzz@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1371629019=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1371629019==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mvpLiMfbWzRoNl4x"
Content-Disposition: inline


--mvpLiMfbWzRoNl4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 01, 2021 at 04:54:44PM +0000, Yangtao Li wrote:
> We should use dev_pm_opp_put_clkname() to free opp table each time
> dev_pm_opp_of_add_table() got error.

Acked-by: Mark Brown <broonie@kernel.org>

--mvpLiMfbWzRoNl4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/zHxAACgkQJNaLcl1U
h9AFlgf+L/LzmrwnlPEvAiV70bJdryKYNIVHhDTji4GNiw5bc3Fz7A6gxBdDd/Jn
1qI57uFUYX5WyZ7Avao2gi+jL5EWVJgldsdHEHrlzqSUgK2x9xrgSV9u4JquS45Q
seFNFtiOh4nAG2I+4V2JWPoQIRWTv4kXzhxOuwTRNZZuW6kHLzTJGUOtXpvSKWvp
hMqDoVpnnWcyf6WKVAQCPiA8X3YX+UsIiWNVv1RCwnc8s7/g4i3sXQYnvslK/7L6
vE8FX9MChPQrDewpSlZuH+TLRCMEki6IyGVTdeY+SbwrVQQNavBrAvEH4MGOefoh
qVdPCyIrmbbWYXhYjynDSBxCC9VgJQ==
=DvyL
-----END PGP SIGNATURE-----

--mvpLiMfbWzRoNl4x--

--===============1371629019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1371629019==--
