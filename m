Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D61CB34C0A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 22:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78D110E559;
	Mon, 25 Aug 2025 20:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MuG03+0H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E01210E559
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 20:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2stuNP9MwoGaSbeyOrwjajxivkLST94vZ4aHoGkBj2k=; b=MuG03+0Hiz9d1KsELUXFXId0FE
 rHUal/ArnUREEEENEi9ke0V6P3zNBBfofq4m4xpVP8b0vMpDsq56mMVctPPJFXRHu9ELI0plrdg/l
 YxdDSO67SJkiL6um1H64FsaiayXoW6Oxw3GBBnBmyu096LdxPke6KcIGUI4t4GxxstSkqbrgSvo06
 n+W3ZgB8cXYesZ76Z6WsIJ2/99pG4aQx93BCChMhMWm8UJeqfzFJ/17MYC9bS+W0cDsmHreaehS7k
 qNqFSVwmJ7rkI9pk4RXSpqIcIMJ3YTHZBGy2tvBoTmEbemtg3CbjZAT7bq1OkCa1swU01HHtU6pVi
 WcYjPmRg==;
Received: from [189.6.13.79] (helo=[192.168.31.42])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uqdrC-001a1t-U6; Mon, 25 Aug 2025 22:31:59 +0200
Message-ID: <512f5510-a86d-47cb-a92d-d6206906e52c@igalia.com>
Date: Mon, 25 Aug 2025 17:31:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] drm/v3d: Synchronous operations can't timeout
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
References: <20250815-v3d-queue-lock-v2-0-ce37258ffb53@igalia.com>
 <20250815-v3d-queue-lock-v2-5-ce37258ffb53@igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20250815-v3d-queue-lock-v2-5-ce37258ffb53@igalia.com>
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



On 15/08/2025 16:58, Maíra Canal wrote:
> CPU jobs and CACHE CLEAN jobs execute synchronously once the DRM
> scheduler starts running them. Therefore, there is no fence to wait on,
> neither are those jobs able to timeout.
>
> Hence, remove the `timedout_job` hook from the CPU and CACHE CLEAN
> scheduler ops.
Makes sense.

Reviewed-by: Melissa Wen <mwen@igalia.com>
>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_sched.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 60e251367f42170b30de968682deb6370604db44..d2045d0db12e63bc67bac6a47cabcf746189ea88 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -701,6 +701,7 @@ v3d_cpu_job_run(struct drm_sched_job *sched_job)
>   	trace_v3d_cpu_job_end(&v3d->drm, job->job_type);
>   	v3d_job_update_stats(&job->base, V3D_CPU);
>   
> +	/* Synchronous operation, so no fence to wait on. */
>   	return NULL;
>   }
>   
> @@ -716,6 +717,7 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched_job)
>   
>   	v3d_job_update_stats(job, V3D_CACHE_CLEAN);
>   
> +	/* Synchronous operation, so no fence to wait on. */
>   	return NULL;
>   }
>   
> @@ -797,7 +799,7 @@ v3d_render_job_timedout(struct drm_sched_job *sched_job)
>   }
>   
>   static enum drm_gpu_sched_stat
> -v3d_generic_job_timedout(struct drm_sched_job *sched_job)
> +v3d_tfu_job_timedout(struct drm_sched_job *sched_job)
>   {
>   	struct v3d_job *job = to_v3d_job(sched_job);
>   
> @@ -837,7 +839,7 @@ static const struct drm_sched_backend_ops v3d_render_sched_ops = {
>   
>   static const struct drm_sched_backend_ops v3d_tfu_sched_ops = {
>   	.run_job = v3d_tfu_job_run,
> -	.timedout_job = v3d_generic_job_timedout,
> +	.timedout_job = v3d_tfu_job_timedout,
>   	.free_job = v3d_sched_job_free,
>   };
>   
> @@ -849,13 +851,11 @@ static const struct drm_sched_backend_ops v3d_csd_sched_ops = {
>   
>   static const struct drm_sched_backend_ops v3d_cache_clean_sched_ops = {
>   	.run_job = v3d_cache_clean_job_run,
> -	.timedout_job = v3d_generic_job_timedout,
>   	.free_job = v3d_sched_job_free
>   };
>   
>   static const struct drm_sched_backend_ops v3d_cpu_sched_ops = {
>   	.run_job = v3d_cpu_job_run,
> -	.timedout_job = v3d_generic_job_timedout,
>   	.free_job = v3d_cpu_job_free
>   };
>   
>

