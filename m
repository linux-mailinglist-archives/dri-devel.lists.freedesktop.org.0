Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E5E2E9698
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 15:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBD589F33;
	Mon,  4 Jan 2021 14:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A14089F31;
 Mon,  4 Jan 2021 14:02:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E55CD22241;
 Mon,  4 Jan 2021 14:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609768971;
 bh=cjvypTeXkdOG/wGebkbRyr2S77+u7rAr75FfrW0xa3o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bm5aX9+92ww4jyTAcgiQK/3InHngR3u7Bf4Fyww8v2yTKG2kO3xTJLW/ZxA2X4l+w
 LIqonA7x3lYVlyxMEDjl+xIIRrNrrxJgoPyGHDdNqJULwde/tiXeT8tBOUcVdsnjpl
 BqsCVaImc9h2SDyEARthIdw2QC/WbLqMHwHo3Lv/vDa4xEdkmEO2Ow+EBbTvOjUCRg
 OTSIezonhyS241uJ4Nh8sfUfxiVhUdgVJ+lVoVxGKpiPiibdHqsUt6rwE7oxiFOnG0
 RTMQaO/WGUyigZgdtaupm74hL/9Mv6ZXMq5X9ql1Zphrx+BytBYOYOL9rZjpsBjCT0
 vF6DKOEp3CZeg==
Date: Mon, 4 Jan 2021 14:02:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 13/31] spi: spi-qcom-qspi: fix potential mem leak in
 qcom_qspi_probe()
Message-ID: <20210104140225.GE5645@sirena.org.uk>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <20210101165507.19486-14-tiny.windzz@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210101165507.19486-14-tiny.windzz@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1546473979=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1546473979==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="19uQFt6ulqmgNgg1"
Content-Disposition: inline


--19uQFt6ulqmgNgg1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 01, 2021 at 04:54:49PM +0000, Yangtao Li wrote:
> We should use dev_pm_opp_put_clkname() to free opp table each time
> dev_pm_opp_of_add_table() got error.

Acked-by: Mark Brown <broonie@kernel.org>

--19uQFt6ulqmgNgg1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/zH/AACgkQJNaLcl1U
h9D/CQf/WT78Nop+3p+ORGoE4mDvVT5d8AmHOyLMsyM0nJeGHW0T18/rtZQUAmNl
GEjHrJ2z0iZaV9JLLk1ifDvgRhTVQi1WHJRhtrJSGdj9NxTs19Q9M3aKHMxCGXw4
maMVT2zyD7ym/wkY7JQDno+lQv890JF1AmQdZAYGW1x/wuVDbSonhUXXFKZPXe9/
3Y8Ak9eawLXB0td0Sy/Qc40jojaeTr3beKYkMYskRqkARl+JRC4geB+mJD2GNplb
OEK5pHfrqSLG7czW4m6iP2BdeYKMJbAycIRYoi8DBzUs7ttd7gZHOdDq94nGY76m
S1IHnh+QgsXcCfp7pkE/486jjH0ylg==
=G6ph
-----END PGP SIGNATURE-----

--19uQFt6ulqmgNgg1--

--===============1546473979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1546473979==--
