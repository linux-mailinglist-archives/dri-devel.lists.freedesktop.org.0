Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7395D7A6229
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 14:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD9710E39B;
	Tue, 19 Sep 2023 12:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A2C10E39B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 12:09:33 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-99de884ad25so745345266b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 05:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695125372; x=1695730172; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=vyymcUaSguDm3ESbxgv78EI5Vwk9UXn/QWZRGg06uqQ=;
 b=gN/yL/h2QF3SNNAol/S32rnTIuUte2j9G2o3n3RuVSfRpioyTRiVFwD2gSLnEFpcBL
 lndRfGU/8qnXLFZbOehP5jcY2gAcoZW6dyEHD8r1niOsCofeZ1mTRojH3+Ik5Vfn7GRu
 FkBj0/3m5wCCfYLIoHbmozHsm6sBprM6s8/fAFlotJWkd2HSuqHitA3gGycQn4f5ohhT
 LS9uGEl4Jg1UT9sce7zhjP82nicaZX4JdEWR2KelqGhkoiM8LS9Zhiidk22u/0Q9RuBB
 furwe1anU+WTlQqOZT+fmzbGmxI/JElfFI0ClkXPvc2kgBFsoD7IJix9Uid8dPMtqSCG
 lBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695125372; x=1695730172;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vyymcUaSguDm3ESbxgv78EI5Vwk9UXn/QWZRGg06uqQ=;
 b=oieckBh/rbDgaUnYlWFGwy3FT4t6ykg00UgiIg9w4az1+hOlezbEtREM2nFqdWBj0B
 r6Q/kxsFr/d3CLHuKSuQf2ImFyD0THloFAS3YSTKoaZYD3lLdlVJb5MHsIXMQBPogywS
 hBAhRE4PT/t70YCpY6qzv7ZY03XqDiQ8S12Z1Ln+yMbo0Gl0ZfIIqW5PnZW71xl8LeEd
 HTGRZqngQJSPRw7oK6cPfKfMsxx864d9UlXs3cnqWMLeq/BLpkJjn23lrpeVUyJKQD7c
 vzglfK+bmousgCy5QajBlHyk2o9xxKEZCR03wla1Zu7qsIyECGkLWzgzrFv5D2Ld4LTS
 JeTQ==
X-Gm-Message-State: AOJu0YxevO13i/DnP2ya5EPCCtvaxNp/dNt0ZAP67c2znyT3jevhxVCZ
 ff9vhU24Nd2em1mkrdrr4pUJAQ==
X-Google-Smtp-Source: AGHT+IF1gVma4UEtG0eqhW6UfpvwzjVxvPHSyF5dz/5Ez7OB90lYPomp4o1MKpXc5DjucepgYnDnHg==
X-Received: by 2002:a17:906:73cb:b0:9a5:c4ae:9fec with SMTP id
 n11-20020a17090673cb00b009a5c4ae9fecmr11336580ejl.52.1695125372060; 
 Tue, 19 Sep 2023 05:09:32 -0700 (PDT)
Received: from [172.20.72.244] (static-212-193-78-212.thenetworkfactory.nl.
 [212.78.193.212]) by smtp.gmail.com with ESMTPSA id
 x26-20020a1709064a9a00b009a13fdc139fsm7635969eju.183.2023.09.19.05.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Sep 2023 05:09:31 -0700 (PDT)
Message-ID: <6c4fac8b-cf83-4cfe-9b81-607163c88757@linaro.org>
Date: Tue, 19 Sep 2023 14:09:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/meson: fix memory leak on ->hpd_notify callback
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <20230914131015.2472029-1-jani.nikula@intel.com>
 <a4b4432b-fdde-4922-8d95-3697807eefdb@linaro.org> <87msxitrm5.fsf@intel.com>
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
Organization: Linaro Developer Services
In-Reply-To: <87msxitrm5.fsf@intel.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, stable@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/09/2023 11:54, Jani Nikula wrote:
> On Fri, 15 Sep 2023, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>> On 14/09/2023 15:10, Jani Nikula wrote:
>>> The EDID returned by drm_bridge_get_edid() needs to be freed.
>>>
>>> Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>> Cc: Kevin Hilman <khilman@baylibre.com>
>>> Cc: Jerome Brunet <jbrunet@baylibre.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: linux-amlogic@lists.infradead.org
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: <stable@vger.kernel.org> # v5.17+
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>
>>> ---
>>>
>>> UNTESTED
>>> ---
>>>    drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>>> index 9913971fa5d2..25ea76558690 100644
>>> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>>> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>>> @@ -334,6 +334,8 @@ static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
>>>    			return;
>>>    
>>>    		cec_notifier_set_phys_addr_from_edid(encoder_hdmi->cec_notifier, edid);
>>> +
>>> +		kfree(edid);
>>>    	} else
>>>    		cec_notifier_phys_addr_invalidate(encoder_hdmi->cec_notifier);
>>>    }
>>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Thanks. I don't seem to have a toolchain to get this to build... would
> you mind applying this, please?

Sure I'll handle this.

Thanks,
Neil

> 
> BR,
> Jani.
> 
> 

