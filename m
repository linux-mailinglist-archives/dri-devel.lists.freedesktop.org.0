Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5793990CB0A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 14:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D851C10E65E;
	Tue, 18 Jun 2024 12:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fh4gsGw0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8065D89F5F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 12:06:03 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3629c517da9so238522f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 05:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718712362; x=1719317162; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=qPtxiv3tl6wuHTI39GVYFLYTokiECBWO0QIFe11OMMw=;
 b=fh4gsGw099WUIb86fVKZLyly9HEZ7k+/WWKYVy0TJ3IwUrFBWbWchH8CLFNbnL+YzX
 NpqegT8AJEA5ZhWhO3p0Gye6pVD4qkg/XcvL+/l2hPcCmlDxfvHucv3LVLyHoyKV14r/
 pwkMJHL2TkOoFn5BMLKEINluOFSxnLzxcDUUL1oaPhg1XeuPrq4AI78I8XRITrMm6s1j
 mpo5Jz3T6Xw3g6KLLvQ7tCxDWyr4u7TsU3zykezxKhYKchAGlrmb+iN6/NY8hFPps1No
 0ngvQOMlhupdkShhVJfI7wuqRY4JGLxoBr/5Z4k3kVkD/A2b2bV8WG+5W+Snvyn3H6C2
 7Jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718712362; x=1719317162;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qPtxiv3tl6wuHTI39GVYFLYTokiECBWO0QIFe11OMMw=;
 b=A72iL/AE+eX8sjpsVpqbcZjrBB39jihyTnjdGNiTbzVIHwlX3pmUzzpg5w9SUqUhO6
 mOohPh1488Wa7zobJDMHDv3NW488sdew49US2AFf0p9m8cv+NA5jUcxUEtFxIuYbDduP
 RxO8wIoG6i4PGzUjC20NZe3bxFUZYtCWLIEb4+TsfXSbKTBE4D7Y6/VgT4faWNEn+krj
 1n/CYPANzpaZGuhsgO65OhC4Qqdey0ZM58KfUvFg0w3qCDGKbYTzDWD9j4o0pQI+W4xW
 UXpcoSz+SK92WRc6KVaFy4A2U3bVweaORmeCoQWN8ngqrDmWhzPQP7kjjWzVzayGiP50
 hNFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdYv6w8UlSwLrlpUsltDlHtSCNZiTiC11r13fnt5UpnvJ/GhYZjSmD1HukYdRXDUQXd/f+w8Y5g1h8nguovAS/vnDMctAesOPaM86hYF5t
X-Gm-Message-State: AOJu0Yx6REg21IgwViL+n7eZn8C9T54+aQiENf/rnYcbC9/xn4TTFSbm
 eyUf21LHBnEShLLTYM6/9QY5qu3pVrrSyhLE6/HfoGIsWW8LPuS61XilzO0jkjw=
X-Google-Smtp-Source: AGHT+IG90roO//BzFS/LxXz6pXUjfZqWIPwKWMesZ23zGPMdpOaAM0AQIhxz7p+hTMWeAeB46qf/HA==
X-Received: by 2002:adf:f143:0:b0:361:dd0c:678 with SMTP id
 ffacd0b85a97d-361dd0c06f7mr1412800f8f.36.1718712361517; 
 Tue, 18 Jun 2024 05:06:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7f31:be49:5b98:50cd?
 ([2a01:e0a:982:cbb0:7f31:be49:5b98:50cd])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-362cd0d79fdsm126864f8f.77.2024.06.18.05.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 05:06:01 -0700 (PDT)
