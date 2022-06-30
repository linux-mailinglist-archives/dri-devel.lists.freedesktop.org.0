Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1425618C5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 13:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B2710F052;
	Thu, 30 Jun 2022 11:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5864E10F026;
 Thu, 30 Jun 2022 11:10:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 43436622AC;
 Thu, 30 Jun 2022 11:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229ECC34115;
 Thu, 30 Jun 2022 11:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656587441;
 bh=Ocbgb/7jtbPf5c7P3Qu4IS2stjMJzDoFkyyY73hHr2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KwZCxI1QdcIf76JP3BhOMJdxLR4B6uWo/VApAlYCAbryYteKxpiJDv8mks3WPbn/t
 PN0nmyRcKqUNvQWLX0i4UeGSFYMJg/aJRPtIItPf5ZbGJFlTgo921PPtaBAkcMOfwS
 EAviKJu/LaVJQnqEAMkfWG8YsiYjdWOBiCPVkp3jUSN7a/BNoE2dxQcvi6boI8iEE1
 kG+kDnIwIwvKk2KA7/GI7v7uXdSJUVryiLAvAUno8r+dGCAjnpQrQrIbdvT7znkem2
 wtbsma0gtl/xN3EfCxjcGT59nTF9hSZ+cjUmMY3rJQ3yjQ16RK16uPcLGCXgC6hRkT
 fUVm+4Tup/Uiw==
Date: Thu, 30 Jun 2022 12:10:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 4/5] ASoC: amd: add Machine driver for Jadeite platform
Message-ID: <Yr2Eq0BUmi6mZsRY@sirena.org.uk>
References: <20220630031755.1055413-1-Vijendar.Mukunda@amd.com>
 <20220630031755.1055413-5-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VaXjt56hsiVkurul"
Content-Disposition: inline
In-Reply-To: <20220630031755.1055413-5-Vijendar.Mukunda@amd.com>
X-Cookie: Today is what happened to yesterday.
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
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 amd-gfx@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 dri-devel@lists.freedesktop.org, Alexander.Deucher@amd.com,
 zhuning@everest-semi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--VaXjt56hsiVkurul
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 30, 2022 at 08:47:54AM +0530, Vijendar Mukunda wrote:

> +static int st_es8336_hw_params(struct snd_pcm_substream *substream,
> +			       struct snd_pcm_hw_params *params)
> +{
> +	int ret = 0;
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +
> +	ret = snd_soc_dai_set_sysclk(codec_dai, 0, params_rate(params) * 256, SND_SOC_CLOCK_IN);
> +	if (ret < 0) {
> +		dev_err(rtd->dev, "can't set codec sysclk: %d\n", ret);
> +		return ret;
> +	}
> +	return ret;
> +}

> +static const unsigned int st_channels[] = {
> +	DUAL_CHANNEL,
> +};
> +
> +static const unsigned int st_rates[] = {
> +	48000,
> +};

If the clock rate is fixed why not just set the sysclk once at startup
too?

--VaXjt56hsiVkurul
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK9hKoACgkQJNaLcl1U
h9D6iQf/cdNWEk90vyAVgMDGpqVrhhgGkycVyqRydGaLYCrCQXsnLdtPqtSpQCyB
doEqq9MwQGoj/8uz5i/0althh56A2dV2L6k/81LuXbX685XrtdvosvEv9m37y+ru
ZebtRcmQ668WOgeLYHmthArmVUwjPmUtcOkZ1K7dibKXWm7Elhv0kkXZLTM+UyQs
MoFY3kjXWMu3vEm+ZTogS+YhilD8EE5Vl3pvGJKZ8NKJxDMrXQbNlO5XMkY+9IaR
O1U0u8iVoirNM0GWyHbVCwqOPQCIbhqc2g89N1teq8Qs+1WTf8MRAfuo1gnGfbrg
c0/bwEED3n4t0Rgqqhau7Dq1qPLViA==
=9h7K
-----END PGP SIGNATURE-----

--VaXjt56hsiVkurul--
