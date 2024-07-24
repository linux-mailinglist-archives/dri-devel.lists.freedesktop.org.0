Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE7A93AD9F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 10:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB28710E474;
	Wed, 24 Jul 2024 08:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uIxRbB68";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56D910E474
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 07:59:59 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-368712acb8dso3151758f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 00:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721807998; x=1722412798; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=i5EyQsvTMSzrjZjcPRsb/ozfWVC/E8Z+Cfml4mXV2xc=;
 b=uIxRbB680XoHuF9O7tETtIpK4rwr0M7Q/uVJIfVIK1fX1A0+ymevXguk/RHzu7tdqP
 /9UrR/gyf23S7HfuTMVx5yonpUwlIJvPS9GLVXTM5T7qbiNRgNkmGh/oqCxCnywO1SWt
 OkcZcuYHqeFdJmZKOjUEpabRApqOW3zzF8f7FKMk4JnG8XpRklo+U0wQxs36KTJLfTi2
 kPNRuIPKhxFHqUNHG23g72B1juHF9y0WzmF+3xCPcAiFdXwMy8d/jKGrlUDZi+3MeB78
 5tHjJimrydSusyysdpNGVZiblfBJwdVTKEaKZgD8/w27SE1lyhMzE9JRpy1geksFDKgW
 5sZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721807998; x=1722412798;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=i5EyQsvTMSzrjZjcPRsb/ozfWVC/E8Z+Cfml4mXV2xc=;
 b=n7RHcOnit9p/ivavBlAznpyYz/Ssgmr6sY4H16poXn0kdp4jVUQU9dv0VfSgjTBLqk
 1w5pZPcZOARbypDczOCdOQRxlNwLeXAxtESyE+cfxU17ebJfP7HyqS3HPQo1nn0AEHxV
 blfbRpRTli4w/hqUH30E6tsPD9u07sNsM92XZRhC72yenD26NVj855RBntdiaymZNM86
 tQk5nDb3SGFMw2IFpnRTQSbwVVZ8ww+IFv6gqHI2uUzEueC4XfQ1DcwXfXr+Qsiapdwk
 RZcQ5YvaHXWj3mGsiY4EmWAS2kZGyI+0YXOiYhhsiIDplP9FE99cqJJ3bz1ycv5apdnj
 cGhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYNZtaB+3H3sIqYzlokeO3iBUqJVOCZj8PWQDSUst0L8nwU/Mw3+4+EPEMJfLPK1AVzX9zXiqfWsmj73kytx20TQSQHSNMqPgePsJsSw6O
X-Gm-Message-State: AOJu0YyEpSmUUtmVjj4mjiI0yeNsxlXIqfxWjgeO0OFN1ZlmfdEtFEi+
 dwzFD9mzbttWdqDsfyZ6jJLuXuA9pvu6kGpmFQmr5NSxPUGFkWjYF2hbjPgOGYI=
