Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33A8A43AEB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 11:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8631010E5FC;
	Tue, 25 Feb 2025 10:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SCvYkFrF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BDF10E5FC
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 10:12:13 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-38f29a1a93bso4246022f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 02:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740478332; x=1741083132; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=J87ryWliyCl20sPUl5uI4YRMovXLiY9QCxqpI8NH9Gg=;
 b=SCvYkFrFAp6uNuDKZlX+GbRkqCEGvEI/k5k8YCybfArmWL/DcaHykW/MA86ZWUETkp
 ebZ+daywzxP+S21YMW0iEqTt6WU9eKP0Gh1uChKCU4AqMTugEL8S7HryDUotgzn0MuN9
 jX5lg7oUe/ndZs84M3U0wi5J3MMhlPE0wjlA8PobKyBNFQun1EIijfl5cCRKk6FcIFaj
 QoVo+/IPa2EWqcTvSmjFoK30TUev3afLjVStlUkMuCiL7Xheea8V5ucJXOQ1Bs6VBNfs
 WsHEt1CCRJj2hvAPlbnx42thSeLrIJINB5CySpQk/EquNZJadtOnYRxsbQS8Ye/lvdWY
 dZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740478332; x=1741083132;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=J87ryWliyCl20sPUl5uI4YRMovXLiY9QCxqpI8NH9Gg=;
 b=vadQx4+FCDRPvusWOyQs7c7ZpY5AFfEyEj07vxMbd7CRgAiDKMVCIR4hoqsGE6j7wE
 UI17yagynbO3B6giOlkj5AvzN98fPUCKFSeMsWg5EMEc09lFGHqs2UoVm1AxWUKBoyrA
 4oy9JJ/DN57olgtcWQnKu9kqGe/ttBxQNKaKrnVIwKPYyp6Ae7mCRc0CbJiH140RVPYi
 Xrl0UnHhyJNlUdWMt8GTnca1HMHh19+67j9iJYtOPvN0ZAvcYMr7F8gHlQsZjep6EpHG
 kojGvL7RGsLB+rvC3LiTsVHilSjkz9OjgWBJfZHjwaDnHMbNMMYiHBlGjKsIqSWHQ8uL
 /jjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTDMfw0fUXjFComy2EPRWPFlfDfciXjgJR2EZVDjSqM0Aaro6SgCLtb2JzwQXyzo2wMNc1v3Mabsg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyd0ZFlAuqPhnK6F3v1lB/jra7k4jI9sJIhlnkcnImlcqLihBq7
 rcnJJ8LwUfSauYnm6YDIvNemRswOj9Geo/NMGkPu5S2Qsn4EMhxS3MEt5PzdbEs=
X-Gm-Gg: ASbGncsYhdC+EVKpRDKBcGAnng+rrEoUoHIcPwInlxBv4Mft6rH3CMeUnYYTQRYGxzi
 atuxqkXKnWdcr3mY6BbjaGr6K+ROUmwcnOmkSy10M1Rj4XuCf1DZ4N0nB8e04COQjK+fMiQpVKz
 3x8zu4huZCae4lec1v1EzaLYmuFVebVzKfxeoXhF+6gFGZ7fPcATLXUTc7Jp/vkjaoV2zxSAhDp
 qIde193OlAjroyp3vBpwg61Nf0qmj5+UokuKNZvDhww6EmCOchmyiWYYrK+/7a9cREzisYiEVhI
 ymp58wBdHlsmaNLbWSW+hF5TAv2O3bTW/0Ac
X-Google-Smtp-Source: AGHT+IFefAdtPk51kuJgca+3l0hqlaBwIJi7vLtk9BJJqZ29dtHXUUkn4YlJcKZwqu3ntht5bnF7kg==
X-Received: by 2002:a5d:6d8c:0:b0:38f:2224:738e with SMTP id
 ffacd0b85a97d-38f6e7573ffmr13530472f8f.1.1740478332139; 
 Tue, 25 Feb 2025 02:12:12 -0800 (PST)
Received: from [192.168.1.100] ([37.167.173.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd86cc26sm1799396f8f.30.2025.02.25.02.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 02:12:11 -0800 (PST)
Message-ID: <a1544b83-f5b1-4e9c-a5bf-83e7019d8f3b@linaro.org>
Date: Tue, 25 Feb 2025 11:12:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/2] Rockchip W552793DBA-V10 panel support
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Yan <andyshrk@163.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250207-raydium-rm67200-v2-0-1fdc927aae82@kernel.org>
 <psmfw2znti3luu6pjyi5g22bgvylcb5lms22yakfkshnol4v4y@bhzvqjbgzhep>
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
In-Reply-To: <psmfw2znti3luu6pjyi5g22bgvylcb5lms22yakfkshnol4v4y@bhzvqjbgzhep>
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

On 24/02/2025 18:07, Sebastian Reichel wrote:
> Hi,
> 
> On Fri, Feb 07, 2025 at 05:21:46PM +0100, Sebastian Reichel wrote:
>> This has been tested in combination with the series from Heiko Stübner
>> enabling DSI support for the RK3588 [0] (DSI controller support has been
>> merged already, only the PHY support is missing) on the RK3588 EVB1.
>>
>> [0] https://lore.kernel.org/linux-rockchip/20241203164934.1500616-1-heiko@sntech.de/
>>
>> Changes since PATCHv1:
>>   * https://lore.kernel.org/all/20241210164333.121253-1-sebastian.reichel@collabora.com/
>>   * move additionalProperties below required in the DT binding
>>   * collect Reviewed-by from Krzysztof Kozlowski, Andy Yan and Jessica Zhang
>>   * improve Kconfig help text
>>
>> Thanks for having a look.
> 
> I believe this has all necessary Reviewed-by tags. Can somebody
> merge it please? :)

Can you fix the reported issues by Dmitry on patch 2 ?

Thanks,
Neil

> 
> Greetings,
> 
> -- Sebastian

