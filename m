Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ABDCA2F8F
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 10:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1C410E1C6;
	Thu,  4 Dec 2025 09:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8DB7310E1C6
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 09:25:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC9E11575
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 01:25:30 -0800 (PST)
Received: from [10.2.10.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 C82133F59E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 01:25:37 -0800 (PST)
Date: Thu, 4 Dec 2025 09:25:10 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tvrtko.ursulin@igalia.com
Subject: Re: [PATCH] drm/panthor: fix for dma-fence safe access rules
Message-ID: <aTFTdsXLBEjv5wcL@e142607>
References: <20251204015034.841235-1-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251204015034.841235-1-olvaffe@gmail.com>
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

On Wed, Dec 03, 2025 at 05:50:34PM -0800, Chia-I Wu wrote:
> Commit 506aa8b02a8d6 ("dma-fence: Add safe access helpers and document
> the rules") details the dma-fence safe access rules. The most common
> culprit is that drm_sched_fence_get_timeline_name may race with
> group_free_queue.
> 
> Fixes: d2624d90a0b77 ("drm/panthor: assign unique names to queues")
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 33b9ef537e359..a8b1347e4da71 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -23,6 +23,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/rcupdate.h>
>  
>  #include "panthor_devfreq.h"
>  #include "panthor_device.h"
> @@ -923,6 +924,9 @@ static void group_release_work(struct work_struct *work)
>  						   release_work);
>  	u32 i;
>  
> +	/* dma-fences may still be accessing group->queues under rcu lock. */
> +	synchronize_rcu();
> +
>  	for (i = 0; i < group->queue_count; i++)
>  		group_free_queue(group, group->queues[i]);
>  
> -- 
> 2.52.0.177.g9f829587af-goog
> 
