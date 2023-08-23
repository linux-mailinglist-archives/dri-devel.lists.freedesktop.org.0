Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B117785CCE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 18:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03E010E460;
	Wed, 23 Aug 2023 16:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F4A10E460
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 16:01:00 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b73261babdso14681961fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 09:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1692806459; x=1693411259;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=j+G1doTS13uLYVOie4sl24SlVj77ImGeO/PD3/te4YA=;
 b=aPwKP6GBjiV3rDrFYdbWE9wdFDH9WVPr6XC2t/EYJenJpI04n5xzFMtu9P3MNlnoiH
 pJnWLvpF/mk25t4vuLS9X/7RWIVNjPO5I9hDM8sGWGIQYYpjSLHbzUDQnQbUAqFbuE6R
 J7LiHAXlOGTj37B+fWrevEQlskHF3brI2O5PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692806459; x=1693411259;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j+G1doTS13uLYVOie4sl24SlVj77ImGeO/PD3/te4YA=;
 b=Ptk8oz7aYLL0Y9FSUTa4Kg7hNfa/C3kdeT7wFK1GNVUScPuKUsrI7l+uLZeDiAFGMM
 StRESVbkbftiQKJowZEmTM6upljYRwJahzKytG/4wPGaX42KlRenxQ7v4Vxm/7J/c6j0
 LsylnDD8NY43epYjcelBm3nOzq0NlkVlzK2EYHA/1u40GuOjSUDBhY34sE4zjFw3JzmB
 Z0XFqUD2r5IxWBK8PLonjg+fCNtbmgC1WU6yTTsd2GCI/8jp1+SVGIaVC4TH60AZD8gC
 VgFhmwS2730u9D5HNKBMrXj7Ua3RiO0yXQpUK5z4gyzyQbVkLVgLEgb7RCNzr6jINVs/
 vegg==
X-Gm-Message-State: AOJu0YyfbRPTrJTB/5FmJaGvT4dJVP4jnLajmCFtHAaDWe3+GShLJURO
 Lj81LcVwWo6nfreo38bcme9U8A==
X-Google-Smtp-Source: AGHT+IH2xzt5L8MDZyhHmMET+iU5A90I18OMWz3GEbLw3kA6Pw6ntHjd70PF/ki0wEveTgm4bhkyjA==
X-Received: by 2002:a05:651c:1990:b0:2b8:3c52:113 with SMTP id
 bx16-20020a05651c199000b002b83c520113mr9564509ljb.5.1692806458117; 
 Wed, 23 Aug 2023 09:00:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a1709060e9200b009888aa1da11sm9915423ejf.188.2023.08.23.09.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 09:00:57 -0700 (PDT)
Date: Wed, 23 Aug 2023 18:00:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH v5] drm/i915: Avoid circular locking dependency when
 flush delayed work on gt reset
Message-ID: <ZOYtNyqfvqJPeqq2@phenom.ffwll.local>
References: <20230811182011.546026-1-zhanjun.dong@intel.com>
 <3a745c83-e7cf-6a24-5556-8c0c019adfec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a745c83-e7cf-6a24-5556-8c0c019adfec@intel.com>
X-Operating-System: Linux phenom 6.3.0-2-amd64 
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, intel-gfx@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 22, 2023 at 11:53:24AM -0700, John Harrison wrote:
> On 8/11/2023 11:20, Zhanjun Dong wrote:
> > This attempts to avoid circular locking dependency between flush delayed
> > work and intel_gt_reset.
> > When intel_gt_reset was called, task will hold a lock.
> > To cacel delayed work here, the _sync version will also acquire a lock,
> > which might trigger the possible cirular locking dependency warning.
> > When intel_gt_reset called, reset_in_progress flag will be set, add code
> > to check the flag, call async verion if reset is in progress.
> > 
> > Signed-off-by: Zhanjun Dong<zhanjun.dong@intel.com>
> > Cc: John Harrison<John.C.Harrison@Intel.com>
> > Cc: Andi Shyti<andi.shyti@linux.intel.com>
> > Cc: Daniel Vetter<daniel@ffwll.ch>
> > ---
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 ++++++++++-
> >   1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index a0e3ef1c65d2..600388c849f7 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -1359,7 +1359,16 @@ static void guc_enable_busyness_worker(struct intel_guc *guc)
> >   static void guc_cancel_busyness_worker(struct intel_guc *guc)
> >   {
> > -	cancel_delayed_work_sync(&guc->timestamp.work);
> > +	/*
> > +	 * When intel_gt_reset was called, task will hold a lock.
> > +	 * To cacel delayed work here, the _sync version will also acquire a lock, which might
> > +	 * trigger the possible cirular locking dependency warning.
> > +	 * Check the reset_in_progress flag, call async verion if reset is in progress.
> > +	 */
> This needs to explain in much more detail what is going on and why it is not
> a problem. E.g.:
> 
>    The busyness worker needs to be cancelled. In general that means
>    using the synchronous cancel version to ensure that an in-progress
>    worker will not keep executing beyond whatever is happening that
>    needs the cancel. E.g. suspend, driver unload, etc. However, in the
>    case of a reset, the synchronous version is not required and can
>    trigger a false deadlock detection warning.
> 
>    The business worker takes the reset mutex to protect against resets
>    interfering with it. However, it does a trylock and bails out if the
>    reset lock is already acquired. Thus there is no actual deadlock or
>    other concern with the worker running concurrently with a reset. So
>    an asynchronous cancel is safe in the case of a reset rather than a
>    driver unload or suspend type operation. On the other hand, if the
>    cancel_sync version is used when a reset is in progress then the
>    mutex deadlock detection sees the mutex being acquired through
>    multiple paths and complains.
> 
>    So just don't bother. That keeps the detection code happy and is
>    safe because of the trylock code described above.

So why do we even need to cancel anything if it doesn't do anything while
the reset is in progress?

Just remove the cancel from the reset path as uneeded instead, and explain
why that's ok? Because that's defacto what the cancel_work with a
potential deadlock scenario for cancel_work_sync does, you either don't
need it at all, or the replacement creates a bug.
-Daniel

> 
> 
> John.
> 
> 
> > +	if (guc_to_gt(guc)->uc.reset_in_progress)
> > +		cancel_delayed_work(&guc->timestamp.work);
> > +	else
> > +		cancel_delayed_work_sync(&guc->timestamp.work);
> >   }
> >   static void __reset_guc_busyness_stats(struct intel_guc *guc)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
