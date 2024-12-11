Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E269EC99D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 10:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B069910E130;
	Wed, 11 Dec 2024 09:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DC26110E130
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 09:47:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A6501063
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 01:47:49 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EA60F3F5A1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 01:47:20 -0800 (PST)
Date: Wed, 11 Dec 2024 09:47:17 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH] drm/panthor: Relax our expectations in
 panthor_sched_pre_reset()
Message-ID: <Z1lfpUv41AYKC-PS@e110455-lin.cambridge.arm.com>
References: <20241211074611.2326881-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241211074611.2326881-1-boris.brezillon@collabora.com>
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

On Wed, Dec 11, 2024 at 08:46:11AM +0100, Boris Brezillon wrote:
> Calling panthor_sched_suspend() doesn't guarantee that all groups
> are in the idle lists. Only the ones that were currently scheduled
> are handled in panthor_sched_suspend(), and that's fine, because
> we stop all runnable groups in panthor_sched_pre_reset(), but let's
> stop complaining about it.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 77b184c3fb0c..ed3b46767ed5 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2809,8 +2809,6 @@ void panthor_sched_pre_reset(struct panthor_device *ptdev)
>  	 * new jobs while we're resetting.
>  	 */
>  	for (i = 0; i < ARRAY_SIZE(sched->groups.runnable); i++) {
> -		/* All groups should be in the idle lists. */
> -		drm_WARN_ON(&ptdev->base, !list_empty(&sched->groups.runnable[i]));
>  		list_for_each_entry_safe(group, group_tmp, &sched->groups.runnable[i], run_node)
>  			panthor_group_stop(group);
>  	}
> -- 
> 2.47.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
