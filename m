Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B293835DC5F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 12:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506A489F73;
	Tue, 13 Apr 2021 10:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E2A6E2B6
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 10:19:09 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id l131so11451697oih.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 03:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RbiNLZ7o/dsNK5HIgVqIuW0ZuSfjH0LlwngZuREvWqk=;
 b=cqw2pGrQ/cM6PxRd3RUABRVmezTQ8abfOSzJ22kbr9jdzfpgcOn7gC+UpNOPVHMFai
 +zDmZ8NXvXWcp8KlJHs203CI1p2l+M2pkjywROu7heTRI8yKBOLtfilmhFNH9tSwjla4
 1LG2vQ71hSOY+qg+32lZAtt03hAt0gs/TjM10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RbiNLZ7o/dsNK5HIgVqIuW0ZuSfjH0LlwngZuREvWqk=;
 b=B3PbYG2RWAtQv32a3NPAqmfiORg5rcqdTSlGos/ThT3qPc6NTMZ89733wcmTLHIdla
 KThH6VDdTxFLyfk/KnzznqgAUaY5gg5Cg/5YGAFcKon8wJGjVQhJwWyRmdmYUinhUyqk
 I++XbVFu6c3os9B9l81KeyhZIGbG3ZEbcsFSOwypN91YMPHxWrrswlcyFCJNpE0qg7BS
 TRUip3dt06+X4d2zmpMEmaHugyUlu0QQfyoAQG3YpBztNfNmZA8cWHlyQcwD3og/L0/B
 YdB8L/9rG8sKhZRqe7H76vmJK6jF6mNBgmp3WuNYgaM/ByJm/eIqf5oBMzSCytuOiJd/
 yccw==
X-Gm-Message-State: AOAM530zZ7M7Hd0c+nj75x39gaHxPSNNItiS/23anpfT++2yHR6HNTHk
 FT7Tf+nnlPnkZbreamcJK7gp7Nd/TnvStAUY21MHWg==
X-Google-Smtp-Source: ABdhPJy7ZDf0BPNHIS6TWDS2y9jGpGuPIOVDBtIMxj3igFFl6eOaHK8v+MLTYZEfQdAG/IiUc5SCmWPKJlRvlLGNdfg=
X-Received: by 2002:aca:4188:: with SMTP id o130mr2734260oia.101.1618309148398; 
 Tue, 13 Apr 2021 03:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-19-matthew.auld@intel.com>
 <YHRkixaDBaf5cgkJ@phenom.ffwll.local>
 <CAM0jSHM_1V6OSZhuuaaAMmHi4BTiZ7Hbo99i2b=RzFFBMuYJ_A@mail.gmail.com>
 <CAKMK7uFK5_4cbWeefjvXzfnHXsTh1OCtWSyLHUy5QhiFfwMf1A@mail.gmail.com>
 <CAM0jSHP=xA0taPVVr5Fa5O9rMEv-upr_or_c2QbRO2MhNGEBCw@mail.gmail.com>
