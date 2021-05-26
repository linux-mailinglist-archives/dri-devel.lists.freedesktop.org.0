Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B261839176F
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 14:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48676ECD4;
	Wed, 26 May 2021 12:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A826ECD4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 12:35:57 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so853548otg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 05:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K6Wpb6ZjnWL6SWLZ+QG1mWjpjnOeak4wdhD3+uKGd0g=;
 b=gRKj67vuDwcrKD4lLIZT2fFpRr5ZeDso7Kal+dVu7AhkIjsyMMMudJWEQ0Dowg5fU7
 W2GFrVskaQqIho5Jnh/9lTestg8ig01AwuUxyTiXhrKFIDkGZcUudt4hW9VojOBJyn+c
 zBw6lPLijiMj8R5hk9Dqh8Nt0UB86iGL8jTyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K6Wpb6ZjnWL6SWLZ+QG1mWjpjnOeak4wdhD3+uKGd0g=;
 b=I08ph2gnazqHrFBKGNzgTmEngwg/gd7CYxDgIIWHUaHyPi4T3BwDX+EjgJg5+I41YZ
 J08MNDeyXy6+SbeynKrSsvxZOPlwvgzPpvhLYQo9YhWYdh4wpdHDrj8QSPZkM63vguNC
 WrO0FSkoAWZaGZgoWY/BRqVR4mSDiPsTIvKDylRQNy0EcTKkYr/xUWWsQnlyCJUzrctZ
 YIR3M3myCS9ddOoftKfjdHr+wr6OHd5Uii6BaKu0w5O7wSzQydvJNW8fJrTlNVzb4gDU
 TGY/XsSvvidxL5EByqvf/G+8C54JnV0Kcdcr9uS1WgJ/Nlme3ocbg5a4XsA8c5uTJBrz
 7SzQ==
X-Gm-Message-State: AOAM532izRCcmn25RLo650s47bQoiMHsF2IsuR3A76BEhE9FBoaWG8h9
 MLXop8BDgccOsdiKGWD4gK5dOGQc0Sglsxov2lNuA5R5Y7k=
X-Google-Smtp-Source: ABdhPJyv9Z0+5kGu9jOVNmYaBHMUsk0X0dmRrgJ5jGILJOOOommGfGtwsFz/Mi9fcx7spPfEe+/aHXUYJe8AWkPKX6s=
X-Received: by 2002:a05:6830:1155:: with SMTP id
 x21mr2121679otq.303.1622032557173; 
 Wed, 26 May 2021 05:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-5-jason@jlekstrand.net>
 <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
 <CAOFGe97b-djqwV95Y91xe9-ZVUyeGqjdPE8vj7MoSfV0Kcrp1Q@mail.gmail.com>
 <CAPj87rNJTHNKkdiZREVb8v6iiwUhYLXW10pjVOdV=zttd+tG3Q@mail.gmail.com>
