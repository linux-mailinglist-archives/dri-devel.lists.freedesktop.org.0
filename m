Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 909DEBB6484
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 11:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19DF10E0E5;
	Fri,  3 Oct 2025 09:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aYCY8gWb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB48710E0E5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 09:01:59 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-46e3af7889fso11642595e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 02:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759482118; x=1760086918; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=8htaH5UmD3BZCsFSEXxOl4TBkWtC5hWepzt68CD6TCQ=;
 b=aYCY8gWb7SO4/g335LO4inQ3OPE9uFMr1c7Ebb+5jTeAclPhOS9xPqJN5rclKw4xEM
 zW72iD+QjfjaQcGOXNIBYCmwHG/Y7CT/mlta15GFMF9ZBD/Ptnzu0uglVHjh0euuBCvR
 TaFOJYHqhf7RvoEaBRQpWpb/FZIYP2lWWgzovcWMPRtr5OYtAIiNcLeMf3PITizvIqzD
 Lh3XzcTFys1MK1UJpPEDd3+GeClBTtzOSm9jE1+Py5Rlk2QWdEOJugfwnMTdRNGO2xh8
 0NSKzRJmhyHlr/JbtgtKb6qBg/hYtffgE72sS+2sWr0lUEl0Yq0GGlaKJlZRASK3LB6V
 gLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759482118; x=1760086918;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8htaH5UmD3BZCsFSEXxOl4TBkWtC5hWepzt68CD6TCQ=;
 b=A69Fp1S5GP1gNw1eQuyHTyIbF2sHUvAR2jCvUtdi6str8nchXXXWSG7AleR+9vRbSS
 SFK8ncaEhxfGjb8UIdXy4ihMKsvFCTIZwT/Ktil1bm+F21A5ySMUdoJGXzz3DqFFDvt+
 Zoh4zC4UKBfbSte4yvjSMZxx1PNj5eFYz7CgS89jwRtlEAfEmU1L9/T9u/1pftcA3Yvu
 /hORkCv5PmJbbRXAelr7ztxAONJP6CF5x09yTrcPIv2na/wdk1h96W0IqTdVK7Z7V3nZ
 DqDvmycn4L4umUb9TN1a0p36PSny798HL2Z7/AGMjx5140Q3br6PHmxX8niTO2rrZbdP
 pUnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFKiY3Yq+mdz4OVFNVKssv6BNza1HEWGBJuiahmQRJq7EaK7D3pAXNruONBGII/eWfDOom4WEoj6o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3QeK7O5fPLFtExWeprHWOH4be013o9cUxkQ1llZckth+iEUCU
 Ar7Kvu2cHfPSEaWio7TcjDCXYvSoiu8WMyNOTusLL0MzQOL380KOyL6+Kvo62eeJ0wQ=
X-Gm-Gg: ASbGncs/fBOFUGFqAeon17J75ApA45QNvtTfy5i1tjn7MBhC8czakakunEhV+aCqoRU
 +9VM1/pn8SZWLVY5KO12vOpf9qtHpFoI2yHTj9seAMGXUs73I4mxQzkDUBlLsppDQrfb01h4STu
 0tY9jj7b7puelcxoB5AuV7yONKknxM/aeYjHV3S2Dw0ZPSDwsGbbaGSADLG6Mwh53sHRmVcnWeT
 9+IJh4rKQ8f7ZFfPkMIlc4AdX4zec+7V1N5NsIRf5s2XNHLV67dM5tDp332/aJeiVll5YysyeSs
 IXE4rSh7p+orv9X6H2bYOo6pUgSYi64U6WeniWMCBHpNXoQRPnLswsGM/lul7N8mFcaUmA7XCAR
 oRdluvORCOTzQWXRB1Xq4z5u5wqwKEnTtXnnTkc+guQJ8L1mngU+jrTG9jtcy9Zbom1MnluHGUY
 +He/rROeImXUrfWqYHJpAFxDnuLx4=
X-Google-Smtp-Source: AGHT+IFXXFYBejNEk62TTVbsZCkjTfoWLoHDUC8jbliGeXsvvT//1ANw01aVm2hkqA2pgnjHgXrrcw==
X-Received: by 2002:a05:600c:1f8f:b0:46e:4922:6855 with SMTP id
 5b1f17b1804b1-46e71111c0cmr13814655e9.3.1759482117724; 
 Fri, 03 Oct 2025 02:01:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:1516:b5be:def8:9a0b?
 ([2a01:e0a:3d9:2080:1516:b5be:def8:9a0b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e72362344sm21796015e9.15.2025.10.03.02.01.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 02:01:57 -0700 (PDT)
Message-ID: <e42176e9-cac0-4142-b463-9eaf86906c46@linaro.org>
Date: Fri, 3 Oct 2025 11:01:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
 <35jqgias5o4ruhkc72oacepcq4skfzpe4gyivg2pz7bnpy5luj@d5saa7y7rcus>
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
In-Reply-To: <35jqgias5o4ruhkc72oacepcq4skfzpe4gyivg2pz7bnpy5luj@d5saa7y7rcus>
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

On 10/3/25 03:17, Dmitry Baryshkov wrote:
> On Thu, Oct 02, 2025 at 04:57:35PM -0700, Jessica Zhang wrote:
>> My current email will stop working soon. Update my email address to
>> jesszhan0024@gmail.com
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   MAINTAINERS | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 

So dim complains you didn't review with the right address...

dim: ERROR: 261785a47e0b ("MAINTAINERS: Update Jessica Zhang's email address"): Mandatory Maintainer Acked-by missing., aborting

I guess it expects Dmitry Baryshkov <lumag@kernel.org>

Neil
