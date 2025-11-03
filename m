Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B8CC2C6F8
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 15:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D993A10E1F6;
	Mon,  3 Nov 2025 14:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 42B7210E416
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 14:37:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F6571D14
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 06:37:50 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 97AB53F694
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 06:37:57 -0800 (PST)
Date: Mon, 3 Nov 2025 14:37:48 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: disable async work during unplug
Message-ID: <aQi-PGCe8q3FHszH@e110455-lin.cambridge.arm.com>
References: <20251029111412.924104-1-ketil.johnsen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251029111412.924104-1-ketil.johnsen@arm.com>
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

On Wed, Oct 29, 2025 at 12:14:10PM +0100, Ketil Johnsen wrote:
> A previous change, "drm/panthor: Fix UAF race between device unplug and
> FW event processing", fixes a real issue where new work was unexpectedly
> queued after cancellation. This was fixed by a disable instead.
> 
> Apply the same disable logic to other device level async work on device
> unplug as a precaution.
> 
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>

Pushed the patch to drm-misc-next.

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 2 +-
>  drivers/gpu/drm/panthor/panthor_fw.c     | 2 +-
>  drivers/gpu/drm/panthor/panthor_sched.c  | 5 ++---
>  3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 962a10e00848e..c4ae78545ef03 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -120,7 +120,7 @@ static void panthor_device_reset_cleanup(struct drm_device *ddev, void *data)
>  {
>  	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
>  
> -	cancel_work_sync(&ptdev->reset.work);
> +	disable_work_sync(&ptdev->reset.work);
>  	destroy_workqueue(ptdev->reset.wq);
>  }
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 9bf06e55eaeea..ceb249da8b336 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1162,7 +1162,7 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
>  {
>  	struct panthor_fw_section *section;
>  
> -	cancel_delayed_work_sync(&ptdev->fw->watchdog.ping_work);
> +	disable_delayed_work_sync(&ptdev->fw->watchdog.ping_work);
>  
>  	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev)) {
>  		/* Make sure the IRQ handler cannot be called after that point. */
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index b7595beaa0205..278434da8926d 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3879,8 +3879,9 @@ void panthor_sched_unplug(struct panthor_device *ptdev)
>  {
>  	struct panthor_scheduler *sched = ptdev->scheduler;
>  
> -	cancel_delayed_work_sync(&sched->tick_work);
> +	disable_delayed_work_sync(&sched->tick_work);
>  	disable_work_sync(&sched->fw_events_work);
> +	disable_work_sync(&sched->sync_upd_work);
>  
>  	mutex_lock(&sched->lock);
>  	if (sched->pm.has_ref) {
> @@ -3898,8 +3899,6 @@ static void panthor_sched_fini(struct drm_device *ddev, void *res)
>  	if (!sched || !sched->csg_slot_count)
>  		return;
>  
> -	cancel_delayed_work_sync(&sched->tick_work);
> -
>  	if (sched->wq)
>  		destroy_workqueue(sched->wq);
>  
> -- 
> 2.47.2
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
