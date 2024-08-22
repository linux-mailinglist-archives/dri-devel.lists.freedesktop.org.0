Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 554D695B17D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 11:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579B910E819;
	Thu, 22 Aug 2024 09:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="JNWwFYw+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960D010E819
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 09:23:52 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3718706cf8aso252650f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 02:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724318631; x=1724923431; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hAIdw1MsYxurgcuI1tEtzK10ojxgxhsFnTkF66hhK30=;
 b=JNWwFYw+k/oCOZIBjQ0VOORalPgtx/5iKILq7Wt5gzNlYtuPm1tSWITjUPXZU6+CMq
 +D8yu67T87Ly4l+yRAkYJuakgtaNj+JJ8qRnoUoEJGt5iwO3oWcuo8F2OkXo/bvJT4z6
 EA6m7C4Ey0tn6HaQp+UDtSemyNk4kw2Xpxa+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724318631; x=1724923431;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hAIdw1MsYxurgcuI1tEtzK10ojxgxhsFnTkF66hhK30=;
 b=PPnKFDqTtcyCNobsIipIT+3W60wUiQ809OuAUT3sMDRgpjygemKSgoO8/mlADRQic7
 kFHYR4lxhdEATHzjJyWM7ojJeAFxT1Kpwd9E/H0zfzqHsAnlMm/Bhz0dvkYzbWdSbuAi
 gjR9HazJFgXRT7K23sTkruU6IWsT8ax8iRKMtX7jtqguwAbnu4CPwQUBSqSSD36W8FNM
 X7wtem/wv9KG9tgh1QmgQGEvvIxIWwQCD5cyu5RnqH6YK0/b1VDONE3S5zPXOKPx6d5R
 eLEj1SmYhkoQl10Q8xpKFMZPdQOXR4hsukXSHx80NwSUb/zT1OgAuJ20ajdpwQuACM6W
 tc7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUamLJMMX3/ehNct1RIZjkce1UvLTRxa8cDEMtPvoGu6j6ZrDQzvEIkaVNAH/+CrDwnqv4gAJoRcH4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyl0+kWTZu+g3bA6Uf88GLr6TIc98TmJAa46cBOdLWwU4E+Mtq7
 j3pRQVl2vZYmgtBz54Xd1DFCSfWAS59bEzk1PKbKQJZLoX3Luqat0jpt/iJOcUE=
X-Google-Smtp-Source: AGHT+IEZTrMFfipGx3FlxFKk7PtcTrEaaz8/i1jwKfZr6VVyMUpkCStaRoPOqa/9yUadGri8wQ4qHQ==
X-Received: by 2002:a5d:658a:0:b0:371:8277:6650 with SMTP id
 ffacd0b85a97d-37308c09013mr891465f8f.13.1724318630505; 
 Thu, 22 Aug 2024 02:23:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730813ce6fsm1193903f8f.30.2024.08.22.02.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 02:23:50 -0700 (PDT)
Date: Thu, 22 Aug 2024 11:23:47 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
Message-ID: <ZscDox5KoiNHXxne@phenom.ffwll.local>
References: <14b70a4d-dc65-4886-940c-ffc1a8197821@gmail.com>
 <77995ffc6de401bc8ed2f4181848dffb18540666.camel@linux.intel.com>
 <20bceb24-8cae-4f0a-897e-326dbf8dc186@amd.com>
 <7d3c647a2df19aa0f8a582b7d346ba8014cf6ca3.camel@linux.intel.com>
 <ZsNTTCfBCpZNrSQH@phenom.ffwll.local>
 <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
 <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
 <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Wed, Aug 21, 2024 at 10:14:34AM +0200, Christian König wrote:
> Am 20.08.24 um 18:00 schrieb Thomas Hellström:
> > > Or why exactly should shrinking fail?
> > A common example would be not having runtime pm and the particular bo
> > needs it to unbind, we want to try the next bo. Example: i915 GGTT
> > bound bos and Lunar Lake PL_TT bos.
> 
> WHAT? So you basically block shrinking BOs because you can't unbind them
> because the device is powered down?

Yes. amdgpu does the same btw :-)

It's a fairly fundamental issue of rpm on discrete gpus, or anything that
looks a lot like a discrete gpu. The deadlock scenario is roughly:

- In runtime suspend you need to copy any bo out of vram into system ram
  before you power the gpu. This requires bo and ttm locks.

- You can't just avoid this by holding an rpm reference as long as any bo
  is still in vram, because that defacto means you'll never autosuspend at
  runtime. Plus most real hw is complex enough that you have some driver
  objects that you need to throw out or recreate, so in practice no way to
  avoid all this.

- runtime resume tends to be easier and mostly doable without taking bo
  and ttm locks, because by design you know no one else can possibly have
  any need to get at the gpu hw - it was all powered off after all. It's
  still messy, but doable.

- Unfortunately this doesn't help, because your runtime resume might need
  to wait for a in-progress suspend operation to complete. Which means you
  still deadlock even if your resume path has entirely reasonable locking.

On integrated you can mostly avoid this all because there's no need to
swap out bo to system memory, they're there already. Exceptions like the
busted coherency stuff on LNL aside.

But on discrete it's just suck.

TTM discrete gpu drivers avoided all that by simply not having a shrinker
where you need to runtime pm get, instead all runtime pm gets are outmost,
without holding any ttm or bo locks.

> I would say that this is a serious NO-GO. It basically means that powered
> down devices can lock down system memory for undefined amount of time.
> 
> In other words an application can allocate memory, map it into GGTT and then
> suspend or even get killed and we are not able to recover the memory because
> there is no activity on the GPU any more?
> 
> That really sounds like a bug in the driver design to me.

It's a bug in the runtime pm core imo. I think interim what Thomas laid
out is the best solution, since in practice when the gpu is off you really
shouldn't need to wake it up. Except when you're unlucky and racing a
runtime suspend against a shrinker activity (like runtime suspend throws a
bo into system memory, and the shrinker then immediately wants to swap it
out).

I've been pondering this mess for a few months, and I think I have a
solution. But it's a lot of work in core pm code unfortunately:

I think we need to split the runtime_suspend callback into two halfes:

->runtime_suspend_prepare

This would be run by the rpm core code from a worker without holding any
locks at all. Also, any runtime_pm_get call will not wait on this prepare
callback to finish, so it's up to the driver to make sure all the locking
is there. Synchronous suspend calls obviously have to wait for this to
finish, but that should only happen during system suspend or driver
unload, where we don't have these deadlock issues.

Drivers can use this callback for any non-destructive prep work
(non-destructive aside from the copy engine time wasted if it fails) like
swapping bo from vram to system memory. Drivers must not actually shut
down the hardware because a runtime_pm_get call must succeed without
waiting for this callback to finish.

If any runtime_pm_get call happens while the suspend attempt will be
aborted without further action.

->runtime_suspend

This does the actual hw power-off. The power core must guarantee that the
->runtime_suspend_prepare has successfully completed at least once without
the rpm refcount being elevated from 0 to 1 again.

This way drivers can assume that all bo have been swapped out from vram
already, and there's no need to acquire bo or ttm locks in the suspend
path that could block the resume path.

Which would then allow unconditional runtime_pm_get in the shrinker paths.

Unfortunately this will be all really tricky to implement and I think
needs to be done in the rumtime pm core.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
