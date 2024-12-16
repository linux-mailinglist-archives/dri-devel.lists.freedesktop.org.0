Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCFA9F3B1B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 21:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BCC10E7AD;
	Mon, 16 Dec 2024 20:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pA550qHy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4979E10E7AD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 20:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w4/G+LUk/Q10VBOB+/NhKxlJaYzWB6mwHqUVcFj1dvY=; b=pA550qHyLLq/7GiFtYBW8BBGvq
 a30TIKyQyDuUnMSpGjZntyWJtmKVzdzbNPWyBiKzBtVdj0brGdcwqfDh5Y/8HRHjQvrWfhedC1TVN
 06X0n9b1Jw7sthgp73Ym2n7hUKTdLoFcgGJTozA+P3sZCRk7ksWhU/PzkV/qf9ak7Pgq6K5/5iEWA
 mIv8fimYPdV80XurpkFVadPc07ZSJil6jzfYovqODV3MQs1DFGnsUnTnlhqGiJy8w7ur68oiVeL/K
 QkIppyBuH7/ZBMmL7oPu/pIWagWOTqvE6wxSO5jjxmdDd/wiQLug2+5aeWi6YWg4WcQjtcneF6N02
 BYs3J4/Q==;
Received: from [179.214.71.67] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tNHvF-003wi2-D6; Mon, 16 Dec 2024 21:42:33 +0100
Date: Mon, 16 Dec 2024 17:42:26 -0300
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v2 4/4] drm/vc4: Remove `vc4_queue_seqno_cb()`
Message-ID: <vhdmw6jq7afuxwcfnxy3heue5u5m3tyoyqu2kb7q53bruos5gy@gb3p5o5n7ixu>
References: <20241212202337.381614-1-mcanal@igalia.com>
 <20241212202337.381614-5-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241212202337.381614-5-mcanal@igalia.com>
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

On 12/12, Maíra Canal wrote:
> The function `vc4_queue_seqno_cb()` is no longer needed, as we are
> using DMA Reservation Objects to track BOs. Using DMA Resv, we can use
> `dma_fence_add_callback()` to perform the async page flip.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/vc4/vc4_drv.h |  3 ---
>  drivers/gpu/drm/vc4/vc4_gem.c | 32 --------------------------------
>  2 files changed, 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index ff8048991030..7e23363d008f 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -1022,9 +1022,6 @@ void vc4_move_job_to_render(struct drm_device *dev, struct vc4_exec_info *exec);
>  int vc4_wait_for_seqno(struct drm_device *dev, uint64_t seqno,
>  		       uint64_t timeout_ns, bool interruptible);
>  void vc4_job_handle_completed(struct vc4_dev *vc4);
> -int vc4_queue_seqno_cb(struct drm_device *dev,
> -		       struct vc4_seqno_cb *cb, uint64_t seqno,
> -		       void (*func)(struct vc4_seqno_cb *cb));
>  int vc4_gem_madvise_ioctl(struct drm_device *dev, void *data,
>  			  struct drm_file *file_priv);
>  
> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> index 1cbd95c4f9ef..c1cc942a26ae 100644
> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> @@ -922,38 +922,6 @@ vc4_job_handle_completed(struct vc4_dev *vc4)
>  	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
>  }
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
> -	}
> -	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
> -
> -	return 0;
> -}
> -

I think squashing this patch with the previous one is more consistent,
since the last and only usage of vc4_queue_seqno_cb() is removed there.

Melissa

>  /* Scheduled when any job has been completed, this walks the list of
>   * jobs that had completed and unrefs their BOs and frees their exec
>   * structs.
> -- 
> 2.47.1
> 
