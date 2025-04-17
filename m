Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2771A91814
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 11:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10D310EA7D;
	Thu, 17 Apr 2025 09:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jc+4tzuA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D212E10EA79;
 Thu, 17 Apr 2025 09:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744882526; x=1776418526;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=JkRx1SheIWGRySD81qlgeQU3ZaCj4ZhM3jKhfBE8xww=;
 b=Jc+4tzuAqAkz4CxKjRVmJfCytlnYKUIPgJZRZHoO0BhLav/Tn0jsWgUr
 QPYOyNzkkzwitOE97TJ4uVl4nkTCJE7zQdp6ahVridYiKIzbH/vQSsmuW
 r9pxdl043qPQz+6D0Cbej7snaJNDZweEm5gRBNwboUuFZ38M2VFUul/UB
 ci1t26UlrfPaUly55NqIdwibRZo6no2rREK2C8CXIMPuYCaciOlxi+e4Y
 qNi/GMOisDv5KzFp8/tMPDxmNTe7mA2EUWgfaTnvObtH2fzVn9PgKijz8
 9IvCuXeIMQ0KWUZ2X8z66rFYJ4SmoWYCRk/ZQcGJK3LQvOUmdpPIwvsts A==;
X-CSE-ConnectionGUID: b2f541fGT9OFkn9YqLb4vw==
X-CSE-MsgGUID: XpSDVNN1SM2YuF5H70xMMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46593538"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="46593538"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 02:35:25 -0700
X-CSE-ConnectionGUID: 0JTZFlWnSLevaDCD81Jr1g==
X-CSE-MsgGUID: cpriDevSTDqy4l+KDOyXjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="131294709"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.178])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 02:35:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6n?=
 =?utf-8?Q?ig?=
 <christian.koenig@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Sunil
 Khatri <sunil.khatri@amd.com>
Subject: Re: [PATCH v6 1/5] drm: add macro drm_file_err to print process info
In-Reply-To: <20250417091355.2240384-1-sunil.khatri@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250417091355.2240384-1-sunil.khatri@amd.com>
Date: Thu, 17 Apr 2025 12:35:19 +0300
Message-ID: <874iynp1uw.fsf@intel.com>
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

On Thu, 17 Apr 2025, Sunil Khatri <sunil.khatri@amd.com> wrote:
> Add a drm helper macro which append the process information for
> the drm_file over drm_err.
>
> v5: change to macro from function (Christian Koenig)
>     add helper functions for lock/unlock (Christian Koenig)
>
> v6: remove __maybe_unused and make function inline (Jani Nikula)
>     remove drm_print.h

I guess I gave all kinds of comments, but in the end my conclusion was:
why does *any* of this have to be static inline or macros? Make
drm_file_err() a regular function and hide the implementation inside
drm_file.c. That's the cleanest approach IMO.

BR,
Jani.

>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  include/drm/drm_file.h | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 94d365b22505..856b38e996c7 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -446,6 +446,43 @@ static inline bool drm_is_accel_client(const struct drm_file *file_priv)
>  	return file_priv->minor->type == DRM_MINOR_ACCEL;
>  }
>  
> +static inline struct task_struct *drm_task_lock(struct drm_file *file_priv)
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
> +static inline void drm_task_unlock(struct drm_file *file_priv)
> +{
> +	rcu_read_unlock();
> +	mutex_unlock(&file_priv->client_name_lock);
> +}
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
>  void drm_file_update_pid(struct drm_file *);
>  
>  struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned int minor_id);

-- 
Jani Nikula, Intel
