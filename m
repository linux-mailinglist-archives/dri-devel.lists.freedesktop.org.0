Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6DC2C0C8C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 15:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F5A89FDD;
	Mon, 23 Nov 2020 14:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9613189FDD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 14:03:40 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p22so17973545wmg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 06:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=vXp3Sxctq9VkObljnq0YBLK27eqIoDcu7q1uLV6sriI=;
 b=lYFt4ET27fdwgzZV6Gkc4ybnFVihvBTJaIa6rJ+vsitRg1hhECDLPMNrdpsgFQdmOV
 0PTTMUTD+GZaxQySyfd5XbbEFujkcJjieVRlxFDe2/cD7kUTHyl3x8+xjDTROhn/uE8j
 5szxCxVKimS4TgY7ddfjMuND/xhWdZtPeKnv22na0aqW4L7tpe3g64rtV9D4Mh6JmQGj
 uH3GPwVwP9bDxDOFnpKADgK3RvvxajRKflO4Jh6QR0VkwDZIhAEhr/F6hNFeQX96NQYR
 UFBgfSgnWtnabYKvAS52Dmla9BQ1+EtyRfZ5vPL1hctcZTHhwrfBLfz540p28PkzWkzz
 9DkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=vXp3Sxctq9VkObljnq0YBLK27eqIoDcu7q1uLV6sriI=;
 b=izXdSosCMGHg1hOInUBMNjL+h0lCcQykg5Jx1rb2P4KVsYIKTfz4dU9vvdmUKdMRuD
 koodOvXqC+EV+IW5zoMQBf7R9VZ4RG03VedFPEJqB5bFXNOv24WIcttNFuSvsLSb/ZZ9
 sbsdQGoIZRbbZ8AGQpMPNyDyVN4LzwmrjKQN1cz/oq2uAJqV+ESD/gbZAMrWy9hTsAJA
 NaYC8nEH0lvRaWx7aNBgzgWEC4WfUciopN080bd66cKwQ/PTr2v1lGWvMSyuyO1AoN+g
 A6Sy60ngxcCb1Gp0aWlL5no3ZU8PmwHdgYWV3s3JxjP3wctKHmsXU6+DsyXFjc7ePtfF
 8W2Q==
X-Gm-Message-State: AOAM531k6U7VaIR3nUKyZWauXH/4OymGslb+V56FzAlm63rAk/DYgTzF
 64iF09u4ovnYMZsB9GmxYYDmDQ==
X-Google-Smtp-Source: ABdhPJw3gonmwJioLtDDPdO6LRztyMyzSHRvtjQP+sbEh6Jcgi2gQk8QcqDyOUwDBlBkeT0oTnf5sQ==
X-Received: by 2002:a1c:f219:: with SMTP id s25mr7258057wmc.67.1606140219296; 
 Mon, 23 Nov 2020 06:03:39 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
 by smtp.gmail.com with ESMTPSA id x4sm4284619wrv.81.2020.11.23.06.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 06:03:38 -0800 (PST)
References: <20201120094205.525228-1-maz@kernel.org>
 <20201120094205.525228-2-maz@kernel.org>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Marc Zyngier <maz@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/2] drm/meson: dw-hdmi: Disable clocks on driver teardown
In-reply-to: <20201120094205.525228-2-maz@kernel.org>
Message-ID: <1jwnyc41c6.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 23 Nov 2020 15:03:37 +0100
MIME-Version: 1.0
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri 20 Nov 2020 at 10:42, Marc Zyngier <maz@kernel.org> wrote:

> The HDMI driver request clocks early, but never disable them, leaving
> the clocks on even when the driver is removed.
>
> Fix it by slightly refactoring the clock code, and register a devm
> action that will eventually disable/unprepare the enabled clocks.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 43 ++++++++++++++++++---------
>  1 file changed, 29 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 7f8eea494147..29623b309cb1 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -145,8 +145,6 @@ struct meson_dw_hdmi {
>  	struct reset_control *hdmitx_apb;
>  	struct reset_control *hdmitx_ctrl;
>  	struct reset_control *hdmitx_phy;
> -	struct clk *hdmi_pclk;
> -	struct clk *venci_clk;
>  	struct regulator *hdmi_supply;
>  	u32 irq_stat;
>  	struct dw_hdmi *hdmi;
> @@ -946,6 +944,29 @@ static void meson_disable_regulator(void *data)
>  	regulator_disable(data);
>  }
>  
> +static void meson_disable_clk(void *data)
> +{
> +	clk_disable_unprepare(data);
> +}
> +
> +static int meson_enable_clk(struct device *dev, char *name)
> +{
> +	struct clk *clk;
> +	int ret;
> +
> +	clk = devm_clk_get(dev, name);
> +	if (IS_ERR(clk)) {
> +		dev_err(dev, "Unable to get %s pclk\n", name);
> +		return PTR_ERR(clk);
> +	}
> +
> +	ret = clk_prepare_enable(clk);
> +	if (!ret)
> +		ret = devm_add_action_or_reset(dev, meson_disable_clk,
> clk);

Thanks for fixing this Marc.

FYI, while it is fine to declare a function to disable the clocks, a quick
cast may avoid it

devm_add_action_or_reset(dev, (void(*)(void *))clk_disable_unprepare, clk);

> +
> +	return ret;
> +}
> +
>  static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  				void *data)
>  {
> @@ -1026,19 +1047,13 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  	if (IS_ERR(meson_dw_hdmi->hdmitx))
>  		return PTR_ERR(meson_dw_hdmi->hdmitx);
>  
> -	meson_dw_hdmi->hdmi_pclk = devm_clk_get(dev, "isfr");
> -	if (IS_ERR(meson_dw_hdmi->hdmi_pclk)) {
> -		dev_err(dev, "Unable to get HDMI pclk\n");
> -		return PTR_ERR(meson_dw_hdmi->hdmi_pclk);
> -	}
> -	clk_prepare_enable(meson_dw_hdmi->hdmi_pclk);
> +	ret = meson_enable_clk(dev, "isfr");
> +	if (ret)
> +		return ret;
>  
> -	meson_dw_hdmi->venci_clk = devm_clk_get(dev, "venci");
> -	if (IS_ERR(meson_dw_hdmi->venci_clk)) {
> -		dev_err(dev, "Unable to get venci clk\n");
> -		return PTR_ERR(meson_dw_hdmi->venci_clk);
> -	}
> -	clk_prepare_enable(meson_dw_hdmi->venci_clk);
> +	ret = meson_enable_clk(dev, "venci");
> +	if (ret)
> +		return ret;
>  
>  	dw_plat_data->regm = devm_regmap_init(dev, NULL, meson_dw_hdmi,
>  					      &meson_dw_hdmi_regmap_config);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
