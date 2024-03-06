Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429328730CD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 09:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E92410EA9A;
	Wed,  6 Mar 2024 08:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="X1ueZPiV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2C410EA9A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 08:33:50 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-412e0feb40eso23315705e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 00:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1709714029; x=1710318829;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yBXw6tB5aMqLZ8Hc+Iv64yYn3Hav4Q5JVeAcFCnc+tA=;
 b=X1ueZPiV2IUCCU1pCWmqeGj4K4Bkck1UaOZWrWugF8hOgijGEOjHY21UuDZ7ItXet/
 CyqGT3MbI/B6aF49j59g9niR69nzcq32/s9nH+pp+0PzzSxUeeeOLZ+DhpYqpUbMIlfx
 fPMmAobq6iecsoJgtR7ZL071LdWbsmRAAI/5vGtP8ndrPZsu7T3CTzaMewTrSNot/DLo
 v+C3Kaf8Jq07DinoNfCx4Ev02FVqZJHL52Qo0QLVMf+BGoNZlRBM/B8OO4WZQOzjyka7
 wbYvZ18boZjyN8DjTKH+E12THPPZp4HQ5t/+Hq3O6iIEj/IwYIGGmaAniPylJXgOqpOY
 VEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709714029; x=1710318829;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yBXw6tB5aMqLZ8Hc+Iv64yYn3Hav4Q5JVeAcFCnc+tA=;
 b=CvpX3fjOb98Ns4mOZlASjhwE1gr8/Ru8s1AxOh1h90hrrVZAS/vTH6ub/zVMi5sXtK
 VEfTR2On6m0u0HUpBFWq08MBlymoLNNBQaoHuJxxs6GzJoNunlSN0ZaPqjbgq/IVhxve
 60yKzHi3f4kBGgFvt/g+eAG0sZye4zZONnEEKiVIURDHbVS7ACUFzzurIC7vHgF0VDDz
 oKMhS5dInQGPADaJWAUcZ3psqGgxyUeG1k2aujZ0kLbHRqiEw+UAy7gUwUt1GX16vF8S
 z04WYDCawe4mypNqtIAG40OF81QDfWcq5/ZlQqs9uNpNP1J//nAgqg6BWW92rIpfyLIZ
 w2sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj3u+N9SeM9Aka18amuU2MY0Gb/DXk6DtuepGapUZwOZMooaTVtOSKTEyWQp8gN3eVnwokZQTn3TapjLu4V+32HfE4YitsvTGWE26cOuZ5
X-Gm-Message-State: AOJu0YzUZS9tHuognBDLoxLNSiPlZUJ70zp9PBiSS8RJKXwskhzeB3D3
 OggPXfg5BsHpxIq0sRFrObbO+dmUR7Pnj5cDw/K62CNWOwCRHe6lTvNR7nIeEJQ=
X-Google-Smtp-Source: AGHT+IHx6OgnZqoA47DWn8wuRljAFdMFhiZ6+NIFrU7zSwOVCqmrAjMM7gy8tqRiA3yb/lHGnh0o8Q==
X-Received: by 2002:a05:600c:3d8a:b0:412:e961:b920 with SMTP id
 bi10-20020a05600c3d8a00b00412e961b920mr4044192wmb.20.1709714028759; 
 Wed, 06 Mar 2024 00:33:48 -0800 (PST)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c1c1000b00412d2dd4bb6sm13713755wms.42.2024.03.06.00.33.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 00:33:48 -0800 (PST)
Message-ID: <0db9babe-da95-48e2-b577-3e92a81f8303@ursulin.net>
Date: Wed, 6 Mar 2024 08:33:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] drm/panfrost: Replace fdinfo's profiling debugfs
 knob with sysfs
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20240306015819.822128-1-adrian.larumbe@collabora.com>
 <20240306015819.822128-2-adrian.larumbe@collabora.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240306015819.822128-2-adrian.larumbe@collabora.com>
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


