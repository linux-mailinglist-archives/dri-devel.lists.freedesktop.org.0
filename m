Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1388FE10B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 10:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C263510E142;
	Thu,  6 Jun 2024 08:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="Gm0aAFQM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A436E10E142
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 08:35:42 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-35e0f4e1821so521947f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2024 01:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1717662941; x=1718267741;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CCwIYRedAV5Z8YBxgB7muTkW1BWHNjBVC+U5ONE1IoM=;
 b=Gm0aAFQMwu7fX+pagcNyE7UydgCi3HGtmPw/wSG0hwQBa8sywveDBYqMIayhTUY8DN
 kpM5hvZzISXAzxb6yb9OmpcUD04hj+gxP5gYUqDm5PiufbUNSCFYnTgYeO5dJ12kS+Dn
 YvFfqNFB78n8/mbEtqmPqUbCdcuDdMG7LXeT1+8MidYUYwjDdSONDo9RrW4c1Us5oZ+u
 oDSU2yVotD9fttCVKjGWlm76InpJDfIaG+zr6RykGeQ2OFJU0TKIR19PYQfvCWR0xqdz
 duQYMPUmsyU4+7WdlAYUClNAcPkw/tIFyjTL8zi1DdwdHun0LNOTatvILiF2d11X7YVl
 Q0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717662941; x=1718267741;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CCwIYRedAV5Z8YBxgB7muTkW1BWHNjBVC+U5ONE1IoM=;
 b=cAQoUuziUuxNjP0w6AyYROMumsa3QesL/lXXrvJKfy6ttCj8IS1saphkYErvnTPq8F
 QOIhA8Q/zq6LDAJvb9bVST7K7Hq81ndBu1taWKuIefSGzHG6HTH/rdGbEiEL20+zBZae
 75nVs/2cFPnSW4T5H/+gQOTMdTc4JDaTZv0UkS8HPwMJlzn0TLQ0ThiaVnAv8noE5kg+
 V04KN35aQP1OhnnrolbAjbJR9FSfTYeC8j+tmRdeHcnEL79MkXwjChQgQG9sG6/8Ek1a
 rl2Ndr+5t+VXOe13GEpBoyytlbAa6aHAwLNkgm40EnlKlJiY1AHzblyqf1jJeYxW/ByP
 Ezvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpE09U4HHb7zU1YNIrSyuXY6SsutDSjb/pbN/bmY/AWNBO7mQXMMiqsf+BjppyW3mZiCJ4Xk/saPnCnKR0ZgDgKcVFBYwSp+7x7T0SE+YX
X-Gm-Message-State: AOJu0YyYXz/QdYY4wpsFW0UTQFs+wdTwpPESlvuWTFAGifRFn+nD2ENN
 5fzC34hnC+lSPfxmlWJgvbq5YQUgsYoEvLmNvCTNeY8jbh0mTOh4MdJjnuGjwi0=
X-Google-Smtp-Source: AGHT+IHs+uu+sCK+3QGcW2yHZE69rF6zH5KkgsyOFeQlqam69zVQG+kaq1EKZ7ucxK1IOfaJpqTrgw==
X-Received: by 2002:a5d:6504:0:b0:35e:f374:33b4 with SMTP id
 ffacd0b85a97d-35ef37435b8mr1172473f8f.65.1717662940656; 
 Thu, 06 Jun 2024 01:35:40 -0700 (PDT)
Received: from [10.0.21.32] (210.red-80-36-22.staticip.rima-tde.net.
 [80.36.22.210]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5d4bcd6sm932216f8f.45.2024.06.06.01.35.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 01:35:40 -0700 (PDT)
Message-ID: <1c40ea3a-ac58-4fa9-a7e5-3af880effb0e@ursulin.net>
Date: Thu, 6 Jun 2024 10:35:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] drm/drm_file: add display of driver's internal
 memory size
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>
References: <20240606005416.1172431-1-adrian.larumbe@collabora.com>
 <20240606005416.1172431-7-adrian.larumbe@collabora.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240606005416.1172431-7-adrian.larumbe@collabora.com>
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


On 06/06/2024 02:49, Adrián Larumbe wrote:

> Some drivers must allocate a considerable amount of memory for bookkeeping
> structures and GPU's MCU-kernel shared communication regions. These are
> often created as a result of the invocation of the driver's ioctl()
> interface functions, so it is sensible to consider them as being owned by
> the render context associated with an open drm file.
>
> However, at the moment drm_show_memory_stats only traverses the UM-exposed
> drm objects for which a handle exists. Private driver objects and memory
> regions, though connected to a render context, are unaccounted for in their
> fdinfo numbers.
>
> Add a new drm_memory_stats 'internal' memory category.
>
> Because deciding what constitutes an 'internal' object and where to find
> these are driver-dependent, calculation of this size must be done through a
> driver-provided function pointer, which becomes the third argument of
> drm_show_memory_stats. Drivers which have no interest in exposing the size
> of internal memory objects can keep passing NULL for unaltered behaviour.
>
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Please Cc people who were previously involved in defining 
drm-usage-stats.rst. I added Rob, but I am not sure if I forgot someone 
from the top of my head.

