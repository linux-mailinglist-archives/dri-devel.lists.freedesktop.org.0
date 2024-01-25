Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5F583C482
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 15:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3588710F333;
	Thu, 25 Jan 2024 14:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A78610F2A0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 14:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706192078;
 bh=xuWotEzSelSVBqWujYKbIOXX960an6aLcCPwqSUkjtM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nSMrqxBc5B0zoxSh7oM+5Fjyr3Ev/UxHPkW05LIh9tqvVs8PD+gCaNAqlz5QsrhBH
 HbSRK9bawmsg86dsQH2IjMpDCUePRyRF5oM8aEVzAti4uMMz1HRIpPYLi32u2KBQJ+
 AliVBErnUM3jUPU81ZHJPCNYmhPMgUeAyPCVcAL4Hih1LBsQ2CGmIALnpwgLpButSL
 rbFGcAbYC6BY3TnD/ujgbQgo1zc9++xbkTUK6KOdcjliB5wx4T3j9bIncv2DioZft3
 9ALNYJlMlexd763yE/DkmWdIt93ZLBCvhepEUEmz9UsnHPTMiD95fyECCAAuyLjyhN
 8xG5LCL5+b38A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3B7E43782057;
 Thu, 25 Jan 2024 14:14:35 +0000 (UTC)
Message-ID: <4079a650-74a6-49bc-87a9-c5729fb6e8d1@collabora.com>
Date: Thu, 25 Jan 2024 15:14:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 003/111] pwm: Provide a macro to get the parent device
 of a given chip
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-pwm@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Benson Leung <bleung@chromium.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <1cae6f73264ab313205eaa9483251f7aaf259cb4.1706182805.git.u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1cae6f73264ab313205eaa9483251f7aaf259cb4.1706182805.git.u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-staging@lists.linux.dev,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 greybus-dev@lists.linaro.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Douglas Anderson <dianders@chromium.org>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 25/01/24 13:08, Uwe Kleine-König ha scritto:
> Currently a pwm_chip stores in its struct device *dev member a pointer
> to the parent device. Preparing a change that embeds a full struct
> device in struct pwm_chip, this accessor macro should be used in all
> drivers directly accessing chip->dev now. This way struct pwm_chip and
> this macro can be changed without having to touch all drivers in the
> same change set.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   include/linux/pwm.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/pwm.h b/include/linux/pwm.h
> index 8ffe9ae7a23a..d7966918f301 100644
> --- a/include/linux/pwm.h
> +++ b/include/linux/pwm.h
> @@ -289,6 +289,11 @@ struct pwm_chip {
>   	struct pwm_device *pwms;
>   };
>   
> +static inline struct device *pwmchip_parent(struct pwm_chip *chip)
> +{
> +	return chip->dev;
> +}
> +
>   #if IS_ENABLED(CONFIG_PWM)
>   /* PWM user APIs */
>   int pwm_apply_might_sleep(struct pwm_device *pwm, const struct pwm_state *state);



