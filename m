Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FECC2B9B74
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 20:31:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC146E7D5;
	Thu, 19 Nov 2020 19:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73E56E7D5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 19:31:11 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id s18so6473273oih.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 11:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VnUnBLRPh+6KOgsVaVSlMxBUVENcDlNHlfUAamOWyVQ=;
 b=JIE0QSNiLBhDCLezLunn56QRB5IidrCVZtSHsB4lfUW15+THBkvZyPppz1WbiaJssq
 TeddFqEIDnA7OilML4xnfn14G2PfmhPEqx7YRPe5zWBEXttxdmKW3cZHbu303FUjCpCd
 2pVwDK/etPxKZEOVkjufs0xR3Lm3YfVP9tU+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VnUnBLRPh+6KOgsVaVSlMxBUVENcDlNHlfUAamOWyVQ=;
 b=D2bZ07KqR2bbgWP+9u8AH20wQVgAsm1Z4cLOXC0nxN5XjD+fXCNmlXSPyT4kGGysVN
 O72xFsQRd88HWqtbSFoHsv2hGy2aGbTLI2do0KsRLor4qm+6zLt2Y+4hwjWxOUY6UmCK
 EYppKI52CneWwShXbjcDmJcfKb6HaGwbc26570rBDJuvoyIbok7Zrouwl60onaGzar1G
 PMJJCYZHPKW/BbfGOUrYK4Baafm7E/EgCczti3K5BYGDfMmc7TDOQcAmHwpNxVjOtG7R
 7il7V/vw9XTACOMBBZ2vHWn6cnmEcmHF1pbHf9yTQQOG3HS+IYx3ote/WKHszcPWS4ZD
 HDlg==
X-Gm-Message-State: AOAM533vH+7bq0KMamyhhztjrwYnHYRy4qwhFQ2p07XlTm1Dhlf6WPX5
 YMpi6tnbEhFP6joiP3KzpbwM3LXov/z66YsAZ0L/Lw==
X-Google-Smtp-Source: ABdhPJxR66U3HHVUVsW0jDMUVfv+WrhszwYCxe9b2pT4WyH8ks3voMgRrmYxcQP6s4KqX99BDGzqP7GVP3hKfjI+HFk=
X-Received: by 2002:aca:1713:: with SMTP id j19mr3669832oii.101.1605814270903; 
 Thu, 19 Nov 2020 11:31:10 -0800 (PST)
MIME-Version: 1.0
References: <20201027135153.324873-1-hdegoede@redhat.com>
 <f6b034c3-ef86-7214-f65e-af93b78bd456@redhat.com>
 <20201119175131.GI18329@kadam>
In-Reply-To: <20201119175131.GI18329@kadam>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 19 Nov 2020 20:30:59 +0100
Message-ID: <CAKMK7uGB5-aDSyA42PVs7_86NEfinftvKWx6AKsLFjoUS-1VGw@mail.gmail.com>
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

On Thu, Nov 19, 2020 at 6:51 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Thu, Nov 19, 2020 at 12:35:56PM +0100, Hans de Goede wrote:
> > Hi,
> >
> > On 10/27/20 2:51 PM, Hans de Goede wrote:
> > > Add missing pci_iounmap() calls to properly unmap the memory on
> > > probe-failure and remove.
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >
> > For some reason the spam-filter used by Red Hat's email system has eaten
> > Daniel Vetter's reply to this, so let me copy and paste that from patchwork:
> >
> > Daniel Vetter wrote:
> >
> > > I think switching over to devm would be really nice. And for pci all
> > > you need to do is use pcim_enable_device and delete all the cleanup
> > > code, and it's all done. Hand rolling device cleanup code really isn't
> > > a great idea and way too error-prone. Plus you're using lots of devm_
> > > already.
> >
> > Good point, so I just checked and the vboxvideo code is already
> > using pcim_enable_device() so it looks like this is a false-positive
> > from the lkp@intel.com bot, and Dan Carpenter missed that pcim_enable_device()
> > makes all subsequent pci-resource acquiring calls behave like devm calls,
> > when he forwarded the report to me.
> >
> > Tl;DR: there is no bug / leak and this patch can be dropped.
> >
> > Is there a place where I can report a bug against the lkp@intel.com bot
> > for this false-positive ?
>
> Ah.  Thanks!
>
> This is a Smatch bug.  There is a list for that smatch@vger.kernel.org
> but I already remove the pci_iomap() from the list of functions that
> needs to be unwound based on your report.

I guess if smatch sees a pci_enable_device but not pcim_enable_device
on the same device as passed to pci_iomap (and a pile of other pci
functions) then it still must be unwound. Could smatch detect that?
There's a lot of pci drivers not using the managed functions, catching
bugs in these would be good.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
