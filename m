Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C05B088010C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 16:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE6510E9CA;
	Tue, 19 Mar 2024 15:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TtTHeGwM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5B310EEA6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 15:49:05 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-33ed7ef0ae8so1994210f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863344; x=1711468144; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=YP5SdBCpjCZ+GK55trCOJGhuW9mQvLjUzEXNrBKXZoo=;
 b=TtTHeGwM7/opGXlm2Qx7uKKbYdx5Yioa76kb0PzEbeKaevnQ57DRde9617Fe4etpdt
 Tv5qO8Y88hdnuaBYjWLZDSYozCGrzIHx6fUVzaMdXzOk2HoyCUQJfy1XWlwSSeFF7w+X
 gdF4X5E45HPn+k2QSZ2N+8RpyjC0L9uc2jugD9RMYQz2fPmEW/wiM2v9M7t33vlNQpNU
 3J6ZpbYbqPFMhIE4P8vC0NM0xxYz+N+wccn5N9C/31GDKEBrFH39MBPwpvMVspbPxgUv
 WpOslcyxafsnSdmQ3ewDYw5M2YRmvtC4/LXKI2w20Sv0iBuWsy4XJXpXfrWWadZQTT0q
 IEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863344; x=1711468144;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YP5SdBCpjCZ+GK55trCOJGhuW9mQvLjUzEXNrBKXZoo=;
 b=ksYsZjSt0NlrfwhW4CKt3m11vKVuaMpOmz0DH6cOXtb26wph4PnqK08hefWNWKukfB
 nw0glLzB23CYH/nOlf2c/2viUZ4dJVMTndF/3so6EXYXhtMDk5WODovxAhfcpy+OuJPx
 2JOj3ZYANP/t/BwJLWqCSNlJoLD32aMK7HZHDnP/OVvKINHljIPhMCkUnTbxpCZPnUWL
 D9/nZE/HjQxxUv59eyanWEiKxBJsVo4wbeRfUs+ZxOq2WHhK70F8pzshJnPkB9o8kSqM
 errzoJ/f2sgrEkIKKNa7NsNRzxw1fvCsSqOm/jguKPTA+ikgL70hkyCMWZCMCReSzua7
 X8pQ==
X-Gm-Message-State: AOJu0YyCn32GnGyKYOosMcX0LLbnuj6rwJ2HLa5ZGjuL68icSQnGw7zc
 T7hKEiw3M3IfizOybf48k1NvtFHVIRpOx/zMzis0eST3k5Q2HmuygTc0cafLLN8=
X-Google-Smtp-Source: AGHT+IHfHx5OJv11KzqbeJ3qFkbt60s2qn8pEa4OT9kNQj/3TnX2zNmA33fp8ofT/ykeAp3u7SFNrg==
X-Received: by 2002:adf:eac4:0:b0:33d:c5c7:459e with SMTP id
 o4-20020adfeac4000000b0033dc5c7459emr2501631wrn.12.1710863343641; 
 Tue, 19 Mar 2024 08:49:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:2fcf:6f16:3b3b:da8e?
 ([2a01:e0a:982:cbb0:2fcf:6f16:3b3b:da8e])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0034174875850sm5331208wrb.70.2024.03.19.08.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 08:49:03 -0700 (PDT)
Message-ID: <31b609ff-5d54-4950-bd8a-db2b61b228b8@linaro.org>
Date: Tue, 19 Mar 2024 16:49:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm: bridge: thc63lvd1024: Print error message when DT
 parsing fails
Content-Language: en-US, fr
To: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20240318160601.2813-1-laurent.pinchart+renesas@ideasonboard.com>
 <78739dfe-c6ee-44bd-a2e6-2ced24ff15c1@linux.dev>
 <20240318180420.GP13682@pendragon.ideasonboard.com>
 <9d894bd2-c92e-4d08-8643-be88a203879c@linux.dev>
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
Organization: Linaro Developer Services
In-Reply-To: <9d894bd2-c92e-4d08-8643-be88a203879c@linux.dev>
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

