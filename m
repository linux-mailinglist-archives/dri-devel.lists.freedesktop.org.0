Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49020856A0C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 17:53:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738B010E9EE;
	Thu, 15 Feb 2024 16:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="svHUTExR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DBF10E9EE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 16:53:09 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-411d76c9ce3so9121485e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 08:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708015987; x=1708620787; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=cfGWiGhKRU3uSSuobW+BB20XjEyAiHEhpvntN7DeWYM=;
 b=svHUTExRPCgwlFsCbgOmoEr39BpjjjammrgYsgs6IG2yJ4Yleh2FRB2LFuR/X3niAK
 psJWBTvidZhdFGkoE5mp410pAv+imn71q6nxFQsy6JoG+Gt00suglPQCn8TcpmcbYnsf
 S23eO+6hwVFqa6fsqEmhxdOlfLJppjtuNz4n16ETAA8m31H/Mn8BsIsmCsFFjUVunq9d
 qWiuajsRyaN1j27/fGPyqQWoCuMHkiu4VsiJim58gMGYaS/btA/klmj39zyDVwAHvYa8
 xvf2IW0E96NPACB1/UABg4AY4sUpoB1vrxQgS6poq3Q7/6X+eQ54Bot8vtO1dcfQCMhU
 3QbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708015987; x=1708620787;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cfGWiGhKRU3uSSuobW+BB20XjEyAiHEhpvntN7DeWYM=;
 b=LTWsY4AygBnSoUDSkbMtT1ymUTBDSdep9Z1g2PWHqay2Qk40BC2fsJIL9jSFFeT3g2
 zPSDq6dAx1yEmwWNWdx7cTJPFQ5syIFggBJOZVVFEVYW2htxbcoH75bFZ9lds4brYEdC
 +Q4ZEne6GPYAn4h3+JIaCWY6gyYj+rSKTQ6ItsL30pMeB6BocxkbkJ2Q4lF5HLyeWop9
 2w2i5tj8MoK+Szf7qnj8VQU5TxR0tpAIbfdeFvrFesm4GTTn5QDOJbI0tvtcMssTq9gs
 wtXjmSSyBovlIY5T8wK8Ly6WFHhAP2tBe0c/8+F627EbKHq/s9HNbMIKMlJh7S3eSnCI
 77uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDzgv5izVhm71wUJ+Ia41arQlfhmkFTP02/m93QGhcy5C80O7wn69GRJypuY6LtLqSupsJhuVmN3/4ei7mhaBdZ455S8n4Rmbbi8bkxvhJ
X-Gm-Message-State: AOJu0Yz0rdlvBFZNQWckhsevOgQfU5MPXlvCj83jLFHCbcSMlUCrx4kI
 3dPJgR71xxVbRK2tY8NWQqevCi2ePgnBBDDKp4Nk5RucDj6mXCiGZcuq2fISsw1OY0s9Oeh1xuA
 dBMJAFQ==
X-Google-Smtp-Source: AGHT+IFv7zi2DukcZo5wAwXtWvb+A2E442R4EoH2HTJoL6C/0T7GiRiP0JdL5ZjRPZAQO/QaQaCHew==
X-Received: by 2002:a05:600c:190f:b0:412:1998:e250 with SMTP id
 j15-20020a05600c190f00b004121998e250mr1372368wmq.27.1708015987362; 
 Thu, 15 Feb 2024 08:53:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:7555:8187:c6f1:9c02?
 ([2a01:e0a:982:cbb0:7555:8187:c6f1:9c02])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a7bcb96000000b0040fafd84095sm5482931wmi.41.2024.02.15.08.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 08:53:07 -0800 (PST)
Message-ID: <cbcd981f-bd5d-477e-8482-d3414be17057@linaro.org>
Date: Thu, 15 Feb 2024 17:53:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/dp: Don't attempt AUX transfers when eDP panels are
 not powered
Content-Language: en-US, fr
To: Doug Anderson <dianders@chromium.org>, Jani Nikula
 <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org,
 eizan@chromium.org, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Imre Deak <imre.deak@intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 linux-kernel@vger.kernel.org
