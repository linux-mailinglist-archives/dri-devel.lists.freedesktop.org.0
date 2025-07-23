Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C38AB0EAFA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 08:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFE610E00C;
	Wed, 23 Jul 2025 06:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JpMqDKwM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D668A10E00C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 06:51:25 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-45617887276so41551555e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 23:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753253484; x=1753858284; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=HmDQpPxfKm8bqCiPdWg9uZmJGwJELrN8lL27X6M5AKY=;
 b=JpMqDKwMF3DSIMJ4YyW0bj4+r4HFXGP2i0mMsiDX7Axb3I1VOqxxHriix2fLWtCFP3
 FRFc1Kj7cHEtEg6YK69/RJi9DNlGC2DYYVDcE15OarFuXoR7kuFo6jb3Ds+WF47Zweyn
 cOC+Vx4Kx6EcgAV+pOgOyKbhEduuI5AE4QcPwEcmyxy/6XAE5it+gqvmbfA1X76CCf2P
 uTl+jMirUpBEHOhAQYxVFH34GWxQpPDXCi2x5X7HGrobps5c/o4FEpf8kOaVuPa2zmIO
 gO37Wbq5dzjhgHxq+r5Brcp1McGTW0zxUois042e/p3G3dvHCFMgEhpazxZBVnCjA3SE
 hy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753253484; x=1753858284;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HmDQpPxfKm8bqCiPdWg9uZmJGwJELrN8lL27X6M5AKY=;
 b=nNsoNjSD+lRfH/0Tzii82iclNrL9dCwixYo9K5ATzBACqpwnd93UZ7tln2CUCiRCDd
 aX2/lz9mi6eTGOo+pl/J5tSAKI/Jhbgl/NkyEPRBdJrB3LMC4BJpkn1aTasp22dh+duc
 8fG5PCpgHxAL/oMhqVdfjGAXsnJRHcudaAdEuy8ZDMWOJ1uFJdXZcE7XAEdYZPlKVL4+
 LoD05L0eJQawYq/eypOasz43NEzKJvlfmk7CVZujUdgrL4RQE5T1uH0nv1SJELlYbuX+
 4m1UklrCvGnmeCjJPZjEInLxvSBQOdzxsFhFTCvcIa5TtLlTXHfVs1XORlCLgsNkbJ4L
 EAtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLdtGDsYu8/AsD2DOm3ZIvv3pOis9/zUPJm8Qw0KGezyJEDynIoUvbugYCjTWZkwxfY3ZdJSb2VzY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOiq8ghdqhtAYNt+t964Ki35jhGG6eGW1zJB1Zvk9MjbaHkczV
 5bvhN4A2Kp7ZKepUfG4Tn1jo5IaICvG2YNYJ6MUgLGp+P7nyABzTdndrJYOnhVvASQA=
X-Gm-Gg: ASbGncvTrR3+w/eVg6MVgR8RmmjORCtdFqb+oZHpKqUu4M9KpwY6neOZFA8EFXlLpQP
 YBxGaf3qJkvJH89rRetcXIxbXEkHSgR0aulx59+3XQuvVdPmPukmrsp13cFsybI3Uo/EfXheVcs
 q9xJ5jq+4JOq0slIL/K5jLP5/66aV7FKaZtLIDCSLFw5emZ2ZvObI6+dZQCzI8yY+ZrpJYPQb+z
 dWZMO+j/CTbrDG7PoucttZ/5zg/axWgmGvadThfDb7CkpihnhlWEIN9ypT7epnQ4oHjvMePXMtN
 bNagUwFsaAKhz5mx8/VW+JIo813Kfm5n4PTWhpey9o+k4mTx3///bQDE45v0kOIGti9MEyI7MLd
 EHZdhUgBeXno8b6iPuCL0UZYFyAcikzzoYLt0bLGO4vcf35lh8zf2542qkpEIz12cpTdbz+Svvk
 4=
X-Google-Smtp-Source: AGHT+IEoaOAXH2QorgnFzRzUfqE4JxvZBAunYUky46cjn0XM/7dCjKSv+Bq3sv4bmyNmd02W6oc5ww==
X-Received: by 2002:a05:600c:a08e:b0:455:f6cd:8703 with SMTP id
 5b1f17b1804b1-45868d5326cmr11861405e9.31.1753253483979; 
 Tue, 22 Jul 2025 23:51:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:8813:2f0d:f9e0:5294?
 ([2a01:e0a:3d9:2080:8813:2f0d:f9e0:5294])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4586918b65dsm12638235e9.10.2025.07.22.23.51.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 23:51:23 -0700 (PDT)
Message-ID: <e9c63414-8434-4e35-a159-66df1864f9f3@linaro.org>
Date: Wed, 23 Jul 2025 08:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 0/3] Add support for OLED panel used on Snapdragon
 Lenovo T14s Gen6
To: Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>,
 Christopher Obbard <christopher.obbard@linaro.org>
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
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <aCw9pYehCdfXXeiR@hovoldconsulting.com>
 <aG-QyF12rGY55gcG@hovoldconsulting.com>
 <d431435b-4ac0-44aa-922d-0bde126ca563@linaro.org>
 <DBIMQO2CS0I3.17XLZPKPCVW2S@linaro.com>
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
In-Reply-To: <DBIMQO2CS0I3.17XLZPKPCVW2S@linaro.com>
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

On 22/07/2025 15:48, Rui Miguel Silva wrote:
> Hey Neil,
> 
> On Tue Jul 22, 2025 at 2:01 PM WEST, Neil Armstrong wrote:
> 
>> On 10/07/2025 12:07, Johan Hovold wrote:
>>> Hi Chris (and Neil),
>>>
>>> On Tue, May 20, 2025 at 10:30:29AM +0200, Johan Hovold wrote:
>>>
>>>> On Wed, Apr 02, 2025 at 03:36:31PM +0100, Christopher Obbard wrote:
>>>>> The Snapdragon Lenovo T14s Gen6 can be bought with a number of different
>>>>> panels. This patch series adds support for the OLED model which has a
>>>>> Samsung ATNA40YK20 panel.
>>>>>
>>>>> With this patch series the backlight of the OLED eDP panel does not
>>>>> illuminate since the brightness is incorrectly read from the eDP panel
>>>>> as (to be clear this is not a regression). This is fixed in [0].
>>>>>
>>>>> [0]: https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org/
>>>>
>>>> It would be good to get OLED support for the T14s merged. Are you
>>>> planning on sending another revision of this series?
>>>
>>> No reply for over a month. Do you intend to respin these or should
>>> someone else take over?
>>>
>>> Neil, do you have the OLED version now?
>>
>> I'm not sure, how do I determine that ? Is there something specific in the type number ?
> 
> Yes, yours is the OLED version, the exact models stated above.

Ack thx, I'll test and re-spin this patchset then.

Neil

> 
> Cheers,
>       Rui
> 
>>
>> Neil
>>
>>>
>>>>> Christopher Obbard (3):
>>>>>         arm64: dts: qcom: x1e80100: add epd hpd pinctrl
>>>>>         arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp controller
>>>>
>>>>>         arm64: dts: qcom: x1e78100-t14s-oled: add edp panel
>>>>
>>>> Strictly speaking you could have posted this last patch on it's own as
>>>> it doesn't depend on adding the hpd pinctrl.
>>>
>>> Johan
> 
> 
> 

