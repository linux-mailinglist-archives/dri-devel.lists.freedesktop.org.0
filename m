Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 022C73E580D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 12:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B5689F5F;
	Tue, 10 Aug 2021 10:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824A5896EB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 10:13:20 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso1538004wmq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 03:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=O1MLfh0EJ0XIFN1iBr0ImL0ctyq/++4YsTEh2RRbnRw=;
 b=D/Hs021oHkM9eZC3zomAZqXWZZFaXZt4M7OJTSM2t9I8bjjNsNBPlAjaNZuE/A1M/6
 Sr9Nj6Hb18xqTvQ7zZiZthj9JWINbBuLc65eIyAg8WQGDdXJxZQtxWFaEKlomDpyrK5s
 BHQy+NFspqTawJmvOlBiP2HWZOFoWndmvt5m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=O1MLfh0EJ0XIFN1iBr0ImL0ctyq/++4YsTEh2RRbnRw=;
 b=M3sm7D07xOxktwTLyj0voJpS0dWnR5TxuU+woOAy13Vtu1nwZgL7ZcBltxYU8TQ6jm
 XlIyWT132Y7M7aTTy/ndx443PERDml0BpZ6ynwbIjlEZHx1xOTybuN8ycVFnxGTpzn35
 41Gqma+Oup/Vg7u3TJqoFSI+6VBaC4/BTR3T9JE11ahr+FzmNxTStWpFV+NArPsCryDa
 JPwRoXUID5kJDx63MInAgttBPFhddYXW2R27W8rWkwLT7fyQRoGgILx5mJfsqREsbqfq
 le72Ug+UGWPrl0t/hMlYB8Fgp+nMgf8w2QpaT/nWQ1GwAhCWaNA7WKN06y7ZLoNDmq3p
 7kpw==
X-Gm-Message-State: AOAM533CS5Qe9q/MbfgxyblFdW9H0juOioUaSGDodgmggf7KhmFvss7T
 Xee7T7rSxs/up2Y+/81x4oxplw==
X-Google-Smtp-Source: ABdhPJxGUmx78Md/8qtPrEerlZ00v/dk7myfhVZBcE0CM2bglCRB1ao0nIHbgqDtmiRmjsuX4FGzTA==
X-Received: by 2002:a1c:f203:: with SMTP id s3mr3725493wmc.138.1628590398852; 
 Tue, 10 Aug 2021 03:13:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a11sm8546197wrw.67.2021.08.10.03.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 03:13:18 -0700 (PDT)
Date: Tue, 10 Aug 2021 12:13:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH] drm/i915: Release ctx->syncobj on final put, not on ctx
 close
Message-ID: <YRJRPFGNQzp0r7Ab@phenom.ffwll.local>
References: <20210806201852.1345184-1-daniel.vetter@ffwll.ch>
 <17b2342e218.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <CAKMK7uF+Q9s5WkN_aJxNWp5Xajcv3=ooDZhq09Hbsg-nr-AWyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKMK7uF+Q9s5WkN_aJxNWp5Xajcv3=ooDZhq09Hbsg-nr-AWyA@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 09, 2021 at 08:47:14PM +0200, Daniel Vetter wrote:
> On Sun, Aug 8, 2021 at 2:56 AM Jason Ekstrand <jason@jlekstrand.net> wrote:
> >
> > On August 6, 2021 15:18:59 Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> >> gem context refcounting is another exercise in least locking design it
> >> seems, where most things get destroyed upon context closure (which can
> >> race with anything really). Only the actual memory allocation and the
> >> locks survive while holding a reference.
> >>
> >> This tripped up Jason when reimplementing the single timeline feature
> >> in
> >>
> >> commit 00dae4d3d35d4f526929633b76e00b0ab4d3970d
> >> Author: Jason Ekstrand <jason@jlekstrand.net>
> >> Date:   Thu Jul 8 10:48:12 2021 -0500
> >>
> >>     drm/i915: Implement SINGLE_TIMELINE with a syncobj (v4)
> >>
> >> We could fix the bug by holding ctx->mutex, but it's cleaner to just
> >
> >
> > What bug is this fixing, exactly?
> 
> Oh lol I was all busy ranting and not explaining :-) I found it while
> auditing other context stuff, so that other patch has the longer
> commit message with more history, but that patch is also now tied into
> the vm-dercuify, so short summary: You put the syncobj in context
> close (i.e. CTX_DESTRY ioctl or close(drmfd)), not in the final
> kref_put. Which means you're open to a use-after-free if you race
> against an execbuf. ctx->vm is equally broken (but for other ioctl),
> once this fix here is merged I send out the ctx->vm fix because that's
> tied into the vm-dercuify now due to conflicts.

CI caught more, so just explaining what I'm fixing here isn't going to be
enough.

The troubel is that drm_syncobj_put is now called from very awkward
places, and I need to see whether we can fix that. Or whether we need more
work_struct (like we have already for i915_address_space) for the final
release.
-Daniel

> -Daniel
> 
> >
> > --Jason
> >
> >>
> >> make the context object actually invariant over its _entire_ lifetime.
> >>
> >> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >> Fixes: 00dae4d3d35d ("drm/i915: Implement SINGLE_TIMELINE with a syncobj (v4)")
> >> Cc: Jason Ekstrand <jason@jlekstrand.net>
> >> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> >> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> >> Cc: Matthew Brost <matthew.brost@intel.com>
> >> Cc: Matthew Auld <matthew.auld@intel.com>
> >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> Cc: "Thomas Hellström" <thomas.hellstrom@intel.com>
> >> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> >> Cc: Dave Airlie <airlied@redhat.com>
> >> ---
> >>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >> index 754b9b8d4981..93ba0197d70a 100644
> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >> @@ -940,6 +940,9 @@ void i915_gem_context_release(struct kref *ref)
> >>   trace_i915_context_free(ctx);
> >>   GEM_BUG_ON(!i915_gem_context_is_closed(ctx));
> >>
> >> + if (ctx->syncobj)
> >> + drm_syncobj_put(ctx->syncobj);
> >> +
> >>   mutex_destroy(&ctx->engines_mutex);
> >>   mutex_destroy(&ctx->lut_mutex);
> >>
> >> @@ -1159,9 +1162,6 @@ static void context_close(struct i915_gem_context *ctx)
> >>   if (vm)
> >>   i915_vm_close(vm);
> >>
> >> - if (ctx->syncobj)
> >> - drm_syncobj_put(ctx->syncobj);
> >> -
> >>   ctx->file_priv = ERR_PTR(-EBADF);
> >>
> >>   /*
> >> --
> >> 2.32.0
> >
> >
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
