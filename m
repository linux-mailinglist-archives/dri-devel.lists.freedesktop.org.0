Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 895BF9D8975
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 16:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4413310E682;
	Mon, 25 Nov 2024 15:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SuQc6+19";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D2110E682
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 15:37:38 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53de367b85dso1364664e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 07:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732549056; x=1733153856; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=3Hg71u/nSxxdt/8mQpbUuh2Vaj/SF/MUnmwqWlHQVd0=;
 b=SuQc6+199GCRgfripEYAxjn21WEOJK1FfT1glzKo4++LDkh6VH5ZGTUiWySo39OUXy
 pBiR0n5yl9ccJBybNRDAyKnADUGzh5K2c5RvGHBZl6J+Jyz6bhw7p9n8+V10T97GF3mZ
 wv4otUhvp3a5atBhmFd/NPfzb0AV6YedbCY92TOKLeb/lS8R62DlGgztYiqAOUgRfW7z
 Nk7Ida3WGOAGqbJYPf8rbl7T7lwF+WS1qZ8xztSvK4mgx8OwGv8AlSq3wnABBgFcEWBi
 qYxhsGCmcnuOTLgtls5ASxnOdf7rK++0qnthTyxmxxURdX1+xji+m/jv48pN2jCITU5t
 J0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732549056; x=1733153856;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3Hg71u/nSxxdt/8mQpbUuh2Vaj/SF/MUnmwqWlHQVd0=;
 b=TMR9B3/ofsRZqy+OUU1EMZuqlt3Kw0cTHirDV8713WMULa04niETdhVthnf9s9Uv6Z
 1bMCgQTFIBknoOgKcEhb/5sBSWZiUrUvvpQWvGpzjR7ew0mPGH43VrPTQldzTK3Ctbac
 Kvtf59ObeqcnUeO9TYF1a5J7iw8k/PT1/Vi0BkooXEFS2P4TtQ17Pt+Dl0zChhN7nmfH
 vF4qQwmuI+S1IfTOs3+1mKp4xatGjXBzz/ByBaTXTAy3T3KcjBHEqloLy4oHB429JW4N
 uREIeDm/4Pb0fRNmcEn/FOXhL+CwtG+8bDE1EeAaR7S53rD3Vlg+AJpEKXaKYRO6W724
 gB6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8S33lD74LCRGPGtxUke0z7EvD6T7I25k2tqYArGzqa2hiEVa8v9AgblyDrRQOuIQeHmL55VZKBmk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2jcR/3IXw+4+USp/+TTOmx4q+/WrjTf5uc/uDlYIOiP+SaDRy
 r7EGPkBxOR8a815+aTFpcG4/+Uy40A7Gf748NfJana+xUCTGbNwpqiygpri4KyI=
X-Gm-Gg: ASbGncsYFN3+Dug9QgCyHqJZ26mOHAmg77/gYFoUmVnoR0RdKaJOgXVdEohFQ5oMBLU
 SswDPy7zWFi8sGFYgGSRE2K5omxYt8WqXHbtKZh6STjXlr88YnxhDRMjg2n1HwbPspyQ7P+SdN/
 Xpyk+JrpdVIoylMgXlS7RCyAmo3r2HCJeoI9Fc1ZKf9tziJpvSdWXXov4YpOdmrL79idnmmmM5u
 k2lQPWczTwOHSizetpRCEYUvzEUsJpZt3dvT7wovxhSCTa9cXngnFdv2Unt56C64KnKtOUg/61H
 V3cGQ/5e98rzmco6YRvFFIk5JqY=
X-Google-Smtp-Source: AGHT+IHmC/h4cTUnON85E6sO/QnQqtWoSOkY3lw5hIYTrZwaGeM/PrXuqTSpTpCW43QaBSIa3xvw0g==
X-Received: by 2002:a05:6512:1247:b0:53d:a9a4:7567 with SMTP id
 2adb3069b0e04-53dd39b4f71mr6398723e87.48.1732549056577; 
 Mon, 25 Nov 2024 07:37:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b?
 ([2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4349ca82957sm66277205e9.33.2024.11.25.07.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 07:37:36 -0800 (PST)
Message-ID: <48f3bb08-a591-401c-bc0c-6af0506a1b1f@linaro.org>
Date: Mon, 25 Nov 2024 16:37:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
To: Hector Martin <marcan@marcan.st>, Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
 <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org>
 <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
 <cc71021e-b53d-4eda-bad8-abb4df13575f@marcan.st>
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
In-Reply-To: <cc71021e-b53d-4eda-bad8-abb4df13575f@marcan.st>
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

Hi Hector,

On 25/11/2024 15:24, Hector Martin wrote:
> 
> 
> On 2024/11/25 20:24, Sasha Finkelstein wrote:
>> On Mon, 25 Nov 2024 at 09:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>
>>> So this controller only supports a single mode ???????
>>>
>> Most likely. On all devices it is connected to a single built-in display.
> 
> More specifically, the controller obviously supports multiple modes but
> it is pre-initialized by the bootloader for the single hardwired
> display's only mode. So as far as the driver is concerned, there is a
> single possible mode, and there's no point in trying to be more generic
> if there is no hardware that would use that.

I totally got the point, I just asked to slightly change the design to fit
the overall DRM/DSI/Panel architecture.

> 
> In general, it is not possible/practical to be generic for reverse
> engineered hardware with no specs documenting how to drive it
> generically. You just can't know how to implement the options that are
> never used in practice. I spent a lot of time on exceptions to this rule
> for the GPIO and SPI controllers, and that's not going to happen for
> more complex hardware like MIPI DSI.

I'm fine with the overall actual design since it's a special usecase
for a special display present on only a few SKUs.

Nevertheless, as Maxime expressed, you should still try to fit nicely
on the abstractions, or change the abstractions.

Neil

> 
> - Hector
> 

