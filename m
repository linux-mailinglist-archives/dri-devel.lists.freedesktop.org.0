Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2D92E96B9
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 15:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6DC89F43;
	Mon,  4 Jan 2021 14:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4A889F3B;
 Mon,  4 Jan 2021 14:05:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E752D207BC;
 Mon,  4 Jan 2021 14:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609769132;
 bh=79TsA1bA8DKt3n7SY5XnXtm3knysfw0cfWKMLdkrzAc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iHN9zNRZrzzhE+ofXqwGY3v8yznfietvgJMSpIw+/Hb+3GY0GuhJL7mLLW9bt9kcZ
 PxcqgpZD5FhAKNG8I5jGEXGBvLQpBmco8xGjMnaIc4EebNiLVje0BlJWOj45JL0/PB
 vxtEJY5OhIuVTA6E/Lui4XNWCjztT9yf7D3//WPmqcmmDQBgRTjNFYUHE+LDDdYS2G
 vDbXQowhqqzHV+4MYe0UswMc695n3mCySu0MBMSim5Ss3EsWmxmlkITnnS4eNLG3ZK
 qcONCWIJbRc577IYCOT74XxUKKbK+estp/16xd1zq3Gyj1t5BuDxRAMQebZh9HQ2Px
 ydgmSJ/nP9dUA==
Date: Mon, 4 Jan 2021 14:05:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 14/31] spi: spi-qcom-qspi: convert to use devm_pm_opp_* API
Message-ID: <20210104140506.GF5645@sirena.org.uk>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <20210101165507.19486-15-tiny.windzz@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210101165507.19486-15-tiny.windzz@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0792086242=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0792086242==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4VrXvz3cwkc87Wze"
Content-Disposition: inline


--4VrXvz3cwkc87Wze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 01, 2021 at 04:54:50PM +0000, Yangtao Li wrote:
> Use devm_pm_opp_* API to simplify code, and remove opp_table
> from qcom_qspi.

Acked-by: Mark Brown <broonie@kernel.org>

--4VrXvz3cwkc87Wze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/zIJEACgkQJNaLcl1U
h9DFeQf+IHePH8ftvRUXVVunMDt5ucIZpHjc+KGKU8AM3jyZ+Xyy7jpftefB54+O
D0zp7MZ5qmBT4HlKD4cibZcvesuW18PPYrUMXVV3H8MuTBZMfvl+XDsWm0NvMjE+
mG+w8bSqPUM9Mjo5wa7UN8bbEjHzNtPZt0lUNfN+k0NGXJ3XhN5WtH3eGXQAPaIn
o5aKfPOue5R/hIy2XhK9W7VLqa8NwnhL7tCfYme/Eto/F4ygM/JVeTwdMOeKe3Gi
SeDV7n7fe5oPecANOGYXE6gdO2c7oAcJl36gxh2rjpz/yGyCykjmHBxU/YdSV3Jk
T8oGZSZjqmlT+HfPp7aRXPMXmf3ncQ==
=ApdX
-----END PGP SIGNATURE-----

--4VrXvz3cwkc87Wze--

--===============0792086242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0792086242==--
