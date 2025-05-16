Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DD7AB9C9C
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 14:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C135510EAAC;
	Fri, 16 May 2025 12:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sblV4PvA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE79010EAAC
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 12:52:02 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a1f5d2d91eso1342311f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 05:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747399921; x=1748004721;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SkhtV/yR70PbpptRrqkkbeTOl+tTltOONXJo2gqzfWw=;
 b=sblV4PvA8sxUoimdH5XnodCUq7COHc0rvomj9F527paXT+3XY0uDdFegZiKytIO5nT
 Qnadu8vEdyZ8d4y05nfvq+JSoASdVrn6G2xv0zZtlSfgBEvWdo3N0sVY/F+rFAaODlh9
 yw0HFZSF8pS6s+HDUsMmeSOn6QSmGJXMOLgM4FSa/17f2QHO7O6I3XWne2bfSjkmlzG8
 NrfZdEtML/FmBEsH9YKmKtzmmR9gdtEllYb67u2293yKJIbUZG5s3+ZP5i4o2nKhAXL2
 2z+1kewLyLP8s9Uq6ghuL4klVJMtKoPhdjMW3jFXT6iD6pQ0ORMFpf5lwt0zBEZj3/TM
 Iu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747399921; x=1748004721;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SkhtV/yR70PbpptRrqkkbeTOl+tTltOONXJo2gqzfWw=;
 b=Y8oppt13KLsrxWpw5trQ5RrxaxkKH6TAHr1oS7VCqLdlDN4Q1XvLSKcWxv0m3NQ829
 7RVugxP0kQBnNow2mvvxlUx75S+aSOZB/HZ0XNnb7wXNjkkF7wtwc/f36Kd5dQrlvVyj
 vcx7p81lcV3wU0Z4DYEsBp9I/GyuhNkQW5uMRFCrxWojY8xo4ZPPcJ4iZsGNesuX/gQt
 KraAlePTrBMNvuW8gL0Zae76BQ98hGBIoMzfUpN0Hf9HcEsR88QGkVJ1YD96xgCF4B0A
 6NfYIkYtQaz0FUd0aEX/5VeY9eZMGBoZHQmrA8WukRLGsMvYGhXx/WfCuJa8D+sr6YRY
 9Gvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhCOEa8kt0nAvroCth9gG3IHRLDCRiKTB9Wl74K5g5sYE5em3+/L4noZ7ckwhSpfnBKpxuG6+eQoQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxngPZUD2klVrWRKA3rZzWeYasLr+Ne2Fn/YkMK2gpNYfhaXCLY
 82cEBx2EJxeu5saPeuq6lA0RP9XIHdlz/1L2AvY/l7aeU+Ey8CkrH2iPJwS6Ul4+Rq8=
X-Gm-Gg: ASbGnct7kRhYWYmRiNHa94FUleDD0V8xttnO/Ki+P7AKtkM8Kr4RG+iwC595ouN0wgl
 z4p7issGBbqe6Gv4KgoLAUebmvRjl6DWR7qnTh46oMGolDtlztE6rRBbjDNRVJKeGvt4wAZ3koB
 7s5sz3RXTN3s7WWWgEbWdKoBWt1vB5xEI4YllQ34o2u9LJ4TQ70W1dqST6d3xYUvyVeH7ZumaQR
 jhS/sINwaMLe1fpe7kCUk3nicK6kEc3o+a4+JiBeVwkYgXMhpyLh0XYMSKCsZMW9tUz4ybgWEFP
 mvByS50cjJdBE4Bhw1KIyb+/WT1aqQWiXTRg4uHQyg0EMxDC0CfI8ItC1+SPnLaOawh4RQyFL3H
 XoQRTjSwXmjWo090=
X-Google-Smtp-Source: AGHT+IGdhc6dnDwS4Qe34zF+uosmrtcYAXvlLyhDqwPhuUphw4e3Teapb5H1D+3BckztCOlzhLPH+g==
X-Received: by 2002:a5d:5849:0:b0:3a1:f654:b84e with SMTP id
 ffacd0b85a97d-3a35c845c23mr3359297f8f.55.1747399921028; 
 Fri, 16 May 2025 05:52:01 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net.
 [88.127.185.231]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca88985sm2819043f8f.63.2025.05.16.05.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 05:52:00 -0700 (PDT)