On 06/03/2024 01:56, Adrián Larumbe wrote:
> Debugfs isn't always available in production builds that try to squeeze
> every single byte out of the kernel image, but we still need a way to
> toggle the timestamp and cycle counter registers so that jobs can be
> profiled for fdinfo's drm engine and cycle calculations.
> 
> Drop the debugfs knob and replace it with a sysfs file that accomplishes
> the same functionality, and document its ABI in a separate file.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>   .../testing/sysfs-driver-panfrost-profiling   | 10 +++++
>   Documentation/gpu/panfrost.rst                |  9 ++++
>   drivers/gpu/drm/panfrost/Makefile             |  2 -
>   drivers/gpu/drm/panfrost/panfrost_debugfs.c   | 21 ----------
>   drivers/gpu/drm/panfrost/panfrost_debugfs.h   | 14 -------
>   drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
>   drivers/gpu/drm/panfrost/panfrost_drv.c       | 41 ++++++++++++++++---
>   drivers/gpu/drm/panfrost/panfrost_job.c       |  2 +-
>   8 files changed, 57 insertions(+), 44 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-panfrost-profiling
>   delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
>   delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-panfrost-profiling b/Documentation/ABI/testing/sysfs-driver-panfrost-profiling
> new file mode 100644
> index 000000000000..1d8bb0978920
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-panfrost-profiling
> @@ -0,0 +1,10 @@
> +What:		/sys/bus/platform/drivers/panfrost/.../profiling
> +Date:		February 2024
> +KernelVersion:	6.8.0
> +Contact:	Adrian Larumbe <adrian.larumbe@collabora.com>
> +Description:
> +		Get/set drm fdinfo's engine and cycles profiling status.
> +		Valid values are:
> +		0: Don't enable fdinfo job profiling sources.
> +		1: Enable fdinfo job profiling sources, this enables both the GPU's
> +		   timestamp and cycle counter registers.
> \ No newline at end of file
> diff --git a/Documentation/gpu/panfrost.rst b/Documentation/gpu/panfrost.rst
> index b80e41f4b2c5..51ba375fd80d 100644
> --- a/Documentation/gpu/panfrost.rst
> +++ b/Documentation/gpu/panfrost.rst
> @@ -38,3 +38,12 @@ the currently possible format options:
>   
>   Possible `drm-engine-` key names are: `fragment`, and  `vertex-tiler`.
>   `drm-curfreq-` values convey the current operating frequency for that engine.
> +
> +Users must bear in mind that engine and cycle sampling are disabled by default,
> +because of power saving concerns. `fdinfo` users and benchmark applications which
> +query the fdinfo file must make sure to toggle the job profiling status of the
> +driver by writing into the appropriate sysfs node::
> +
> +    echo <N> > /sys/bus/platform/drivers/panfrost/[a-f0-9]*.gpu/profiling

A late thought - how it would work to not output the inactive fdinfo 
keys when this knob is not enabled?

Generic userspace like gputop already handles that and wouldn't show the 
stat. Which may be more user friendly than showing stats permanently at 
zero. It may be moot once you add the auto-toggle to gputop (or so) but 
perhaps worth considering.

Regards,

Tvrtko

