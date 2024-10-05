Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4719914B2
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 07:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C3710E025;
	Sat,  5 Oct 2024 05:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XC3hqhfw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EC910E025
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2024 05:54:25 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5c87c7d6ad4so3845408a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2024 22:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728107663; x=1728712463; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nqhjtJL2VH9Qi85YDoBXvJqfb6N4tZMSUhtI6I9yzkc=;
 b=XC3hqhfwflvI1qBagoc9UioFsIU/sLO8BXPbSjUw9XlszBUQbITAHrHpwNhdfcVJwZ
 IKZjxaIK8m8KkTAp+1lpmjekU1UWJdVNcq1wZhmesaQDw0JeeaduH1FRMtrbIVG3iaUI
 Jj3IZbYGamUNgC4f4FMZHVvFecdZGuFbcej6vbJLgpI4rLicoDTv12JMgEwkHHCp5lnI
 545P7N7aZ/THl58ACi4pYrZlQgbAu0ORP6M02X/XquSKm8q2nu+ZNZhY/gFNjc5CTvxA
 o8uBV5qBfkl88CrURfJUs0aOtMGK0p5zQuywRNznYbi70sa0GNn0jwtHQCb5MdGPih7w
 l0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728107663; x=1728712463;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nqhjtJL2VH9Qi85YDoBXvJqfb6N4tZMSUhtI6I9yzkc=;
 b=GXgVydwOz63mUwb1MhIkMojIDDdTVvwGFYo6nf096wsk69YGNx5NeY+DApKFu/zsr8
 QPgKNBubQgICCOnPplrQInd7Ic7VJ4CsilxZKcLmdUAB3DcpkeuI8RO9ROs8YgMOahH5
 yZQlNt5DbX1aTVczNbhRmEem1WwzsMQH2IwcGLf1uUQbFgvY2G522p4VKREXNcP+KzwI
 7DhdQNtKo6qwifS/kiTd7rXBgYcNF3ZNNSlGE7BEVTqSZdSZxL/Of5uKpLnAlLPPmVrb
 CtsjTA2go+gx0IctmEj1S5CmWFzV6WKWgSvWlwTNqeKKO468KA/wRSVQoTzq/DLoln5O
 Er+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2Y6eHcLmXioWBhqBBz0pr7NPL4W26XykzCujNbzDueKOeE4Yg5FwQOWoaCLhkRh7jM8513nFCzp0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWS/Rn69a/Ya9m50WuVv0DrdWTiH8fSU5M+bcqjeRc1i5yw4UK
 I8zvPuTGMHQZW0mPd8VmLV1bG6+Bs9QQvrtFI49TeUAAj9RuW13L
X-Google-Smtp-Source: AGHT+IHsJ8wr3XwH1w8eyfs5MO/C+1coYSi6NdpkwFhI5qIBKYCJ789h1+Y8C3OE5KMxygJ3vog3PA==
X-Received: by 2002:a05:6402:354e:b0:5c8:7a0b:2848 with SMTP id
 4fb4d7f45d1cf-5c8d2ee1d08mr3790977a12.36.1728107663248; 
 Fri, 04 Oct 2024 22:54:23 -0700 (PDT)
Received: from [10.50.4.74] ([95.183.227.50]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05acccbsm655755a12.32.2024.10.04.22.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 22:54:22 -0700 (PDT)
Message-ID: <885f3994-49a9-4aff-bbea-11e8a4383719@gmail.com>
Date: Sat, 5 Oct 2024 08:54:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/14] drm/mediatek: Support DRM plane alpha in OVL
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 =?UTF-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "djkurtz@chromium.org" <djkurtz@chromium.org>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "me@adamthiede.com" <me@adamthiede.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "littlecvr@chromium.org" <littlecvr@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?WVQgU2hlbiAo5rKI5bKz6ZyGKQ==?= <Yt.Shen@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
 <20240620-igt-v3-13-a9d62d2e2c7e@mediatek.com>
 <1a3af354-bd15-4219-960e-089b6a6e673c@adamthiede.com>
 <49df03e8b982cc5ee97e09ef9545c1d138c32178.camel@mediatek.com>
 <00ebe9ca262b6a95fd726e5be06334b1e923db02.camel@mediatek.com>
 <5975b361-c1b4-4c57-89d4-0d247ae99d8c@adamthiede.com>
 <272b47f0c9e27268d29b58c341e0b48bce7e8e25.camel@mediatek.com>
 <06ed4527-3749-4fac-bd38-d837f1593311@adamthiede.com>
 <f7b4c6601d648e0eba2dc66f0fe1f34ca3d29cfb.camel@mediatek.com>
Content-Language: en-US
From: Yassine Oudjana <yassine.oudjana@gmail.com>
In-Reply-To: <f7b4c6601d648e0eba2dc66f0fe1f34ca3d29cfb.camel@mediatek.com>
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


On 03/10/2024 8:17 am, Jason-JH Lin (林睿祥) wrote:
>> Jason:
>> That is a lot of information, and quite above my head! Thank you
>> though.
>>
>> I should note that the log items I sent you are from the "good"
>> kernel -
>> 6.11 with the commit reverted. Here is a much longer set of logs:
>> https://termbin.com/co6v
>>
>> I've rebuild 6.11 with the log statement enabled and the "bad"
>> behavior.
>> Here is a dmesg from that: https://termbin.com/xiev
>>
> Hi Adam,
> 
> I think something wrong with your dmesg links, both logs look the same.
> We should see this log in the "bad" one:
> fmt:0x34325258, has_alpha:0x0, alpha:0xffff, con:0x2000
> 
> But anyway, I think the reason for the downgrade is clear enough to me.
> So let's try to figure out the solution.
> 
>> These logs are both from `dmesg`.
>>
>> I'm fairly certain I've built with the patch you referenced enabled.
>> The
>> kernels I run are just release kernels, not RCs or git branches or
>> anything. The mainline v6.11 kernel is the one that has this problem.
>> If
>> that patch has been merged into 6.11 (which, looks like it has) then
>> it's in the kernel I'm building.
> 
> Got it.
> Then OVL_CONST_BLEND might be the unsupported configuration in MT8173,
> I think we should remove the XRGB8888 format for MT8173.

I've carried patches that add MT6735 support in my tree for a while and 
MT6735 broke as well with this patch. Turns out MT6735's OVL doesn't 
have the CONST_BLEND bit. It's highly likely MT8173 also doesn't since 
MT8173's DISPSYS is very similar to MT6735's.

> 
> Could you please try this modification and see if it'll change to use
> others supported format to show the text?
> 
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -102,12 +102,9 @@ static inline bool is_10bit_rgb(u32 fmt)
>   }
> 
>   static const u32 mt8173_formats[] = {
> -       DRM_FORMAT_XRGB8888,
>          DRM_FORMAT_ARGB8888,
> -       DRM_FORMAT_BGRX8888,
>          DRM_FORMAT_BGRA8888,
>          DRM_FORMAT_ABGR8888,
> -       DRM_FORMAT_XBGR8888,
>          DRM_FORMAT_RGB888,
>          DRM_FORMAT_BGR888,
>          DRM_FORMAT_RGB565,
> 
> 
> Regards,
> Jason-JH.Lin
> 
>>
>> - Adam Thiede