Message-ID: <94982f07-504e-439a-89b4-02a73d69bf7c@baylibre.com>
Date: Fri, 16 May 2025 14:51:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alexandre Mergnat <amergnat@baylibre.com>
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
 <fb72f1f5-dc94-4e33-a20c-d46a081091bc@baylibre.com>
 <1ed38e6b-8d43-4cbc-9c27-58ec3c0e4dbc@baylibre.com>
 <d38921cc-a565-4a79-9ecb-bfba85c3ab25@collabora.com>
Content-Language: en-US
In-Reply-To: <d38921cc-a565-4a79-9ecb-bfba85c3ab25@collabora.com>
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

On 15/04/2025 16:46, AngeloGioacchino Del Regno wrote:
> Il 15/04/25 16:13, Alexandre Mergnat ha scritto:
>> Hi Angelo,
>>
>> Gentle ping
>>
>> Let me shortly summarize my problem: I see the panel driver sending commands to the display before 
>> it is ready. My approach to prevent that is to delay sending commands until bridge enable. Your 
>> concern was that during the panel's .prepare() the panel driver should already be able to send 
>> commands through the bridge. Can you please clarify what you think should be the approach to fix 
>> that?
>>
> 
> Please don't top post.
> 
> Anyway - sorry but I missed your reply, that wasn't intentional - thanks for the
> ping (or I wouldn't have replied, duh!).
> 
> What is not ready? The Startek display or the MediaTek display controller?
> 

MediaTek display controller (DSI)

> The display controller shall be able to send commands when the *panel*'s .prepare()
> callback gets executed - if not, there's something wrong at the display controller
> side (driver).
> 

It's explained at the end.

> You're probably getting confused by the bridge en/disable callbacks, btw... please
> check include/drm/drm_panel.h, struct drm_panel_funcs.
> 

panel_bridge_atomic_pre_enable => drm_panel_prepare => (drm_panel_funcs.prepare) stk_panel_prepare
panel_bridge_atomic_enable => drm_panel_enable => (drm_panel_funcs.enable) stk_panel_enable

The bridge en/disable callbacks call panel and DSI enable/disable callbacks, they are linked.

> In short, the panel's prepare() should be used for whatever setup is required by
> the panel to become available to *receive the video transmission* from the display
> controller: this implies that if the panel needs DSI commands for setup, this is
> allowed and it's a perfectly fine case.
> 
> So, if you are unable to "turn the panel on and wait for it to become ready" in
> the panel's .prepare() callback, there's something wrong either in your panel
> driver, on in the display controller (the DSI driver) instead.
> 
> Since this wasn't happening before your mtk_dsi cleanup, this probably means that
> the cleanup is done wrong - and that removing the .start/.stop custom callbacks
> from that driver needs you to do something more than just that in order to avoid
> regressions.
> 

Here the current call order:
[   13.715959] mtk_dsi_ddp_start ( => dsi poweron)
[   13.716797] stk_panel_prepare ( => panel poweron + enable)
[   13.939473] mtk_dsi_bridge_atomic_pre_enable ( => dsi poweron)
[   13.939488] mtk_output_dsi_enable ( => dsi enable)

As you can see, dsi poweron is called twice. According to your comment [1] asking me to remove
custom init function in favor of DRM API call, I've removed "mtk_dsi_ddp_start". Since I don't
find any API to poweron DSI before stk_panel_prepare call, it has been split to do enable
sequence after DSI poweron+enable, because it requiere mipi dsi interface enabled to do
panel enable.

Patched solution:
[   14.164136] stk_panel_prepare ( => panel poweron)
[   14.213300] mtk_dsi_bridge_atomic_pre_enable ( => dsi poweron)
[   14.213623] mtk_output_dsi_enable ( => dsi enable)
[   14.215116] stk_panel_enable ( => panel enable)

The prepare/enable order is fixed by the DRM framework [2]

We still misaligned about the panel's prepare() should be, but even if I try to implement
whatever setup is required by the panel to become available to *receive the video
transmission* from the display controller, the DRM init order doesn't allow it.
I can move stk_panel_prepare content into stk_panel_enable if you prefer, but it's less clean
IMHO because I like to have a first callback for HW/power setup, and a second callback for SW
setup, which fit with bridge callback descriptions.
I don't see a better way to cleanup custom init, and my apologies for your time if I missed something.

[1]: https://lore.kernel.org/all/c2154240-efa1-4c73-aabe-74e938a75af1@collabora.com/
[2]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/drm_bridge.c#n769

> Unfortunately, I'm pretty busy these days, otherwise I would've gladly made some
> research to try and give you some more hints.. but eh :-)
> 
> Cheers,
> Angelo
> 
>> Regards,
>> Alexandre
>>
>> On 21/03/2025 10:19, Alexandre Mergnat wrote:
>>> Hi Angelo,
>>> Thanks for the fast feedback :)
>>>
>>> On 20/03/2025 13:37, AngeloGioacchino Del Regno wrote:
>>>> Il 20/03/25 09:48, Alexandre Mergnat ha scritto:
>>>>> Currently, the panel set power, set gpio and enable the display link
>>>>> in stk_panel_prepare, pointed by drm_panel_funcs.prepare, called by
>>>>> panel_bridge_atomic_pre_enable, pointed by
>>>>> drm_bridge_funcs.atomic_pre_enable. According to the drm_bridge.h,
>>>>> atomic_pre_enable must not enable the display link
>>>>>
>>>>> Since the DSI driver is properly inited by the DRM, the panel try to
>>>>> communicate with the panel before DSI is powered on.
>>>>>
>>>>
>>>> The panel driver shall still be able to send commands in the .prepare() callback
>>>> and if this is not happening anymore... well, there's a problem!
>>>
>>> Sorry I don't think so, according to that def:
>>>      /**
>>>       * @pre_enable:
>>>       *
>>>       * This callback should enable the bridge. It is called right before
>>>       * the preceding element in the display pipe is enabled. If the
>>>       * preceding element is a bridge this means it's called before that
>>>       * bridge's @pre_enable function. If the preceding element is a
>>>       * &drm_encoder it's called right before the encoder's
>>>       * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
>>>       * &drm_encoder_helper_funcs.dpms hook.
>>>       *
>>>       * The display pipe (i.e. clocks and timing signals) feeding this bridge
>>>       * will not yet be running when this callback is called. The bridge must
>>>       * not enable the display link feeding the next bridge in the chain (if
>>>       * there is one) when this callback is called.
>>>       *
>>>       * The @pre_enable callback is optional.
>>>       *
>>>       * NOTE:
>>>       *
>>>       * This is deprecated, do not use!
>>>       * New drivers shall use &drm_bridge_funcs.atomic_pre_enable.
>>>       */
>>>      void (*pre_enable)(struct drm_bridge *bridge);
>>>
>>>      /**
>>>       * @enable:
>>>       *
>>>       * This callback should enable the bridge. It is called right after
>>>       * the preceding element in the display pipe is enabled. If the
>>>       * preceding element is a bridge this means it's called after that
>>>       * bridge's @enable function. If the preceding element is a
>>>       * &drm_encoder it's called right after the encoder's
>>>       * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
>>>       * &drm_encoder_helper_funcs.dpms hook.
>>>       *
>>>       * The bridge can assume that the display pipe (i.e. clocks and timing
>>>       * signals) feeding it is running when this callback is called. This
>>>       * callback must enable the display link feeding the next bridge in the
>>>       * chain if there is one.
>>>       *
>>>       * The @enable callback is optional.
>>>       *
>>>       * NOTE:
>>>       *
>>>       * This is deprecated, do not use!
>>>       * New drivers shall use &drm_bridge_funcs.atomic_enable.
>>>       */
>>>      void (*enable)(struct drm_bridge *bridge);
>>>
>>> => "The bridge must not enable the display link feeding the next bridge in the
>>> => chain (if there is one) when this callback is called."
>>>
>>> Additionally, you ask for something impossible because here is the init order
>>> fixed by the framework:
>>>
>>> [   10.753139] panel_bridge_atomic_pre_enable
>>> [   10.963505] mtk_dsi_bridge_atomic_pre_enable
>>> [   10.963518] mtk_dsi_bridge_atomic_enable
>>> [   10.963527] panel_bridge_atomic_enable
>>> [   10.963532] drm_panel_enable
>>>
>>> If panel want to use the DSI link in panel_bridge_atomic_pre_enable, nothing
>>> will happen and  you will get a timeout.
>>>
>>> So, IMHO, this patch make sense.
>>>
>>>>
>>>>> To solve that, use stk_panel_enable to enable the display link because
>>>>> it's called after the mtk_dsi_bridge_atomic_pre_enable which is power
>>>>> on the DSI.
>>>>>
>>>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>>>> ---
>>>>>   .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 25 +++++++++++++---------
>>>>>   1 file changed, 15 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c b/drivers/gpu/ 
>>>>> drm/panel/panel-startek-kd070fhfid015.c
>>>>> index c0c95355b7435..bc3c4038bf4f5 100644
>>>>> --- a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
>>>>> +++ b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
>>>>> @@ -135,19 +135,9 @@ static int stk_panel_prepare(struct drm_panel *panel)
>>>>>       gpiod_set_value(stk->enable_gpio, 1);
>>>>>       mdelay(20);
>>>>>       gpiod_set_value(stk->reset_gpio, 1);
>>>>> -    mdelay(10);
>>>>> -    ret = stk_panel_init(stk);
>>>>> -    if (ret < 0)
>>>>> -        goto poweroff;
>>>>
>>>> Also, you're moving both init and set_display_on to the enable callback...
>>>> this is suboptimal.
>>>>
>>>> You should do the DrIC setup in .prepare() (can include SLEEP OUT), and then you
>>>> should have a .enable() callback that calls DISP ON, a .disable() callback that
>>>> calls DISP OFF, and .unprepare() that turns everything off.
>>>
>>> This is not what I understand from the pre_enable's definition above, and also
>>> the function call order by the framework. :)
>>>
>>>>
>>>> Cheers,
>>>> Angelo
>>>>
>>>>> -
>>>>> -    ret = stk_panel_on(stk);
>>>>> -    if (ret < 0)
>>>>> -        goto poweroff;
>>>>>       return 0;
>>>>> -poweroff:
>>>>> -    regulator_disable(stk->supplies[POWER].consumer);
>>>>>   iovccoff:
>>>>>       regulator_disable(stk->supplies[IOVCC].consumer);
>>>>>       gpiod_set_value(stk->reset_gpio, 0);
>>>>> @@ -156,6 +146,20 @@ static int stk_panel_prepare(struct drm_panel *panel)
>>>>>       return ret;
>>>>>   }
>>>>> +static int stk_panel_enable(struct drm_panel *panel)
>>>>> +{
>>>>> +    struct stk_panel *stk = to_stk_panel(panel);
>>>>> +    int ret;
>>>>> +
>>>>> +    ret = stk_panel_init(stk);
>>>>> +    if (ret < 0)
>>>>> +        return ret;
>>>>> +
>>>>> +    ret = stk_panel_on(stk);
>>>>> +
>>>>> +    return ret;
>>>>> +}
>>>>> +
>>>>>   static const struct drm_display_mode default_mode = {
>>>>>           .clock = 163204,
>>>>>           .hdisplay = 1200,
>>>>> @@ -239,6 +243,7 @@ drm_panel_create_dsi_backlight(struct mipi_dsi_device *dsi)
>>>>>   }
>>>>>   static const struct drm_panel_funcs stk_panel_funcs = {
>>>>> +    .enable = stk_panel_enable,
>>>>>       .unprepare = stk_panel_unprepare,
>>>>>       .prepare = stk_panel_prepare,
>>>>>       .get_modes = stk_panel_get_modes,
>>>>>
>>>>
>>>>
>>>>
>>>
>>
> 

-- 
Regards,
Alexandre
