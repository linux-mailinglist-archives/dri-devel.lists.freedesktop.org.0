Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD28AA7DA6C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 11:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE40010E410;
	Mon,  7 Apr 2025 09:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iZ3LXYra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277D410E410
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 09:56:59 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso34144325e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 02:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744019817; x=1744624617; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=PXtqCwPGOTKs8L6GKHRE/kkT9Mxg+yW3hoQGIrcCqFo=;
 b=iZ3LXYra8hbk6RPJfbByblDn1M9muKJm58B95Y9jebREo9m4jlEHxoBiSlXbL4kcHL
 onFyl4HtJjsrEMjKbKfETRUMw6cFLxf8OLl3H3qapZYpw2Nszi3OjOugS9+AqaAFpHy/
 OAkult74i+cEb86m9o+S7FJyTNcM4OQKiMb8FJ7KKBCmAm9yUAUnDetvKbPTVLlbF17c
 hx8542mhX44Uni2mah5q/gq9ZQzBkRX8nZWWOJLqtULGEEex/Vt8apeA9NVwT+QZPspk
 2xjafG29TDleFKxiUrkHa/yFqPqQnLB8pw/8SN0yjYIc/+VRl9TipVPI7K23W9wNWRzM
 uSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744019817; x=1744624617;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PXtqCwPGOTKs8L6GKHRE/kkT9Mxg+yW3hoQGIrcCqFo=;
 b=fx3s57V8O0BGzSIi7OQm5q1R2aXMktTndAyY4qsADxA0l/7nivF3om+kGAhZU6twt9
 ZO4oI4NJ/wsFiqs4QIftMDN/NV9ai7lpFaFqraSUH4IsOnI3e0RhQ4CDwdqANwd4hZpU
 NkSEgCfdusZIeY5OTfKplyVtwkVuxyPhCDHsOrjrOu6Y9nXc1i/6AMDmGg5UEgpUb/r9
 aTlkwTQGViHLyG5nJd5YlbjDMhKn6DmOog3NDPDIMhKJpDSZRyFwCJ8QRHrHzxzV1vjb
 CTIjA3oB4S8a0byhhBYkJrLXXc1qdXrbCzKYWixockGVm1Gsly7KMyyq4eheAdlf74vs
 9SBg==
X-Gm-Message-State: AOJu0YztFUQZPg86AjbVhBCOw3bD5kW4bJ1JzaDkL4XohvD3R6dytnu/
 9OB9TkANannfNAMdlbYsrz3YxXN1MlnkbbPWnUpsaPL6dKI14i0eAAozwVbCCdg=
X-Gm-Gg: ASbGncsTY2aPlO4qbtr2ASUnSVQ0qwfE1L0Xb5uHVUuyB6oKB4aM6sK90KLf8H9hoVh
 acYQjZOTbTrc4AYgUKooP7Sbmscoc8hCqgqJmjFKCjTVN+kIXpeeobFQnXgC6adohoE6MuMBVIS
 AQd7J+aeNPg0ooUCRXOM1F6mCzlov9GX/RGqyWHip9s+WxCkq0NSc/Lfz4whP/OovpmyVjISbKV
 aOPCMvwZ2I3ZAJRn6IFY33KXzn0mHchwZMwV18mxqchTEzk6Qj0BG/PtqsIjyfOhS6lGAWH4n9E
 SSdrbJZ/P5RMN18F+eoAPePXrdy6M3cPY+6BBGTkxj7rJP9cmwLYRanjYRDBEgkx6VI4ECpT9mL
 2Y37nF/6IPpwcv1OkpNHf8Q==
X-Google-Smtp-Source: AGHT+IGU2+WQhScNT5O0ujSkyj7O28i+4bRrJV5EXLwXCElRsF8EUKl6PmmqVjvZ3YzPzMY4tmmXYw==
X-Received: by 2002:a05:6000:1849:b0:38f:6287:6474 with SMTP id
 ffacd0b85a97d-39d6fc49319mr7003160f8f.15.1744019817487; 
 Mon, 07 Apr 2025 02:56:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f2a4:b974:cba3:a605?
 ([2a01:e0a:3d9:2080:f2a4:b974:cba3:a605])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b7dedsm11679840f8f.52.2025.04.07.02.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 02:56:57 -0700 (PDT)
Message-ID: <0f653e3a-0402-4a8a-9191-97de04ba2b7c@linaro.org>
Date: Mon, 7 Apr 2025 11:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 00/30] drm/panel: Use refcounted allocation in place of
 devm_kzalloc() - Part2
To: Anusha Srivatsa <asrivats@redhat.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>,
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Michael Walle <mwalle@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Linus Walleij
 <linus.walleij@linaro.org>, Jianhua Lu <lujianhua000@gmail.com>,
 Stefan Mavrodiev <stefan@olimex.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
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
In-Reply-To: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
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

