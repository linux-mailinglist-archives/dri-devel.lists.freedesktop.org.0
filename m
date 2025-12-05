Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A231CCA5DDD
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 02:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9F510E9F3;
	Fri,  5 Dec 2025 01:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="SNA1Cp/V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3284.qiye.163.com (mail-m3284.qiye.163.com
 [220.197.32.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDF610E9F3
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 01:59:16 +0000 (UTC)
Received: from [127.0.0.1] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2c0f58c0a;
 Fri, 5 Dec 2025 09:54:09 +0800 (GMT+08:00)
Message-ID: <faa325bb-d125-408c-abb7-d92dcf8664be@rock-chips.com>
Date: Fri, 5 Dec 2025 09:54:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] drm/mcde: Create custom commit tail
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Linus Walleij <linusw@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Vicente Bergas <vicencb@gmail.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
References: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
 <20251202-mcde-drm-regression-thirdfix-v6-2-f1bffd4ec0fa@kernel.org>
 <c3c5f62f-98fd-49a7-9b39-c4c4f798ad2c@rock-chips.com>
 <CAD++jLmzkmZAgwbahKDnasj3dDpG4RBggoZfhPiEHj9rb09+eQ@mail.gmail.com>
 <1284bf23-1069-4d54-b259-7b40271f8e0e@rock-chips.com>
 <2661e992-2233-4c30-b636-a21ad9c21f30@ideasonboard.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <2661e992-2233-4c30-b636-a21ad9c21f30@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9aec37773b03abkunme2a62080ad2250
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUxKSFZDGhlPSBgdGBlMTUJWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=SNA1Cp/VZ1H65lYkBYspZlH9roiRSva5ImnkFVtkIQLe7xfRiKRl2in3HtfpWctJb64GANgnD78SSp4d+6u2YQrAEwUnom/aGwmcHjpkvjPhkTIQ2Tt/RfuzeHBT0dSTZFJg8TRZYCbArfwi6U0Q0alrjqhmAqGUWxfNNP79/a0=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=WdIcGVZuDZpRKCryOJSz8AXGPZWNBLXoc9OkD9ecEe8=;
 h=date:mime-version:subject:message-id:from;
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

Hello Tomi,

On 12/4/2025 9:54 PM, Tomi Valkeinen wrote:
> Hi,
> 
> On 04/12/2025 04:07, Chaoyi Chen wrote:
>> On 12/4/2025 7:13 AM, Linus Walleij wrote:
>>> On Wed, Dec 3, 2025 at 7:27 AM Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
>>>
>>>> The bridge document says: "The display pipe (i.e. clocks and timing
>>>> signals) feeding this bridge will not yet be running when the
>>>> @atomic_pre_enable is called."
>>>>
>>>> Therefore, your approach seems to be merely a workaround and does not
>>>> meet the current requirements of the bridge.
>>>>
>>>> And document also says: "The bridge can assume that the display pipe
>>>> (i.e. clocks and timing signals) feeding it is running when
>>>> @atomic_enable callback is called."
>>>>
>>>> If DSI commands need to wait for the display pipe (CRTC) to be ready,
>>>> why not perform them inside @atomic_enable instead of @atomic_pre_enable?
>>>
>>> That was exactly what the v1 and v2 versions of this patch set was
>>> doing, and it was (politely) NACKed, and that is why we are
>>> here.
>>> https://lore.kernel.org/dri-devel/20251023-fix-mcde-drm-regression-v1-0-ed9a925db8c7@linaro.org/
>>> https://lore.kernel.org/dri-devel/20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org/
>>>
>>
>> Hmm, I'm afraid there really isn't a common solution at this point.
>>
>> The logical enable order of the CRTC, bridge, and panel may be
>> different from the actual physical enable order. And there is no
>> mechanism to change this order :(
> 
> I'm not sure what you mean with logical and physical enable orders...
> But the fact seems to be that during enable sequence different
> platforms, bridges and panels either 1) specifically require an incoming
> stream from the crtc 2) specifically prohibit that, or 3) don't care.
> And we don't have any means to deal with this.
>

Yes, that's exactly what I meant. I'm referring to the fact that the
enable sequence is fixed in terms of code logic, but different 
hardware may have different requirements.

> In this series Linus changes the platforms' crtc to behave in a
> particular way. But if you would connect a bridge or panel to those
> platforms, which specifically does not want incoming stream during
> pre_enable, those wouldn't work.
> 
> In any case, we need to get the current setups working. I made a quick
> test series which:
> - Reverts c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> - Applies patch 1 from this series (with some conflict fixes due to the
> above revert)
> - Implements "pre-enable-before-crtc-enable" for tidss
> 
> This works ok, afaics, and resembles very much the platform patches in
> this series.
> 
> That is a smaller series, and has the potential benefit that if there
> are other platforms that have gotten broken but no one has noticed, they
> would again get fixed.
> 
> Thoughts? Shall I send it, or shall we just go with this series?
> 

Sounds good. I think we should compare the two to see which one is
better. So please send it.

> One more point: even if the platforms in this series get fixed by
> enabling the crtc first, I'm not sure if anyone else but Linus studied
> the platforms to see if it would be possible for the DSI (or DP in one
> case, if I recall right) to work without enabling the DRM crtc.
> 
> I think optimally the control bus should work independently from the
> video data bus. E.g. one should be able to do DSI commands any time
> after the DSI peripheral has been attached to the bridge, even outside
> the enable sequence.
> 
> This could be possible by just enabling some clock on the crtc side, or
> perhaps enabling some bypass clock mode.
> 
> Of course, there could also be other reasons to require/prohibit the
> video stream...

Yep, it all comes down to the hardware design. Different designs can 
naturally have different requirements.

-- 
Best, 
Chaoyi
