Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E01C0A8A0BC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 16:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C8310E117;
	Tue, 15 Apr 2025 14:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xhASC/ab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F5010E117
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 14:13:21 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso7310419f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 07:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744726400; x=1745331200;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ydYIOEVwNexwRxCoclKyzypW+xMmV8cmkPxa2XgUDQE=;
 b=xhASC/abbiHGKKuwCVCzN1IyewVizyuJGHkxyKmyagSd4yYkMwa7G+PJba8a/CNnxe
 TD1XMJV06oGu03gLPBpsomlScXFK+eEhwH+T7YAToEn4X+7WnunAB+z6b5qLCWVXvCj8
 Uaf+hzZ5YwNCC7+L6whnfR/WzJyS8GZV5GoHAw0OkFIgsu+LuvUL5zm+CILgwMU0Zfug
 RaV60KcrSUxPF0TJQaXJhrY7W9/tQlALbbySY15R73gBwwfuFrk3nZ4ybrlxsEtaFJrR
 +X3i652eTP496+QZL3xbK7Rvk1oPySNrRLmiXR0nwpYrK5izd2evk497dFTgP6DMwuie
 dzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744726400; x=1745331200;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ydYIOEVwNexwRxCoclKyzypW+xMmV8cmkPxa2XgUDQE=;
 b=N8LkJVuorQ+kDqzk33MQZrQAOLyjtV7JcwG1Ud6YhJlnYVCXKnYTwF6ce/TfxTAKh0
 5yS7ZDuS46IALwe0k292UnwyqdyACxYUi4MWGEf4ibBJ5hq6yO5aMsRh8b3pvxEZGm+c
 NJ8mVzL9fO/i9bzk1jXtvQ06d7lWA9IYuJEIDre/Ye6srYhSIMo3/xX34Eh0A/0Eh1jt
 UKjq8LQYdwR/yurO0aR6vFRGvZhHOudPKk0QXPsXR6rPwBPI2j927olGxl1L6bGweTc/
 SV6QBaf8VdsAnJkhe7Ob1AnDLLQDxwOxv4gQlwznbmdD+p37iSFY/0RD6rnSZqHVNIen
 mMhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/sfftZNE6lvJ20Ia64eqkGGogj1ChOf3okTLDnYOIFWq0cH2HcRV4fhcOTezE8TrRVxjINxhImWE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/1H07/pFDSej61rKbMJ0/ApGHv4aRIVqbmyvHldt1qGqmaSk6
 wmOHsndbE7BVD86DUID0C2bZkafYWvLfas8IY1l9um/DpFUEXMMmVXDsWvz2K5w=
X-Gm-Gg: ASbGnctb6uDEIbHSHDxoCb1YLbueQ5bVEvgV9Pi4IUdjCABPIiKA/VCLm1SAGdQELFG
 CrCqJo33x5x8WqqYYz2BoNGM92kYbuh07dl0vYEXY2zHgW/CBkPIfuljY2PYfG6KneMDars1fYo
 UNvOy+92CBdGmp62SSIWQzac1/eWgLtCa8AXyrrwF2gJk6Auml0yKmwG0TG3Veagt3MsK1dtuse
 pG5Yqo1aIZRnL068TYvENCDtxfMj1yu8jOPDusdMtKHQjLPURnq1TMn4HJR3pxFmZ7Bfbwso3ir
 6WxfHjXJS4IVxVB5iphAvJE3DIFDnOAo5bBauvc4E5QXTIfn04Gh/xISI2s70kKfQEQMQ6E+
X-Google-Smtp-Source: AGHT+IHJqCY80YdOi+QlRhbGQ2nBFJTmvFU9QJ/edLr9k+dp/3F0x7XFYeygRdayk8s5vjatDuOCHg==
X-Received: by 2002:a05:6000:1aca:b0:39a:ca59:a626 with SMTP id
 ffacd0b85a97d-39ea5211c2amr13165981f8f.28.1744726399630; 
 Tue, 15 Apr 2025 07:13:19 -0700 (PDT)
Received: from [10.1.5.76] (88-127-129-70.subs.proxad.net. [88.127.129.70])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f23572d43sm205220905e9.31.2025.04.15.07.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 07:13:19 -0700 (PDT)
Message-ID: <1ed38e6b-8d43-4cbc-9c27-58ec3c0e4dbc@baylibre.com>
Date: Tue, 15 Apr 2025 16:13:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] drm/panel: startek-kd070fhfid015: add another init
 step
From: Alexandre Mergnat <amergnat@baylibre.com>
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
 <fb72f1f5-dc94-4e33-a20c-d46a081091bc@baylibre.com>
Content-Language: en-US
In-Reply-To: <fb72f1f5-dc94-4e33-a20c-d46a081091bc@baylibre.com>
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

Gentle ping

Let me shortly summarize my problem: I see the panel driver sending commands to the display before 
it is ready. My approach to prevent that is to delay sending commands until bridge enable. Your 
concern was that during the panel's .prepare() the panel driver should already be able to send 
commands through the bridge. Can you please clarify what you think should be the approach to fix that?

Regards,
Alexandre

