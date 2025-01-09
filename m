Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C958BA0767D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6FD10E384;
	Thu,  9 Jan 2025 13:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="wKT9iDpx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8C310E384
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:06:51 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43618283dedso9355215e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 05:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1736427950; x=1737032750;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZntOPOaaA1KTWghoiY1A0OP9ir37MoWCNX6fFHP2fJE=;
 b=wKT9iDpxm1LtcH0FHjgbY4ABk5clwzxt6EK59v7jkcD6+IElh3L0TdE81D+6PcM1VU
 qA1J1yAyRAF6boI+by2AivDPr6pLUbSiwFkdgBw61pFz2mWQ28inUyJItDZ1r2nXdWjg
 V9aaJpKrNLhF+H4aOYCNNNJMUAFJEod/88qbdUusK5/UWqAzogliF93DqxM+dWTVJX3Y
 SkAw6wluDe/SgjxFOJy+ftBrzPcOUjwciP8doW1bBU4mWUBeCvA4OSOpOdjNNC4q/Lt8
 Cx43WgIzkVczfKT5jOSZN06gUQSb//3UKw9VgYIOyG3AvdHd0MHGhbCg+Dun54XMmEAP
 HEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736427950; x=1737032750;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZntOPOaaA1KTWghoiY1A0OP9ir37MoWCNX6fFHP2fJE=;
 b=w1FCgCU//s96BRdsNOfQPhsqXsHBB2pbT1cs1rLzm8Q4SnlfOQ8hJB6g7/EGgUqAv4
 eIiILQ1XhKxrWHsJ15qHk9gtx4UvjeBUEovaQNow/UNUX4uo4mGEe3PmkXhSlXRPV5i2
 TFKixB28rDNEjaUamr3YW0EW068eK9y4f9WmF3aYY2C4kFLGXziiFcUoEObh/ku0dHkp
 pxsgXdzrUHKquDMesp+5US3muUYP55dQh+kToasISiWuwtOFMeFRNDBjWT0Wd4zjNaRn
 PyL9FhNons+RVqosjvrteGs4IMrYV7vrMXPt2Kh/3QPUuJXEYCeSl3XA6TH0ffpmFlv7
 oIbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPq6RRkAn7YnPT8zLgsQrFIxwJUmOSyGDOkIuiWhWC0LIa/21Tooqh4tEQtxmtTrWE+knzXjC30eQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRIEhJPgGm1AmDluPG/ij9DwsZ1nLWoCiQeRfm8a5tIsSrBS6Z
 2s+KbOh1d8D9lZ79jOW37YVRp0vgyIq5TOSE4NnBdZru9MPZOj4ihCr0iL83OKw=
X-Gm-Gg: ASbGncvokqOBVW3JRjHalgmja2xv/rp5TU1T8pcHtg+rq3Qvr8dHafayPO536xdfEVV
 +qdXMB/nGF+nTUl78VbL2x1tVzCwCYdTVSk2paPp33o5GkGzPVR6/WO+aOnvzcgnwTwhICiGfsZ
 oBBgpR/qiNvBmkCPRPE9xzMgdaUMrHnfmW0a2V0gRbbm+8N/dQmCxm+0MxE/FAy3z3VWaYKQ+ML
 W55+ctYsupy6g6mL7wihdePJ6sCEflPpQuwG7Kudvfv0aKtAQxc6gpttU2G87REqO9nzglM
X-Google-Smtp-Source: AGHT+IHrwtN9KtgRMUgEzUWhO2m+63o2vxrZXrrRFUfcS7sI0MePb+8cRfgT1OcYLJ37G0Xk6QCsXg==
X-Received: by 2002:a05:600c:1c88:b0:431:93d8:e1a1 with SMTP id
 5b1f17b1804b1-436e271d10fmr54201305e9.27.1736427949789; 
 Thu, 09 Jan 2025 05:05:49 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b81e4sm1807182f8f.64.2025.01.09.05.05.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 05:05:49 -0800 (PST)
Message-ID: <a4775792-f193-4694-82c2-c5c4c13e3cea@ursulin.net>
Date: Thu, 9 Jan 2025 13:05:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] drm/file: Add driver-specific memory region key
 printing helper
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250108210259.647030-1-adrian.larumbe@collabora.com>
 <20250108210259.647030-3-adrian.larumbe@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250108210259.647030-3-adrian.larumbe@collabora.com>
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
> This is motivated by the desire of some dirvers (eg. Panthor) to print the
> size of internal memory regions with a prefix that reflects the driver
> name, as suggested in the previous documentation commit.
> 
> That means a minor refactoring of print_size() was needed so as to make it
> more generic in the format of key strings it takes as input.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> ---
>   drivers/gpu/drm/drm_file.c | 60 +++++++++++++++++++++++++++++++++-----
>   include/drm/drm_file.h     |  2 ++
>   2 files changed, 54 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index cb5f22f5bbb6..5deae4cffa79 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -830,8 +830,7 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
>   }
>   EXPORT_SYMBOL(drm_send_event);
>   
> -static void print_size(struct drm_printer *p, const char *stat,
> -		       const char *region, u64 sz)
> +static void print_size(struct drm_printer *p, const char *key, u64 sz)
>   {
>   	const char *units[] = {"", " KiB", " MiB"};
>   	unsigned u;
> @@ -842,9 +841,54 @@ static void print_size(struct drm_printer *p, const char *stat,
>   		sz = div_u64(sz, SZ_1K);
>   	}
>   
> -	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
> +	drm_printf(p, "%s:\t%llu%s\n", key, sz, units[u]);
>   }
>   
> +#define KEY_LEN 1024
> +#define DRM_PREFIX "drm"
> +
> +static void
> +print_size_region(struct drm_printer *p, const char *stat,
> +		  const char *region, u64 sz)
> +{
> +	char key[KEY_LEN+1] = {0};

A kilobyte of stack makes me a bit uneasy.

Would it not work to make print_size take a prefix and also avoid string 
operations? Something like, not compile tested:

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 2289e71e2fa2..efa4593babbc 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -830,8 +830,12 @@ void drm_send_event(struct drm_device *dev, struct 
drm_pending_event *e)
  }
  EXPORT_SYMBOL(drm_send_event);

