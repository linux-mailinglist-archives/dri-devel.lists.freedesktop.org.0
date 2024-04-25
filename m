Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 599258B1E54
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 11:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14ADD11A327;
	Thu, 25 Apr 2024 09:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="M5dntjgU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8911C11A327
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 09:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714038325;
 bh=qx78XVDlMOemWupiUdwBy/ANocag81xv1WLUs0CEt9A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M5dntjgUzZr3olxKq6uyuMT0VGgj/ukiWao6mVL+FQil4+StrzeXQ3tvp75BrMpvx
 hfTtVyY9m4kuijw8khduCiIgCjj1PDz1EhI1cxBomFiYBVZ6vmd1x+FiQ5BX78AaMk
 gm35SfOSomlVvvxPZ2upSUn66ziwPaUI4m1fFjIMRqUBtEfk8eH1lsg9M1JeDqxsDn
 CjK2GzxqpXkRN+tTRR8Rg1al90dZ+CLRGowFou7y0qlpOUXZw5dElEO7UbDe4XMySs
 CJxEHBBCO+FUwP4tb1H/K/7Lo1l+XBL/bcqh3+7/bad8i/w6ijVJZvYw76jB1idsdf
 bdeF9ZjbdHjfg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9AF8837820FA;
 Thu, 25 Apr 2024 09:45:24 +0000 (UTC)
Date: Thu, 25 Apr 2024 11:45:23 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, Christopher Healy <healych@amazon.com>,
 dri-devel@lists.freedesktop.org, Antonino Maniscalco
 <antonino.maniscalco@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH 1/3] drm/panthor: Fix tiler OOM handling to allow
 incremental rendering
Message-ID: <20240425114523.4e698ea5@collabora.com>
In-Reply-To: <e589cfb0-020b-4468-bc42-3a9d5c7afd51@arm.com>
References: <20240425071837.529039-1-boris.brezillon@collabora.com>
 <20240425071837.529039-2-boris.brezillon@collabora.com>
 <e589cfb0-020b-4468-bc42-3a9d5c7afd51@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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

On Thu, 25 Apr 2024 10:28:49 +0100
Steven Price <steven.price@arm.com> wrote:

> On 25/04/2024 08:18, Boris Brezillon wrote:
> > From: Antonino Maniscalco <antonino.maniscalco@collabora.com>
> > 
> > If the kernel couldn't allocate memory because we reached the maximum
> > number of chunks but no render passes are in flight
> > (panthor_heap_grow() returning -ENOMEM), we should defer the OOM
> > handling to the FW by returning a NULL chunk. The FW will then call
> > the tiler OOM exception handler, which is supposed to implement
> > incremental rendering (execute an intermediate fragment job to flush
> > the pending primitives, release the tiler memory that was used to
> > store those primitives, and start over from where it stopped).
> > 
> > Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> > Signed-off-by: Antonino Maniscalco <antonino.maniscalco@collabora.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> Although I think the real issue here is that we haven't clearly defined
> the return values from panthor_heap_grow - it's a bit weird to have two
> different error codes for the same "try again later after incremental
> rendering" result. But as a fix this seems most clear.

Yeah, I actually considered returning -EBUSY for the 'max_chunks
reached' situation, but then realized we would also want to trigger
incremental rendering for actual mem allocation failures (when
chunk_count < max_chunks) once the fail-able/non-blocking allocation
logic is implemented, and for this kind of failure it makes more sense
to return -ENOMEM, even though this implies checking against two values
instead of one.

I guess returning -ENOMEM instead of -EBUSY for the case where we have
render passes in-flight wouldn't be too awkward, as this can be seen as
the kernel refusing to allocate more memory.

> 
> Steve
> 
> > ---
> >  drivers/gpu/drm/panthor/panthor_sched.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> > index b3a51a6de523..6de8c0c702cb 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -1354,7 +1354,13 @@ static int group_process_tiler_oom(struct panthor_group *group, u32 cs_id)
> >  					pending_frag_count, &new_chunk_va);
> >  	}
> >  
> > -	if (ret && ret != -EBUSY) {
> > +	/* If the kernel couldn't allocate memory because we reached the maximum
> > +	 * number of chunks (EBUSY if we have render passes in flight, ENOMEM
> > +	 * otherwise), we want to let the FW try to reclaim memory by waiting
> > +	 * for fragment jobs to land or by executing the tiler OOM exception
> > +	 * handler, which is supposed to implement incremental rendering.
> > +	 */
> > +	if (ret && ret != -EBUSY && ret != -ENOMEM) {
> >  		drm_warn(&ptdev->base, "Failed to extend the tiler heap\n");
> >  		group->fatal_queues |= BIT(cs_id);
> >  		sched_queue_delayed_work(sched, tick, 0);  
> 

