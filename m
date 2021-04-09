Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 843C5359685
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 09:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F2E6E40A;
	Fri,  9 Apr 2021 07:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C896E40A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 07:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 1766B3F6F3;
 Fri,  9 Apr 2021 09:38:30 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=TIoZBQyX; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LpMqIgM0BrTv; Fri,  9 Apr 2021 09:38:29 +0200 (CEST)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 8920A3F6DE;
 Fri,  9 Apr 2021 09:38:27 +0200 (CEST)
Received: from [192.168.0.209] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id C9AE9361DE7;
 Fri,  9 Apr 2021 09:38:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1617953912; bh=HQEuCI1YQd5nYxr+FryMpnmml6Et60VTVFrUw3S1Cl4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TIoZBQyXh0J6la5RxoEIW6krv0r0lF4OGJDhk/x5jrSNsgztPSo2VO7flxwBWrj4o
 JJaXgWaJ51jChDwmTPykhGNY4qz7fDi3E6VUGdNbFJXhxfqkjnr+a9kyzrOL+1cmOT
 7NmnEKrlVRxDDjFjvzb9/s889R1TqBnvCvxxNCz0=
Subject: Re: [PATCH 2/2] drm/vmwgfx: Make sure unpinning handles reservations
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20210408172245.673785-1-zackr@vmware.com>
 <20210408172245.673785-2-zackr@vmware.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <23071cd3-8133-c1d6-68f9-e423a08dd913@shipmail.org>
Date: Fri, 9 Apr 2021 09:38:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210408172245.673785-2-zackr@vmware.com>
Content-Language: en-US
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Zack,

On 4/8/21 7:22 PM, Zack Rusin wrote:
> Quite often it's a little hard to tell if reservations are already held
> in code paths that unpin bo's. While our pinning/unpinning code should
> be more explicit that requires a substential amount of work so instead
> we can avoid the issues by making sure we try to reserve before unpinning.
> Because we unpin those bo's only on destruction/error paths just that check
> tells us if we're already reserved or not and allows to cleanly unpin.
>
> Reviewed-by: Martin Krastev <krastevm@vmware.com>
> Reviewed-by: Roland Scheidegger <sroland@vmware.com>
> Fixes: d1a73c641afd ("drm/vmwgfx: Make sure we unpin no longer needed buffers")
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 17 ++++++++++++++++-
>   drivers/gpu/drm/vmwgfx/vmwgfx_mob.c |  8 ++++----
>   2 files changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 8087a9013455..03bef9c17e56 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -1517,6 +1517,21 @@ static inline struct vmw_surface *vmw_surface_reference(struct vmw_surface *srf)
>   	return srf;
>   }
>   
> +/*
> + * vmw_bo_unpin_safe - currently pinning requires a reservation to be held
> + * but sometimes it's hard to tell if we're in a callback whose parent
> + * is already holding a reservation, to avoid deadloacks we have to try
> + * to get a reservation explicitly to also try to avoid messing up the
> + * internal ttm lru bo list
> + */
> +static inline void vmw_bo_unpin_safe(struct ttm_buffer_object *bo)
> +{
> +	bool locked = dma_resv_trylock(bo->base.resv);

Isn't there a chance another thread is holding the lock and releasing it 
at this position?

> +	ttm_bo_unpin(bo);
> +	if (locked)
> +		dma_resv_unlock(bo->base.resv);
> +}
> +
>   static inline void vmw_bo_unreference(struct vmw_buffer_object **buf)
>   {
>   	struct vmw_buffer_object *tmp_buf = *buf;
> @@ -1524,7 +1539,7 @@ static inline void vmw_bo_unreference(struct vmw_buffer_object **buf)
>   	*buf = NULL;
>   	if (tmp_buf != NULL) {
>   		if (tmp_buf->base.pin_count > 0)
> -			ttm_bo_unpin(&tmp_buf->base);
> +			vmw_bo_unpin_safe(&tmp_buf->base);
Hmm. If execbuf is referencing a buffer that someone else has pinned, 
wouldn't execbuf incorrectly unpin that buffer when calling unreference? 
Would it perhaps be possible to if needed, use the TTM release_notify 
callback to unpin any leaking pins similar to what's done in 
ttm_bo_release? Although that I guess goes somewhat against that 
recently added WARN_ON_ONCE.
>   		ttm_bo_put(&tmp_buf->base);
>   	}
>   }
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> index a0b53141dded..23ffeb2dd6e0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> @@ -277,7 +277,7 @@ static int vmw_otable_batch_setup(struct vmw_private *dev_priv,
>   						 &batch->otables[i]);
>   	}
>   
> -	ttm_bo_unpin(batch->otable_bo);
> +	vmw_bo_unpin_safe(batch->otable_bo);
Could it be we're the only user here? If so safe to reserve and unpin.
>   	ttm_bo_put(batch->otable_bo);
>   	batch->otable_bo = NULL;
>   	return ret;
> @@ -343,7 +343,7 @@ static void vmw_otable_batch_takedown(struct vmw_private *dev_priv,
>   	vmw_bo_fence_single(bo, NULL);
>   	ttm_bo_unreserve(bo);
>   
> -	ttm_bo_unpin(batch->otable_bo);
> +	vmw_bo_unpin_safe(batch->otable_bo);
Would it be possible to just move ttm_bo_unpin() above the 
ttm_bo_unreserve() above?
>   	ttm_bo_put(batch->otable_bo);
>   	batch->otable_bo = NULL;
>   }
> @@ -530,7 +530,7 @@ static void vmw_mob_pt_setup(struct vmw_mob *mob,
>   void vmw_mob_destroy(struct vmw_mob *mob)
>   {
>   	if (mob->pt_bo) {
> -		ttm_bo_unpin(mob->pt_bo);
> +		vmw_bo_unpin_safe(mob->pt_bo);
>   		ttm_bo_put(mob->pt_bo);
>   		mob->pt_bo = NULL;
>   	}
> @@ -646,7 +646,7 @@ int vmw_mob_bind(struct vmw_private *dev_priv,
>   out_no_cmd_space:
>   	vmw_fifo_resource_dec(dev_priv);
>   	if (pt_set_up) {
> -		ttm_bo_unpin(mob->pt_bo);
> +		vmw_bo_unpin_safe(mob->pt_bo);
Perhaps the same here?
>   		ttm_bo_put(mob->pt_bo);
>   		mob->pt_bo = NULL;
>   	}

/Thomas


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
