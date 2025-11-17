Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA40C64D0D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 16:12:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507B410E3BE;
	Mon, 17 Nov 2025 15:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E66D710E3BE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 15:12:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5DD3FEC;
 Mon, 17 Nov 2025 07:12:18 -0800 (PST)
Received: from [10.57.69.30] (unknown [10.57.69.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD6DA3F66E;
 Mon, 17 Nov 2025 07:12:24 -0800 (PST)
Message-ID: <7b885620-3af0-4b8a-9c94-fb9bbc8cd44d@arm.com>
Date: Mon, 17 Nov 2025 15:12:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] drm/panthor: Relax a check in
 panthor_sched_pre_reset()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 Karunika Choo <karunika.choo@arm.com>, kernel@collabora.com
References: <20251113103953.1519935-1-boris.brezillon@collabora.com>
 <20251113103953.1519935-7-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251113103953.1519935-7-boris.brezillon@collabora.com>
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

On 13/11/2025 10:39, Boris Brezillon wrote:
> Groups are only moved out of the runnable lists when
> panthor_group_stop() is called or when they run out of jobs.
> What should not happen though is having one group added to one of
> the runnable list after reset.in_progress has been set to true, but
> that's not something we can easily check, so let's just drop the
> WARN_ON() in panthor_sched_pre_reset().
> 
> v2:
> - Adjust explanation in commit message
> 
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Ah, so if I wasn't so far behind on my emails I'd have spotted this
updated version! ;)

That commit message looks fine.

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index e74ca071159d..d121b794bd79 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2836,8 +2836,6 @@ void panthor_sched_pre_reset(struct panthor_device *ptdev)
>  	 * new jobs while we're resetting.
>  	 */
>  	for (i = 0; i < ARRAY_SIZE(sched->groups.runnable); i++) {
> -		/* All groups should be in the idle lists. */
> -		drm_WARN_ON(&ptdev->base, !list_empty(&sched->groups.runnable[i]));
>  		list_for_each_entry_safe(group, group_tmp, &sched->groups.runnable[i], run_node)
>  			panthor_group_stop(group);
>  	}

