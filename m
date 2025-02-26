Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA42CA4607F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 14:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A4A10E91D;
	Wed, 26 Feb 2025 13:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YbNZ6oad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398D110E917
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 13:16:22 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4399ca9d338so42105115e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 05:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740575780; x=1741180580;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+QySj/3gXBapZsSsI8S6n09GzTe+ASut5dxFZ8ln3oQ=;
 b=YbNZ6oadzTR5HiitZnw3TL9rgw3vm4vIqf0C46rGXA4eQ+2U4mx7h+VNd2+w4Mk0vK
 7XJIQ0kIYbBzVU4mEmyt9zYj7CkDosIyDrHFnDPUO3oAsdoXj0+Tq/XbkDDLylrOsm27
 UEkz0ZiHdmrwhwOVgMyHzH5e3LhC3deqPmngiE+4cduzMRtAUiExyoIivGmI693Uf+q8
 bYbVh52URrgeEbzYMAl9hyReN86HmNHokl1Bc9Bntxmo5AHAmlpgXUlE4ulSAK2vqnF8
 W3hBRNy6JKnTgLW/+6cMcyAnPAhHeOax5ORdBje2vsVYplN/OjwJcyQJhDbj8JfRwOxU
 A+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740575780; x=1741180580;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+QySj/3gXBapZsSsI8S6n09GzTe+ASut5dxFZ8ln3oQ=;
 b=WNWMRmeCzZq2hwMJiQSE8WYFaerlMIo5XwyldabzBavH6kL2T9a6O4KSPLWy/meH7t
 AL7MMOpyFaHx2VyKxEOHnoGX8Js1kqF1Fy4XF9ng6SdUWFqn3WlzQ8XLm8YmIb/Or3gt
 JmGgDfaJBruncBxJgUKMGJv4/PoiwrLgBVnVPQl4/aFKonJX/L8+PkylBAO5Vt7NWPP3
 WacD1TWrGIt21kQM3crLrsUxwBqiSx/XBAkxozReST6vON8NbuzuM763GdxYKU8xRNhN
 hTSi9Zi6Sb5dEq19JGSHOMJg5yjtFMm8SYSHvYIKJihTNZW0lAqun+5cD0gDsKFCbZIh
 7yew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHdDoQZJvdptV6ut+TupB0OLIuRB6tBGw4I+t+d5uKTXIZ/qpMnr4FGCN8I8RZZKXkGzcVYR8Wi20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1+2e2DPrAr78w9IGaq9ojNT2ReJbJ2ZarAPHDbKYLXVAFQUWV
 FKed7x8zf+Vq8h+FXANxBVTqVDO5Nofs+Q8PhV6tcStzBf2twk2k1IwF5z9SKH0=
X-Gm-Gg: ASbGnct6IdSQNqRqnVbwVDdCzDHEPoTH6mabdzsUKvLjCdwa5P/FryThb5I2TNQ24rx
 cjgruvJD5KnjrGiBlVuEd4wXpk7CaeszbF2wy/aqVoFmmgEq4eonjmpt4ah2BzmbeiG+rl+rQMX
 rnMKljX84ikEe7SSSQ1v3GLwdDb6H6NoB3QsfURyofC+CCDedQpZ68rbYW6BgU2ZXXOFACiu3BD
 M+cDMRiieEIK9hOrvmA/LytfQsAR3UOcSAXc6o0y5q5yt7gCbsNdlegQRuinA3RjcRkBI45nhKt
 oQGKVJdvXg2iGX7G1MOTh1wrwnfCDgco1gHDtk1ppWAoD4ZqfRTPWEZopu9QdXFZEg==
X-Google-Smtp-Source: AGHT+IHBYfxG0X3yyvWm6nQA9LWy/PfeZqfB8z2wGt61RhxaaQMqUBMKTYu794JfjOFUOpOPcwvA6Q==
X-Received: by 2002:a05:600c:5123:b0:439:88bb:d035 with SMTP id
 5b1f17b1804b1-43ab0f2887dmr70381405e9.5.1740575778320; 
 Wed, 26 Feb 2025 05:16:18 -0800 (PST)
