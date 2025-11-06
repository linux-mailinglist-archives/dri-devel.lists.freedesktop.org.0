Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3B8C3C723
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4E410E952;
	Thu,  6 Nov 2025 16:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WFP3QmiK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C942B10E952
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 16:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762446789;
 bh=6NuwyjCbB4bZ3DVcp49CChHenC5KZ8UI8+o6XJKgnUA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WFP3QmiKqDRzv/zl50sIPb2p0AcyoZTJIRdZZrJcrF/tF6pz/laIA90pfCIf99p5x
 9CReYgRdBql/xAGuBH3ZX08mR42WsOZV2bnYJOkvDBBj/vC/LZ0qKoC3W+d309Fk5M
 SJTRizT0TlcXGBad0TueaVlPb1ml7aGMQ9rGiQOV3ShG2otSRtm2owqS8o5No17Jvc
 t3bVxKotlV6inC2p4e9mNjXVIhHlx36BDHDKxYN3ywH77UyNzdPO67VNgi249GV7US
 uBPHAWh60/cVgqzCDld+CijL4Ko769e3jUA5PsvWam4QdbayixFTm0Xq9JYJgoT1h1
 AOAN7R1tM+anQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0F38817E090D;
 Thu,  6 Nov 2025 17:33:09 +0100 (CET)
Date: Thu, 6 Nov 2025 17:33:03 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org, Florent
 Tomasin <florent.tomasin@arm.com>, Heinrich Fink <hfink@snap.com>,
 kernel@collabora.com
Subject: Re: [PATCH v1 5/8] drm/panthor: Fix immediate ticking on a disabled
 tick
Message-ID: <20251106173303.192d509e@fedora>
In-Reply-To: <08c03b0b-79dc-4b4b-9c4d-81d188bc8f92@arm.com>
References: <20251106144656.1012274-1-boris.brezillon@collabora.com>
 <20251106144656.1012274-6-boris.brezillon@collabora.com>
 <08c03b0b-79dc-4b4b-9c4d-81d188bc8f92@arm.com>
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

On Thu, 6 Nov 2025 16:23:24 +0000
Steven Price <steven.price@arm.com> wrote:

> On 06/11/2025 14:46, Boris Brezillon wrote:
> > We have a few path where we schedule the tick work immediately without  
> NIT: s/path/paths/> changing the resched_target. If the tick was
> stopped, this would lead
> > to a remaining_jiffies that's always > 0, and it wouldn't force a full
> > tick in that case. Add extra checks to cover that case properly.
> > 
> > Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_sched.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> > index b6489e9ba1f0..1eba56e7360d 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -2358,8 +2358,12 @@ static void tick_work(struct work_struct *work)
> >  	if (drm_WARN_ON(&ptdev->base, ret))
> >  		goto out_dev_exit;
> >  
> > -	if (time_before64(now, sched->resched_target))
> > +	if (sched->resched_target != U64_MAX &&
> > +	    time_before64(now, sched->resched_target))
> >  		remaining_jiffies = sched->resched_target - now;
> > +	else if (sched->resched_target == U64_MAX &&
> > +		 time_before64(now, sched->last_tick + sched->tick_period))
> > +		remaining_jiffies = sched->last_tick + sched->tick_period - now;  
> 
> I'm wondering if this would be cleaner with an extra variable (and a
> comment):
> 
>    u64 resched_target = sched->resched_target;
> 
>    /* If the tick is stopped, calculate when the next tick would be */
>    if (resched_target == U64_MAX)
> 	   resched_target = sched->last_tick + sched->tick_period;
> 
>    if (time_before64(now, resched_target)
> 	   remaining_jiffies = resched_target - now;
> 
> It at least avoids some repetition.

Yep that looks better expressed like that. I'll go for your suggestion
in the next version.
