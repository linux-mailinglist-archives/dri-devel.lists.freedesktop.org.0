Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5917651704C
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 15:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A98A10E529;
	Mon,  2 May 2022 13:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5DD10E105
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 13:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651498119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2zV+k9kqlgz67AfOxcNykb0h39cTNVnn0WXnNEGgjk4=;
 b=QCQfbhXOBsTzx30WVnEadm8wFM2S8WDIdgzbivdaBPNy34bnZDfSFv5FK+rYOCg/L2UICP
 ex8ulHShM+kCinF48jjXxwqUAsdmZWEvLasbJ2sbxw8lM6sewsZ5P3Jd4iJFgYCyLSrHQu
 oWVuLlmr4p4O5pgz5EgeHWo1pecce+8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-owMQ2u_6MfipC2CJQlo4Zw-1; Mon, 02 May 2022 09:28:31 -0400
X-MC-Unique: owMQ2u_6MfipC2CJQlo4Zw-1
Received: by mail-wr1-f72.google.com with SMTP id
 e21-20020adfa455000000b0020ae075cf35so5339785wra.11
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 06:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2zV+k9kqlgz67AfOxcNykb0h39cTNVnn0WXnNEGgjk4=;
 b=l5gIG+b+VfBDfJoe5O3IhKc292qHQid3CfhgVdI5vATIlKpl6MJwgYk9OzoC60ecL3
 D1aWektKtmASHVpn6zGquQhx8db4dszp67ZDOqCSx6oTpTzBWG5clZzRiP5FgPQVJNGc
 /CmFkUQ7mj44aCCgCuuigyrCp71fxcKRh3Ur2m0Yx+llCQMJScjD8zhjlJdRHRtgu3j6
 lfrqpXo56MJXVYnrekYg12AqynQGt65AcnF59VKuzAJQ0i3NoQbnTOo8XJL5NDhYvJYm
 Tu0Q967hY+NEQUcEcDgG6YMlcq8lbThGguJyfjUseEPyDxkYS085zcvZYb2KhfgyBMvU
 gdrw==
X-Gm-Message-State: AOAM533pL6jCiDdgYIyvYR/1ICm8R0fHsF7jpmbSP14hzJ3JHSI5/+3k
 YRDFNIEHUt7a9MADAngyfpXd5lTurJ5QtHkGqlkHkFQbGr2U+l+wIPpmB0t5/hmy2zMbfbQf3Rp
 j4jORSbyoKCQDl1Z4X/N+X9xmCBoi
X-Received: by 2002:a05:600c:1c20:b0:394:25cb:1404 with SMTP id
 j32-20020a05600c1c2000b0039425cb1404mr12244399wms.52.1651498109821; 
 Mon, 02 May 2022 06:28:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzu2jM2LG+DX+dIVzq45o/V1TxQWIpFsCwnWfT+RmC19xyv+UYhuI/wi7PI/5TDnuN7eFlQ9w==
X-Received: by 2002:a05:600c:1c20:b0:394:25cb:1404 with SMTP id
 j32-20020a05600c1c2000b0039425cb1404mr12244330wms.52.1651498109516; 
 Mon, 02 May 2022 06:28:29 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l3-20020adfa383000000b0020c5253d8bcsm6985850wrb.8.2022.05.02.06.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 06:28:29 -0700 (PDT)
Message-ID: <c0703a8c-3263-6dde-07e4-9f03680c6726@redhat.com>
Date: Mon, 2 May 2022 15:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/3] drm/fb-helper: Rename preferred_bpp
 drm_fbdev_generic_setup() parameter
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220502084830.285639-1-javierm@redhat.com>
 <20220502084830.285639-3-javierm@redhat.com>
 <Ym/BtOM3OlPoE+nr@pendragon.ideasonboard.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Ym/BtOM3OlPoE+nr@pendragon.ideasonboard.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Paul Cercueil <paul@crapouillou.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jyri Sarha <jyri.sarha@iki.fi>, Jerome Brunet <jbrunet@baylibre.com>,
 Marek Vasut <marex@denx.de>, Hao Fang <fanghao11@huawei.com>,
 Evan Quan <evan.quan@amd.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Michal Simek <michal.simek@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Alain Volmat <alain.volmat@foss.st.com>,
 Dave Airlie <airlied@redhat.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 linux-sunxi@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, spice-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 virtualization@lists.linux-foundation.org, Yong Wu <yong.wu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, amd-gfx@lists.freedesktop.org,
 Hyun Kwon <hyun.kwon@xilinx.com>, Tomi Valkeinen <tomba@kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Solomon Chiu <solomon.chiu@amd.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Laurent,

On 5/2/22 13:34, Laurent Pinchart wrote:
> Hi Javier,
> 
> Thank you for the patch.
> 

Thanks a lot for your feedback.

[snip]

>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -2501,8 +2501,16 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
>>  /**
>>   * drm_fbdev_generic_setup() - Setup generic fbdev emulation
>>   * @dev: DRM device
>> - * @preferred_bpp: Preferred bits per pixel for the device.
>> - *                 @dev->mode_config.preferred_depth is used if this is zero.
>> + * @options: options for the registered framebuffer.
>> + *
>> + * The @options parameter is a multi-field parameter that can contain
>> + * different options for the emulated framebuffer device registered.
>> + *
>> + * The options must be set using DRM_FB_SET_OPTION() and obtained using
>> + * DRM_FB_GET_OPTION(). The options field are the following:
>> + *
>> + * * DRM_FB_BPP: bits per pixel for the device. If the field is not set,
>> + *               @dev->mode_config.preferred_depth is used instead.
> 
> Do I assume correctly that a driver that would need to set multiple
> options would do something like
> 
> 	drm_fbdev_generic_setup(dev, DRM_FB_SET_OPTION(DRM_FB_BPP, 32) |
> 				DRM_FB_SET_OPTION(DRM_FB_FW, 1));
>

That's correct, yes.
 
> ? If so, I would rename DRM_FB_SET_OPTION() to DRM_FB_OPTION() as it's
> computing the value of the option bitfield, it doesn't actually set it.
> Apart from that,
>

Right. I'll rename it.
 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

Thanks!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

