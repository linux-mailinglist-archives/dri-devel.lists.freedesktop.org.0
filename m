Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D878FC7C6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 11:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DCA10E08A;
	Wed,  5 Jun 2024 09:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VV+64UOU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDF010E08A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 09:28:45 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-35dce6102f4so1771565f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 02:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717579723; x=1718184523; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=9aZp3wyE5ekzsTIWHpWbrt8XuH/G5p0iFSTouqyj9Bg=;
 b=VV+64UOU5+A1lwlAzuQcbXvvJjpflAQ30NxwavuKmu+vZNkZN8sZ/29jnsuMyMk+yf
 E3tTNW3ncVWMzMj30zcRumwVZXkqXTUp33fVbQEUdAe1OWCRVcHskODYHdb/16IJ/SPx
 +hCdNBJ4yJYFZACzBbAKTYORy1YYIB6AFLiMBZlTuzMK6Iy80qSf1Z+rWdNCa3rHFVPl
 in8OiBwbzTx3DTsXpJnNpcVxqs5Bazqsh0xYbgpZ9Tt/0ObqTN7DIgTizburnEyrX/WI
 zBWRx+HFdBQl+TaFOm6Z+0Af5g8LSfpc1x1stUtL0UyLCB7bW+J0/haNLFkJIhIgqmFU
 S/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717579723; x=1718184523;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9aZp3wyE5ekzsTIWHpWbrt8XuH/G5p0iFSTouqyj9Bg=;
 b=jbv2/SX70b/QD1Qk17yC7H9xKQwzy9iFQsEkqUUWj37qTqB1GxnyLXrAkP3CJV7Ghf
 pdxmx/rxDMzuNraj8g26dEScKlysaWhjWiOA4LyjPKWfLCkkyI+OrvKaM4NWJGgADW20
 b8Zh1Mdxl8/p6UT75aq6/DQwskgQ/xW3MBXQ5nyA6xiijZN1JZyJnpyjevfz+6Qr9rqx
 NZ8tHUIqm6iYfd11Q9kpoHB81rvi4EbP5isdiX/3yGY7hQ9uYne2u36evkf6FUF/RD/7
 k62jxSr6Yl2o8Tl527MiNF+G4WrKD1pOXDKZ8GVPUnQtEY52PwbPZ/HLUxapujYq7+38
 9OMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1E3FAlYWFJi82U0w0gZbAZMIie4Wvy05k6MJDGRiccRVNDa7Htvqh5Gqsc1KMAkE7ht4/t/gYm/VXA8RNDx7d3M6MYXInGm/70Bz1Etps
X-Gm-Message-State: AOJu0YwX7NkHQZkSpX+kGGhLC1NUeFUDdfVUAaX1UKGn927VIdRSI8A2
 4v6EpV53vgauaqwbObyC8mVdxaNOkeBPjx/AiLQi4xH86WTskuduiuoF9aESZdI=
X-Google-Smtp-Source: AGHT+IG4DNIDSVe9T92rRq3LMxr5LieWsgduZLuBSwgYLoAnxR2RRrOizcT2CkEWD5xDDP8HNuZKsg==
X-Received: by 2002:a5d:4645:0:b0:35d:ca3b:4d11 with SMTP id
 ffacd0b85a97d-35e8ef97043mr1413209f8f.61.1717579723202; 
 Wed, 05 Jun 2024 02:28:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c7ce:7756:462d:a8bd?
 ([2a01:e0a:982:cbb0:c7ce:7756:462d:a8bd])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064aa6csm13842822f8f.93.2024.06.05.02.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 02:28:42 -0700 (PDT)
Message-ID: <01bde68a-88a7-46eb-860c-1375aa730bec@linaro.org>
Date: Wed, 5 Jun 2024 11:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 00/14] Add initial support for the Rockchip RK3588 HDMI TX
 Controller
To: Andy Yan <andyshrk@163.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>,
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
 <a4b22708-e85d-448a-8145-244b49bca053@linaro.org>
 <ab0a6372-091b-4293-8907-a4b3ff4845c0@rock-chips.com>
 <11359776.NyiUUSuA9g@phil> <ef60403f-078f-411a-867b-9b551e863f56@linaro.org>
 <b8066150-c147-4eb6-9f7a-2bd0268c274e@collabora.com>
 <4456bc5a.9b2d.18fe7b76790.Coremail.andyshrk@163.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <4456bc5a.9b2d.18fe7b76790.Coremail.andyshrk@163.com>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 05/06/2024 11:25, Andy Yan wrote:
