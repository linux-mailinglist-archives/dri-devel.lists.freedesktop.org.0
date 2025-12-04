Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B25CA2FC2
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 10:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2290710E8E1;
	Thu,  4 Dec 2025 09:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nrAOdMet";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A740C10E8E1
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 09:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XLnP7djkkJPtZ/I0IdDwGxartFWzs2okdYnXPrpFjts=; b=nrAOdMetj8Xl4grYL1doShScDj
 mvDxCwihCwAVZQpdbYxyRXR+Rlce+4GXj387Im5VJ/qAqGHcdZdqsd8GDwMXp99Nz4DPQjEXkhGgn
 KYI1lMo/iCf4LBDWYRUoeNBkh3pdMJZ0EAYpFzD2/NKTWfMJdEeCAPIT4iryhZy3jfPN9Fa+TY6p3
 FVXxstxst235z1aFH1L5pxe8AVrVMX9pb4EnMBolmPeAyTI8E+1zHsg+OMvWNqOiKz6so5i9RY0tv
 iCSN5Xe8G8TqRt1OoJr0yssEl8XgaUe1bjXfFL5xoh9VJNE/q/hUAg58eSXwbD9E4/G28OlGR9yFw
 FVGt56mw==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vR5cT-008bIB-7F; Thu, 04 Dec 2025 10:27:25 +0100
Message-ID: <4e59c6f8-bc9b-4fd5-9b0f-511cce760ac2@igalia.com>
Date: Thu, 4 Dec 2025 09:27:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: fix for dma-fence safe access rules
To: Chia-I Wu <olvaffe@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251204015034.841235-1-olvaffe@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20251204015034.841235-1-olvaffe@gmail.com>
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


On 04/12/2025 01:50, Chia-I Wu wrote:
> Commit 506aa8b02a8d6 ("dma-fence: Add safe access helpers and document
> the rules") details the dma-fence safe access rules. The most common
> culprit is that drm_sched_fence_get_timeline_name may race with
> group_free_queue.
> 
> Fixes: d2624d90a0b77 ("drm/panthor: assign unique names to queues")
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>   drivers/gpu/drm/panthor/panthor_sched.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 33b9ef537e359..a8b1347e4da71 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -23,6 +23,7 @@
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/rcupdate.h>
>   
>   #include "panthor_devfreq.h"
>   #include "panthor_device.h"
> @@ -923,6 +924,9 @@ static void group_release_work(struct work_struct *work)
>   						   release_work);
>   	u32 i;
>   
> +	/* dma-fences may still be accessing group->queues under rcu lock. */
> +	synchronize_rcu();
> +
>   	for (i = 0; i < group->queue_count; i++)
>   		group_free_queue(group, group->queues[i]);
>   

This handles the shared queue->fence_ctx.lock as well (which is also 
unsafe until Christian lands the inline lock, etc patch series) so it 
looks good to me as well.

Just to mention an alternative could be to simply switch release_work to 
INIT_RCU_WORK/queue_rcu_work, but I am not sure if that has an advantage.

Regards,

Tvrtko

