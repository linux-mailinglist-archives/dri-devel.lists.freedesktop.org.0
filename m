Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41635B1A5B5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 17:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E57310E58D;
	Mon,  4 Aug 2025 15:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="E0xKhEem";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F99110E58C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 15:19:31 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-45629702e52so11892375e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 08:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754320770; x=1754925570; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=EtfsrmeYAGdv6VNJegK9X7GXsxap8vbNDXlKO4YuuF0=;
 b=E0xKhEem3sdOrEEuGPLbra9fhgesh0kjDzW9yt1uxsrT4Qw5iu5Li+DNUB81PMJMlF
 hA9+HTK/VG4AUGMCe56/WXIXaS8ycBmta+eFy+16LUV5jAWI8RKjzfuFF4YLfO3At926
 ool737eD2RD7dwtWUKWxSlY20mRRwjNZnv4knlqjyS1GeV2PHpaNNaGDwKqrHtdR7LkT
 hbpvsBJ/kbitmwfVNKMQ7QyjrsYWpmuNd+QZahrSYAz5578o5oyBB0lHyj2ZRCN2YaeZ
 qIm3IAylV94/wdDBAUpPP+qXPxChmZ98EGF/4fPrPLov8VJIjp8CIq6BH9ejIc9X0PW8
 gSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754320770; x=1754925570;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=EtfsrmeYAGdv6VNJegK9X7GXsxap8vbNDXlKO4YuuF0=;
 b=vSshmqWbPCNkgNViop3KKIGNAH3G2HP6s/Yk7fI1OHW7b7RmwQ4I6ByuU56JzkiFX/
 8CFBXnea+fOyOYy3hgU6WwWpn/Z0FNFFsOCHXPvOCyhcU9opetdDMyRquCE+hkEIUBgU
 kSKYdFsYs7b3eQnnPbQbazw6Z0FDROpt/jkcPC5RBf+55bWFvFfPkuD4P8KwuVclMj7c
 p+mk8A4O8KnPgB7Rz2r0aMHDSfcATuDQOOcoLFymVwyB1Mc1eOIJCP0TRn9rKlYrf3rE
 hUh59cvq/wLkmwGjecJt6GClzsuHRBQCzCZf3vntM7dmmq4tf5zO5xzjF/jV3Cgovx/r
 VCGw==
X-Gm-Message-State: AOJu0Yz3Utn5VFd+waGgqeTowecK0EJm+PRfFATIVhVLzghxVLs8ij8t
 yuaYjDsOU09Fdevg63ksuAQPkHLfb/aIXr1RKDUn5CEWoan+ryTqOHEECcXCoDcdzW8=
X-Gm-Gg: ASbGnctbws/TsZDcuBxDRJHKjUVa7o/J0uIVyLAj4Cm41JOywaCv2/xVPcF3u2uMR+v
 P4aatnt4zJXBzIIuTKBwCuVZVnw3ocxHVWAZHs6nGKLad/KVo9fNhBkWuRgPXWIO9Oz4O1yAJIZ
 h1xQDEcBPm7dlE3thUfSqXxCEqWlnULcgz6bwrNZJBs8evrIJTql3oIMIG7DFNmuZ5wvT7fC2ps
 ekOODrTxAj9ooueMopW2N5/jGX2CZj3OwixZfYtIYbSZaUBKcLeHURgVcjBOlU61FLjEVR+L1Wh
 1vHZ7VWRg0+uOAQtnYPEu+Q/twJ+pAWrlVj0/7vCBH0oqW+1WmljjzLId3o/6os2kHfTBXlVGiy
 SMR1VQ5uV5FwLWWMSXEMXhXteQYUBs5AJetwS+I7UUsogo+agkgT5aHm7Y1SoBvKA3hG/jTuy/F
 k=
X-Google-Smtp-Source: AGHT+IFVF1ODkUB1OdYXOWOHu0AspSQEel4BFpbUYVZ+7jd2xVYD2zN7DNDKT6oJnKJ7NlR9U11KQA==
X-Received: by 2002:a05:6000:2882:b0:3b7:73b5:e96d with SMTP id
 ffacd0b85a97d-3b8d9470335mr6765893f8f.15.1754320769927; 
 Mon, 04 Aug 2025 08:19:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3030:f63e:fedd:700f?
 ([2a01:e0a:3d9:2080:3030:f63e:fedd:700f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c4696c8sm15609805f8f.55.2025.08.04.08.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 08:19:29 -0700 (PDT)
Message-ID: <ca6aa2e8-d15e-4d7a-a440-5ab814699390@linaro.org>
Date: Mon, 4 Aug 2025 17:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm: panel: orisetech: improve error handling during probe
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, asrivats@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 akhileshpatilvnit@gmail.com, skhan@linuxfoundation.org
References: <aIJagJ/RnhSCtb2t@bhairav-test.ee.iitb.ac.in>
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
In-Reply-To: <aIJagJ/RnhSCtb2t@bhairav-test.ee.iitb.ac.in>
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

On 24/07/2025 18:08, Akhilesh Patil wrote:
> Use dev_err_probe() helper as directed by core driver model to handle
> driver probe error. Use standard helper defined at drivers/base/core.c
> to maintain code consistency.
> 
> Inspired by,
> commit a787e5400a1ce ("driver core: add device probe log helper")
> 
> Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> ---
>   drivers/gpu/drm/panel/panel-orisetech-ota5601a.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c b/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
> index fc87f61d4400..e971d1536654 100644
> --- a/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
> +++ b/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
> @@ -277,11 +277,8 @@ static int ota5601a_probe(struct spi_device *spi)
>   		       DRM_MODE_CONNECTOR_DPI);
>   
>   	err = drm_panel_of_backlight(&panel->drm_panel);
> -	if (err) {
> -		if (err != -EPROBE_DEFER)
> -			dev_err(dev, "Failed to get backlight handle\n");
> -		return err;
> -	}
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to get backlight handle\n");
>   
>   	drm_panel_add(&panel->drm_panel);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
