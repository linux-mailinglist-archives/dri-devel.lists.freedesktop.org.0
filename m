Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D531C389A
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 13:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52739893C9;
	Mon,  4 May 2020 11:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8644B893C9
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 11:51:23 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y3so1503043wrt.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 04:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NqCH+J5VslmlsECFL0dhGuGOQL1czxtjSZF7WSH6P+I=;
 b=gZ6WrRQgr3yrcCoP1ZMm/3f96Zxp5xvMWIy3tA6qmPbe8V3j0LvxeGjdEuBjh33oCQ
 sXFBQlBsZfqiski2KbCNCM2CgaHHNUfpBjoJwLGYSccnHvFI2hArPfXxCjXLZI/NRPMr
 s396NZpifP6OFynn7BJmWeBYu5ggCasvDDpzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NqCH+J5VslmlsECFL0dhGuGOQL1czxtjSZF7WSH6P+I=;
 b=Rnrdfno0Nagkz9p/00ZIRb7BYU/DYaGIggUdbCb3GKV2LddYJURUopKb++my2envaJ
 9rYyEvgtUNFIfVsIep5fNpi7UJLfA0R1LDQRbHPxRXhlNIVhmJx2tKPumFdHYXkc06AE
 KMtLYhU2ZxexmQff6FiWlwnRU6BKksPhYgvNXKp8GrqH+zxHxQjf1WVqtycMQMbB8nD6
 DL8NbnzCXIrV1Wg+4vVqGM1fvCD1e2z3qdCrm9Y9tbvbAAOFQNSeDvliLJzDIUlkqxl9
 Bu72tLpUeRPhcL/uhcRGr84KdcHZM9goGMtB6Amu06470I0q3MGvdP4KK2yf4CosAoNG
 8XEA==
X-Gm-Message-State: AGi0PubC0BaIqbdBfs7gtB/gn+M1N6Q/S2eJCYpkd8JJiefLD2litdi7
 HBKsZBmwztUb81sMwsnusx2fow==
X-Google-Smtp-Source: APiQypJhXBH1NfX7CMNRHLBnCXi38KKdDWV8lsoqowHiRrei3nuq5fjjXu12KqONptQ2YxbrKeq3+g==
X-Received: by 2002:adf:ead2:: with SMTP id o18mr17713337wrn.333.1588593082194; 
 Mon, 04 May 2020 04:51:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t2sm13201887wmt.15.2020.05.04.04.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 04:51:21 -0700 (PDT)
Date: Mon, 4 May 2020 13:51:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] drm: enable render nodes wherever buffer sharing is
 supported
Message-ID: <20200504115119.GI10381@phenom.ffwll.local>
References: <CAMn1gO4NsAoBUN4VFntB+pZK=cVCmwxBGUyipLPYYWFvpH1Z+A@mail.gmail.com>
 <20200427200513.36328-1-pcc@google.com>
 <CAKMK7uE42AUZbqn4VhVjWaeUaoyhm+k5ZWUXjB576+7bWHfs2A@mail.gmail.com>
 <CADaigPXx+iDd6Duqi+FqAsxLCP5EWhweNN8UwKBVOqYVaQD=8A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADaigPXx+iDd6Duqi+FqAsxLCP5EWhweNN8UwKBVOqYVaQD=8A@mail.gmail.com>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Peter Collingbourne <pcc@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 30, 2020 at 12:57:40PM -0700, Eric Anholt wrote:
> On Thu, Apr 30, 2020 at 3:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Apr 28, 2020 at 2:46 PM Peter Collingbourne <pcc@google.com> wrote:
> > >
> > > Render nodes are not just useful for devices supporting GPU hardware
> > > acceleration. Even on devices that only support dumb frame buffers,
> > > they are useful in situations where composition (using software
> > > rasterization) and KMS are done in different processes with buffer
> > > sharing being used to send frame buffers between them. This is the
> > > situation on Android, where surfaceflinger is the compositor and the
> > > composer HAL uses KMS to display the buffers. Thus it is beneficial
> > > to expose render nodes on all devices that support buffer sharing.
> > >
> > > Because all drivers that currently support render nodes also support
> > > buffer sharing, the DRIVER_RENDER flag is no longer necessary to mark
> > > devices as supporting render nodes, so remove it and just rely on
> > > the presence of a prime_handle_to_fd function pointer to determine
> > > whether buffer sharing is supported.
> >
> > The idea behind render nodes is that you can freely pass these to
> > unpriviledged users, and nothing bad happens. That's why we have gpu
> > reset code in drivers, proper pagetables, and also (in at least the
> > solid drivers) ban code so that repeat offenders from userspace who
> > constantly submit endless batch buffers and funny stuff like that
> > can't DOS the gpu.
> >
> > Ofc in practice there's hw issues and fun stuff like that sometimes,
> > and driver bugs, and all that. But that's the aspiration.
> >
> > Now many of these display-only drivers need contiguous buffers, and
> > there's not endless amounts of that around. So if you allow random
> > clients to allocate buffers, they can easily exhaust that, and not
> > just upset the render side of the gpu, but essentially make it
> > impossible for a compositor to allocate more framebuffers. I don't
> > think that's a good idea.
> >
> > I know there's hw like vc4 which needs contiguous buffers for
> > everything, but that's kinda the places where aspiration falls a bit
> > short.
> >
> > So from that pov I'm a rather worried with handing out render rights
> > to everyone for these display-only buffers. It's not entirely
> > harmless.
> 
> This doesn't feel like a contiguous-mem-specific concern to me.  We
> don't have resource limits on renderer GPU nodes today, you can
> allocate memory there to fill up and DOS the system, and unless
> something changed since last time I was looking, we don't even tell
> the OOM killer about our allocations so they can kill the right app!
> (my compositor always got picked, in my experience)
> 
> And, keep in mind what we're fixing at a system level here: the
> current workaround is you either get your compositor to hand you a GPU
> fd, at which point you can DOS the system, or you open the master node
> yourself and try to drop master before the compositor comes up, then
> DOS the system. "But there are access controls for the compositor or
> the card node!" you say: yes, but there are for render nodes too.  I
> know my distro doesn't default to open access to /dev/dri/render*

Hm indeed, I thought we've limited dumb buffer creation to master only on
the primary device.

But that kinda leaves me wondering, how do you allocate buffers on these
then? Exposing dumb on render nodes gets the Dave "it's not for rendering"
Airlie nack, at least for drivers which do have real userspace sitting on
the same drm driver. And exposing dumb only for these display-only devices
feels somewhat silly and inconsistent too.

So not sure.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
