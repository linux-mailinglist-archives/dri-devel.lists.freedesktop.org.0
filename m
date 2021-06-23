Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A96DC3B20E1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 21:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C686E989;
	Wed, 23 Jun 2021 19:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1499B6E989
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 19:17:04 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id bu12so5745917ejb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 12:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7Hua08stsWuHXUQaJW2px47NH816H2YtXOe8cA4IlCg=;
 b=igrDooVK7zk8zc3g3dng9Z4kKomtb0NBT/xyXoKOS94YQo/bjKuJrZADYBrMzD09nW
 8ViG1g+Jg+fDW1mVxTt0V786rlCxik1uVc+AvXawxAIArMsqXfluF3j4zx8Z0vlo9uvD
 8Dy525bFR2inG+gm3XXR2dYbhgCibAdYaUrCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7Hua08stsWuHXUQaJW2px47NH816H2YtXOe8cA4IlCg=;
 b=cdM+fHqRntLqv9zEwr9LAChiqHot2nLLpLQWLQRJJQUmHB3ROT6FtdPNwiHf5Yi4AU
 PpxCSQglHQqIpf618wvO4r13weGA/mJ6zWKMTUkw0gbsHwj8wVRrXbMQvb1OLgcrg75T
 qQm2K8NBlw3gAqVnAariwlS7Do3c1RxcpvAWpzCl1h9Dvjlpu+0I1WKAGqajN5YKpzYQ
 yGEO91rxJ03vZovpX4yxvd1WPqItNVf7pi/5dPeRt73FHqve5W+tRMubWf69xC76TIc3
 A5kdZ75mC4R6ZTUV66ZIxL+tEJy0ly60OEcyUqV/ZiW2HZNu85+RhQ820aMjR7pHODRn
 ax5w==
X-Gm-Message-State: AOAM532brnU+fxuaXu6YUUkxw6IXY/hjrhqgIBc9MNEy2w4lXXxg6bPO
 gu/X3RNc8eF1FUajzWPPhnNxGg==
X-Google-Smtp-Source: ABdhPJzJhju7GF3OV5WfqUhYCkKTkqdmd8DF/MurQj6ivLt84BKbGtZA9SzfqW27EuszS2xGxd/K8A==
X-Received: by 2002:a17:907:1ca0:: with SMTP id
 nb32mr1565572ejc.105.1624475822653; 
 Wed, 23 Jun 2021 12:17:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s7sm260735ejd.88.2021.06.23.12.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 12:17:02 -0700 (PDT)
Date: Wed, 23 Jun 2021 21:17:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 06/15] drm/panfrost: Fix implicit sync
Message-ID: <YNOIrGJY7lpy+/VE@phenom.ffwll.local>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-7-daniel.vetter@ffwll.ch>
 <20210623184737.7e47f77c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210623184737.7e47f77c@collabora.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, linaro-mm-sig@lists.linaro.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 23, 2021 at 06:47:37PM +0200, Boris Brezillon wrote:
> On Tue, 22 Jun 2021 18:55:02 +0200
> Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> 
> > Currently this has no practial relevance I think because there's not
> > many who can pull off a setup with panfrost and another gpu in the
> > same system. But the rules are that if you're setting an exclusive
> > fence, indicating a gpu write access in the implicit fencing system,
> > then you need to wait for all fences, not just the previous exclusive
> > fence.
> > 
> > panfrost against itself has no problem, because it always sets the
> > exclusive fence (but that's probably something that will need to be
> > fixed for vulkan and/or multi-engine gpus, or you'll suffer badly).
> > Also no problem with that against display.
> > 
> > With the prep work done to switch over to the dependency helpers this
> > is now a oneliner.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > Cc: Steven Price <steven.price@arm.com>
> > Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Pushed the 3 panfrost patches to drm-misc-next, thanks for reviewing them.
-Daniel

> 
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_job.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index 71cd43fa1b36..ef004d587dc4 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -203,9 +203,8 @@ static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
> >  	int i, ret;
> >  
> >  	for (i = 0; i < bo_count; i++) {
> > -		struct dma_fence *fence = dma_resv_get_excl_unlocked(bos[i]->resv);
> > -
> > -		ret = drm_gem_fence_array_add(deps, fence);
> > +		/* panfrost always uses write mode in its current uapi */
> > +		ret = drm_gem_fence_array_add_implicit(deps, bos[i], true);
> >  		if (ret)
> >  			return ret;
> >  	}
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
