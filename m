Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A59596427E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 13:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF9810E613;
	Thu, 29 Aug 2024 11:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lJodMu4X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AED10E613
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 11:01:35 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42bb7298bdeso5141785e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 04:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724929293; x=1725534093; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=bXo6HubkCKATDdKmpK9Rg0frF1Oj5dEqDFqJTWbwDPA=;
 b=lJodMu4XR8M0kLwiy6b+ldwMGUOjEWczDu2BB/3Fk9s0yhLVV3u8jrwyfpDWKf28RH
 zXG7GEdzpf9fDKn/xxvmjz2GkjsnQIbPXTSHUPTncP6uz7SOpkpY/Sh1B7g2oJDI4XhD
 4gVZQF+urUekKWVFsb4yEDsVCiAsjalQkI9DQQiVxMsd+EO082/bGZEExsCsx1vCArGv
 s5YAsWW9Eh+TV2NDyIhPCp/YhotxOmnyv5y4ZydAsNK/wHeno4ezPFOFtDRLrrKUsj17
 kat11+EHKYUD6a9pVKCYqAImFxAl+O6aCNg065GafeISmzmjCk29wyd+x4h7m8UZWRop
 F+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724929293; x=1725534093;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=bXo6HubkCKATDdKmpK9Rg0frF1Oj5dEqDFqJTWbwDPA=;
 b=ubPteFPiABNNZzST0Or52kAiyzxyMBQssiL+zbY6D8IOY70TztvKyFRIz9h2soDGVX
 4f122Nqb66eSug9sNNRcG6+IkV0yokMZJLYXR2EcENLMkW8DSKS4vxp57nbZNpSqWDyJ
 /lykbgwXjT3gWZviiV2qxAf7ANit4yBElKecdUpnDJrCNyhxUfbRwYSN4Xd6/Hr9un5C
 2ktQcOUjVkE3BV8+roIKjyO7wuTh3ALzQ3tCsJPlTr+qADtlH9yT633Wt8nF6ZyPXUD0
 iyFkNyrube31hU+ENJvV7hjIOyNnEz0R1v0sKXZiANvnf0OLpPfXoFPwilDxuzlRGP42
 MZqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI5nSJ2arZvVS9j7MeBkdBvVArQLTAMHzZZw9O0JuWpVEtl82XN+vZP2mIRWkWn8BTgbe/tSXkM1w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz38X8asb7fIqX8sP5Y+jciBSLHANuvz9UmsmXrGCembqe76qSo
 IlSm73FnsCGS6ehVyDG5zF+wWf2jZlf7OgG+se1r2rblNbV2UAVMaFp6v77o4YU=
X-Google-Smtp-Source: AGHT+IEGRHFHlM0ZIqrANJERtt9IfqKCUYiVh/PmrfILo/hL0bRzQIewiOrQKcnbyufRBxVZ5itMFg==
X-Received: by 2002:a05:600c:4f42:b0:426:6b14:1839 with SMTP id
 5b1f17b1804b1-42bb0136dadmr25924465e9.0.1724929292917; 
 Thu, 29 Aug 2024 04:01:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:12f5:c9c:a0e1:6915?
 ([2a01:e0a:982:cbb0:12f5:c9c:a0e1:6915])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42b9d9561b1sm57733065e9.0.2024.08.29.04.01.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 04:01:32 -0700 (PDT)
Message-ID: <2da89096-a68e-4b9e-ae45-87ccc76c9c72@linaro.org>
Date: Thu, 29 Aug 2024 13:01:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/panel: novatek-nt35950: transition to mipi_dsi
 wrapped functions
To: Doug Anderson <dianders@chromium.org>, Tejas Vipin <tejasvipin76@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240828182210.565861-1-tejasvipin76@gmail.com>
 <CAD=FV=V71VzJk81YALO4ufohL0a4EQuqZVXavbpM=bqHgsf0sw@mail.gmail.com>
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
In-Reply-To: <CAD=FV=V71VzJk81YALO4ufohL0a4EQuqZVXavbpM=bqHgsf0sw@mail.gmail.com>
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

On 28/08/2024 21:26, Doug Anderson wrote:
> Hi,
> 
> On Wed, Aug 28, 2024 at 11:26 AM Tejas Vipin <tejasvipin76@gmail.com> wrote:
>>
>> Changes the novatek-nt35950 panel to use multi style functions for
>> improved error handling.
>>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
>> ---
>> Changes in v2:
>>      - Style changes
>>      - Fixed changes in logic
>>
>> v1: https://lore.kernel.org/all/20240824084422.202946-1-tejasvipin76@gmail.com/
>> ---
>>   drivers/gpu/drm/panel/panel-novatek-nt35950.c | 211 ++++++------------
>>   1 file changed, 66 insertions(+), 145 deletions(-)
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> Neil: Let me know if you want to land this or you want me to land it. Thanks!
> 
> -Doug

I was already applying stuff so I applied it !

Thanks
Neil
