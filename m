Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CB0A0C161
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 20:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE24710E7C4;
	Mon, 13 Jan 2025 19:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FCD+s/uk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BE910E7C4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 19:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v5QGG5ELBzKwxFyRQ/4Uyp6JcgBWRjI9nTwhQy6LnSY=; b=FCD+s/ukYUwviN2N9D3Pt1RiSv
 PIGpkM2phEQAug+OlU4jKK2BigRcjKuWK96V38b2FSEpdSnbU1O+sjsedxeyuiXKdJ0HTV3O4iSRt
 PIqPdugjE6qnYPrWN3nyL/06lbFLOmGfWzCx+mkgDGJvTMyO2/5l5xR/YHHNPpoQnEcE5eR1+Vs1x
 NE4xVVOuyHMYHO7Zw/SnErkoshba2TSthmlYwcC3wczSp3738pVEJfnEKJpiqGy0EuzEzfYYkfn81
 ZKh2uoxVaAa484KXeJ+kBqsaevL1X6zqsbuHbcpRpeDtXJlXU4uLgqSoUg+cnEeZfV+gRP1wCRaTd
 eEgSwXYA==;
Received: from [213.60.32.3] (helo=[192.168.50.165])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tXQ6I-00FJLC-V9; Mon, 13 Jan 2025 20:27:50 +0100
Message-ID: <841965dc-31a6-4ced-83b2-1e47ea4b52f7@igalia.com>
Date: Mon, 13 Jan 2025 20:27:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/v3d: Remove `v3d->cpu_job`
Content-Language: en-US
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250113154741.67520-1-mcanal@igalia.com>
 <20250113154741.67520-2-mcanal@igalia.com>
From: Chema Casanova <jmcasanova@igalia.com>
Organization: Igalia
In-Reply-To: <20250113154741.67520-2-mcanal@igalia.com>
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

Reviewed-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>

El 13/1/25 a las 16:47, Maíra Canal escribió:
> CPU jobs, like Clean Cache jobs, execute synchronously once the DRM
> scheduler starts running them. Consequently, a global `v3d->cpu_job`
> variable is unnecessary, as everything is managed within the
> `v3d_cpu_job_run()` function.
>
> This commit removes the `v3d->cpu_job` pointer, as it is not needed.
>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_drv.h   | 1 -
>   drivers/gpu/drm/v3d/v3d_sched.c | 2 --
>   2 files changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index dc1cfe2e14be..9deaefa0f95b 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -147,7 +147,6 @@ struct v3d_dev {
>   	struct v3d_render_job *render_job;
>   	struct v3d_tfu_job *tfu_job;
>   	struct v3d_csd_job *csd_job;
> -	struct v3d_cpu_job *cpu_job;
>   
>   	struct v3d_queue_state queue[V3D_MAX_QUEUES];
>   
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index da08ddb01d21..961465128d80 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -656,8 +656,6 @@ v3d_cpu_job_run(struct drm_sched_job *sched_job)
>   	struct v3d_cpu_job *job = to_cpu_job(sched_job);
>   	struct v3d_dev *v3d = job->base.v3d;
>   
> -	v3d->cpu_job = job;
> -
>   	if (job->job_type >= ARRAY_SIZE(cpu_job_function)) {
>   		DRM_DEBUG_DRIVER("Unknown CPU job: %d\n", job->job_type);
>   		return NULL;
