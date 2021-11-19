Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342684575A1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 18:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164606E13C;
	Fri, 19 Nov 2021 17:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B169F6E108
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 17:38:25 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so8099612wmz.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 09:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QFpCALERPLqfyWIPEWHUielSsXN2GqJQw3MaEqCwP4A=;
 b=D9y+NA/42gu/wBvYqo5qUcX4cqJ1lWvopZMfEJfuys+W1eLvVBL/sC2u8Nf3McrVKa
 L3AdE/Fey4OdpeAA84AM02qr2ufUvElCLX+Ed+mKJatmDMMCoQQiu5xo+qNMdwPAUql5
 mK2QDusD/zJxECexR1+Z8+ihQF4xWybuyAk7KgAMyD8YpAII/G4crweh4aZywhKwaHMW
 oK22Eri16n+jwkiDoX3mqOUzYV28OKWtBpwJ4s4aGoAkM0zOjRcsxqGqlD11xgWBXfI+
 nZeAryZ4BrsGgmFQzBiAlB41oQlUyIseawZ4u1ExIhMAZQR17gvYc3iByYt2F8LCAQD7
 0yLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QFpCALERPLqfyWIPEWHUielSsXN2GqJQw3MaEqCwP4A=;
 b=1BXGu96NgNJ21baltUJWZfBpTGJHagUTee4z1aELJm6F/AUPiOZLBv28oZZN9m4y/X
 BqK+HVuHwXFHZd3TlrxyObq1wX/AImkYgI/EpxG9b0z3LTGjlxAhVh0CYeSWMdOHDh9k
 zjV/lp/KLKW/wUmRAuh8Nh0AeQtuojxSDEI/2TG3TGsnL2YS5ucU8ZUmLhMKPtGfOSWo
 +DXJjtlhBlMhJC+MriJCDxzCVLs1EAmtl7UC+9+2g91uN7I2fAX7TxS/hEWJ49/gcvOp
 e4uqw7hmPW54I2ixOjdHBCcCL8Eu9djdstLU2dWJW8zKM1/+L1MIUboMaeOmgdRLGbNl
 4yyw==
X-Gm-Message-State: AOAM533S5CxulrVLjC7zM+Gq7jjwhpjcDJdVF+mEuW89IHqbmQ9JPa59
 GnIZf0WaQck7ARgpwL1dGGTupSqk4lnAL7ARKX8=
X-Google-Smtp-Source: ABdhPJxaRxLo9rgoqoQ6Fp/m/ehf2LYRL4rokFlZD+kzEpWjH2Ua+WcEDW7BBfFTZ1HK2VzrnXklpGRbtL+q71yRR1E=
X-Received: by 2002:a1c:790d:: with SMTP id l13mr1734852wme.101.1637343504222; 
 Fri, 19 Nov 2021 09:38:24 -0800 (PST)
MIME-Version: 1.0
References: <20210921232024.817-1-gurchetansingh@chromium.org>
 <20210921232024.817-12-gurchetansingh@chromium.org>
 <YY/RBOdU6+SgbRrq@kroah.com> <YZJrutLaiwozLfSw@phenom.ffwll.local>
 <bc799da264c045fb9ad9ccad5dfba631@intel.com>
 <YZPRhZDcU3/VYWgb@phenom.ffwll.local>
 <CAAfnVBms1Bi8MnaCZVv=4dgoG+REVzZ-zFq-hRQ-4tCzYBrDdA@mail.gmail.com>
 <YZYUjh73sPYISNKc@phenom.ffwll.local>
In-Reply-To: <YZYUjh73sPYISNKc@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 19 Nov 2021 09:43:28 -0800
Message-ID: <CAF6AEGt5MiX7=Cf_zmDfW0pCM5OvSM9eTvWsubyRqmi+-bXi1g@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] drm/virtio: implement context init: add
 virtio_gpu_fence_event
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
 Greg KH <gregkh@linuxfoundation.org>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 18, 2021 at 12:53 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Nov 16, 2021 at 06:31:10PM -0800, Gurchetan Singh wrote:
> > On Tue, Nov 16, 2021 at 7:43 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > > On Mon, Nov 15, 2021 at 07:26:14PM +0000, Kasireddy, Vivek wrote:
> > > > Hi Daniel, Greg,
> > > >
> > > > If it is the same or a similar crash reported here:
> > > >
> > > https://lists.freedesktop.org/archives/dri-devel/2021-November/330018.html
> > > > and here:
> > > https://lists.freedesktop.org/archives/dri-devel/2021-November/330212.html
> > > > then the fix is already merged:
> > > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d89c0c8322ecdc9a2ec84b959b6f766be082da76
> >
> > Yeah but that still leaves the problem of why exaxtly virtgpu is
> > > reinventing drm_poll here?
> >
> >
> > > Can you please replace it with drm_poll like all other drivers, including
> > > the ones that have private events?
> > >
> >
> > Hi Daniel,
> >
> > Allow me to explain the use case a bit.  It's for when virtgpu KMS is not
> > used, but a special Wayland compositor does wayland passthrough instead:
> >
> > https://www.youtube.com/watch?v=WwrXqDERFm8https://www.youtube.com/watch?v=EkNBsBx501Q
> >
> > This technique has gained much popularity in the virtualized laptop
> > space, where it offers better performance/user experience than virtgpu
> > KMS.  The relevant paravirtualized userspace is "Sommelier":
> >
> > https://chromium.googlesource.com/chromiumos/platform2/+/main/vm_tools/sommelier/
> > https://chromium.googlesource.com/chromiumos/platform2/+/main/vm_tools/sommelier/virtualization/virtgpu_channel.cc
> >
> > Previously, we were using the out-of-tree virtio-wl device and there
> > were many discussions on how we could get this upstream:
> >
> > https://lists.freedesktop.org/archives/dri-devel/2017-December/160309.html
> > https://lists.oasis-open.org/archives/virtio-dev/202002/msg00005.html
> >
> > Extending virtgpu was deemed the least intrusive option:
> >
> > https://www.spinics.net/lists/kvm/msg159206.html
> >
> > We ultimately settled on the context type abstraction and used
> > virtio_gpu_poll to tell the guest "hey, we have a Wayland event".  The
> > host response is actually in a buffer of type BLOB_MEM_GUEST.
> >
> > It is possible to use drm_poll(..), but that would have to be
> > accompanied by a drm_read(..).  You'll need to define a dummy
> > VIRTGPU_EVENT_FENCE_SIGNALED in the uapi too.
> >
> > That's originally how I did it, but some pointed out that's
> > unnecessary since the host response is in the BLOB_MEM_GUEST buffer
> > and virtgpu event is a dummy event.  So we decided just to modify
> > virtio_gpu_poll(..) to have the desired semantics in that case.
> >
> > For the regular virtio-gpu KMS path, things remain unchanged.
> >
> > There are of course other ways to do it (perhaps polling a dma_fence),
> > but that was the cleanest way we could find.
> >
> > It's not rare for virtio to "special things" (see virtio_dma_buf_ops,
> > virtio_dma_ops), since they are in fake devices.
>
> These are all internal interfaces, not uapi.
>
> > We're open to other ideas, but hopefully that answers some of your
> > questions.
>
> Well for one, why does the commit message not explain any of this. You're
> building uapi, which is forever, it's paramount all considerations are
> properly explained.
>
> Second, I really don't like that youre redefining poll semantics in
> incompatible ways from all other drm drivers. If you want special poll
> semantics then just create a sperate fd for that (or a dma_fence or
> whatever, maybe that saves some typing), but bending the drm fd semantics
> is no good at all. We have tons of different fd with their dedicated
> semantics in drm, trying to shoehorn it all into one just isn't very good
> design.
>
> Or do the dummy event which is just the event code, but does not contain
> any data. Either is fine with me.
>
> Can you pls do this asap? I really don't want to bake this in as uapi
> which we then have to quirk and support forever. I'd say revert for -rc2
> of these two and then maybe sort it out properly in -next.

I think as a general rule, if there is not consensus about uabi
change, even if it is just a semantic change, then revert and reland
later is ok..

As far as dummy VIRTGPU_EVENT_FENCE_SIGNALED.. that doesn't entirely
sound like a bad thing to me.  Actually, it sounds like a good thing..
it makes it more explicit what is going on.  And would avoid confusing
a different userspace polling for kms related events expecting to be
able to do a read.

BR,
-R

> Cheers, Daniel
> >
> >
> > > Thanks, Daniel
> > >
> > > >
> > > > Thanks,
> > > > Vivek
> > > >
> > > > > On Sat, Nov 13, 2021 at 03:51:48PM +0100, Greg KH wrote:
> > > > > > On Tue, Sep 21, 2021 at 04:20:23PM -0700, Gurchetan Singh wrote:
> > > > > > > Similar to DRM_VMW_EVENT_FENCE_SIGNALED.  Sends a pollable event
> > > > > > > to the DRM file descriptor when a fence on a specific ring is
> > > > > > > signaled.
> > > > > > >
> > > > > > > One difference is the event is not exposed via the UAPI -- this is
> > > > > > > because host responses are on a shared memory buffer of type
> > > > > > > BLOB_MEM_GUEST [this is the common way to receive responses with
> > > > > > > virtgpu].  As such, there is no context specific read(..)
> > > > > > > implementation either -- just a poll(..) implementation.
> > > > > > >
> > > > > > > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > > > > > > Acked-by: Nicholas Verne <nverne@chromium.org>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/virtio/virtgpu_drv.c   | 43
> > > +++++++++++++++++++++++++-
> > > > > > >  drivers/gpu/drm/virtio/virtgpu_drv.h   |  7 +++++
> > > > > > >  drivers/gpu/drm/virtio/virtgpu_fence.c | 10 ++++++
> > > > > > >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 34 ++++++++++++++++++++
> > > > > > >  4 files changed, 93 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > This commit seems to cause a crash in a virtual drm gpu driver for
> > > > > > Android.  I have reverted this, and the next commit in the series
> > > from
> > > > > > Linus's tree and all is good again.
> > > > > >
> > > > > > Any ideas?
> > > > >
> > > > > Well no, but also this patch looks very questionable of hand-rolling
> > > > > drm_poll. Yes you can do driver private events like
> > > > > DRM_VMW_EVENT_FENCE_SIGNALED, that's fine. But you really should not
> > > need
> > > > > to hand-roll the poll callback. vmwgfx (which generally is a very old
> > > > > driver which has lots of custom stuff, so not a great example) doesn't
> > > do
> > > > > that either.
> > > > >
> > > > > So that part should go no matter what I think.
> > > > > -Daniel
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> > >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
