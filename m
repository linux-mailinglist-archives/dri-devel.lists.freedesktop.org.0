Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1158184C73B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 10:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731EA113182;
	Wed,  7 Feb 2024 09:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a6prSw7K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDC6113182
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 09:24:11 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-40fb3b5893eso2990525e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 01:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707297850; x=1707902650; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Zo6yUyG1s8prj2OzCo9YS/8+1Ln1HdjhhiH9cZ+GZgQ=;
 b=a6prSw7K31DvdBzkZe7WiFwjb+NCf9rKAw0I24hJpFd7RK0uNjkGNr6IaBN1kqN4Hw
 HYJic6hXxw/vtjlgUO2LKrPOpVjiKvUngCkm70PXR8FPRTb/JueDtRytcTfJBWsz+o9M
 ywRhtK+ahSyzNb2YmUxz/mAbVWR9tPONiNFMaDzIXURil105N+f+ZWHnZ8o63MYA/yry
 Jk7JOagkipviy8oZG3chn5MgubKD2jr8SdjoPlfS2WuaNi16nD0KWIOfOGAgkaflwYT1
 SAGUzg5FOPGBvkan/l9GppC1LMwpGKUryLdS7qXkwWKH0L4IhWa4qp+E2CYuL8P6OVrY
 Bnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707297850; x=1707902650;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Zo6yUyG1s8prj2OzCo9YS/8+1Ln1HdjhhiH9cZ+GZgQ=;
 b=U6YhiNIbtUGmNM1pEFGXalP9sU6gCUD40u54fEY2ihSqSxkF0qRMovwasQggDFIy3X
 jx7YQ6782VLkEpOineA3j2rHfkWJjBETf/OTTGZwYDjEEZSEiE6cahVfPXa2/0cXSBG9
 gM4lhM1Stz6Xeliv8/3yy0w2nzPMe2XQ31CLY6DmRg6Vo4C2nO0+9LtjA+frA2fWAZzn
 E16YX4ijtUNqrRy6NnW+x9om2hwjTGKmqe0FqOd5TCeoSGF77hY1SL0MuEQcmE4K3ysa
 E9C78bAi1Eki7mHHKjiLHKRmoIZ6meBLkxrZwDOxG5eMQgnqZ35dGW5zAbGdMjWYQAf8
 Fq6A==
X-Gm-Message-State: AOJu0Yyi2wja3Bh79lbXZh9o0OmlvQ8/tZdrMUt2NgD2Jop7h4b4fjRi
 ImRjIzjJWHHmEq3J80Sy92JlkTSm/dq5iFFyJextDqJmcaEI3feicURaD0ocgCmNrtvzg1iZwf9
 IOIsx3g==
X-Google-Smtp-Source: AGHT+IGe2pU6iQCDttbsluezhdBi1CzVp4sdFRKfgyxD3wTU1d1ys8zg92ip5IfJ0ueVYpI82aZ7UA==
X-Received: by 2002:a05:600c:5612:b0:40f:d3b3:b6d2 with SMTP id
 jr18-20020a05600c561200b0040fd3b3b6d2mr4062915wmb.14.1707297849851; 
 Wed, 07 Feb 2024 01:24:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUxnV2TfuOXYpdtmQNNXwULpzmPJaVG7nA+/wdIgXxMKxV6M0NDIkyY2VylHXYREpKV6p2s+3U796DI90OTR1eSDbg1RZlAhhaukJjAIGf/tPY5C/v3bkdKPdQDqVfFoipvjSk5lXXjkG4uPQWKou5G+iQj/RIjS9Gs2RbxFTZOQVm+PzwWY8buU9mhK24ZfutSizj3kxNISTemK/BLKxB3dTzJHzzauV1rb1LcgunHxcy9d7PHshfe4RTzbdRxxTaNmwudjEOhhHGmkYiNWlDiUiW/7tls8X2huGfEMaokIi9w0YYwl8a8/ReUVKIaHrvyYUizvE7iLAB/lp6GysAfBaFEt7bPGw3W6mFdbdvlL0D5EKoT/tAEdjp2vRSH/YCtKt+fhmEORcDL/+wRrEwNWpafACfflItlJKzx/iaMEhx0GnHrGit9o9Y+rJ0AvsaeprKxlpECmQt18CBprxvupQwH6pUe9rd+Ni3GhBUsHX3G+hChUrpxQQ3wY3YIcpj8EZ1HmnQy16JruDdqIoAyKEUtFg7ku1YdliEG3as4RvF6kPvq6CuT6ivvJPVjUzzUoVTWAkzeqGCs2NtQKpQC0g9USxXyoL5QLqr5Jd+RXZErf0kKcaqo08NNYmlYKCNxHHTt46koxp+rUtuh7MgBVO43XRodN8WCaWra7+BUB+dzj88prZ0Mg8L8qhMW1GV4a9YjrSFJTrTvy6i1y7lNsbmh4U7mpKwUpuXQdfuZ
Received: from ?IPV6:2a01:e0a:982:cbb0:5ae7:7fdb:32ad:f6d7?
 ([2a01:e0a:982:cbb0:5ae7:7fdb:32ad:f6d7])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a05600c154800b0040fb03f803esm1434724wmg.24.2024.02.07.01.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 01:24:09 -0800 (PST)
Message-ID: <7b71ab7f-7ea5-4144-a7c5-d0b66ab13476@linaro.org>
Date: Wed, 7 Feb 2024 10:24:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: imx8mp-hdmi-pvi: Fix build warnings
Content-Language: en-US, fr
To: Fabio Estevam <festevam@gmail.com>, Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nathan@kernel.org,
 kernel test robot <lkp@intel.com>, Liu Ying <victor.liu@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Lucas Stach <l.stach@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240207002305.618499-1-aford173@gmail.com>
 <CAOMZO5A1yiXiLOtR=H_4vJYAMGwjpqrErCzvSkmLoB_f6_rN_w@mail.gmail.com>
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
In-Reply-To: <CAOMZO5A1yiXiLOtR=H_4vJYAMGwjpqrErCzvSkmLoB_f6_rN_w@mail.gmail.com>
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

On 07/02/2024 10:22, Fabio Estevam wrote:
> Hi Adam,
> 
> On Tue, Feb 6, 2024 at 9:23 PM Adam Ford <aford173@gmail.com> wrote:
>>
>> Two separate build warnings were reported.  One from an
>> uninitialized variable, and the other from returning 0
>> instead of NULL from a pointer.
>>
>> Fixes: 059c53e877ca ("drm/bridge: imx: add driver for HDMI TX Parallel Video Interface")
>> Reported-by: nathan@kernel.org
> 
> The Reported-by line format can be improved:
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> 
> Thanks

Fixed while applying,

Thanks,
Neil
