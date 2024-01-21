Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD72F835514
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 11:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220CD10E1A3;
	Sun, 21 Jan 2024 10:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 317 seconds by postgrey-1.36 at gabe;
 Sun, 21 Jan 2024 10:01:45 UTC
Received: from mail115-118.sinamail.sina.com.cn
 (mail115-118.sinamail.sina.com.cn [218.30.115.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C2E10E1A3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jan 2024 10:01:45 +0000 (UTC)
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([116.24.10.125])
 by sina.com (172.16.235.25) with ESMTP
 id 65ACEA3E000015B6; Sun, 21 Jan 2024 17:56:17 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=hdanton@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 81253134210153
X-SMAIL-UIID: C909EB5828EA4A11A97D102167E10E39-20240121-175617-1
From: Hillf Danton <hdanton@sina.com>
To: Erico Nunes <nunes.erico@gmail.com>
Subject: Re: [PATCH v1 4/6] drm/lima: handle spurious timeouts due to high irq
 latency
Date: Sun, 21 Jan 2024 17:56:04 +0800
Message-Id: <20240121095604.2368-1-hdanton@sina.com>
In-Reply-To: <20240117031212.1104034-5-nunes.erico@gmail.com>
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
MIME-Version: 1.0
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
Cc: lima@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 Jan 2024 04:12:10 +0100 Erico Nunes <nunes.erico@gmail.com>
>  
> @@ -401,9 +399,33 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
>  	struct lima_sched_pipe *pipe = to_lima_pipe(job->sched);
>  	struct lima_sched_task *task = to_lima_task(job);
>  	struct lima_device *ldev = pipe->ldev;
> +	struct lima_ip *ip = pipe->processor[0];
> +
> +	/*
> +	 * If the GPU managed to complete this jobs fence, the timeout is
> +	 * spurious. Bail out.
> +	 */
> +	if (dma_fence_is_signaled(task->done_fence)) {
> +		DRM_WARN("%s spurious timeout\n", lima_ip_name(ip));
> +		return DRM_GPU_SCHED_STAT_NOMINAL;
> +	}

Given 500ms in lima_sched_pipe_init(), no timeout is spurious by define,
and stop selling bandaid like this because you have options like locating
the reasons behind timeout.
> +
> +	/*
> +	 * Lima IRQ handler may take a long time to process an interrupt
> +	 * if there is another IRQ handler hogging the processing.
> +	 * In order to catch such cases and not report spurious Lima job
> +	 * timeouts, synchronize the IRQ handler and re-check the fence
> +	 * status.
> +	 */
> +	synchronize_irq(ip->irq);
> +
> +	if (dma_fence_is_signaled(task->done_fence)) {
> +		DRM_WARN("%s unexpectedly high interrupt latency\n", lima_ip_name(ip));
> +		return DRM_GPU_SCHED_STAT_NOMINAL;
> +	}
>  
>  	if (!pipe->error)
> -		DRM_ERROR("lima job timeout\n");
> +		DRM_ERROR("%s lima job timeout\n", lima_ip_name(ip));
>  
>  	drm_sched_stop(&pipe->base, &task->base);
>  
