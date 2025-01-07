Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F66FA04562
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 17:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0781710E728;
	Tue,  7 Jan 2025 16:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lIJzqc96";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7548210E719;
 Tue,  7 Jan 2025 16:02:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 230FFA418A3;
 Tue,  7 Jan 2025 16:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDB6C4CEDE;
 Tue,  7 Jan 2025 16:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736265729;
 bh=LtQLZTgegXJjeN7LKmzZB8Z9V7vdz01Osf6H4CQUUD4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lIJzqc963riTqysHsY6Ulo3BBaGQK0VFL+NjCkPhsFlsTpXWHTwO9sfN16oJ8nGJG
 IOzlvYr8epsHlyU25KEtAEzZJ2NTGWcG7gDKVAvVu8e9m/ZsTqnaLpan+uU+ev5+w7
 1xrXMhFV5PLFMnFBV34WyO72kPuXgFDKfoh2RhLuWhYNdgZIRUThM5cHysgkcgveI3
 3UnLbuZvP81je3LfcxdGRHB0puSoEIuEywkEfmQGE+Lcgfg54Q5ynUJDNrXzrRiRSG
 YMzD91oouhbdcJ+EOAiExwr8ArXXJF44JBZYnxYMGjL7epmxXLCZhDTm4YqBcBkiv7
 D2v7WviKZJpCQ==
Date: Tue, 7 Jan 2025 17:02:05 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH] nouveau/fence: handle cross device fences properly.
Message-ID: <Z31P_Wp4qMzIlv88@pollux>
References: <20250107055846.536589-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107055846.536589-1-airlied@gmail.com>
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

On Tue, Jan 07, 2025 at 03:58:46PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> If we have two nouveau controlled devices and one passes a dma-fence
> to the other, when we hit the sync path it can cause the second device
> to try and put a sync wait in it's pushbuf for the seqno of the context
> on the first device.
> 
> Since fence contexts are vmm bound, check the if vmm's match between
> both users, this should ensure that fence seqnos don't get used wrongly
> on incorrect channels.

The fence sequence number is global, i.e. per device, hence checking the vmm
context seems too restrictive.

Wouldn't it be better to ensure that `prev->cli->drm == chan->cli->drm`?

This way we can still optimize where dependencies are between different
applications, but on the same device.

> 
> This seems to happen fairly spuriously and I found it tracking down
> a multi-card regression report, that seems to work by luck before this.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index ee5e9d40c166f..5743c82f4094b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -370,7 +370,8 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
>  
>  				rcu_read_lock();
>  				prev = rcu_dereference(f->channel);
> -				if (prev && (prev == chan ||
> +				if (prev && (prev->vmm == chan->vmm) &&
> +				    (prev == chan ||

Maybe better break it down a bit, e.g.

bool local = prev && (prev->... == chan->...);

if (local && ...) {
...
}

>  					     fctx->sync(f, prev, chan) == 0))
>  					must_wait = false;
>  				rcu_read_unlock();
> -- 
> 2.43.0
> 
