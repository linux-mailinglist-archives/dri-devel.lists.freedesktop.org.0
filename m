Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611ABC40E80
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 17:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F218810EB16;
	Fri,  7 Nov 2025 16:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 66C8D10EB16
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 16:40:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BB781515;
 Fri,  7 Nov 2025 08:40:49 -0800 (PST)
Received: from [10.57.72.216] (unknown [10.57.72.216])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B08863F66E;
 Fri,  7 Nov 2025 08:40:55 -0800 (PST)
Message-ID: <717fea87-6927-484a-b373-cb1917185c0f@arm.com>
Date: Fri, 7 Nov 2025 16:40:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] drm/panthor: Relax check in
 panthor_sched_pre_reset()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Lars-Ivar Hesselberg Simonsen <lars-ivar.simonsen@arm.com>,
 kernel@collabora.com
References: <20251031154818.821054-1-boris.brezillon@collabora.com>
 <20251031154818.821054-5-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251031154818.821054-5-boris.brezillon@collabora.com>
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

On 31/10/2025 15:48, Boris Brezillon wrote:
> A group can become runnable even after reset.in_progress has
> been set to true and panthor_sched_suspend() has been called,
> because the drm_sched queues are still running at that point,
> and ::run_job() might call group_schedule_locked() which moves
> the group to the runnable list. And that's fine, because we're
> moving those groups to the stopped list anyway when we call
> panthor_group_stop(), so just drop the misleading WARN_ON().

If we've got another thread mutating the runnable list between
panthor_sched_suspend() and list_for_each_entry_safe(), doesn't that
make the list iterator unsafe? (_safe only protects against deleting the
current item, not against concurrent access).

It feels to me like we should be holding the sched mutex - at least
while iterating. I agree the WARN_ON is unnecessary, and will need
removing if we simply guard the iteration - the alternative is to
recolour panthor_sched_suspend() to assume the lock is held (and take
the lock in panthor_sched_pre_reset), but I suspect that's a more ugly
change.

Thanks,
Steve

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index fc0826db8f48..51a8d842a7a3 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2835,8 +2835,6 @@ void panthor_sched_pre_reset(struct panthor_device *ptdev)
>  	 * new jobs while we're resetting.
>  	 */
>  	for (i = 0; i < ARRAY_SIZE(sched->groups.runnable); i++) {
> -		/* All groups should be in the idle lists. */
> -		drm_WARN_ON(&ptdev->base, !list_empty(&sched->groups.runnable[i]));
>  		list_for_each_entry_safe(group, group_tmp, &sched->groups.runnable[i], run_node)
>  			panthor_group_stop(group);
>  	}

