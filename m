Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B98E994F18F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 17:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4840B10E254;
	Mon, 12 Aug 2024 15:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fPs0LdW0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D96C10E14A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 15:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W2tXrpivxXwyGj62CCSvbqkyUobzbnXp5Gf12/d9eXM=; b=fPs0LdW0pgBav7sxhgFjSuR9b2
 m7LGASrNE2P7Zh9BA8HDpu+82OLvLq93LjmrFzfTxKQNfhdND8KogQMdHTgujXaFEmK7jBSdA9O6n
 3LSSOUbbI5t+IWAFzKh1Odxe+XZcfPhFHH3GEnhlAMdK6wNCbFOF+pTNPkKVp9tcgnmeN0tGH+zCw
 7qkEGCzq/lupxSmeCUMnpRMb9hhMGtNiqyVzZrs/Sp39ber8NJFn3XRz/4facNeuc5uYNxymYWHE6
 GN3njGTjQUMko4HRNxPwxcKcmuuDUfCOXjIYhu5wEbgvOfnhJAqCNNnWtypEL8TIyXqRGKfOQeAnN
 E0kh2wWw==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sdWsy-00BYqe-4J; Mon, 12 Aug 2024 17:23:04 +0200
Message-ID: <b57d265e-3e46-4755-91d6-2cac86f48266@igalia.com>
Date: Mon, 12 Aug 2024 12:22:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/v3d: Disable preemption while updating GPU stats
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 stable@vger.kernel.org
References: <20240812091218.70317-1-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240812091218.70317-1-tursulin@igalia.com>
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

Hi Tvrtko,

On 8/12/24 06:12, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> We forgot to disable preemption around the write_seqcount_begin/end() pair
> while updating GPU stats:
> 
>    [ ] WARNING: CPU: 2 PID: 12 at include/linux/seqlock.h:221 __seqprop_assert.isra.0+0x128/0x150 [v3d]
>    [ ] Workqueue: v3d_bin drm_sched_run_job_work [gpu_sched]
>   <...snip...>
>    [ ] Call trace:
>    [ ]  __seqprop_assert.isra.0+0x128/0x150 [v3d]
>    [ ]  v3d_job_start_stats.isra.0+0x90/0x218 [v3d]
>    [ ]  v3d_bin_job_run+0x23c/0x388 [v3d]
>    [ ]  drm_sched_run_job_work+0x520/0x6d0 [gpu_sched]
>    [ ]  process_one_work+0x62c/0xb48
>    [ ]  worker_thread+0x468/0x5b0
>    [ ]  kthread+0x1c4/0x1e0
>    [ ]  ret_from_fork+0x10/0x20
> 
> Fix it.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: 6abe93b621ab ("drm/v3d: Fix race-condition between sysfs/fdinfo and interrupt handler")
> Cc: Maíra Canal <mcanal@igalia.com>
> Cc: <stable@vger.kernel.org> # v6.10+
> ---
>   drivers/gpu/drm/v3d/v3d_sched.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 42d4f4a2dba2..cc2e5a89467b 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -136,6 +136,8 @@ v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
>   	struct v3d_stats *local_stats = &file->stats[queue];
>   	u64 now = local_clock();
>   
> +	preempt_disable();
> +
>   	write_seqcount_begin(&local_stats->lock);
>   	local_stats->start_ns = now;
>   	write_seqcount_end(&local_stats->lock);
> @@ -143,6 +145,8 @@ v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
>   	write_seqcount_begin(&global_stats->lock);
>   	global_stats->start_ns = now;
>   	write_seqcount_end(&global_stats->lock);
> +
> +	preempt_enable();
>   }
>   
>   static void
> @@ -164,8 +168,10 @@ v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue)
>   	struct v3d_stats *local_stats = &file->stats[queue];
>   	u64 now = local_clock();
>   
> +	preempt_disable();
>   	v3d_stats_update(local_stats, now);
>   	v3d_stats_update(global_stats, now);
> +	preempt_enable();

Although `v3d_stats_update()` is only used here, shouldn't we move 
`preempt_disable()` and `preempt_enable()` inside of the
`v3d_stats_update()` function? This way, we can guarantee that any
future uses will disable preemption.

With that, you can add my:

Acked-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

>   }
>   
>   static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
