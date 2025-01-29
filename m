Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1745A221FE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 17:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3520A10E847;
	Wed, 29 Jan 2025 16:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EIAgAttT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE1E10E122
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 16:44:33 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so79647455e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738169072; x=1738773872; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=s+P+kQEK9FrLYE8x2tbLZXPIt8MJ5MgVTvHDKiGvbJ0=;
 b=EIAgAttTskpqeLWtqWWX4/eiWNf0rJ09gvhllvRXiKJG03FSVid/s84ftk8akiX93Q
 CYHVv5CxotpuXVTmKXLWo843d/flmbscImwrDmx5010gmx2P8vvKL/D1TZ7/Uj3046wR
 v/twK07pH7NO8xCpYwWqen8Ef5bxxQfHk3B/+eGkoibTEaByZQmi7rq7zc9PU29YRdT0
 b/Ltjk2/1i5xDqzJ48lhfnOIBaHzb2NjkmLbdMbD5PSsBC8KAWgHHnEYQmoCRXxrdsR+
 o9oTlhUAAVrYESh1FLeDo4Z3eXlDca6qhWLgUXwwV9zrQSpm3pc54Fqciac3pVt1SDgx
 WLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738169072; x=1738773872;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=s+P+kQEK9FrLYE8x2tbLZXPIt8MJ5MgVTvHDKiGvbJ0=;
 b=pB7AlQE1VLM8I1QNMqqL22ZU/bxnHAUd1bb7LgDypo9BqnPWicDSn+QI6JPtV+9rpz
 WFU2lZU/S/C8lvuJbRIlfqXkmIE5zztTDp/8SoJ6jt77MVf748OHS3nNfBgM1R5XU3fs
 YsqOHUkBmQkGH+VhMzwRyCsQ5fvAHTiIhqircE2apvWgNMfyJl4VtRfGa9xC3fhpAExV
 Oa2Vk3eUKFYvaZxuJkvA2juypaFJxBZHSNkZOiM7wGHzUux8oYOIxzG9exIpZ9AhwITV
 Chb7gcPle6mfW9cJ+2iVVcTMhVVIG5ulyJJAkExVAOFOBqk0agqxk3njv5I4mouQE5s4
 U4Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHb4KsUFn60JlcZPXw0HmKm1rN3m3HhpcQYHJeBaGTRSoIjUrVFh5PaM9jDtAQTo5Amm0CyizRkJ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwO0y/NDBBJX9aT2+cdeDsFxNMhyJUvosrqzB0nzv2cnSohLJg2
 0rBiZF18EXZUAi0v7qsnzsi1sOcoTS68S3A/sDG6FIT7x2jaRunh20ewEJa+lkw=
X-Gm-Gg: ASbGncvwEgd6MGR4+N1Zy0mWB/BQtp/wca9nOUl8XT5W6avHwp1zUNkN8tnc7R5sSF7
 uYOOOSeAZ+XlfvhZVFsPwQN41DRM++TDy6YXpSi/OBvXcEO9/cmodz4HWrLKRAGxCRZNmcWauUR
 Kh+cl8yMJOPJ6hVJsno3CvBQP1QUJFex1BQG0CHxDixGmPi2EuyGhmpva7WeOoKE8GUxPqi/kwe
 xYbHHr27cx6h2pP3nh9P798tYY6pxVg8G3dX2EDqYKpvzNovFZQlB0p/Wnav5lNwjSx1WMXtWCC
 iTp7j/2Yu9Q4rnOHAHOM0jq4kgwFtnCK06NHy63YkU12spHPp2pt8U0rC3wc5S0csh63
X-Google-Smtp-Source: AGHT+IGU+0apyU+mgIHTYWjC+/davOqZgpQBPDsbDYK1OSLnbxtCNBsrhJypFLuT+lEu1zN6aBPDYw==
X-Received: by 2002:a05:600c:4e07:b0:436:e86e:e4ab with SMTP id
 5b1f17b1804b1-438dc4353e7mr41981115e9.30.1738169072304; 
 Wed, 29 Jan 2025 08:44:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b25e:a614:863b:566e?
 ([2a01:e0a:982:cbb0:b25e:a614:863b:566e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bad87sm17562458f8f.74.2025.01.29.08.44.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 08:44:31 -0800 (PST)
Message-ID: <c676ef1a-3b08-4342-b4da-d0b525f2f55b@linaro.org>
Date: Wed, 29 Jan 2025 17:44:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 08/10] drm/display: bridge-connector: handle CEC
 adapters
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
 <20250126-drm-hdmi-connector-cec-v3-8-5b5b2d4956da@linaro.org>
 <j5vgb5kcjs2ax3kws6rlbcca57set22ncj6onvgbm4xwjtw43t@uplzdjywzrkr>
 <qe7cm52nozxvawm6yjzbvfarwoiokpwkr26s66tkypgrsztc7t@vnzbek6i4qhr>
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
In-Reply-To: <qe7cm52nozxvawm6yjzbvfarwoiokpwkr26s66tkypgrsztc7t@vnzbek6i4qhr>
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

On 29/01/2025 00:44, Dmitry Baryshkov wrote:
> On Tue, Jan 28, 2025 at 05:14:06PM +0100, Maxime Ripard wrote:
>> On Sun, Jan 26, 2025 at 03:29:13PM +0200, Dmitry Baryshkov wrote:
>>>   /* -----------------------------------------------------------------------------
>>>    * Bridge Connector Initialisation
>>>    */
>>> @@ -633,6 +711,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>>   			if (ret)
>>>   				return ERR_PTR(ret);
>>>   		}
>>> +
>>> +		if (bridge->hdmi_cec_adapter_name) {
>>> +			if (!bridge->funcs->hdmi_cec_enable ||
>>> +			    !bridge->funcs->hdmi_cec_log_addr ||
>>> +			    !bridge->funcs->hdmi_cec_transmit)
>>> +				return ERR_PTR(-EINVAL);
>>> +
>>> +			ret = drm_connector_hdmi_cec_register(connector,
>>> +							      &drm_bridge_connector_hdmi_cec_ops,
>>> +							      bridge->hdmi_cec_adapter_name,
>>> +							      bridge->hdmi_cec_available_las,
>>> +							      bridge->hdmi_dev);
>>> +			if (ret)
>>> +				return ERR_PTR(ret);
>>> +		}
>>
>> Maybe we can use a different bridge feature flag to trigger the CEC code
>> support instead?
> 
> it is possible, but what is the possible usecase? DP drivers should be
> using DP_AUX CEC instead. And I think there are no other kinds of
> bridges which implement CEC support. Meson driver does something strange
> by registering CEC notifier from meson_encoder_hdmi. I think instead
> this should be moved to the DW HDMI bridge itself
> 

It was done before bridge_connector has any support for CEC to keep the
functionnality, I'll be happy to switch to this.

Neil
