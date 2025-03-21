Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6B7A6B6DA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 10:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DFC10E712;
	Fri, 21 Mar 2025 09:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UF1e4tO0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F4310E712
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 09:19:45 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso11673305e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 02:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742548784; x=1743153584;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iWnR5bCtS2OFl6qMZ2T0dze3z5cvO0emTkA11CaAm0I=;
 b=UF1e4tO0ejUyRdRU2rAwBbhDS2yJEj83yAWdZh03ktBJlho8pLvD9iDACJHQyj+yoc
 +bKSxJnD8z29qFR7aPJ8UqkJQgGAZHHBncusUJ6AeoRTIED7TfeFN1xgVyR7e1+ptFTC
 YNTxI1kI8cx2pVlJgNuDJBBFg+4vPVsss3YM1N96E3KoLnrmOvVAyx5ae59eMfH2EeDk
 hzf9P6nJDUMcGrx123RxCrPtcOJAwV89bXg5Q8ZDfXrMLMGBK0bYpgkDC0yfa4cbT6hF
 0+heswGv7sxElnUiIY+HVzu4AN9UxtVWPi7xkdUG8/Ki2B/pnpwE/NmTUwh/DndQcPmD
 CLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742548784; x=1743153584;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iWnR5bCtS2OFl6qMZ2T0dze3z5cvO0emTkA11CaAm0I=;
 b=TOy9RN7zJdAVsEui5CTIub9E35vwkYak215wyGTINoYp9SNgj8ZMcQ9R9eh/y20B0Y
 5TdlPV6mGVlKlAlzPtsHWNvE4D/NEDslfL3EE8+6dCvcS6uQah+XzfzzMyMzrmsko09d
 3r/GpupI2yA5Rd8hkQrua376WdIAE6k3wyvLlA47Jv9dPxdU0rnc9WTplcVqCWyuNOYD
 5RzMByFH4zxykHlZPB4Ebt/yTNcLTlRmilaxnDGIO9BKo3fkGS2v6S+Bf5tdFfhirApz
 4wfRzlDk+zkq/P1mXa0AVXSPvmj2vdFFnGMKyg+Aa9qlS1F9tZZwaN7Go1UU031lW31h
 8M0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyvVA1DsRLWqSeW/qNVyir6nSy36WHmv7j8B8uNh4pf7ZhDW33eeyk1jtrNlQn7tMI3EZ0usv15Po=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiWohrI9G6SFI1DyVGL9sYyePj+xrk369V/dKhLL5u8ole5Zvh
 GQUWWvNBFLVYWBUT+eFOEEwlqphvfaAuAUZ7/TOvPN6BU++x5JznCb/GmyX1RV4=
X-Gm-Gg: ASbGncup5yeIpumuBGfPFvtllRoOzTmdLBdbsSOW/lMrJA0I0oLQWucjs9RociniCdB
 KeeDWMVhE8Umhc8RTa/SIDKfUQHmAbQMb71hEbjY+msux9HNHxCVM0WXKVhJRNuZaK+JFaTfdMK
 UvUGqbGi8HICGMQX17cKSmFn5qNg4vBXBxKLGjIWpgwyRL2jSoGhfTGuqbLp1fC8eIwmp47aX5L
 BfjQPBIz2mrvBmZKmAwm1t8gBEL3LsgDT0fC5tsaUmhv2UdK3eXbuwLvQrfyrmg4GblRvcwpfSe
 DquRrDJ4LJN+NufmX7CP0yzNGiz3afL/uaEsSmqmh5s8zvVrjBHjCkqk/7Q/eiNKrYWsNlSWhcz
 2b7Bb8VX/s/AhcNl0
X-Google-Smtp-Source: AGHT+IGb4qaiD8zveCmbngoPFmfN9WpLcjDxkx7ItZuEiKJ1uCoRacXpzZp0WPeOAWRPRphRbr45pg==
X-Received: by 2002:a05:600c:1e18:b0:43c:eea9:f45d with SMTP id
 5b1f17b1804b1-43d509f64b8mr23766545e9.18.1742548783913; 
 Fri, 21 Mar 2025 02:19:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:5ee:79d0:2756:9ecd:3e82:43c7?
 ([2a01:e0a:5ee:79d0:2756:9ecd:3e82:43c7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fceae03sm21916245e9.8.2025.03.21.02.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 02:19:43 -0700 (PDT)
Message-ID: <fb72f1f5-dc94-4e33-a20c-d46a081091bc@baylibre.com>
Date: Fri, 21 Mar 2025 10:19:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] drm/panel: startek-kd070fhfid015: add another init
 step
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
References: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
 <20231023-display-support-v8-2-c2dd7b0fb2bd@baylibre.com>
 <d70b62f8-e24e-4a10-8c6b-18d2e19f1337@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <d70b62f8-e24e-4a10-8c6b-18d2e19f1337@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,
Thanks for the fast feedback :)

On 20/03/2025 13:37, AngeloGioacchino Del Regno wrote:
> Il 20/03/25 09:48, Alexandre Mergnat ha scritto:
>> Currently, the panel set power, set gpio and enable the display link
>> in stk_panel_prepare, pointed by drm_panel_funcs.prepare, called by
>> panel_bridge_atomic_pre_enable, pointed by
>> drm_bridge_funcs.atomic_pre_enable. According to the drm_bridge.h,
>> atomic_pre_enable must not enable the display link
>>
>> Since the DSI driver is properly inited by the DRM, the panel try to
>> communicate with the panel before DSI is powered on.
>>
> 
> The panel driver shall still be able to send commands in the .prepare() callback
> and if this is not happening anymore... well, there's a problem!

