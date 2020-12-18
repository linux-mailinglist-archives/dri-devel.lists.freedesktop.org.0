Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 603B32DE3C4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 15:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EBB89193;
	Fri, 18 Dec 2020 14:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C883E89193
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 14:15:05 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id y23so2735120wmi.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 06:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=D0yaErHcqfayKksTi4is0kAuzaBOGBnPoVWcZNIY0oA=;
 b=kax6tWHn82BS2aAMps25EqnQK6kcKfiHaxXQ5LpUY772gpn3TzVG2AyjpW7qvGmgv+
 eSOVJpEP68PQ2wcTQyi3ZNwhed+tcFiVocvVSW/rrZ/hramri51/SSaYkEoIfwzRK/rp
 nOxuCsmVjkxV+iLkMcWHtRHziIW7zEM8F57V0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D0yaErHcqfayKksTi4is0kAuzaBOGBnPoVWcZNIY0oA=;
 b=VDr395vFd6wKtw8I2WCMUybSRw7o9Kh0+6A3LlrgdcztPqfPskr6Bom/Aq4B2fOFKJ
 7R1J4IZ92/zaIRTfb3bSjpaIZlKlpiSSLPipzXg+l/d2A0qX5WatN0US2hlUujbi3Dca
 Ked1m7AJOj0Iqpt7GvE/DAC5ZDUUSvNxnjfR129M3xKrxNCKoUD5N1usUsxEhOryWkyt
 mUrdKxlMX8aShQZj0XZRQq40DIKszZJybGKcrTQnd4EXSXKLo0805ccR2+mSBN895Kr0
 Xs7lw3gyp0wiImCQLWANJg8HMb3gPgm7rtFCBMd+yyImdfpfUkXuqrGZs68AjZqH5DVe
 xMJw==
X-Gm-Message-State: AOAM532vlQLyPVlYZ5HlUAJQJNaHI76hclyIGPoZpVflWHqdLbYi3w/R
 J+eiNec5UXubwtxQghxjZLGmv0ZLXh9HHA==
X-Google-Smtp-Source: ABdhPJx6oSkFaGreLuoE09d4qzFTkIkq+dcQdNCl6rFGOerf8Urg/cRXctSv4FHV2EznOYlsKENqZw==
X-Received: by 2002:a1c:b082:: with SMTP id z124mr4381858wme.129.1608300904413; 
 Fri, 18 Dec 2020 06:15:04 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j9sm13831473wrm.14.2020.12.18.06.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 06:15:03 -0800 (PST)
Date: Fri, 18 Dec 2020 15:15:01 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] drm/nouveau: fix multihop when move doesn't work.
Message-ID: <X9y5ZXTmuUoxO+B1@phenom.ffwll.local>
References: <20201217200943.30511-1-airlied@gmail.com>
 <X9u/j9zPS/uJURJX@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9u/j9zPS/uJURJX@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 17, 2020 at 09:29:03PM +0100, Daniel Vetter wrote:
> On Fri, Dec 18, 2020 at 06:09:43AM +1000, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> > 
> > As per the radeon/amdgpu fix don't use multihop is hw moves
> > aren't enabled.
> > 
> > Reported-by: Mike Galbraith <efault@gmx.de>
> > Tested-by: Mike Galbraith <efault@gmx.de>
> > Fixes: 0c8c0659d74 ("drm/nouveau/ttm: use multihop")

Also fixed the Fixes: line here, it was pointing at something else (old
rebased version from your own tree maybe?).
-Daniel

> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> 
> Pulled to drm-next directly, will go out to Linus tomorrow.
> -Daniel
> 
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_bo.c | 31 ++++++++++++++--------------
> >  1 file changed, 16 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > index 1386b0fc1640..c85b1af06b7b 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > @@ -942,16 +942,6 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
> >  	struct nouveau_drm_tile *new_tile = NULL;
> >  	int ret = 0;
> >  
> > -	if ((old_reg->mem_type == TTM_PL_SYSTEM &&
> > -	     new_reg->mem_type == TTM_PL_VRAM) ||
> > -	    (old_reg->mem_type == TTM_PL_VRAM &&
> > -	     new_reg->mem_type == TTM_PL_SYSTEM)) {
> > -		hop->fpfn = 0;
> > -		hop->lpfn = 0;
> > -		hop->mem_type = TTM_PL_TT;
> > -		hop->flags = 0;
> > -		return -EMULTIHOP;
> > -	}
> >  
> >  	if (new_reg->mem_type == TTM_PL_TT) {
> >  		ret = nouveau_ttm_tt_bind(bo->bdev, bo->ttm, new_reg);
> > @@ -995,14 +985,25 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
> >  
> >  	/* Hardware assisted copy. */
> >  	if (drm->ttm.move) {
> > +		if ((old_reg->mem_type == TTM_PL_SYSTEM &&
> > +		     new_reg->mem_type == TTM_PL_VRAM) ||
> > +		    (old_reg->mem_type == TTM_PL_VRAM &&
> > +		     new_reg->mem_type == TTM_PL_SYSTEM)) {
> > +			hop->fpfn = 0;
> > +			hop->lpfn = 0;
> > +			hop->mem_type = TTM_PL_TT;
> > +			hop->flags = 0;
> > +			return -EMULTIHOP;
> > +		}
> >  		ret = nouveau_bo_move_m2mf(bo, evict, ctx,
> >  					   new_reg);
> > -		if (!ret)
> > -			goto out;
> > -	}
> > +	} else
> > +		ret = -ENODEV;
> >  
> > -	/* Fallback to software copy. */
> > -	ret = ttm_bo_move_memcpy(bo, ctx, new_reg);
> > +	if (ret) {
> > +		/* Fallback to software copy. */
> > +		ret = ttm_bo_move_memcpy(bo, ctx, new_reg);
> > +	}
> >  
> >  out:
> >  	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
> > -- 
> > 2.27.0
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
