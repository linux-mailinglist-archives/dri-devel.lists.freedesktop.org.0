Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F45BC85AF
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 11:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5A810E1F7;
	Thu,  9 Oct 2025 09:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Tm8IKJ1i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FD310E1F7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 09:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760003138;
 bh=N14xRi/LXFeFYTWEglxzIEE9FdaBPOmKZXIq8guejaw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Tm8IKJ1iUVLPLvN9JI6YCKMRXb/liXKKnwoL+4qwtk/b6Xp7aS2z8pgwRuU2dD/7h
 WvRhIrbvZBx8vTmPm4kENrRhwjvie0NzwPWEw+ot/CTArQlqEnehNcbJvmlj/gVA7W
 R7GWlgUauVplxX9FYS7W2UDBZDsi9KijToj+HsSDJGim8Mtbz8se2kFnPC4eORCH7d
 GjUhcYNSFaAYsy5XFJopQBcgKsCDUMrbxZELNGzti7Fl76VJ7kzcAoTNs/jJPeEnls
 cSPTl889D2uDTfG+OwMMxlgEeFkcmsIXjeIohIWvbA0XXDHx1H/HTZ0t272qACt+UT
 H/4uv5pG2NDYQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B465D17E12DF;
 Thu,  9 Oct 2025 11:45:37 +0200 (CEST)
Date: Thu, 9 Oct 2025 11:45:31 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Fix UAF race between device unplug and FW
 event processing
Message-ID: <20251009114531.0e85fa21@fedora>
In-Reply-To: <20251008105322.4077661-1-ketil.johnsen@arm.com>
References: <20251008105322.4077661-1-ketil.johnsen@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Wed,  8 Oct 2025 12:53:20 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> The function panthor_fw_unplug() will free the FW memory sections.
> The problem is that there could still be pending FW events which are yet
> not handled at this point. process_fw_events_work() can in this case try
> to access said freed memory.
> 
> The fix is to stop FW event processing after IRQs are disabled but before
> the FW memory is freed.
> 
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c    |  3 +++
>  drivers/gpu/drm/panthor/panthor_sched.c | 12 ++++++++++++
>  drivers/gpu/drm/panthor/panthor_sched.h |  1 +
>  3 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 9bf06e55eaee..4f393c5cd26f 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1172,6 +1172,9 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
>  		panthor_fw_stop(ptdev);
>  	}
>  
> +	/* Any pending FW event processing must stop before we free FW memory */
> +	panthor_sched_stop_fw_events(ptdev);
> +
>  	list_for_each_entry(section, &ptdev->fw->sections, node)
>  		panthor_kernel_bo_destroy(section->mem);
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 0cc9055f4ee5..d150c8d99432 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1794,6 +1794,18 @@ void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 events)
>  	sched_queue_work(ptdev->scheduler, fw_events);
>  }
>  
> +/**
> + * panthor_sched_stop_fw_events() - Stop processing FW events.
> + */
> +void panthor_sched_stop_fw_events(struct panthor_device *ptdev)
> +{
> +	if (!ptdev->scheduler)
> +		return;
> +
> +	atomic_set(&ptdev->scheduler->fw_events, 0);
> +	cancel_work_sync(&ptdev->scheduler->fw_events_work);
> +}

Hm, I'd rather have this called from sched_unplug() and then have an
extra check in panthor_sched_report_fw_events() to bail out if the
scheduler component is no longer functional. This way this helper stays
private to panthor_sched.c.

> +
>  static const char *fence_get_driver_name(struct dma_fence *fence)
>  {
>  	return "panthor";
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
> index f4a475aa34c0..4393599ed330 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.h
> +++ b/drivers/gpu/drm/panthor/panthor_sched.h
> @@ -51,6 +51,7 @@ void panthor_sched_resume(struct panthor_device *ptdev);
>  
>  void panthor_sched_report_mmu_fault(struct panthor_device *ptdev);
>  void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 events);
> +void panthor_sched_stop_fw_events(struct panthor_device *ptdev);
>  
>  void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile);
>  

