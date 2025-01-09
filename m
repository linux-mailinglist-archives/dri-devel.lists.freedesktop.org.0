Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA7FA07631
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 13:56:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E9A10E021;
	Thu,  9 Jan 2025 12:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="gWldjb57";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B4F10E021
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 12:56:06 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so11036655e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 04:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1736427365; x=1737032165;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9WqY/h/bcn1twZ5Fg6im9L2+kr0LiyIHsmlOD7PpqUU=;
 b=gWldjb578bAWKsnqAjIIORmkBNDXA6LrY4ZsRD1w+ou/MjYwYs0knVjsgRuuNWSRmr
 vLkxjeC1c7wJhyQLFy4MBGH/MkxjuPJEL5XfsYRpyu5pF+LtXvEZzLWbgKX78JQfM9RF
 2UqLtKcFW/B6JnJ6ogOcmFMF1gSJxq47yzFj+dX0F4Y+/UjwEhA6jRqnJkbXfH5DXW8Q
 JfEhaB5mHTi1jpssXl8wVtV00aE5Z9xlRwXoXER35LT9WeUmurQwm0JAolaKLGo5qRI7
 NMLJfY+4Ru1uICvIduDGB44Zo4lbfWj3zxk7sW9UYto8j/gUiJGC9A7KZDkwwRx4Ug6M
 Qybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736427365; x=1737032165;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9WqY/h/bcn1twZ5Fg6im9L2+kr0LiyIHsmlOD7PpqUU=;
 b=MW/Kanow4TIaDqEOhQ5M90p7s9H2uuOTMmJdDxg3x3DVRLOIzF5E1RumsHoojp67ih
 3ut3gG+IxeCrt3FZUVbgCSMaEo2wEHPwp5hIRjJB5go/IhShnkkJKh8/y2cX/P7Xhz6S
 L1bf88OHCtvWI4omL9MJlHBCQvMnphZcJ4mordpbDJMzcCAbrxqSzS1bHmHcT+ddW1+R
 ffRv3fhNuL/PVZHrK/CxsRgXZE7sb13Wd+I8W+dlW2KHdQlFxo5211VV+yeX/oHUbQYv
 byw3BFq7eiNU4qJCatRYGMkrLnVK88C5YO6SoR7AACajwWmmodDA2BuFjYgpRpRWJAFT
 KRpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoILqyNzDRf4Z99HiVNwHt2qrxJlLFj3TWpTLTpymmlW7hasd+f9ekf1ekLAp/4LM3hJc00dQ3eS4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUKRLr18jwvXKltBAybKpZcoJF+EcEqDyyxExqGcabhlC64lj8
 3JM7QXWfX0m/D1jxY7iIJH+AFouxzmsfD/tlZ6llHFvEpP2EtZ/rDQltfAkDiUU=
X-Gm-Gg: ASbGncufOa6R+hjm3SHJLRSicII+OPLzKSjcfqepnb1h/882L7nZB0hrueYN5pyfYlY
 TjiFy086GJWFrqA1G2/R0cZ8NHiLD6OVdll0HBxXAWeZiI2IqVBWUf5cJvgoHEvkd+k6x6N+p8X
 zrvxL/gg0qh1uLioKOsX7baIOlblELKql80q5MQpZexDdMphJHqS/d3u9Sit7ArvE4YsnLEGm21
 5Gx0fXj0k9018SR0IoBok1ig1fcbTtGS1EPcYEZ3IDeg6QpAayeVPtW8EOwDhr6zJLbTsGU
X-Google-Smtp-Source: AGHT+IHdDqdu12f2GBL1HlTu2c/FxLg9hn9Q8O0SNbAfDWrZrZZD5lDtD/M12rK8SmBmODPlL0KScg==
X-Received: by 2002:a05:600c:3152:b0:434:f9e1:5cf8 with SMTP id
 5b1f17b1804b1-436e271d3a2mr68776305e9.31.1736427364919; 
 Thu, 09 Jan 2025 04:56:04 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e89f29sm54397995e9.28.2025.01.09.04.56.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 04:56:04 -0800 (PST)
Message-ID: <8d856a0e-9226-405d-857a-35c2807e35fe@ursulin.net>
Date: Thu, 9 Jan 2025 12:56:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] Documentation/gpu: Clarify format of
 driver-specific fidnfo keys
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250108210259.647030-1-adrian.larumbe@collabora.com>
 <20250108210259.647030-2-adrian.larumbe@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250108210259.647030-2-adrian.larumbe@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 08/01/2025 21:02, Adrián Larumbe wrote:
> This change reflects de facto usage by amdgpu, as exemplified by commit
> d6530c33a978 ("drm/amdgpu: expose more memory stats in fdinfo").
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> ---
>   Documentation/gpu/drm-usage-stats.rst | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index 2717cb2a597e..2b5393ed7692 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -21,7 +21,10 @@ File format specification
>   
>   - File shall contain one key value pair per one line of text.
>   - Colon character (`:`) must be used to delimit keys and values.
> -- All keys shall be prefixed with `drm-`.
> +- All standardised keys shall be prefixed with `drm-`.
> +- Driver-specific keys shall be prefixed with `driver_name-`, where
> +  driver_name should ideally be the same as the `name` field in
> +  `struct drm_driver`, although this is not mandatory.
>   - Whitespace between the delimiter and first non-whitespace character shall be
>     ignored when parsing.
>   - Keys are not allowed to contain whitespace characters.

LGTM, thanks for documenting it!

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Native english speaker maybe could clarify if s/Driver-specific/Driver 
specific/ would be more correct.

Regards,

Tvrtko
