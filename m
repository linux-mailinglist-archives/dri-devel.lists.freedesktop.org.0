Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FBF92FD02
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 16:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC48710E15E;
	Fri, 12 Jul 2024 14:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="L2qCpwnM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4460C10E159
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 14:56:36 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52ea2ce7abaso3779722e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 07:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720796194; x=1721400994; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=i7PJER1WcNMLVoA4+jwbRI3bEuqBAe5uHPV+6MR3WXI=;
 b=L2qCpwnM0dkZlMxYgR4sUblPeTxWGeNTK55pweRHzp4QS5sjWMDXUKHNyMthCbOAFg
 JqppmIzvGyQZebfKBGHUElUag8L8IJo3+1G69Yfrb2Zo/Qy1LIK0QUydo9ZVJ90WSKyH
 KajdBoc7oHEq1MmWHC3YEdTGe8rGZWfSduRyxI47Np8jiWE8OePElPhFDpVoMAPl2Z18
 A/KUg3VGbaivHhzXTRGx5SiDiC5UjpNEKWJQhXsuWgRboR821YhVkjD9yqM9B8KdX7Ht
 UHH25r23M7nBr6iuaOr/i0Reb3OCgE+rM0t9TQsC9vAyOzVadBJuw2oQbhICUnOrT02p
 wgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720796194; x=1721400994;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=i7PJER1WcNMLVoA4+jwbRI3bEuqBAe5uHPV+6MR3WXI=;
 b=pKM6Bly+5kY5wdyTfpoyv7TbVclwCGMVj0VyK5yuLTH2VteDr1vhht2ww0E3dQAg5d
 Exp0Hz4IPseWUoa2vxIQ5t8s8iyGuLVawqdZHLunRbrIDQFWhlu/C4vvTngHQfsid08w
 N79+QCk6EprSPj5Iw3XNEZOCsO1q1MkjV0DiB+8J2di8hLDiiEdZ5rrgAAg56Gs4kdYH
 ffedNmbnyHQfyuTRhGZrLw6Ns0hDdZgjGw9+bYSykAbufeLTVr5nDQQgJC5/QUHen72M
 iSx3kdHeasNgNLJwBlHqpRlKUE+0CittVYmG9+qxCeRFZgksYJS8BC+WscSZIz8LpYWU
 8s0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWiFbz0AmPzX1gFaM/PMgCLO4gdb+HSgkHuBNC8HT6EHfxDoOxHCFgqrGvpMWG85+i+SVzzcecXyCcMz+dXhHVFIWuXvS0+6z/j5vLOzUi
X-Gm-Message-State: AOJu0YzcnC8Nxj6jy8qdGDqtxeaLZALZs4oGz5QNPqoD93F1JqRGSNyY
 JzUViWdLIFuC2/nEc4VleOt9PxTJ0Bc+tl1zP9Zx5wK7+I10xXpzkI/JYUq7c/M=
X-Google-Smtp-Source: AGHT+IFKsQa4tj4EnMtXSYCImi7RYxWXOxCwTzx3qALEfPlt1OtJI1helQ394X7LtJ9DSijPFxVFiQ==
X-Received: by 2002:a05:6512:3b20:b0:52c:adc4:137c with SMTP id
 2adb3069b0e04-52eb99949a2mr8484666e87.20.1720796193960; 
 Fri, 12 Jul 2024 07:56:33 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:123f:f92c:4c8f:b8cc:9804:975e?
 ([2a0d:e487:123f:f92c:4c8f:b8cc:9804:975e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f27846bsm25959965e9.25.2024.07.12.07.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 07:56:33 -0700 (PDT)
Message-ID: <4f3b24d6-9638-49d0-8308-00da09c7ed76@linaro.org>
Date: Fri, 12 Jul 2024 16:56:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 4/4] drm/panel: ili9806e: Break some CMDS into helper
 functions
To: Doug Anderson <dianders@chromium.org>,
 cong yang <yangcong5@huaqin.corp-partner.google.com>
Cc: Michael Walle <mwalle@kernel.org>, quic_jesszhan@quicinc.com,
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
In-Reply-To: <CAD=FV=VNx5qEyWDvVz6AVDryqvw09tkYRYMjbFuUQS4Wvyok6Q@mail.gmail.com>
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

On 11/07/2024 21:36, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jul 10, 2024 at 6:09 PM cong yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
>>
>> Hi,
>>
>> Michael Walle <mwalle@kernel.org> 于2024年7月11日周四 03:38写道：
>>>
>>> On Wed Jul 10, 2024 at 9:12 PM CEST, Doug Anderson wrote:
>>>> Hi,
>>>>
>>>> On Wed, Jul 10, 2024 at 2:02 AM Michael Walle <mwalle@kernel.org> wrote:
>>>>>
>>>>> On Wed Jul 10, 2024 at 10:47 AM CEST, Cong Yang wrote:
>>>>>> Break select page cmds into helper function.
>>>>>
>>>>> Why though? I don't find that anything easier to read. In fact, I
>>>>> deliberately chose not to factor that out into a function. It's just
>>>>> a sequence of magic commands, taken straight from the datasheet. So,
>>>>> I'd like to keep it that way.
>>>>
>>>> The consensus of previous discussion on the lists was that folks
>>>> agreed that we should, where possible, make it more obvious what these
>>>> magic sequences of commands were doing. IMO separating out the page
>>>> switch command helps. Certainly I'm always happy to hear other
>>>> opinions, though.
>>>
>>> Fair enough, but in that case, one should take the datasheet (which
>>> you can find online) and replace all the magic numbers with the
>>> correct command names from it. E.g. 0xff is the ENEXTC register. To
>>> be clear, I'm not just talking about the "switch page command".
>>>
>>> As patch stands, I don't see much value, TBH. On the contrary, you
>>> make it harder to compare it with the Ortustech panel datasheet.
>>>
>>> just my 2c,
>>> -michael
>>
>> If all drivers replace all the magic numbers with the correct command names,
>> it will be a huge amount of work (assuming that the datasheet can be found).
>>   I am afraid I don't have enough time to complete it.  Thanks.
> 
> Makes sense. I'd be interested in hearing the opinion of others in the
> DRM community about whether they'd prefer to land something long this
> patch as-is or drop it.

I don't have a strong opinion, but I think only changing the switch
page operations doesn't make a lot of sense by itself.

Having a much larger register coverage would be preferred.

Neil

> 
> -Doug

