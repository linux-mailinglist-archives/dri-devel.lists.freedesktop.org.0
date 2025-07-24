Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 517C0B1053B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 11:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F04410E8FA;
	Thu, 24 Jul 2025 09:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f20T4O6a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67AC10E8DD
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:08:46 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-45618ddd62fso7855595e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 02:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753348125; x=1753952925; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=VXg4u6HsqNdzWoo2/MvFuCGv7k9hvq/xa7ZnDdDOUkM=;
 b=f20T4O6aoLxgLr4LK1H6dS7XRmK/Qgif5O9nFmFmcGybdNHBl3t0bSFQnPNu8arOIj
 4p0SxGvBuG17KPTTI+/JDJJBjAPkz03kk9/HB/KJdDjNdy78ulQzOdcKWP5pwTWISR0k
 63PL1iNFMqZ2QTGRoWJvjxLhrzmI+G0AikAYqcfh7oifVbK39R1nJwMUM946QIna/31e
 Wxa6WB1Vmk7/aWK/BiLInOVTMmdUbHljx8cz6IsSh+4bljc4R1fLaLdfAhpMm9C4aGz6
 xHPqSX7nkXAsf7HnBiXSWbCuqh7AumoGSIeBhLhi7mPyhLlHXSM+kzwI/gddWpLA6x2e
 ePzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753348125; x=1753952925;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VXg4u6HsqNdzWoo2/MvFuCGv7k9hvq/xa7ZnDdDOUkM=;
 b=bnu4DPdyYIjsegzBS5nS8y9M/R+2idRAsZICRPpRMCcdLrHbLDWIbrQnlcWAnR22SY
 1TaULm4KPuN4+mUMGyfSF0ZRn58ZNhKIUPXq+uW8mefaTafesEO0zeDcq1C3deKnJ/Yd
 g2GLxUWg+MDsOj21Yjz05LOp4FHXVIEWVwd89ubk5N6vCK11dr1DbrA7dTJpOReIjAux
 0h4UqccC9c0UU/19UxIXsyp09Baeua/vxn3/EaGYlq+Erlpvx0cAQXjk6MiuLXcF/+Sj
 sZvxtxq0HkG0Hn8iGgWKJUgdRhKjUR1W3VQ0CD38sczzbtQqgwHQjYbVDcZEkCIRqr/i
 wSww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa+q7SKCa3UlFTUW12xY+R1JXPLVENM0NhygBMg4ZR7egBk2lQNRYMbTruh2CKmgTuaPG+8pYp0cc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvB2bAJlXIZ4dFQdKnMb2OMbKB6F2WKcRExohUtjoxKCrKw6s6
 XoAlJzjNMljEuTQUo+9WBFRyQQIbVAgfbqfHN6YA/J7lT77GnopUunxt9PZmQtz7fN0=
X-Gm-Gg: ASbGncvGvNIWPM8GEY4SqSM9Sjn8vFYJmDz8w/Ea7GNTAK+F/vZttdj3R3DaU3dgKPb
 ie/tKWBHVKymOFSnnvq4d3JKd7tDaIqszGxx84OSNjB6G9WOjPLpdYibiT7E0ISS+G4rOAXh9FV
 lI8HmMUpW2OaFESNU02s8Vc3pbLwyW78/rQolzRMeSOb7tLIOWivixQQpI91YWUCIL10502+uXJ
 6+1ADI4jW6+ECjLLCOasyCcmzmrSW2CU0xVF72CeOBYJI05O8ufErx7WUl1KSDODjuXzy/XU7SD
 P5Je/iOzdNfqvcITI3azgW0BHrEGy5d+PcOwkWiAvsk5j9fzb4F3AjI8vShh2T/bZxnx14M/c/O
 YQeZQKrto5Jg1RAUtfJwp8pwn1VUDA6Jm
