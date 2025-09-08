Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD321B490B5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 16:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BC910E0C1;
	Mon,  8 Sep 2025 14:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="V9hENwSJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94C710E0C1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 14:07:26 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-45dd7b15a64so27524935e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 07:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757340445; x=1757945245; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Rdc/gAsQZ6uhaHdORjf30XQWPTkhf47P6Ih3PEktLz0=;
 b=V9hENwSJcPxDcGK8/88fHJ6dp69fsr3LEI4e2tFZfPG8C9f86jFRse1nh65rtPuawC
 FfB5g/7E8PzWb1mk5xgs8f+yIePhCYOPdgm8wdmt3pq5+gNuYqoodc36lLfvSY8GsgO2
 wjfEvJILynwoyAcPO2THvV96tZ82GWDoR34J7bu6PkkKwZmuWgBc5Z5+4XEPBY/1FbVi
 6uT0GsC+Pan470VZMMgeQcMgIWh84cpaXfaIFKX1NMVxNP3Apdrn72dR+VzRatdkstBb
 57cXRnQsDzyOOuuBqYe6NQxuDw+jLxHwGvWb+kMJnPVWXPinW1Lfe609wILyiFQjPHXJ
 JbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757340445; x=1757945245;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Rdc/gAsQZ6uhaHdORjf30XQWPTkhf47P6Ih3PEktLz0=;
 b=AwFPKxloJKKKDQR4KAxpCRGFXkjiaPE0Wxw10mPTzKeaYqtqxJSzvEKf3nICqeAr0D
 nBVd5RHhXsfWwaktGmgVeyzpaYq3mjS5lVNxRgCaIPALbnmXZXnzfsh9/IQovuM+hIqU
 AZERW0I51upkN4J2mEsUu0lvPjHwcAiXtrmTxPccD1w5vxuoQCXMLBFdr9Q90F+koDW9
 EhS0Lr3n2OlUjTlDuFbr9s3srtegt9J3o1VPOu4UeDLp87No1CCE/l7DwYqqqJvD85za
 uoygifYNOvyGcUuU8WbF/XIJTsvuBfL2HwKfVFzOHn5noTxvPEy6iILwqhTP/n6U/iYi
 4AsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvXp9idoTXQx9cHxGOS/iGOV4hP/09ly/leuFuuoIYETQp1VG/df9oajLhjrsQVq9cEv6ZmaIcjV0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhAWbde+DYeLKIEP4INDcdRPKD8tqD3Fd3X9fDZChbNdKVd9YT
 97JeCMcwa4TZedpV4BKDzF0sHJ4QQ41AbCUf+CkPFUKiSw5kJfKR+OH4GH4Ty/a3OEk=
X-Gm-Gg: ASbGncs5CgrSbHPCVKZ9zGk3AvUeEvn+hmvKtF4cdcaDsCnh+WRwdxtcCA7X9sjJB1b
 09eq0s9OdGTQJAqrp7i3ROGeEOf8HdyAZDwbOXeO+/ndoKxERr7SQtxeCYfi9f2qQJx6l95Bwqe
 WofoLjyZGdx1YhZYWSpyjEQI1NQgb9wVQ4XwCUFe/TZiaJ5bFatsii8ZhllOXgaW8af0MdI0+1i
 B8xjwLeA4qx5Obzs0vkreIzv/Wfi42mcpgneJJtU5oHTb9dFGeuoguklZswgUG7mzEWGZU7dpqv
 nae7pD+2mYeaUoF3yOeKDUw6Fsan4dIgFPIlbD6Red/ZNa3qqct2sAVxEAF9Mv2OAJ1snSYAujq
 M9m156wYbtqS5X62lU4JxfKrXfEOHDxEibil4a7wlFgsEHS+ZPCqZ6vwoocTwA2HQZQBR7uEzQn
 eCyGJ3QgsWzg==
X-Google-Smtp-Source: AGHT+IFgaJMZWp+yGKsLkm2e55jSKRrdRQJMjkwsfeyTYzu9PP+AiFfrM1Y4iCzAOP2g1/eX7se7mQ==
X-Received: by 2002:a05:600c:c0c5:b0:45d:e531:99df with SMTP id
 5b1f17b1804b1-45de64869d9mr26259825e9.3.1757340443694; 
 Mon, 08 Sep 2025 07:07:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:61c1:5d31:4427:381b?
 ([2a01:e0a:3d9:2080:61c1:5d31:4427:381b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45c6faad9cfsm266392505e9.0.2025.09.08.07.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 07:07:23 -0700 (PDT)
Message-ID: <a0d8f2de-2456-4f18-b901-e8b003eece44@linaro.org>
Date: Mon, 8 Sep 2025 16:07:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 2/5] drm/bridge: simple: add Realtek RTD2171 DP-to-HDMI
 bridge
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maud Spierings <maud_spierings@hotmail.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andersson@kernel.org, andrzej.hajda@intel.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, kishon@kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, rfoss@kernel.org,
 robh@kernel.org, simona@ffwll.ch, tzimmermann@suse.de, vkoul@kernel.org
References: <20250908-topic-x1e80100-hdmi-v3-2-c53b0f2bc2fb@linaro.org>
 <AM7P189MB100924E3244B953F0EA6D462E30CA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
 <u3qwrzwcr4knq7ueinws3siz2frugbkj75r5zp6i7qmkhnyauf@lrmiqhtbgzfj>
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
In-Reply-To: <u3qwrzwcr4knq7ueinws3siz2frugbkj75r5zp6i7qmkhnyauf@lrmiqhtbgzfj>
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

Hi,

On 08/09/2025 15:45, Dmitry Baryshkov wrote:
> On Mon, Sep 08, 2025 at 03:35:23PM +0200, Maud Spierings wrote:
>> Hello Neil,
>>
>>> Add support for the transparent Realtek RTD2171 DP-to-HDMI bridge.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
>>> index 1f16d568bcc4e0fb56c763244389e6fecbcb2231..e4d0bc2200f8632bcc883102c89c270a17c68d0c 100644
>>> --- a/drivers/gpu/drm/bridge/simple-bridge.c
>>> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
>>> @@ -266,6 +266,11 @@ static const struct of_device_id simple_bridge_match[] = {
>>>   		.data = &(const struct simple_bridge_info) {
>>>   			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
>>>   		},
>>> +	}, {
>>> +		.compatible = "realtek,rtd2171",
>>> +		.data = &(const struct simple_bridge_info) {
>>> +			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
>>> +		},
>>>   	}, {
>>>   		.compatible = "ti,opa362",
>>>   		.data = &(const struct simple_bridge_info) {
>>>
>>> -- 
>>> 2.34.1
>>
>> I would like to ask again if it may not be a better idea to introduce a
>> fallback compatible, once this patchseries lands I will be adding the
> 
> I'd say, that's not a good idea. We usually don't have fully datasheets
> for those bridges, so we can't be sure that there are no strapping pins
> / other GPIO controls.
> 
>> parade,ps185hdm. I don't know how many other variants there are that are
>> just simple dp->hdmi bridges that don't require anything other than the
>> connector type set to HDMIA. The Thinkbook 16 and zenbook a14 both have HDMI
>> connectors, likely with simple bridges too.

Sorry for the late reply, yes I have the same position, they are simple bridge
until we found out it's not the case...

Neil

>>
>> Kind regards,
>> Maud
> 

