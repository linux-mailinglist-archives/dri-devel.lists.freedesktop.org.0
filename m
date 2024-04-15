Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3321F8A4CD6
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 12:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7289010E40E;
	Mon, 15 Apr 2024 10:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TArlUIlm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 596 seconds by postgrey-1.36 at gabe;
 Mon, 15 Apr 2024 10:47:50 UTC
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B23010E40E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 10:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zhliTNVKsjO5xoUkPIFxm6nyWiF6Xhv7P3ZlDB17d6I=; b=TArlUIlmPw8doPEmS7l0GPfWc+
 viITAZc0mJWWZVPAbltzL6aodQ37iCXmjBJp7eNmMzbC15x8W5tGjYEJWIJp83Z0jIm2EFKsM5TC8
 yIXH+bbr1S+IakOGOGGouj4+bpYkRiyID7GtsOkkSVQWOYrlqNRTE8nvbptpJoUrz56zlWdMxNqCo
 cUbEl2IsD8DHbC4XZGh5F0bkj0+KR+HXHCo+i+5zb0Wm9QqRS7gFnVcTzqQ09ZrdNmLiGDRpe2Jhc
 Add2HULrjYVuYe07a0B3EriCVdlIlh4C+QyO0THiYGhPMWuVupHqWfLfwuSuEHK/mDno6GjGDIBGB
 WBoDLAZQ==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rwJsC-004jHZ-UV; Mon, 15 Apr 2024 12:47:40 +0200
Message-ID: <8126c24a-c71b-474e-9268-fbfa837c0ae2@igalia.com>
Date: Mon, 15 Apr 2024 11:47:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/v3d: Don't increment `enabled_ns` twice
Content-Language: en-GB
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Chema Casanova <jmcasanova@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240403203517.731876-1-mcanal@igalia.com>
 <20240403203517.731876-2-mcanal@igalia.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240403203517.731876-2-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 03/04/2024 21:24, Maíra Canal wrote:
> The commit 509433d8146c ("drm/v3d: Expose the total GPU usage stats on sysfs")
> introduced the calculation of global GPU stats. For the regards, it used
> the already existing infrastructure provided by commit 09a93cc4f7d1 ("drm/v3d:
> Implement show_fdinfo() callback for GPU usage stats"). While adding
> global GPU stats calculation ability, the author forgot to delete the
> existing one.
> 
> Currently, the value of `enabled_ns` is incremented twice by the end of
> the job, when it should be added just once. Therefore, delete the
> leftovers from commit 509433d8146c ("drm/v3d: Expose the total GPU usage
> stats on sysfs").
> 
> Fixes: 509433d8146c ("drm/v3d: Expose the total GPU usage stats on sysfs")
> Reported-by: Tvrtko Ursulin <tursulin@igalia.com>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_irq.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
> index 2e04f6cb661e..ce6b2fb341d1 100644
> --- a/drivers/gpu/drm/v3d/v3d_irq.c
> +++ b/drivers/gpu/drm/v3d/v3d_irq.c
> @@ -105,7 +105,6 @@ v3d_irq(int irq, void *arg)
>   		struct v3d_file_priv *file = v3d->bin_job->base.file->driver_priv;
>   		u64 runtime = local_clock() - file->start_ns[V3D_BIN];
>   
> -		file->enabled_ns[V3D_BIN] += local_clock() - file->start_ns[V3D_BIN];
>   		file->jobs_sent[V3D_BIN]++;
>   		v3d->queue[V3D_BIN].jobs_sent++;
>   
> @@ -126,7 +125,6 @@ v3d_irq(int irq, void *arg)
>   		struct v3d_file_priv *file = v3d->render_job->base.file->driver_priv;
>   		u64 runtime = local_clock() - file->start_ns[V3D_RENDER];
>   
> -		file->enabled_ns[V3D_RENDER] += local_clock() - file->start_ns[V3D_RENDER];
>   		file->jobs_sent[V3D_RENDER]++;
>   		v3d->queue[V3D_RENDER].jobs_sent++;
>   
> @@ -147,7 +145,6 @@ v3d_irq(int irq, void *arg)
>   		struct v3d_file_priv *file = v3d->csd_job->base.file->driver_priv;
>   		u64 runtime = local_clock() - file->start_ns[V3D_CSD];
>   
> -		file->enabled_ns[V3D_CSD] += local_clock() - file->start_ns[V3D_CSD];
>   		file->jobs_sent[V3D_CSD]++;
>   		v3d->queue[V3D_CSD].jobs_sent++;
>   
> @@ -195,7 +192,6 @@ v3d_hub_irq(int irq, void *arg)
>   		struct v3d_file_priv *file = v3d->tfu_job->base.file->driver_priv;
>   		u64 runtime = local_clock() - file->start_ns[V3D_TFU];
>   
> -		file->enabled_ns[V3D_TFU] += local_clock() - file->start_ns[V3D_TFU];
>   		file->jobs_sent[V3D_TFU]++;
>   		v3d->queue[V3D_TFU].jobs_sent++;
>   

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko
