Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4EEAD6E5C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 12:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D218D10E77B;
	Thu, 12 Jun 2025 10:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="3RYPi3N9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BCD10E77B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 10:54:05 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so456713f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 03:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1749725644; x=1750330444;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GxQFgQ/4qwTPb8prTWvxvzUBOvzju4RMhJyaNcL4t/8=;
 b=3RYPi3N9xxX3H56cGBW/jig+qpH3a7uIf3VCT+MrOCELhc+AaPsMNaDANslhkWw8Oo
 BEVUwRdFhBniuLy0umlM+5P7FNmfglGn/ViP1rNLv4f30zJ6mY3PaBS2MbN9Rd9nJyg4
 HVg3ztrq589OltectEtmPrqseCLbN4DengEmadnmRRPObx0BxZeXXAS69cZN4DDrUZbj
 5Ywf8q6eVCJR5asz6Gr/IMedPFTdLxux4aXwL1PlhDu47FWNlXyuwVkpEX/PR/Ddm2qI
 9kBEOL3joI1yYuzbgLtuP1ha/w1JZXImt1icdrTncB8JNh3brmlOj9gn5ZrLgYrUIbqc
 VIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749725644; x=1750330444;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GxQFgQ/4qwTPb8prTWvxvzUBOvzju4RMhJyaNcL4t/8=;
 b=FylRU7OshHQUH6EY/aY0eDrD0yVvhBkXAkWXivLWWhOxBnhUZPdMB2N+3Dxjdi+tog
 yMNdPDTeFA92ue+TkBcF2y+v1LqiBlWjwVafqLDVB/38JV5aL54Ngy4DmtFuIYXU+7Pb
 gZwxlimcXOd90YOFATveQUpMndkaF0SNrYlUVHZw9557y2k8CZ/2ceLs19APF+7WpK5q
 DSCWrlKkGhDJbMq7lK9Xsz91n+w0atjohfdDRW4CbXh870cT1bjo3Hv0q8BHW6/hTUa2
 u/4WSAzxEnOV2ti/BR6x1yn/H2wXnyOleYoGULv6kA8uHKylTYhQT7Pkso38Dk4Ze0UI
 R82g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsBfFb09beF593lDHfUQDjERAvV+AZAt3CgxT5+8XhFgQz2kLKQDvXY5UFc8NkiTeqGXo8oz5+m+E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjtvEmB1bVF/d9Cp+eG1EWprXGgSPb3vXaerSbUeJRS8NIfiQC
 IOOg/6DwNGT0CmYVQ/YcEOnigm3vDnr1b0vjkHTbw5NlKXLYMTgoDXuWYgu0RoUew6E=
X-Gm-Gg: ASbGncvoRRaShxB39ZDeym/D/WgsAA9vNmgs/Tn+73iZ0godmHm4NUxoUHirvcPxXHj
 n0xBNFCicT0u+/FIDSPaf7qXrPdn7hLXknd3iq3cJq34Efn6Is3BwCAd+x+OxLKy+Nq4xBLQYIm
 /LMRwDY/j/7E5Rz7HOcI00Xh32YrZo1cQK7KHVR6jvQ+lvE+cKUmNzmBo4fZBRaBi9zbFgLc6ES
 D3yxdxpdqmJ+ZWAGuO5FKfieDZ2hbRWGGlP1j42FXQGNfqC3oFBA87xiYgs55ynCrKCQXpYaN5h
 TQQOnt5HfuOeptqcM9PopQpXNhMcy9iWwySd9TUYutQMLdTiE0U3lcLJ/LLh4y2yBy/2VdaMI+m
 K
X-Google-Smtp-Source: AGHT+IHML/xG07WWPTOnuT8iOLag9iTtPlS9ekWXeBJoVCXzsh04s+uwSY/h6y2MkQRrFsmZOTZpUg==
X-Received: by 2002:a05:6000:2887:b0:3a5:2f23:3780 with SMTP id
 ffacd0b85a97d-3a5606b5920mr2289812f8f.18.1749725643997; 
 Thu, 12 Jun 2025 03:54:03 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a56199f2aesm1615096f8f.40.2025.06.12.03.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 03:54:03 -0700 (PDT)
Message-ID: <8b8c6170-9e36-4090-a49e-b1de41ff0c5c@ursulin.net>
Date: Thu, 12 Jun 2025 11:54:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/pmu: Fix build error with GCOV and AutoFDO
 enabled
To: Tzung-Bi Shih <tzungbi@kernel.org>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, nathan@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev
References: <20250612083023.562585-1-tzungbi@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250612083023.562585-1-tzungbi@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/06/2025 09:30, Tzung-Bi Shih wrote:
> i915_pmu.c may fail to build with GCOV and AutoFDO enabled.
> 
> ../drivers/gpu/drm/i915/i915_pmu.c:116:3: error: call to '__compiletime_assert_487' declared with 'error' attribute: BUILD_BUG_ON failed: bit > BITS_PER_TYPE(typeof_member(struct i915_pmu, enable)) - 1
>    116 |                 BUILD_BUG_ON(bit >
>        |                 ^
> 
> Here is a way to reproduce the issue:
> $ git checkout v6.15
> $ mkdir build
> $ ./scripts/kconfig/merge_config.sh -O build -n -m <(cat <<EOF
> CONFIG_DRM=y
> CONFIG_PCI=y
> CONFIG_DRM_I915=y
> 
> CONFIG_PERF_EVENTS=y
> 
> CONFIG_DEBUG_FS=y
> CONFIG_GCOV_KERNEL=y
> CONFIG_GCOV_PROFILE_ALL=y
> 
> CONFIG_AUTOFDO_CLANG=y
> EOF
> )
> $ PATH=${PATH}:${HOME}/llvm-20.1.5-x86_64/bin make LLVM=1 O=build \
>         olddefconfig
> $ PATH=${PATH}:${HOME}/llvm-20.1.5-x86_64/bin make LLVM=1 O=build \
>         CLANG_AUTOFDO_PROFILE=...PATH_TO_SOME_AFDO_PROFILE... \
>         drivers/gpu/drm/i915/i915_pmu.o
> 
> Although not super sure what happened, by reviewing the code, it should
> depend on `__builtin_constant_p(bit)` directly instead of assuming
> `__builtin_constant_p(config)` makes `bit` a builtin constant.
> 
> Also fix a nit, to reuse the `bit` local variable.
> 
> Fixes: a644fde77ff7 ("drm/i915/pmu: Change bitmask of enabled events to u32")
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Changes from v1:
> (https://patchwork.freedesktop.org/patch/656115/?series=149617&rev=1)
> - Collect R-b tag from Nathan.
> - Rebase to v6.16-rc1.

LGTM. Pushed to drm-intel-gt-next, thank you!

Regards,

Tvrtko

> 
>   drivers/gpu/drm/i915/i915_pmu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index e5a188ce3185..990bfaba3ce4 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -112,7 +112,7 @@ static u32 config_mask(const u64 config)
>   {
>   	unsigned int bit = config_bit(config);
>   
> -	if (__builtin_constant_p(config))
> +	if (__builtin_constant_p(bit))
>   		BUILD_BUG_ON(bit >
>   			     BITS_PER_TYPE(typeof_member(struct i915_pmu,
>   							 enable)) - 1);
> @@ -121,7 +121,7 @@ static u32 config_mask(const u64 config)
>   			     BITS_PER_TYPE(typeof_member(struct i915_pmu,
>   							 enable)) - 1);
>   
> -	return BIT(config_bit(config));
> +	return BIT(bit);
>   }
>   
>   static bool is_engine_event(struct perf_event *event)

