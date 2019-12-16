Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27A8120EEB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 17:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25F96E7D0;
	Mon, 16 Dec 2019 16:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2896E7D0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 16:13:01 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02A1C20717;
 Mon, 16 Dec 2019 16:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576512781;
 bh=Jef9w4OjkRq1icyigJOT8xylp8Mo2WzDKjHr6uAiULc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bRGG0YcSlJmTEk9EfbMd4tusYJTP9xGT22BF+SgJByObFOByPlN0xPhbXAhWIPSrR
 VUVb8gOZYb3cH7+/Ox7rA5EbXd2s3MxEMgmUJcuBmQ2QyTSdSaJEe4856ukG1N6uIA
 fA9XmLS6WVgfrTRO2HlRJRca+A+/LF5G8GaTrAdo=
Date: Mon, 16 Dec 2019 17:12:58 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Stefan Mavrodiev <stefan@olimex.com>
Subject: Re: [PATCH 1/1] drm/sun4i: hdmi: Check for null pointer before cleanup
Message-ID: <20191216161258.lmkq2ersfm746t7q@gilmour.lan>
References: <20191216144348.7540-1-stefan@olimex.com>
MIME-Version: 1.0
In-Reply-To: <20191216144348.7540-1-stefan@olimex.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0287152546=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0287152546==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tv26vsw7yc2hguuf"
Content-Disposition: inline


--tv26vsw7yc2hguuf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Dec 16, 2019 at 04:43:48PM +0200, Stefan Mavrodiev wrote:
> It's possible hdmi->connector and hdmi->encoder divices to be NULL.
> This can happen when building as kernel module and you try to remove
> the module.
>
> This patch make simple null check, before calling the cleanup functions.
>
> Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> index a7c4654445c7..b61e00f2ecb8 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -685,8 +685,10 @@ static void sun4i_hdmi_unbind(struct device *dev, struct device *master,
>  	struct sun4i_hdmi *hdmi = dev_get_drvdata(dev);
>
>  	cec_unregister_adapter(hdmi->cec_adap);
> -	drm_connector_cleanup(&hdmi->connector);
> -	drm_encoder_cleanup(&hdmi->encoder);
> +	if (hdmi->connector.dev)
> +		drm_connector_cleanup(&hdmi->connector);
> +	if (hdmi->encoder.dev)
> +		drm_encoder_cleanup(&hdmi->encoder);

Hmmm, this doesn't look right. Do you have more information on how you
can reproduce it?

Maxime

--tv26vsw7yc2hguuf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfetCgAKCRDj7w1vZxhR
xSlzAQCy4c+CBbNxGZLR/c23Wqh2wxxJFng5CLDPuXkQzWCfYAEA2J3Ojg/qotg0
t+szQiO+c0e2z1mtbxDkSMg9ZtyIVwQ=
=fjFy
-----END PGP SIGNATURE-----

--tv26vsw7yc2hguuf--

--===============0287152546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0287152546==--