X-Google-Smtp-Source: AGHT+IFiBS3rZaeds/X3fnlVO8zQjJeT5kfKSN/FGPkge7QvLsuTZHgFpZklRddPFzAeI59u6xT1lw==
X-Received: by 2002:adf:e5c9:0:b0:368:584c:3341 with SMTP id
 ffacd0b85a97d-369dec1e4f5mr3947846f8f.35.1721807997820; 
 Wed, 24 Jul 2024 00:59:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:deff:4fa8:5076:b4c7?
 ([2a01:e0a:982:cbb0:deff:4fa8:5076:b4c7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787ed28dsm13501323f8f.104.2024.07.24.00.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 00:59:57 -0700 (PDT)
Message-ID: <6766a3b3-82bf-4c37-8631-48a8173d8131@linaro.org>
Date: Wed, 24 Jul 2024 09:59:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 4/4] drm/panel: ili9806e: Break some CMDS into helper
 functions
To: Doug Anderson <dianders@chromium.org>
Cc: cong yang <yangcong5@huaqin.corp-partner.google.com>,
 Michael Walle <mwalle@kernel.org>, quic_jesszhan@quicinc.com,
 linus.walleij@linaro.org, airlied@gmail.com, dmitry.baryshkov@linaro.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240710084715.1119935-1-yangcong5@huaqin.corp-partner.google.com>
 <20240710084715.1119935-5-yangcong5@huaqin.corp-partner.google.com>
 <D2LQJROQYIY3.2Q88EXS8HUDLQ@kernel.org>
 <CAD=FV=WAosZPSKdpwR6pjOmiy4hih=jXaMg2guuVgmc+qj-Csw@mail.gmail.com>
 <D2M42ODWQPAU.I0BMEOLKUP29@kernel.org>
 <CAHwB_NJ+YEMoL18Sr9HFmTVH_ErDztyF7vxxPFAE0Y2ta3dO0A@mail.gmail.com>
 <CAD=FV=VNx5qEyWDvVz6AVDryqvw09tkYRYMjbFuUQS4Wvyok6Q@mail.gmail.com>
 <4f3b24d6-9638-49d0-8308-00da09c7ed76@linaro.org>
 <CAD=FV=V5fYweYUoeYD=8qa_jTpF2P_ZjHKJrz0o3ikgrH4XJKQ@mail.gmail.com>
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
In-Reply-To: <CAD=FV=V5fYweYUoeYD=8qa_jTpF2P_ZjHKJrz0o3ikgrH4XJKQ@mail.gmail.com>
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

On 12/07/2024 17:50, Doug Anderson wrote:
> Hi,
> 
> On Fri, Jul 12, 2024 at 7:56 AM <neil.armstrong@linaro.org> wrote:
>>
>> On 11/07/2024 21:36, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Wed, Jul 10, 2024 at 6:09 PM cong yang
>>> <yangcong5@huaqin.corp-partner.google.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> Michael Walle <mwalle@kernel.org> 于2024年7月11日周四 03:38写道：
>>>>>
>>>>> On Wed Jul 10, 2024 at 9:12 PM CEST, Doug Anderson wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On Wed, Jul 10, 2024 at 2:02 AM Michael Walle <mwalle@kernel.org> wrote:
>>>>>>>
>>>>>>> On Wed Jul 10, 2024 at 10:47 AM CEST, Cong Yang wrote:
>>>>>>>> Break select page cmds into helper function.
>>>>>>>
>>>>>>> Why though? I don't find that anything easier to read. In fact, I
>>>>>>> deliberately chose not to factor that out into a function. It's just
>>>>>>> a sequence of magic commands, taken straight from the datasheet. So,
>>>>>>> I'd like to keep it that way.
>>>>>>
>>>>>> The consensus of previous discussion on the lists was that folks
>>>>>> agreed that we should, where possible, make it more obvious what these
>>>>>> magic sequences of commands were doing. IMO separating out the page
>>>>>> switch command helps. Certainly I'm always happy to hear other
>>>>>> opinions, though.
>>>>>
>>>>> Fair enough, but in that case, one should take the datasheet (which
>>>>> you can find online) and replace all the magic numbers with the
>>>>> correct command names from it. E.g. 0xff is the ENEXTC register. To
>>>>> be clear, I'm not just talking about the "switch page command".
>>>>>
>>>>> As patch stands, I don't see much value, TBH. On the contrary, you
>>>>> make it harder to compare it with the Ortustech panel datasheet.
>>>>>
>>>>> just my 2c,
>>>>> -michael
>>>>
>>>> If all drivers replace all the magic numbers with the correct command names,
>>>> it will be a huge amount of work (assuming that the datasheet can be found).
>>>>    I am afraid I don't have enough time to complete it.  Thanks.
>>>
>>> Makes sense. I'd be interested in hearing the opinion of others in the
>>> DRM community about whether they'd prefer to land something long this
>>> patch as-is or drop it.
>>
>> I don't have a strong opinion, but I think only changing the switch
>> page operations doesn't make a lot of sense by itself.
> 
> Does that mean you think we should drop this whole series? For the
> "panel-ilitek-ili9806e.c" driver dropping seems fine since the switch
> page command (and many of the other blocks of commands) is commented,
> but for the other panels in this series IMO even just getting the
> switch page adds to the readability... I'm happy to just apply patches
> #1-#3 or just drop the series.

Well since we already have the changes, clean and reviewed, let's apply them!

Neil

> 
> -Doug

