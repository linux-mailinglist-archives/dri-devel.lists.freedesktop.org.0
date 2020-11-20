Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECF62BA656
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 10:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B4C6E89C;
	Fri, 20 Nov 2020 09:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618A56E89C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 09:39:57 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id m13so9750446oih.8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 01:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O7A9m4UOAE5FICdU2ANJbhenr+8nCPhrxVxvSgFz6Io=;
 b=IKwmVf9iiEjTqHCgDP6hreKHgukUv7b1jflM6HGNKQDu4kTvJlvVuk3tiX64Ftp/G2
 0XZgMIvJBj3uekLlFPR7uK2zKICKwPJ72j12AzRFxo3ZkiDYDB4mM2Lpe14rSkvxpx+Z
 OmoGX6nmJnAXvrmwqaDzr3CysvWr+5IgwyDrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O7A9m4UOAE5FICdU2ANJbhenr+8nCPhrxVxvSgFz6Io=;
 b=daZ6kY49y7YWQBp/zlRh0f11AHYNcehQacqsFpN6xlmyX7H79GVv/14t70oXP752wV
 UNvsAeBROVb8fTlaCajN39P15SI07ljzCqvKpwlggOG23yfU5uFZHAxJ6Ou5b62dP39N
 Tdk5fBdlJJzu1gsqww9osj+mYiaDnhBSKRuocLI/G2vrNKK8J4FIiBsYjp5tHe0WJWyP
 8nnu4G6ReMLRwg5skHhIP87NWZHbfBkWOBJdcN2dALR2qyeKytiPcdHhmhzX/BYm4sNb
 V3gFJ2zjfuIwY+xePoVSp9k6WVrh+bn6bgWSbEYDDDTWMO1pyGT3aIimwZRDMFPWqUNk
 ap7A==
X-Gm-Message-State: AOAM531uGKMCer2UkoE3lI57I2JQoO6hdsjMucC6SvGRYviFoHDgETBI
 3B2LUqE88mDiybXxlgy/SbGszFHxXuwAyLE2N0vPww==
X-Google-Smtp-Source: ABdhPJz5wE6OSzQR/D31KRMjun6WEXuEux894/dJqT8Cx68TU2sIYvyG1mr3xio7aLeX2isxBhZwcxvp0fNgfdMVo8I=
X-Received: by 2002:aca:1713:: with SMTP id j19mr5418067oii.101.1605865196704; 
 Fri, 20 Nov 2020 01:39:56 -0800 (PST)
MIME-Version: 1.0
References: <20201027135153.324873-1-hdegoede@redhat.com>
 <f6b034c3-ef86-7214-f65e-af93b78bd456@redhat.com>
 <20201119175131.GI18329@kadam>
 <CAKMK7uGB5-aDSyA42PVs7_86NEfinftvKWx6AKsLFjoUS-1VGw@mail.gmail.com>
 <20201120075811.GJ18329@kadam>
In-Reply-To: <20201120075811.GJ18329@kadam>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 20 Nov 2020 10:39:45 +0100
Message-ID: <CAKMK7uHdAipPHEwyPPop+bny4Qm6hX=6cG1+0jG2y1NfsUi8JQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vboxvideo: Unmap iomem on probe-failure and remove
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 8:58 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Thu, Nov 19, 2020 at 08:30:59PM +0100, Daniel Vetter wrote:
> > On Thu, Nov 19, 2020 at 6:51 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > On Thu, Nov 19, 2020 at 12:35:56PM +0100, Hans de Goede wrote:
> > > > Hi,
> > > >
> > > > On 10/27/20 2:51 PM, Hans de Goede wrote:
> > > > > Add missing pci_iounmap() calls to properly unmap the memory on
> > > > > probe-failure and remove.
> > > > >
> > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > >
> > > > For some reason the spam-filter used by Red Hat's email system has eaten
> > > > Daniel Vetter's reply to this, so let me copy and paste that from patchwork:
> > > >
> > > > Daniel Vetter wrote:
> > > >
> > > > > I think switching over to devm would be really nice. And for pci all
> > > > > you need to do is use pcim_enable_device and delete all the cleanup
> > > > > code, and it's all done. Hand rolling device cleanup code really isn't
> > > > > a great idea and way too error-prone. Plus you're using lots of devm_
> > > > > already.
> > > >
> > > > Good point, so I just checked and the vboxvideo code is already
> > > > using pcim_enable_device() so it looks like this is a false-positive
> > > > from the lkp@intel.com bot, and Dan Carpenter missed that pcim_enable_device()
> > > > makes all subsequent pci-resource acquiring calls behave like devm calls,
> > > > when he forwarded the report to me.
> > > >
> > > > Tl;DR: there is no bug / leak and this patch can be dropped.
> > > >
> > > > Is there a place where I can report a bug against the lkp@intel.com bot
> > > > for this false-positive ?
> > >
> > > Ah.  Thanks!
> > >
> > > This is a Smatch bug.  There is a list for that smatch@vger.kernel.org
> > > but I already remove the pci_iomap() from the list of functions that
> > > needs to be unwound based on your report.
> >
> > I guess if smatch sees a pci_enable_device but not pcim_enable_device
> > on the same device as passed to pci_iomap (and a pile of other pci
> > functions) then it still must be unwound. Could smatch detect that?
> > There's a lot of pci drivers not using the managed functions, catching
> > bugs in these would be good.
>
> It's a lot of code.  There would be two ways to implement this:
>
> 1) Somehow store the links to figure out the value of:
>
>          devres_find(vbox->ddev.pdev.dev)->enabled
>
> That's very complicated.  I'm sort of working on some of the steps
> involved but and it's probably a multi year process before it's
> possible.
>
> 2) Create a data base table with driver data, then store if the driver
> calls pcim_enable_device().  This is still a bit of work, but probably
> straight forward.  Storing driver data would be useful for other things
> as well.

Hm maybe I totally misunderstand how smatch works, but I thought you
can track additional invariants and stuff on various pointers. So I
figured you just track whether pci_enable_device has been called on a
struct pci_device *dev, and then if anyone calls pci_iomap on the same
pointer and there's no cleanup, it's a bug. For any other case you
just can't tell (since absence of pcim_enable_device might just mean
that smatch doesn't see through the maze). Or is that what you meant
with approach 2?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
