Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E266F8A7FA6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 11:29:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F6C10F4E7;
	Wed, 17 Apr 2024 09:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gNzKNU3C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6243910F4E7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 09:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713346192;
 bh=Ormw5AVhPtSXTp2jJ8sC6rhaainrrqZ/5k5Tyhe5EfA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gNzKNU3CgHpeu82+4b7H5uV234wnnQxCAmvrWkN8XEB+u3zDTEMAC7hAt7M1juXJV
 36BRNkk8wsvVCs4diVstgpvHNBYeUIR9poqLGn0M4iLXUytVoktgkAveHAOZTnOVkB
 feOLzy76ruTRBiPsKsTOwqZ0q7S/rReY+i0S1JF4IeSCVOrDb8poQrPHWE2YGfiftE
 jJSaIstliBVBvScSPE/k5Kfl2/iRucLrkgqXZ1jjMHvu39yZNSfcAHVGTBrLpbdtpU
 GLALInGHAGlq68JNfBNs64AZXimOZ9vu7iDoFKwq64C8zUSGEHq1o9hdJzdBQ1cgGV
 N3PJtPZ5lRTnw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 091D5378020A;
 Wed, 17 Apr 2024 09:29:51 +0000 (UTC)
Date: Wed, 17 Apr 2024 11:29:50 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: clean up some types in
 panthor_sched_suspend()
Message-ID: <20240417112950.6873ebc4@collabora.com>
In-Reply-To: <effb8ca8-9d45-45d1-afab-467d0ac20fbd@arm.com>
References: <85356b15-4840-4e64-8c75-922cdd6a5fef@moroto.mountain>
 <effb8ca8-9d45-45d1-afab-467d0ac20fbd@arm.com>
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

On Mon, 8 Apr 2024 13:27:17 +0100
Steven Price <steven.price@arm.com> wrote:

> On 08/04/2024 08:36, Dan Carpenter wrote:
> > These variables should be u32 instead of u64 because they're only
> > storing u32 values.  Also static checkers complain when we do:
> > 
> > 	suspended_slots &= ~upd_ctx.timedout_mask;
> > 
> > In this code "suspended_slots" is a u64 and "upd_ctx.timedout_mask".  The

                                            'and "upd_ctx.timedout_mask" an u32.'?

> > mask clears out the top 32 bits which would likely be a bug if anything
> > were stored there.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>  
> 
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
> If you fancy a bit more clean-up then I think faulty_slots is completely
> redundant as a separate variable. In particular in the "if
> (suspended_slots)" section it's updated but that updated value is never
> used... otherwise I'll put it on my list for cleaning up later.

Yeah, I think this variable predates the upd_ctx stuff and is now useless.
I you post such a patch, please add my R-b directly.

Thanks,

Boris

> 
> > ---
> >  drivers/gpu/drm/panthor/panthor_sched.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> > index d4bc652b34d5..b3a51a6de523 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -2546,7 +2546,7 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
> >  {
> >  	struct panthor_scheduler *sched = ptdev->scheduler;
> >  	struct panthor_csg_slots_upd_ctx upd_ctx;
> > -	u64 suspended_slots, faulty_slots;
> > +	u32 suspended_slots, faulty_slots;
> >  	struct panthor_group *group;
> >  	u32 i;
> >    
> 