X-Google-Smtp-Source: AGHT+IFKG8HnhbGmxBNTv1ZYLJ7a+SRbz9HKwtsn6vRhAzmT1M6m6ODD7B0jDJBZ+2t3pP6qxWOddg==
X-Received: by 2002:a05:6000:2282:b0:3aa:caea:aa7f with SMTP id
 ffacd0b85a97d-3b768f2fb02mr4904939f8f.56.1753348125129; 
 Thu, 24 Jul 2025 02:08:45 -0700 (PDT)
Received: from [172.20.10.3] ([78.246.240.195])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fcad036sm1549921f8f.46.2025.07.24.02.08.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 02:08:44 -0700 (PDT)
Message-ID: <6612cd14-8353-4d3a-a248-5d32e0d3ca23@linaro.org>
Date: Thu, 24 Jul 2025 11:08:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
To: Johan Hovold <johan@kernel.org>,
 Christopher Obbard <christopher.obbard@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
 <Z-pTcB0L33bozxjl@hovoldconsulting.com>
 <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>
 <Z--eRHaYw_vbgK2f@hovoldconsulting.com>
 <CACr-zFA77ogDSNEOGd32Rdh3geqkL25T0BKtNdKzUdjrL0+9RA@mail.gmail.com>
 <aCw4EK_8C1KLb6MD@hovoldconsulting.com>
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
In-Reply-To: <aCw4EK_8C1KLb6MD@hovoldconsulting.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/05/2025 10:06, Johan Hovold wrote:
> Hi Chris,
> 
> On Fri, Apr 04, 2025 at 02:24:32PM +0100, Christopher Obbard wrote:
>> On Fri, 4 Apr 2025 at 09:54, Johan Hovold <johan@kernel.org> wrote:
>>> On Fri, Apr 04, 2025 at 08:54:29AM +0100, Christopher Obbard wrote:
>>>> On Mon, 31 Mar 2025 at 09:33, Johan Hovold <johan@kernel.org> wrote:
>>>>>> @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
>>>>>>        }
>>>>>>
>>>>>>        pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>>>>>> +
>>>>>> +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
>>>>>> +     if (ret < 0) {
>>>>>> +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
>>>>>> +                         aux->name, ret);
>>>>>> +             return -ENODEV;
>>>>>> +     }
>>>>>> +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>>>>>> +
>>>>>> +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
>>>>>> +     if (ret < 0) {
>>>>>> +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
>>>>>> +                         aux->name, ret);
>>>>>> +             return -ENODEV;
>>>>>> +     }
>>>>>> +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>>>>>> +
>>>>>> +     /*
>>>>>> +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
>>>>>> +      * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
>>>>>> +      * the sink must use the MIN value as the effective PWM bit count.
>>>>>> +      * Clamp the reported value to the [MIN, MAX] capability range to ensure
>>>>>> +      * correct brightness scaling on compliant eDP panels.
>>>>>> +      */
>>>>>> +     pn = clamp(pn, pn_min, pn_max);
>>>>>
>>>>> You never make sure that pn_min <= pn_max so you could end up with
>>>>> pn < pn_min on broken hardware here. Not sure if it's something you need
>>>>> to worry about at this point.

I'm trying to figure out what would be the behavior in this case ?

- Warn ?
- pn_max = pn_min ?
- use BIT_COUNT as-is and ignore MIN/MAX ?
- pm_max = max(pn_min, pn_max); pm_min = min(pn_min, pn_max); ?
- reverse clamp? clamp(pn, pn_max, pn_min); ?
- generic clamp? clamp(pn, min(pn_min, pn_max), max(pn_min, pn_max)); ?

Or just bail out ?

Neil

>>>>
>>>> I am honestly not sure. I would hope that devices follow the spec and
>>>> there is no need to be too paranoid, but then again we do live in the
>>>> real world where things are... not so simple ;-).
>>>> I will wait for further feedback from someone who has more experience
>>>> with eDP panels than I have.
>>>
>>> There's always going to be buggy devices and input should always be
>>> sanitised so I suggest adding that check before calling clamp() (which
>>> expects min <= max) so that the result here is well-defined.
>>
>> Makes sense, I will do so in the next revision.
> 
> It seems you never got around to respinning this one so sending a
> reminder.
> 
> Johan
> 