References: <20240202141109.1.I24277520ac754ea538c9b14578edc94e1df11b48@changeid>
 <CAJMQK-it9YMod4rHKnACq4O-iaGieK2SN4x5vQ018CghsA631A@mail.gmail.com>
 <CAD=FV=VfuFrK1cSKA0maMzT5dxzKEzADqrd69fZKXuAGrU2rmA@mail.gmail.com>
 <87sf1u58k0.fsf@intel.com>
 <CAD=FV=XQdLm3PcjEd_g_dBJ9QO8zAJtj5nrXS9=cjC80+-Jbfg@mail.gmail.com>
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
In-Reply-To: <CAD=FV=XQdLm3PcjEd_g_dBJ9QO8zAJtj5nrXS9=cjC80+-Jbfg@mail.gmail.com>
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

Hi Doug,

On 15/02/2024 16:08, Doug Anderson wrote:
> Hi,
> 
> On Thu, Feb 15, 2024 at 2:24 AM Jani Nikula <jani.nikula@intel.com> wrote:
>>
>> On Wed, 14 Feb 2024, Doug Anderson <dianders@chromium.org> wrote:
>>> Hi,
>>>
>>> On Tue, Feb 13, 2024 at 10:25 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>>>>
>>>> On Wed, Feb 14, 2024 at 2:23 PM Douglas Anderson <dianders@chromium.org> wrote:
>>>>>
>>>>> If an eDP panel is not powered on then any attempts to talk to it over
>>>>> the DP AUX channel will timeout. Unfortunately these attempts may be
>>>>> quite slow. Userspace can initiate these attempts either via a
>>>>> /dev/drm_dp_auxN device or via the created i2c device.
>>>>>
>>>>> Making the DP AUX drivers timeout faster is a difficult proposition.
>>>>> In theory we could just poll the panel's HPD line in the AUX transfer
>>>>> function and immediately return an error there. However, this is
>>>>> easier said than done. For one thing, there's no hard requirement to
>>>>> hook the HPD line up for eDP panels and it's OK to just delay a fixed
>>>>> amount. For another thing, the HPD line may not be fast to probe. On
>>>>> parade-ps8640 we need to wait for the bridge chip's firmware to boot
>>>>> before we can get the HPD line and this is a slow process.
>>>>>
>>>>> The fact that the transfers are taking so long to timeout is causing
>>>>> real problems. The open source fwupd daemon sometimes scans DP busses
>>>>> looking for devices whose firmware need updating. If it happens to
>>>>> scan while a panel is turned off this scan can take a long time. The
>>>>> fwupd daemon could try to be smarter and only scan when eDP panels are
>>>>> turned on, but we can also improve the behavior in the kernel.
>>>>>
>>>>> Let's let eDP panels drivers specify that a panel is turned off and
>>>>> then modify the common AUX transfer code not to attempt a transfer in
>>>>> this case.
>>>>>
>>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>>>> ---
>>>>
>>>> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
>>>
>>> Thanks for the review!
>>>
>>> Given that this touches core DRM code and that I never got
>>> confirmation that Jani's concerns were addressed with my previous
>>> response, I'm still going to wait a little while before applying. I'm
>>> on vacation for most of next week, but if there are no further replies
>>> between now and then I'll plan to apply this to "drm-misc-next" the
>>> week of Feb 26th. If someone else wants to apply this before I do then
>>> I certainly won't object. Jani: if you feel this needs more discussion
>>> or otherwise object to this patch landing then please yell. Likewise
>>> if anyone else in the community wants to throw in their opinion, feel
>>> free.
>>
>> Sorry for dropping the ball after my initial response. I simply have not
>> had the time to look into this.
>>
>> It would be great to get, say, drm-misc maintainer ack on this before
>> merging. It's not fair for me to stall this any longer, I'll trust their
>> judgement.
>>
>> Reasonable?
> 
> I'd be more than happy for one of the drm-misc maintainers to Ack.
> I'll move Maxime, Thomas, and Maarten to the "To:" line to see if that
> helps get through their filters.

I'll like some test reports to be sure it doesn't break anything,
then I'll be happy to give my ack !

Thanks,
Neil

> 
> -Doug

