Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D2DA11B8E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 09:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876D210E529;
	Wed, 15 Jan 2025 08:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="yx/p++Yo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB66E10E529
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 08:09:34 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-436a03197b2so44929105e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 00:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1736928513; x=1737533313;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5TKs6VTiYoGGpokppBC12jXWmchUx26icqsF8+IlZzI=;
 b=yx/p++YoNKyPzKyT0l17xA84Kd+fQTbs2AhttsGMEFmuxJdv4yAoeI9ho4BmU4Iskh
 3p+Tcv6E+BMiIIMrX7Me2s/6230L9/zqI1QV7RFOtInJNSo3LykvnlnnOJ7HRp3UW0mr
 i53N6Ww+kHNxRzMynsprHQXGg+rtrfI9q1A0MSIaf+PyaTxuwWOUPqQAPniEIKC7Lfit
 e7oN1yEC7eb7F5aQZAS7DhNaiyUxVFaEqELMvRHu5qYclFAh1tGmgR2OobOR9PfQQU5o
 cBgALT233zy/vgRpiqGIqixNP2IPElknLwlaNfr5NoNFNPffMc6Fi1eOILFa9qWCdIxJ
 V2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736928513; x=1737533313;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5TKs6VTiYoGGpokppBC12jXWmchUx26icqsF8+IlZzI=;
 b=BZF6PRFJZsiYregfRvhgA9dKXDYZwhQ4R99UsUUyc1cDf6fLmbBQnf+TNm845bE8d+
 eDg1cu/m0l3SRSLb6OEy2CqslMNhQY3UNphXEsgdDqOkbC0ome8FpLTRwGEr+GWG4g5w
 rLh+QBeLSCOIvG20Uy9zPVvjJzwxLS28OntMHZmFeIklCHxkEYMYQQpYN0DgT2IzSyVn
 GX/N2DXz98bk7Y0xuIMfLBaL391hYGk0zc+YiqIKgDTMEqw26Q5UH8SNYuoFktrAV1em
 +NzrkZUHGFILQoj1VxkPSMC78qH2phbNtdPvzx1JprNKfzonDt4HzjB0pJKoHSdryhAc
 FI5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3c2ci1UeS93Yh5PGA0kn8syvUYUCMQHYv9KEPLjBrSUzh4m6BwNe8C1OAnbBS8AQI+BU2y6dZt1c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYbWK3maJDxsCLlUiyrO1PukajzR1Z9aEQhnCV8Qk4SYazgZh7
 HcgwmTMDmda/1Fm/mDr5Mv6meamgqsDl2DgAJhL8dBL9wE42RK23xNGpFzrT7GY=
X-Gm-Gg: ASbGnctlHoNqPBR1IMNbVtpVTPLpDESBH2iOV5KGhse9w7ygsBrQh+PTcQNlAk2QzhG
 DmBaMW8Nv5rsfX9CBiHeYEE4vJEwAkS16R8N5LCTDzaB2x3WXGtF1nWJmC9aq5dArZknSRU43y9
 Yh6Q2EYB1geyKW5BJFsD6ulpjbWykAnpusx7zU50KH6RlvdhuMqD7tjoPu5zUcdxcP2Kfc7usXs
 USSDP9naPcBu7/+6tRvZduApEeUmtAhMRu2CnW1jdrV3wdhaIbp0dChWUOgowwYtHDB+i3x
X-Google-Smtp-Source: AGHT+IGw5gYLx2t/yCDqQg7Q14Y8RhIh6+teFkP1OnWysoAZUxt7UwGTks5/Pp48T2Eg8MlJgQe0JA==
X-Received: by 2002:a05:600c:3b86:b0:434:fe4b:be18 with SMTP id
 5b1f17b1804b1-436e26bde73mr278911525e9.18.1736928513174; 
 Wed, 15 Jan 2025 00:08:33 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74c5bb5sm14382305e9.22.2025.01.15.00.08.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 00:08:32 -0800 (PST)
Message-ID: <2c62137a-70d5-421e-ae8d-e3bb7c86d0b2@ursulin.net>
Date: Wed, 15 Jan 2025 08:08:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] drm/file: Add fdinfo helper for printing regions
 with prefix
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250114173406.3060248-1-adrian.larumbe@collabora.com>
 <20250114173406.3060248-3-adrian.larumbe@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250114173406.3060248-3-adrian.larumbe@collabora.com>
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


On 14/01/2025 17:34, Adrián Larumbe wrote:
> This is motivated by the desire of some drivers (eg. Panthor) to print the
> size of internal memory regions with a prefix that reflects the driver
> name, as suggested in the previous documentation commit.
> 
> That means adding a new argument to print_size and making it available for
> DRM users.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> ---
>   drivers/gpu/drm/drm_file.c | 27 +++++++++++++++++++--------
>   include/drm/drm_file.h     |  5 +++++
>   2 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index cb5f22f5bbb6..f584abcd13cb 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -830,8 +830,12 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
>   }
>   EXPORT_SYMBOL(drm_send_event);
>   
> -static void print_size(struct drm_printer *p, const char *stat,
> -		       const char *region, u64 sz)
> +
> +void drm_fdinfo_print_size(struct drm_printer *p,
> +			   const char *prefix,
> +			   const char *stat,
> +			   const char *region,
> +			   u64 sz)
>   {
>   	const char *units[] = {"", " KiB", " MiB"};
>   	unsigned u;
> @@ -842,8 +846,10 @@ static void print_size(struct drm_printer *p, const char *stat,
>   		sz = div_u64(sz, SZ_1K);
>   	}
>   
> -	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
> +	drm_printf(p, "%s-%s-%s:\t%llu%s\n",
> +		   prefix, stat, region, sz, units[u]);
>   }
> +EXPORT_SYMBOL(drm_fdinfo_print_size);
>   
>   /**
>    * drm_print_memory_stats - A helper to print memory stats
> @@ -858,15 +864,20 @@ void drm_print_memory_stats(struct drm_printer *p,
>   			    enum drm_gem_object_status supported_status,
>   			    const char *region)
>   {
> -	print_size(p, "total", region, stats->private + stats->shared);
> -	print_size(p, "shared", region, stats->shared);
> -	print_size(p, "active", region, stats->active);
> +	const char *prefix = "drm";
> +
> +	drm_fdinfo_print_size(p, prefix, "total", region,
> +			      stats->private + stats->shared);
> +	drm_fdinfo_print_size(p, prefix, "shared", region, stats->shared);
> +	drm_fdinfo_print_size(p, prefix, "active", region, stats->active);
>   
>   	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
> -		print_size(p, "resident", region, stats->resident);
> +		drm_fdinfo_print_size(p, prefix, "resident", region,
> +				      stats->resident);
>   
>   	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
> -		print_size(p, "purgeable", region, stats->purgeable);
> +		drm_fdinfo_print_size(p, prefix, "purgeable", region,
> +				      stats->purgeable);
>   }
>   EXPORT_SYMBOL(drm_print_memory_stats);
>   
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index f0ef32e9fa5e..001ae553e8c3 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -494,6 +494,11 @@ struct drm_memory_stats {
>   
>   enum drm_gem_object_status;
>   
> +void drm_fdinfo_print_size(struct drm_printer *p,
> +				  const char *prefix,
> +				  const char *stat,
> +				  const char *region,
> +				  u64 sz);
>   void drm_print_memory_stats(struct drm_printer *p,
>   			    const struct drm_memory_stats *stats,
>   			    enum drm_gem_object_status supported_status,

If I can get away with a sneaky:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko
