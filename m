Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27014455765
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 09:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B4E6EB6B;
	Thu, 18 Nov 2021 08:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1526EB3C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 08:53:38 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id e3so23733231edu.4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 00:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iszLrNwG8iKTPExf+jY9k4kG3nN1d43+5rl2AJXa4oA=;
 b=YmVeO/pukl/HkDM3AM0NUli//jwQqFdRLaQpaTOhgUyJifPDPajzbPtzC4sCpd+Nwh
 4NB4z554Cwyy9svCh26o5vcJEOwjTuZUFfQd8BSlFHMTNR7ZTUPGpfql4h+vbsPUlW11
 p90uGBLNS5XwsJSIYC7teAEgXRN5tlQGA9mA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iszLrNwG8iKTPExf+jY9k4kG3nN1d43+5rl2AJXa4oA=;
 b=xTttzywv6s9NfTqQ+QmbXF1LuO5yWhuSut1z7Tx9KIjb6apGsjBJYA4iFOb76sUWtI
 8Xe424DTFs0H5fs022oV79zw4poj+OL/7iVFgJb2aEYvgRL04Tp2qQItCpSBQNQdWMBn
 jzeBJ5/sH101SmcaiDuPDeg3XYJOsJpQy1FaIw/oW52voaH3GOMfFy3p7xhkl/ApjzUH
 dVbFD9Kgb/EBAFWF7DybR6fv5G/REzHvJDwPNc1Vw4co9MXMjtk7mXS+K9aiOyaVhp6v
 tJib6k9vZiezRjAVKCJoOzB6i4d/Mj+cJx23wPCgahsM0fplRI7TZG5vQrfKVDpj22ld
 /fMQ==
X-Gm-Message-State: AOAM533iDbXgFTOcimCdTMwYJ3gLgiXCoclRjIt1cboQzgQ659zTnNPg
 Pdr3p04RE3/3mc92znh67+a9rQ==
X-Google-Smtp-Source: ABdhPJwmIhKAToYuyvvvTXPNLlsvdp0r/0R4/Vb/lOSXYB6Lk2B1RGOG1TjkzutPhgPb9H0ya3XRyg==
X-Received: by 2002:a17:907:c15:: with SMTP id
 ga21mr30487840ejc.349.1637225616577; 
 Thu, 18 Nov 2021 00:53:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s4sm1049522ejn.25.2021.11.18.00.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 00:53:35 -0800 (PST)
Date: Thu, 18 Nov 2021 09:53:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH v3 11/12] drm/virtio: implement context init: add
 virtio_gpu_fence_event
Message-ID: <YZYUjh73sPYISNKc@phenom.ffwll.local>
References: <20210921232024.817-1-gurchetansingh@chromium.org>
 <20210921232024.817-12-gurchetansingh@chromium.org>
 <YY/RBOdU6+SgbRrq@kroah.com> <YZJrutLaiwozLfSw@phenom.ffwll.local>
 <bc799da264c045fb9ad9ccad5dfba631@intel.com>
 <YZPRhZDcU3/VYWgb@phenom.ffwll.local>
 <CAAfnVBms1Bi8MnaCZVv=4dgoG+REVzZ-zFq-hRQ-4tCzYBrDdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAfnVBms1Bi8MnaCZVv=4dgoG+REVzZ-zFq-hRQ-4tCzYBrDdA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
 "kraxel@redhat.com" <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 06:31:10PM -0800, Gurchetan Singh wrote:
> On Tue, Nov 16, 2021 at 7:43 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Mon, Nov 15, 2021 at 07:26:14PM +0000, Kasireddy, Vivek wrote:
> > > Hi Daniel, Greg,
> > >
> > > If it is the same or a similar crash reported here:
> > >
> > https://lists.freedesktop.org/archives/dri-devel/2021-November/330018.html
> > > and here:
> > https://lists.freedesktop.org/archives/dri-devel/2021-November/330212.html
> > > then the fix is already merged:
> > >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d89c0c8322ecdc9a2ec84b959b6f766be082da76
> 
> Yeah but that still leaves the problem of why exaxtly virtgpu is
> > reinventing drm_poll here?
> 
> 
> > Can you please replace it with drm_poll like all other drivers, including
> > the ones that have private events?
> >
> 
> Hi Daniel,
> 
> Allow me to explain the use case a bit.  It's for when virtgpu KMS is not
> used, but a special Wayland compositor does wayland passthrough instead:
> 
> https://www.youtube.com/watch?v=WwrXqDERFm8https://www.youtube.com/watch?v=EkNBsBx501Q
> 
> This technique has gained much popularity in the virtualized laptop
> space, where it offers better performance/user experience than virtgpu
> KMS.  The relevant paravirtualized userspace is "Sommelier":
> 
> https://chromium.googlesource.com/chromiumos/platform2/+/main/vm_tools/sommelier/
> https://chromium.googlesource.com/chromiumos/platform2/+/main/vm_tools/sommelier/virtualization/virtgpu_channel.cc
> 
> Previously, we were using the out-of-tree virtio-wl device and there
> were many discussions on how we could get this upstream:
> 
> https://lists.freedesktop.org/archives/dri-devel/2017-December/160309.html
> https://lists.oasis-open.org/archives/virtio-dev/202002/msg00005.html
> 
> Extending virtgpu was deemed the least intrusive option:
> 
> https://www.spinics.net/lists/kvm/msg159206.html
> 
> We ultimately settled on the context type abstraction and used
> virtio_gpu_poll to tell the guest "hey, we have a Wayland event".  The
> host response is actually in a buffer of type BLOB_MEM_GUEST.
> 
> It is possible to use drm_poll(..), but that would have to be
> accompanied by a drm_read(..).  You'll need to define a dummy
> VIRTGPU_EVENT_FENCE_SIGNALED in the uapi too.
> 
> That's originally how I did it, but some pointed out that's
> unnecessary since the host response is in the BLOB_MEM_GUEST buffer
> and virtgpu event is a dummy event.  So we decided just to modify
> virtio_gpu_poll(..) to have the desired semantics in that case.
> 
> For the regular virtio-gpu KMS path, things remain unchanged.
> 
> There are of course other ways to do it (perhaps polling a dma_fence),
> but that was the cleanest way we could find.
> 
> It's not rare for virtio to "special things" (see virtio_dma_buf_ops,
> virtio_dma_ops), since they are in fake devices.

These are all internal interfaces, not uapi.

> We're open to other ideas, but hopefully that answers some of your
> questions.

Well for one, why does the commit message not explain any of this. You're
building uapi, which is forever, it's paramount all considerations are
properly explained.

Second, I really don't like that youre redefining poll semantics in
incompatible ways from all other drm drivers. If you want special poll
semantics then just create a sperate fd for that (or a dma_fence or
whatever, maybe that saves some typing), but bending the drm fd semantics
is no good at all. We have tons of different fd with their dedicated
semantics in drm, trying to shoehorn it all into one just isn't very good
design.

Or do the dummy event which is just the event code, but does not contain
any data. Either is fine with me.

Can you pls do this asap? I really don't want to bake this in as uapi
which we then have to quirk and support forever. I'd say revert for -rc2
of these two and then maybe sort it out properly in -next.

Cheers, Daniel
> 
> 
> > Thanks, Daniel
> >
> > >
> > > Thanks,
> > > Vivek
> > >
> > > > On Sat, Nov 13, 2021 at 03:51:48PM +0100, Greg KH wrote:
> > > > > On Tue, Sep 21, 2021 at 04:20:23PM -0700, Gurchetan Singh wrote:
> > > > > > Similar to DRM_VMW_EVENT_FENCE_SIGNALED.  Sends a pollable event
> > > > > > to the DRM file descriptor when a fence on a specific ring is
> > > > > > signaled.
> > > > > >
> > > > > > One difference is the event is not exposed via the UAPI -- this is
> > > > > > because host responses are on a shared memory buffer of type
> > > > > > BLOB_MEM_GUEST [this is the common way to receive responses with
> > > > > > virtgpu].  As such, there is no context specific read(..)
> > > > > > implementation either -- just a poll(..) implementation.
> > > > > >
> > > > > > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > > > > > Acked-by: Nicholas Verne <nverne@chromium.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/virtio/virtgpu_drv.c   | 43
> > +++++++++++++++++++++++++-
> > > > > >  drivers/gpu/drm/virtio/virtgpu_drv.h   |  7 +++++
> > > > > >  drivers/gpu/drm/virtio/virtgpu_fence.c | 10 ++++++
> > > > > >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 34 ++++++++++++++++++++
> > > > > >  4 files changed, 93 insertions(+), 1 deletion(-)
> > > > >
> > > > > This commit seems to cause a crash in a virtual drm gpu driver for
> > > > > Android.  I have reverted this, and the next commit in the series
> > from
> > > > > Linus's tree and all is good again.
> > > > >
> > > > > Any ideas?
> > > >
> > > > Well no, but also this patch looks very questionable of hand-rolling
> > > > drm_poll. Yes you can do driver private events like
> > > > DRM_VMW_EVENT_FENCE_SIGNALED, that's fine. But you really should not
> > need
> > > > to hand-roll the poll callback. vmwgfx (which generally is a very old
> > > > driver which has lots of custom stuff, so not a great example) doesn't
> > do
> > > > that either.
> > > >
> > > > So that part should go no matter what I think.
> > > > -Daniel
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
