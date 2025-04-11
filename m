Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABECA85C78
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 14:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E55510EB86;
	Fri, 11 Apr 2025 12:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dcdsb7jx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D437310EB84;
 Fri, 11 Apr 2025 12:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744373270; x=1775909270;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/pRtNN/baCy6DaANz+nXHBDMq81WCqSjU3Mcwr/XIic=;
 b=Dcdsb7jxXGjfKvLIVqEYGpiY/d/Ha7CDrvMYBd8gF0fDhDVOuX2KBJ4B
 uKt9rvtei7D1ur5+Ov098CgiuGeCfNV+pgXqRlQkOiupP77Cj1e83TnlH
 nSa4dnRSPLg7bq2iy/+oca5jQmACHuFQz2HEHBceGmBsCSjZTmZ5MJ9Fw
 5kjV12INYL/qUiYBLLdY0ti4/OUxP09Q7eWAdAQ+s7IQQsI5NQdG/Lpr/
 hGatxW12NZiZSzezleryV7TR6xwBYfptM/bFwmHSP0/Hq7srDJR2e8A9N
 mbOTP1isXm+Ri5IVXw8HffmJuTe4hJnYfdJh0A+o6AS2sjDxakX8kWOOG A==;
X-CSE-ConnectionGUID: YlSbNw1sTSmNPGm6h3/ysg==
X-CSE-MsgGUID: 9+kcJLWOSVioIJFr004hcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="71309363"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="71309363"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 05:07:49 -0700
X-CSE-ConnectionGUID: bYxTWJ0hSC2IC2lTF3LnZA==
X-CSE-MsgGUID: vYowM+W/SL2FZUZ390HV5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="128950671"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.125])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 05:07:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6n?=
 =?utf-8?Q?ig?=
 <christian.koenig@amd.com>, Sunil Khatri <sunil.khatri@amd.com>
Subject: Re: [PATCH] drm: function to get process name and pid
In-Reply-To: <20250411112622.4075526-1-sunil.khatri@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250411112622.4075526-1-sunil.khatri@amd.com>
Date: Fri, 11 Apr 2025 15:07:43 +0300
Message-ID: <87v7raucj4.fsf@intel.com>
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

On Fri, 11 Apr 2025, Sunil Khatri <sunil.khatri@amd.com> wrote:
> Add helper function which get the process information for
> the drm_file and updates the user provided character buffer
> with the information of process name and pid as a string.

Where's the user for this function?

BR,
Jani.

>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/drm_file.c | 30 ++++++++++++++++++++++++++++++
>  include/drm/drm_file.h     |  1 +
>  2 files changed, 31 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index cb5f22f5bbb6..4434258d21b5 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -965,6 +965,36 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>  }
>  EXPORT_SYMBOL(drm_show_fdinfo);
>  
> +/**
> + * drm_process_info - Fill info string with process name and pid
> + * @file_priv: context of interest for process name and pid
> + * @proc_info: user char ptr to write the string to
> + * @buff_size: size of the buffer passed for the string
> + *
> + * This update the user provided buffer with process
> + * name and pid information for @file_priv
> + */
> +void drm_process_info(struct drm_file *file_priv, char *proc_info, size_t buff_size)
> +{
> +	struct task_struct *task;
> +	struct pid *pid;
> +	struct drm_device *dev = file_priv->minor->dev;
> +
> +	if (!proc_info) {
> +		drm_err(dev, "Invalid user buffer\n");
> +		return;
> +	}
> +
> +	rcu_read_lock();
> +	pid = rcu_dereference(file_priv->pid);
> +	task = pid_task(pid, PIDTYPE_TGID);
> +	if (task)
> +		snprintf(proc_info, buff_size, "comm:%s pid:%d", task->comm, task->pid);
> +
> +	rcu_read_unlock();
> +}
> +EXPORT_SYMBOL(drm_process_info);
> +
>  /**
>   * mock_drm_getfile - Create a new struct file for the drm device
>   * @minor: drm minor to wrap (e.g. #drm_device.primary)
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index f0ef32e9fa5e..c01b34936968 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -501,6 +501,7 @@ void drm_print_memory_stats(struct drm_printer *p,
>  
>  void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
>  void drm_show_fdinfo(struct seq_file *m, struct file *f);
> +void drm_process_info(struct drm_file *file_priv, char *proc_info, size_t buff_size);
>  
>  struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);

-- 
Jani Nikula, Intel
