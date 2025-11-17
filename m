Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240EDC64EEE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 16:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6819710E3D8;
	Mon, 17 Nov 2025 15:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qXt7838b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C32F10E3D8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 15:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763394302;
 bh=lbFlnTpGGNMackA254ZBSjhjUD4CP/UFMLbO/PR3Sko=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qXt7838bh2yDX8canwzxujLVy9TX6WlKRrGFVcr5aQDMDK26mjZ0tDBmin8uSp5fR
 nw/ve6i/EPVtzKx2QlU2Dx74YRuXEy2vNHP9tpbqr4dYtK/emA1BPibTf9VncOeHGX
 9kqKKtFjMvq3GqZQeLPkF1FrQslBg0fBBF3zql18o9w9R5ijpKpTeQjTMTGYrriuFJ
 NMkLMYW07M+d/yquFzv+AVuEgi/3+kkCXifSTFgAmsoktO3wVXvw/0jTizsqG1mT6M
 TKqwubPxC3nXzWupMlZzGBYV65stzY8tmHCs9pNRmtAlgNHsY9iy+mRpUCW2SleJ8O
 dQMrfy4G6Ajeg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A7A417E0097;
 Mon, 17 Nov 2025 16:45:01 +0100 (CET)
Date: Mon, 17 Nov 2025 16:44:55 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org, Akash Goel
 <akash.goel@arm.com>, Karunika Choo <karunika.choo@arm.com>,
 kernel@collabora.com
Subject: Re: [PATCH v2 3/6] drm/panthor: Recover from
 panthor_gpu_flush_caches() failures
Message-ID: <20251117164455.09f41dcc@fedora>
In-Reply-To: <e6fbbfa1-789f-46bf-9591-b19ff954b69a@arm.com>
References: <20251113103953.1519935-1-boris.brezillon@collabora.com>
 <20251113103953.1519935-4-boris.brezillon@collabora.com>
 <e6fbbfa1-789f-46bf-9591-b19ff954b69a@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 17 Nov 2025 14:02:35 +0000
Steven Price <steven.price@arm.com> wrote:

> On 13/11/2025 10:39, Boris Brezillon wrote:
> > We have seen a few cases where the whole memory subsystem is blocked
> > and flush operations never complete. When that happens, we want to:
> > 
> > - schedule a reset, so we can recover from this situation
> > - in the reset path, we need to reset the pending_reqs so we can send
> >   new commands after the reset
> > - if more panthor_gpu_flush_caches() operations are queued after
> >   the timeout, we skip them and return -EIO directly to avoid needless
> >   waits (the memory block won't miraculously work again)  
> 
> You've removed the WARN from this last case. Is this intentional? I
> agree the recovery is better, but I don't think we expect this to happen
> - so it's pointing to something else being broken.

I did because there's a way for the UMD to trigger that (see the link
to the bug in the cover letter) without any mitigation we can put in
place kernel side, other than the GPU reset I'm adding here.I
tend to use WARN_ON()s only for things the kernel code has control on,
not stuff users can force the kernel driver into. Note that I kept the
drm_err(), so we still have a trace of such errors in the logs (along
with some timeouts).

> 
> > 
> > v2:
> > - New patch
> > 
> > Fixes: 5cd894e258c4 ("drm/panthor: Add the GPU logical block")
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_gpu.c | 19 ++++++++++++-------
> >  1 file changed, 12 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> > index eda670229184..abd2fde04da9 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> > @@ -283,38 +283,42 @@ int panthor_gpu_l2_power_on(struct panthor_device *ptdev)
> >  int panthor_gpu_flush_caches(struct panthor_device *ptdev,
> >  			     u32 l2, u32 lsc, u32 other)
> >  {
> > -	bool timedout = false;
> >  	unsigned long flags;
> > +	int ret = 0;
> >  
> >  	/* Serialize cache flush operations. */
> >  	guard(mutex)(&ptdev->gpu->cache_flush_lock);
> >  
> >  	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
> > -	if (!drm_WARN_ON(&ptdev->base,
> > -			 ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED)) {
> > +	if (!(ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED)) {
> >  		ptdev->gpu->pending_reqs |= GPU_IRQ_CLEAN_CACHES_COMPLETED;
> >  		gpu_write(ptdev, GPU_CMD, GPU_FLUSH_CACHES(l2, lsc, other));
> > +	} else {
> > +		ret = -EIO;
> >  	}
> >  	spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
> >  
> > +	if (ret)
> > +		return ret;
> > +
> >  	if (!wait_event_timeout(ptdev->gpu->reqs_acked,
> >  				!(ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED),
> >  				msecs_to_jiffies(100))) {
> >  		spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
> >  		if ((ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED) != 0 &&
> >  		    !(gpu_read(ptdev, GPU_INT_RAWSTAT) & GPU_IRQ_CLEAN_CACHES_COMPLETED))
> > -			timedout = true;
> > +			ret = -ETIMEDOUT;
> >  		else
> >  			ptdev->gpu->pending_reqs &= ~GPU_IRQ_CLEAN_CACHES_COMPLETED;
> >  		spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
> >  	}
> >  
> > -	if (timedout) {
> > +	if (ret) {
> > +		panthor_device_schedule_reset(ptdev);
> >  		drm_err(&ptdev->base, "Flush caches timeout");
> > -		return -ETIMEDOUT;
> >  	}
> >  
> > -	return 0;
> > +	return ret;
> >  }
> >  
> >  /**
> > @@ -354,6 +358,7 @@ int panthor_gpu_soft_reset(struct panthor_device *ptdev)
> >  		return -ETIMEDOUT;
> >  	}
> >  
> > +	ptdev->gpu->pending_reqs = 0;
> >  	return 0;
> >  }
> >    
> 