Internal as a category sounds potentially useful. One reservation I have 
though is itdoes not necessarily fit with the others but is something 
semantically different from them.

In i915 I had the similar desire to account for internal objects and 
have approached it by similarly tracking them outside the DRM idr but 
counting them under the existing respective categories and memory 
regions. Ie. internal objects can also be purgeable or not, etc, and can 
be backed by either system memory or device local memory.

Advantage is it is more accurate in those aspect and does not require 
adding a new category.

Downside of this is that 'internal' is bunched with the explicit 
userspace objects so perhaps less accurate in this other aspect.

Regards,

Tvrtko

> ---
>   Documentation/gpu/drm-usage-stats.rst   | 4 ++++
>   drivers/gpu/drm/drm_file.c              | 9 +++++++--
>   drivers/gpu/drm/msm/msm_drv.c           | 2 +-
>   drivers/gpu/drm/panfrost/panfrost_drv.c | 2 +-
>   include/drm/drm_file.h                  | 7 ++++++-
>   5 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index 6dc299343b48..0da5ebecd232 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -157,6 +157,10 @@ The total size of buffers that are purgeable.
>   
>   The total size of buffers that are active on one or more engines.
>   
> +- drm-internal-<region>: <uint> [KiB|MiB]
> +
> +The total size of GEM objects that aren't exposed to user space.
> +
>   Implementation Details
>   ======================
>   
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 638ffa4444f5..d1c13eed8d34 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -874,9 +874,10 @@ void drm_print_memory_stats(struct drm_printer *p,
>   			    enum drm_gem_object_status supported_status,
>   			    const char *region)
>   {
> -	print_size(p, "total", region, stats->private + stats->shared);
> +	print_size(p, "total", region, stats->private + stats->shared + stats->internal);
>   	print_size(p, "shared", region, stats->shared);
>   	print_size(p, "active", region, stats->active);
> +	print_size(p, "internal", region, stats->internal);
>   
>   	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
>   		print_size(p, "resident", region, stats->resident);
> @@ -890,11 +891,12 @@ EXPORT_SYMBOL(drm_print_memory_stats);
>    * drm_show_memory_stats - Helper to collect and show standard fdinfo memory stats
>    * @p: the printer to print output to
>    * @file: the DRM file
> + * @func: driver-specific function pointer to count the size of internal objects
>    *
>    * Helper to iterate over GEM objects with a handle allocated in the specified
>    * file.
>    */
> -void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
> +void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file, internal_bos func)
>   {
>   	struct drm_gem_object *obj;
>   	struct drm_memory_stats status = {};
> @@ -940,6 +942,9 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
>   	}
>   	spin_unlock(&file->table_lock);
>   
> +	if (func)
> +		func(&status, file);
> +
>   	drm_print_memory_stats(p, &status, supported_status, "memory");
>   }
>   EXPORT_SYMBOL(drm_show_memory_stats);
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 9c33f4e3f822..f97d3cdc4f50 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -880,7 +880,7 @@ static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   
>   	msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, p);
>   
> -	drm_show_memory_stats(p, file);
> +	drm_show_memory_stats(p, file, NULL);
>   }
>   
>   static const struct file_operations fops = {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index ef9f6c0716d5..53640ac44e42 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -570,7 +570,7 @@ static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   
>   	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
>   
> -	drm_show_memory_stats(p, file);
> +	drm_show_memory_stats(p, file, NULL);
>   }
>   
>   static const struct file_operations panfrost_drm_driver_fops = {
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index ab230d3af138..d71a5ac50ea9 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -464,6 +464,7 @@ void drm_send_event_timestamp_locked(struct drm_device *dev,
>    * @resident: Total size of GEM objects backing pages
>    * @purgeable: Total size of GEM objects that can be purged (resident and not active)
>    * @active: Total size of GEM objects active on one or more engines
> + * @internal: Total size of GEM objects that aren't exposed to user space
>    *
>    * Used by drm_print_memory_stats()
>    */
> @@ -473,16 +474,20 @@ struct drm_memory_stats {
>   	u64 resident;
>   	u64 purgeable;
>   	u64 active;
> +	u64 internal;
>   };
>   
>   enum drm_gem_object_status;
>   
> +typedef void (*internal_bos)(struct drm_memory_stats *status,
> +			     struct drm_file *file);
> +
>   void drm_print_memory_stats(struct drm_printer *p,
>   			    const struct drm_memory_stats *stats,
>   			    enum drm_gem_object_status supported_status,
>   			    const char *region);
>   
> -void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
> +void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file, internal_bos func);
>   void drm_show_fdinfo(struct seq_file *m, struct file *f);
>   
>   struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
