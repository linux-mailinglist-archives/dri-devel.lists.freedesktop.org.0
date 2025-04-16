Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82263A90640
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 16:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216F310E94C;
	Wed, 16 Apr 2025 14:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHy2i4VQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B631510E94C;
 Wed, 16 Apr 2025 14:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744813513; x=1776349513;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=RUUhMRaXCYfn5fwgQqSFNGmUVfLFJHpfpDzjR3hSwRQ=;
 b=WHy2i4VQsURUrmcaa0H+z3eRCgRljscfmrixtr6Fy4UWzSUwFhDx6MZ6
 1qrh9AxNzkP3HNmpDl+TnHMO+p4jQVDCBnrgqdNfLoCkK6ELZC8j2HDF8
 12mbFSIO/9uZcW1+ft/wVlujMM22iOQAQ/N7H24n86W5uqpyxoP6mjIXf
 wME7OnBCsfOBOuzLtbrJ8nPZ4RgejyRqk3Qxnw8/iUOdSSsZHL+kL9gjH
 RlIePqC7H+GR2aoxwAqBMhvWoHZyWNEIfBvEr1sEAVgOvr/+H05CHGATV
 XV7PKu3dfTTf0KLJus4Pch1pReEG/sCsD+V03XmykmZJGapVjIeYomLoi Q==;
X-CSE-ConnectionGUID: ICGory94QsWlwk4J33BA+Q==
X-CSE-MsgGUID: Xe8dqN9SRWKJ5PHCth0Gfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57000748"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="57000748"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 07:25:13 -0700
X-CSE-ConnectionGUID: LlBinjo4QGKYxHU6lkykPA==
X-CSE-MsgGUID: yVO+/8vQQlKQ2OvfD9ZBKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="130258233"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 07:25:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6n?=
 =?utf-8?Q?ig?=
 <christian.koenig@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Sunil
 Khatri <sunil.khatri@amd.com>
Subject: Re: [PATCH v4 1/5] drm: add macro drm_file_err to print process info
In-Reply-To: <20250416133144.862023-1-sunil.khatri@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250416133144.862023-1-sunil.khatri@amd.com>
Date: Wed, 16 Apr 2025 17:25:06 +0300
Message-ID: <87lds0p4jh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 16 Apr 2025, Sunil Khatri <sunil.khatri@amd.com> wrote:
> Add a drm helper macro which append the process information for
> the drm_file over drm_err.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  include/drm/drm_file.h | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 94d365b22505..5ae5ad1048fb 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -37,6 +37,7 @@
>  #include <uapi/drm/drm.h>
>  
>  #include <drm/drm_prime.h>
> +#include <drm/drm_print.h>

Not a fan of including drm_print.h everywhere that drm_file.h is
included. We've been trying to get rid of this, and go the other
way. It's really hard to manage dependencies when everything ends up
including everything.

>  
>  struct dma_fence;
>  struct drm_file;
> @@ -446,6 +447,46 @@ static inline bool drm_is_accel_client(const struct drm_file *file_priv)
>  	return file_priv->minor->type == DRM_MINOR_ACCEL;
>  }
>  
> +static struct task_struct *drm_task_lock(struct drm_file *file_priv)
> +					__attribute__((__maybe_unused));

inline is the keyword you're missing here, and that's why you've had to
add maybe unused...

> +static struct task_struct *drm_task_lock(struct drm_file *file_priv)
> +{
> +	struct task_struct *task;
> +	struct pid *pid;
> +
> +	mutex_lock(&file_priv->client_name_lock);
> +	rcu_read_lock();
> +	pid = rcu_dereference(file_priv->pid);
> +	task = pid_task(pid, PIDTYPE_TGID);
> +	return task;
> +}
> +
> +static void drm_task_unlock(struct drm_file *file_priv) __attribute__((__maybe_unused));
> +static void drm_task_unlock(struct drm_file *file_priv)
> +{
> +	rcu_read_unlock();
> +	mutex_unlock(&file_priv->client_name_lock);
> +}

...but *why* are you inlining these? To make this header self-contained,
I think you'd need to add maybe sched.h, pid.h, rcupdate.h, mutex.h, or
something. I consider static inlines actively harmful if they force you
to pull in a lot of other headers.

> +/**
> + * drm_file_err - Fill info string with process name and pid
> + * @file_priv: context of interest for process name and pid
> + * @fmt: prinf() like format string
> + *
> + * This update the user provided buffer with process
> + * name and pid information for @file_priv
> + */
> +#define drm_file_err(file_priv, fmt, ...)						\
> +	do {										\
> +		struct task_struct *task;						\
> +		struct drm_device *dev = file_priv->minor->dev;				\
> +											\
> +		task = drm_task_lock(file_priv);					\
> +		drm_err(dev, "comm: %s pid: %d client: %s " fmt,			\
> +			task ? task->comm : "", task ? task->pid : 0,			\
> +			file_priv->client_name ?: "Unset", ##__VA_ARGS__);		\
> +		drm_task_unlock(file_priv);						\
> +	} while (0)
> +

For that matter, why is *this* inline? For debugs it makes a little more
sense when it adds the function, but drm_err() doesn't.

Make all of these real functions, no need to include drm_print.h, and
everything is better.

BR,
Jani.

>  void drm_file_update_pid(struct drm_file *);
>  
>  struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned int minor_id);

-- 
Jani Nikula, Intel
