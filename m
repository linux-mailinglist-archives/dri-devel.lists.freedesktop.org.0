Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EDD3DDB29
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 16:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3E66E101;
	Mon,  2 Aug 2021 14:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B703F6E101
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 14:36:03 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id w6so24330744oiv.11
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Aug 2021 07:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ewiNYFC4R6vaOeqwAbg1G8ZGOCBk1B80Ri6Fq7HzbOw=;
 b=CNAb154L8bzvjvJTlshRiVxdmGoWzOMTUQO89arqF0xH1w9LiSlouhNFkiokh/9sZm
 bgCrd86bc0Ew2ZoafCPKCd6TSxHL2cNidRweFA0LoOqYGZ6iOeovNhpqlEcF6oKM6uFD
 WZaCv6qjzg0Rah0G1JQGObRYTRCuf4hmOnrFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ewiNYFC4R6vaOeqwAbg1G8ZGOCBk1B80Ri6Fq7HzbOw=;
 b=H3cbrKYle/2C6ScehRucFnBnaK0BifoMp9HHYvc2ylrE6PtCmVAhOM8/HfvmC/0ojA
 MBfu91079iW0NLSfEDXhbvyNgs/dDqo0Ljl7BZTKgOLMQb1phkFtQuVLfwnnl55R6/2H
 jzz1sc8UrPgsG4S2QbIxnqEIu5XGLIpaRdZA0N1Iw6736kozofY28hbohxKvivpiJciz
 J9KnmpSYhmPEy916e6q/1qURmGfGUdWp07STrIhDJZfBwKRU77n+m0ajylODOBu7Teb0
 26Q8H13mIL+ViqyZ3c5UTn71chILAOXchuUodJbNCCedv8Ax6ooD/NGrdgD+3CdNFgbc
 aH/w==
X-Gm-Message-State: AOAM532Ijv27kOQ2hz3XzVmGtThSG/LnP/8YpExyh82dgk72ByesT8le
 5W96kM/wMPoslR/zZyPRqaKiUg8p4tEilIZhU9JIJA==
X-Google-Smtp-Source: ABdhPJypF/i1LZMsJ6g4u333rfRKnQFkElBmSNC3/Ta5iP8wNo322qsz1V+yxU3p7cTQH9oO/XMRj86rr7xejZx7zpk=
X-Received: by 2002:aca:d682:: with SMTP id
 n124mr10959484oig.128.1627914961577; 
 Mon, 02 Aug 2021 07:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <YQPTo0D5SZfX44dn@phenom.ffwll.local>
 <20210730133850.bbje7uxvrvsmuopt@sirius.home.kraxel.org>
 <YQe2RfK0wCY6Q2y/@phenom.ffwll.local>
 <20210802125056.pdcfle4aziyjh32r@sirius.home.kraxel.org>
In-Reply-To: <20210802125056.pdcfle4aziyjh32r@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 2 Aug 2021 16:35:50 +0200
Message-ID: <CAKMK7uFOV3JiwpYyNAdz9FekxY77usNKhjYMxc4YFTx5Of8DRQ@mail.gmail.com>
Subject: Re: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Pekka Paalanen <ppaalanen@gmail.com>, Simon Ser <contact@emersion.fr>, 
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, 
 Tina Zhang <tina.zhang@intel.com>, Dongwon Kim <dongwon.kim@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 2, 2021 at 2:51 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > That sounds sensible to me.  Fence the virtio commands, make sure (on
> > > the host side) the command completes only when the work is actually done
> > > not only submitted.  Has recently been added to qemu for RESOURCE_FLUSH
> > > (aka frontbuffer rendering) and doing the same for SET_SCANOUT (aka
> > > pageflipping), then send vblank events to userspace on command
> > > completion certainly makes sense.
> >
> > Hm how does this all work? At least drm/virtio uses
> > drm_atomic_helper_dirtyfb, so both DIRTYFB ioctl and atomic flips all end
> > up in the same driver path for everything. Or do you just combine the
> > resource_flush with the flip as needed and let the host side figure it all
> > out? From a quick read of virtgpu_plane.c that seems to be the case ...
>
> virtio_gpu_primary_plane_update() will send RESOURCE_FLUSH only for
> DIRTYFB and both SET_SCANOUT + RESOURCE_FLUSH for page-flip, and I
> think for the page-flip case the host (aka qemu) doesn't get the
> "wait until old framebuffer is not in use any more" right yet.

Hm reading the code I think you simply elide the set_scanout if it's
still the same buffer. There's no difference betweeen dirtyfb and an
atomic commit that just hands the damage rects to the driver. At least
if you use the helpers.

> So we'll need a host-side fix for that and a guest-side fix to switch
> from a blocking wait on the fence to vblank events.
>
> > Also to make this work we don't just need the fence, we need the timestamp
> > (in a clock domain the guest can correct for ofc) of the host side kms
> > driver flip completion. If you just have the fence then the jitter from
> > going through all the layers will most likely make it unusable.
>
> Well, there are no timestamps in the virtio-gpu protocol ...
>
> Also I'm not sure they would be that helpful, any timing is *much* less
> predictable in a virtual machine, especially in case the host machine is
> loaded.

Hm yeah if the output is currently not displaying, then the timestamp
is very fake. But if you display you should be able to pass it all
around in both direction. So target vblank (or whatever it's called)
would go from guest to host to host-compositor (over wayland protocol)
to host-side kms, and the timestamp could travel all the way back.

But yeah making this all work correctly is going to be a pile of work.
Also I have no idea how well compositors take it when a kms driver
switches between high-precision timestamps and frame scheduling to the
entirely virtual/vblank-less approach on the fly.
-Daniel

> take care,
>   Gerd
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
