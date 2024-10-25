Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4270E9B0479
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 15:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15DD10EAC6;
	Fri, 25 Oct 2024 13:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AF68410EAC6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 13:48:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E28CC339;
 Fri, 25 Oct 2024 06:48:48 -0700 (PDT)
Received: from [10.1.36.18] (e122027.cambridge.arm.com [10.1.36.18])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B94A3F71E;
 Fri, 25 Oct 2024 06:48:18 -0700 (PDT)
Message-ID: <f1e311f2-055c-4732-b1b9-d38a88e6059b@arm.com>
Date: Fri, 25 Oct 2024 14:48:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Fail job creation when the group is dead
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Christopher Healy <healych@amazon.com>,
 kernel@collabora.com
References: <20241025132105.2348441-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241025132105.2348441-1-boris.brezillon@collabora.com>
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

On 25/10/2024 14:21, Boris Brezillon wrote:
> Userspace can use GROUP_SUBMIT errors as a trigger to check the group
> state and recreate the group if it became unusable. Make sure we
> report an error when the group became unusable.
> 
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 423743ad8842..9f02554a20db 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3678,6 +3678,11 @@ panthor_job_create(struct panthor_file *pfile,
>  		goto err_put_job;
>  	}
>  
> +	if (!group_can_run(job->group)) {
> +		ret = -EINVAL;
> +		goto err_put_job;
> +	}
> +
>  	if (job->queue_idx >= job->group->queue_count ||
>  	    !job->group->queues[job->queue_idx]) {
>  		ret = -EINVAL;

