Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AAA60462C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 15:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041F710F21B;
	Wed, 19 Oct 2022 13:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8B010F21D;
 Wed, 19 Oct 2022 13:00:16 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id h24so11222686qta.7;
 Wed, 19 Oct 2022 06:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3neje0k7T3cx7D7C9HLG6iO3ovR2451tT9bBWNpd1HI=;
 b=v80Wn6Fl7G0ii0UXFKtZH3OebcYpxPx91UX4kJee+tb+Z0/LQbP+KhdN3ToGlEH1Ij
 MG4QASeEXctidAznTTjMBASAfWI3zqWdDL2v4fy3Lw/6fLIpBAhCeCGaOnFqeZcXcEI4
 fCUzb0CiAh0UESOXZIwuPwgxewC0s1gXy0jf3LF6aYr5AqQxDpS4PFhBKpopdyTuCnf6
 gMGJImsRQQZ7PfieSzdYUdB/fJiZ2lrBa23gr/mfbD8RbNraF/pMEs5681lhD62JtOZZ
 fx/EhdwL64EMtMFjpx4hXbqrUaCS+BvRsDIu6Cxf0CtWGOTigO/3RSQ6KVZLc6ld56RF
 MmtA==
X-Gm-Message-State: ACrzQf3Pnx92RqqD6RzCBXWSD+3T1+RHs2i1YITQMjp9C3TewJq6LQcK
 BrHHYVMlUArAEvB7tBEHPyPknXkfREv2k+Tdzfg=
X-Google-Smtp-Source: AMsMyM5AXDZhR6X0SfzaRw+VO5tHTbxkxUczN5nB/2Y/zue0gU7uIAIrZQUDwIWkE8nim4szWBMx9SDfRMrdJB6x0YA=
X-Received: by 2002:a05:622a:620a:b0:35c:bf9e:8748 with SMTP id
 hj10-20020a05622a620a00b0035cbf9e8748mr6319785qtb.494.1666184414930; Wed, 19
 Oct 2022 06:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <12097002.O9o76ZdvQC@kreacher> <Y0+7Ug9Yh6J6uHVr@intel.com>
 <CAJZ5v0gKW9S29xS2+qkcopzYtZKTcM=ZT-Jjc4fnEJfu=oYKaw@mail.gmail.com>
 <Y0/sGveKPjuUWOhO@intel.com>
In-Reply-To: <Y0/sGveKPjuUWOhO@intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 19 Oct 2022 15:00:01 +0200
Message-ID: <CAJZ5v0gdcVSOPkfs0yzfubpU9EXu02n2u8Pau7sE=yrZ-mvDEQ@mail.gmail.com>
Subject: Re: [PATCH] ACPI: PCI: Fix device reference counting in
 acpi_get_pci_dev()
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>, intel-gfx@lists.freedesktop.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Linux ACPI <linux-acpi@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 2:22 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, Oct 19, 2022 at 01:35:26PM +0200, Rafael J. Wysocki wrote:
> > On Wed, Oct 19, 2022 at 11:02 AM Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Tue, Oct 18, 2022 at 07:34:03PM +0200, Rafael J. Wysocki wrote:
> > > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > >
> > > > Commit 63f534b8bad9 ("ACPI: PCI: Rework acpi_get_pci_dev()") failed
> > > > to reference count the device returned by acpi_get_pci_dev() as
> > > > expected by its callers which in some cases may cause device object=
s
> > > > to be dropped prematurely.
> > > >
> > > > Add the missing get_device() to acpi_get_pci_dev().
> > > >
> > > > Fixes: 63f534b8bad9 ("ACPI: PCI: Rework acpi_get_pci_dev()")
> > >
> > > FYI this (and the rtc-cmos regression discussed in
> > > https://lore.kernel.org/linux-acpi/5887691.lOV4Wx5bFT@kreacher/)
> > > took down the entire Intel gfx CI.
> >
> > Sorry for the disturbance.
> >
> > > I've applied both fixes into our fixup branch and things are looking =
much
> > > healthier now.
> >
> > Thanks for letting me know.
> >
> > I've just added the $subject patch to my linux-next branch as an
> > urgent fix and the other one has been applied to the RTC tree.
> >
> > > This one caused i915 selftests to eat a lot of POISON_FREE
> > > in the CI. While bisecting it locally I didn't have
> > > poisoning enabled so I got refcount_t undeflows instead.
> >
> > Unfortunately, making no mistakes is generally hard to offer.
> >
> > If catching things like this early is better, what about pulling my
> > bleeding-edge branch, where all of my changes are staged before going
> > into linux-next, into the CI?
>
> Pretty sure we don't have the resources to become the CI for
> everyone. So testing random trees is not really possible. And
> the alternative of pulling random trees into drm-tip is probably
> a not a popular idea either. We used to pull in the sound tree
> since it's pretty closely tied to graphics, but I think we
> stopped even that because it eneded up pulling the whole of
> -rc1 in at random points in time when we were't expecting it.

I see.

> Ideally each subsystem would have its own CI, or there should
> be some kernel wide thing. But I suppose the progress towards
> something like that is glacial.

Well, I definitely cannot afford a dedicated CI just for my tree and I
haven't got any useful information from KernlCI yet (even though hey
pull and test my linux-next branch on a regular basis).

KernelCI seems to be focusing on different set of hardware, so to speak.

> That said, we do test linux-next to some degree. And looks like
> at least one of these could have been caught a bit earlier through
> that. Unfortunately no one is really keeping an eye on that so
> things tend to slip through. Probably need to figure out something
> to make better use of that.

I think it could also be possible to contribute to KernelCI to get
more useful x86 coverage from it.