-static void print_size(struct drm_printer *p, const char *stat,
-		       const char *region, u64 sz)
+static void
+drm_fdinfo_print_size(struct drm_printer *p,
+		      const char *prefix,
+		      const char *stat,
+		      const char *region,
+		      u64 sz)
  {
  	const char *units[] = {"", " KiB", " MiB"};
  	unsigned u;
@@ -842,8 +846,10 @@ static void print_size(struct drm_printer *p, const 
char *stat,
  		sz = div_u64(sz, SZ_1K);
  	}

-	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
+	drm_printf(p, "%s-%s-%s:\t%llu%s\n",
+		   prefix, stat, region, sz, units[u]);
  }
+EXPORT_SYMBOL(drm_fdinfo_print_size);

  int drm_memory_stats_is_zero(const struct drm_memory_stats *stats)
  {
@@ -868,17 +874,23 @@ void drm_print_memory_stats(struct drm_printer *p,
  			    enum drm_gem_object_status supported_status,
  			    const char *region)
  {
-	print_size(p, "total", region, stats->private + stats->shared);
-	print_size(p, "shared", region, stats->shared);
+	const char *prefix = "drm";
+
+	drm_fdinfo_print_size(p, prefix, "total", region,
+			      stats->private + stats->shared);
+	drm_fdinfo_print_size(p, prefix, "shared", region, stats->shared);

  	if (supported_status & DRM_GEM_OBJECT_ACTIVE)
-		print_size(p, "active", region, stats->active);
+		drm_fdinfo_print_size(p, prefix, "active", region,
+				      stats->active);

  	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
-		print_size(p, "resident", region, stats->resident);
+		drm_fdinfo_print_size(p, prefix, "resident", region,
+				      stats->resident);

  	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
-		print_size(p, "purgeable", region, stats->purgeable);
+		drm_fdinfo_print_size(p, prefix, "purgeable", region,
+				      stats->purgeable);
  }
  EXPORT_SYMBOL(drm_print_memory_stats);

?

Regards,

Tvrtko

> +
> +	if (strnlen(stat, KEY_LEN) + strnlen(region, KEY_LEN) +
> +	    strlen(DRM_PREFIX) + 2 > KEY_LEN)
> +		return;
> +
> +	snprintf(key, sizeof(key), "%s-%s-%s", DRM_PREFIX, stat, region);
> +	print_size(p, key, sz);
> +}
> +
> +/**
> + * drm_driver_print_size - A helper to print driver-specific k:v pairs
> + * @p: The printer to print output to
> + * @file: DRM file private data
> + * @subkey: Name of the key minus the driver name
> + * @sz: Size value expressed in bytes
> + *
> + * Helper to display key:value pairs where the value is a numerical
> + * size expressed in bytes. It's useful for driver-internal memory
> + * whose objects aren't exposed to UM through a DRM handle.
> + */
> +void drm_driver_print_size(struct drm_printer *p, struct drm_file *file,
> +			   const char *subkey, u64 sz)
> +{
> +	char key[KEY_LEN+1] = {0};
> +	char *drv_name = file->minor->dev->driver->name;
> +
> +	if (strnlen(subkey, KEY_LEN) + strlen(drv_name) + 1 > KEY_LEN)
> +		return;
> +
> +	snprintf(key, sizeof(key), "%s-%s", drv_name, subkey);
> +	print_size(p, key, sz);
> +}
> +EXPORT_SYMBOL(drm_driver_print_size);
> +
> +#undef DRM_PREFIX
> +#undef KEY_LEN
> +
>   /**
>    * drm_print_memory_stats - A helper to print memory stats
>    * @p: The printer to print output to
> @@ -858,15 +902,15 @@ void drm_print_memory_stats(struct drm_printer *p,
>   			    enum drm_gem_object_status supported_status,
>   			    const char *region)
>   {
> -	print_size(p, "total", region, stats->private + stats->shared);
> -	print_size(p, "shared", region, stats->shared);
> -	print_size(p, "active", region, stats->active);
> +	print_size_region(p, "total", region, stats->private + stats->shared);
> +	print_size_region(p, "shared", region, stats->shared);
> +	print_size_region(p, "active", region, stats->active);
>   
>   	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
> -		print_size(p, "resident", region, stats->resident);
> +		print_size_region(p, "resident", region, stats->resident);
>   
>   	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
> -		print_size(p, "purgeable", region, stats->purgeable);
> +		print_size_region(p, "purgeable", region, stats->purgeable);
>   }
>   EXPORT_SYMBOL(drm_print_memory_stats);
>   
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index f0ef32e9fa5e..07da14859289 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -494,6 +494,8 @@ struct drm_memory_stats {
>   
>   enum drm_gem_object_status;
>   
> +void drm_driver_print_size(struct drm_printer *p, struct drm_file *file,
> +			   const char *subkey, u64 sz);
>   void drm_print_memory_stats(struct drm_printer *p,
>   			    const struct drm_memory_stats *stats,
>   			    enum drm_gem_object_status supported_status,
