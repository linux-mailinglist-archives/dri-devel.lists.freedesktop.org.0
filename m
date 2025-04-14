Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09209A878D7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 09:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394DE10E306;
	Mon, 14 Apr 2025 07:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SWgZvjvQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C358010E306
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 07:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744616093;
 bh=M9u19Zg0jOO9PuzSwDTlUJEbh6SqdAswonvywMSeYdo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SWgZvjvQJBY1APfXhJIAJ6pI8t9op6uV5ozO59iOTu2H5snLUimI+N0kqteOxwlCX
 6LO+24OWcX5Z0/xn1MXRDrIac+kK426TRgJ+JsUDpEG7abB+nEmsItVaSzeKJvQHD+
 VCxR9Ao92Vk9hsKKxKfqddPqIaUhMtI4ZhF+ZvvzbMEjOaV+NQ6FLRBuhfHXkIS32d
 tsI7mFcYIerrIlVzAds09Qqn0vz3/ZxBygoiAAuMlakBtwkRZSMPvX26K7ABBRRG4S
 sATztpmEjYMIvIHFga7eUSWrwuJm7+JXNa4UUyJNIMLNuBhvXatvKQ4Uo1OIGbjOkB
 ub0c2nTIs742g==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0585117E0B2D;
 Mon, 14 Apr 2025 09:34:52 +0200 (CEST)
Date: Mon, 14 Apr 2025 09:34:48 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [bug report] drm/panthor: Call panthor_gpu_coherency_init()
 after PM resume()
Message-ID: <20250414093448.64cef724@collabora.com>
In-Reply-To: <6cb91960-1bb6-43d5-aec3-ed6048e8613e@stanley.mountain>
References: <6cb91960-1bb6-43d5-aec3-ed6048e8613e@stanley.mountain>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Sat, 12 Apr 2025 17:39:58 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> Hello Boris Brezillon,
> 
> Commit 7d5a3b22f5b5 ("drm/panthor: Call panthor_gpu_coherency_init()
> after PM resume()") from Apr 4, 2025 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/gpu/drm/panthor/panthor_device.c:248 panthor_device_init()
> 	warn: missing unwind goto?
> 
> drivers/gpu/drm/panthor/panthor_device.c
>     167 int panthor_device_init(struct panthor_device *ptdev)
>     168 {
>     169         u32 *dummy_page_virt;
>     170         struct resource *res;
>     171         struct page *p;
>     172         int ret;
>     173 
>     174         init_completion(&ptdev->unplug.done);
>     175         ret = drmm_mutex_init(&ptdev->base, &ptdev->unplug.lock);
>     176         if (ret)
>     177                 return ret;
>     178 
>     179         ret = drmm_mutex_init(&ptdev->base, &ptdev->pm.mmio_lock);
>     180         if (ret)
>     181                 return ret;
>     182 
>     183         atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
>     184         p = alloc_page(GFP_KERNEL | __GFP_ZERO);
>     185         if (!p)
>     186                 return -ENOMEM;
>     187 
>     188         ptdev->pm.dummy_latest_flush = p;
>     189         dummy_page_virt = page_address(p);
>     190         ret = drmm_add_action_or_reset(&ptdev->base, panthor_device_free_page,
>     191                                        ptdev->pm.dummy_latest_flush);
>     192         if (ret)
>     193                 return ret;
>     194 
>     195         /*
>     196          * Set the dummy page holding the latest flush to 1. This will cause the
>     197          * flush to avoided as we know it isn't necessary if the submission
>     198          * happens while the dummy page is mapped. Zero cannot be used because
>     199          * that means 'always flush'.
>     200          */
>     201         *dummy_page_virt = 1;
>     202 
>     203         INIT_WORK(&ptdev->reset.work, panthor_device_reset_work);
>     204         ptdev->reset.wq = alloc_ordered_workqueue("panthor-reset-wq", 0);
>     205         if (!ptdev->reset.wq)
>     206                 return -ENOMEM;
>     207 
>     208         ret = drmm_add_action_or_reset(&ptdev->base, panthor_device_reset_cleanup, NULL);
>     209         if (ret)
>     210                 return ret;
>     211 
>     212         ret = panthor_clk_init(ptdev);
>     213         if (ret)
>     214                 return ret;
>     215 
>     216         ret = panthor_devfreq_init(ptdev);
>     217         if (ret)
>     218                 return ret;
>     219 
>     220         ptdev->iomem = devm_platform_get_and_ioremap_resource(to_platform_device(ptdev->base.dev),
>     221                                                               0, &res);
>     222         if (IS_ERR(ptdev->iomem))
>     223                 return PTR_ERR(ptdev->iomem);
>     224 
>     225         ptdev->phys_addr = res->start;
>     226 
>     227         ret = devm_pm_runtime_enable(ptdev->base.dev);
>     228         if (ret)
>     229                 return ret;
>     230 
>     231         ret = pm_runtime_resume_and_get(ptdev->base.dev);
>     232         if (ret)
>     233                 return ret;
>     234 
>     235         /* If PM is disabled, we need to call panthor_device_resume() manually. */
>     236         if (!IS_ENABLED(CONFIG_PM)) {
>     237                 ret = panthor_device_resume(ptdev->base.dev);
>     238                 if (ret)
>     239                         return ret;
>     240         }
>     241 
>     242         ret = panthor_gpu_init(ptdev);
>     243         if (ret)
>     244                 goto err_rpm_put;
>     245 
>     246         ret = panthor_gpu_coherency_init(ptdev);
>     247         if (ret)
> --> 248                 return ret;  
>                         ^^^^^^^^^^^
> Missing cleanup?

Thanks for the report, it should definitely be

			goto err_unplug_gpu;

Do you plan to send a patch, or should I do it?

> 
>     249 
>     250         ret = panthor_mmu_init(ptdev);
>     251         if (ret)
>     252                 goto err_unplug_gpu;
>     253 
>     254         ret = panthor_fw_init(ptdev);
>     255         if (ret)
>     256                 goto err_unplug_mmu;
>     257 
>     258         ret = panthor_sched_init(ptdev);
>     259         if (ret)
>     260                 goto err_unplug_fw;
>     261 
>     262         /* ~3 frames */
>     263         pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
>     264         pm_runtime_use_autosuspend(ptdev->base.dev);
>     265 
>     266         ret = drm_dev_register(&ptdev->base, 0);
>     267         if (ret)
>     268                 goto err_disable_autosuspend;
>     269 
>     270         pm_runtime_put_autosuspend(ptdev->base.dev);
>     271         return 0;
>     272 
>     273 err_disable_autosuspend:
>     274         pm_runtime_dont_use_autosuspend(ptdev->base.dev);
>     275         panthor_sched_unplug(ptdev);
>     276 
>     277 err_unplug_fw:
>     278         panthor_fw_unplug(ptdev);
>     279 
>     280 err_unplug_mmu:
>     281         panthor_mmu_unplug(ptdev);
>     282 
>     283 err_unplug_gpu:
>     284         panthor_gpu_unplug(ptdev);
>     285 
>     286 err_rpm_put:
>     287         pm_runtime_put_sync_suspend(ptdev->base.dev);
>     288         return ret;
>     289 }
> 
> regards,
> dan carpenter