In-Reply-To: <CAM0jSHP=xA0taPVVr5Fa5O9rMEv-upr_or_c2QbRO2MhNGEBCw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 13 Apr 2021 12:18:57 +0200
Message-ID: <CAKMK7uESFPMOd=ysUaMzVbijAeROYjYr67JRDGxPYeeM1iVuWg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 18/19] drm/i915/gtt: map the PD up front
To: Matthew Auld <matthew.william.auld@gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 13, 2021 at 11:29 AM Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Mon, 12 Apr 2021 at 18:01, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Apr 12, 2021 at 6:08 PM Matthew Auld
> > <matthew.william.auld@gmail.com> wrote:
> > >
> > > On Mon, 12 Apr 2021 at 16:17, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Mon, Apr 12, 2021 at 10:05:25AM +0100, Matthew Auld wrote:
> > > > > We need to general our accessor for the page directories and tables from
> > > > > using the simple kmap_atomic to support local memory, and this setup
> > > > > must be done on acquisition of the backing storage prior to entering
> > > > > fence execution contexts. Here we replace the kmap with the object
> > > > > maping code that for simple single page shmemfs object will return a
> > > > > plain kmap, that is then kept for the lifetime of the page directory.
> > > > >
> > > > > v2: (Thomas) Rebase on dma_resv and obj->mm.lock removal.
> > > > >
> > > > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > >
> > > > So I wanted to understand what px stands for as an abbreviation, and dug
> > > > all the way down to this:
> > > >
> > > > commit 567047be2a7ede082d29f45524c287b87bd75e53
> > > > Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > > > Date:   Thu Jun 25 18:35:12 2015 +0300
> > > >
> > > >     drm/i915/gtt: Use macros to access dma mapped pages
> > > >
> > > > I still have no idea what it means, I guess px = page. But I also
> > > > committed this, so I guess can blame myself :-)
> > > >
> > > > But while digging I've stumbled over this here
> > > >
> > > > commit 6eebfe8a10a62139d681e2f1af1386252742278b
> > > > Author: Chris Wilson <chris@chris-wilson.co.uk>
> > > > Date:   Fri Jul 12 08:58:18 2019 +0100
> > > >
> > > >     drm/i915/gtt: Use shallow dma pages for scratch
> > > >
> > > >
> > > > And that's some serious wtf. Yes we've done some compile-time type
> > > > casting automagic between i915_priv and dev in the past, and I think even
> > > > that was bad taste. But it was justified with that we have these
> > > > everywhere (especially in the mmio macros), and it would be a terrible
> > > > flag day.
> > > >
> > > > But I'm not seeing any need for auto-casting for these pages here, and I'm
> > > > not aware that we're doing this anywhere else in kernel code. There is
> > > > some macro-trickery in lockdep annotations, but that relies on the lockdep
> > > > map having the same struct member name in all lock types, and is not
> > > > exposed to drivers at all.
> > > >
> > > > Am I missing something, or why do we have this compile-time type casting
> > > > stuff going on in i915 page accessors?
> > >
> > > I think 'x' in the px family of macros/functions is meant in the
> > > variable/polymorphic sense, so it can potentially be a pt, pd, etc
> > > underneath. If you look at px_base() for example all it does is fish
> > > out the base GEM object from the structure, using the
> > > known-at-compile-time-type, which then lets us get at the dma address,
> > > vaddr etc.
> >
> > Yeah, but that's not how things landed. px predates the magic
> > polymorphism. I think the px just stands for page, or at least
> > originally only stood for page. I'm not sure honestly. It seems to be
> > just used for page directory type of things, but I haven't found that
> > written down anywhere.
> >
> > > It does seem pretty magical, but seems ok to me, if it means less typing?
> >
> > That's the worst justification. Code is generally write once, read
> > many times. Optimizing for writing at the cost of magic indirection is
> > generally not the right tradeoff in the kernel, where any indirection
> > could hide a major gotcha. In huge userspace applications fancy
> > abstraction and polymorphism is often the right thing to do, but there
> > you also have a real compiler with a real typesystem (generally at
> > least) helping you out. Or it's yolo duct-taping with lots of tests,
> > where the speed at which you can hack up something matters more than
> > being able to read it quickly.
> >
> > We're typing C here. It is generally rather verbose, with type casting
> > all done explicitly.
>
> Ok. So should we change this around for this patch? The px_ stuff is
> already quite prevalent it seems, and the px_vaddr() is just one part
> of it? Maybe just add pt_vaddr(), pd_vaddr() etc instead?

Nah, that was just an orthogonal observation. The confusion with magic
type-aware macros is preexisting and widespread, there's no point
holding up dg1 code with that. But it is maybe something we should put
on our cleanup list. Or at least have a better explanation for why
exactly it is needed. Also note I'm not worried about the px stuff
standing for pt/pd/whatever, it's the magic type casting property of
these macros added with the 2nd patch I've mentioned above that looks
rather questionable to me. Maybe as transition thing like we've done
with i915_priv pointers, but not something that we should build on top
for long term.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
