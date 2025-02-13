Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B950A34A4F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B8C710EB3A;
	Thu, 13 Feb 2025 16:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OVq9T8Vh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D6310EB3B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:42:19 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4395578be70so11766015e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464938; x=1740069738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=3B83uWsYDmuTqDgqBDbXT/Rsks8AW0n9FN3+nFDl7Zg=;
 b=OVq9T8Vhq28vK1b7lJdFwnoByvUAmRJD/YuFWb3T1+aG9ITlquTEmOnUd4IuEnsVYe
 oWIgkpLjBhk47jtvJhqpcLSX/ZdPF+HD57Ov2rYxicjMGeT+FZ9tt7I7BSi2lOcqmvM5
 io7yXNs47QlwnIQKOdsP1OT4AK/Q6jIs/KMDuuyZXhclUAlgt5eZw1bOSXJoj+EF8w95
 s+VmUrcB1OmQJDmxxwVC8dj1OD7juJ7AAfQip70zpgGo649hcJ8iFkyovI8LJmvl1Z8b
 +4jKjM9YvK1135QxtEzht0zoWXVN2L1g11H6PxxQh4jfRvRzFMjCaYFfbOHHnAIvGKTl
 k+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464938; x=1740069738;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3B83uWsYDmuTqDgqBDbXT/Rsks8AW0n9FN3+nFDl7Zg=;
 b=GyTOi4wBtVivmOkzKeWQtD1vskHQRrOtZrUtIFTywjhwejgRXyCpXe7yC0hHCToB83
 d/tcOMioSRaeZFxTzeYgWTPWQPMQwOEpM+m/vAQhBlouylr3XhY9P1JbKUObL0Wl36zs
 lAn8RjERoYpBllE+Nrx1c+1rkS/f2iUhl5lXRKjnXQpeKUvvhfnQYlS5EAf/o/kYveJx
 dJXWOmOOQ/b1igZ57hT9B/Nw22rOj1DwDbJlpTQgShWohp70MqmuqD+HGkDPgtW9q98R
 73emXAI+40916cn95PJLzJgQvppRZLiwC/jlGDcGgDJ3s3xaBePETG6B0LlzDH8t7Fyx
 pdVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrzjTmGsLPuGvsh+g/RinrZSBijcm0SvWvocA53426k5SQ7385+0pnjNYvMaTmGYak5KRYwsM57bs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqbhzqgfJJSJ+4E0iY2KRfSZBrCqdl8K1LxPuRVHeTLfHdqPBs
 MGwfFV4d+u4mO8iI03WX73KJQNaGzI0ELxsJftdQtFhg0V7BCH0EouuNQpArJ2E=
X-Gm-Gg: ASbGncuvVBFULe20B0kQRt0Z1X+TmN89xVT4FACkd/cHjyn7O65Hv++x6Mps7i/CZXT
 3RFwQrSywq/f7tAFFrL+RrvW34sM85VCXFtiS1LTNKZGYmEjU8cCEYlguv8G5KL5O5yJQQbPJQ3
 SXgcsUeovePmK1WYzsEmrGQjxlO+dWMVuvQSzqB+jBOjceOgq2PRBh/UpttU+BLnUeieWr6PyVB
 rFHQ4cQs9n5JkhrFWAOXxVyel8SfThsHok5JJd8sZlMxYZwx6lgph9zkP68RvjM+/82r+hiT0QN
 PCStWamOHHmFMO1TsiYZ+EScn6p221J15dJyl5IqoEuRPInQ3c9eT60DyEuLQL3ONHsN
X-Google-Smtp-Source: AGHT+IGy49IVyutPXQwSKvUdWc6ERgob1wg64K135om5hnsDIAMQ2/W3BtPEa3E3wnb4zSvKvNly1A==
X-Received: by 2002:a05:600c:2d54:b0:439:608b:c4ad with SMTP id
 5b1f17b1804b1-439608bc717mr43429795e9.3.1739464937620; 
 Thu, 13 Feb 2025 08:42:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b065:478c:3f8f:ac1b?
 ([2a01:e0a:982:cbb0:b065:478c:3f8f:ac1b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439617ffa28sm22112085e9.14.2025.02.13.08.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 08:42:17 -0800 (PST)
Message-ID: <f2ab3542-3463-4df0-96f0-cad41c1fcf3d@linaro.org>
Date: Thu, 13 Feb 2025 17:42:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm: panel: jd9365da-h3: fix reset signal polarity
To: Linus Walleij <linus.walleij@linaro.org>,
 Hugo Villeneuve <hugo@hugovil.com>
Cc: Jagan Teki <jagan@edgeble.ai>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240927135306.857617-1-hugo@hugovil.com>
 <f9b0cc53-00ae-4390-9ff9-1dac0c0804ba@linaro.org>
 <20240930110537.dbbd51824c2bb68506e2f678@hugovil.com>
 <16bd6bc2-8f10-4b99-9903-6e9f0f8778d8@linaro.org>
 <20250204124615.4d7a308633a15fc17b2215cb@hugovil.com>
 <CACRpkda+jac_7KKQDs3UcfODP6kK3W03Q3KtVOCjRV+wo=M8=g@mail.gmail.com>
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
In-Reply-To: <CACRpkda+jac_7KKQDs3UcfODP6kK3W03Q3KtVOCjRV+wo=M8=g@mail.gmail.com>
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

On 13/02/2025 12:42, Linus Walleij wrote:
> On Tue, Feb 4, 2025 at 6:46 PM Hugo Villeneuve <hugo@hugovil.com> wrote:
>> On Mon, 30 Sep 2024 18:24:44 +0200
>> neil.armstrong@linaro.org wrote:
> 
>>> OK then:
>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> Hi Neil,
>> it seems this patch was never applied/picked-up?
> 
> We have some soft rule that the reviewer and committer should be
> two different people. So if I do this:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> I think Neil will apply it.

Yeah sorry I got very busy recently and forgot about it.

Sorry about that, applying it now to fixes.

Neil

> 
> Yours,
> Linus Walleij

