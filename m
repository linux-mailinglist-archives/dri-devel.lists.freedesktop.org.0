Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1782736E99E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 13:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4BD6EE3A;
	Thu, 29 Apr 2021 11:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7966EE36
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 11:32:56 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so10585044wmi.5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 04:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MHVvBdX5yruZNuaE6au3mmpWmkpoYnyq1LRiMVUzyEs=;
 b=i6TqpaqwZIaTAklta46eRDAvyvsRvTWw7hhqFDWaP2OQ4TmLVFWxv3ZtA2QYnC5AP5
 1t1ohca7oAD7FIgbIn4ZE0Lj9ChX5ctebQ0hrydD21BhpPvDXo8DI59OtgD8imrwHgw7
 ABYSeruiRE+HCbHgwoGJ/kt/q4ouXEr4vfEr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MHVvBdX5yruZNuaE6au3mmpWmkpoYnyq1LRiMVUzyEs=;
 b=lArW7pQp+FYqo3nyUF+bf5hhyVjvvavR3r1xdQ/Q9FvsxIzQcuqOGr2+zChTj1IozT
 Au0p52Ih/i/lLRuGGq50LZ/DCBH9Mwav+5ADvXy0VcK/xfMxUAaSdo+qAAijArswvJlE
 7tlZf2CJWJfb5W7kLzZ+VWENe9NTC7WqHFMoHYOPYp+J2j9GAJliiKW66sWAFVcKEEw8
 2Y/RU/zul6M6pufQD+dnq/nvl0NBjxtSOHioj7irj03ENmDOyNx12xKeivuvGhFxB9cD
 l6RYnSJfVsaJIw+/04gjvDomHtFMY+AQwwR9rSYnQlZ8xY3eCjv4/eOvl7ZLUnOgzzi4
 2T5w==
X-Gm-Message-State: AOAM533bnC9oyLOrrvghgfILtoXhDGf8uV0j76UkuFiQWcx3oIGVfASq
 e8uo7ulvBWvYXout9GHoMUbU8A==
X-Google-Smtp-Source: ABdhPJwmPDSU2R2T2gFQK0GFek3qSa8MyzcXyXewBZob9l1eoq+OGIfRwULnAPSgltMO1QmTvugW0w==
X-Received: by 2002:a05:600c:221a:: with SMTP id
 z26mr2176067wml.93.1619695975670; 
 Thu, 29 Apr 2021 04:32:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f11sm10503457wmc.6.2021.04.29.04.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 04:32:55 -0700 (PDT)
Date: Thu, 29 Apr 2021 13:32:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v5 20/27] drm: Scope all DRM IOCTLs  with
 drm_dev_enter/exit
Message-ID: <YIqZZW9iFyGCyOmU@phenom.ffwll.local>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-21-andrey.grodzovsky@amd.com>
 <YIqXJ5LA6wKl/yzZ@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIqXJ5LA6wKl/yzZ@phenom.ffwll.local>
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
Cc: ckoenig.leichtzumerken@gmail.com, gregkh@linuxfoundation.org,
 daniel.vetter@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 helgaas@kernel.org, dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org,
 Alexander.Deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 01:23:19PM +0200, Daniel Vetter wrote:
> On Wed, Apr 28, 2021 at 11:12:00AM -0400, Andrey Grodzovsky wrote:
> > With this calling drm_dev_unplug will flush and block
> > all in flight IOCTLs
> > 
> > Also, add feature such that if device supports graceful unplug
> > we enclose entire IOCTL in SRCU critical section.
> > 
> > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> 
> Nope.
> 
> The idea of drm_dev_enter/exit is to mark up hw access. Not entire ioctl.
> 
> Especially not with an opt-in flag so that it could be shrugged of as a
> driver hack. Most of these ioctls should have absolutely no problem
> working after hotunplug.
> 
> Also, doing this defeats the point since it pretty much guarantees
> userspace will die in assert()s and stuff. E.g. on i915 the rough contract
> is that only execbuf (and even that only when userspace has indicated
> support for non-recoverable hw ctx) is allowed to fail. Anything else
> might crash userspace.
> 
> You probably need similar (and very precisely defined) rules for amdgpu.
> And those must definitely exclude any shard ioctls from randomly failing
> with EIO, because that just kills the box and defeats the point of trying
> to gracefully handling hotunplug and making sure userspace has a chance of
> survival. E.g. for atomic everything should continue, including flip
> completion, but we set all outputs to "disconnected" and send out the
> uevent. Maybe crtc enabling can fail too, but that can also be handled
> through the async status we're using to signal DP link failures to
> userspace.
> 
> I guess we should clarify this in the hotunplug doc?

To clarify: I'm not against throwing an ENODEV at userspace for ioctl that
really make no sense, and where we're rather confident that all properly
implemented userspace will gracefully handle failures. Like a modeset, or
opening a device, or trying to import a dma-buf or stuff like that which
can already fail in normal operation for any kind of reason.

But stuff that never fails, like GETRESOURCES ioctl, really shouldn't fail
after hotunplug.

And then there's the middle ground, like doing a pageflip or buffer flush,
which I guess some userspace might handle, but risky to inflict those
consequences on them. atomic modeset is especially fun since depending
what you're doing it can be both "failures expected" and "failures not
really expected in normal operation".

Also, this really should be consistent across drivers, not solved with a
driver flag for every possible combination.

If you look at the current hotunplug kms drivers, they have
drm_dev_enter/exit sprinkled in specific hw callback functions because of
the above problems. But maybe it makes sense to change things in a few
cases. But then we should do it across the board.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
