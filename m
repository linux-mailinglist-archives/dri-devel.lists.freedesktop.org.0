Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFA18A4D0B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 12:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25F9112466;
	Mon, 15 Apr 2024 10:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rVwrwVNK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B803112466
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 10:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qK/hXp8y5uUCD1Y7wk40Bt5z+SaxN8XaYTDYMEhBRJo=; b=rVwrwVNKLT94cxs+OsoYMPajR7
 t1e6JdHGNG6vLYiJFsFJ91sxKHdzW3P4/AP7gNimAtRg8gG77eLS0oXaIx3HgvTcPIn5802FnzcsQ
 nUW5UFyHPX+rNv5HKPGv1C5rzdZJ6m5/2up40GSu71SXPCVz4exeD/C32PeSXs9sBKrM2syHzQxOA
 PyuYLs/ZvyzMVrp97R27JoG//7QNY/NvFqOYSvOjB9HU8egtM9JxTp/jQHfzr70VOpHATxOslaWDx
 kxoTUBXsQ47/LMEXWPowlaBCV6YHOi5+9pUoPNkCV3RJwBcA4ZDQTiLMjWtoqL4XOA0Ln554l7cUc
 snfPQYfQ==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rwK0H-004jPL-UT; Mon, 15 Apr 2024 12:56:01 +0200
Message-ID: <5f6ed8c2-4914-4053-a905-851554948f28@igalia.com>
Date: Mon, 15 Apr 2024 11:56:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/v3d: Create function to update a set of GPU stats
Content-Language: en-GB
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Chema Casanova <jmcasanova@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240403203517.731876-1-mcanal@igalia.com>
 <20240403203517.731876-5-mcanal@igalia.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240403203517.731876-5-mcanal@igalia.com>
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
> Given a set of GPU stats, that is, a `struct v3d_stats` related to a
> queue in a given context, create a function that can update all this set of
> GPU stats.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_sched.c | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index ea5f5a84b55b..754107b80f67 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -118,6 +118,16 @@ v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
>   	global_stats->start_ns = now;
>   }
>   
> +static void
> +v3d_stats_update(struct v3d_stats *stats)
> +{
> +	u64 now = local_clock();
> +
> +	stats->enabled_ns += now - stats->start_ns;
> +	stats->jobs_sent++;
> +	stats->start_ns = 0;
> +}
> +
>   void
>   v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue)
>   {
> @@ -125,15 +135,9 @@ v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue)
>   	struct v3d_file_priv *file = job->file->driver_priv;
>   	struct v3d_stats *global_stats = &v3d->queue[queue].stats;
>   	struct v3d_stats *local_stats = &file->stats[queue];
> -	u64 now = local_clock();
> -
> -	local_stats->enabled_ns += now - local_stats->start_ns;
> -	local_stats->jobs_sent++;
> -	local_stats->start_ns = 0;
>   
> -	global_stats->enabled_ns += now - global_stats->start_ns;
> -	global_stats->jobs_sent++;
> -	global_stats->start_ns = 0;
> +	v3d_stats_update(local_stats);
> +	v3d_stats_update(global_stats);
>   }
>   
>   static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko
