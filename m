Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 656A219C479
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 16:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE4689CBE;
	Thu,  2 Apr 2020 14:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A50489CBE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 14:40:46 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id f52so3607969otf.8
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Apr 2020 07:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BG47UuPMzN0qc/poZJDagG63wPSmOzCVtY45CDsvy30=;
 b=Nf62b6PhVEYmk/NCsVMnjtFzq+xz8dNjQ72BYiiRGS/1lHzDi5uKAcuVuX0dt8JHln
 1GDN2K8ibreBDe9f0Hwk1gmFMtUaAZ1lTjJBddRLNIyL6AUlSo1ZTrQpqYEaSThIntor
 AldZhGdxebPs4G1cfeCRDQASKXtXUXuqUU4Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BG47UuPMzN0qc/poZJDagG63wPSmOzCVtY45CDsvy30=;
 b=Dvn7BGJMj4Dkkv0DqlAmZHbN5mpNyglkYy8QwrkPJdk9t/6/fADi3NZRFb68/xIQMa
 nYA/Sz73dRULPoYlF1w02G847B1QMcwM/QvY7Tm1jdpdgTLWlVAv36p00fywg5JyfnSZ
 gy801VtCx6ZwC3Lgz6geAbH1QI0znhen9+Vits7gwchp6frztezNlz0765HuquNAoTzL
 s0Kj8wBcsLD/sUF4P4momzagNcf17v21RnhimD57JnBIT1qR8UO0O54XZC8pbA5GILSv
 Pp7FsN0gCNhjz7aWrSVgEnllbiwN6hO94itDFs1UWoP9tFmTa/sBO4XYAqvcSoUV2Hmh
 dWew==
X-Gm-Message-State: AGi0PuZkb2HhyvzpJLmsy5h+8MTo/sVOq3iNgA3zLyzUGfiW+5KxPhst
 CdP2bCHFn5XsY4wvvAxPBgDPL3QzIOUKU1elkiLogQ==
X-Google-Smtp-Source: APiQypKkRyPfdK1Va/wcfhaoqVaEEfvHMp5QYbj4ONw+xIMieG52mVQ4uFY0qNyZRVAmEIwoK8Ir5s4o2kOJuMwMTo8=
X-Received: by 2002:a9d:6e8f:: with SMTP id a15mr2770818otr.188.1585838445607; 
 Thu, 02 Apr 2020 07:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
 <20200402113925.2zvatduiyqld7pj2@wunner.de>
 <20200402154934.04917382@eldfell.localdomain>
 <CAKMK7uGusoE+GQOefMTB_tax-Tj5PymMMOrWPMJ6XczdrdFb3g@mail.gmail.com>
 <20200402143117.qabod72gn3p6yft3@wunner.de>
In-Reply-To: <20200402143117.qabod72gn3p6yft3@wunner.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 2 Apr 2020 16:40:34 +0200
Message-ID: <CAKMK7uHVh=Kra_T0niHQZcHLgfJY+WuqNmq68dVkczfChwqBHQ@mail.gmail.com>
Subject: Re: How to handle disconnection of eDP panels due to dynamic display
 mux switches
To: Lukas Wunner <lukas@wunner.de>
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
Cc: Daniel Dadap <ddadap@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 2, 2020 at 4:31 PM Lukas Wunner <lukas@wunner.de> wrote:
>
> On Thu, Apr 02, 2020 at 03:13:26PM +0200, Daniel Vetter wrote:
> > On Thu, Apr 2, 2020 at 2:58 PM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > > On Thu, 2 Apr 2020 13:39:25 +0200 Lukas Wunner <lukas@wunner.de> wrote:
> > > > Note that vga_switcheroo is currently controlled via debugfs.
> > > > That is a historic artefact.  The kernel has since gained a
> > > > mux subsystem in drivers/mux/ which could be used to represent
> > > > the display mux in a standardized way in regular sysfs.
> > >
> > > if mux control was in sysfs, then how would userspace figure out
> > > which mux state refers to which DRM device and its connector?
> > >
> > > Maybe some DRM connector property referring to the mux and its state?
> > >
> > > How would a display server running as a regular user gain access to
> > > sysfs to control the mux?
> >
> > I think a sysfs interface for vgaswitcheroo would need some kind of
> > links from drm_device (and for the outpu-only mux from drm_connector
> > sysfs files) to the corresponding sysfs directory for the
> > vgaswitcheroo switch.
>
> Yes, that would be one way to do it.
>
>
> > But actual change of state needs to indeed be done through some other
> > interface, since sysfs interfaces suck for compositors. We have this
> > problem already with backlight, and the solution there is a special
> > backlight frobbing services which compositors can call through udev,
> > and fun stuff like that. Definitely not an uapi pattern we want to
> > repeat. So I think sysfs would be only for information links, and
> > maybe the global switch for the old optimus designs where you can only
> > switch the entire gpu, and need to delay the switch until all existing
> > clients are closed. Aka 1) stop compositor 2) write to sysfs 3) start
> > new compositor on new gpu. For that case compositors don't need to
> > ever write to sysfs themselves, so I think that's ok. Also only
> > relevant for rather old hw.
>
> There's an in-kernel interface in <linux/mux/consumer.h> which
> could be invoked from, say, an ioctl(), to control or query the
> mux.
>
> I'm not really prepared to answer detailed questions how it should
> be done, my point is just that the existing building blocks (such
> as the mux subsystem) should be used instead of reinventing the
> wheel.  If the mux subsystem lacks specific features needed for
> graphics muxes, I think adding them won't face much opposition
> from Peter Rosin.

I guess if someone is bored they could port the internal vgaswitcheroo
mux drivers over to that mux subsystem. But we'll still need some
amount of graphics specific glue, and that seems perfectly reasonable
to have in vgaswitcheroo.c. That stuff isn't about a mux, but the
hand-off between the involved gpu (and audio) drivers, to me it
doesn't make sense to push all these kind of interactions into a
generic mux subsystem.

That also applies to the extensions discussed here to better handle
per-output muxing between drivers (like the self refresh trick for
seamless muxing). That's all graphics, and in practice already
possible with the hw vgaswitcheroo supports today (apple does that
already in macos). No change on the mux driver side needed at all I
think.

so tldr I guess if you want add a todo entry to look into porting
vgaswitcheroo drivers to the mux framework. But imo that would be
orthogonal to what we're discussing here.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
