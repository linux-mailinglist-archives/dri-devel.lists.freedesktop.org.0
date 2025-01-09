Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E18A06FF6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 09:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6487B10ED26;
	Thu,  9 Jan 2025 08:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jMk83a/i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D3B10ED26
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 08:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736411342; x=1767947342;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uf6g8j7QSkEVEyJGoBD7bc6k9MlBS9K3wjJJ5rASZfM=;
 b=jMk83a/iEhV3xwqgXs/0gzQDaWbZe1vt1gOd2D7/xSofZP/83W4ZO6R2
 d/XirFqEKXHliodpG6AQnwKlopGkStVq7MGUA/VQaODjIzB4f8zMg/L4/
 IXw3dGHLYHV3PTloVaBwqZgJqJR3fXWjQEnOVv0+h/SHrRAsa6eRPS6mk
 PpdUO6x+Jkf4yjgYGQsYEdeoNCxcOlC/mjtYAaXyZq/L59Qev0CYABlPE
 QNH/g175xpptKqBu7Zz58+jS3/n7SoSaZpjBYJKKUXHaKQmv2Lv3QvsAs
 Qg/wNX4TNuH/UhBQ0Li9agjlLMlucxETDe6+2oFb8ZfEi1iPZCqTc5Ax1 A==;
X-CSE-ConnectionGUID: 18NGyBD1Q822kEFG/D/ixA==
X-CSE-MsgGUID: XbWDn97wQM6XvB6sAzhKWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36681007"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="36681007"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:29:02 -0800
X-CSE-ConnectionGUID: VyC2bIrGR+ah0kIdP5abmg==
X-CSE-MsgGUID: OJgaTGA8SNq9mc0jym9cOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107382801"
Received: from mgorski-mobl1.ger.corp.intel.com (HELO [10.245.84.116])
 ([10.245.84.116])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:28:59 -0800
Message-ID: <98e886f0-1208-4787-9adf-36cb8c3fac6f@linux.intel.com>
Date: Thu, 9 Jan 2025 09:28:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] accel/ivpu: Fix locking order in ivpu_job_submit
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
 <20250107173238.381120-12-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250107173238.381120-12-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 1/7/2025 6:32 PM, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> Fix deadlock in job submission and abort handling.
> When a thread aborts currently executing jobs due to a fault,
> it first locks the global lock protecting submitted_jobs (#1).
> 
> After the last job is destroyed, it proceeds to release the related context
> and locks file_priv (#2). Meanwhile, in the job submission thread,
> the file_priv lock (#2) is taken first, and then the submitted_jobs
> lock (#1) is obtained when a job is added to the submitted jobs list.
> 
>        CPU0                            CPU1
>        ----                    	       ----
>   (for example due to a fault)         (jobs submissions keep coming)
> 
>   lock(&vdev->submitted_jobs_lock) #1
>   ivpu_jobs_abort_all()
>   job_destroy()
>                                       lock(&file_priv->lock)           #2
>                                       lock(&vdev->submitted_jobs_lock) #1
>   file_priv_release()
>   lock(&vdev->context_list_lock)
>   lock(&file_priv->lock)           #2
> 
> This order of locking causes a deadlock. To resolve this issue,
> change the order of locking in ivpu_job_submit().
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_job.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index c694822a14bf..c93ea37062d7 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -597,6 +597,7 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority, u32 cmdq_id)
>  	if (ret < 0)
>  		return ret;
>  
> +	mutex_lock(&vdev->submitted_jobs_lock);
>  	mutex_lock(&file_priv->lock);
>  
>  	if (cmdq_id == 0)
> @@ -606,19 +607,17 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority, u32 cmdq_id)
>  	if (!cmdq) {
>  		ivpu_warn_ratelimited(vdev, "Failed to get job queue, ctx %d\n", file_priv->ctx.id);
>  		ret = -EINVAL;
> -		goto err_unlock_file_priv;
> +		goto err_unlock;
>  	}
>  
>  	ret = ivpu_cmdq_register(file_priv, cmdq);
>  	if (ret) {
>  		ivpu_err(vdev, "Failed to register command queue: %d\n", ret);
> -		goto err_unlock_file_priv;
> +		goto err_unlock;
>  	}
>  
>  	job->cmdq_id = cmdq->id;
>  
> -	mutex_lock(&vdev->submitted_jobs_lock);
> -
>  	is_first_job = xa_empty(&vdev->submitted_jobs_xa);
>  	ret = xa_alloc_cyclic(&vdev->submitted_jobs_xa, &job->job_id, job, file_priv->job_limit,
>  			      &file_priv->job_id_next, GFP_KERNEL);
> @@ -626,7 +625,7 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority, u32 cmdq_id)
>  		ivpu_dbg(vdev, JOB, "Too many active jobs in ctx %d\n",
>  			 file_priv->ctx.id);
>  		ret = -EBUSY;
> -		goto err_unlock_submitted_jobs;
> +		goto err_unlock;
>  	}
>  
>  	ret = ivpu_cmdq_push_job(cmdq, job);
> @@ -649,22 +648,20 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority, u32 cmdq_id)
>  		 job->job_id, file_priv->ctx.id, job->engine_idx, cmdq->priority,
>  		 job->cmd_buf_vpu_addr, cmdq->jobq->header.tail);
>  
> -	mutex_unlock(&vdev->submitted_jobs_lock);
>  	mutex_unlock(&file_priv->lock);
>  
>  	if (unlikely(ivpu_test_mode & IVPU_TEST_MODE_NULL_HW)) {
> -		mutex_lock(&vdev->submitted_jobs_lock);
>  		ivpu_job_signal_and_destroy(vdev, job->job_id, VPU_JSM_STATUS_SUCCESS);
> -		mutex_unlock(&vdev->submitted_jobs_lock);
>  	}
>  
> +	mutex_unlock(&vdev->submitted_jobs_lock);
> +
>  	return 0;
>  
>  err_erase_xa:
>  	xa_erase(&vdev->submitted_jobs_xa, job->job_id);
> -err_unlock_submitted_jobs:
> +err_unlock:
>  	mutex_unlock(&vdev->submitted_jobs_lock);
> -err_unlock_file_priv:
>  	mutex_unlock(&file_priv->lock);
>  	ivpu_rpm_put(vdev);
>  	return ret;

