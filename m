Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16777CB31B5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 15:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913E810E735;
	Wed, 10 Dec 2025 14:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="JZZd5JsV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A618410E739
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 14:08:07 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b7a72874af1so289732766b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 06:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1765375686; x=1765980486; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6qbLwM8j/Dp2wxJ0nCOaKXGlVqK4PTIUeJRBwEf/i0c=;
 b=JZZd5JsVaNvzK4sH9w2dxduvs9dNwyTz5dJ4Yh4UD4HcGukVbzKZ3abNOaQsI4ZBY4
 ifMfNNXkPHvoqdqOZc95kFsZ3U/wLH9CdsV0PHFEu/RQFcIO2MsP10H88tfTZiLjyNS6
 oOiTyJT/jmkcWIG+6JKPOrvJvE9qupqr2rPm/Wt0htb1ksN/6kro2Z2mDJR3R5ph14cE
 zb0eQgqYW+aGnwA5sWtu+QWVoYzpFBnGODS8CP11HDOe+Y1ivDhWbjCQuVR7BUuyDFDY
 alSiyBk3sxx4OL+di90BkjBy/MnbQmfOTgViMbcGW960awAQZAdJ7TH23Ylx3tGbZLz7
 MQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765375686; x=1765980486;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6qbLwM8j/Dp2wxJ0nCOaKXGlVqK4PTIUeJRBwEf/i0c=;
 b=d6/k8XL02DfdLc3jrlSQvs8dxl0/pR2FTkk/nyOx4Au2zi5rvxMfivVYQ606EpX7CW
 EKd6R8Ql+ZpHO0QUlcaIcT9ddZm6Q1RzLWlNsUOPJJ7S54kAsmq4UzjZgpEDXqNQGVoF
 DOggpchTjziHh+F+I9/lW7G2+T34o+74ShR4+5cJvqNaL5oHGGTsI2hQGsc3He1hXbkt
 MA5TXDP60sBJiYoEE7ti7E3LN9eZsrhztJChfGhfX7W+sxq7BHb2TPMMsTLCx5vXU2a2
 qr6/zP2XcQPPDw32j1rKfwkmkpZ/1R6GpYVhMg10k/gRn4bCyb9KJDZAICzdDZJtWVAE
 lq8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1Vbn0c85w909Nil/UswBW9nnejjwPq6bNIytvKuWN5fY2c0x93w6huzXGb/pVVkyl/RdGS80WGLs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yya1APFSkYBzWIzd8aH19qy+AC9zzhhhAEe8Cl/OK0WUshyXND0
 Fp5RcaJhXnpVLqbmXu7ASG5ujYlxdzPkQKjE7dEiG4Nx+Bm8rmqMm8XBMf9+UMtQQD8=
X-Gm-Gg: ASbGncu3qI6QqVdF27dVhqu1SAVI6jvlSW40bd/+Qa7oePDVJG4bGz7FU9bTOZw3n8v
 51g8naaO/ne4Olg7AORHgxdJEjQ23GosUv+Vc7H3cffGhNyhqboKpnaYc0FT4tLUGC58zZRd3zf
 e83+OIrfA6xEqXOpUUl98AmOXEyv35EpxnkOMWyD8yhEk0ILDwRUXRaFAR6Dpob1fVqLtlf0oOZ
 V7WZdoCkSw5jQRDdVUqdtX+sN8L11A69k6fkUYd0jx//YTkdVuIo1ZW5S4b6H1i87RYyvBmr1DR
 aFdAeYSo0ns8fqrOsk1YMi3g9aFWPdRAdgKuO0W9R3GG+3ojFOzqU+dfkhpaSTwQohZllj49mPu
 gOste+11pAupxvJdybd0EKAlMyr0rsnarO4v7PLoRdfmEvL9+mMOU/5vNSUXkKuJcv/WoIHj1ij
 CUOvx0CuNZ3Y0olOGmdJfapJzhHU1k
X-Google-Smtp-Source: AGHT+IHWTYS/KWvzDjVFuOADEcyGTh4hEuGU6HfoOi1vw95aIAPW/e3jMvFNIkGOnIlpnosFn6AeVw==
X-Received: by 2002:a17:907:86a6:b0:b73:59b0:34d6 with SMTP id
 a640c23a62f3a-b7ce846eba8mr268666666b.33.1765375685778; 
 Wed, 10 Dec 2025 06:08:05 -0800 (PST)
Received: from [192.168.1.83] ([86.33.28.86]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2edf71fsm18473274a12.14.2025.12.10.06.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 06:08:04 -0800 (PST)
Message-ID: <ad82a9af-eb79-47ef-a5d3-662cff3c0ee2@ursulin.net>
Date: Wed, 10 Dec 2025 15:08:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Fix BO alloc flags
To: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Miko=C5=82aj_Wasiak?= <mikolaj.wasiak@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Christopher Healy <healych@amazon.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
References: <20251210110952.691446-1-loic.molinari@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251210110952.691446-1-loic.molinari@collabora.com>
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


On 10/12/2025 12:09, Loïc Molinari wrote:
> I915_BO_ALLOC_NOTHP must be added to the I915_BO_ALLOC_FLAGS mask in
> order to pass GEM_BUG_ON() valid flags checks.
>
> Reported-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Closes: https://lore.kernel.org/intel-gfx/d73adfa8-d61b-46b3-9385-dde53d8db8ad@intel.com/
> Fixes: a8a9a590221c ("drm/i915: Use huge tmpfs mountpoint helpers")
> Suggested-by: Tvrtko Ursulin <tursulin@ursulin.net>
> Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object_types.h | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index f94409e8ec4c..35d4c7d0c579 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -363,6 +363,7 @@ struct drm_i915_gem_object {
>   			     I915_BO_ALLOC_PM_EARLY | \
>   			     I915_BO_ALLOC_GPU_ONLY | \
>   			     I915_BO_ALLOC_CCS_AUX | \
> +			     I915_BO_ALLOC_NOTHP | \
>   			     I915_BO_PREALLOC)
>   #define I915_BO_READONLY          BIT(10)
>   #define I915_TILING_QUIRK_BIT     11 /* unknown swizzling; do not release! */

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

It is passing BAT so I think it is fine to go ahead and merge it. Of 
course via the same branch where the breakage is ie. drm-misc.

Regards,

Tvrtko
