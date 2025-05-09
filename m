Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD08AB1CB2
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 20:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B187110EAC1;
	Fri,  9 May 2025 18:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YRyDxoWP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BC110EAC1
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 18:52:28 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3a0adcc3e54so1449625f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 11:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746816746; x=1747421546; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=4o6noN2eJkk0XdQVCPgCv7nvhvbBSL+3pUlcAtD0d+w=;
 b=YRyDxoWPfZwbY2b2olbM+mf3g6PE8qIIKmEA4sMBMtD0k7TJEbthCanPKk7/7IntNv
 7RxidwzKMNYfPaItquLhT8SrRGlsWwvLfhmtQ9cUzcxmZS1Ow/mOJcWQascCL5ODa7Da
 BEL8F7/ElWeqyJ10UStwu5X37d4GzGK1Rl4gtKKST+cfNycFlp1UI8i3AoBoCcAzBCNI
 nqKZkYWGKSdcYab0ivIJvNwE6kiCSUCGmWv7J2bC2iWF0j4PPk3Etp3Z2zxGygftpwIl
 PLjh98Bje/ibKiP7rElaDGGSKss4dbVgiJcMumGqxn1nHcC8pRUwtiTr5XGMTgUnmm2B
 rSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746816746; x=1747421546;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4o6noN2eJkk0XdQVCPgCv7nvhvbBSL+3pUlcAtD0d+w=;
 b=E+hYEMPdNEXKUSK2vkWXP4qlUyCFNeUXbxd+olmZlgO7SVQ9dcvaYpiZVuqtf6AXJP
 Ca4TaMkKErK/64M4k6fIzyBkqnwb0jV+7dJTGt79ZXcfuSkdBWXG4PfHGhFwiovub6N6
 qw10AGNR47G4KgCoUnG3C51MBH/Lj5JtRKveH2fZKA+PBX4/f9Oj3lZTszEtC0TqB2kg
 5XalIrG0gvateqD2yYA3VAnKAYcXcjdkSUAwfd1TArPEvDflvpzh0nFSsZJ9cmkGvEDf
 48D3Xd5FFUq00HQr/le3Tnu+4Ycy8zORQJi/dZsq8k751V8BHpv93yIs4cqikfIXqQWL
 /qMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtU9z9NNDxSPE9JIteGdFKcsEvI5KA8M8fnAfQuuw2/nmWxMrt3v6oaXjdEc/BPQWCamVhmsLKl/E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7pdYClJXxEQd7DoBzLQrua6RRUy++myEGV3799TqOn7CMdlz0
 5jlML9wqTWFvMpsILIhIy4lKnr+AYB46Xg91KzyJe2clF2EqFsOF0gT3a25LMS8=
X-Gm-Gg: ASbGncvYogGAS/NKRGnYBXR4EjpQBpeWwwV8rydgqu1ILmj60PcXqM3ZM6kFxzr9I24
 o8kagzIkCsg2POu5M4xCJ/narApo3+Sw0QmD5JN2M20o95iP1t0+bD4jkrCzC4tgS2ZnS+UZoyI
 d8BHs7hSiPH87ky39ufmSHcmf/D9L4Gp/I7yS0pmCzGVR3Aw0frxCfhfZjrAaPnU9g1wSC9jeUC
 0wfSkxXYDipoI0hhXJQzr2hSZos2exTeNTZwdZTAlHT7jAdt5n2PfVuTUbJcF2LUkdGYxZEuNKN
 1vg/E4EpbcW0V/4RG4U4tWXX8o/LDlASi9yBGTJsw/L4EWWxxMeB1Xb7TeVCV7JE4ajlhlzMhrD
 FtyPfn5U7RzqrM7SphraGBw2kPIKa
X-Google-Smtp-Source: AGHT+IEkES7QrrP7dWUS3r90TTqs9H9HF3Qrg1w8ITbxBVl4k60rc9jJMmKmLI9AOkx38FcFHuyvrw==
X-Received: by 2002:a05:6000:2088:b0:3a0:b448:e654 with SMTP id
 ffacd0b85a97d-3a1f64e7509mr3877389f8f.47.1746816746484; 
 Fri, 09 May 2025 11:52:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5929:59ab:840a:b8f9?
 ([2a01:e0a:3d9:2080:5929:59ab:840a:b8f9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a2d2ffsm4085907f8f.66.2025.05.09.11.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 11:52:26 -0700 (PDT)
Message-ID: <8ebe2bc3-dec0-4879-a61c-630b96bc4bec@linaro.org>
Date: Fri, 9 May 2025 20:52:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: I Hsin Cheng <richard120310@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, khilman@baylibre.com,
 jbrunet@baylibre.com, christophe.jaillet@wanadoo.fr,
 skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250505184338.678540-1-richard120310@gmail.com>
 <6d2f35ee-1b33-40b6-b164-ab4480110e49@linaro.org>
 <CAFBinCDmHhF7=-dutXT6RE9hVzfN3akLicGkQKw=Arm8bq2NKQ@mail.gmail.com>
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
In-Reply-To: <CAFBinCDmHhF7=-dutXT6RE9hVzfN3akLicGkQKw=Arm8bq2NKQ@mail.gmail.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/05/2025 20:27, Martin Blumenstingl wrote:
> On Fri, May 9, 2025 at 5:35 PM <neil.armstrong@linaro.org> wrote:
>>
>> On 05/05/2025 20:43, I Hsin Cheng wrote:
>>> Coverity scan reported the usage of "mode->clock * 1000" may lead to
>>> integer overflow. Use "1000ULL" instead of "1000"
>>> when utilizing it to avoid potential integer overflow issue.
>>>
>>> Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1646759
>>> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
>>
>> Could you add a Fixes tag ?
> Fixes: 1017560164b6 ("drm/meson: use unsigned long long / Hz for
> frequency types")
> 
> Neil, can you add this while applying or do we need a v3?

Will add while applying.

Thanks,
Neil

> 
> 
> Best regards,
> Martin

