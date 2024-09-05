Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 734C396D9EC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 15:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EF510E8A1;
	Thu,  5 Sep 2024 13:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8249B10E8A8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 13:13:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7E0EFEC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 06:14:17 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DEBF83F73F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 06:13:50 -0700 (PDT)
Date: Thu, 5 Sep 2024 14:13:47 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Don't add write fences to the shared BOs
Message-ID: <ZtmuixXbIUKHcnPP@e110455-lin.cambridge.arm.com>
References: <20240905070155.3254011-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240905070155.3254011-1-boris.brezillon@collabora.com>
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

On Thu, Sep 05, 2024 at 09:01:54AM +0200, Boris Brezillon wrote:
> The only user (the mesa gallium driver) is already assuming explicit
> synchronization and doing the export/import dance on shared BOs. The
> only reason we were registering ourselves as writers on external BOs
> is because Xe, which was the reference back when we developed Panthor,
> was doing so. Turns out Xe was wrong, and we really want bookkeep on
> all registered fences, so userspace can explicitly upgrade those to
> read/write when needed.
> 
> Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 9a0ff48f7061..41260cf4beb8 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3423,13 +3423,8 @@ void panthor_job_update_resvs(struct drm_exec *exec, struct drm_sched_job *sched
>  {
>  	struct panthor_job *job = container_of(sched_job, struct panthor_job, base);
>  
> -	/* Still not sure why we want USAGE_WRITE for external objects, since I
> -	 * was assuming this would be handled through explicit syncs being imported
> -	 * to external BOs with DMA_BUF_IOCTL_IMPORT_SYNC_FILE, but other drivers
> -	 * seem to pass DMA_RESV_USAGE_WRITE, so there must be a good reason.
> -	 */
>  	panthor_vm_update_resvs(job->group->vm, exec, &sched_job->s_fence->finished,
> -				DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_WRITE);
> +				DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_BOOKKEEP);
>  }
>  
>  void panthor_sched_unplug(struct panthor_device *ptdev)
> -- 
> 2.46.0
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
