Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C34917C36
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 11:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6931510E7F9;
	Wed, 26 Jun 2024 09:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zA0SGJ0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3067F10E7F9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 09:16:14 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4247f36f689so44885715e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 02:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719393372; x=1719998172; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=TdIWBp3H3OzIRfXc4th7SgBGYdrVEb/cgfoJl1lvj5g=;
 b=zA0SGJ0CT7Lkxh0LP3U0Xkn9+bnnmwngbejlesE8yVzrirqQRBErXENWQ5RwcZmDEu
 GA5P9wcthrauRDOq4cWxYJmw2/4qa45nFDopisBRKJR1Aqh3wcvbqPurDboeqZhHJL38
 Kvb3j6BmRJS8Ai6EDE4fK3K427i3rvSSMo9vxrM6faIi7+ytGmNYyn9uX2IT6VZ/PCGP
 mpSOWNSZ6bSvFI94JBs5W2fjo5Sqsb3hi4VU5PavSNvuBFpoX2j9fHCtDzRYqFVtf/3u
 JxQHNICxQ7lrVstqWqLauszcs7zA+8jHA3KBlsnjPjCZSFkT3wzMg7A8Iq42tWbrJ4ew
 dMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719393372; x=1719998172;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TdIWBp3H3OzIRfXc4th7SgBGYdrVEb/cgfoJl1lvj5g=;
 b=oc0syU1EkpUphijRIMHp2y0jwyGteR7q8WMtf3IdqKbtgjgKigLSoC+3xGZH/ks8Gd
 lruen4St/jSc2NWtiMcKftpaLZenw8FuBLHnyN1fw6up/nFoHRXAVxBQTBuD6xUmNVyK
 UYj/ubxqpHj9PZ4Ee/pNYaAJ8gTKzf1G7vUHDIVfTbY2dF91NPg5G5IypXwPmaIzrYu2
 zrB6jZdYEsSKL/5cINxNwO/PhnfIkkwVFVawFU7IvUJMXNwrDf9WMeGVPvAQWRo/juYK
 3Oc0ORtAO8VsS/4BeCE0a/VkfM/xz2Hv5onHFokXEgMJHBK8havgBLVpKQqPvXxYz2vL
 riMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEy8H5ZTwLiMzgm7XJBGlG961qyYPra3mOOJt8X9Ce5Hzh9lYI/JuuumEcE3fmkqZVpnT+3b8rZUoZN2KFi3HezhNXnp5I4qyiEYanLGac
X-Gm-Message-State: AOJu0YzouTofl3qba83O7CzYtkMVSX58Pu8A/C0SolATxDGh3YkPFkJ5
 yL9gkRLmyhOQKkMY6ivPh5jaKC04RbPBLNvKtkthf5n5te0MyCkWBaaOsvoxBqE=
X-Google-Smtp-Source: AGHT+IGxc13iNn+VU3E6zfNRimk0L9WmFRgLpt+AokBDNtV8BDOxSOLm9Nd+D/4IWMEVbCiu9hoPyg==
X-Received: by 2002:a05:600c:3c9e:b0:424:8fdb:9f84 with SMTP id
 5b1f17b1804b1-4248fe2a0c2mr74280225e9.8.1719393371852; 
 Wed, 26 Jun 2024 02:16:11 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:a281:d23c:1a8b:ab6?
 ([2a01:cb1c:fcf:4600:a281:d23c:1a8b:ab6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c8475aacsm17925715e9.47.2024.06.26.02.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 02:16:11 -0700 (PDT)
Message-ID: <0c03b9ff-a1e7-495e-a294-198d9a6878ca@linaro.org>
Date: Wed, 26 Jun 2024 11:16:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add WL-355608-A8 panel
To: Ryan Walklin <ryan@testtoast.com>, Maxime Ripard <mripard@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley
 <conor@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, John Watts <contact@jookia.org>
References: <20240530211415.44201-1-ryan@testtoast.com>
 <20240530211415.44201-3-ryan@testtoast.com>
 <20240606-intelligent-aromatic-magpie-80a7a4@houat>
 <2dc1fdec-7673-4462-abe1-fecf8e3e826b@linaro.org>
 <20240606-refreshing-cinnamon-ibex-a0fe73@houat>
 <20240606-authentic-mongoose-9485904a91a1@spud>
 <20240618-silky-holistic-oyster-bf59fe@houat>
 <20240618-reverse-kinship-7f8df8c8e111@wendy>
 <eb50b8d3-b56d-42b2-a277-02a255b2d6c0@linaro.org>
 <20240626-agate-ibex-of-effort-c72ebc@houat>
 <5f989c7d-fb70-4e13-a1e9-86fc6326d633@app.fastmail.com>
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
In-Reply-To: <5f989c7d-fb70-4e13-a1e9-86fc6326d633@app.fastmail.com>
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

On 26/06/2024 11:10, Ryan Walklin wrote:
> Hi Maxime,
> 
> On Wed, 26 Jun 2024, at 8:56 PM, Maxime Ripard wrote:
> 
>> We're getting fairly late into the release cycle and I'd like to get it
>> fixed before the release. Can you send a patch to address it please?
> 
> Sure, happy to. So to confirm add 'anbernic' to the vendor binding list and 'anbernic,wl-355608-a8' as the panel compatible?

Well anbernic is not the wl-355608-a8 panel manufaturer, so as Maxime is suggesting to use the
name of the device where the panel is found like anbernic,rg353v-panel-v2 as submitted
in https://lore.kernel.org/all/20230426143213.4178586-2-macroalpha82@gmail.com/

Personally I don't care, if DT maintainers agrees having "wl-355608-a8" as compatible,
it's perfectly fine to use it from the driver since it's solely a bindings decision
and not a driver design issue.

Neil

> 
> Regards,
> 
> Ryan

