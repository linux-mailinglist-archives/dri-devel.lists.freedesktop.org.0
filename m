Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFC2B3F94A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1C910E600;
	Tue,  2 Sep 2025 08:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="XolOUA2K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA36A10E327
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:58:45 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3d1bf79d6afso2035044f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 01:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1756803524; x=1757408324;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fdTnKkYv89qYmuDrHKQiKv7a5BMqopZQ28l888CmXYk=;
 b=XolOUA2KuNlk3C0YZPrhbqFbmTI3a/Ulb5VnywkanLvDPkVrChto3xh9aPp+EA5jn8
 JXkblbvJPUfZzT02I5UoZpo5Wx/jJMDZPkKgOsdiWmm/gIKAPChco9z4/mVDjo8RBsz8
 7yoyfMe+Ren0Pfkpbli/G/0/xFKsEBp2nTCVFNkVHwvD5pSr4m31wd0yAugqXTOyZzAp
 nzSVnppRwTyELTvGzdFcMSWRe61D9zwjerHnUz4sG+cVkG3XNAW13g4lv9rm/Sb8MCeQ
 c/PacM5c3be5lHtFk2j3bexRPIND0+tmtwIZK3HGWenZ2hTJX7xezFc+tQ16yVoqugUo
 DLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756803524; x=1757408324;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fdTnKkYv89qYmuDrHKQiKv7a5BMqopZQ28l888CmXYk=;
 b=IQqf32tSbYQ1rWqbw/Hj3I3RFRw7KkVg2DCWZQR7knyt+PHFq0+VoBox5ASdXu8G05
 NroiUVbP9Lks2gwGRsQKd5WssOr3Im0OAz2R4fahbEDf1dSHtsMRbLdts+7U2N2fgIjM
 KaKl+QmwYvHAsqRIDuMXjUH5aNSxuiEM+8xzqh8MGFMjeGM1Oh/U8V3PcQj01eCqtASE
 GXsEwZDfxm8mmf/CZmett6usMGiXpBV1I7Cvml5n8deSNXdv5aJsmXbUi4DWKzdv0rB8
 +89kEJN/FHSBVvnEvB+tFM5GTAOJF08xAfdHO6xY9UeTKmpoXjWjG5zpj/Eo/ihE889v
 ND2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFiyzbaGYscQ5SlcX7kvLz7SPLeFDgtByuUwnKUSPkE2/xdf7KdEXBh+5ppaPNM+2CH0zVEzqamds=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgxMlL+jXlLNm9C8opsiCSFQNW/g9n0peNhCzDVX//3ZwMaRVn
 XoFAmG3xNynmHV1t6/zIJHezxn44BZ8VtIayeqfE9Ka7TVzwCkT8lXcwILiZaFFuaPM=
X-Gm-Gg: ASbGnct62Gs4QXJ4MM9gNAG06EmBebkFsdyVZf/qJ92dvDBA65v9KY6YwUtzu7qeoPP
 R9/oxiMv+aFrFE6dQ6eELt8Lprv2aOQMjCo8TGkfYTMlAE75JCVd/Rgufzmx/TM42V9Jok52zWI
 5l3ctlKco8cBJxKkgIkbisf6VfNbjZA75GnV5HwfOrLHRGp3pdvHMXw4vMK9lFDGbVzL3O6k1yA
 M+Ty0qZ/Gd8kFjuag+wxXraL2g3J1QTJ/k51eZDxxkd/9COcoN+xX6QfjspCc8GmrkfuY6/HXK3
 yrcdzoXmHoCew9S4+CN49j3LGOorvpNSoMTQIDVz6GvIkqhHyWYv9M0NYgG0aIqVNQwsoSxnB5M
 c6ZODKy96yfTiPYjGHH/rAFkCBxXJCwIv83g=
X-Google-Smtp-Source: AGHT+IHcFsAfK5WIhq+S9Y1CY3ZPTu/1Q3IzKtJHTb6xFETccQcxq0O80x8z8t2LLzPK76tz+CxMCA==
X-Received: by 2002:a5d:5d8a:0:b0:3ce:a06e:f248 with SMTP id
 ffacd0b85a97d-3d1dddf374dmr6988087f8f.17.1756803523951; 
 Tue, 02 Sep 2025 01:58:43 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d3a7492001sm13361996f8f.42.2025.09.02.01.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 01:58:43 -0700 (PDT)
Message-ID: <5f6c7541-93ca-4b67-b4e4-33ff60e99c7d@ursulin.net>
Date: Tue, 2 Sep 2025 09:58:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Replace kmalloc() + copy_from_user() with
 memdup_user()
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nitin Gote <nitin.r.gote@intel.com>,
 =?UTF-8?Q?Miko=C5=82aj_Wasiak?= <mikolaj.wasiak@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250902081046.35463-2-thorsten.blum@linux.dev>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250902081046.35463-2-thorsten.blum@linux.dev>
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


On 02/09/2025 09:10, Thorsten Blum wrote:
> Replace kmalloc() followed by copy_from_user() with memdup_user() to
> improve and simplify set_context_image(), and to silence the following
> Coccinelle/coccicheck warning reported by memdup_user.cocci:
> 
>    WARNING opportunity for memdup_user
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Resending this (with updated patch subject and description) because the
> CI logs [1] from my first submission [2] about a year ago are no longer
> available.
> 
> [1] https://patchwork.freedesktop.org/series/139319/
> [2] https://lore.kernel.org/lkml/20240925141750.51198-1-thorsten.blum@linux.dev/
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 15835952352e..ed6599694835 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -2158,18 +2158,12 @@ static int set_context_image(struct i915_gem_context *ctx,
>   		goto out_ce;
>   	}
>   
> -	state = kmalloc(ce->engine->context_size, GFP_KERNEL);
> -	if (!state) {
> -		ret = -ENOMEM;
> +	state = memdup_user(u64_to_user_ptr(user.image), ce->engine->context_size);
> +	if (IS_ERR(state)) {
> +		ret = PTR_ERR(state);
>   		goto out_ce;
>   	}
>   
> -	if (copy_from_user(state, u64_to_user_ptr(user.image),
> -			   ce->engine->context_size)) {
> -		ret = -EFAULT;
> -		goto out_state;
> -	}
> -
>   	shmem_state = shmem_create_from_data(ce->engine->name,
>   					     state, ce->engine->context_size);
>   	if (IS_ERR(shmem_state)) {

LGTM.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Note however that CI is not picking up external patches these days, so I 
will need to re-send it for you. Once it passes I will merge it but if I 
forget feel free to ping.

Regards,

Tvrtko