On 03/04/2025 16:16, Anusha Srivatsa wrote:
> Start converting drivers to use the API - devm_drm_panel_alloc().
> 
> Sending next 30 drivers. Sending in batches for easier review.
> 
> Part 1 of the series : https://patchwork.freedesktop.org/series/147082/
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
> Changes in v2:
> - Remove drm_panel_init() from probe function in ilitek-ili9341 driver.
> - Link to v1: https://lore.kernel.org/r/20250402-b4-drm_panel_mass_convert_part2-v1-0-903b70999ea6@redhat.com
> 
> ---
> Anusha Srivatsa (30):
>        panel/panel-elida-kd35t133: Refcounted allocation
>        panel/elida-kd35t133: Use refcounted allocation in place of devm_kzalloc()
>        panel/fy07024di26a30d: Use refcounted allocation in place of devm_kzalloc()
>        panel/himax-hx83112a: Use refcounted allocation in place of devm_kzalloc()
>        panel/himax-hx8394: Use refcounted allocation in place of devm_kzalloc()
>        panel/ilitek-ili9322: Use refcounted allocation in place of devm_kzalloc()
>        panel/ilitek-ili9341: Use refcounted allocation in place of devm_kzalloc()
>        panel/panel-ili9805: Use refcounted allocation in place of devm_kzalloc()
>        panel/ilitek-ili9806e: Use refcounted allocation in place of devm_kzalloc()
>        panel/ilitek-ili9881c: Use refcounted allocation in place of devm_kzalloc()
>        panel/innolux-ej030na: Use refcounted allocation in place of devm_kzalloc()
>        panel/innolux-p079zca: Use refcounted allocation in place of devm_kzalloc()
>        panel/jadard-jd9365da-h3: Use refcounted allocation in place of devm_kzalloc()
>        panel/jdi-fhd-r63452: Use refcounted allocation in place of devm_kzalloc()
>        panel/ltk050h3146w: Use refcounted allocation in place of devm_kzalloc()
>        panel/ltk500hd1829: Use refcounted allocation in place of devm_kzalloc()
>        panel/lg-lg4573: Use refcounted allocation in place of devm_kzalloc()
>        panel/lincolntech-lcd197: Use refcounted allocation in place of devm_kzalloc()
>        panel/magnachip-d53e6ea8966: Use refcounted allocation in place of devm_kzalloc()
>        panel/mantix-mlaf057we51: Use refcounted allocation in place of devm_kzalloc()
>        panel/newvision-nv3051d: Use refcounted allocation in place of devm_kzalloc()
>        panel/newvision-nv3052c: Use refcounted allocation in place of devm_kzalloc()
>        panel/novatek-nt35510: Use refcounted allocation in place of devm_kzalloc()
>        panel/novatek-nt35560: Use refcounted allocation in place of devm_kzalloc()
>        panel/novatek-nt35950: Use refcounted allocation in place of devm_kzalloc()
>        panel/novatek-nt36523: Use refcounted allocation in place of devm_kzalloc()
>        panel/novatek-nt36672e: Use refcounted allocation in place of devm_kzalloc()
>        panel/novatek-nt39016: Use refcounted allocation in place of devm_kzalloc()
>        panel/lcd-olinuxino: Use refcounted allocation in place of devm_kzalloc()
>        panel/orisetech-ota5601a: Use refcounted allocation in place of devm_kzalloc()
> 
>   drivers/gpu/drm/panel/panel-elida-kd35t133.c          | 10 ++++------
>   drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c     | 11 +++++------
>   drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c | 10 ++++------
>   drivers/gpu/drm/panel/panel-himax-hx83112a.c          | 10 +++++-----
>   drivers/gpu/drm/panel/panel-himax-hx8394.c            | 11 +++++------
>   drivers/gpu/drm/panel/panel-ilitek-ili9322.c          | 10 ++++------
>   drivers/gpu/drm/panel/panel-ilitek-ili9341.c          | 10 +++++-----
>   drivers/gpu/drm/panel/panel-ilitek-ili9805.c          | 12 ++++++------
>   drivers/gpu/drm/panel/panel-ilitek-ili9806e.c         | 10 ++++------
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c         | 11 +++++------
>   drivers/gpu/drm/panel/panel-innolux-ej030na.c         | 11 +++++------
>   drivers/gpu/drm/panel/panel-innolux-p079zca.c         | 11 +++++------
>   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c      | 10 ++++------
>   drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c          | 10 +++++-----
>   drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c    | 11 +++++------
>   drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c    | 11 +++++------
>   drivers/gpu/drm/panel/panel-lg-lg4573.c               | 11 +++++------
>   drivers/gpu/drm/panel/panel-lincolntech-lcd197.c      | 11 +++++------
>   drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c   | 11 +++++------
>   drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c      | 11 +++++------
>   drivers/gpu/drm/panel/panel-newvision-nv3051d.c       | 11 +++++------
>   drivers/gpu/drm/panel/panel-newvision-nv3052c.c       | 10 ++++------
>   drivers/gpu/drm/panel/panel-novatek-nt35510.c         | 12 ++++++------
>   drivers/gpu/drm/panel/panel-novatek-nt35560.c         | 12 ++++++------
>   drivers/gpu/drm/panel/panel-novatek-nt35950.c         | 10 ++++------
>   drivers/gpu/drm/panel/panel-novatek-nt36523.c         |  9 +++++----
>   drivers/gpu/drm/panel/panel-novatek-nt36672e.c        | 10 +++++-----
>   drivers/gpu/drm/panel/panel-novatek-nt39016.c         | 10 ++++------
>   drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c    | 11 +++++------
>   drivers/gpu/drm/panel/panel-orisetech-ota5601a.c      | 11 +++++------
>   30 files changed, 145 insertions(+), 174 deletions(-)
> ---
> base-commit: de04bb0089a96cc00d13b12cbf66a088befe3057
> change-id: 20250402-b4-drm_panel_mass_convert_part2-5f258b0ae5ea
> 
> Best regards,

With the 2 nits fixed:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