On 18/03/2024 20:23, Sui Jingfeng wrote:
> Hi,
> 
> 
> On 2024/3/19 02:04, Laurent Pinchart wrote:
>> Improving core helpers is certainly a good idea, and if we do so, we can
>> simplify drivers. What I'm concerned is that commit 00084f0c01bf creates
>> a silent probe failure path,
> 
> 
> No, I can't agree here. It doesn't creates a silent probe failure path.

It doesn't _in debug mode_, I agree with Laurent, having a verbose probe error should be kept.

Neil

> 
> Simply because
> 
> 1) It is NOT silent.
> 2) It should be exist at product level kernel.
> 
> 
>> which didn't exist before it.
> 
> 
> Again, it shouldn't be exist.
> 
> Otherwise it hints us that there is ill-behavior-ed DT in the mainstream kernel
> or a specific product(or development board). If I were you, I would like to fix
> the boot failure first.
> 
> In the earlier stage of my attempt to contribute, I also would like to enable
> debug output as much as possible. Just like you, the benefit is obvious: It really
> eliminate the pain on developing stage and when bugs happens.
> 
> But I was told many many times that mainstream kernel is not for debug, it is
> for sound products. I bet you have seen some product level drivers print very less.
> I'm not understand why in the past, but I think I could understand something now.
> Probably because professional programmers really confident about what they have
> wrote. As they have been tested and/or reviewed thousands or ten thousands times.
> 
> Enable this debug output by default can only prove to the community that you are
> not confident about something, either the community's reviewing power on DTS or
> your debug techniques.
> 
> 
>> This is why
>> this patch references it in the Fixes: tag, making sure that this patch
>> will get backported to any stable kernel that includes commit
>> 00084f0c01bf.
> 
> 
> No, I keep insist on my judgement. A fixes tag is only meant for cases where your
> patch fixes a bug. The bug should really be happened. All of the discussion ongoing
> here are just things imaginary about the *debug* phase and development phase.
> 
> 
>>   As far as I understand, this is business as usual. There's
>> nothing personal here, and no judgement on the quality of your code.
>>
> Please don't misunderstanding, I do cares the quality of my code.
> If it is really introduce a bug, I will responsible and help to solve.
> But this is not the case. Sorry.
> 
> 
>>>> Signed-off-by: Laurent Pinchart<laurent.pinchart+renesas@ideasonboard.com>
>>>> ---
>>>>    drivers/gpu/drm/bridge/thc63lvd1024.c | 5 ++++-
>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
>>>> index 5f99f9724081..674efc489e3a 100644
>>>> --- a/drivers/gpu/drm/bridge/thc63lvd1024.c
>>>> +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
>>>> @@ -125,8 +125,11 @@ static int thc63_parse_dt(struct thc63_dev *thc63)
>>>>        remote = of_graph_get_remote_node(thc63->dev->of_node,
>>>>                          THC63_RGB_OUT0, -1);
>>>> -    if (!remote)
>>>> +    if (!remote) {
>>>> +        dev_err(thc63->dev, "No remote endpoint for port@%u\n",
>>>> +            THC63_RGB_OUT0);
>>>>            return -ENODEV;
>>>> +    }
> 
> An side effect of this patch is that we will add one more extra error message in the console.
> As the of_graph_get_remote_node() function already print one for us if I add '#define DEBUG 1'
> on the top of this source file. What's worse, it does not really tell us what's really the
> error is.
> 
> It could be no valid endpoint or no valid remote node because of bad coding in DT, or It is
> also simply because the remove node(or device) is being disabled intentionally by adding
> 'status = "disabled"' clause. Therefore, the error printing code added here is very confusing
> in practice. It cannot really help for locating the root cause of the problem.
> 
> After think about this more than twice, either help to improve the core of_graph_get_remote_node()
> function or just to drop this. This what I can tell as a ordinary reviewer. Despite you and/or
> other more advanced programmer & reviewer could override what I said though.
> 

