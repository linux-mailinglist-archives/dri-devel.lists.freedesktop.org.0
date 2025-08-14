Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B9AB26906
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 16:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C9810E1E0;
	Thu, 14 Aug 2025 14:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aFzTYaIz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9C010E1E0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 14:21:12 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3b9d41c1149so698878f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 07:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755181271; x=1755786071; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=4vFp1QCJpRDcLOP+2iU18C4auf6bivSiIUcw7C2wHw4=;
 b=aFzTYaIzF6KNz1WD48fx7bzkFHYOIyIFac5l8ReU2O1iK5yKQdI8ZvkGyNcZoOx+0a
 rvNAhaAQydWdQMkIJ5S66YL0T5sgGS3lKWzPU2sigXVpmIyWH+lBda1C0VeHFaINKHKx
 Xn9/BzbH5oj8CcOWOrPEl9Q7WH4gyfeeGos+kjWchCYI83fLXLcwRXDribPjf9m5IyzH
 mEbhJpu/0uGAZrGB6+evHz67s1uwpHer5etv15zmXgKIMrDyY6L81jzOICgqqJ25s1H9
 bhvQZx7SKMSXO9iXUnoHpUZFPZ+ap8dosN0VUgfNdyoIYN2mcW2PXKpgDZORfBz6kGxK
 fqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755181271; x=1755786071;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4vFp1QCJpRDcLOP+2iU18C4auf6bivSiIUcw7C2wHw4=;
 b=KvljW7kiJbFRfDXRG8pACh9dsoTo7NRGCCv4Uv0adMRpGdm/2Crqt9F8MwgYyzVJxk
 uoIn1Sy/P+VLX/mnekkD79kYAfytCphCbXLJnpP70VAKGBys1PbA/hLhAloD5C3nkgvE
 yVaayAzoqJ9r8uC3vwsoCJQnzukV4+VSWXbA9UFgSd04pMZynt7+pmsz3aIQZdR2eBBv
 k8lJ8AbHmMxc+IFxmvKimMvwJjhLLrqZ1w8CXuQDmFcKLXyyxfA2No34vseED5X1ruVm
 IVhR4zHYLlUx/xLnhzdk1EPVs61xuRL0/EcjkWQmaLDpRfipFjRwCUs+Fs8M00rwLmDV
 V7FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+wwPbIo0R35QF1YgxgBbU7PgMR2IJOSWZP9FZuPVGt0arPv8pSNbDA8tZYBrpKReU/lCgnJN6nAI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuDPaSgjpS8sGGXKYqQsbQFvy3CNivxTW0C9+nT2zpN7ge2tZv
 e+jSdGHRH/V6V/2t72bVkupz5UF8bN2R81kY6wWO9dHUJW4d+N6Pt6dVQ1fc3r06rMQ9o8qQeI+
 KHQ7+
X-Gm-Gg: ASbGnctHeMDVjoJwaF1dpL1xYdXUb2yMqzd3Pvd3JFfhsrXbJGJhEuhFNz+kjQKeF9z
 AmEatPJTCHlnEFhfH6vJLzMNdhBJ9oUqSCNdTC2vHRaKBWz3OikQIBmETe0EQ6Vtj7N+LuHBUQM
 16Cc6DeEHxKcveHXiLeT5hnjD7E1EAOmOeqmalxzU/eGVUvkfjKKpUIaEshaZdwI6Jgh0kezYxm
 KvtzHPqDb/LTzbVncc2CFjy4v48m1xy9Z2eJp8mfE1kFSZu0AOnPNo+wyw8Qwmm/I0V026YqMH/
 SEYLukZx58SZMDuKzGvSEtLWWYmNyna2jkQlEAQvADm6R3vKRRa58M1GkJNJ4Sy3etLgCKmrLks
 KphPdNtRXAt5e1Zpht5U6ddR9sTrZjR2uWcp8cVttJv9EWaFEvIkpYLIN94GSiAqfz3L+0HxZ
X-Google-Smtp-Source: AGHT+IE+4++8ILvUsYg3hhgJDOtLRyfm3QvNNAALFyboVt/WjmkjcDQBTvinmWUaP7p4FTRya3vjvg==
X-Received: by 2002:a05:6000:3111:b0:3b7:b3f2:f8b3 with SMTP id
 ffacd0b85a97d-3b9fc34c406mr2447041f8f.38.1755181271072; 
 Thu, 14 Aug 2025 07:21:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:7336:e60:7f9e:21e6?
 ([2a01:e0a:3d9:2080:7336:e60:7f9e:21e6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c6dba38sm24179585e9.13.2025.08.14.07.21.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 07:21:10 -0700 (PDT)
Message-ID: <536dd237-e668-4a88-ac2b-3bc88dca8a3e@linaro.org>
Date: Thu, 14 Aug 2025 16:21:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 dp controller
To: Christopher Obbard <christopher.obbard@linaro.org>,
 Johan Hovold <johan@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
References: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-0-4782074104d1@linaro.org>
 <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-1-4782074104d1@linaro.org>
 <aJCyBbwNjZvTHnjT@hovoldconsulting.com>
 <CACr-zFCq08Pu2=eLfe5=sYdGWEHmy7w+=Eo++9AjP96uCLCNcQ@mail.gmail.com>
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
In-Reply-To: <CACr-zFCq08Pu2=eLfe5=sYdGWEHmy7w+=Eo++9AjP96uCLCNcQ@mail.gmail.com>
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

On 09/08/2025 00:28, Christopher Obbard wrote:
> Hi Johan,
> 
> 
> On Mon, 4 Aug 2025 at 14:13, Johan Hovold <johan@kernel.org> wrote:
>>
>> On Thu, Jul 31, 2025 at 09:51:26PM +0100, Christopher Obbard wrote:
>>> The eDP controller has an HPD GPIO. Describe it in the device tree
>>> for the generic T14s model, as the HPD GPIO is used in both the
>>> OLED and LCD models which inherit this device tree.
>>
>>> @@ -5779,6 +5779,11 @@ tlmm: pinctrl@f100000 {
>>>                        gpio-ranges = <&tlmm 0 0 239>;
>>>                        wakeup-parent = <&pdc>;
>>>
>>> +                     edp_hpd_active: edp-hpd-active-state {
>>
>> The node name and label needs an index as this SoC has two edp hpd pins
>> as I already pointed out.
> 
> Sure. After looking at the schematics this should be called
> edp0_hpd_active. I will fix this in the next revision.
> 
> 
>>> +                             pins = "gpio119";
>>> +                             function = "edp0_hot";
>>
>> And you also need to configure the bias somewhere as you should not rely
>> on the firmware having configured things for you (as I also pointed out
>> before).
>>
>> On my T14s the internal pull-up has been disabled.
> 
> I am still unsure of what else needs to be set here. Can you help me
> with the correct settings?

Just add bias-disable;

Neil

> 
> Thanks,
> Chris

