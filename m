Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788E08B9DF9
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 17:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2473E10F0E7;
	Thu,  2 May 2024 15:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ityXWHWr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9ABE10F0E7
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 15:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714665582;
 bh=0AtuseiLn7XHjp8AcnIi0fGRkrhOZPcZP/UO2jJRtxM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ityXWHWrc6u+qYGBpmg9ntlyUBDCWRtU9Lr90LwXffXIJ84tGmOb9vQTmq1hZQHAM
 x/fO2tgUH99BsG6fuRG2FP9GAct4zNXCOeXKasOf+bVy69aE0X12VfPccWiZSIvfql
 a/qkLpvuewIrhrK9duD8Rg8eKHGICaABlmSLM5KLhdfLvcKgkQzqByItMfrJKEoG/i
 HckgIPy7iWs0OasZpQJER7xJwnj0/4g3LmYkZ3+VcBDrtXpMUtugc+2ZY9DTFSsqCD
 qn29fJc3mLvuq45P6yMKKEtWlXzhV49w/lF+tt/lIHkofmk9ABY6NgcoUpsY/b0N+j
 x9k5HDVCvB4dA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 405903782017;
 Thu,  2 May 2024 15:59:42 +0000 (UTC)
Date: Thu, 2 May 2024 17:59:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH] drm/panthor: Kill the faulty_slots variable in
 panthor_sched_suspend()
Message-ID: <20240502175940.6f1142dd@collabora.com>
In-Reply-To: <093eec5f-1c47-4481-bf0a-567441fd6bc3@arm.com>
References: <20240425103920.826458-1-boris.brezillon@collabora.com>
 <093eec5f-1c47-4481-bf0a-567441fd6bc3@arm.com>
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

On Thu, 25 Apr 2024 12:18:29 +0100
Steven Price <steven.price@arm.com> wrote:

> On 25/04/2024 11:39, Boris Brezillon wrote:
> > We can use upd_ctx.timedout_mask directly, and the faulty_slots update
> > in the flush_caches_failed situation is never used.
> > 
> > Suggested-by: Suggested-by: Steven Price <steven.price@arm.com>  
> 
> I'm obviously too full of suggestions! ;)

Pushed to drm-misc-next-fixes, but I realize I forgot to drop the extra
Suggested-by. Oh well.

> 
> And you're doing a much better job of my todo list than I am!
> 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> > ---
> >  drivers/gpu/drm/panthor/panthor_sched.c | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> > index fad4678ca4c8..fed28c16d5d1 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -2584,8 +2584,8 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
> >  {
> >  	struct panthor_scheduler *sched = ptdev->scheduler;
> >  	struct panthor_csg_slots_upd_ctx upd_ctx;
> > -	u32 suspended_slots, faulty_slots;
> >  	struct panthor_group *group;
> > +	u32 suspended_slots;
> >  	u32 i;
> >  
> >  	mutex_lock(&sched->lock);
> > @@ -2605,10 +2605,9 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
> >  
> >  	csgs_upd_ctx_apply_locked(ptdev, &upd_ctx);
> >  	suspended_slots &= ~upd_ctx.timedout_mask;
> > -	faulty_slots = upd_ctx.timedout_mask;
> >  
> > -	if (faulty_slots) {
> > -		u32 slot_mask = faulty_slots;
> > +	if (upd_ctx.timedout_mask) {
> > +		u32 slot_mask = upd_ctx.timedout_mask;
> >  
> >  		drm_err(&ptdev->base, "CSG suspend failed, escalating to termination");
> >  		csgs_upd_ctx_init(&upd_ctx);
> > @@ -2659,9 +2658,6 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
> >  
> >  			slot_mask &= ~BIT(csg_id);
> >  		}
> > -
> > -		if (flush_caches_failed)
> > -			faulty_slots |= suspended_slots;
> >  	}
> >  
> >  	for (i = 0; i < sched->csg_slot_count; i++) {  
> 

