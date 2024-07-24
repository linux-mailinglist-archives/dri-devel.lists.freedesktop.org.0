Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FE493AD96
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 09:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E2310E3EB;
	Wed, 24 Jul 2024 07:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AiYQ4xtY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FB310E3EB
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 07:58:43 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4277a5ed48bso48492325e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 00:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721807922; x=1722412722; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=cBxL2q4ZEENNODh1jSSBbB8KDmM1LiPizuc1ivIVlTA=;
 b=AiYQ4xtYvhyltKZCmfNtzjok6w5v065+47lWrsUgCTrsDmg++iOqaVks2otdn8rUm+
 n7AC/Mo6uDLvBbXoSv2njPB/xFOZ3BOmVT8WJz89LZzSGFRpazOeR+Z2N0i8HKQ3AO6V
 YIoD9nij7dLWszt9ip1pvthjRbs4C7LTDxxIkmF0CA6JupiallVZ8O9kQ9uJuNUNlMEU
 FrIhDxyupQek5U1KB3miDXiNBgQOwfFcoyMEIVEX87ECL4UMTvdqZLzqNGo7kZvjX9wT
 U42qqtGieMpbBVSo24qU67Dg93hcyt27O/wMpDRCraZwg0/CAfG9Q8gRXoANx/vKmnic
 Oxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721807922; x=1722412722;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cBxL2q4ZEENNODh1jSSBbB8KDmM1LiPizuc1ivIVlTA=;
 b=mLi/i7NAUW5U0nCt8MD5nSXQGqLvV9UMDkV9U8dFlTjdPFuiXPKF2qt1Owlq0DncNg
 Zxc7dxCMR/obGykK2E3GovNYXmYnexaLEUGS2Z0DwmiIE3pbfOZgELqmWKHm+1NcG8YC
 7lPnTk8KZmgmryL5uKBjPsulc+Yq5vxlU+/wPQjeOFLSOy5WUKS+vV4f/kDOix+cUKcA
 qK/DHh0t/2kCeBI9v0P6qgzq97pw94L3XgUZIs4YCCpOUIUh63tkKmighTgnrQAXa4zS
 MPfZCCLaMZ0f7cEtfPZJcAFcVKDzgQh6fNbe1Vs6h1ydnv/qMJoeDV2SsxcYQ60A1b9+
 AWew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVbibOci/wW+sdVZRPT/rRzx0WDPTaRAz9CmmcRcSIQTvcy8GQQKz64o7RWF/yM/rzmpAEnZOrkSUzBzbRuDpGAmxB4JJ5u43FBnM2b6OA
X-Gm-Message-State: AOJu0YyZTWqesRMIv/QzrkfoM4UNp1SUHCXEHpZ78QrGkbtKH3W/el8H
 L/SCfMuZd6F9VxK0v3JCC/BZxeBoYYtE4uDXkyUichV36xQVV0UzkU4aJero7ig=
X-Google-Smtp-Source: AGHT+IFX9k7P7kZ+7uFc23BD6PELmgyVQoQ3HMFzz+K3jDmRNOslW5A1RA0nvQaBndRjgCk1ypvSDg==
X-Received: by 2002:a5d:664f:0:b0:368:633d:f111 with SMTP id
 ffacd0b85a97d-369f5af3aefmr780613f8f.40.1721807922040; 
 Wed, 24 Jul 2024 00:58:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:deff:4fa8:5076:b4c7?
 ([2a01:e0a:982:cbb0:deff:4fa8:5076:b4c7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3687868ac54sm13535704f8f.28.2024.07.24.00.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 00:58:41 -0700 (PDT)
Message-ID: <2485acd8-328a-4a35-a7dd-8729f4c7dc89@linaro.org>
Date: Wed, 24 Jul 2024 09:58:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 2/2] drm/panel: boe-th101mb31ig002 : using
 drm_connector_helper_get_modes_fixed()
To: Doug Anderson <dianders@chromium.org>, quic_jesszhan@quicinc.com
Cc: sam@ravnborg.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, hsinyi@google.com, awarnecke002@hotmail.com,
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240723062615.14796-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240723062615.14796-3-lvzhaoxiong@huaqin.corp-partner.google.com>
 <CAD=FV=VD+7hLSLv+F0Egh9=ab1nRCpiB4g+54fqeWg__z7T1-g@mail.gmail.com>
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
In-Reply-To: <CAD=FV=VD+7hLSLv+F0Egh9=ab1nRCpiB4g+54fqeWg__z7T1-g@mail.gmail.com>
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

On 23/07/2024 21:48, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jul 22, 2024 at 11:26 PM Zhaoxiong Lv
> <lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>>
>> Use public functions( drm_connector_helper_get_modes_fixed()) to
>> get porch parameters.
>>
>> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
>> ---
>> Changes between V4 and V3:
>> -  1.Modify the return value, return drm_connector_helper_get_modes_fixed(connector, desc_mode).
>> v3: https://lore.kernel.org/all/20240722092428.24499-3-lvzhaoxiong@huaqin.corp-partner.google.com/
>>
>> Changes between V3 and V2:
>> -  1. Keep bpc settings and drm_connector_set_panel_orientation() function..
>> v2: https://lore.kernel.org/all/20240716121112.14435-3-lvzhaoxiong@huaqin.corp-partner.google.com/
>> ---
>>   .../drm/panel/panel-boe-th101mb31ig002-28a.c  | 19 ++-----------------
>>   1 file changed, 2 insertions(+), 17 deletions(-)
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> I'd assume that Neil or Jessica will apply these two patches assuming
> they agree it looks OK. If this is stagnant for a while then I'll
> apply it.

Thanks for the review, I'm still working this week so I'll apply this serie,
but I'll be off for the next 3 weeks so feel free to apply reviewed panel patches
while I'm away (I'll still be pingable on irc if needed!)

Thanks,
Neil

> 
> -Doug