Sorry I don't think so, according to that def:
	/**
	 * @pre_enable:
	 *
	 * This callback should enable the bridge. It is called right before
	 * the preceding element in the display pipe is enabled. If the
	 * preceding element is a bridge this means it's called before that
	 * bridge's @pre_enable function. If the preceding element is a
	 * &drm_encoder it's called right before the encoder's
	 * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
	 * &drm_encoder_helper_funcs.dpms hook.
	 *
	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
	 * will not yet be running when this callback is called. The bridge must
	 * not enable the display link feeding the next bridge in the chain (if
	 * there is one) when this callback is called.
	 *
	 * The @pre_enable callback is optional.
	 *
	 * NOTE:
	 *
	 * This is deprecated, do not use!
	 * New drivers shall use &drm_bridge_funcs.atomic_pre_enable.
	 */
	void (*pre_enable)(struct drm_bridge *bridge);

	/**
	 * @enable:
	 *
	 * This callback should enable the bridge. It is called right after
	 * the preceding element in the display pipe is enabled. If the
	 * preceding element is a bridge this means it's called after that
	 * bridge's @enable function. If the preceding element is a
	 * &drm_encoder it's called right after the encoder's
	 * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
	 * &drm_encoder_helper_funcs.dpms hook.
	 *
	 * The bridge can assume that the display pipe (i.e. clocks and timing
	 * signals) feeding it is running when this callback is called. This
	 * callback must enable the display link feeding the next bridge in the
	 * chain if there is one.
	 *
	 * The @enable callback is optional.
	 *
	 * NOTE:
	 *
	 * This is deprecated, do not use!
	 * New drivers shall use &drm_bridge_funcs.atomic_enable.
	 */
	void (*enable)(struct drm_bridge *bridge);

=> "The bridge must not enable the display link feeding the next bridge in the
=> chain (if there is one) when this callback is called."

Additionally, you ask for something impossible because here is the init order
fixed by the framework:

[   10.753139] panel_bridge_atomic_pre_enable
[   10.963505] mtk_dsi_bridge_atomic_pre_enable
[   10.963518] mtk_dsi_bridge_atomic_enable
[   10.963527] panel_bridge_atomic_enable
[   10.963532] drm_panel_enable

If panel want to use the DSI link in panel_bridge_atomic_pre_enable, nothing
will happen and  you will get a timeout.

So, IMHO, this patch make sense.

> 
>> To solve that, use stk_panel_enable to enable the display link because
>> it's called after the mtk_dsi_bridge_atomic_pre_enable which is power
>> on the DSI.
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 25 +++++++++++++---------
>>   1 file changed, 15 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c 
>> b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
>> index c0c95355b7435..bc3c4038bf4f5 100644
>> --- a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
>> +++ b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
>> @@ -135,19 +135,9 @@ static int stk_panel_prepare(struct drm_panel *panel)
>>       gpiod_set_value(stk->enable_gpio, 1);
>>       mdelay(20);
>>       gpiod_set_value(stk->reset_gpio, 1);
>> -    mdelay(10);
>> -    ret = stk_panel_init(stk);
>> -    if (ret < 0)
>> -        goto poweroff;
> 
> Also, you're moving both init and set_display_on to the enable callback...
> this is suboptimal.
> 
> You should do the DrIC setup in .prepare() (can include SLEEP OUT), and then you
> should have a .enable() callback that calls DISP ON, a .disable() callback that
> calls DISP OFF, and .unprepare() that turns everything off.

This is not what I understand from the pre_enable's definition above, and also
the function call order by the framework. :)

> 
> Cheers,
> Angelo
> 
>> -
>> -    ret = stk_panel_on(stk);
>> -    if (ret < 0)
>> -        goto poweroff;
>>       return 0;
>> -poweroff:
>> -    regulator_disable(stk->supplies[POWER].consumer);
>>   iovccoff:
>>       regulator_disable(stk->supplies[IOVCC].consumer);
>>       gpiod_set_value(stk->reset_gpio, 0);
>> @@ -156,6 +146,20 @@ static int stk_panel_prepare(struct drm_panel *panel)
>>       return ret;
>>   }
>> +static int stk_panel_enable(struct drm_panel *panel)
>> +{
>> +    struct stk_panel *stk = to_stk_panel(panel);
>> +    int ret;
>> +
>> +    ret = stk_panel_init(stk);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = stk_panel_on(stk);
>> +
>> +    return ret;
>> +}
>> +
>>   static const struct drm_display_mode default_mode = {
>>           .clock = 163204,
>>           .hdisplay = 1200,
>> @@ -239,6 +243,7 @@ drm_panel_create_dsi_backlight(struct mipi_dsi_device *dsi)
>>   }
>>   static const struct drm_panel_funcs stk_panel_funcs = {
>> +    .enable = stk_panel_enable,
>>       .unprepare = stk_panel_unprepare,
>>       .prepare = stk_panel_prepare,
>>       .get_modes = stk_panel_get_modes,
>>
> 
> 
> 

-- 
Regards,
Alexandre