Message-ID: <eb50b8d3-b56d-42b2-a277-02a255b2d6c0@linaro.org>
Date: Tue, 18 Jun 2024 14:05:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add WL-355608-A8 panel
To: Conor Dooley <conor.dooley@microchip.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Ryan Walklin <ryan@testtoast.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, John Watts <contact@jookia.org>
References: <20240530211415.44201-1-ryan@testtoast.com>
 <20240530211415.44201-3-ryan@testtoast.com>
 <20240606-intelligent-aromatic-magpie-80a7a4@houat>
 <2dc1fdec-7673-4462-abe1-fecf8e3e826b@linaro.org>
 <20240606-refreshing-cinnamon-ibex-a0fe73@houat>
 <20240606-authentic-mongoose-9485904a91a1@spud>
 <20240618-silky-holistic-oyster-bf59fe@houat>
 <20240618-reverse-kinship-7f8df8c8e111@wendy>
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
In-Reply-To: <20240618-reverse-kinship-7f8df8c8e111@wendy>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/06/2024 13:13, Conor Dooley wrote:
> On Tue, Jun 18, 2024 at 11:04:09AM +0200, Maxime Ripard wrote:
>> Hi Conor,
>>
>> Sorry, I missed the news of you becoming a DT maintainer, so most of my
>> previous points are obviously bogus. And congrats :)
> 
> I've been doing it for over a year, so news travels to some corners slowly
> I guess. I'm not just being a pest in dozens of subsystems for fun!
> 
>> On Thu, Jun 06, 2024 at 12:51:33PM GMT, Conor Dooley wrote:
>>> On Thu, Jun 06, 2024 at 01:23:03PM +0200, Maxime Ripard wrote:
>>>> On Thu, Jun 06, 2024 at 11:37:31AM GMT, Neil Armstrong wrote:
>>>>> On 06/06/2024 11:32, Maxime Ripard wrote:
>>>>>> On Fri, May 31, 2024 at 09:12:14AM GMT, Ryan Walklin wrote:
>>>>>>> The WL-355608-A8 is a 3.5" 640x480@60Hz RGB LCD display used in a
>>>>>>> number of handheld gaming devices made by Anbernic. By consensus a
>>>>>>> vendor prefix is not provided as the panel OEM is unknown.
>>>>>>
>>>>>> Where has this consensus been found?
>>>>>>
>>>>>> I had a look at the previous discussions, and I can't find any consensus
>>>>>> being reached there. And for that kind of thing, having the ack or
>>>>>> review of any of the DT maintainers would have been great.
>>>>>
>>>>> There was a consensus with Conor, this is why he acked v2, see
>>>>> https://lore.kernel.org/all/20240525-velvet-citable-a45dd06847a7@spud/
>>>>
>>>> It's probably a matter of semantics here, but if it's with only one
>>>> person, it's not a consensus but an agreement.
>>>>
>>>>> ```
>>>>> I think if we genuinely do not know what the vendor is then we just
>>>>> don't have a prefix.
>>>>> ```
>>>>
>>>> And even then, I don't interpret Conor's statement as a formal agreement
>>>> but rather an acknowledgment of the issue.
>>>
>>> I mean, I specifically left an r-b below that line in v2:
>>> https://lore.kernel.org/all/20240530-satchel-playgroup-e8aa6937b8b9@spud/
>>>
>>> I'm not a displays guy, so my sources were limited to what I could find
>>> from search engines, but I spent some time looking for an actual vendor
>>> of the panel and could not. All I found was various listings on places
>>> like AliExpress that did not mention an manufacturer. I'd rather not
>>> invent a vendor because we could not find the actual vendor of the
>>> panel & it seemed rather unreasonable to block support for the device
>>> on the basis of not being able to figure out the vendor. If you, as
>>> someone knowledgeable on displays, can figure the vendor out, then
>>> yeah we should definitely add it.
>>
>> It's still a bit surprising to me. We've merged[1][2][3][4], and are still
>> merging[5], panels from this particular vendor that have no clearly
>> identified OEMs. Just like any other panel, really. We almost *never*
>> have the actual OEM, we just go with whatever is the easiest to identify
>> it.
> 
> It wasn't (isn't?) clear to me that Abernic is even the vendor of the
> panel, just that it works for their devices. If there's an established
> policy here of making up vendors for these panels, then sure, override
> me and use them as the prefix.
> 
>> Plus, if there ever is another WL-355608-A8 part from a completely
>> unrelated vendor, then you'll have a naming clash with no clear
>> indication about which is which.

Not sure we can say there's an established policy ongoing here, we try to
use the marking we find on the panel when possible and when not possible
we use the vendor + name of the device in last ressort.

Neil

>>
>> 1: https://lore.kernel.org/all/20230426143213.4178586-1-macroalpha82@gmail.com/
>> 2: https://lore.kernel.org/all/20231003163355.143704-1-macroalpha82@gmail.com/
>> 3: https://lore.kernel.org/all/20231117202536.1387815-1-macroalpha82@gmail.com/
>> 4: https://lore.kernel.org/all/20231208154847.130615-1-macroalpha82@gmail.com/
>> 5: https://lore.kernel.org/dri-devel/20240618081515.1215552-1-kikuchan98@gmail.com/
> 
> 

