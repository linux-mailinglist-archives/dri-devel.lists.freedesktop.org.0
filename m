Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A77BA66AB17
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 12:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05E010E06C;
	Sat, 14 Jan 2023 11:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE4710E03C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 21:24:27 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id i1so7890392ilu.8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 13:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JWhCION+NoDFlDplMErH7g1LLZGyQMD6UfeI3Sm2FZQ=;
 b=QTxP8K1GTc+YP5vKag4D6v3xV69L2/13W6kmFtkIjyEiTBeyE2oy/KXSOlG3wEHAVo
 QH9CXydMtJtassudtvO9ARxHYBuB/Vs16AIs+i9wf6NtUIDJctJnVLa9S2OkJfFaGOH+
 Fr9hFBh9gWYgQK1G4b1a3fTK5OUB8CM7Asvfl2ESZ+cSLbEBmLa3Bew/S12MpJgDJsRM
 G8V0Pl1jZxJ9wuaoJnda4+ydExfcUXqECIRfTWtHBX+y8+gkUJRvE9upTXJKnjMWYFii
 Vt6tOaNqxiYU5gk23pUKEZIAP77KST45Ytt3jmbwX1I8RKeCU5hiFO6UYzRkxwx5Tu0y
 Tq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JWhCION+NoDFlDplMErH7g1LLZGyQMD6UfeI3Sm2FZQ=;
 b=jeqWZpfog/U8ywWaDuAHKaUWB1O7TiQHMkbvPtFgBs3PzmaphwWXfQCMybv1X2c3qb
 yJZMilVJ+qZhqR0CjEzwUyiPPAjzzofaVYstXxf6Pvdyt6OXuaPhl05xbnEF0CHGEwaC
 LLMjCDCaAj3Q6MKaW1mtX0K/FXwlZARXFLD4xUWntTLkH/+v+pfI30Q9ZugRijIKB+SD
 uHKnLWwEksC0vNXpXAJBsTBEfA2lCZ/GAgiEgKugb01QalWLBtigAwaI4OGiqFLcrYQT
 3cibLQsCvhMhQEdLt1MVIqJ4S3kMzXIYXrj3vUjCbzZjJHPYCm/HU9Qp4ZKr8zXx07/M
 jkag==
X-Gm-Message-State: AFqh2kqDUO2TyfrE+Yuvok/DrjvQne4FXo82O9hEyVqQISsFoGJz/rtZ
 oD2sxQ0Jk6Iip2GayZOFw/w=
X-Google-Smtp-Source: AMrXdXtwgYqfX3GibmRnK7CgUNE0JDR7wkvJGod5/GGUgxwulXQIWtcqxRnbCrpaPegD/Ew/+vS2mQ==
X-Received: by 2002:a05:6e02:1be7:b0:303:8cff:9841 with SMTP id
 y7-20020a056e021be700b003038cff9841mr63323674ilv.26.1673645066619; 
 Fri, 13 Jan 2023 13:24:26 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::6463])
 by smtp.gmail.com with ESMTPSA id
 q25-20020a02a999000000b0038a360671adsm6678801jam.27.2023.01.13.13.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 13:24:25 -0800 (PST)
Date: Fri, 13 Jan 2023 16:24:23 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC PATCH] drm/dsi-mipi: Fix byte order of DCS set/get brightness
Message-ID: <Y8HMB3KDSiUMqtzn@radian>
References: <20230113041848.200704-1-mailingradian@gmail.com>
 <Y8GIL56Ahg1I8WCN@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8GIL56Ahg1I8WCN@ravnborg.org>
X-Mailman-Approved-At: Sat, 14 Jan 2023 11:05:05 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>, Daniel Mentz <danielmentz@google.com>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Richard Acayan <mailingradian@gmail.com>,
 Joel Selvaraj <jo@jsfamily.in>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 13, 2023 at 05:34:55PM +0100, Sam Ravnborg wrote:
> Hi Richard/Daniel.
Not sure if you saw the original commit that I linked.

This patch was written in 2017 for the Pixel 3 and Pixel 3 XL
smartphones. I didn't contact the original author before sending this,
since the kernel that this patch originated from is EOL.

This greeting is still fine because it would be great if the original
author took responsibility for getting this patch applied.

