Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A715A9271D3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 10:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A54510EA28;
	Thu,  4 Jul 2024 08:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7400510EA28
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 08:35:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5568367;
 Thu,  4 Jul 2024 01:35:49 -0700 (PDT)
Received: from [10.1.36.26] (e122027.cambridge.arm.com [10.1.36.26])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FD5B3F766;
 Thu,  4 Jul 2024 01:35:23 -0700 (PDT)
Message-ID: <957a0c8e-f80b-4f6f-ac6f-70398abafd6f@arm.com>
Date: Thu, 4 Jul 2024 09:35:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Record devfreq busy as soon as a job is
 started
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
References: <20240703155646.80928-1-steven.price@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240703155646.80928-1-steven.price@arm.com>
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

On 03/07/2024 16:56, Steven Price wrote:
> If a queue is already assigned to the hardware, then a newly submitted
> job can start straight away without waiting for the tick. However in
> this case the devfreq infrastructure isn't notified that the GPU is
> busy. By the time the tick happens the job might well have finished and
> no time will be accounted for the GPU being busy.
> 
> Fix this by recording the GPU as busy directly in queue_run_job() in the
> case where there is a CSG assigned and therefore we just ring the
> doorbell.
> 
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 951ff7e63ea8..e7afaa1ad8dc 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2942,6 +2942,7 @@ queue_run_job(struct drm_sched_job *sched_job)
>  			pm_runtime_get(ptdev->base.dev);
>  			sched->pm.has_ref = true;
>  		}
> +		panthor_devfreq_record_busy(sched->ptdev);
>  	}
>  
>  	/* Update the last fence. */

Pushed to drm-misc-next

Thanks,
Steve
