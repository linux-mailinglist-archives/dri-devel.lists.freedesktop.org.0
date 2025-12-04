Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D3FCA29FC
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 08:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F066E10E05F;
	Thu,  4 Dec 2025 07:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pQ8KNRag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B046610E05F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 07:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764833041;
 bh=zCdhKTAewvebzcXbiVF6pwKKtDPYrzy4AB+FUn3+Or8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pQ8KNRag7/ouAsm8kziPoD1BxpBVRsZuYtpiK+ZaYDhG6Qw2CPJDf8vHhiHue+44N
 NALVraeaiWP3fMqxTO7OHqgY/XfAoess0B4G6X77Z7VQnitoUm9TbjcgwiNMmdwo8t
 VgHc3cj/+MxwrjvhpgUH2WBnqG0HwWlchOKwkI+9geHsA3CuUv7ead/rDwI94dj6qS
 5Bp8DPvUEka4wWyxVlQ3uKgv3yrYGLhg3yU0QU8VT/uHANrFp+BdyKd3mDzhceRfwq
 nQ6Zy8N9HPyy0Fzi3RvKypvDv0cFiR/5pLwPYxjJ8doJbFVUL+4i+KtM6I2SfkTUKS
 arCMDYF0b2tuQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 95E6817E1155;
 Thu,  4 Dec 2025 08:24:00 +0100 (CET)
Date: Thu, 4 Dec 2025 08:23:55 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Grant Likely
 <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tvrtko.ursulin@igalia.com
Subject: Re: [PATCH] drm/panthor: fix for dma-fence safe access rules
Message-ID: <20251204082355.2fa133bb@fedora>
In-Reply-To: <20251204015034.841235-1-olvaffe@gmail.com>
References: <20251204015034.841235-1-olvaffe@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed,  3 Dec 2025 17:50:34 -0800
Chia-I Wu <olvaffe@gmail.com> wrote:

> Commit 506aa8b02a8d6 ("dma-fence: Add safe access helpers and document
> the rules") details the dma-fence safe access rules. The most common
> culprit is that drm_sched_fence_get_timeline_name may race with
> group_free_queue.
> 
> Fixes: d2624d90a0b77 ("drm/panthor: assign unique names to queues")
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

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

