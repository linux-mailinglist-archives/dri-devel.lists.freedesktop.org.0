Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E58337A00F
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 08:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8C86E9D0;
	Tue, 11 May 2021 06:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE566E9D0;
 Tue, 11 May 2021 06:52:15 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id c22so21537121edn.7;
 Mon, 10 May 2021 23:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Zt9EleFqgDHEIQ+oyw3ngecefo9r13zwLFGMGvURmH8=;
 b=r73SwMKHhbYruy6BCD5buaACaKWq2AQGvkxITQjYzjfzNefUgDjucpCsQOqzqEWZSk
 7r90u0g6F7Kkt9jQkY3mfalz6Tn/X6YQat7hkP60TFYGxn70hNGuANDSdkDD1VGToNCy
 6v1mo36cvSKDT8z7JVHJucgBjjUtHMx2evDc0+dMoDkrtJ2ll/VgKMTvdLvIgogGvoXq
 lL0ynfOHclDArMQIpkR6fSnltTF9NXHjL2BsHEoSaGnZM5aYUHlxjxY6+OG7nyAxjysK
 35dnpYLLxj+8UDaBxTJMTzCus6ntlgQpX/iRfYutDO81zi2ZxcnWqqvl/XwxLTa4rFBd
 q9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Zt9EleFqgDHEIQ+oyw3ngecefo9r13zwLFGMGvURmH8=;
 b=dePTTJY1fQB3mfR+tfF5g0TKhUp3M/iogPr+lJEVIgG2mCsg28FFtQgEEGftTUwwCH
 JNY5s8msCV5HAnatQm8iXKh3HYI+s7U/QGHoTMwdfmxAsPGzpB9w6VI6pvKqc6cm59w1
 6qfylwN4/CvQnbNBRovmDAA8p5JA/lr5DsoPwBnPIty+5uZ0TVG3q3HMJpui8TEbMQzu
 YqDsXPIVxVvDynsWu/y2I0Pux8V4bybJOOdmeydRNPocIiCbxt3e7zt5AnOu+T6IyNfc
 nF2VuRR1APIZ0gvkmmXTI78kC9r+9w9BqA7AGs/93OYigZvgqL3PBo6ArpptkvHJWNNw
 Gv3Q==
X-Gm-Message-State: AOAM530PRsRvlD40nn6x5xT9hAo+nU49WCqf/FkerJ8zagFndMWtMHYZ
 7pnjPCtyV8G9K5B837lRe0E=
X-Google-Smtp-Source: ABdhPJxaATkCokEl6gpmLVR7OoX83MdgZZq/1DLhoe1faroKDNCmn4MMGzqnYoihRwxrCcsd9IGV+Q==
X-Received: by 2002:aa7:dad1:: with SMTP id x17mr34212261eds.47.1620715933847; 
 Mon, 10 May 2021 23:52:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:c3ab:ee01:d547:2c4e?
 ([2a02:908:1252:fb60:c3ab:ee01:d547:2c4e])
 by smtp.gmail.com with ESMTPSA id um28sm11148190ejb.63.2021.05.10.23.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 23:52:13 -0700 (PDT)
Subject: Re: [PATCH v6 11/16] drm/sched: Make timeout timer rearm conditional.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
 <20210510163625.407105-12-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d0fb2146-7f35-9667-10d0-88424b403d85@gmail.com>
Date: Tue, 11 May 2021 08:52:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510163625.407105-12-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.05.21 um 18:36 schrieb Andrey Grodzovsky:
> We don't want to rearm the timer if driver hook reports
> that the device is gone.
>
> v5: Update drm_gpu_sched_stat values in code.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index f4f474944169..8d1211e87101 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   {
>   	struct drm_gpu_scheduler *sched;
>   	struct drm_sched_job *job;
> +	enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
>   
>   	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>   
> @@ -331,7 +332,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   		list_del_init(&job->list);
>   		spin_unlock(&sched->job_list_lock);
>   
> -		job->sched->ops->timedout_job(job);
> +		status = job->sched->ops->timedout_job(job);
>   
>   		/*
>   		 * Guilty job did complete and hence needs to be manually removed
> @@ -345,9 +346,11 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   		spin_unlock(&sched->job_list_lock);
>   	}
>   
> -	spin_lock(&sched->job_list_lock);
> -	drm_sched_start_timeout(sched);
> -	spin_unlock(&sched->job_list_lock);
> +	if (status != DRM_GPU_SCHED_STAT_ENODEV) {
> +		spin_lock(&sched->job_list_lock);
> +		drm_sched_start_timeout(sched);
> +		spin_unlock(&sched->job_list_lock);
> +	}
>   }
>   
>    /**

