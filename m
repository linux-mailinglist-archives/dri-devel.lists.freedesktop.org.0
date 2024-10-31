Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 369F59B7A9B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 13:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE1810E874;
	Thu, 31 Oct 2024 12:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bgGcet6c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534A210E86F;
 Thu, 31 Oct 2024 12:34:17 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-37d473c4bb6so700047f8f.3; 
 Thu, 31 Oct 2024 05:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730378056; x=1730982856; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vLXAvuPe6wQtSfpXWJu/CpG9WC3z/rjnbOEfSFfEVa4=;
 b=bgGcet6cWt0xtKexmHncV7UkN42t1MeVaYz1lYXR7w+/IfvtDggOKBP6NepFMY3IFL
 FLl54xbfauXTOiwouTdK/yIl8tpzEh930KxdXKQOZgdySaJqJzCgH4pZ9u8SNWWXBSTA
 DNZAgGGXLZEhCqz6jD3+MfvMQGMrOrw+CuDLoc6pMci6kK2XgMoXG+S8SdyehisoB6zH
 3veVetyNAJZx74o7mHmHNqcgqhctGVAy0OQ1SHqiYV8DMoqqPM+BCVYdieydRXPWpH5i
 ftSHBKX5NiHW8LTUzLxhQ47sUN/NXLmZ61mCJG48OlCRGH/B+/mLLaXRjBGm1bbpdjzO
 1t+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730378056; x=1730982856;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vLXAvuPe6wQtSfpXWJu/CpG9WC3z/rjnbOEfSFfEVa4=;
 b=vI6dNd0h52xu+8WJmD4fBga+S8zfYIC6zayZTAaHEWhneJ/eWSTphz7cYkxP7wfmWj
 n2g+0VVTeSTpIUD9CX9MJ3RIv27aKVEdAZ0WcDJuzyikHM/N6FpmkOfW7mujTLfVc0u/
 18MYcfcjdYH4OlhPmlRcMpQayHWbCrtnZBmrJ4xqz8KoHDbRDs182Hi6Aiw5zlA/x60W
 UODHAOgs0pEhWL35JxEdWgmXYkOGCfjIB+i53AVQ/h8qQIdqhjTpd3PlpoqNmsJSN1Wu
 t22Ms0RzgdhcqieQHK77MFXhaVx8e1XoJdZbplAOEFVljyuHlLVS5x7k7iRA2ObK90Wp
 M5lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT9fE8yEKecrHCWTDG0dkceMNnzXVTbTrY3Rk3TZJP0aL3UBaBiE0TNNetfLlaTAJFj7FR6w7b@lists.freedesktop.org,
 AJvYcCXvEhtQR6KrD+VpldwqYu9wA8ANW6r2cHtw+9JCq/FZAuRlmRsd96rFxrtcN20h79Rm2lYVkU2OeCJT@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPPaON+HtOngPmavecANYmsoKyGtauIK4xJ8OD+TsKCEJOIXOI
 ns8H0Q8FKkh+0s/UT7v2TvOigKHXtTD1zp0acld/Z/lkRe+W7oLD
X-Google-Smtp-Source: AGHT+IHbKeOc3kf5wijW+RAHjBJGlI6B+AS0ff5EmI2+td8gSuIVs+AF6ci7R8zku0J+FPAnqmWm+g==
X-Received: by 2002:a05:6000:1942:b0:37d:43d4:88b7 with SMTP id
 ffacd0b85a97d-38061141a54mr17561614f8f.3.1730378055404; 
 Thu, 31 Oct 2024 05:34:15 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10d4392sm2004285f8f.36.2024.10.31.05.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 05:34:14 -0700 (PDT)
Message-ID: <5b1153e7-9304-41fb-83d7-0ca0bfb4123e@gmail.com>
Date: Thu, 31 Oct 2024 13:34:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] drm: add drm_memory_stats_is_zero
To: Yunxiang Li <Yunxiang.Li@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 tvrtko.ursulin@igalia.com
Cc: Alexander.Deucher@amd.com
References: <20241025174113.554-1-Yunxiang.Li@amd.com>
 <20241025174113.554-5-Yunxiang.Li@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20241025174113.554-5-Yunxiang.Li@amd.com>
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

Am 25.10.24 um 19:41 schrieb Yunxiang Li:
> Add a helper to check if the memory stats is zero, this will be used to
> check for memory accounting errors.
>
> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

In theory I would need to upstream that through the drm-misc-next 
channel, but I think that's simply enough that we can take it through 
amd-staging-drm-next.

Regards,
Christian.

> ---
>   drivers/gpu/drm/drm_file.c | 9 +++++++++
>   include/drm/drm_file.h     | 1 +
>   2 files changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 714e42b051080..75ed701d80f74 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -859,6 +859,15 @@ static void print_size(struct drm_printer *p, const char *stat,
>   	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
>   }
>   
> +int drm_memory_stats_is_zero(const struct drm_memory_stats *stats) {
> +	return (stats->shared == 0 &&
> +		stats->private == 0 &&
> +		stats->resident == 0 &&
> +		stats->purgeable == 0 &&
> +		stats->active == 0);
> +}
> +EXPORT_SYMBOL(drm_memory_stats_is_zero);
> +
>   /**
>    * drm_print_memory_stats - A helper to print memory stats
>    * @p: The printer to print output to
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index ab230d3af138d..7f91e35d027d9 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -477,6 +477,7 @@ struct drm_memory_stats {
>   
>   enum drm_gem_object_status;
>   
> +int drm_memory_stats_is_zero(const struct drm_memory_stats *stats);
>   void drm_print_memory_stats(struct drm_printer *p,
>   			    const struct drm_memory_stats *stats,
>   			    enum drm_gem_object_status supported_status,

