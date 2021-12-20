Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C488047A553
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 08:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609A810EA4C;
	Mon, 20 Dec 2021 07:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D236710EA4C;
 Mon, 20 Dec 2021 07:20:29 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id t18so18040448wrg.11;
 Sun, 19 Dec 2021 23:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=GP3AHE85BjMaBOxW+4lCJ8CDh4oih5y0fsUTC22U9n4=;
 b=oxsPm3zm8Ix4vP68jS6M0usq7IVsGf41mS9J4CtTohEvnnrz0eCw34E5T2UF1rxM3k
 lQ/TKhSAdZ9IYUNYSLxb+Iia2aNBs4w6GFr//0W1jL/BUZDDTrOU4uoC7hRcaoYdr0X1
 Xqv93EPqW09wIf/7qpJbq04YDjo+bsYJa3/Fu4h2P8ku6YqLc7CIQUYqGNIBJltWYcJU
 rXfQ9s+8XzVo03ueKsXlphCi5iGlSsvfcKZ0KykrXkr1Y7JwqpYjgYaw6HPGPXB6am28
 pv3fW2GxQdH8tG2D1PjoMyGc8Ic1XH+SwO3kxJS/Cf3j1f0o7OlDY03W9rU1nC0Pdyda
 alZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=GP3AHE85BjMaBOxW+4lCJ8CDh4oih5y0fsUTC22U9n4=;
 b=nexQyYQtG1hvSwIGPtj5W5qRRB4TJ1RJgtp5RRsjqoSrP4IuuZRrlfNwryDh4R1PtC
 k16huBUl2qEYT5MNMlSv6eu1oOb6OZOsBqcILzNoZ2nyEjDzutiVuqw+v1AKnBMr0ITs
 NkcSQj7+FhS0saZXI9hKSkTpJ/skClurR33VyUg2n49tt8Q916IdNCouKlsPDGSHTN+o
 HB63Fl1pJ4logjcsztNfojT0kVqhZj09abmdSbibuuBAol0S1rU1S+2DUwRCVyRFkpAg
 vdjZDk124KysDIHhShqf3QIXeADidq8BFXY036q1rWEy0vewQSmkJ2Omi5PRjDAeWBQC
 qqOQ==
X-Gm-Message-State: AOAM532rYDCANVi7rnuHlLExdyNSuk0s+KwFoUiu9YrhJ3BodXpIVPjk
 QWdXGbzSqVyn2qj+dna6W3M=
X-Google-Smtp-Source: ABdhPJy2pc5fIbtY/Iu4UGlcstbFsyOLxnK29jVSSH/v83j2RMtvCrLyQ4EiuMWVuflg2rv05ewvdw==
X-Received: by 2002:a5d:584f:: with SMTP id i15mr7542819wrf.542.1639984828504; 
 Sun, 19 Dec 2021 23:20:28 -0800 (PST)
Received: from [192.168.178.21] (p57b0bff8.dip0.t-ipconnect.de.
 [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id r8sm17740648wrz.43.2021.12.19.23.20.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Dec 2021 23:20:28 -0800 (PST)
Subject: Re: [RFC 4/6] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
 <20211217222745.881637-5-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c143e561-d149-6680-0b89-2cda78ea1d51@gmail.com>
Date: Mon, 20 Dec 2021 08:20:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211217222745.881637-5-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: horace.chen@amd.com, christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.12.21 um 23:27 schrieb Andrey Grodzovsky:
> Use reset domain wq also for non TDR gpu recovery trigers
> such as sysfs and RAS. We must serialize all possible
> GPU recoveries to gurantee no concurrency there.
> For TDR call the original recovery function directly since
> it's already executed from within the wq. For others just
> use a wrapper to qeueue work and wait on it to finish.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 33 +++++++++++++++++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
>   3 files changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index b5ff76aae7e0..8e96b9a14452 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1296,6 +1296,8 @@ bool amdgpu_device_has_job_running(struct amdgpu_device *adev);
>   bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev);
>   int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   			      struct amdgpu_job* job);
> +int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
> +			      struct amdgpu_job *job);
>   void amdgpu_device_pci_config_reset(struct amdgpu_device *adev);
>   int amdgpu_device_pci_reset(struct amdgpu_device *adev);
>   bool amdgpu_device_need_post(struct amdgpu_device *adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index b595e6d699b5..55cd67b9ede2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4979,7 +4979,7 @@ static void amdgpu_device_recheck_guilty_jobs(
>    * Returns 0 for success or an error on failure.
>    */
>   
> -int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
> +int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>   			      struct amdgpu_job *job)
>   {
>   	struct list_head device_list, *device_list_handle =  NULL;
> @@ -5236,6 +5236,37 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   	return r;
>   }
>   
> +struct recover_work_struct {

Please add an amdgpu_ prefix to the name.

> +	struct work_struct base;
> +	struct amdgpu_device *adev;
> +	struct amdgpu_job *job;
> +	int ret;
> +};
> +
> +static void amdgpu_device_queue_gpu_recover_work(struct work_struct *work)
> +{
> +	struct recover_work_struct *recover_work = container_of(work, struct recover_work_struct, base);
> +
> +	recover_work->ret = amdgpu_device_gpu_recover_imp(recover_work->adev, recover_work->job);
> +}
> +/*
> + * Serialize gpu recover into reset domain single threaded wq
> + */
> +int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
> +				    struct amdgpu_job *job)
> +{
> +	struct recover_work_struct work = {.adev = adev, .job = job};
> +
> +	INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
> +
> +	if (!queue_work(adev->reset_domain.wq, &work.base))
> +		return -EAGAIN;
> +
> +	flush_work(&work.base);
> +
> +	return work.ret;
> +}

Maybe that should be part of the scheduler code? Not really sure, just 
an idea.

Apart from that looks good to me,
Christian.

> +
>   /**
>    * amdgpu_device_get_pcie_info - fence pcie info about the PCIE slot
>    *
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index bfc47bea23db..38c9fd7b7ad4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -63,7 +63,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>   		  ti.process_name, ti.tgid, ti.task_name, ti.pid);
>   
>   	if (amdgpu_device_should_recover_gpu(ring->adev)) {
> -		amdgpu_device_gpu_recover(ring->adev, job);
> +		amdgpu_device_gpu_recover_imp(ring->adev, job);
>   	} else {
>   		drm_sched_suspend_timeout(&ring->sched);
>   		if (amdgpu_sriov_vf(adev))