On 21/03/2025 10:19, Alexandre Mergnat wrote:
> Hi Angelo,
> Thanks for the fast feedback :)
> 
> On 20/03/2025 13:37, AngeloGioacchino Del Regno wrote:
>> Il 20/03/25 09:48, Alexandre Mergnat ha scritto:
>>> Currently, the panel set power, set gpio and enable the display link
>>> in stk_panel_prepare, pointed by drm_panel_funcs.prepare, called by
>>> panel_bridge_atomic_pre_enable, pointed by
>>> drm_bridge_funcs.atomic_pre_enable. According to the drm_bridge.h,
>>> atomic_pre_enable must not enable the display link
>>>
>>> Since the DSI driver is properly inited by the DRM, the panel try to
>>> communicate with the panel before DSI is powered on.
>>>
>>
>> The panel driver shall still be able to send commands in the .prepare() callback
>> and if this is not happening anymore... well, there's a problem!
> 
> Sorry I don't think so, according to that def:
>      /**
>       * @pre_enable:
>       *
>       * This callback should enable the bridge. It is called right before
>       * the preceding element in the display pipe is enabled. If the
>       * preceding element is a bridge this means it's called before that
>       * bridge's @pre_enable function. If the preceding element is a
>       * &drm_encoder it's called right before the encoder's
>       * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
>       * &drm_encoder_helper_funcs.dpms hook.
>       *
>       * The display pipe (i.e. clocks and timing signals) feeding this bridge
>       * will not yet be running when this callback is called. The bridge must
>       * not enable the display link feeding the next bridge in the chain (if
>       * there is one) when this callback is called.
>       *
>       * The @pre_enable callback is optional.
>       *
>       * NOTE:
>       *
>       * This is deprecated, do not use!
>       * New drivers shall use &drm_bridge_funcs.atomic_pre_enable.
>       */
>      void (*pre_enable)(struct drm_bridge *bridge);
> 
>      /**
>       * @enable:
>       *
>       * This callback should enable the bridge. It is called right after
>       * the preceding element in the display pipe is enabled. If the
>       * preceding element is a bridge this means it's called after that
>       * bridge's @enable function. If the preceding element is a
>       * &drm_encoder it's called right after the encoder's
>       * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
>       * &drm_encoder_helper_funcs.dpms hook.
>       *
>       * The bridge can assume that the display pipe (i.e. clocks and timing
>       * signals) feeding it is running when this callback is called. This
>       * callback must enable the display link feeding the next bridge in the
>       * chain if there is one.
>       *
>       * The @enable callback is optional.
>       *
>       * NOTE:
>       *
>       * This is deprecated, do not use!
>       * New drivers shall use &drm_bridge_funcs.atomic_enable.
>       */
>      void (*enable)(struct drm_bridge *bridge);
> 
> => "The bridge must not enable the display link feeding the next bridge in the
> => chain (if there is one) when this callback is called."
> 
> Additionally, you ask for something impossible because here is the init order
> fixed by the framework:
> 
> [   10.753139] panel_bridge_atomic_pre_enable
> [   10.963505] mtk_dsi_bridge_atomic_pre_enable
> [   10.963518] mtk_dsi_bridge_atomic_enable
> [   10.963527] panel_bridge_atomic_enable
> [   10.963532] drm_panel_enable
> 
> If panel want to use the DSI link in panel_bridge_atomic_pre_enable, nothing
> will happen and  you will get a timeout.
> 
> So, IMHO, this patch make sense.
> 
>>
>>> To solve that, use stk_panel_enable to enable the display link because
>>> it's called after the mtk_dsi_bridge_atomic_pre_enable which is power
>>> on the DSI.
>>>
>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>> ---
>>>   .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 25 +++++++++++++---------
>>>   1 file changed, 15 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c 
>>> b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
>>> index c0c95355b7435..bc3c4038bf4f5 100644
>>> --- a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
>>> +++ b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
>>> @@ -135,19 +135,9 @@ static int stk_panel_prepare(struct drm_panel *panel)
>>>       gpiod_set_value(stk->enable_gpio, 1);
>>>       mdelay(20);
>>>       gpiod_set_value(stk->reset_gpio, 1);
>>> -    mdelay(10);
>>> -    ret = stk_panel_init(stk);
>>> -    if (ret < 0)
>>> -        goto poweroff;
>>
>> Also, you're moving both init and set_display_on to the enable callback...
>> this is suboptimal.
>>
>> You should do the DrIC setup in .prepare() (can include SLEEP OUT), and then you
>> should have a .enable() callback that calls DISP ON, a .disable() callback that
>> calls DISP OFF, and .unprepare() that turns everything off.
> 
> This is not what I understand from the pre_enable's definition above, and also
> the function call order by the framework. :)
> 
>>
>> Cheers,
>> Angelo
>>
>>> -
>>> -    ret = stk_panel_on(stk);
>>> -    if (ret < 0)
>>> -        goto poweroff;
>>>       return 0;
>>> -poweroff:
>>> -    regulator_disable(stk->supplies[POWER].consumer);
>>>   iovccoff:
>>>       regulator_disable(stk->supplies[IOVCC].consumer);
>>>       gpiod_set_value(stk->reset_gpio, 0);
>>> @@ -156,6 +146,20 @@ static int stk_panel_prepare(struct drm_panel *panel)
>>>       return ret;
>>>   }
>>> +static int stk_panel_enable(struct drm_panel *panel)
>>> +{
>>> +    struct stk_panel *stk = to_stk_panel(panel);
>>> +    int ret;
>>> +
>>> +    ret = stk_panel_init(stk);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    ret = stk_panel_on(stk);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>>   static const struct drm_display_mode default_mode = {
>>>           .clock = 163204,
>>>           .hdisplay = 1200,
>>> @@ -239,6 +243,7 @@ drm_panel_create_dsi_backlight(struct mipi_dsi_device *dsi)
>>>   }
>>>   static const struct drm_panel_funcs stk_panel_funcs = {
>>> +    .enable = stk_panel_enable,
>>>       .unprepare = stk_panel_unprepare,
>>>       .prepare = stk_panel_prepare,
>>>       .get_modes = stk_panel_get_modes,
>>>
>>
>>
>>
> 

