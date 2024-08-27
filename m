Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C13E96049C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 10:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9274810E20A;
	Tue, 27 Aug 2024 08:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZhgDCZgs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D15110E20A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 08:39:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1CA02A416D3;
 Tue, 27 Aug 2024 08:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5901BC8B7AA;
 Tue, 27 Aug 2024 08:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724747989;
 bh=rZ2wpB0Y+VWnhoCHWKOo5llJYLwaTLq/4hYvgehNZ2s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZhgDCZgs3GArgGQylJXU0u72MWPZYCKfCElYIRFJKfpZSkL2EdPV8Cmq5TuOEns37
 v0D701DXavUQ0RTJkI2zfZU34C0KeldFJzYBb+d2P7K2FjrlDgvhbORUGJqXjIKVzL
 MLaKpMDL29pEaGZwgAHHAY1e2XPrAF/QIG7rUCK/xU9NkIxqP2zX7rbWwwy2KzUo4e
 qwraGfKm51CRYpaPuHQyGWMSKFzJiZvhFslQSVCT7KuZj8jcCxvUDrCbTID/dP3W73
 j/GZ3MNJPh2xEWhErNl1KCyxX+5g7/bBLqLQGoVPA0NM6shSpXWT+IguWtloYWvv0k
 Ujk6ilIZtj/fg==
Message-ID: <c443e90d-6907-4a02-bab4-c1943f021a8c@kernel.org>
Date: Tue, 27 Aug 2024 10:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix UB pointer dereference
To: Philipp Stanner <pstanner@redhat.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240827074521.12828-2-pstanner@redhat.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20240827074521.12828-2-pstanner@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 8/27/24 9:45 AM, Philipp Stanner wrote:
> In drm_sched_job_init(), commit 56e449603f0a ("drm/sched: Convert the
> GPU scheduler to variable number of run-queues") implemented a call to
> drm_err(), which uses the job's scheduler pointer as a parameter.
> job->sched, however, is not yet valid as it gets set by
> drm_sched_job_arm(), which is always called after drm_sched_job_init().
> 
> Since the scheduler code has no control over how the API-User has
> allocated or set 'job', the pointer's dereference is undefined behavior.
> 
> Fix the UB by replacing drm_err() with pr_err().
> 
> Cc: <stable@vger.kernel.org>	# 6.7+
> Fixes: 56e449603f0a ("drm/sched: Convert the GPU scheduler to variable number of run-queues")
> Reported-by: Danilo Krummrich <dakr@redhat.com>
> Closes: https://lore.kernel.org/lkml/20231108022716.15250-1-dakr@redhat.com/
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 7e90c9f95611..356c30fa24a8 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -797,7 +797,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>   		 * or worse--a blank screen--leave a trail in the
>   		 * logs, so this can be debugged easier.
>   		 */
> -		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
> +		pr_err("*ERROR* %s: entity has no rq!\n", __func__);

I don't think the "*ERROR*" string is necessary, it's pr_err() already.

Otherwise,

Acked-by: Danilo Krummrich <dakr@kernel.org>

>   		return -ENOENT;
>   	}
>   
