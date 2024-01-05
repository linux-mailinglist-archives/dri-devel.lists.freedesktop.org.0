Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245458259A7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 19:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F1610E666;
	Fri,  5 Jan 2024 18:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAD910E65D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 18:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704477926;
 bh=uQJ5CDnGDNx+rgzY5LMY9h2PrEsHwPQjkQ2ffCXgmAc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=efk24aoZuX0xCPcK4cwYnRXhQ1ueNI5U8yQ4RGmThNO0rD5BlZQ9K5lUfb1+Q4gTo
 9qF8rBOS9YPpTNiVdtJtpdbEcxhYXJ1kHTE2v0x7kY2rsKBwzbXijXbEanL53r7Lht
 321uAGOuy3nraMQJDbBKzJK22PlSevGagsQovfTtmvO+u/swQtAEBnqe7CvfPixOS0
 olAZ7EmESXAgpxMndisW6o5EhjlIFjMkMJY9hgB8CcYP/9Ba0xdhJPHvGit/Gi1Z4m
 +3i9nVERV9tnGfNhKGtkDeY30FYMBeNd6PEQVVTNR16DruSFL2SdJV7Zxun5qBNRLt
 tAY1G7igJ/1uw==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 81874378003D;
 Fri,  5 Jan 2024 18:05:25 +0000 (UTC)
Message-ID: <056847ff-46f5-44d5-a038-36042a5d2174@collabora.com>
Date: Fri, 5 Jan 2024 20:05:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/rockchip: vop2: Drop unused if_dclk_rate variable
Content-Language: en-US
To: Andy Yan <andy.yan@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240104143951.85219-1-cristian.ciocaltea@collabora.com>
 <20240104143951.85219-2-cristian.ciocaltea@collabora.com>
 <5867171.29KlJPOoH8@diego>
 <b017a3e2-f658-4a95-b972-6ffb87acfdc3@collabora.com>
 <6812a957-dafd-4687-8094-074d8d2b5471@rock-chips.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <6812a957-dafd-4687-8094-074d8d2b5471@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On 1/5/24 11:13, Andy Yan wrote:
> Hi Cristian:
> 
> On 1/5/24 03:12, Cristian Ciocaltea wrote:
>> Hi Heiko,
>>
>> On 1/4/24 17:58, Heiko Stübner wrote:
>>> Hi Christian, Andy,
>>>
>>> Am Donnerstag, 4. Januar 2024, 15:39:50 CET schrieb Cristian Ciocaltea:
>>>> Commit 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
>>>> introduced a variable which ended up being unused.  Remove it.
>>>>
>>>> rockchip_drm_vop2.c:1688:23: warning: variable ‘if_dclk_rate’ set
>>>> but not used [-Wunused-but-set-variable]
>>>>
>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

[...]

>> The current implementation is not able to handle all display modes
>> supported by connected displays, e.g. in my testing environment I
>> encountered issues with 2560x1440-75.00Hz, 2048x1152-60.00Hz,
>> 1024x768-60.00Hz.  Additionally, it doesn't seem to cope well with
>> non-integer refresh rates like 59.94, 29.97, 23.98, etc.
> 
> I think this is because the thee PLL from cru can't divide accurate
> clock for these
> non-integer refresh rates.
>>
>> My temporary workaround relies on using the HDMI PHY PLL in conjunction
>> with a downstream-based hack to compute the clock rates.  I'm not sure
>> that would be an upstreamable solution, so I would let Andy shed some
>> light on the topic.
> 
> Yes, use PLL from HDMI PHY can give more flexible clock rates to support
> more display mode.
> We also use it in our bsp kernel, but one thing should  keep in mind
> that  use HDMI PHY pll
> as dclk source can only work for HDMI 2.0 or bellow, if can't be used in
> hdmi 2.1 mode(such as 4K120),
> so we need to switch the clock source by hdmi work mode.
> 
> The difficult thing is how to make this accepted by upstream.

Thanks for the heads-up!  I will try to have a look as soon as I
finalize the work on HDMI phy & bridge drivers (unfortunately I had to
put it temporarily on hold to focus on different tasks, but I expect to
resume soon).

Regards,
Cristian
