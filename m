Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8243834DA
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 17:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE6F6E147;
	Mon, 17 May 2021 15:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CCA6E147
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 15:12:26 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id z17so6788045wrq.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 08:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=46Mcfg0fJPfvf+exhPuK3IU8JopPm3jTKKYAxQQFRqE=;
 b=FI+sS0LMSk1MflNV3uZOM+tMr2Z6OLkKR8xvkropE9Wr6gM+Zp2ZlJ6P9VJV5qcOag
 Iwb/OM0tW2F3v2Nbn+L0PN2Jp3sLa6THRCn97GdH8AmvDY854koRNUDcwJvnw3eTQI75
 2E6K+LuR3UPj34VWRxY8DYpmg0oiGNY+zeBtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=46Mcfg0fJPfvf+exhPuK3IU8JopPm3jTKKYAxQQFRqE=;
 b=snL3kdqvFCql1sda9cPKjAlMXznSktxWKJld1oBfJhkqbYrJZXyjVODCCYzXxEvXuO
 oDrP7qswd7nFU4TcCJA8fH2vg+nMEbG4bcOsXNWZPWqyMTLGHYah1B6HjDO6eNLAulW7
 WFoECRBIbM8DubPDh8TaX4DxPJAHIIMuWDym8r7spWL9hvlexBHdWmPdJqsZSF4hj2yY
 CkyiuxoJT+npmY1eVC/lnsc4KxjD8+L6cgS6/5D5svUIYtYpkJTJD+XNuXGL6uod0aci
 Yz/yzNq9CuRUp53LH93KvMB0n1CWTRQOm3h+eRhGteV4yPY5cplEmOpMRiFUuieIGbwh
 quzg==
X-Gm-Message-State: AOAM532v/EupjknuIgk+4W4IKrer+SCSyVKSa7blpocKzDX2pzLKRp28
 4qblgG8GWzZcxY7GJROiSymeAA==
X-Google-Smtp-Source: ABdhPJy/y+590o2gNjxJYGxBsyrCDCJjAlhyn3lowHbtjeMwPyM7ZmlgbU+0UbEkk8HxJpyYSTPbYA==
X-Received: by 2002:adf:f212:: with SMTP id p18mr199780wro.318.1621264345118; 
 Mon, 17 May 2021 08:12:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w20sm3113683wmc.44.2021.05.17.08.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 08:12:24 -0700 (PDT)
Date: Mon, 17 May 2021 17:12:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Stop propagating fence errors by default
Message-ID: <YKKH1rRy2HN4Gnr8@phenom.ffwll.local>
References: <20210507083521.2406201-1-tvrtko.ursulin@linux.intel.com>
 <YJlXeMkMG7Xt0zlA@phenom.ffwll.local>
 <9fbcff85-f36c-fc90-eeb6-aa58c85a920f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fbcff85-f36c-fc90-eeb6-aa58c85a920f@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jason Ekstrand <jason.ekstrand@intel.com>,
 Marcin Slusarz <marcin.slusarz@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 11, 2021 at 10:05:27AM +0100, Tvrtko Ursulin wrote:
> 
> On 10/05/2021 16:55, Daniel Vetter wrote:
> > On Fri, May 07, 2021 at 09:35:21AM +0100, Tvrtko Ursulin wrote:
> > > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > 
> > > This is an alternative proposed fix for the below references bug report
> > > where dma fence error propagation is causing undesirable change in
> > > behaviour post GPU hang/reset.
> > > 
> > > Approach in this patch is to simply stop propagating all dma fence errors
> > > by default since that seems to be the upstream ask.
> > > 
> > > To handle the case where i915 needs error propagation for security, I add
> > > a new dma fence flag DMA_FENCE_FLAG_PROPAGATE_ERROR and make use of it in
> > > the command parsing chain only.
> > > 
> > > It sounds a plausible argument that fence propagation could be useful in
> > > which case a core flag to enable opt-in should be universally useful.
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > Reported-by: Marcin Slusarz <marcin.slusarz@intel.com>
> > > Reported-by: Miroslav Bendik
> > > References: 9e31c1fe45d5 ("drm/i915: Propagate errors on awaiting already signaled fences")
> > > References: https://gitlab.freedesktop.org/drm/intel/-/issues/3080
> > > Cc: Jason Ekstrand <jason.ekstrand@intel.com>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > ---
> > >   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 ++
> > >   drivers/gpu/drm/i915/i915_sw_fence.c           | 8 ++++----
> > >   drivers/gpu/drm/i915/i915_sw_fence.h           | 8 ++++++++
> > >   include/linux/dma-fence.h                      | 1 +
> > 
> > I still don't like this, least because we still introduce the concept of
> > error propagation to dma-fence (but hey only in i915 code, which is
> > exactly the kind of not-really-upstream approach we got a major chiding
> > for).
> > 
> > The only thing this does is make it explicitly opt-in instead opt-out,
> > like the first fix. The right approach is imo still to just throw it out,
> > and instead make the one error propagation we really need very, very
> > explicit. Instead of hiding it behind lots of magic.
> > 
> > The one error propagation we need is when the cmd parser work fails, it
> > must cancel it's corresponding request to make sure the batchbuffer
> > doesn't run. This should require about 2 lines in total:
> > 
> > - one line to store the request so that the cmd parser work can access it.
> >    No refcounting needed, because the the request cannot even start (much
> >    less get freed) before the cmd parser has singalled its fence
> > 
> > - one line to kill the request if the parsing fails. Maybe 2 if you
> >    include the if condition. I have no idea how that's done since I'm
> >    honestly lost how the i915 scheduler decides whether to run a batch or
> >    not. I'm guessing we have a version of this for the ringbuffer and the
> >    execlist backend (if not maybe gen7 cmdparser is broken?)
> > 
> > I don't see any need for magic behind-the-scenes propagation of such a
> > security critical error. Especially when that error propagation thing
> > caused security bugs of its own, is an i915-only feature, and not
> > motivated by any userspace/uapi requirements at all.
> 
> I took this approach because to me propagating errors sounds more logical
> than ignoring them and I was arguing in the commit message that the
> infrastructure to enable that could be put in place as opt-in.
> 
> I also do not see a lot of magic in this patch. Only thing, potentially the
> logic should be inverted so that the waiter marks itself as interested in
> receiving errors. That would probably make even more sense as a core
> concept.
> 
> Has there been a wider discussion on this topic in the past? I am curious to
> know, even if propagation currently is i915 only, could other drivers be
> interested.

There hasn't been. i915-gem team decided "this is a cool concept", which
resulted in a security bug. Now we're a few months in arguing whether a
cool-looking concept that leads to a security bug is maybe a good idea,
and whether we should sneak it in as a core concept to dma-buf.h without
any wider discussion on the concept.

> Note that it adds almost nothing to the dma-buf common code about a single
> flag, and at some point (currently missing) documentation on the very flag.

This is really not how upstream collaboration works, and it needs to stop.

If you want this, start another thread arguing why this is a good idea,
fully decoupled from the security fix here.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
