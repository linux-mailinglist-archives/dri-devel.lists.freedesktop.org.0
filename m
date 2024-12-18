Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C309F604C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 09:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B6310E23A;
	Wed, 18 Dec 2024 08:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RC+gQQdP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B5210E23A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 08:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=utBcyh0ybG470Cy3PlyGlhqhK6rZKz69G+aIr9S9RRM=; b=RC+gQQdPhjdUwil8kNkKtngtvv
 5eaZo26k/vqWrwzHND62uiUQN12TBYVtKmf3N3MR0Qf3OBcL51zWSYd0OXEB/zG4erbUh1RP4ND0V
 rsphRQ2qvQ0tT/BzAPVF/hkKl3Bo4nZ1pgN8iS5mrd4eSJUQ2SxiNYaNxWstopKdS4JBV57sS9XSg
 fzuUoZdF4oQviAmrgjvax3kZg7J4YqA8ncUcJHY24YnWxt7LI22MmvV5T7AF8v+ak/Ny3AYIiRIi4
 e/qzWUYoA+OPWkCMBI09BCzJOBjoBl7x6++iXU7RZTFTtxSnz0Kj9onQ3lXiCT7Rj+nsXaI8JvcUK
 2TcsEoxA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tNpb1-004iP9-GD; Wed, 18 Dec 2024 09:39:55 +0100
Message-ID: <53fecf40-3e02-4c45-9840-6b337c30e5f1@igalia.com>
Date: Wed, 18 Dec 2024 08:39:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/vc4: Remove `vc4_queue_seqno_cb()`
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241212202337.381614-1-mcanal@igalia.com>
 <20241212202337.381614-5-mcanal@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20241212202337.381614-5-mcanal@igalia.com>
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


On 12/12/2024 20:20, Maíra Canal wrote:
> The function `vc4_queue_seqno_cb()` is no longer needed, as we are
> using DMA Reservation Objects to track BOs. Using DMA Resv, we can use
> `dma_fence_add_callback()` to perform the async page flip.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/vc4/vc4_drv.h |  3 ---
>   drivers/gpu/drm/vc4/vc4_gem.c | 32 --------------------------------
>   2 files changed, 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index ff8048991030..7e23363d008f 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -1022,9 +1022,6 @@ void vc4_move_job_to_render(struct drm_device *dev, struct vc4_exec_info *exec);
>   int vc4_wait_for_seqno(struct drm_device *dev, uint64_t seqno,
>   		       uint64_t timeout_ns, bool interruptible);
>   void vc4_job_handle_completed(struct vc4_dev *vc4);
> -int vc4_queue_seqno_cb(struct drm_device *dev,
> -		       struct vc4_seqno_cb *cb, uint64_t seqno,
> -		       void (*func)(struct vc4_seqno_cb *cb));
>   int vc4_gem_madvise_ioctl(struct drm_device *dev, void *data,
>   			  struct drm_file *file_priv);
>   
> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> index 1cbd95c4f9ef..c1cc942a26ae 100644
> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> @@ -922,38 +922,6 @@ vc4_job_handle_completed(struct vc4_dev *vc4)
>   	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
>   }
>   
> -static void vc4_seqno_cb_work(struct work_struct *work)
> -{
> -	struct vc4_seqno_cb *cb = container_of(work, struct vc4_seqno_cb, work);
> -
> -	cb->func(cb);
> -}
> -
> -int vc4_queue_seqno_cb(struct drm_device *dev,
> -		       struct vc4_seqno_cb *cb, uint64_t seqno,
> -		       void (*func)(struct vc4_seqno_cb *cb))
> -{
> -	struct vc4_dev *vc4 = to_vc4_dev(dev);
> -	unsigned long irqflags;
> -
> -	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
> -		return -ENODEV;
> -
> -	cb->func = func;
> -	INIT_WORK(&cb->work, vc4_seqno_cb_work);
> -
> -	spin_lock_irqsave(&vc4->job_lock, irqflags);
> -	if (seqno > vc4->finished_seqno) {
> -		cb->seqno = seqno;
> -		list_add_tail(&cb->work.entry, &vc4->seqno_cb_list);
> -	} else {
> -		schedule_work(&cb->work);

I haven't done a full read through yet but just strikes me on a casual 
browse, that if the rest of the series is correct, then it looks 
seqno_cb_list and the whole struct vc4_seqno_cb be removed as well.

Regards,

Tvrtko

> -	}
> -	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
> -
> -	return 0;
> -}
> -
>   /* Scheduled when any job has been completed, this walks the list of
>    * jobs that had completed and unrefs their BOs and frees their exec
>    * structs.