> 
> Hi,
> 
> At 2024-06-05 04:33:57, "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com> wrote:
>> On 6/3/24 4:08 PM, neil.armstrong@linaro.org wrote:
>>> Hi,
>>>
>>> On 03/06/2024 15:03, Heiko Stuebner wrote:
>>>> Am Montag, 3. Juni 2024, 14:14:17 CEST schrieb Andy Yan:
>>>>> Hi Neil:
>>>>>
>>>>> On 6/3/24 16:55, Neil Armstrong wrote:
>>>>>> Hi Christian,
>>>>>>
>>>>>> On 01/06/2024 15:12, Cristian Ciocaltea wrote:
>>>>>>> The RK3588 SoC family integrates a Quad-Pixel (QP) variant of the
>>>>>>> Synopsys DesignWare HDMI TX controller used in the previous SoCs.
>>>>>>>
>>>>>>> It is HDMI 2.1 compliant and supports the following features, among
>>>>>>> others:
>>>>>>>
>>>>>> .
>>>>>>
>>>>>> ..
>>>>>>
>>>>>>> * SCDC I2C DDC access
>>>>>>> * TMDS Scrambler enabling 2160p@60Hz with RGB/YCbCr4:4:4
>>>>>>> * YCbCr4:2:0 enabling 2160p@60Hz at lower HDMI link speeds
>>>>>>> * Multi-stream audio
>>>>>>> * Enhanced Audio Return Channel (EARC)
>>>>>> -> Those features were already supported by the HDMI 2.0a compliant
>>>>>> HW, just
>>>>>> list the _new_ features for HDMI 2.1
>>>>>>
>>>>>> I did a quick review of your patchset and I don't understand why you
>>>>>> need
>>>>>> to add a separate dw-hdmi-qp.c since you only need simple variants
>>>>>> of the I2C
>>>>>> bus, infoframe and bridge setup.
>>>>>>
>>>>>> Can you elaborate further ? isn't this Quad-Pixel (QP) TX controller
>>>>>> version
>>>>>> detectable at runtime ?
>>>>>>
>>>>>> I would prefer to keep a single dw-hdmi driver if possible.
>>>>>
>>>>>
>>>>>
>>>>> The QP HDMI controller is a completely different variant with totally
>>>>> different
>>>>> registers layout, see PATCH 13/14.
>>>>> I think make it a separate driver will be easier for development and
>>>>> maintenance.
>>>>
>>>> I'm with Andy here. Trying to navigate a driver for two IP blocks really
>>>> sounds taxing especially when both are so different.
>>
>> Thank you all for the valuable feedback!
>>
>>> I agree, I just wanted more details than "variant of the
>>> Synopsys DesignWare HDMI TX controller", if the register mapping is 100%
>>> different, and does not match at all with the old IP, then it's indeed time
>>> to make a brand new driver, but instead of doing a mix up, it's time to
>>> extract
>>> the dw-hdmi code that could be common helpers into a dw-hdmi-common module
>>> and use them.
>>
>> Sounds good, will handle this in v2.
>>
>>> As I see, no "driver" code can be shared, only DRM plumbings, so perhaps
>>> those
>>> plumbing code should go into the DRM core ?
>>>
>>> In any case, please add more details on the cover letter, including the
>>> detailed
>>> HW differrence and the design you chose so support this new IP.
>>
>> Andy, could you please help with a summary of the HW changes?
>> The information I could provide is rather limited, since I don't have
>> access to any DW IP datasheets and I'm also not familiar enough with the
>> old variant.
>>
>   Accurately, we should refer to it as an entirely new IP，it has nothing in common with
> the current mainline dw-hdmi。 The only  commonality is that they both come from
> Synopsys DesignWare：
> （1）It has a 100% different register mapping
> （2）It supports FRL and DSC
> （3）different configuration flow in many places。
> 
> So I have the same feeling with Heiko and Maxime：
> The DW_HDMI_QP should have a  separate driver and with it's  own CONFIG  such as DRM_DW_HDMI_QP  in Kconfig.
> and the rockchip part should also be split from dw_hdmi-rockchip.c.
> I am sorry we mixed them in dw_hdmi-rockchip.c when we develop the bsp driver，but we really regretted this decision
> when  we repeatedly broke compatibility with dw-hdmi on other socs。

Yes please, and as I say, if there's code common with the old dw-hdmi, please add a common
module if this code can't be moved in core bridge helpers.

Neil

> 
> 
> 
>>> Neil
>>>
>>>>
>>>> Synopsis also created a new dsi controller for the DSI2 standard, with
>>>> a vastly different registers layout.
>>>>
>>>> I guess at some point there is time to say this really is a new IP ;-) .
>>>>
>>>>
>>>> Though while on that thought, I don't fully understand why both a
>>>> compiled
>>>> under the dw_hdmi kconfig symbol. People going for a minimal kernel might
>>>> want one or the other, but not both for their specific board.
>>
>> Indeed, it makes sense to have a dedicated Kconfig option. This is
>> mostly a leftover from downstream implementation, will fix in v2.
>>
>> Thanks again,
>> Cristian
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

