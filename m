Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E97165F37
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 14:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C7F6ED90;
	Thu, 20 Feb 2020 13:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93B76ED90
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 13:53:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63B1CE7C;
 Thu, 20 Feb 2020 14:53:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582206798;
 bh=bIqv4ZGZOGT3b6xmaqujXh3xaygrfzUiArc2j1fuRB0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y/aOJcazvIBhp5356NPaYzBh8ptng3KYAzVlkyNIahWk4GT+WfCiq+Uv781MXXdHy
 wmwvMnJXDs1t/Mwf7e/OEdrwWCpQmsstG307HQv5+Cn7yXMtFU8Ptp5zHZMPPw9LOJ
 VCrPmcpkEf4a+liOR16kPm7uV/zJy8w1+qv8Efp8=
Date: Thu, 20 Feb 2020 15:52:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 2/6] drm/bridge: anx6345: Clean up error handling in
 probe()
Message-ID: <20200220135259.GC4998@pendragon.ideasonboard.com>
References: <20200220083508.792071-1-anarsoul@gmail.com>
 <20200220083508.792071-3-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220083508.792071-3-anarsoul@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Samuel Holland <samuel@sholland.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
 Stephan Gerhold <stephan@gerhold.net>, Jonas Karlman <jonas@kwiboo.se>,
 Torsten Duwe <duwe@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vasily,

Thank you for the patch.

On Thu, Feb 20, 2020 at 12:35:04AM -0800, Vasily Khoruzhick wrote:
> devm_regulator_get() returns either a dummy regulator or -EPROBE_DEFER,
> we don't need to print scary message in either case.
> 
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> index 0d8d083b0207..0204bbe4f0a0 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> @@ -713,17 +713,13 @@ static int anx6345_i2c_probe(struct i2c_client *client,
>  
>  	/* 1.2V digital core power regulator  */
>  	anx6345->dvdd12 = devm_regulator_get(dev, "dvdd12");
> -	if (IS_ERR(anx6345->dvdd12)) {
> -		DRM_ERROR("dvdd12-supply not found\n");
> +	if (IS_ERR(anx6345->dvdd12))
>  		return PTR_ERR(anx6345->dvdd12);
> -	}

There could be other errors such as -EBUSY or -EPERM. The following
would ensure a message gets printed in those cases, while avoiding
spamming the kernel log in the EPROBE_DEFER case.

	if (IS_ERR(anx6345->dvdd12)) {
		if (PTR_ERR(anx6345->dvdd12) != -EPROBE_DEFER)
			DRM_ERROR("Failed to get dvdd12 supply (%d)\n",
				  PTR_ERR(anx6345->dvdd12));
		return PTR_ERR(anx6345->dvdd12);
	}

But maybe it's overkill ? With or without that change (for the second
regulator below too),

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	/* 2.5V digital core power regulator  */
>  	anx6345->dvdd25 = devm_regulator_get(dev, "dvdd25");
> -	if (IS_ERR(anx6345->dvdd25)) {
> -		DRM_ERROR("dvdd25-supply not found\n");
> +	if (IS_ERR(anx6345->dvdd25))
>  		return PTR_ERR(anx6345->dvdd25);
> -	}
>  
>  	/* GPIO for chip reset */
>  	anx6345->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