Received: from [192.168.0.172] (88-127-185-231.subs.proxad.net.
 [88.127.185.231]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd86cc96sm5706491f8f.31.2025.02.26.05.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 05:16:17 -0800 (PST)
Message-ID: <8c69314f-b7b9-4ad9-bcf1-6a57645f1335@baylibre.com>
Date: Wed, 26 Feb 2025 14:16:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "will@kernel.org" <will@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
 <20231023-display-support-v7-2-6703f3e26831@baylibre.com>
 <ab3bd050c873bb6cecc00b615b938eabc157cb49.camel@mediatek.com>
 <79477810-00a9-47f1-8282-f8077ea082bb@baylibre.com>
 <3310b6f9-df7a-4769-a221-4a93cc3ec035@collabora.com>
 <0863ee2e-25ed-43b7-a896-e380de828d58@baylibre.com>
 <c2154240-efa1-4c73-aabe-74e938a75af1@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <c2154240-efa1-4c73-aabe-74e938a75af1@collabora.com>
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



On 26/02/2025 12:45, AngeloGioacchino Del Regno wrote:
> Il 26/02/25 12:35, Alexandre Mergnat ha scritto:
>>
>>
>> On 18/02/2025 09:52, AngeloGioacchino Del Regno wrote:
>>> Il 17/02/25 16:03, Alexandre Mergnat ha scritto:
>>>> Hi CK.
>>>>
>>>> On 17/02/2025 08:56, CK Hu (胡俊光) wrote:
>>>>> On Fri, 2025-01-10 at 14:31 +0100, Alexandre Mergnat wrote:
>>>>>> External email : Please do not click links or open attachments until you have verified the 
>>>>>> sender or the content.
>>>>>>
>>>>>>
>>>>>> Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
>>>>>> before mtk_dsi_poweron. lanes_ready flag toggle to true during
>>>>>> mtk_dsi_lane_ready function, and the DSI module is set up during
>>>>>> mtk_dsi_poweron.
>>>>>>
>>>>>> Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
>>>>>> nothing because lanes are considered ready. Unfortunately, when the panel
>>>>>> driver try to communicate, the DSI returns a timeout.
>>>>>>
>>>>>> The solution found here is to put lanes_ready flag to false after the DSI
>>>>>> module setup into mtk_dsi_poweron to init the DSI lanes after the power /
>>>>>> setup of the DSI module.
>>>>>
>>>>> I'm not clear about what happen.
>>>>> I think this DSI flow has worked for a long time.
>>>>> So only some panel has problem?
>>>>
>>>> I don't know if it's related to a specific panel or not.
>>>>
>>>>>
>>>>> And another question.
>>>>> Do you mean mtk_dsi_lane_ready() do some setting to hardware, but lane is not actually ready?
>>>>
>>>> The workflow should be:
>>>> ... | dsi->lanes_ready = false | Power-on | setup dsi lanes | dsi->lanes_ready = true (to avoid 
>>>> re-do dsi lanes setup) | ...
>>>>
>>>> I observe (print function name called + dsi->lanes_ready value):
>>>
>>> Alex, the first poweron is called by mtk_dsi_ddp_start() - and the start callback
>>> is internal to the mediatek-drm driver.
>>>
>>> That callback is called by mtk_crtc during setup and during bridge enable(), and
>>> there we go with suboptimal code design backfiring - instead of using what the
>>> DRM APIs provide, this driver uses something custom *and* the DRM APIs, giving
>>> this issue.
>>>
>>> Part of what mtk_crtc does is duplicated with what the DRM APIs want to do, so
>>> there you go, that's your problem here :-)
>>>
>>> Should I go on with describing the next step(s), or is that obvious for everyone?
>>>
>>> :-)
>>>
>>> Cheers,
>>
>> Ok thanks Angelo.
>> Can you let me know if you agree with this change please ? This should be better:
>>
> 
> No, no, I'm saying that we should do the exact opposite of what you're doing here!
> 
> We should drop the MediaTek custom stuff that duplicates the DRM APIs behavior(s),
> and conform to what the DRM APIs provide and want us to do.
> 
> To be really really clear - I'm saying to delete and avoid using:
> - mtk_dsi_ddp_start()
> - mtk_dsi_ddp_stop()

Ok, that what I though first but when I've tried to remove it, the board hung at boot as described 
in this old patch:

https://patchwork.kernel.org/project/linux-mediatek/patch/1653012007-11854-3-git-send-email-xinlei.lee@mediatek.com/

Even if I do some little change that (like remove mtk_dsi_start) allow me to boot and make DRM 
working for HDMI, DSI still not working at all, I need to do more effort to rework the DSI init.

In my previous suggestion I forgot to say "Since the goal of this serie is to add display support 
for genio 350 but not rework/fix DSI driver, is it reasonable to do a soft fix first and then work 
on another serie about legacy stuff issue?"

> 
> The spirit here should be to use kernel provided APIs, and to make custom stuff
> to disappear as much as possible (again, that mtk_crtc .start/.stop).

> 
> I'm not saying that literally all of the start/stop callbacks for all of the
> MTK DRM drivers should disappear *all at once* but... gradually, one by one,
> these should get lost (where/if possible).
> 
> Just one more mention: that custom handling also backfired on me while writing
> the hdmiv2/dpi drivers... and now backfires on dsi, and in the future it will
> backfire again on something else. It's there only to give problems in the end,
> not to solve them :-)

Is that issue fixed for DPI ? I'm asking because the following struct still used in mtk_ddp_comp.c:

static const struct mtk_ddp_comp_funcs ddp_dpi = {
	.start = mtk_dpi_start,
	.stop = mtk_dpi_stop,
	.encoder_index = mtk_dpi_encoder_index,
};

But maybe what you fixed for hdmiv2/dpi isn't related to this.
Can you link me the patch where you fix that please ? I think that can help me.

I'm 100% agree with you to remove MediaTek custom stuff that duplicates the DRM APIs behavior. The 
genio 350 display support patches has already be stopped and reworked for of graph support, now 
stopped by custom framework issue. What do you think about to validate the "DSI hotfix" to merge the 
whole series and open a dedicated series to cleanup custom start/stop from MTK DRM framework ? I'm 
really asking for your deliberation, not trying to force it when I say I prefer merge this in the 
current state :)

-- 
Regards,
Alexandre
