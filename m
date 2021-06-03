Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E70A399C95
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 10:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4647B6F42A;
	Thu,  3 Jun 2021 08:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0E96F42A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 08:29:20 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id h24so8011891ejy.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 01:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fqgNBT/kGHD0VaaWvfrMvQRbPLUK/41dS90Woxjlx3w=;
 b=DcKRE3Zhi+TUnaraTHRMTgEGXPecRIkcIav4i3lf1/Mc2iWIT0hdUL5x+eVCWRTIsD
 AnUIL2G1bDD5uMTZLSH+GTIu0aSNBi4EWWX+99vxxR+T+Y9GpGwlUQoYRlPjNnbXKE1R
 UyZ1Hbrj+A6tnUhJTtdn6IFIgK1auS9NPxJEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fqgNBT/kGHD0VaaWvfrMvQRbPLUK/41dS90Woxjlx3w=;
 b=jcTZb1aH6aLzHmcAYHZLiwZfWY0JYuhOu+Ei8tuVYMdp2Qfulsz9UwJJbt/kphgP9E
 ZuZDz61EClEZQIwOxiNJJcB2JnCoQcaOOwmGC2B04U4tyo0x1pswq58IvG7ZwuBuej+V
 ow56mowFQyujeGXPpD6nnnUqhKeBsmjbK1H3GAvRlqvIJWwpsMliuqyg3g/MdfOTG9ww
 ytDngrVWTdRmzkf8RXIm3mY2ldeUcGOhWeS9uJ4secVSqLoWXOz1Z9aIyxhke8Nv8fwi
 XX0Pv/UjW+pzA+/AyRgqlw3rG+hsSx1G3k7xLhoPuAmY7eG+sb3vJ3e6FZLVKC0adgVO
 8ZOA==
X-Gm-Message-State: AOAM533XzfPQWJQ5VwRT7ucu9u08OCbKNTzlO63GoUO/v3pHh9EldvBq
 llKtIH8U73bfp4UIcpBIhrdS2pM3x+Bw/A==
X-Google-Smtp-Source: ABdhPJwD6iG9FPJGNRpydXgFkGsjB8Z2iL5GJaLZ267K9rpM+LuCupyhCArth5pdNpsZHK02G7e9rg==
X-Received: by 2002:a17:906:b307:: with SMTP id
 n7mr20399417ejz.261.1622708959488; 
 Thu, 03 Jun 2021 01:29:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e25sm1217903eja.15.2021.06.03.01.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 01:29:19 -0700 (PDT)
Date: Thu, 3 Jun 2021 10:29:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 0/5] drm/i915: Get rid of fence error propagation
Message-ID: <YLiS3ZaDm/nttAKi@phenom.ffwll.local>
References: <20210602164149.391653-1-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602164149.391653-1-jason@jlekstrand.net>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 02, 2021 at 11:41:44AM -0500, Jason Ekstrand wrote:
> Fence error propagation is sketchy at best.  Instead of explicitly handling
> fences which might have errors set in the code which is aware of errors, we
> just kick them down the line and hope that userspace knows what to do when
> a wait eventually fails.  This is sketchy at best because most userspace
> isn't prepared to handle errors in those places.  To make things worse, it
> allows errors to propagate across processes in unpredictable ways.  This is
> causing hangs in one client to kill X11.
> 
> Unfortunately, there's no quick path from here to there thanks to the fact
> that we're now running the command parser asynchronously and relying on
> fence errors for when it fails.  This series first gets rid of asynchronous
> command parsing and then cleans up from there.  There was never any real
> use-case for asynchronous parsing and the platforms that rely heavily on
> the command parser are old enough (Gen7) that, when we changed the way the
> command parser works, it wasn't really a change anyone was asking for
> anyway.
> 
> I think we probably want this whole mess back-ported.  I'm happy to take
> suggestions on the strategy there because the history there is a bit
> annoying and I'm not 100% sure where the Linux release cuts land.  In any
> case, I'm happy to make a version of this series per-release if needed for
> Greg to back-port.

I think just the two reversts are enough to be backported, other 3 are
cleanups.

Also I guess this will need to come with an igt patch to adjust the
cmdparser test.

With all the nits addressed, on the series.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> 
> Jason Ekstrand (5):
>   drm/i915: Revert "drm/i915/gem: Asynchronous cmdparser"
>   drm/i915: Remove allow_alloc from i915_gem_object_get_sg*
>   drm/i915: Drop error handling from dma_fence_work
>   Revert "drm/i915: Propagate errors on awaiting already signaled
>     fences"
>   Revert "drm/i915: Skip over MI_NOOP when parsing"
> 
>  drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   4 +-
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 227 +-----------------
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  10 +-
>  drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  21 +-
>  .../i915/gem/selftests/i915_gem_execbuffer.c  |   4 +
>  drivers/gpu/drm/i915/gt/intel_ggtt.c          |   2 +-
>  drivers/gpu/drm/i915/i915_cmd_parser.c        | 199 ++++++++-------
>  drivers/gpu/drm/i915/i915_drv.h               |   7 +-
>  drivers/gpu/drm/i915/i915_request.c           |   8 +-
>  drivers/gpu/drm/i915/i915_sw_fence_work.c     |   5 +-
>  drivers/gpu/drm/i915/i915_sw_fence_work.h     |   2 +-
>  drivers/gpu/drm/i915/i915_vma.c               |   3 +-
>  12 files changed, 141 insertions(+), 351 deletions(-)
> 
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
