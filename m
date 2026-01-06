Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC9ECF7415
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 09:16:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F2210E4A2;
	Tue,  6 Jan 2026 08:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lGkMQwZM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1C910E4A2
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 08:16:16 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so7363245e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 00:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767687375; x=1768292175; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=W5SUZbPKRAp1orRSy5U5l8N3ntePBeKY5akLT99BApg=;
 b=lGkMQwZMjxj14iqiUQ3CJ2ifOKKnumjfDTBo5q0v96AveGTDZn6tQI9MGveawyzgPc
 EqL2UbUCVHi6NNDylUWBzx5MpjU2UqfFb6R/uHxJevMsbZiQb5A8WyxdhlpERb2B+Qza
 LsudntKMIIxxWwH91iN5vDdIPTKqQaFU7TPSdV9t5htBMVvcQDb4cr/vcGwjXXQmhBOO
 oIcpivgXdlIEn+mPrhysn6fAqdBrm+tWZfw043+MZKw1TyOZQn3IGkh440OGkej52IMP
 9NmUkQs91hnP8xMYQ28HhVsnbS7AyQ+gl0ca6alryX4ShbV6fnUcY+iNZyULY9vMtncd
 3rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767687375; x=1768292175;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W5SUZbPKRAp1orRSy5U5l8N3ntePBeKY5akLT99BApg=;
 b=TdzFBR6zXW/flRkCtPkq91GGInXN/Qoz9T97pNZYZVqXIQSvkPGdJfOxUqfDAmoovu
 8b3h+GFH+iBD7TqW5C+aloX4TxF6BpFzc7lOM6ynxXg2OK8H5BQlF3DSR2eFFS3qAlCX
 RCs9NdQelZUaEYT9iQny/G1rQViPUQmtZisIghv55ou7wzOG0zfyiWl6oLD8aKCxDNw+
 PtE4EHAet9QHaPDzPIZJYpIkyu9DfVb8rQeLZvpHTBeEUnSk4gPcz3bDiFQqP2Gc1c4b
 XmLdZUgDu05EoTDMDgsfinUDMJCcBDh/iJro8Xw+T5MuLJQQurJCoT27HZ3sli/0IYtc
 l8lQ==
X-Gm-Message-State: AOJu0YxEFKJCFBkoIxo0rnWug+B1Xz4Th3Xt415hmNgNzFNMpQUuK07I
 gEl21SvyRhyzt7ufJ9IKpodiryJwZDxhFmsUNYlbBwWqR4Fbn7B3sHEW1G0uQHPSljI=
X-Gm-Gg: AY/fxX5jIAa+hlqJMjlwQwi7rCLcQibNgufvMBBfihCpgHA6njKgHES1WL+P5Vom/MO
 O057K/iTx7tdagryNixc4/UPM1sA0v51vtKsJteXQnvul4Sbp2V8T4sHZoSuU++V0LeckyG1304
 qDBSb+wbke0/pZUrf+HP/qCYW2KWtt0LqxqH3qFmGhMkQvtqP37AbUZi1PGpVdAF04H/bKj4UnE
 RJEqCAREICLWwbyeSFcoL1SR/es0DWy4cboY2usy7hUeHxZ2hlCuu3mW0cs85Bb/mBhMgqJGtnJ
 SuzJkCIZUZ/7QpfhcFj7dlOyA3yVai32+gpm9dNgpbDR/ouppznJvCm0b77cr3FCnwYVbXTeeoX
 8PWCwZYJlZFPh4w1PZZuXlaEVOb9KeUyo5/+xE4ixbLlaswGYqodftfP+rZJ3VpiYnZl/my5FLi
 DD08VVZQEfNV8u5ADLarbkW+o76TJNdlXcYH9lVn0dqiDVZWUWs1Jznb1vNWhPRFtUen/ANegvY
 A==
X-Google-Smtp-Source: AGHT+IFavEMjhNTuZ/4c5qvbfHB75tWynGL2ilMyvYxx3psnsJm6gZCBpY6I+NF4ssfoU8R9Yd1rJQ==
X-Received: by 2002:a05:600c:848c:b0:477:76bf:e1fb with SMTP id
 5b1f17b1804b1-47d7f075bb8mr27499215e9.16.1767687375359; 
 Tue, 06 Jan 2026 00:16:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d?
 ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7fb65ed7sm11595155e9.19.2026.01.06.00.16.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 00:16:15 -0800 (PST)
Message-ID: <d511c223-1275-406d-a9ba-1b5751a16d93@linaro.org>
Date: Tue, 6 Jan 2026 09:16:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/5] drm/panel: mantix: Don't turn on MIPI peripheral
To: sebastian.krzyszkowiak@puri.sm, =?UTF-8?Q?Guido_G=C3=BCnther?=
 <agx@sigxcpu.org>, Purism Kernel Team <kernel@puri.sm>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260105-mantix-halo-fixes-v1-0-1ebc9b195a34@puri.sm>
 <20260105-mantix-halo-fixes-v1-5-1ebc9b195a34@puri.sm>
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
In-Reply-To: <20260105-mantix-halo-fixes-v1-5-1ebc9b195a34@puri.sm>
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

On 1/5/26 21:24, Sebastian Krzyszkowiak via B4 Relay wrote:
> From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> 
> It's not necessary with these panels.
> 
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> ---
>   drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> index 30e378faafcd..13352cb4ad77 100644
> --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> @@ -80,8 +80,6 @@ static int mantix_enable(struct drm_panel *panel)
>   	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>   	mipi_dsi_usleep_range(&dsi_ctx, 10000, 12000);
>   
> -	mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
> -
>   	return dsi_ctx.accum_err;
>   }
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