> +
> +Where `N` is either `0` or `1`, depending on the desired enablement status.
> diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost/Makefile
> index 2c01c1e7523e..7da2b3f02ed9 100644
> --- a/drivers/gpu/drm/panfrost/Makefile
> +++ b/drivers/gpu/drm/panfrost/Makefile
> @@ -12,6 +12,4 @@ panfrost-y := \
>   	panfrost_perfcnt.o \
>   	panfrost_dump.o
>   
> -panfrost-$(CONFIG_DEBUG_FS) += panfrost_debugfs.o
> -
>   obj-$(CONFIG_DRM_PANFROST) += panfrost.o
> diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.c b/drivers/gpu/drm/panfrost/panfrost_debugfs.c
> deleted file mode 100644
> index 72d4286a6bf7..000000000000
> --- a/drivers/gpu/drm/panfrost/panfrost_debugfs.c
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/* Copyright 2023 Collabora ltd. */
> -/* Copyright 2023 Amazon.com, Inc. or its affiliates. */
> -
> -#include <linux/debugfs.h>
> -#include <linux/platform_device.h>
> -#include <drm/drm_debugfs.h>
> -#include <drm/drm_file.h>
> -#include <drm/panfrost_drm.h>
> -
> -#include "panfrost_device.h"
> -#include "panfrost_gpu.h"
> -#include "panfrost_debugfs.h"
> -
> -void panfrost_debugfs_init(struct drm_minor *minor)
> -{
> -	struct drm_device *dev = minor->dev;
> -	struct panfrost_device *pfdev = platform_get_drvdata(to_platform_device(dev->dev));
> -
> -	debugfs_create_atomic_t("profile", 0600, minor->debugfs_root, &pfdev->profile_mode);
> -}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.h b/drivers/gpu/drm/panfrost/panfrost_debugfs.h
> deleted file mode 100644
> index c5af5f35877f..000000000000
> --- a/drivers/gpu/drm/panfrost/panfrost_debugfs.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Copyright 2023 Collabora ltd.
> - * Copyright 2023 Amazon.com, Inc. or its affiliates.
> - */
> -
> -#ifndef PANFROST_DEBUGFS_H
> -#define PANFROST_DEBUGFS_H
> -
> -#ifdef CONFIG_DEBUG_FS
> -void panfrost_debugfs_init(struct drm_minor *minor);
> -#endif
> -
> -#endif  /* PANFROST_DEBUGFS_H */
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 62f7e3527385..cffcb0ac7c11 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -130,7 +130,7 @@ struct panfrost_device {
>   	struct list_head scheduled_jobs;
>   
>   	struct panfrost_perfcnt *perfcnt;
> -	atomic_t profile_mode;
> +	bool profile_mode;
>   
>   	struct mutex sched_lock;
>   
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index a926d71e8131..9696702800a4 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -20,7 +20,6 @@
>   #include "panfrost_job.h"
>   #include "panfrost_gpu.h"
>   #include "panfrost_perfcnt.h"
> -#include "panfrost_debugfs.h"
>   
>   static bool unstable_ioctls;
>   module_param_unsafe(unstable_ioctls, bool, 0600);
> @@ -600,10 +599,6 @@ static const struct drm_driver panfrost_drm_driver = {
>   
>   	.gem_create_object	= panfrost_gem_create_object,
>   	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
> -
> -#ifdef CONFIG_DEBUG_FS
> -	.debugfs_init		= panfrost_debugfs_init,
> -#endif
>   };
>   
>   static int panfrost_probe(struct platform_device *pdev)
> @@ -692,6 +687,41 @@ static void panfrost_remove(struct platform_device *pdev)
>   	drm_dev_put(ddev);
>   }
>   
> +static ssize_t profiling_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct panfrost_device *pfdev = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%d\n", pfdev->profile_mode);
> +}
> +
> +
> +static ssize_t profiling_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf, size_t len)
> +{
> +	struct panfrost_device *pfdev = dev_get_drvdata(dev);
> +	bool value;
> +	int err;
> +
> +	err = kstrtobool(buf, &value);
> +	if (err)
> +		return err;
> +
> +	pfdev->profile_mode = value;
> +
> +	return len;
> +}
> +
> +static DEVICE_ATTR_RW(profiling);
> +
> +static struct attribute *panfrost_attrs[] = {
> +	&dev_attr_profiling.attr,
> +	NULL,
> +};
> +
> +ATTRIBUTE_GROUPS(panfrost);
> +
>   /*
>    * The OPP core wants the supply names to be NULL terminated, but we need the
>    * correct num_supplies value for regulator core. Hence, we NULL terminate here
> @@ -789,6 +819,7 @@ static struct platform_driver panfrost_driver = {
>   		.name	= "panfrost",
>   		.pm	= pm_ptr(&panfrost_pm_ops),
>   		.of_match_table = dt_match,
> +		.dev_groups = panfrost_groups,
>   	},
>   };
>   module_platform_driver(panfrost_driver);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 0c2dbf6ef2a5..a61ef0af9a4e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -243,7 +243,7 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>   	subslot = panfrost_enqueue_job(pfdev, js, job);
>   	/* Don't queue the job if a reset is in progress */
>   	if (!atomic_read(&pfdev->reset.pending)) {
> -		if (atomic_read(&pfdev->profile_mode)) {
> +		if (pfdev->profile_mode) {
>   			panfrost_cycle_counter_get(pfdev);
>   			job->is_profiled = true;
>   			job->start_time = ktime_get();
