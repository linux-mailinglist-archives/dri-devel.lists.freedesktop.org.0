Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C59E09F627A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B4E10E91E;
	Wed, 18 Dec 2024 10:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wkbDWcLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD0510E91E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 10:14:45 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3862ca8e0bbso5279190f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 02:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734516884; x=1735121684; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=pP8Ga7mE2+pnxKoG6TAWzyjb7hUhPfz5H4HvWCT0CdA=;
 b=wkbDWcLy/C95SU6wC42NdMnf5XR9gmFLEWq4/gS5saoM6vGZONnvkux4Wa4niTFNap
 A4TTHN8E9wy7gT4heSx44O3afAZ1iBnGyPM9x6sHmqpLMxykk9LX6pwYzoi9/n3Kcxiw
 A0kobDTMKDqtiSPPKbyOk9KwSmAb39jbk40XuvM62gQV26hjLOGNwvCZlmIZTDlBLCjb
 R/dyhvL1T8gm6G7kvDrOSFIlcCSbnJvMbspaW/L4SmAytUrAfRO7Ker8qWI3O827dkcY
 p3vPeB0nuvanzOtvNJu7WO+1iD9SSlXrOZzg0HGZIcN1jlq+M0J7URgG7mZlntFQX3oe
 z7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734516884; x=1735121684;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pP8Ga7mE2+pnxKoG6TAWzyjb7hUhPfz5H4HvWCT0CdA=;
 b=XlmpQVpah+j06oH219+xTBbmnb7ibs0sVk2++DSlxersJZ13jrnHDda0NVfkx6r7HV
 Z3G6sDGtosXBb0hFkcSI0a1jWeEZQW6YoOMK1xFLzvXg46sJfjBoWEoGSLCUkVsUeNKi
 g8uq/1z8a9SYLRB5VNb/RwWxVZOgzckmJOXriyOZ0eX34gTkiBsUwwC0fl1eMQYFgLnb
 mW3mXIVhs2ASJiuUbd/URiJqAIKx7igWMMhFOFuGKTcGtaL0X9I9S9itiqNodFDKWI2I
 aRSvoZgkQPog4BM1TodHcLwWs7Q7gUyVtmE9oKDq2s02UoS6+gdZIUk802CcocTiOe1c
 keGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2C9wW6G/Uvc8khZ99MifFVZszLFd/geFpggWaw/hQhhj+4bG6R5MFRtNv9BVam0t/9KAaXgWNSDc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz77Y4V7WBnQUlgMGa0HaSSjd4QRrI2dTIAQQZlavnMkfzaXJ5Z
 HB7Xjt2dEdHQqshZTrv3RyHEK18BuOJ+04Vx1XQjRo5ZOgDF2qG5cWc3k33EDsI=
X-Gm-Gg: ASbGncsld0mSKivmrj6U676ksZp+l2wO07fyBauKHpjyXGkSiKS+ito9Qrv2a0TqQR7
 0/KcDHirdWheRPK9+bBSPDkILvkfw+YPc7+bUn7RKxFC+OBiphu8GQd/gha3ptXPieBa7g5fhu9
 ImVdZosK+RrkaXr6ERw04mxJndc0S0QYX1Jz3DbKF/hgMELTx7VkzVqlJzvsLWQI5Vs0IS/pSXJ
 4BZyVAOLk6c6e7hb0MCQUhiq6KULy7VYvw4iJOr4wzqO0lC3yWzq1p1Bqp5iYI2JA+zvV/giGkS
 C/N64YRSaUz2zUL6hAw5T+X/yYWlqE4=
X-Google-Smtp-Source: AGHT+IG085+Ib0G6qfwB057TYlTktE1vEADdk4wuAgkthQ5MdEhBToOH7qND/4ihOVTaEBN04YpGew==
X-Received: by 2002:a05:6000:1a86:b0:385:ee3f:5cbf with SMTP id
 ffacd0b85a97d-388e4d84651mr2137485f8f.20.1734516884262; 
 Wed, 18 Dec 2024 02:14:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:e596:468d:657e:c30?
 ([2a01:e0a:982:cbb0:e596:468d:657e:c30])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8046ca6sm13826738f8f.83.2024.12.18.02.14.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 02:14:43 -0800 (PST)
Message-ID: <d5160e46-7f72-4a3b-ad31-f26c33d5f22a@linaro.org>
Date: Wed, 18 Dec 2024 11:14:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND] drm/bridge: ti-sn65dsi83: use dev_err_probe when
 failing to get panel bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Herve Codina <herve.codina@bootlin.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20241217-ti-sn65dsi83-dev_err_probe-v1-1-3fdce386400c@bootlin.com>
 <20241217170635.2ba35c08@booty>
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
In-Reply-To: <20241217170635.2ba35c08@booty>
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

Hi,

On 17/12/2024 17:06, Luca Ceresoli wrote:
> Hello,
> 
> On Tue, 17 Dec 2024 17:02:51 +0100
> Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> 
>> When devm_drm_of_get_bridge() fails, the probe fails silently. Use
>> dev_err_probe() instead to log an error or report the deferral reason,
>> whichever is applicable.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> This patch got a reviewed-by from Andi Shyti when I sent it the first
> time [0], but b4 didn't keep it when resending. I think it is fair for
> me to add it now, even though I'm not sure patchwork and b4 will catch
> it:
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> [0] https://lore.kernel.org/all/ZrtuksiarZNS8L79@ashyti-mobl2.lan/
> 

Added it manually!

Thanks
Neil
