Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED848A4DDC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 13:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840A810F78F;
	Mon, 15 Apr 2024 11:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="IP9BSt4+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F2010F78F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 11:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ExbjZLASxyiy2IoL1i4ktyhUxlvzLOWsy2GGw6IMheE=; b=IP9BSt4+DbCeslFeHGa9aCBhLB
 OHw2aIWXcn4Mks4pMzmx+56pESenE9YAk1Or7SX9SnocyUPnM1ix1eRikByCi1JWiC3uun8N5wDgX
 AqV02yCKACQ3lX6AKSETxrjyJ2HhuHlEb6beknUj90uyYpeOeYovFQNmmwfPMcutMDzNx1RyY0T1c
 qL5x60UGL0x46xKgb14W60aQaYUUTlSqvzWz2uBeymX8K7Ylq9XqIqidJ3hfV051F1xa85sOWxNHB
 NYgBsu6iRY9OVFE9T1vXn2VGZt5aFAOvvZkHGsViLS+oe9LrXdoPW5lDyxTYPlurZNWd51M73yNh7
 D2oZVQoA==;
Received: from 3.32.60.213.dynamic.reverse-mundo-r.com ([213.60.32.3]
 helo=[192.168.50.63]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rwKfj-004k9l-P5; Mon, 15 Apr 2024 13:38:51 +0200
Message-ID: <b3222af7-68b0-45a1-b1ba-ab9066c169f8@igalia.com>
Date: Mon, 15 Apr 2024 13:38:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/v3d: Create function to update a set of GPU stats
Content-Language: en-US
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240403203517.731876-1-mcanal@igalia.com>
 <20240403203517.731876-5-mcanal@igalia.com>
From: Chema Casanova <jmcasanova@igalia.com>
Organization: Igalia
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

El 3/4/24 a las 22:24, Maíra Canal escribió:
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
I understand that with this change, we would be calling twice local_clock()
for each stat update, once for local and one for global stats. I don't know
the performance impact of the extra local_clock(), but I understand as 
you are
always updating global_stats after local_stats we would be losing the
correspondence that global_stats is the sum of all local_stats for all 
process.
With this approach, it will be always greater or equal.

Maybe it makes sense to pass an extra parameter now so save one
local_clock() and the sum of global and local stats is the same when you 
only
have one process running.


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