>
> On Thu, Jan 12, 2023 at 11:18:48PM -0500, Richard Acayan wrote:
>> From: Daniel Mentz <danielmentz@google.com>
>> 
>> The MIPI DCS specification demands that brightness values are sent in
>> big endian byte order. It also states that one parameter (i.e. one byte)
>> shall be sent/received for 8 bit wide values, and two parameters shall
>> be used for values that are between 9 and 16 bits wide.
> It is only a few week ago someone write they needed a byteswap to use
> the kernel provided mipi_dsi_dcs_set_display_brightness(). I did not
> realize then that this is because it is buggy.
I didn't even consider sending this patch when I initially saw it. I
would have performed the byte swap in a new S6E3FA7 panel driver just
like in SOFEF00.

>
> Some comments on the patch:
> - It would be nice to split it up so first patch fixes that the
>   parameters are in big-endian. This would go for both set and get.
The brightness is only big endian if it's 16-bit.

Most MIPI panel drivers in the kernel tree only send an 8-bit
brightness, or none at all. For these panels, the brightness can be sent
as a 16-bit integer in little endian, as it has the same effect as an
8-bit integer, with a zero byte appended. The original MIPI brightness
functions work properly with no changes for 8-bit brightness panels
only.

If we want separate 8-bit (original) and 16-bit functions, the 8-bit
functions shouldn't pass the brightness in big endian. That doesn't mean
we shouldn't change them at all.

>
> - Second patch could then introduce the possibility to a driver to
>   use a variant that matches the display.
>   I would suggest to go for two functions:
>   mipi_dsi_dcs_set_display_brightness()
>   mipi_dsi_dcs_set_display_brightness_two()
I'm thinking of a "_large" or "_wide" suffix instead. This would make a
32-bit suffix tricky though, if it is ever needed.

>   So it is obvious when you go for the two byte version without adding a
>   bool parameter.
>   If the implementation is done using a helper or two independent
>   functions are up to you.
These get_display_brightness and set_display_brightness functions are
already helpers. I'll have them duplicated.

>
> The patch split would be nice, but at least we should have two functions
> and not a bool parameter.
Yes, that was a bad idea on my part. With separate functions for 16-bit
brightness, there is no API change, less panel driver touching, and
panel driver changes can happen in separate patches. Thank you for the
suggestion.

> Both patches should have the same Fixes tag.
>
> 	Sam
>
>
>> 
>> Fixes: 1a9d759331b8 ("drm/dsi: Implement DCS set/get display brightness")
>> Signed-off-by: Daniel Mentz <danielmentz@google.com>
>> Change-Id: I24306e21ec6a5ff48ea121d977419a81d5b44152
>> Link: https://android.googlesource.com/kernel/msm/+/754affd62d0ee268c686c53169b1dbb7deac8550
>> [richard: fix 16-bit brightness_get; change brightness call by all panels on the -next tree]
>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>> ---
>>  drivers/gpu/drm/drm_mipi_dsi.c                | 44 ++++++++++++++++---
>>  .../drm/panel/panel-asus-z00t-tm5p5-n35596.c  |  4 +-
>>  .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    |  4 +-
>>  drivers/gpu/drm/panel/panel-ebbg-ft8719.c     |  2 +-
>>  drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c  |  2 +-
>>  .../gpu/drm/panel/panel-jdi-lt070me05000.c    |  4 +-
>>  drivers/gpu/drm/panel/panel-raydium-rm67191.c |  4 +-
>>  .../gpu/drm/panel/panel-samsung-s6e63j0x03.c  |  2 +-
>>  drivers/gpu/drm/panel/panel-samsung-sofef00.c |  4 +-
>>  .../panel/panel-sony-tulip-truly-nt35521.c    |  4 +-
>>  include/drm/drm_mipi_dsi.h                    |  4 +-
>>  11 files changed, 55 insertions(+), 23 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
>> index 497ef4b6a90a..1e6dbf986d97 100644
>> --- a/drivers/gpu/drm/drm_mipi_dsi.c
>> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
>> @@ -1180,17 +1180,33 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_scanline);
>>   *    display
>>   * @dsi: DSI peripheral device
>>   * @brightness: brightness value
>> + * @num_params: Number of parameters (bytes) to encode brightness value in. The
>> + *              MIPI specification states that one parameter shall be sent for
>> + *              devices that support 8-bit brightness levels. For devices that
>> + *              support brightness levels wider than 8-bit, two parameters
>> + *              shall be sent.
>>   *
>>   * Return: 0 on success or a negative error code on failure.
>>   */
>>  int mipi_dsi_dcs_set_display_brightness(struct mipi_dsi_device *dsi,
>> -					u16 brightness)
>> +					u16 brightness, size_t num_params)
>>  {
>> -	u8 payload[2] = { brightness & 0xff, brightness >> 8 };
>> +	u8 payload[2];
>>  	ssize_t err;
>>  
>> +	switch (num_params) {
>> +	case 1:
>> +		payload[0] = brightness & 0xff;
>> +		break;
>> +	case 2:
>> +		payload[0] = brightness >> 8;
>> +		payload[1] = brightness & 0xff;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>>  	err = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
>> -				 payload, sizeof(payload));
>> +				 payload, num_params);
>>  	if (err < 0)
>>  		return err;
>>  
>> @@ -1203,16 +1219,25 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_display_brightness);
>>   *    of the display
>>   * @dsi: DSI peripheral device
>>   * @brightness: brightness value
>> + * @num_params: Number of parameters (i.e. bytes) the brightness value is
>> + *              encoded in. The MIPI specification states that one parameter
>> + *              shall be returned from devices that support 8-bit brightness
>> + *              levels. Devices that support brightness levels wider than
>> + *              8-bit return two parameters (i.e. bytes).
>>   *
>>   * Return: 0 on success or a negative error code on failure.
>>   */
>>  int mipi_dsi_dcs_get_display_brightness(struct mipi_dsi_device *dsi,
>> -					u16 *brightness)
>> +					u16 *brightness, size_t num_params)
>>  {
>> +	u8 payload[2];
>>  	ssize_t err;
>>  
>> +	if (!(num_params == 1 || num_params == 2))
>> +		return -EINVAL;
>> +
>>  	err = mipi_dsi_dcs_read(dsi, MIPI_DCS_GET_DISPLAY_BRIGHTNESS,
>> -				brightness, sizeof(*brightness));
>> +				payload, num_params);
>>  	if (err <= 0) {
>>  		if (err == 0)
>>  			err = -ENODATA;
>> @@ -1220,6 +1245,15 @@ int mipi_dsi_dcs_get_display_brightness(struct mipi_dsi_device *dsi,
>>  		return err;
>>  	}
>>  
>> +	switch (num_params) {
>> +	case 1:
>> +		*brightness = payload[0];
>> +		break;
>> +	case 2:
>> +		*brightness = (payload[0] << 8) | payload[1];
>> +		break;
>> +	}
>> +
>>  	return 0;
>>  }
>>  EXPORT_SYMBOL(mipi_dsi_dcs_get_display_brightness);
>> diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
>> index b3235781e6ba..9f849c68d57c 100644
>> --- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
>> +++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
>> @@ -220,7 +220,7 @@ static int tm5p5_nt35596_bl_update_status(struct backlight_device *bl)
>>  
>>  	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>>  
>> -	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
>> +	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness, 1);
>>  	if (ret < 0)
>>  		return ret;
>>  
>> @@ -237,7 +237,7 @@ static int tm5p5_nt35596_bl_get_brightness(struct backlight_device *bl)
>>  
>>  	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>>  
>> -	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
>> +	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness, 1);
>>  	if (ret < 0)
>>  		return ret;
>>  
>> diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
>> index ad58840eda41..5a0366366055 100644
>> --- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
>> +++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
>> @@ -253,7 +253,7 @@ static int boe_bf060y8m_aj0_bl_update_status(struct backlight_device *bl)
>>  	u16 brightness = backlight_get_brightness(bl);
>>  	int ret;
>>  
>> -	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
>> +	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness, 1);
>>  	if (ret < 0)
>>  		return ret;
>>  
>> @@ -266,7 +266,7 @@ static int boe_bf060y8m_aj0_bl_get_brightness(struct backlight_device *bl)
>>  	u16 brightness;
>>  	int ret;
>>  
>> -	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
>> +	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness, 1);
>>  	if (ret < 0)
>>  		return ret;
>>  
>> diff --git a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
>> index e85d63a176d0..0666e0390c7c 100644
>> --- a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
>> +++ b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
>> @@ -62,7 +62,7 @@ static int ebbg_ft8719_on(struct ebbg_ft8719 *ctx)
>>  
>>  	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>>  
>> -	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x00ff);
>> +	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x00ff, 1);
>>  	if (ret < 0) {
>>  		dev_err(dev, "Failed to set display brightness: %d\n", ret);
>>  		return ret;
>> diff --git a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
>> index d8765b2294fb..47ebf7b7da4a 100644
>> --- a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
>> +++ b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
>> @@ -102,7 +102,7 @@ static int jdi_fhd_r63452_on(struct jdi_fhd_r63452 *ctx)
>>  		return ret;
>>  	}
>>  
>> -	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x00ff);
>> +	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x00ff, 1);
>>  	if (ret < 0) {
>>  		dev_err(dev, "Failed to set display brightness: %d\n", ret);
>>  		return ret;
>> diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
>> index 8f4f137a2af6..7d2f147a2504 100644
>> --- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
>> +++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
>> @@ -332,7 +332,7 @@ static int dsi_dcs_bl_get_brightness(struct backlight_device *bl)
>>  
>>  	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>>  
>> -	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
>> +	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness, 1);
>>  	if (ret < 0)
>>  		return ret;
>>  
>> @@ -348,7 +348,7 @@ static int dsi_dcs_bl_update_status(struct backlight_device *bl)
>>  
>>  	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>>  
>> -	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
>> +	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness, 1);
>>  	if (ret < 0)
>>  		return ret;
>>  
>> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
>> index dbb1ed4efbed..00f6bd163af2 100644
>> --- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
>> +++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
>> @@ -473,7 +473,7 @@ static int rad_bl_get_brightness(struct backlight_device *bl)
>>  
>>  	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>>  
>> -	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
>> +	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness, 1);
>>  	if (ret < 0)
>>  		return ret;
>>  
>> @@ -493,7 +493,7 @@ static int rad_bl_update_status(struct backlight_device *bl)
>>  
>>  	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>>  
>> -	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
>> +	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness, 1);
>>  	if (ret < 0)
>>  		return ret;
>>  
>> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
>> index e06fd35de814..f5e235db7ad2 100644
>> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
>> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
>> @@ -365,7 +365,7 @@ static int s6e63j0x03_enable(struct drm_panel *panel)
>>  		return ret;
>>  
>>  	/* set default white brightness */
>> -	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x00ff);
>> +	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x00ff, 1);
>>  	if (ret < 0)
>>  		return ret;
>>  
>> diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
>> index 1a0d24595faa..b481195c9b8f 100644
>> --- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
>> +++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
>> @@ -224,10 +224,8 @@ static int sofef00_panel_bl_update_status(struct backlight_device *bl)
>>  	u16 brightness;
>>  
>>  	brightness = (u16)backlight_get_brightness(bl);
>> -	// This panel needs the high and low bytes swapped for the brightness value
>> -	brightness = __swab16(brightness);
>>  
>> -	err = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
>> +	err = mipi_dsi_dcs_set_display_brightness(dsi, brightness, 2);
>>  	if (err < 0)
>>  		return err;
>>  
>> diff --git a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
>> index fa9be3c299c0..dbf179fdda88 100644
>> --- a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
>> +++ b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
>> @@ -420,7 +420,7 @@ static int truly_nt35521_bl_update_status(struct backlight_device *bl)
>>  	u16 brightness = backlight_get_brightness(bl);
>>  	int ret;
>>  
>> -	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
>> +	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness, 1);
>>  	if (ret < 0)
>>  		return ret;
>>  
>> @@ -433,7 +433,7 @@ static int truly_nt35521_bl_get_brightness(struct backlight_device *bl)
>>  	u16 brightness;
>>  	int ret;
>>  
>> -	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
>> +	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness, 1);
>>  	if (ret < 0)
>>  		return ret;
>>  
>> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
>> index 4f503d99f668..da02f09f251b 100644
>> --- a/include/drm/drm_mipi_dsi.h
>> +++ b/include/drm/drm_mipi_dsi.h
>> @@ -293,9 +293,9 @@ int mipi_dsi_dcs_set_tear_on(struct mipi_dsi_device *dsi,
>>  int mipi_dsi_dcs_set_pixel_format(struct mipi_dsi_device *dsi, u8 format);
>>  int mipi_dsi_dcs_set_tear_scanline(struct mipi_dsi_device *dsi, u16 scanline);
>>  int mipi_dsi_dcs_set_display_brightness(struct mipi_dsi_device *dsi,
>> -					u16 brightness);
>> +					u16 brightness, size_t num_params);
>>  int mipi_dsi_dcs_get_display_brightness(struct mipi_dsi_device *dsi,
>> -					u16 *brightness);
>> +					u16 *brightness, size_t num_params);
>>  
>>  /**
>>   * mipi_dsi_generic_write_seq - transmit data using a generic write packet
>> -- 
>> 2.39.0