In-Reply-To: <CAPj87rNJTHNKkdiZREVb8v6iiwUhYLXW10pjVOdV=zttd+tG3Q@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 26 May 2021 14:35:45 +0200
Message-ID: <CAKMK7uHqxLe_CH_cOjfy-rouYcxwg=n6AkkxprzAKnb-y_A3NQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] RFC: dma-buf: Add an API for importing sync files (v6)
To: Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 26, 2021 at 1:09 PM Daniel Stone <daniel@fooishbar.org> wrote:
>
> Hey,
>
> On Mon, 24 May 2021 at 18:11, Jason Ekstrand <jason@jlekstrand.net> wrote:
> > On Sat, May 22, 2021 at 3:05 PM Daniel Stone <daniel@fooishbar.org> wrote:
> > > So far, so good. I really like both your series up until this
> > > narrative point; as I was saying in the userspace-fence thread, the
> > > WSI<->client thread is certainly pulling a very big lever with a
> > > heavyweight transition between the two different worlds, and I like
> > > that the new export ioctl lets us be very clear about what exactly is
> > > happening under the hood. Good stuff.
> >
> > Glad to hear.  If you turned that into RBs on the first three patches
> > in this series and all but the last patch on the Mesa MR, it'd make me
> > even happier. :-D
> >
> > At this point, I think everyone is pretty happy with the first three
> > patches and the export ioctl.  In the Vulkan WSI code, it solves a
> > significant over-synchronization issue for ANV.  Also, the uAPI
> > shouldn't be controversial at all because it's identical to poll()
> > except that it gives you a FD you can poll on later to get the result
> > of the poll as it would be now.  I think if we get some Mesa reviews,
> > we should be able to land those.  It's import that's trickier.
>
> Agree. Have a few more burning things on my list (not least fd.o infra
> this week) but will get to it so we can land.
>
> (Clarified on IRC that my description above was accurate to the best
> of our shared understanding, so we're all on the same page here.)

fd.o work is much appreciated!

> > > That makes sense to me and is nicely symmetrical, plus it gets GPU
> > > drivers further out of the business of doing magic winsys/display
> > > synchronisation, which is good. But why enforce that imported fences
> > > have to go into the exclusive slot? It makes sense from the point of
> > > view of clients doing QueueSubmit, but I think it might preclude other
> > > uses for no particularly good reason.
> >
> > Mostly, I was trying to limit the scope a bit.  Import is tricky and,
> > to be honest, I'm still not 100% sure that it's safe.  I probably
> > should have left RFC on this patch.
> >
> > As long as we keep everything inside the kernel, there's a requirement
> > that any work which triggers any fence on a dma_resv waits on the
> > exclusive fence, if any.  Work which sets the exclusive fence has to
> > wait on all fences.  With the import ioctl, we can guarantee that the
> > fences fire in the right order by making an array fence containing the
> > new fence and all other fences and using that as the exclusive fence.
> > What we can't do, however, is ensure that the work which triggers the
> > fence actually blocks on ANY of the fences on the dma_resv.
> >
> > Hrm... I think I've now convinced myself that importing shared fences
> > is no more dangerous than importing an exclusive fence because they
> > share the same set of problems.  Unfortunately, I've unconvinced
> > myself of the safety of either.  I've got to think some more....
> >
> > The most convincing argument I can make to myself is that this ioctl
> > is like having a one-shot little queue that contains tiny little work
> > jobs which wait on whatever sync_file you provide, do nothing, and
> > then signal.  That should be safe, right?
>
> Yeah, I don't think there's any difference between shared and
> exclusive wrt safety. The difference lies in, well, exclusive putting
> a hard serialisation barrier between everything which comes before and
> everything that comes after, and shared being more relaxed to allow
> for reads to retire in parallel.
>
> As said below, I think there's a good argument for the latter once you
> get out of the very straightforward uses. One of the arguments for
> these ioctls is to eliminate oversync, but then the import ioctl
> mandates oversync in the case where the consumer only does
> non-destructive reads - which is the case for the vast majority of
> users!

Just wanted to comment on this: Right now we attach always attach a
shared end-of-batch fence to every dma_resv. So reads are
automatically and always synced. So in that sense having an explicit
ioct to set the read fence is not really useful, since at most you
just make everything worse.

Until we have userspace memory this is also pretty much guaranteed to
stay like that, except if we maybe split up the shared fences into
"relevant for implicit sync" and "not so relevant for implicit sync".
amdgpu has an interesting model there with only engaging in implicit
sync if it's a fence from a different drm_file (but they lack the
distinction between read/write and oversync due to that in other
cases, oops). I haven't wrapped my head around how to glue those two
approaches together.

So anyway right now all we really have on the table for explicit
control of the implicit fences is really just:
- should I stall for the exclusive fence/all fences/not at all
- should I set the exclusive fence

And from my additional auditing this week we already have plenty of
small bugs in this area :-( So lifting restrictions more on what you
can do with handling implicit fences more explicitly is going to be
major surgery ... Implicit fencing is bound to stay a very funny IPC
for fences for quite some time I think.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
